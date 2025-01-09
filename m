Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61CA074DA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 12:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4C710E100;
	Thu,  9 Jan 2025 11:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Wg1bID0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF4410E100
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 11:38:53 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YTN8C2FWkz9slB;
 Thu,  9 Jan 2025 12:38:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1736422699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sU5YEkcofCNmy4MTtzvaoumshLyZ/RkdVgh7mY3DBGI=;
 b=Wg1bID0cJFqKnLqx8zHd7GbPUYCydt/gM6btX985A504NNrt9dHfiGn0l/mavRE/uCa2lp
 gfUj15z4OJBp/4DzHClcj42MIM/NXlAdfwG78SzCpwKQ3Qpt4kjOPkX5EtFzYTpuug1KLf
 O3rJyZQmrM2ZXRo7xk/BNNYlbJ1HD9OZSvBmJJazTbZKy/rYpdYGtBh71cQGaickABSmZQ
 8WSWZlikL1e2ezeXjHJ63sw986jNaGLGgUmn3o3Hh0b0NBHUo08dfr/xipfauU2aFnHnZK
 dbyRpYVgiELXl6o6Ekl8HilGoC+2DimSVa0czIk/Nj9Pp2eq8r/Irc88uTACtQ==
Message-ID: <7e74dffc-ff0c-449c-8b4d-20b500fa7800@mailbox.org>
Date: Thu, 9 Jan 2025 12:38:16 +0100
MIME-Version: 1.0
Subject: Re: [RFC 11/14] drm/sched: Connect with dma-fence deadlines
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Rob Clark <robdclark@gmail.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-12-tursulin@igalia.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20241230165259.95855-12-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7e6f391733f9f604fe3
X-MBO-RS-META: sx46u8ocfgf14injtyyobhndzctwe61t
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

On 2024-12-30 17:52, Tvrtko Ursulin wrote:
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 0f35f009b9d3..dfc7f50d4e0d 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -168,6 +168,8 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>  
>  	spin_unlock_irqrestore(&fence->lock, flags);
>  
> +	drm_sched_entity_set_deadline(fence->entity, deadline);

AFAICT sync_file_ioctl_set_deadline passes through the unmodified deadline from user space. If the scheduler uses that directly, all user space can fake unlimited high priority for its jobs via the ioctl?


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
