Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABF2AF85CE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 04:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD29F10E20F;
	Fri,  4 Jul 2025 02:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JsxY6pJj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6D210E20F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 02:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fAiZ4j4wijcmYIWfcCWtn3+rp6BvQoyZlDfJas3wksg=; b=JsxY6pJjQYQljR7vHYnp40itCI
 b1v7QxXPw7hECRVYM5FCe1DimZdKfyPOJ+W5NiZR7hiL/ZKlrNZeghzRrRr8PactqNMPNKGACpkRk
 MMPx6HThsi9j4t9jfnAFAD1Aa1QnjedpFgQNgSpPFq0l2kHdlmYyvpESCpNg4tbehbWep3cLISZbP
 tdKBn2l9gHZIXpxq4BAQ85MwUuMilWgUvHdlT1z60e5LpkYymCpbW2WjXhvUxzS/55Mbuc1X7msLh
 cuCVWskoyeIERAYTDj/URwDv0EkDIYDU4p0Qg3lmKpbBMA9iVyVJhqqtYDV6tBozb26rFvADuEjf4
 Wy/PKnfQ==;
Received: from [179.100.5.63] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXWcN-00CBaW-CY; Fri, 04 Jul 2025 04:57:39 +0200
Message-ID: <9f5d746b-791c-4b88-b4ab-19928f68b0b2@igalia.com>
Date: Thu, 3 Jul 2025 23:57:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible amdgpu_task_info reference leak
To: Dave Airlie <airlied@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <CAPM=9tz0rQP8VZWKWyuF8kUMqRScxqoa6aVdwWw9=5yYxyYQ2Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <CAPM=9tz0rQP8VZWKWyuF8kUMqRScxqoa6aVdwWw9=5yYxyYQ2Q@mail.gmail.com>
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

Hi Dave,

Em 03/07/2025 20:59, Dave Airlie escreveu:
> In this commit :
> a72002cb181f350734108228b24c5d10d358f95a
> Author: André Almeida <andrealmeid@igalia.com>
> Date:   Tue Jun 17 09:49:49 2025 -0300
> 
>      drm/amdgpu: Make use of drm_wedge_task_info
> 
> 
> 
> @@ -164,13 +165,15 @@ static enum drm_gpu_sched_stat
> amdgpu_job_timedout(struct drm_sched_job *s_job)
>                          if (amdgpu_ring_sched_ready(ring))
>                                  drm_sched_start(&ring->sched, 0);
>                          dev_err(adev->dev, "Ring %s reset
> succeeded\n", ring->sched.name);
> -                       drm_dev_wedged_event(adev_to_drm(adev),
> DRM_WEDGE_RECOVERY_NONE, NULL);
> +                       drm_dev_wedged_event(adev_to_drm(adev),
> DRM_WEDGE_RECOVERY_NONE, info);
>                          goto exit;
>                  }
>                  dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
>          }
>          dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
> 
> +       amdgpu_vm_put_task_info(ti);
> +
>          if (amdgpu_device_should_recover_gpu(ring->adev)) {
>                  struct amdgpu_reset_context reset_context;
>                  memset(&reset_context, 0, sizeof(reset_context));
> 
> 
> Doesn't the goto_exit bypass the amdgpu_vm_put_task_info? and cause a
> reference leak at least?
> 

Yep, I think you are right. Let me send a fix for this.

> Dave.

