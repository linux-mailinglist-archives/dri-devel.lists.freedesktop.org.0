Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBE7854AC3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 14:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6393C10E275;
	Wed, 14 Feb 2024 13:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5DEB410E275
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 13:52:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F77B1FB;
 Wed, 14 Feb 2024 05:52:45 -0800 (PST)
Received: from [10.57.64.191] (unknown [10.57.64.191])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8B7A3F5A1;
 Wed, 14 Feb 2024 05:52:02 -0800 (PST)
Message-ID: <ba987da3-b4aa-410c-95ae-434e94793d85@arm.com>
Date: Wed, 14 Feb 2024 13:52:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Always record job cycle and timestamp information
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240214121435.3813983-1-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240214121435.3813983-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Adrián,

On 14/02/2024 12:14, Adrián Larumbe wrote:
> A driver user expressed interest in being able to access engine usage stats
> through fdinfo when debugfs is not built into their kernel. In the current
> implementation, this wasn't possible, because it was assumed even for
> inflight jobs enabling the cycle counter and timestamp registers would
> incur in additional power consumption, so both were kept disabled until
> toggled through debugfs.
> 
> A second read of the TRM made me think otherwise, but this is something
> that would be best clarified by someone from ARM's side.

I'm afraid I can't give a definitive answer. This will probably vary
depending on implementation. The command register enables/disables
"propagation" of the cycle/timestamp values. This propagation will cost
some power (gates are getting toggled) but whether that power is
completely in the noise of the GPU as a whole I can't say.

The out-of-tree kbase driver only enables the counters for jobs
explicitly marked (BASE_JD_REQ_PERMON) or due to an explicit connection
from a profiler.

I'd be happier moving the debugfs file to sysfs rather than assuming
that the power consumption is small enough for all platforms.

Ideally we'd have some sort of kernel interface for a profiler to inform
the kernel what it is interested in, but I can't immediately see how to
make that useful across different drivers. kbase's profiling support is
great with our profiling tools, but there's a very strong connection
between the two.

Steve

> Adrián Larumbe (1):
>   drm/panfrost: Always record job cycle and timestamp information
> 
>  drivers/gpu/drm/panfrost/Makefile           |  2 --
>  drivers/gpu/drm/panfrost/panfrost_debugfs.c | 21 ------------------
>  drivers/gpu/drm/panfrost/panfrost_debugfs.h | 14 ------------
>  drivers/gpu/drm/panfrost/panfrost_device.h  |  1 -
>  drivers/gpu/drm/panfrost/panfrost_drv.c     |  5 -----
>  drivers/gpu/drm/panfrost/panfrost_job.c     | 24 ++++++++-------------
>  drivers/gpu/drm/panfrost/panfrost_job.h     |  1 -
>  7 files changed, 9 insertions(+), 59 deletions(-)
>  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
>  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
> 
> 
> base-commit: 6b1f93ea345947c94bf3a7a6e668a2acfd310918

