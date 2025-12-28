Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50873CE5879
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 00:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59D611B06B;
	Sun, 28 Dec 2025 23:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nB9WHDwP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A70311B06B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 23:01:40 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so4040595f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 15:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766962899; x=1767567699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BQwvTTfub3W1PDZlXN4H91fhjPLj3fy6KDrLi83N24M=;
 b=nB9WHDwPFd+N/6dTUKNNI3FjhvQFDLqT49K6X7Jy3PjSLqFzCtYGgI9h9c/VheBbT9
 hHOAlJsuUakqE0lbH6pAo9QUTVKHo5L0n6h1HbodpWspOaJQ+pBCV5/DryCRFJpX7v1m
 Q2SO5pxk/RzcKCBwMweG80dTZOjw3Y/Aq1he14qIpkwzxMUySfz273rGHRLGx/T9P4J8
 Dw/18CYc9khkVuhFKxbpin2bY0IhhOEZGAVuOqLHwAfbtwLzoKuMqZh4Zhj/wWbo5wfV
 B14jyQT6VyhhndaCxnud1G6NRdMHsqFHCD6+zbNeMjGgqScR4aGl6zd40xynNJU/X5l0
 laNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766962899; x=1767567699;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BQwvTTfub3W1PDZlXN4H91fhjPLj3fy6KDrLi83N24M=;
 b=XOfpyCf6QAzxGRocuMLPpA4UFPJWn8FlXahRc0ChbPtb33VCFZguTo0vz91Rl4RFtE
 xT1J/u33LrVkHAAjQjDomQsBLBxs7lw0r56lbonuu+7Dqp35P3sv/BtXYQ3mFcsi2grz
 6A9zWsSpLG0F0Gp6WiFbhHrp756StOduOR9zu/tXkcRDQv6dU+sUGW9qCEnWcVYyIi7N
 Wqw/Hj/7RBKTj6wezg5SCA74X+khQkyn0iAQJ0HsuEPgZr8bG3KWW5sE6cYkvEdMSkhF
 ml6H/6NUUByT2RvYsZCVDPU9rGAG+juXtVIT8nURbFNMS67+92l+JGqM1LIBo1ix52ab
 wt2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb4jFsIwXYLgROSKYbDQnTuTZVBwF9al1bZ++gRTRG+4RBAa1zjTiIK732jRvP6iP+UI3ZBJrCBZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL/tyN8pjXjExm5LaCDHRsCV2fcq0zxYTgXi902xeOX8AO80eA
 U4jlvQXycYizWGlk7FhxVER0B4il4QjoRfw23jrTVn0kM9cLHM90o0c6
X-Gm-Gg: AY/fxX6MdR+aHxZP3vuHm4rklDbVqJcMs/oxE55h473POMaxMv4ANx/8+LGOR+f2Qmz
 wZwoad75jZXjBGlgixG2Ju31n0gbk6spr1WoTmi1f3hdp4yKkq993k0o9IAwyHcMOk75DBMmyj5
 RYAbJ+PVtkifBg1EoAMA10P0RRENRQHhg+ZNWd3OUI2+b6KUilu9DfOM8JvwW41geYWt7KRa9JA
 5LQCqL8b0Q29JjSsObE6NxLZWzn/Aj2MI1IA5KgEJaWQdhA/L0kIWBVRGFKYdKQ1su02ogo4xb5
 Z5NCWCMjLI8mb8EV6HOWwjkvoEThCly2AurMYxPXF7g58wKAmUdmmRXsu6PE6aQz//HG0Ks84LM
 1M4Ix+KFuZgRQbLZyKMnf2N1F6XRfNSrV2OqdHHp/K8u2eCSK6vZj6JDN2DwAhXRPjJdNjWIXUb
 CDTB/6V4uy/lT0a1JbPMU6N9hm
X-Google-Smtp-Source: AGHT+IEle3tOX40aI8Z+pBUJfzESTXjJiSMp4thV8HBHvnHegXUiGsTfpQ2oYRXR0/pBEDgqKU3BXA==
X-Received: by 2002:a05:6000:2882:b0:431:488:b9b4 with SMTP id
 ffacd0b85a97d-4324e4c8fa8mr30131416f8f.17.1766962899166; 
 Sun, 28 Dec 2025 15:01:39 -0800 (PST)
Received: from [192.168.100.5] ([156.197.225.47])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1afbfsm59550694f8f.9.2025.12.28.15.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Dec 2025 15:01:37 -0800 (PST)
Message-ID: <177927f9-e4f8-4f5a-bc71-f42f01c34b2e@gmail.com>
Date: Mon, 29 Dec 2025 01:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: pl111: fix build regression
To: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251223214915.503913-1-arnd@kernel.org>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <20251223214915.503913-1-arnd@kernel.org>
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


On 12/23/25 23:49, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The drm_info() function requires the drm/drm_print.h header to be included
> first:
>
> In file included from drivers/gpu/drm/pl111/pl111_nomadik.c:7:
> drivers/gpu/drm/pl111/pl111_nomadik.h:11:32: error: 'struct drm_device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>     11 | void pl111_nomadik_init(struct drm_device *dev);
>        |                                ^~~~~~~~~~
> drivers/gpu/drm/pl111/pl111_nomadik.c: In function 'pl111_nomadik_init':
> drivers/gpu/drm/pl111/pl111_nomadik.c:34:9: error: implicit declaration of function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-declaration]
>     34 |         drm_info(dev, "set Nomadik PMU mux to CLCD mode\n");
>        |         ^~~~~~~~
>        |         pr_info
>
> Fixes: a1542b8ca6ed ("drm: pl111: replace dev_* print functions with drm_* variants")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/pl111/pl111_nomadik.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/pl111/pl111_nomadik.c b/drivers/gpu/drm/pl111/pl111_nomadik.c
> index f3218d59c5f1..0e5153deb1ac 100644
> --- a/drivers/gpu/drm/pl111/pl111_nomadik.c
> +++ b/drivers/gpu/drm/pl111/pl111_nomadik.c
> @@ -4,6 +4,7 @@
>   #include <linux/mfd/syscon.h>
>   #include <linux/bitops.h>
>   #include <linux/module.h>
> +#include <drm/drm_print.h>
>   #include "pl111_nomadik.h"
>   
>   #define PMU_CTRL_OFFSET 0x0000
Thank you Arnd for catching this . It's my bad missed to compile with 
CONFIG_ARCH_NOMADIK config.

Reviewed-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
