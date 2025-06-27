Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B49AEB91D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 15:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D58110EA43;
	Fri, 27 Jun 2025 13:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Gd611RXt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D44F10EA43
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:39:38 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 0C36E26091;
 Fri, 27 Jun 2025 15:39:35 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_DBtCRPQosI; Fri, 27 Jun 2025 15:39:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1751031574; bh=TEJGRf1FlIgDbcSTQNxCwfvvmdMjzuRrveS8ic9DKO8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Gd611RXtDUZ0eMsj5UIbALHq5iK/naVa74b1YVOj7JFRHqo5mtjuCj6SVb4R7ZlF3
 E/RfVgUSG9gCG6F+kirZgVXVL9zb+soJQe6bl1bzc/g6ZKIGkJZDXd+DVbvBaTdB0k
 UnVLNZsgX+lWxlVHtv0hartInLi0BGjipjNH0S5tTd1EnWTIgyK8xhXMI4MHSkSfa4
 Q4HS5x5/4zSEQB+a59M6MQCtSUte1dl9XC3GotadKWwDod9EsyQswm32ejXt2+Koyh
 7UV5ld8aCL5fmXVsKpYs2lhrWdIlPUBlvO8v0jPUcphwmsqPY38Xan9OMyuLddf+NW
 sIF6VTF7uZIyg==
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 13:39:33 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor@kernel.org>, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Akshu Agrawal <akshua@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm/exynos: exynos7_drm_decon: fix call of
 decon_commit()
In-Reply-To: <CAAQKjZM+++P3ozLZZYEusYepamF0qdeuOe+thDb2BevLCsab_Q@mail.gmail.com>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-2-5b456f88cfea@disroot.org>
 <CAAQKjZM+++P3ozLZZYEusYepamF0qdeuOe+thDb2BevLCsab_Q@mail.gmail.com>
Message-ID: <c4348867644c2e1d0a4fc47f3291855b@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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

On 2025-06-27 04:06, Inki Dae wrote:
> Hi,
> 
> 2025년 6월 27일 (금) 오전 4:21, Kaustabh Chakraborty 
> <kauschluss@disroot.org>님이 작성:
>> 
>> decon_commit() has a condition guard at the beginning:
>> 
>>         if (ctx->suspended)
>>                 return;
>> 
>> But, when it is being called from decon_atomic_enable(), 
>> ctx->suspended
>> is still set to true, which prevents its execution. decon_commit() is
>> vital for setting up display timing values, without which the display
>> pipeline fails to function properly. Call the function after
>> ctx->suspended is set to false as a fix.
> 
> Good observation. However, I think a more generic solution is needed.
> 
>> 
>> Cc: stable@vger.kernel.org
>> Fixes: 96976c3d9aff ("drm/exynos: Add DECON driver")
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c 
>> b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>> index 
>> f91daefa9d2bc5e314c279822047e60ee0d7ca99..43bcbe2e2917df43d7c2d27a9771e892628dd682 
>> 100644
>> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>> @@ -583,9 +583,9 @@ static void decon_atomic_enable(struct 
>> exynos_drm_crtc *crtc)
>>         if (test_and_clear_bit(0, &ctx->irq_flags))
>>                 decon_enable_vblank(ctx->crtc);
>> 
>> -       decon_commit(ctx->crtc);
>> -
>>         ctx->suspended = false;
>> +
>> +       decon_commit(ctx->crtc);
> 
> There seem to be three possible solutions:
> 
> 1. Remove all code related to ctx->suspended. If the pipeline flow is
> properly managed as in the exynos5433_drm_decon.c module, checking the
> ctx->suspended state may no longer be necessary.
> 2. Remove the ctx->suspended check from decon_commit(). Since the
> runtime PM resume is already called before decon_commit() in
> decon_atomic_enable(), the DECON controller should already be enabled
> at the hardware level, and decon_commit() should work correctly.
> 3. Move the code that updates ctx->suspended from
> decon_atomic_enable() and decon_atomic_disable() to
> exynos7_decon_resume() and exynos7_decon_suspend(), respectively. The
> decon_atomic_enable() function calls pm_runtime_resume_and_get(),
> which ultimately triggers exynos7_decon_resume(). It would be more
> appropriate to set ctx->suspended = false in the
> exynos7_decon_resume() function, as this is the standard place to
> handle hardware state changes and resume actions.
> decon_atomic_enable() is responsible for requesting enablement of the
> DECON controller, but actual hardware state transitions will be
> handled within exynos7_decon_resume() and exynos7_decon_suspend().
> 
> 
> Unfortunately, I do not have hardware to test this patch myself. Would
> it be possible for you to try one of these approaches and verify the
> behavior?
> Option 1 would be the best solution if feasible.

Yes, it works fine indeed. Thanks!

> 
> Thanks,
> Inki Dae
> 
>>  }
>> 
>>  static void decon_atomic_disable(struct exynos_drm_crtc *crtc)
>> 
>> --
>> 2.49.0
>> 
>> 
