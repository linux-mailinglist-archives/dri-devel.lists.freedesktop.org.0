Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BE8272B71
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C41889293;
	Mon, 21 Sep 2020 16:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E06E89293
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:15:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j2so13418875wrx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/AzBFVjyB9M35TCkoVfiCJG5gVr+4aRpJymg5fjIeRo=;
 b=adyOI1QZVXu5/sDgfgrREwI18axbJUHVHZf+au8Ry+GgFshgEUioSEsGC71GCW9dLu
 sWNaG1NpaQrUsWUB4sGHhwVmKL3P60CCEkoVjK/l2A7jy710+V3t/Laq6l8VfbzwIda8
 TgroX58KWlScsvkuEsrT5Au63ICALvxtgLZaMMEUdHN2JAn6DY+dqA5zYLjnL8+/GaYS
 MNPWa7t6XUo6ss8lFgjElJQHC0N4GIeYkg12BKamF3SSN9RyltBM1+k6fRWWB05YQYMa
 Q0xJXMPuFBgKqSBNcVs2VSc/LvvXFSvtInzTh/3uRwxGaHgJnsQgedNh1QwfGomN7znL
 g9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/AzBFVjyB9M35TCkoVfiCJG5gVr+4aRpJymg5fjIeRo=;
 b=J6gDfBJFYGPyMJDlALn5Wn0vmtNzDz8eFytxxbCJt7+cZYSBKH2o/2U2ad3iGPm3Tn
 VEv8JA0iBEQfg7qVmDlwWMQbCxSUEljd5MsDQ2QL6DrZOO9+nXYWYy97xoGGBTyK4cBO
 a+cmveC+Lb6Xc0nh6b8d4en51OtcJnnSRuDx+70MopcBTU6sz+FmeU5A1dP57worIyl5
 /CSXDusDBRJiWtesTkNfSXtevPNNSkrZxdfuUF/lnUX9pZmG7lk5V9NaLlNoi2Tv/ts0
 xsQIw/U/0UlBotFslOE0E7nZvH4U4qwYNwgLF5OzHuAGoCUEaXGUVRnaFLdT/xCrdT2W
 jifQ==
X-Gm-Message-State: AOAM530zoUcPG0Z8+nq/gPujiMYTyCXwyqK8FX1yV9WdiPNrIhNWPc0r
 ZMOzkpcYrTUJxSYd/62VJ+g=
X-Google-Smtp-Source: ABdhPJzVnGb+f+wfWSeWuA70pTjkhGJd856/BU9GbrNasUolNL1dWGqI0h48k/ZLL1ZWGjM/efha4g==
X-Received: by 2002:adf:eecb:: with SMTP id a11mr547226wrp.356.1600704931276; 
 Mon, 21 Sep 2020 09:15:31 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id o4sm20760014wru.55.2020.09.21.09.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:15:30 -0700 (PDT)
Subject: Re: [PATCH v3 2/9] soc: mediatek: cmdq: add write_s function
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-3-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1fa46c55-2bc9-ad73-bb65-91825fcd4b9e@gmail.com>
Date: Mon, 21 Sep 2020 18:15:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-3-git-send-email-dennis-yc.hsieh@mediatek.com>
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
> writes value contains in internal register to address
> with large dma access support.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c   |   19 +++++++++++++++++++
>   include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
>   include/linux/soc/mediatek/mtk-cmdq.h    |   19 +++++++++++++++++++
>   3 files changed, 39 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 9faf78fbed3a..880349b3f16c 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -18,6 +18,10 @@ struct cmdq_instruction {
>   	union {
>   		u32 value;
>   		u32 mask;
> +		struct {
> +			u16 arg_c;
> +			u16 src_reg;
> +		};
>   	};
>   	union {
>   		u16 offset;
> @@ -223,6 +227,21 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_mask);
>   
> +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> +		     u16 addr_low, u16 src_reg_idx)
> +{
> +	struct cmdq_instruction inst = {};
> +
> +	inst.op = CMDQ_CODE_WRITE_S;
> +	inst.src_t = CMDQ_REG_TYPE;
> +	inst.sop = high_addr_reg_idx;
> +	inst.offset = addr_low;
> +	inst.src_reg = src_reg_idx;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_write_s);
> +
>   int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 05eea1aef5aa..1f76cfedb16d 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -60,6 +60,7 @@ enum cmdq_code {
>   	CMDQ_CODE_JUMP = 0x10,
>   	CMDQ_CODE_WFE = 0x20,
>   	CMDQ_CODE_EOC = 0x40,
> +	CMDQ_CODE_WRITE_S = 0x90,
>   	CMDQ_CODE_LOGIC = 0xa0,
>   };
>   
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 2249ecaf77e4..9b0c57a0063d 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -12,6 +12,8 @@
>   #include <linux/timer.h>
>   
>   #define CMDQ_NO_TIMEOUT		0xffffffffu
> +#define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
> +#define CMDQ_ADDR_LOW(addr)	((u16)(addr) | BIT(1))
>   
>   struct cmdq_pkt;
>   
> @@ -103,6 +105,23 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>   			u16 offset, u32 value, u32 mask);
>   
>   /**
> + * cmdq_pkt_write_s() - append write_s command to the CMDQ packet
> + * @pkt:	the CMDQ packet
> + * @high_addr_reg_idx:	internal register ID which contains high address of pa
> + * @addr_low:	low address of pa
> + * @src_reg_idx:	the CMDQ internal register ID which cache source value
> + *
> + * Return: 0 for success; else the error code is returned
> + *
> + * Support write value to physical address without subsys. Use CMDQ_ADDR_HIGH()
> + * to get high address and call cmdq_pkt_assign() to assign value into internal
> + * reg. Also use CMDQ_ADDR_LOW() to get low address for addr_low parameter when
> + * call to this function.
> + */
> +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> +		     u16 addr_low, u16 src_reg_idx);
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
