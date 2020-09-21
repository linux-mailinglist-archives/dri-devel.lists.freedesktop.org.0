Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29D4272B83
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A4B89650;
	Mon, 21 Sep 2020 16:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C26489650
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:16:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z4so13423941wrr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VlG26JqU7FwBeORSXeuhuiFQeJWA8DcS5yfbqqgjFoI=;
 b=LzbH1QjW77tl2JRTNZN+3mCCa1VJDaXInHVdXNXHD/lXhEsyT30taOJQpj4pCMB9ia
 /B4raLutHcC8Y/FBNWleD/TkOIxoZGIseZ8hjvBudXz4F1zyyt0k9qqJuUZE1SN7A3vF
 DS2/5+vcFMWwXrwwuh2/mgywxnFUPMDNlhOHz0VDb+SGI0VQDR4MuTHCWkj2TAq9wmY0
 toPY6uCGKQkVYvzWCvLM6bHwJEkVO9Lk1TX7bu+gT9cFszv/srm0bvpReMgynk1e7ujn
 jZUceJnx5S4D4BpjVE2ImgfCS0uSS8DUmtm6mzMrxh4vitjcBWScXtxRybZ1XBWn5PZw
 rNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VlG26JqU7FwBeORSXeuhuiFQeJWA8DcS5yfbqqgjFoI=;
 b=Le/4AYcZsuiSsDLkiU3KXdTytxBo5L70x33+KxzATfFC93WROs8sKISdZ9gQsIwSqo
 eWSXAMT5pkCKceFRWe1t4LE+3AryFlwmeuh9mxAyVuV41I3QrvoZGgtBtR5bkwN/Qc/O
 PdssdZ7tQsgUqoTXYuUKdvz0cZSOz+Atib3AG57OuqqS1IrgSNC8aICu5D5QXEvESkEQ
 b4J5MjrsfVqvRJRBLkq/vWcTZByMqbfUpZkAlrMXAymQaVhlacQQI/gxoPUIAANyHeTR
 syRPa6ZtQkVntQtZRPRYn7YN8p70I0WLY1BZIUli/C6dY2jgBUUr56fPbEajO7d7HW+z
 +sEQ==
X-Gm-Message-State: AOAM531BKytiKhgeUoceEkmCoDAQW9aNbKjD1xP8lDBLJW3+pm9fTaZe
 g75UsFnxXz8Vqcs/InLEmXc=
X-Google-Smtp-Source: ABdhPJyNwvoduPPv6j+uBwraRDRsICqaWW6gD6+FGnI81kjd5ZWwWFDuh/xvlGa6UijBkTDICaAixA==
X-Received: by 2002:adf:aa84:: with SMTP id h4mr559557wrc.426.1600704977232;
 Mon, 21 Sep 2020 09:16:17 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id a5sm21218422wrp.37.2020.09.21.09.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:16:16 -0700 (PDT)
Subject: Re: [PATCH v3 5/9] soc: mediatek: cmdq: add write_s value function
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-6-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <db10d46a-18fb-345f-17a2-b847fb8d0bac@gmail.com>
Date: Mon, 21 Sep 2020 18:16:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-6-git-send-email-dennis-yc.hsieh@mediatek.com>
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
> add write_s function in cmdq helper functions which
> writes a constant value to address with large dma
> access support.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c |   14 ++++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  |   13 +++++++++++++
>   2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index ed9f5e63c195..4e86b65815fc 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -280,6 +280,20 @@ int cmdq_pkt_write_s_mask(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_s_mask);
>   
> +int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> +			   u16 addr_low, u32 value)
> +{
> +	struct cmdq_instruction inst = {};
> +
> +	inst.op = CMDQ_CODE_WRITE_S;
> +	inst.sop = high_addr_reg_idx;
> +	inst.offset = addr_low;
> +	inst.value = value;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_write_s_value);
> +
>   int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index cd7ec714344e..ae73e10da274 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -152,6 +152,19 @@ int cmdq_pkt_write_s_mask(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>   			  u16 addr_low, u16 src_reg_idx, u32 mask);
>   
>   /**
> + * cmdq_pkt_write_s_value() - append write_s command to the CMDQ packet which
> + *			      write value to a physical address
> + * @pkt:	the CMDQ packet
> + * @high_addr_reg_idx:	internal register ID which contains high address of pa
> + * @addr_low:	low address of pa
> + * @value:	the specified target value
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> +			   u16 addr_low, u32 value);
> +
> +/**
>    * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
>    * @pkt:	the CMDQ packet
>    * @event:	the desired event type to "wait and CLEAR"
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
