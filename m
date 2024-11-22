Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D229A9D5E81
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 13:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8C410E178;
	Fri, 22 Nov 2024 11:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HtnHBx3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6659410E178
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o8WeUfkNhuU0xebIZYnnpfdPy1pYAgywRjfJ3vGwYgk=; b=HtnHBx3e6l+svFqC2GJZCgVr6b
 F4IQLw9wKNnWVVWnWHq2Bt+/UYpnu47b6Xr2Y2Pv5n9/I14omt526ZAHefefR32bR52texkq6IqRj
 Svreeer6Dz1JzD6jbPp/pJVbZgEf3RPOb8Bv3Z55FxYwFJozdLGw/igKT/1rQdwBp1wB2JViEcip8
 eqVssdOaXdbR1OytUowUc/Eq9b564xRa2kM3CjzrU2nN8kTc6AGFiQ5sjWxiu+1OE3af5nG77ypkm
 yCNCvXzDukboVxIj0Jl7eEVEnwNyylqd2zOlF3k0JY4ZaPHx1dlf6jAcRb3eH9tfm7xRuPh0elinJ
 Bmz7r6Gg==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tESKB-00AvjT-G3; Fri, 22 Nov 2024 12:59:47 +0100
Message-ID: <c00c6436-8abf-4b8d-a5a1-dfcab45b6f7d@igalia.com>
Date: Fri, 22 Nov 2024 08:59:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Stop active perfmon if it is being destroyed
To: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Juan A. Suarez Romero" <jasuarez@igalia.com>
Cc: kernel-dev@igalia.com, Christian Gmeiner <cgmeiner@igalia.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241118221948.1758130-1-christian.gmeiner@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20241118221948.1758130-1-christian.gmeiner@gmail.com>
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

Hi Christian,

On 18/11/24 19:19, Christian Gmeiner wrote:
> From: Christian Gmeiner <cgmeiner@igalia.com>
> 
> If the active performance monitor (v3d->active_perfmon) is being
> destroyed, stop it first. Currently, the active perfmon is not
> stopped during destruction, leaving the v3d->active_perfmon pointer
> stale. This can lead to undefined behavior and instability.
> 
> This patch ensures that the active perfmon is stopped before being
> destroyed, aligning with the behavior introduced in commit
> 7d1fd3638ee3 ("drm/v3d: Stop the active perfmon before being destroyed").
> 
> Cc: stable@vger.kernel.org # v5.15+
> Fixes: 26a4dc29b74a ("drm/v3d: Expose performance counters to userspace")
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>

Applied to misc/kernel.git (drm-misc-next).

Maxime, Thomas, if possible, could you cherry-pick this commit to be 
included in 6.13? Thanks!

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_perfmon.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
> index 00cd081d7873..909288d43f2f 100644
> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -383,6 +383,7 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
>   	struct drm_v3d_perfmon_destroy *req = data;
> +	struct v3d_dev *v3d = v3d_priv->v3d;
>   	struct v3d_perfmon *perfmon;
>   
>   	mutex_lock(&v3d_priv->perfmon.lock);
> @@ -392,6 +393,10 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
>   	if (!perfmon)
>   		return -EINVAL;
>   
> +	/* If the active perfmon is being destroyed, stop it first */
> +	if (perfmon == v3d->active_perfmon)
> +		v3d_perfmon_stop(v3d, perfmon, false);
> +
>   	v3d_perfmon_put(perfmon);
>   
>   	return 0;

