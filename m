Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC63884B8DF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D025610EEA0;
	Tue,  6 Feb 2024 15:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1524Kvzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6EB10EEA0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:09:40 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d0b750518bso19166151fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707232179; x=1707836979;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WwVsqoGAIzE5l9Xu7dUQGRgCnLWg+E4gxnq7lDMjVy0=;
 b=1524KvzfapuK/oyZsiRivCbJ5vvkmM/2w/kOjYU4409GeVaSpSHQhqTvxw7BK1031Z
 ObCgdrMdsfARpWk8CPvwGt7lhb+nOp/FtfY6BWrIDK5jsTRinm1/fk4J4JlRxbCyG0sa
 V3akbCpdIeEr1zBphTUh0+loLFjSA5LqDVSSEAck95HiziQ7e+9rI9vTxR034/weZ9dR
 WyTtV47BjBLn81cwIgBaSAOb+igEDLXX6chKAUAL8JX42dju7aZeTxDNqthHsvzdwPT6
 0d0cpohU4dM6ZP3O8IYi0diWm6S+jNDSsQ9dlRe7jtalKRy74YdoP1C586DmpivmnbhM
 OZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707232179; x=1707836979;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WwVsqoGAIzE5l9Xu7dUQGRgCnLWg+E4gxnq7lDMjVy0=;
 b=hoPvkXfLtcUb/4B2os+QGsiie8KH+Gy9hOAGfE+94LWqIn30zpf65Hg3goa13YOspa
 vHuryLU7h4NYHeW5M7mxYGyN+7z9ObbtBDfLj2TD5jNjeBbN/r1JNrsjyp1NIzccUTBn
 28p93474KIa/XiYi/EAWb7hkRpM7KF242D9MIAC3Th3rbGe3SESQAQnyzDUkYxEvTiSy
 QojPYaJao2Q16wuRlHTo5+wYP8yIIMzNuLT4og11IdEX8ot3thgz8zw3SABDVAmad+rt
 YISB5pUzsNzo9I/QECOhXg+kTVzZCkgR0gst6B8rqBQtO7QGaXRHKP4prUFrHg42lRtR
 Q6Sg==
X-Gm-Message-State: AOJu0YzEPjQIsKRdsB1uXpb/B3cHk4xri2bOs4p2ubS1mvKnNHHRmG0n
 ssgMYLoADSqEAKMJtF0JASHxn0gK6bWX3R7LZsl5+uaOpxXTkCzzpex+c47M1XY=
X-Google-Smtp-Source: AGHT+IHIK03nqgzi0UIQjD/r5eQ2ej+6ZZNo5AQO8975rLcfk1byiQAQT6jFYjw/zsDV+iNnbg9VtQ==
X-Received: by 2002:ac2:5147:0:b0:511:3bd4:6a97 with SMTP id
 q7-20020ac25147000000b005113bd46a97mr2159245lfd.7.1707232178665; 
 Tue, 06 Feb 2024 07:09:38 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVGkNAqTncHn8u9NySFFtDQqD8pscjT/JrKzey5HdYBYNb9Vz4cfuYJr7DavYYjySH0mR6+iOdinYPmM90PzTNIRnozIZN09rANAAbPujFAAY77eZBTuNuh80moOl4xO1aEGGxkyrKIEMMkZbFVyfaXr7OR1pn8OMlHfFW5voh4+4ayQFTuW/ADqVzBD4GFghg/qcCiL2gi/kUGqBklehKOZ/R0xTI5FrR8HuNeBPimYzIU5g8d/5hDTmzeiq89/xIGjYKgh6YadASA8qRf00j4DMprLo64d/4xKv5aE+Dq4INDxNnV4o2jO0kucyFKF46JqsNL7flwfzbEvNHqKstOIlemSLSTf6ClwPVh/JZX2A4VOdYuacC0kjNiGhd2aoIH1RPcw2oej+1wkclZL4mdFWY44actr5ic6g==
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a170906048e00b00a378377030csm1252795eja.41.2024.02.06.07.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 07:09:38 -0800 (PST)
Message-ID: <f5942f06-c4c5-4b5f-bcfb-10b7976d38be@baylibre.com>
Date: Tue, 6 Feb 2024 16:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] drm/mediatek: dsi: Use bitfield macros where useful
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> Instead of open coding bitshifting for various register fields,
> use the bitfield macro FIELD_PREP(): this allows to enhance the
> human readability, decrease likeliness of mistakes (and register
> field overflowing) and also to simplify the code.
> The latter is especially seen in mtk_dsi_rxtx_control(), where
> it was possible to change a switch to a short for loop and to
> also remove the need to check for maximum DSI lanes == 4 thanks
> to the FIELD_PREP macro masking the value.
> 
> While at it, also add the missing DA_HS_SYNC bitmask, used in
> mtk_dsi_phy_timconfig().

-- 
Regards,
Alexandre
