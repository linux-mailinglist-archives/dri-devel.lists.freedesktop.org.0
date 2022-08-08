Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D606258C399
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 09:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD44D14BC19;
	Mon,  8 Aug 2022 07:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C7114BC19
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 07:00:03 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id uj29so14988357ejc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 00:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fairphone.com; s=fair;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc;
 bh=2/N6mFP+TYpvLhr23ybFH/UP8B6EWzbXHA/jkbBuIoc=;
 b=lkU29Ua428YWYVoXEMmDC0UaKbp+MGrvym2etqoPjNHVD2NL3tW0LF47PkXL04Ez3I
 vvDnB0EtThz40r8LCfeh+Mi4sLOX5jf8l3WCEzdsZk29I34a9O4PwXXIdG1oZTobtiTS
 Pr8yAIQcboCA7RWA0WoPC/lm1iMyf/gbxHMWKW/BfGmB15dsR2/tcpYYVI1egrVLe5QD
 n4sJi1Cd7mLiUIbqcvP7KLtQx9ydpy1/5chSsTH6oupCLjJMhZSlmioLlr6BVSn6QEkW
 RVhYK9yeeUKGculzGgFZU/b7kaWseSpXzQZagr+e3yArPV0ouWvwmyQdyF8oANNnxi7k
 zzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc; bh=2/N6mFP+TYpvLhr23ybFH/UP8B6EWzbXHA/jkbBuIoc=;
 b=BII9hZumtjNqVXn7FuUUHbM7WP3JYAGl4x/sMedGNHzbJmS99EagsChXVWE9ZE97JD
 RoZ+QC2wMurGWPv2Kf1wnTGxU2YctrfXUYOkyIXfGLaUW/1w/ztYcwVzLwWr4y65ncTm
 FcCIamp8kY9TPGXb4WXsTmtaxZYBtoBLPyJ/Cc80vCiORhScv8XQvBhaRXv/5+kLiam3
 FpWIM7OMz+BOC2qTWPa4B6IFHsB6T6N1e6uynVaqMb1p/gCLUaJi6Ey6XSlcO0OGgHDG
 PibcM8D/m8aIET3KBEKOIJyCJFHlJNAuHLgbGPnajysLOBZ8y9Lu/w0m+36ZaQ8oIdbB
 M5lA==
X-Gm-Message-State: ACgBeo2P1MLphp4urtJDGOq7e/7YJj+3dHw6CHHZ6enGvoALqx1Msh1h
 YdJ6Fn1zFEiCGPCYqE+2pseu1A==
X-Google-Smtp-Source: AA6agR6hGuVY0jLoIpyBwpB68Ep5URWwiz9kxZGjZ1bEwFDjjVx2YCyxBdkT2y7+2dYKFcVRfMWxGg==
X-Received: by 2002:a17:907:2721:b0:731:2aeb:7940 with SMTP id
 d1-20020a170907272100b007312aeb7940mr6385812ejl.448.1659942001700; 
 Mon, 08 Aug 2022 00:00:01 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 zk19-20020a17090733d300b0072aadbd48c7sm4512240ejb.84.2022.08.08.00.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 00:00:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Aug 2022 08:59:59 +0200
Message-Id: <CM0GBVEZHLBT.1V54N4FCEN7V6@otso>
Subject: Re: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Robin Reckmann" <robin.reckmann@googlemail.com>, "Andy Gross"
 <agross@kernel.org>, "Bjorn Andersson" <bjorn.andersson@linaro.org>,
 "Konrad Dybcio" <konrad.dybcio@somainline.org>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
X-Mailer: aerc 0.11.0
References: <20220807140455.409417-1-robin.reckmann@gmail.com>
In-Reply-To: <20220807140455.409417-1-robin.reckmann@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, Robin Reckmann <robin.reckmann@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On Sun Aug 7, 2022 at 4:04 PM CEST, Robin Reckmann wrote:
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
>
> Signed-off-by: Robin Reckmann <robin.reckmann@gmail.com>

This makes I2C with GPI DMA work on sm6350/sm7725 fairphone-fp4!
Thanks for fixing this!

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 6ac402ea58fb..d3541e94794e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -484,12 +484,12 @@ static void geni_i2c_gpi_unmap(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
>  {
>  	if (tx_buf) {
>  		dma_unmap_single(gi2c->se.dev->parent, tx_addr, msg->len, DMA_TO_DEVIC=
E);
> -		i2c_put_dma_safe_msg_buf(tx_buf, msg, false);
> +		i2c_put_dma_safe_msg_buf(tx_buf, msg, !gi2c->err);
>  	}
> =20
>  	if (rx_buf) {
>  		dma_unmap_single(gi2c->se.dev->parent, rx_addr, msg->len, DMA_FROM_DEV=
ICE);
> -		i2c_put_dma_safe_msg_buf(rx_buf, msg, false);
> +		i2c_put_dma_safe_msg_buf(rx_buf, msg, !gi2c->err);
>  	}
>  }
> =20
> @@ -553,6 +553,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, st=
ruct i2c_msg *msg,
>  	desc->callback_param =3D gi2c;
> =20
>  	dmaengine_submit(desc);
> +	*buf =3D dma_buf;
>  	*dma_addr_p =3D addr;
> =20
>  	return 0;
> --=20
> 2.25.1

