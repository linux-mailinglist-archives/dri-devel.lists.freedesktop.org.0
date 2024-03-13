Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BB487AC94
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E269710F119;
	Wed, 13 Mar 2024 17:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SjNbdNil";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63C710F0C1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:11:54 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4132a5b38fbso694595e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 10:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710349913; x=1710954713;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DfCyEn4BBkDtIZTeeb4WXSUMa8UuweDcHmhz18/rnUY=;
 b=SjNbdNilYyLTvwWlEcYgUDHqt+TZ/Pc03UI5nAMY8xCfB8tCSA38B4xujEY637vqQ4
 iuEfqT/1oi2Wib1d6edF7+H/HVyS3qNS9eu4E/3XUvo5sjZKyGXNfGZro2KZgYRpIoUm
 U7om+S5PYlrVZGrv2YAx+1bpHuLWah/MO9vsK03dgBhNxchpANwfSasEtozCqgn7KivI
 qUVg2RRQnPTilzH4C+BYiMpCS9aFLdKFYZTxZCsFzsbBwViKAzLuALJWN4k4XkybY6mi
 2O/Nu9p8OGS0W24+1iN35rabaq2i0PpvsKmx1SQfMitnNZDahzZkF0zjYdt+rJUpY5T2
 1ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710349913; x=1710954713;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DfCyEn4BBkDtIZTeeb4WXSUMa8UuweDcHmhz18/rnUY=;
 b=ib8auA0v7+hIX+3G1MI3xNfGYkNU/jli3WzeI4Ukjq2hCtwf2WdZZvKpKlPsHl2u/t
 qdlDkAljpb4WdSmSyrs/+TBxmCqO/EG2qCwrOHXsxf5HNb0saXVjVE1ozFNk0Ank2Yp0
 ZPbfHJWCcR8xLhM72vX8Sb3J5/gabzz3NeSB8uv7+yiqw+QjdwPTj09e0ZN16A1Rts3e
 gxt6Xo8Ef+3Fmpq6PqWhy/gMcAPItlgzj+2qCer61Dk4ZbS0JkwkWvtkLvkEqAEG3xHy
 eoRtbCMY9T7dZcdLNxVlD1+8TSYkDC2lr3ml1wNiK8rl70xHvbn8EUyneFFSkonpDPDS
 4Rgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUedvCtuqArbipIfQHwmAZcMkPYYCrVGoG2XpDo8X1vT24g31bApBWoBbHpWk0QUwH8sUE68VwrpN6nxc+35qEQbZuLKjs7u24nU3pPSnOO
X-Gm-Message-State: AOJu0YwDdpCvDXp49FpAd/CxvwU5H6ii+Ncdar3SlQNBQzBw70x5Ty5k
 J4N1CXbvPl8CWmtAcdsJ4Vc9EkhRDme73TCR1CZiZrtowg6FpUIzDdXLzYpJTqw=
X-Google-Smtp-Source: AGHT+IFz1KXw55V676KHOL/rzoBQjJ9Rihc/CWALu4Z7kIN17vZX/My8C/6xcsm62UiChBonG2y1pw==
X-Received: by 2002:a05:600c:450c:b0:413:1285:6e40 with SMTP id
 t12-20020a05600c450c00b0041312856e40mr442329wmo.20.1710349912671; 
 Wed, 13 Mar 2024 10:11:52 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 ay23-20020a05600c1e1700b00412ff941abasm2920026wmb.21.2024.03.13.10.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 10:11:52 -0700 (PDT)
Message-ID: <ef4da1f6-d3c5-4484-8df5-1a04df4453a0@baylibre.com>
Date: Wed, 13 Mar 2024 18:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
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



On 26/02/2024 17:09, Mark Brown wrote:
>> index 000000000000..13e95c227114
>> --- /dev/null
>> +++ b/sound/soc/codecs/mt6357.c
>> @@ -0,0 +1,1805 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MT6357 ALSA SoC audio codec driver
>> + *
> Please use a C++ comment for the whole comment to make it clearer that
> this is intentional.

If I do that, the checkpatch raise a warning:

WARNING: Improper SPDX comment style for 
'sound/soc/mediatek/mt8365/mt8365-afe-clk.c', please use '//' instead
#22: FILE: sound/soc/mediatek/mt8365/mt8365-afe-clk.c:1:
+/* SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#22: FILE: sound/soc/mediatek/mt8365/mt8365-afe-clk.c:1:
+/* SPDX-License-Identifier: GPL-2.0

even if I put:
/* SPDX-License-Identifier: GPL-2.0 */

IMO, the checkpatch tool should be fixed/update first.

-- 
Regards,
Alexandre
