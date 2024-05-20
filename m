Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447FA8C9FBC
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 17:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119B488647;
	Mon, 20 May 2024 15:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VqxTKSb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9856B88647
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 15:33:59 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-34e0d8b737eso1426868f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716219238; x=1716824038;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a5fhRvRNdkY76LZ7BQ6I+6ho5RPNKmpKNx7+rIS4bQg=;
 b=VqxTKSb6FMk9KK+J1fpwyKDCqCvbwzXMaGdNQppZ2BKE63baIWmWeeZ/GKE1DjoEyJ
 bLvK+D0BeMPUYUWTHGd3ZWAxeZHV9T2l1XgtNAotnGSRb0VBGvom1y3OkXTjX9LfZAmR
 TBNKJpvZ16nXx6nbvnm4xqRyU2/8hb+topyJ7TFrSxyGrTwGXVpb7BcBz6wkbmGUhcLG
 AgNGsBShiFPYoQLZXZ24q0qtqx7oMEJ3L1sVnNt5wY9RjRxlBO+ZWQMRPmqhn8K5KveH
 NF9LPRwwZ4LSA6f12O34IGZyg7ivNt6tc1vI/CiMbq1qFZcLVCdLJ9polAf7dpB/65ct
 cI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716219238; x=1716824038;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a5fhRvRNdkY76LZ7BQ6I+6ho5RPNKmpKNx7+rIS4bQg=;
 b=K66LdTXXyCNuFJPACThvNjtdQSQrmH4myhRrjA3JeUa9CH5wqSlcNK240qXBeeZqCt
 52zlW8qR7EAflTRrTLxHn7p7Z6BQBpTsP5GfRgM6hoZN5LAm7o1FLS8KHq7y3TsPeuE3
 js0WfX2/zqNZ8sw+S6vJgTz2NgZyRpiktEnqFOMOj4egIhVCE1lI322rm2z7wxGVbLqr
 wk5lvDqOVZrahXNUqknvCg50r6zBrxrRLyF5NJNhNuf1F07cZ/C59O5lpoVO90ESoB6x
 LvOxju5QBGD/N1miPCsjwCyKLRTQ1GaE6K2Gx+WGSl/i6+fGMhMVsAHsrzpmTvE7PdMG
 Earg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQH/1voRvR+4PR97VqlynLp6UYQSPxsl4ch4ye58/LMiUkNp/1+HLX8lYBqEMi9EJtwEVM4AP7QFnGscw8WeB4QBKY5TNg1u4v9oQ8y6C0
X-Gm-Message-State: AOJu0YytpKJpe2hbCpEaQlwtsr6Dz0kODyTMED10polym+7zpo+MqYxx
 tWjpjuNDn7OXlJSLgs+8MTxXapEoATntfoW2Pfrrzm9iKLBreoV/HPeIr4H/y0I=
X-Google-Smtp-Source: AGHT+IEtcFamuSVknEh6ha0edbY5+ZLvvrbIWav+4DvwqNfed2/74eqCifL094D8HWPsho7WfwN9cg==
X-Received: by 2002:a5d:4852:0:b0:33e:6ef3:b68e with SMTP id
 ffacd0b85a97d-354b8e4ee8dmr5666430f8f.34.1716219237520; 
 Mon, 20 May 2024 08:33:57 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad04dsm29474972f8f.81.2024.05.20.08.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 08:33:57 -0700 (PDT)
Message-ID: <9e2cf6c9-d74a-49f3-bc3f-cdbe83e01015@baylibre.com>
Date: Mon, 20 May 2024 17:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
 <ce1de395-3f60-4f7f-9424-bf036134de94@baylibre.com>
 <7dbe08cf-47a1-4da6-9035-6b0932cf8426@collabora.com>
 <67f13b3c-18b2-4042-9908-b4d41c24cdb0@baylibre.com>
 <df152312-a8ab-40d8-a361-fe5100e11dd9@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <df152312-a8ab-40d8-a361-fe5100e11dd9@collabora.com>
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



On 20/05/2024 13:55, AngeloGioacchino Del Regno wrote:
> Il 20/05/24 13:49, Alexandre Mergnat ha scritto:
>>
>>
>> On 20/05/2024 12:53, AngeloGioacchino Del Regno wrote:
>>>> So, I don't know how you want to manage multiple display, but IMHO there are 2 ways:
>>>> - removing the current "oneOf".
>>>
>>> ...eh I think this should be anyOf instead :-)
>>>
>>> I'll check later and send a v5.
>>
>> "anyOf" behavior works as expected on my side, dt-validate pass ;)
>>
> 
> Hey, thanks for the test, buys me some important time.

You're welcome, after that:

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
