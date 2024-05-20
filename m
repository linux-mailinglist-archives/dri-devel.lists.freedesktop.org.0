Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9268CA347
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 22:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975E710E34F;
	Mon, 20 May 2024 20:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qb532Q9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B5410E34F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XgDVVUu+nAN6hYZvRUbZ0CkCbrdA5o4uziiYzHdvenk=; b=qb532Q9PvfNrNd+pMs1kmmICvP
 QdZ8SJvSCNL7OF5OGuXefHVU8/ITVnJth+OWUqwcP3088h0Fzjpl0grXeX/G3BDA+HGJSO8SEwcEC
 Hoem+nZsG45h5isTGZc4TeojKi51sZH4d40Ux8meH3S+k0FPGs1CpWwooc49xn4gleORuiRDXa3kc
 OR3JgGxOK1Sq4Th8dwoi9e7PZKjt5aclY6MMliSupUrhTM7bHvaNyqKPLlH472bmHTV+wOXSMFvC9
 288XShnMd0g7eJE7I/xanZh6d+hbLt6m+dzHYYs1bCqfCKz74p25QgkhGqNxU57gnZE/OdZuM8q3A
 6vkQYGGg==;
Received: from [179.234.232.152] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s99db-00ANKc-7D; Mon, 20 May 2024 22:29:39 +0200
Message-ID: <8702e7f7-0f3f-4ee6-b2f3-e44217dbed36@igalia.com>
Date: Mon, 20 May 2024 17:29:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] drm/v3d: Improve Performance Counters handling
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 =?UTF-8?Q?Juan_A_=2E_Su=C3=A1rez?= <jasuarez@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240512222655.2792754-1-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240512222655.2792754-1-mcanal@igalia.com>
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

On 5/12/24 19:23, Maíra Canal wrote:>
> Maíra Canal (6):
>    drm/v3d: Add Performance Counters descriptions for V3D 4.2 and 7.1
>    drm/v3d: Different V3D versions can have different number of perfcnt
>    drm/v3d: Create a new V3D parameter for the maximum number of perfcnt
>    drm/v3d: Create new IOCTL to expose performance counters information
>    drm/v3d: Use V3D_MAX_COUNTERS instead of V3D_PERFCNT_NUM
>    drm/v3d: Deprecate the use of the Performance Counters enum >
>   drivers/gpu/drm/v3d/v3d_drv.c                 |  11 +
>   drivers/gpu/drm/v3d/v3d_drv.h                 |  14 +-
>   drivers/gpu/drm/v3d/v3d_perfmon.c             |  36 ++-
>   .../gpu/drm/v3d/v3d_performance_counters.h    | 208 ++++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_sched.c               |   2 +-
>   include/uapi/drm/v3d_drm.h                    |  48 ++++
>   6 files changed, 316 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/v3d/v3d_performance_counters.h
> 

Applied to drm-misc/drm-misc-next!

Best Regards,
- Maíra
