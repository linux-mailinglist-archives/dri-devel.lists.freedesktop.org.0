Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914C698CEE0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 10:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B956C10E6D6;
	Wed,  2 Oct 2024 08:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="p80H3rt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1896610E6CC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 08:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727858295;
 bh=PapsXDbscE5g+CTsH3TMd8PdEDw+5StvLgt1r7y4e2E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p80H3rt6J4/GSbs8bgUfR5T35tiZ1xTuCBrNO7xrn5z5McLQS5NLBZQpyMvM3AJOU
 qJ8prqHbXBGhTaydK63dfTz2bVcfZ1sYS7mZ28DuWNpxUBEz9xBppAv9OwqR345MlF
 B5JJ/RkJBW+j6K7sD6xcjTZbLBsJauDxVTBliEpl4Ufon4QdgdLWj0HPZdeGJZeAzr
 7YB78MYC0VvdKGH1xfCVpO5eTqaXzHU8BvRlQYx7+zRMAHXNyfepAljngqCMPcuS85
 Eieb475kQF23qy6QIUcFZiSl79fhHZzB39iJrXBqtXXl7C4Mtdev7k5M4BA8NjnIUe
 BJn3kuwD4tbBA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2720C17E1082;
 Wed,  2 Oct 2024 10:38:15 +0200 (CEST)
Date: Wed, 2 Oct 2024 10:38:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v8 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <20241002103809.26d34ee0@collabora.com>
In-Reply-To: <20240923230912.2207320-2-adrian.larumbe@collabora.com>
References: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
 <20240923230912.2207320-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 24 Sep 2024 00:06:21 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> +static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
> +				       u32 cs_ringbuf_size)
> +{
> +	u32 min_profiled_job_instrs =3D U32_MAX;
> +	u32 last_flag =3D fls(PANTHOR_DEVICE_PROFILING_ALL);
> +
> +	/*
> +	 * We want to calculate the minimum size of a profiled job's CS,
> +	 * because since they need additional instructions for the sampling
> +	 * of performance metrics, they might take up further slots in
> +	 * the queue's ringbuffer. This means we might not need as many job
> +	 * slots for keeping track of their profiling information. What we
> +	 * need is the maximum number of slots we should allocate to this end,
> +	 * which matches the maximum number of profiled jobs we can place
> +	 * simultaneously in the queue's ring buffer.
> +	 * That has to be calculated separately for every single job profiling
> +	 * flag, but not in the case job profiling is disabled, since unprofiled
> +	 * jobs don't need to keep track of this at all.
> +	 */
> +	for (u32 i =3D 0; i < last_flag; i++) {
> +		if (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL)

I'll get rid of this check when applying, as suggested by Steve. Steve,
with this modification do you want me to add your R-b?

BTW, I've also fixed a bunch of checkpatch errors/warnings, so you
might want to run checkpatch --strict next time.

> +			min_profiled_job_instrs =3D
> +				min(min_profiled_job_instrs, calc_job_credits(BIT(i)));
> +	}
> +
> +	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u=
64));
> +}
