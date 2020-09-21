Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4072B272B6F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0916E4DD;
	Mon, 21 Sep 2020 16:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8CD6E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:15:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k18so63961wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rSiDIY+mBJXBx7mTEaoU7iUTrz5OuKwc6R4EdUzPFxQ=;
 b=FOlph9vPpLg7Qs+DqdBZs6dhzlOsW8G8sPt/Z6iDZR/iwWMXUgsTrrH3+DFfed2ptg
 MC5qh32BgeRFrVp9mhJlRPwwUz7WgpXOanAvIdJ7j/SILhqQsIbmU8sHwMztmh/TFMdP
 xBGQ5NvApAIYmRg/3VRdJLA+dFtDyyyN5bv/Ohx/txkS1JGzzV0eE+yVJ5M0GWYhFnnQ
 r0uxV5VwalBiNRhOL0MCCmDu3zGmuN0mOVTanH2+goKU9Mt8o8W+TFrCj4BNEYufNQJv
 h7E/bGoHIqh6xxr1XJrrR60bNcSqOS8bQiENjSFd7WAESx7ehqia4nVncKDqlxbOG0XZ
 BQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rSiDIY+mBJXBx7mTEaoU7iUTrz5OuKwc6R4EdUzPFxQ=;
 b=MrPqvGF/AJmDQFlnPuds78ClxlHPqJNWC16quas5cA7iF+ZiXdZnSc+/3bK3dIdDaO
 TicTuxcFWGZpckXbTuVXm9UE/RUNsVqkixqlb/oJuBecIssIu/ACeOljDMxqzxopR8aJ
 Zz3rmDHvK1i4usD4ZZ7behp0Tst55Qw7RlwuPj0zjm19nNVikE5IGqGZeTFUB80ETWef
 +CTibXZeLaF3k65dNo1cZuE2+bQl77H5D20UeK17xkhNpm9KPvjZaMOaMp+fkSv0pPUo
 AO8tr7qFi1hHbD3VT/3ObKLpF5iXXarIjsVsnd4UyvA4SEJBmywM5de7wyilH6QKh5WL
 V8ew==
X-Gm-Message-State: AOAM531DigOrYknNoUAJwMeAct3Z3y14eh97Txs4HjesELWFMcCX6HJW
 eZVuAb5MnzTxW5CpPdzqx38=
X-Google-Smtp-Source: ABdhPJyObcKg6ezQrEsMRRb/qsn7AmBo/RdJ+Ov0IeCGrXN1B6RC1FB4M7qxxPKQXjkiuh0Debuv3w==
X-Received: by 2002:a1c:e256:: with SMTP id z83mr134592wmg.33.1600704920224;
 Mon, 21 Sep 2020 09:15:20 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id i26sm115868wmb.17.2020.09.21.09.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:15:19 -0700 (PDT)
Subject: Re: [PATCH v3 1/9] soc: mediatek: cmdq: add address shift in jump
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-2-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ddfff699-0ff7-4c15-4449-d6229c046142@gmail.com>
Date: Mon, 21 Sep 2020 18:15:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-2-git-send-email-dennis-yc.hsieh@mediatek.com>
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
> Add address shift when compose jump instruction
> to compatible with 35bit format.
> 
> Change since v1:
> - Rename cmdq_mbox_shift() to cmdq_get_shift_pa().
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index dc644cfb6419..9faf78fbed3a 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -329,7 +329,8 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   
>   	/* JUMP to end */
>   	inst.op = CMDQ_CODE_JUMP;
> -	inst.value = CMDQ_JUMP_PASS;
> +	inst.value = CMDQ_JUMP_PASS >>
> +		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
>   	err = cmdq_pkt_append_command(pkt, inst);
>   
>   	return err;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
