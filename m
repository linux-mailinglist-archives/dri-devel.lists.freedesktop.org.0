Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40369D3B1A3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B559C10E10D;
	Mon, 19 Jan 2026 16:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="FhypDnec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B602810E10D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:41:38 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-34c37a107b3so111181a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1768840898; x=1769445698;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HcmmiqNbU3rGTkCmxroKjD8IC24Ld60SzEtjXGdLtbM=;
 b=FhypDnecruP4ZVHfh9UgVcxTg0lksPj1ygOwoDaaaJZqMz9F9LkEUir6toSVxFFCkg
 s8A3vNtXNWlrhWvvF75imqLUZDLkYXJC95Tg53K6UWWflZikgOAMeeu3iPOZWzFlUMGN
 dCzq2By1CAyHRBsMIfvoUdESHG7ZYLwTUlwsJEAhguzHoHUUFKnCl21C3J8If5lrYAAQ
 opc8sgPUd4UxHNItF8MdTDgKuGQjeNXKTSxRkhDqtuskfI7JC5I5PiozwLsNMRsJCOpU
 lYwGhwdD5Kq0XKNx11qiT3xCRyWogDzvYLrQ+pH5dSB+VmLJmfPN+ikhcaQ5K0wvQgXK
 K9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768840898; x=1769445698;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HcmmiqNbU3rGTkCmxroKjD8IC24Ld60SzEtjXGdLtbM=;
 b=ijJTMJCI9OYjB+uEd7/7wugiR2gwBXIBFxLpkWIyQ8CvJTgW9ZU/V1ysYfztAEunJg
 wvNzHo/RiGJYn/mFQijLVitSzxiJrpShocUPTqhipb9zel6yXARPRG7xWn0MMdNtdoa4
 zQlbNe3AmSEm6p3CoOBBq54q5YyLS4vAkA6jqeyU93E9RGuFaTDplqqr5mCcV0Un+LxR
 WNWy0ApmvZMp8hUlUFrkGGmunMZgNDQ0nbM0vjx1jRb3ae/yMfJh6zXlKfpLJfLBVrGz
 eCvRZgRIG1UgGMquFLyEBgn1gAqMaEqgxU1lG1resJAc7DB6d7vkzQXR7tKIjZ3o5VIj
 o+5g==
X-Gm-Message-State: AOJu0YzdbjPCA91HYj0YJb+384ymrzgN67HXT36OpPNwY6Xzlo+zsdat
 ZW8izqIdm7Seu1QIl9dI80WrG9LoEL/4MuxklthWcaQFxsuOCO0PEQVXxFliozT5r9g=
X-Gm-Gg: AZuq6aL3kklxWWaPRGXCMMLmrB3AIQPLiiD3jhCnmc1sc6qy+DvsuHw72rjcSdjfj3h
 n0hr1E6z/jnX+fitL2o0H7OKAhvcNrRuxlXk7P78ky2ZbmEBhru5TPP+vxhHrM2qyQnGySGH5xZ
 NiNJ4CMWttuvwTAU8VbRp2c7kVHgH+daEJjGn3sigYH+sxFdyWTAqkE7tX07fqwCmTdNqhgOK4s
 LgEJCHyPfU4tNwA+scxZiy4EIeawHHyHCJCb2Zk4dHnAQd/URjzc64XNfAgH15UspG07H2OygjX
 i8A4Ka5m7SFw1H532NFZlaugeQZzP1wd09Uf3PeNpd4Y8mmGHQJQcoyPCr8ac2ydxf2zH3TypwX
 PfJthrD7E10WobQqgkUkGGSg2EPnbp+IqR02NpvkOyjWSN8dsLGSXkqqWUlYny4PPciHmoUaF8i
 0eb2si+GXMHtmZ
X-Received: by 2002:a17:90a:c887:b0:34a:b4a2:f0b5 with SMTP id
 98e67ed59e1d1-352b5a7f82cmr160248a91.5.1768840898210; 
 Mon, 19 Jan 2026 08:41:38 -0800 (PST)
Received: from [10.0.0.178] ([132.147.84.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-352677ec7dasm12316253a91.8.2026.01.19.08.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 08:41:37 -0800 (PST)
Message-ID: <cc51e712-a337-46b0-91cb-6c3af76a84c3@shenghaoyang.info>
Date: Tue, 20 Jan 2026 00:41:33 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm/gud: fix NULL crtc dereference on display disable
To: Thomas Zimmermann <tzimmermann@suse.de>, Ruben Wauters
 <rubenru09@aol.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20260118125044.54467-1-me@shenghaoyang.info>
 <fa36159a-fa41-4066-abea-60a439e944b3@suse.de>
Content-Language: en-US
From: Shenghao Yang <me@shenghaoyang.info>
In-Reply-To: <fa36159a-fa41-4066-abea-60a439e944b3@suse.de>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 19/1/26 16:17, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for the patch.

Thanks for taking a look. I did forget about this oops and the
smatch failure was a good reminder!

> 
> Am 18.01.26 um 13:50 schrieb Shenghao Yang:
>> Commit dc2d5ddb193e ("drm/gud: fix NULL fb and crtc dereferences
>> on USB disconnect") [1] only fixed the initial NULL crtc dereference
>> in gud_plane_atomic_update().
>>
>> However, planes can also be disabled in non-hotplug paths (e.g.
>> display disables via the DE). The drm_dev_enter() call would not
> 
> 'DE' ?

Ah - the desktop environment. I was scratching my head for why the
box kept oops-ing on boot even after the hotplug fix. It turned out
kscreen was applying the saved "disable display" setting.

> It seems to me that all these calls to GUD_REQ_SET_CONTROLLER_ENABLE(^1) and GUD_REQ_SET_DISPLAY_ENABLEshould rather go to the CRTC's atomic_enable/atomic_disable functions. Those currently seem missing from [1]. The atomic_update helper would then be reduced to damage handling. Best regards Thomas [1] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/gud/gud_drv.c#L341
> ^1: SET_CONTROLLER_ENABLE sounds like it could even be part of device probing and runtime PM management, but that is a more invasive change.

That feels like it'd be much cleaner. I'll respin with that in v2.

Shenghao

