Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6BA996FE1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 17:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03BA10E776;
	Wed,  9 Oct 2024 15:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="glOFvLCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0141E10E776
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 15:41:46 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-3e4d649cbc8so170508b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728488506; x=1729093306;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Gd0Hd1MakjxQ8aCm1xPSRU0H3xeGSc63YXhhZpX4cc=;
 b=glOFvLCdC4UqNdJQTw2w0GpY4HPHjiwNVYHYtw3SggG8omEbnsPnJygG7qB/MUFHKP
 ipr4E8L6P1pzfz6hZ3XEOOJApVdrowG9mo8Znlb1X6kpw2d7B9qbe5jpJBFqPvhjUdbc
 1ki/XecWt3s5Ce9bUVgqJx8rXr9wsSBKCAaAU8z2W2W+hvrG+h0RaGhyqoA/rJS1/Ukg
 tlqKdeADw+kthrqc+w7hXS+6T0b3KsLX5rJu2+YZrt8xvk/UBA+odN1blBW5gmO+92Cp
 z7jz45FqYT75ti9WSEGKaS93FpVHZ7mHYt64YReO++aeGrs1Jqd7kKyxaAFkpNBXKuXN
 aLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728488506; x=1729093306;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Gd0Hd1MakjxQ8aCm1xPSRU0H3xeGSc63YXhhZpX4cc=;
 b=ba/40rWm/OZ0QUVEMUHFa7LVxA0KvJweZgIAPhbBqmYcvvXPcQe2wGH6XxRZcu5hcO
 Hj8VoOcbgmf940cSLGbGrH/d91+G13JqQ5fTh9uG0hh33DFUaG2zRH+yQPaoBFcRJbTU
 dXZzjfmnfeDgSRzezkPIsF90NaHdZLkrQcz03wg3IYegwrLLqTS9c88VkqZY/+jm4HQc
 MnCfvAskCisun0JrnkJFmIdzTWlrHohkZRUtwN5Xbew2pvyURh9BbHg9lUZH1CoeP0jd
 8pyHY3Xq5gk/Nh6g1lnlw5UIL/PR7WNulXW6UjDMW4VVdSFvZrP7AvRx2047yn57fZC/
 MMEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1kV0QVlAL1yZujI5mYqTe9JE6P69pCWMNTvbvB7CpnfKwWCUiJg+c0BtPkNG0rt6Yy3fcdvl7p0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxDDsw9ZnwGbZLyt5eJRFzQlWUB0EpmaQZTwv6cL4Ayp2isoEJ
 3rQV+WnZ1VLj6veVoYwgtl4rLvPH1jdf38iDxm2tLF9L7TYRl8B7I+OApZHgD1MZEOa8mPWRTA+
 pMhlnBQLlMGrq+n9jWCpMsNxGtp7/BT38BG6XMA==
X-Google-Smtp-Source: AGHT+IGSAbf5K8peyNanI54kI2R8bIyKMUOuELhCM3eQhZJMBHU1uq8bm5qKHyh5KBHiKy63ie1sfKPMxntzRYNSqt4=
X-Received: by 2002:a05:6871:7505:b0:288:2b44:5577 with SMTP id
 586e51a60fabf-28834458deemr1908641fac.18.1728488506041; Wed, 09 Oct 2024
 08:41:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Oct 2024 08:41:45 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.8.7
References: <20240927153305.27642-1-liankun.yang@mediatek.com>
In-Reply-To: <20240927153305.27642-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Date: Wed, 9 Oct 2024 08:41:45 -0700
Message-ID: <CABnWg9uGR1yn9EsRaMjihksL76dwUv9vEi9eF=OCpzLfTvyYLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Fix potential KP on 0 bytes nvmem
 cell read
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 rex-bc.chen@mediatek.com, msp@baylibre.com, ck.hu@mediatek.com, 
 jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 27 Sep 2024 11:03, Liankun Yang <liankun.yang@mediatek.com> wrote:
>If the len is 0, kernel crash will occur when performing operations.
>Add the len check conditions to prevent kernel crash.
>
>Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
>Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
>---
>Changes in V2:
>- Fix the commit title.
>- Remove blank line between the Fixes and Signe-off-by.
>- Modify the judgment writing method.
>Per suggestion from the previous thread:
>https://patchwork.kernel.org/project/linux-mediatek/patch/20240925084116.28848-1-liankun.yang@mediatek.com/
>---
> drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>index d8796a904eca..9ecdf62398ee 100644
>--- a/drivers/gpu/drm/mediatek/mtk_dp.c
>+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>@@ -1082,7 +1082,7 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
> 	buf = (u32 *)nvmem_cell_read(cell, &len);
> 	nvmem_cell_put(cell);
>
>-	if (IS_ERR(buf) || ((len / sizeof(u32)) != 4)) {
>+	if (IS_ERR(buf) || !len || ((len / sizeof(u32)) != 4)) {
> 		dev_warn(dev, "Failed to read nvmem_cell_read\n");

Hello Liankun,
Would you be able to describe the crash with more details?

I'm afraid I don't understand the fix?

if len is 0, dividing 0 by sizeof(u32) is 0 and thus != 4
So to me, checking for len != 0 is redundant?

Thx,
Guillaume.
>
> 		if (!IS_ERR(buf))
>--
>2.45.2
