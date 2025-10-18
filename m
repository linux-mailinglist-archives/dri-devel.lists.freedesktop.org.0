Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696DFBECFC1
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 14:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30C310E1E4;
	Sat, 18 Oct 2025 12:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EAVdIMSC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2578E10E1E4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 12:46:53 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-426ed6f4db5so2189207f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760791611; x=1761396411; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IwINcystRjoGvSWPk32ya6bCmX4nJsdTWZ/ZarypZXM=;
 b=EAVdIMSCrLBOTX3rPykAddgALLwTc89k70mFOz0qU6ORLkUWLTtV7WvXvjeZs+wSnM
 8b8xs4ki28ncu8ENlmpI4azDV5ZMx/xDFCvPDkfI9MwYOBytxgcBwlPgFXYyYp2ca9Rg
 +TlIQRhgwOfmw/TrwyFvDyVU+pqDKmKnP9Ev+0gmQ3Z1Jpmz5fLYsD/MZjmXgNrbOcqx
 Qjrkya9DlwKgO1IGgnER5kGRSaaWOW3i0odiZo72/yukxQmdaqKoJM4E/3fHFwpOdXTA
 t+QpHkeyfxYFKySpGvKBRo+MCm6MnL0lZr3Vi3IiFOksaBiVXq3I5vX6zDf120fIxjyi
 OkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760791611; x=1761396411;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IwINcystRjoGvSWPk32ya6bCmX4nJsdTWZ/ZarypZXM=;
 b=hoJKi6nDYoTsH9vuZPWCa+36zMOTl6LJ9brbehPx3xFYp2FUuvSfIbAuZiLuzhDbq+
 qQoJfdkr7yNfF2cSu44vfZOcjICWlajEcm2t4m/IBGBVapkgTlevwAn7sjmjg3nwdtDl
 V4Rknq70JRzdlUqiWvcVHiC5fgX5aFzCqT/rWFTmRx/8OurFKGfSmB/R1SvnnlZjKhY7
 /k367SO9/OeTVkYZlm//PjBkG+NWRVfsnOb0gop4PJh2kgwmmQSC6cRVAviHbC4hp6A0
 84j7SZmhUiK8k/6wfJEdPSguvhsRqg7+oMvhS4gqjcx+0FJvAywfCXAnwn+8MXNrEk/d
 D6Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV475Wn6LMkXAWJ39N360hb6BFqSXg/9ynAnAcgC3A7+AMKOAFUJ0JUbA7BJR+gENrDGh66FCpUYII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHU7KhvdTfVhPY8PQWDbuLtgjYArtH6HhY4s2W4CZ5d3yULnQF
 kk6Naa5SxLkXn25uZ2y3yKicouuEFFW1mBxsmt3CRQMsWMqlk2LhFLUF
X-Gm-Gg: ASbGncuBnU60ROYnobsgZWdiSkuciI/T/eaLyrEUQouQsyUdgQ2ElJQu7hlU2gj6yjh
 DyPWnQwh8uxwaCZtetbdDZjs3fM13hA5zALT3k60Uyj85fgU0QvYs+C6yDB88d8Di5KehqHgzqa
 8RSkqJXouzubeHKZNF2I/DZ4Rz4HLmwmmkXltB/WZpsr+OLY2FxSvqy/sY+e7ZeX7IVNraQ8M2/
 fiGObMadzNU8gw5tSBNSP+lGSNOByc7/xEcUmHgZFrbCzrhbzT/kY5J+ook8392Wb2E6CFUHtwS
 AjyjZtGsVBlSc99gOCLFpRW0OiyxjVfydk3p9AT4mx/ED64pcOuHMLWPdniHF3tSyFYmFHtM49O
 p/p4ytjqsrdEN80yEvfqGcdzTdDz8TnieXCx5TyCYtqvoYOnZEUCkBFKJ0+pAiYg/U3jYSj7tVj
 ovJMunddREBRimFXxhzLIJ6r6qb9pD0XaVIK1FpItMfpGZ9I0Dgh0QQyjKQ1c=
X-Google-Smtp-Source: AGHT+IF5RJYLSmA+oH07tnmvmsNyWmRsGcHhrDvL8wpjhULq8NfGc4GpnDL/KGS4NnlMtDmLKBwXmw==
X-Received: by 2002:a05:6000:4586:b0:425:6fb5:2add with SMTP id
 ffacd0b85a97d-426fb7bba0dmr5569895f8f.19.1760791611546; 
 Sat, 18 Oct 2025 05:46:51 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:2acd:89a8:83d9:4be5?
 ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b9f71sm4781988f8f.37.2025.10.18.05.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 05:46:51 -0700 (PDT)
Message-ID: <a822d284-f2a2-40f8-987a-6e2f70a22fcf@gmail.com>
Date: Sat, 18 Oct 2025 14:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/bridge: add warning for bridges attached without
 being added
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com>
 <20251003-b4-drm-bridge-alloc-add-before-attach-v1-4-92fb40d27704@bootlin.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-4-92fb40d27704@bootlin.com>
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



Le 03/10/2025 à 10:59, Luca Ceresoli a écrit :
> DRM bridges must be added before they are attached. Add a warning to catch
> violations.
> 
> The warning is based on the bridge not being part of any list, so it will
> trigger if the bridge is being attached without ever having been added.
> 
> It won't catch cases of bridges attached after having been added and then
> removed, because in that case the bridge will be in
> bridge_lingering_list. However such a case is both more demanding to detect
> and less likely to happen, so it can be left unchecked, at least for now.
> 
> Link: https://lore.kernel.org/all/20250709-sophisticated-loon-of-rain-6ccdd8@houat/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---

Reviewed-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Best regards,
Raphaël>

