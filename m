Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A09AFCA88
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F1B10E626;
	Tue,  8 Jul 2025 12:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DgJNQlW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F9810E623;
 Tue,  8 Jul 2025 12:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nz52Vhd7cY2RNkcVzOpq7hOZdNmmSQJYBRliIIMfQG8=; b=DgJNQlW+EGW2mmvL5q/wpgg1HQ
 DnhHooWTPyUIgKGp+iGSA3AKeCq1Tpc1nOF5KzsoAIN1R+i2zavZJXe9rNfCXY4Npd8YTKdFvKm7L
 seU+ltQ8WVaH1RCH8ioN4p2llFI5ndXFRyuSuIid/ArwTanLHMVY9MbgkVkMJ/skARLyH0hTKKXws
 SQaJsDtQFjt02ewp1j2g5UZ6YLrAUOUFc2Aww6O8wunD8sbEu+KX6GRACdlxRM14/xEaUH13ugWxA
 CPuAQvUZE3f+rhn8nV215busmJxCADITSx4pyVOYm+V96GgIlPdx0GniepNilFSCJud4ib273g9rv
 7E7/IrNA==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZ7ak-00E0Tq-6n; Tue, 08 Jul 2025 14:38:34 +0200
Message-ID: <525ee8f5-cf98-4a31-94e6-700fb2982ab3@igalia.com>
Date: Tue, 8 Jul 2025 09:38:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
 <20250707-sched-skip-reset-v4-2-036c0f0f584f@igalia.com>
 <c5f4bb06f88338c03cc903a3ff5c58607625aade.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <c5f4bb06f88338c03cc903a3ff5c58607625aade.camel@mailbox.org>
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

Hi Philipp,

On 08/07/25 04:02, Philipp Stanner wrote:
> On Mon, 2025-07-07 at 11:46 -0300, Maíra Canal wrote:
>> When the DRM scheduler times out, it's possible that the GPU isn't
>> hung;
>> instead, a job may still be running, and there may be no valid reason
>> to
>> reset the hardware. This can occur in two situations:
>>
>>    1. The GPU exposes some mechanism that ensures the GPU is still
>> making
>>       progress. By checking this mechanism, the driver can safely skip
> 
> I think this should be rephrased, because it reads as if there is a
> mechanism with which the GPU can be forced to still make progress even
> with a while (1) job or something.
> 
> I think what we want probably is:
> 
> "When the DRM scheduler times out, it's possible that the GPU isn't
> hung; instead, a job just took unusually long (longer than the timeout)
> but is still running, and there is, thus, no reason to reset the
> hardware. A false-positive timeout can occur in two scenarios:
> 
> 1. The job took too long, but the driver determined through a GPU-
> specific mechanism that the hardware is still making progress. Hence,
> the driver would like the scheduler to skip the timeout and treat the
> job as still pending from then onward.
> 

Applied it locally.

>> the
>>       reset, re-arm the timeout, and allow the job to continue running
>> until
>>       completion. This is the case for v3d, Etnaviv, and Xe.
>>    2. Timeout has fired before the free-job worker. Consequently, the
>>       scheduler calls `sched->ops->timedout_job()` for a job that
>> isn't
>>       timed out.
> 
> 
> "2. The job actually did complete from the driver's point of view, but
> there was a race with the scheduler's timeout, which determined this
> job timed out slightly before the free-job worker could remove it from
> the pending_list."
> 

Actually, for this second point, I prefer my wording. It's more straight
to the point and easier to understand when you read the code. I'd prefer
to keep the second point as it is.

All other comments have been applied. Thanks for your feedback!

Best Regards,
- Maíra


