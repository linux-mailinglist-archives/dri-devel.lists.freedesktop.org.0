Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59BC9F331B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 15:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2AC10E192;
	Mon, 16 Dec 2024 14:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D12D310E192
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 14:25:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50E7816A3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 06:25:48 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E9BC3F58B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 06:25:19 -0800 (PST)
Date: Mon, 16 Dec 2024 14:25:10 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
Message-ID: <Z2A4RjVe8gPWpRua@e110455-lin.cambridge.arm.com>
References: <20241211163436.381069-1-adrian.larumbe@collabora.com>
 <20241211163436.381069-3-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211163436.381069-3-adrian.larumbe@collabora.com>
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

On Wed, Dec 11, 2024 at 04:34:32PM +0000, Adrián Larumbe wrote:
> A previous commit enabled display of driver-internal kernel BO sizes
> through the device file's fdinfo interface.
> 
> Expand the description of the relevant driver-specific key:value pairs
> with the definitions of the new drm-*-internal ones.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  Documentation/gpu/panthor.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> index 3f8979fa2b86..c6d8236e3665 100644
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
> +Possible `drm-*-internal` key names are: `total`, `active` and `resident`.

I think Mihail's comment stands. There is no harm in being thorough, so either
we list `shared` as a possible key name, or we remove it from the example and
re-introduce it later with a patch.

> +These values convey the sizes of the internal driver-owned shmem BO's that
> +aren't exposed to user-space through a DRM handle, like queue ring buffers,
> +sync object arrays and heap chunks. Because they are all allocated and pinned
> +at creation time, `drm-resident-internal` and `drm-total-internal` should always
> +be equal. `drm-active-internal` shows the size of kernel BO's associated with
> +VM's and groups currently being scheduled for execution by the GPU.
> +`drm-shared-memory` is unused at present, but in the future it might stand for
> +the size of the Firmware regions, since they do not belong to an open file context.

But there are firmware regions that are per context, like the save/restore buffers.
Also, I think we are creating confusion there between drm-shared-memory and
drm-shared-internal. I'm fine with having a note here regarding `drm-shared-memory`
as long as `drm-shared-internal` also gets a note to explain the difference with its
cousin.

Best regards,
Liviu

> -- 
> 2.47.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
