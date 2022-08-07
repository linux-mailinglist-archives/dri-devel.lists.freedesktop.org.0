Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9D958BB96
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 17:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FF41136F8;
	Sun,  7 Aug 2022 15:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A4710F304
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Aug 2022 15:31:21 +0000 (UTC)
Date: Sun, 07 Aug 2022 15:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1659886279; x=1660145479;
 bh=YHlXS1js2a8lbYFdeBlkI7exi/3zmStUxGjeZdRforw=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=T52PhAI9tffZwaFkL5rQPfkf5ZKVzDLfVkbq2M+fh2xQLVX89r1mlhPgq9qDexrMk
 zyPoATlrq50HNVfQ4/sSYXpA4Sg0kq0XPpsCmSW5Poo1tSqxc1AK7Eo1Sqbotp1xH9
 o0yDM7gOXq05wwTsiCztwlPifRp3v3EuFSUpTJrQ=
To: Robin Reckmann <robin.reckmann@googlemail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
Message-ID: <653e93e7-6bdc-3498-7719-f3a7860dd245@connolly.tech>
In-Reply-To: <20220807140455.409417-1-robin.reckmann@gmail.com>
References: <20220807140455.409417-1-robin.reckmann@gmail.com>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, Robin Reckmann <robin.reckmann@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/08/2022 15:04, Robin Reckmann wrote:
> Fix i2c transfers using GPI DMA mode for all message types that do not se=
t
> the I2C_M_DMA_SAFE flag (e.g. SMBus "read byte").
>
> In this case a bounce buffer is returned by i2c_get_dma_safe_msg_buf(),
> and it has to synced back to the message after the transfer is done.
>
> Add missing assignment of dma buffer in geni_i2c_gpi().
>
> Set xferred in i2c_put_dma_safe_msg_buf() to true in case of no error to
> ensure the sync-back of this dma buffer to the message.
Thanks for sending this, it fixes GPI DMA on the PocoPhone F1 and Pixel 3!
>
> Signed-off-by: Robin Reckmann <robin.reckmann@gmail.com>Reviewed-by: Cale=
b Connolly <caleb@connolly.tech>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 6ac402ea58fb..d3541e94794e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -484,12 +484,12 @@ static void geni_i2c_gpi_unmap(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
>   {
>   =09if (tx_buf) {
>   =09=09dma_unmap_single(gi2c->se.dev->parent, tx_addr, msg->len, DMA_TO_=
DEVICE);
> -=09=09i2c_put_dma_safe_msg_buf(tx_buf, msg, false);
> +=09=09i2c_put_dma_safe_msg_buf(tx_buf, msg, !gi2c->err);
>   =09}
>
>   =09if (rx_buf) {
>   =09=09dma_unmap_single(gi2c->se.dev->parent, rx_addr, msg->len, DMA_FRO=
M_DEVICE);
> -=09=09i2c_put_dma_safe_msg_buf(rx_buf, msg, false);
> +=09=09i2c_put_dma_safe_msg_buf(rx_buf, msg, !gi2c->err);
>   =09}
>   }
>
> @@ -553,6 +553,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, st=
ruct i2c_msg *msg,
>   =09desc->callback_param =3D gi2c;
>
>   =09dmaengine_submit(desc);
> +=09*buf =3D dma_buf;
>   =09*dma_addr_p =3D addr;
>
>   =09return 0;
> --
> 2.25.1
>

--
Kind Regards,
Caleb

