Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0729A3A73F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 20:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B7D10E0E2;
	Tue, 18 Feb 2025 19:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fPnV1/cy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A7710E094;
 Tue, 18 Feb 2025 19:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BhkRRMGqLdFRsX8PWy/RgT7plpiBxGe2Xoa8gg6Cugs=; b=fPnV1/cy2Er2QnLoSQgkdrGtef
 lqf0zBd7u1VpQ8wg7X2xvWzwahxaGUO3O1NIVC4rXZRQ9vFUclfJfidDp97We9uzTWA0AF+BR0+rj
 IruHLeJ9oknNtkWGKfZIlzBP10KYmzvG3U2RU6/APG3QC8XaWK+uu3scNba21T87i/JStnU5xtJ+r
 5SMr2ZuvhTUoSRXqDdVK3XecKZDeMf8Fbp8sxuWuUsI4GrQzUX5PXGjw8BSjBr311zZJUKSfR5xUk
 rhoT6YAlAzilNTQ+h5SnmyRkHzlEY1EehBQxD7tkqRj3suCnRien5+1UWBsxqul1N8Ikurw31s0kC
 b2wZG+eA==;
Received: from [191.204.194.148] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tkT9e-00Bc4T-BJ; Tue, 18 Feb 2025 20:21:20 +0100
Message-ID: <67298861-0a4e-4094-a948-cfdfb0a97a83@igalia.com>
Date: Tue, 18 Feb 2025 16:21:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/xe/xe_drm_client: Add per drm client reset stats
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 saurabhg.gupta@intel.com, alex.zuo@intel.com, joonas.lahtinen@intel.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com, kernel-dev@igalia.com,
 Tvrtko Ursulin <tursulin@igalia.com>
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250214203757.27895-1-jonathan.cavitt@intel.com>
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

Hi Jonathan,

Em 14/02/2025 17:37, Jonathan Cavitt escreveu:
> Add additional information to drm client so it can report the last 50
> exec queues to have been banned on it, as well as the last pagefault
> seen when said exec queues were banned. Since we cannot reasonably
> associate a pagefault to a specific exec queue, we currently report the
> last seen pagefault on the associated hw engine instead.
> 
> The last pagefault seen per exec queue is saved to the hw engine, and the
> pagefault is updated during the pagefault handling process in
> xe_gt_pagefault. The last seen pagefault is reset when the engine is
> reset because any future exec queue bans likely were not caused by said
> pagefault after the reset.
> 
> Also add a tracker that counts the number of times the drm client has
> experienced an engine reset.

What's the use case for this? How will userspace consume this information?

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> Jonathan Cavitt (4):
>    drm/xe/xe_exec_queue: Add ID param to exec queue struct
>    drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
>    FIXME: drm/xe/xe_drm_client: Add per drm client pagefault info
>    drm/xe/xe_drm_client: Add per drm client reset stats
> 
>   drivers/gpu/drm/xe/xe_drm_client.c       | 130 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_drm_client.h       |  38 +++++++
>   drivers/gpu/drm/xe/xe_exec_queue.c       |   8 ++
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>   drivers/gpu/drm/xe/xe_gt_pagefault.c     |  46 ++++----
>   drivers/gpu/drm/xe/xe_gt_pagefault.h     |  51 +++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c       |  19 ++++
>   drivers/gpu/drm/xe/xe_hw_engine.c        |   4 +
>   drivers/gpu/drm/xe/xe_hw_engine_types.h  |   8 ++
>   9 files changed, 279 insertions(+), 27 deletions(-)
> 

