Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268417CC515
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 15:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A66610E2FC;
	Tue, 17 Oct 2023 13:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD8310E120;
 Tue, 17 Oct 2023 13:47:20 +0000 (UTC)
Received: from [192.168.68.129] (unknown [177.157.225.233])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0158C6600B9D;
 Tue, 17 Oct 2023 14:47:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697550438;
 bh=jCVW1RR4PJJtpiEVfWsrTAQK/lcdPg1UkhJKpgu/4+A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UxN9OL7/sS9vJgrxc2JLoiBY8cEN0o1m5R78XcQeZRj0WbRn6Jviw2jolN4i1LGX+
 xt5Oj1jW6bskn6i+EjjkhTHzDp0QP7sAY7HF4jilyl5gb8qsufpRo8yb4xmDdLMlwc
 m9sOh+/ynseJg01TKZWZkcJAspW9NrwbIK2PNvX/I1ouP3qJB6xmcUO9ygVEvMhlp5
 Y0ZhZfb2LnbUNDJ/EJQ6BbOLJPyMRImkdDrAUy09y+iz32Ty9oisrK3TTFFIgcczpK
 NjNWQb9TlKBOHodGZCpmnEjY3vTzwpBnQvjj4ylE0Jc3ToWv6u6vqTRYKHyVEpAW7p
 rJnOllZ4+LE+w==
Message-ID: <d724ea14-bd35-4f02-88c2-f691691b0376@collabora.com>
Date: Tue, 17 Oct 2023 10:47:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] drm: Add support for atomic async page-flip
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231017092837.32428-1-andrealmeid@igalia.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231017092837.32428-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, hwentlan@amd.com,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17/10/2023 06:28, André Almeida wrote:
> Hi,
> 
> This work from me and Simon adds support for DRM_MODE_PAGE_FLIP_ASYNC through
> the atomic API. This feature is already available via the legacy API. The use
> case is to be able to present a new frame immediately (or as soon as
> possible), even if after missing a vblank. This might result in tearing, but
> it's useful when a high framerate is desired, such as for gaming.
> 
> Differently from earlier versions, this one refuses to flip if any prop changes
> for async flips. The idea is that the fast path of immediate page flips doesn't
> play well with modeset changes, so only the fb_id can be changed.
> Thanks,
> 	André
> 
> - User-space patch: https://github.com/Plagman/gamescope/pull/595
> - IGT tests: https://gitlab.freedesktop.org/andrealmeid/igt-gpu-tools/-/tree/atomic_async_page_flip
> 
> Changes from v6:
> - Dropped the exception to allow MODE_ID changes (Simon)
> - Clarify what happens when flipping with the same FB_ID (Pekka)
> 
> v6: https://lore.kernel.org/dri-devel/20230815185710.159779-1-andrealmeid@igalia.com/
> 
> Changes from v5:
> - Add note in the docs that not every redundant attribute will result in no-op,
>    some might cause oversynchronization issues.
> 
> v5: https://lore.kernel.org/dri-devel/20230707224059.305474-1-andrealmeid@igalia.com/
> 
> Changes from v4:
>   - Documentation rewrote by Pekka Paalanen
> 
> v4: https://lore.kernel.org/dri-devel/20230701020917.143394-1-andrealmeid@igalia.com/
> 
> Changes from v3:
>   - Add new patch to reject prop changes
>   - Add a documentation clarifying the KMS atomic state set
> 
> v3: https://lore.kernel.org/dri-devel/20220929184307.258331-1-contact@emersion.fr/
> 
> André Almeida (1):
>    drm: Refuse to async flip with atomic prop changes
> 
> Pekka Paalanen (1):
>    drm/doc: Define KMS atomic state set
> 
> Simon Ser (4):
>    drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
>    drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
>    drm: introduce drm_mode_config.atomic_async_page_flip_not_supported
>    amd/display: indicate support for atomic async page-flips on DC
> 
>   Documentation/gpu/drm-uapi.rst                | 47 ++++++++++++
>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  1 +
>   drivers/gpu/drm/drm_atomic_uapi.c             | 75 +++++++++++++++++--
>   drivers/gpu/drm/drm_crtc_internal.h           |  2 +-
>   drivers/gpu/drm/drm_ioctl.c                   |  5 ++
>   drivers/gpu/drm/drm_mode_object.c             |  2 +-
>   .../drm/i915/display/intel_display_driver.c   |  1 +
>   drivers/gpu/drm/nouveau/nouveau_display.c     |  1 +
>   include/drm/drm_mode_config.h                 | 11 +++
>   include/uapi/drm/drm.h                        | 10 ++-
>   include/uapi/drm/drm_mode.h                   |  9 +++
>   11 files changed, 155 insertions(+), 9 deletions(-)
> 

Hello o/

Maybe it is not related (since there are a few years I don't work on 
this) but this reminds me of 
https://yhbt.net/lore/all/20190412125827.5877-1-helen.koike@collabora.com/T/

(just sharing for the sake of communication flow)

Regards,
Helen
