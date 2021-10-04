Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CF3421ACF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 01:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26886EABC;
	Mon,  4 Oct 2021 23:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637246EABC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:41:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F0F461381
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633390914;
 bh=WnectnZlCpcN61u4P637Y4VP+/XeYfu9evNmOwRjGE8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PedMieptOH3QAu5hrQRBKb2vz5y9jLhG0XoC4awDbq5B2EUhQnt+Xr54GzaMAXzvC
 BB5MLnDCBBjRq5C1+RG9OM1CuGM6AiRxLsJC2yfvxq1A1COlDf7YJ6s/nTC1Sjv3Ul
 jKBcydao/10vr1Ubv+vKMcgqObFE74d00M0AJoiAxAw2toVHbFNy52CHC+wTCQbWP0
 2TsG//vFGyem/A1+MY/CuhtK9JJMvic+C6dN88k0JvBGz3qt7DutxVBiOkK8doUolU
 jpcv7Fb5mwQnFNv18BRgtpfXCFRmeXyVM2iPzJJmZJ6r/+TfKhfojpAf+fp8b8Aaul
 4CBT38HD2VlzA==
Received: by mail-ed1-f52.google.com with SMTP id p11so18312869edy.10
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 16:41:54 -0700 (PDT)
X-Gm-Message-State: AOAM531JL93iue7IyN0IU+Az2unf/I4VYBgYnf6quMSVUg8QFQEvpnXZ
 WxrFPxygmpb9PS3CA+ygnh0fQRluUH+uJ1rMnA==
X-Google-Smtp-Source: ABdhPJytlz/j7z7RIkYICVtGXnlO4ZRu804S/63zkgVzKSKfZfB7OF+ECsWzuO7+wkBDJPSdAg9zzWDwhLAyYGrsbyY=
X-Received: by 2002:a50:bf0f:: with SMTP id f15mr21400916edk.43.1633390912636; 
 Mon, 04 Oct 2021 16:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210930131850.21202-1-yongqiang.niu@mediatek.com>
 <20210930131850.21202-2-yongqiang.niu@mediatek.com>
In-Reply-To: <20210930131850.21202-2-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 5 Oct 2021 07:41:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_82OaLAz0o6BUcogQ=xgYTsFJSov=J72UzMwwq3YtkPdg@mail.gmail.com>
Message-ID: <CAAOTY_82OaLAz0o6BUcogQ=xgYTsFJSov=J72UzMwwq3YtkPdg@mail.gmail.com>
Subject: Re: [PATCH v2,
 1/1] mailbox: cmdq: add instruction time-out interrupt support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=
=8830=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:18=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> add time-out cycle setting to make sure time-out interrupt irq
> will happened when instruction time-out for wait and poll
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index 64175a893312..197b03222f94 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -36,6 +36,7 @@
>  #define CMDQ_THR_END_ADDR              0x24
>  #define CMDQ_THR_WAIT_TOKEN            0x30
>  #define CMDQ_THR_PRIORITY              0x40
> +#define CMDQ_THR_INSTN_TIMEOUT_CYCLES  0x50
>
>  #define GCE_GCTL_VALUE                 0x48
>
> @@ -54,6 +55,15 @@
>  #define CMDQ_JUMP_BY_OFFSET            0x10000000
>  #define CMDQ_JUMP_BY_PA                        0x10000001
>
> +/*
> + * instruction time-out
> + * cycles to issue instruction time-out interrupt for wait and poll inst=
ructions
> + * GCE axi_clock 156MHz
> + * 1 cycle =3D 6.41ns
> + * instruction time out 2^22*2*6.41ns =3D 53ms

For different clients, the timeout value would be different, and each
client could use timer to detect timeout, so it's not necessary to
enable timeout in cmdq driver.

Regards,
Chun-Kuang.

> + */
> +#define CMDQ_INSTN_TIMEOUT_CYCLES      22
> +
>  struct cmdq_thread {
>         struct mbox_chan        *chan;
>         void __iomem            *base;
> @@ -376,6 +386,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan=
, void *data)
>                 writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift=
_pa,
>                        thread->base + CMDQ_THR_END_ADDR);
>
> +               writel(CMDQ_INSTN_TIMEOUT_CYCLES, thread->base + CMDQ_THR=
_INSTN_TIMEOUT_CYCLES);
>                 writel(thread->priority, thread->base + CMDQ_THR_PRIORITY=
);
>                 writel(CMDQ_THR_IRQ_EN, thread->base + CMDQ_THR_IRQ_ENABL=
E);
>                 writel(CMDQ_THR_ENABLED, thread->base + CMDQ_THR_ENABLE_T=
ASK);
> --
> 2.25.1
>
