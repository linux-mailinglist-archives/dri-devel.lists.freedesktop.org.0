Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09078C9C95
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1BF10E105;
	Mon, 20 May 2024 11:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Oo1wUF+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E69010E105
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 11:49:19 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2e716e3030aso20127711fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 04:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716205757; x=1716810557;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O/oxcJBIyXlY9TtgU1r7E6cgf1golLAQDrTLfXTTYDk=;
 b=Oo1wUF+jvzplzx6lWlAbmfkzEvkEKjqcP5O+/5/K+AIpg21ecOS5eebZSSYk77ykLx
 tpOeCZCaB7NwiIQokHm3joR+U6v4XDnCb+YbtjqzUno6GQQUqB+PCaDgEGiusnfJWTIN
 YUgJKw/jbUmDiusBiFKvm60Ccgx4/2yBDkd7SFZYfHNU4LgTXoF5of6CRkYhEftk4+SY
 V9QokTbxJYbCFNhL9U7wGaRau5a9FQuo5CmP8g88YiSereq1rT0RBRNOwWh3uQgrq9ke
 FbAaOuPDAiIs2f3Y06rOjypb2VF+WjB9xr56FFwrcSrSz7o5dWeb8WEDoMTtAI6qRFvE
 iXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716205757; x=1716810557;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O/oxcJBIyXlY9TtgU1r7E6cgf1golLAQDrTLfXTTYDk=;
 b=VGKa1NAJ5bKbICA7zVb2gnOFwnbmNcXJUyctY174vftaclwBRWaAlxZI2CFtNZpAmm
 DXIhKdpfxL7btQPbvRe4rZT1WruhCxwxHfAESbwk+t+BgW2BvBreWUEQ+Dcd5B78ljA2
 EaOyTpAdCP1QEI6DfwRbEPInbcxT2JtUcLfuH2Q8cdxH85dqWBwpAo4/Qkwz0cX1aBCx
 nPx/MjfpkeoQlTeM1uuTzTn56xGSdYuU7YW4fbCJ+/YoTLfR71Tz4oOYi6QvlHL5SBdX
 OUHkDPJ93NvkMjZL0MhrwblnVv+usz2+HxJ6qjNIKjhP88KxTgszUfmgZ+wJeMzgnCfK
 7CrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXLI/Gh8vSCF2drwhppJdsvBZDQ7lhSczTaKnpXko/sqzIEucA+shlSd7l2b82xFvOqckiA4AySRTRY6Sj1hypWNvXUctCYoXiVcBky8kr
X-Gm-Message-State: AOJu0YxdNsMzZQ1EGyqvgy5k2PsAraKB6+rHeAZYY7tAYKw9gjCoUrfw
 6/b+BnnQNWC1tOgSFMzfInCmWw8jI0JwE9I/o8pcaDngJk7ilSVJYwxxSY3HyD8=
X-Google-Smtp-Source: AGHT+IFlzaGIRfESALSLtsyNFlfZ1/JIBw7ONHINjG4LvPNB4eEcZEi71DkW5rhom1Y1o6Z5gbWZjw==
X-Received: by 2002:a2e:98c5:0:b0:2df:6b06:b5dc with SMTP id
 38308e7fff4ca-2e51ff5cf54mr192231491fa.15.1716205756937; 
 Mon, 20 May 2024 04:49:16 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-351b79e8e6bsm21316539f8f.65.2024.05.20.04.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 04:49:16 -0700 (PDT)
Message-ID: <67f13b3c-18b2-4042-9908-b4d41c24cdb0@baylibre.com>
Date: Mon, 20 May 2024 13:49:15 +0200
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
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <7dbe08cf-47a1-4da6-9035-6b0932cf8426@collabora.com>
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



On 20/05/2024 12:53, AngeloGioacchino Del Regno wrote:
>> So, I don't know how you want to manage multiple display, but IMHO there are 2 ways:
>> - removing the current "oneOf".
> 
> ...eh I think this should be anyOf instead :-)
> 
> I'll check later and send a v5.

"anyOf" behavior works as expected on my side, dt-validate pass ;)

-- 
Regards,
Alexandre
