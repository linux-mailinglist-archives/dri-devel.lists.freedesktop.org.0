Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF684C80E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBA810FE43;
	Wed,  7 Feb 2024 09:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RYtFfZ52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE0D1131BD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:55:11 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40fc654a718so3377895e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 01:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707299710; x=1707904510;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fsRZs51W2huLngb3aSHYllyqQl8VP5fXmWHfrrQr+1k=;
 b=RYtFfZ52biqEwQD6r83ACVtZdbdWnqLnEGOzHJ/3Y9R1aI1IhUGSSltWpY9SL/Dsn9
 7dG2GlFNbtARorWfVTldolxjYl+3tnS13P6i7MBBDSzb+VxB8i1KzuAlWMk6fJRpk3zX
 ffjBE0Soi8W8lEmHyfGVC94BpRSvkw+hLmjjiSq/KQWEiPPPom/a+bVDJOPqytblFDbC
 s5eNFcMrbOCrkqcLSYwEbrjHujjAkQ8cx2FWC25dCIZ8lVxejNIOc8Df5yETVf32saLQ
 zsjz5FkAZqo4wm2Vnkvp4uhu/iVUPx9vHi/ZtyEguRSTiaIhue+vAbqwH1zfL8dVyFVK
 lwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707299710; x=1707904510;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fsRZs51W2huLngb3aSHYllyqQl8VP5fXmWHfrrQr+1k=;
 b=R2j4Qknf1dOc2ltiCzoAGIRKRYnWVfHPuB7Ce9kJJHypygbbhtpwNwVPeYHw16Pi1q
 FR2rsZlHQIY3KFEXOvFVeewW6KfnGWpAZhaqhKABgoeyLz7StS8FnEdwIp0AFZtfsfy7
 oouNtrFiS6ObMCa57NQQGZFudjpY8YHhDa4xT425ovmAYS5Nmw3rRe3mOmz8IxH0Ajcj
 ZmcKIC6HzhdAFGry4ocGaYipaJvmNB7C4BELTf/xkksRqx3f6TWw/VDk+43PYlcw9QUH
 GWNO5HWAGigEmb9O0+2zZ2gzIhYeAbKL2vEMBa5wwwlKEQxXC+ObAtoMQcd1hbaMh34I
 X2GQ==
X-Gm-Message-State: AOJu0YxJ0dsldp8IcPOS+Nn/Rp+JPnq4qJR2BZuxynSW0QlOUX2x1cgp
 XydBF2Gprcb9duxjFsUbquuLORCk7jVKIGwUOH/pdFb54ddGJiA8D/t4AbL0CbU=
X-Google-Smtp-Source: AGHT+IG7N3OfmAh54zPppxgxnipuAkjejir3UBYj6pe+R+53DlWxcD0lVN8Xy4HfG00GDYpT1e67lg==
X-Received: by 2002:adf:ce8c:0:b0:33b:136a:95a3 with SMTP id
 r12-20020adfce8c000000b0033b136a95a3mr2875503wrn.28.1707299709759; 
 Wed, 07 Feb 2024 01:55:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWomvasDY2y1JGYC41yi3XjKUcCAy+WjDD4t4v3x0Py0iVpS7KfDv1ihzcoSIGyJDs9LYYnSaZ9fVzQIbMxYSQddfp8BcaLQPOmNuHTxP0Iq3nKxKzxCYdg5Amf2xeEnKy64aN9m8kBu/Y+G8fqpLaCgUrbByqQO5y14+C2vcwkn906lbapgjN3P9YUIbT0CwDgRn4OxG9kOMqi2wJLn5digJZ2gLiWgHsG+LSTfjqwUg32N2xvJHUSKhjyYbeycS6tsV13hPkwZlniyYYpr+1XW9zDtc2Jk6XvtZUPvYjgT1Ovve5EMo9BDAjQT2jSLISuzRUJ/qWitiGBJqvLZXczHzEPtiShAn8QqCcU56rFp3agu6i3oSNL9XqzAS1I2ntzuQAt078dz8WPVcmbJz8L2srFCMgE2eVFDg==
Received: from [10.101.1.8]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d4dc7000000b0033b51e2b9b8sm23808wru.23.2024.02.07.01.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 01:55:09 -0800 (PST)
Message-ID: <843e34a5-f175-4bda-a2f1-2ea3b56b68f5@baylibre.com>
Date: Wed, 7 Feb 2024 10:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm/mediatek: dsi: Use GENMASK() for register mask
 definitions
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-2-angelogioacchino.delregno@collabora.com>
 <f91db779-ad94-4c18-9a06-1029da4edaab@baylibre.com>
 <c1e2c380-21b5-47c1-b83b-f7f2b481df21@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <c1e2c380-21b5-47c1-b83b-f7f2b481df21@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 06/02/2024 16:53, AngeloGioacchino Del Regno wrote:
>>>   #define DSI_PSCTRL        0x1c
>>> -#define DSI_PS_WC            0x3fff
>>> -#define DSI_PS_SEL            (3 << 16)
>>> +#define DSI_PS_WC            GENMASK(14, 0)
>>> +#define DSI_PS_SEL            GENMASK(19, 16)
>>
>> 0011 0000 0000 0000 0000 => GENMASK(17, 16)
> 
> Alexandre, the reason for that is in the commit description :-P
> 
> "While at it, also fix the DSI_PS_SEL mask to include all bits instead
> of just a subset of them."

Oh sorry...

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
