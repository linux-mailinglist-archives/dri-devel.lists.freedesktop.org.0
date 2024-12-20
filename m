Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E5A9F90FD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 12:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5F210EF8C;
	Fri, 20 Dec 2024 11:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8680510EF8C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:13:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AD381480;
 Fri, 20 Dec 2024 03:14:04 -0800 (PST)
Received: from [10.1.31.19] (e122027.cambridge.arm.com [10.1.31.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFB4F3F58B;
 Fri, 20 Dec 2024 03:13:33 -0800 (PST)
Message-ID: <486e5467-d7fd-41a2-bd80-85afb53d141f@arm.com>
Date: Fri, 20 Dec 2024 11:13:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
To: =?UTF-8?Q?Adri=C3=A1n_Mart=C3=ADnez_Larumbe?=
 <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mihail Atanassov <mihail.atanassov@arm.com>
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
 <20241218181844.886043-3-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241218181844.886043-3-adrian.larumbe@collabora.com>
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

On 18/12/2024 18:18, Adrián Martínez Larumbe wrote:
> From: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> A previous commit enabled display of driver-internal kernel BO sizes
> through the device file's fdinfo interface.
> 
> Expand the description of the relevant driver-specific key:value pairs
> with the definitions of the new drm-*-internal ones.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  Documentation/gpu/panthor.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> index 3f8979fa2b86..23aa3d67c9d2 100644
> --- a/Documentation/gpu/panthor.rst
> +++ b/Documentation/gpu/panthor.rst
> @@ -26,6 +26,10 @@ the currently possible format options:
>       drm-cycles-panthor:     94439687187
>       drm-maxfreq-panthor:    1000000000 Hz
>       drm-curfreq-panthor:    1000000000 Hz
> +     drm-total-internal:     10396 KiB
> +     drm-shared-internal:    0
> +     drm-active-internal:    10396 KiB
> +     drm-resident-internal:  10396 KiB
>       drm-total-memory:       16480 KiB
>       drm-shared-memory:      0
>       drm-active-memory:      16200 KiB
> @@ -44,3 +48,13 @@ driver by writing into the appropriate sysfs node::
>  
>  Where `N` is a bit mask where cycle and timestamp sampling are respectively
>  enabled by the first and second bits.
> +
> +Possible `drm-*-internal` keys are: `total`, `active`, `resident` and `shared`.
> +These values convey the sizes of the internal driver-owned shmem BO's that
> +aren't exposed to user-space through a DRM handle, like queue ring buffers,
> +sync object arrays and heap chunks. Because they are all allocated and pinned
> +at creation time, `drm-resident-internal` and `drm-total-internal` should always
> +be equal. `drm-active-internal` shows the size of kernel BO's associated with
> +VM's and groups currently being scheduled for execution by the GPU.
> +`drm-shared-internal` is unused at present, but in the future it might stand for
> +the size of executable FW regions, since they do not belong to an open file context.

