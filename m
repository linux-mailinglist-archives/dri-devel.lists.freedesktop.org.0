Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E631BECFBB
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 14:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E38F10E19C;
	Sat, 18 Oct 2025 12:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PYpNXaS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4651910E19C
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 12:46:39 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so20274875e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760791598; x=1761396398; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=InrI7Nfp1NYd+ZIKEO2xbQ29jEdwIZK3y4xYlXvgeH0=;
 b=PYpNXaS/BCTw82KLnMcMBSTW+8tI20awlfWXO2FHj2LaKFksk1AlJLyDAJrWgvioVx
 9tGbHTDYxc16aJnKxOlWjI/XfB8JJ0+56DP1+uMFtD8PWLdJ2Q4O4KYYD7keorjS3gXQ
 n84Es1x8hF8G0sepj0U/6wnPUNPhc+332Hrzqd+K+se32Cr7XIEWrqDwf4YKe32VUlHf
 WRZ//5Z3doMZ8UOr03ZXy5rNF+xBel+HjQlWoWIZlXdbKh6r4LKlDAPz3qaS3L5iHlYA
 HRS1jU3JkWDwfBvsopKc7+Q491dzAiAp2hy63HeOvmsSOREQg6uJENzED2Rj2drd0TAb
 v+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760791598; x=1761396398;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=InrI7Nfp1NYd+ZIKEO2xbQ29jEdwIZK3y4xYlXvgeH0=;
 b=QvjCap25+69Wi9YJ1bxzCQHnLN41RSUQYKBzn0d9BO/Pphb2Q68nD/RbAT/82mIQh5
 YOr5tiq325dCd/sXEBgbkseF6CPcrBLSZWFVVSN/tayBpIMb2KlE7P1MbvxB1sbP6Jtx
 hmNJG3DI51pk/MhRPIDuyQUCxcg605+b2tAoCDTY+XlopbHM8GSCe6M57cD/FqzyJhzn
 0z3cO9Q8GPpBsup519+ak3AAe48z5DJM/8k03w5pkvhHJFebAhjwEv+kodPFNRJfeASJ
 45qPIiGNqasDyh4tTwsMXgyVmoM1iCksNcD1+c7IsNb21uZOOD5i/wUGQenQKx2c9rfx
 b+Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEagholvXj0QSyCejgsiMDG2m85+xewxhaRkPb4fqVr1br/O6vsdNf6+QVkOWXc0r/RLhvLkps+7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSok7KMvjmhsBQz8+sYLppat3+UmjN29rf1n+5XqPmel5Sb6rW
 jsCKBdPhWv5u7f/NHGR7D7qHs2N9Gq2rbCIV61sKZz0zgKYWOgT/MhQw
X-Gm-Gg: ASbGncsh55AmNUzIZilxAKx0MY64n5q+Cd7BbeLhxpmWv49mdYGN7CbKjsvwN3fXF4K
 A+qO6WLSVC2jQ2A/Ri3ZxLgkNkv/ulplc4DnIPLOZYZrgMB2Ex8OsKC11Rk+gV1K1BUaw1W00eg
 YSOi+MjBexf+ClHs0iucaRGwGd6PfxApd1aJt3zQt2lKODUn/1dR22Fao2yMcMjRtcdcxfNfSH+
 YcqLmZnqS22Pd0SRIU7kzDS/82Cr5IDwmR9QwjQtff4i8uaqhjcX5OhsvHEv7QsEbaaf4Pf8DYY
 H47AX6bUH1Qfnwc9bGpbKGskSz5NWJUvEJfEjyG9j4+JF7YayiWSDh+4NGPMIH5bQY0zDuKDd85
 WGrSZthsbz6BzVFYC5X8C+uHdfZhS5OLfY7ZxtmjMzOgLKkbjvmS+abX7EUM76mrsldh/gX9BZK
 ER1N/0Wc5YE8yLqDBBElJG7IL067J3iGImVHMRkjUeO/GWVEi59/qyWQS25Ls=
X-Google-Smtp-Source: AGHT+IENxpeW+lY77m0+5KTzVSjMas6cNGY59trgXHqIQUrSp7xcHqXWQxlyCxX/qR2myN3RoqtoKA==
X-Received: by 2002:a05:600c:3581:b0:45d:d5df:ab2d with SMTP id
 5b1f17b1804b1-4711790bf23mr51028465e9.26.1760791597612; 
 Sat, 18 Oct 2025 05:46:37 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:2acd:89a8:83d9:4be5?
 ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce3e2sm4754007f8f.47.2025.10.18.05.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 05:46:36 -0700 (PDT)
Message-ID: <ba6e494d-d318-4cf2-8ff0-c29100099dad@gmail.com>
Date: Sat, 18 Oct 2025 14:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/bridge: document that adding a bridge is
 mandatory before attach
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
 <20251003-b4-drm-bridge-alloc-add-before-attach-v1-3-92fb40d27704@bootlin.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-3-92fb40d27704@bootlin.com>
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
> At the moment it's not documented that you need to add a bridge before
> attaching it. Clarify that.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/all/20250709-sophisticated-loon-of-rain-6ccdd8@houat/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
Hi Luca,

Reviewed-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Best regards,
Raphaël

