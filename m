Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD084272B82
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD2189F45;
	Mon, 21 Sep 2020 16:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9C389F45
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:16:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a17so13404261wrn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XFpxcM6XUPIah7zzLKeBoWdYZ+ocbEsyrrWoWDds4JU=;
 b=fLkui3TXyRWE/tfTme+aWiB/zCdNLRk3btahb1DrnPLN1jVP/RbrlKeBCYrm6t2Mee
 /LqdXtErXrriFo++qL3BihhUXCl69gd0mKrcn1hCdAfaGIIXau+UPr2E75afwYSVcZtC
 0mkRuUCB6cXWokP/sYZpXFaSQrlHZs4nPTGUgsO1hr3wkEcgLjAkswtK4rTeaZCh5TtZ
 t47cKM+04wJi86WDd3310dChRrLfvVeaMOuVfCRmLiyD+jtUdPyjEEz1O21mIMw/hLcx
 QdQXAP7Bey03iWKs2vi5/UnIltpGK1zW449254TmBZF0efZbGNu6ZvACVyOgjpoEjuuP
 Ot5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XFpxcM6XUPIah7zzLKeBoWdYZ+ocbEsyrrWoWDds4JU=;
 b=MnpqtRCs5AgltNIqj/msheDfLNPBcImNZrRv+4xFeBS6qE166umdQClRAkbpOxiQfx
 dqse1dgFnGsBRjTrGXUDDbjEC5po5jNVOi2nxALROJ2FvAP57Q2aWq7hI1wxwF9/ZccV
 mmEyXJoswXekCUiltF0TscJWRzpDKy+vW11AJW2o5rlBC73t6EJs6w1+M7zYoQutri3V
 ILZ95hV44UTqoCpal+4TnlrCnmb0TYKEzPKbQZ2HuAAC1bBlsvk5C/Eb9ck3KftzIMbL
 hTLUjZlSyy2m/+4PEfmjXAAuWjpviipZTiC1GT4dthg/DUfE4XMqU3tB8exUoDwMkJPR
 zTqQ==
X-Gm-Message-State: AOAM532cPqQ18PHVBULgwggIrNjPmHcJK6LfUq/iEjBCTJetYB1hfZLG
 3al/NBBqunuApI/PfRcC0MI=
X-Google-Smtp-Source: ABdhPJxlKA2A2s9DM+LuR07uxc2hXxduS8/5sPYYupoj0yeuPukqpex99x7SyNRtFXbgj4U//+/+uw==
X-Received: by 2002:adf:81e6:: with SMTP id 93mr534258wra.412.1600704963655;
 Mon, 21 Sep 2020 09:16:03 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id t17sm22013545wrx.82.2020.09.21.09.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:16:03 -0700 (PDT)
Subject: Re: [PATCH v3 4/9] soc: mediatek: cmdq: add read_s function
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-5-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <89ff84a9-dd22-536b-7a41-8a802df97868@gmail.com>
Date: Mon, 21 Sep 2020 18:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-5-git-send-email-dennis-yc.hsieh@mediatek.com>
Content-Language: en-US
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/07/2020 17:45, Dennis YC Hsieh wrote:
> Add read_s function in cmdq helper functions which support read value from
> register or dma physical address into gce internal register.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c   |   15 +++++++++++++++
>   include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
>   include/linux/soc/mediatek/mtk-cmdq.h    |   12 ++++++++++++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 550e9e7e3ff2..ed9f5e63c195 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -227,6 +227,21 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_mask);
>   
> +int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
> +		    u16 reg_idx)
> +{
> +	struct cmdq_instruction inst = {};
> +
> +	inst.op = CMDQ_CODE_READ_S;
> +	inst.dst_t = CMDQ_REG_TYPE;
> +	inst.sop = high_addr_reg_idx;
> +	inst.reg_dst = reg_idx;
> +	inst.src_reg = addr_low;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_read_s);
> +
>   int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>   		     u16 addr_low, u16 src_reg_idx)
>   {
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 90d1d8e64412..efbd8a9eb2d1 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -60,6 +60,7 @@ enum cmdq_code {
>   	CMDQ_CODE_JUMP = 0x10,
>   	CMDQ_CODE_WFE = 0x20,
>   	CMDQ_CODE_EOC = 0x40,
> +	CMDQ_CODE_READ_S = 0x80,
>   	CMDQ_CODE_WRITE_S = 0x90,
>   	CMDQ_CODE_WRITE_S_MASK = 0x91,
>   	CMDQ_CODE_LOGIC = 0xa0,
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 53230341bf94..cd7ec714344e 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -104,6 +104,18 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index,
>   int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>   			u16 offset, u32 value, u32 mask);
>   
> +/*
> + * cmdq_pkt_read_s() - append read_s command to the CMDQ packet
> + * @pkt:	the CMDQ packet
> + * @high_addr_reg_idx:	internal register ID which contains high address of pa
> + * @addr_low:	low address of pa
> + * @reg_idx:	the CMDQ internal register ID to cache read data
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
> +		    u16 reg_idx);
> +
>   /**
>    * cmdq_pkt_write_s() - append write_s command to the CMDQ packet
>    * @pkt:	the CMDQ packet
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
