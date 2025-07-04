Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742EBAF9261
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD35C10EA12;
	Fri,  4 Jul 2025 12:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Oxp0Fzn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779ED10EA11;
 Fri,  4 Jul 2025 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XbaDjDWqdnKDdqcosm9iq5MePhQ6bbb1VeFVI/I13F4=; b=Oxp0Fzn8fYvGKvkCgubLNFDlMF
 pOs+6UGpF2H0Mlk6S3K6OJgTYWqLOToouotKVhTQp9Ed3B0Vp6vt50DczZxr8rsWhC/S5FQF9aEkf
 QBv+Dj/G+Wr7ttZ8lLgl1X56tblIgnKX1e+E0JaKpmHr4te54gsJwquvcLjym703VJXI4bConOtMd
 8UjPQNXmcSuWt5/wUqEkdRU5zcBFhdPLk3VKCoAmK9v1MXMqDYT3aHihITfSxay+9GUxwl7cC7SOe
 4CFdYm/XS3u8PSRyWZh8R99NlEFAuxnybM08YBHL4RSjf1xsnj2rKDgyMXgxRenpAvQoH27cq0Cw4
 IQX7a2kg==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXfNW-00CQHV-Rd; Fri, 04 Jul 2025 14:18:55 +0200
Message-ID: <dc5317a4-0adc-4371-871c-79b7d54614a6@igalia.com>
Date: Fri, 4 Jul 2025 09:18:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/sched: Avoid memory leaks with cancel_job()
 callback
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250701132142.76899-3-phasta@kernel.org>
 <20250701132142.76899-4-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250701132142.76899-4-phasta@kernel.org>
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

On 01/07/25 10:21, Philipp Stanner wrote:
> Since its inception, the GPU scheduler can leak memory if the driver
> calls drm_sched_fini() while there are still jobs in flight.
> 
> The simplest way to solve this in a backwards compatible manner is by
> adding a new callback, drm_sched_backend_ops.cancel_job(), which
> instructs the driver to signal the hardware fence associated with the
> job. Afterwards, the scheduler can savely use the established free_job()

s/savely/safely

> callback for freeing the job.
> 
> Implement the new backend_ops callback cancel_job().
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Link: https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra
