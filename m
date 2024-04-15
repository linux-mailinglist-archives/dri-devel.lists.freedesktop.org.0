Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0448A598D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 20:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4313411275B;
	Mon, 15 Apr 2024 18:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YgnrA7OX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0304211275B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 18:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VxQV32SErcW04hsTDpPMBvJua+GrBtQavgUbw02gOuY=; b=YgnrA7OXq3iypHdFYvSLVpgF9P
 twDIOmCHN8pd801Te8ZAQ4XgO2kLXqwd4K0Pcnh7ni1HiwSW27Ipxh2IqbCUb581e45T6zmf3SWBC
 66TfBqgLO976i0xrckHIUoIL8rUTzJUqJjvZV7OWqwOf5uLgJ5wZbqgSqJtGNltC6a2ltiTDmgqO1
 wEw21GBQmtd6RS4UyBXZjbnU17RPyCIoAvASSt62Nz/Zl54nueVNIl8N5h7I8jcc4dE5NATaD3wQJ
 K5mqWoD0Nvt+mUpDQvgmQTKAvamIZt+G9zdOPi3xHgFpxQG4NzqFZGiteQVG0T/ghaAIcMYkmRCWR
 OoeoBySQ==;
Received: from [177.34.169.177] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwQhR-004rB5-DE; Mon, 15 Apr 2024 20:05:01 +0200
Message-ID: <9ee7005b-d7cd-4986-bf35-3dbae9395392@igalia.com>
Date: Mon, 15 Apr 2024 15:04:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/v3d: Don't increment `enabled_ns` twice
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240403203517.731876-1-mcanal@igalia.com>
 <20240403203517.731876-2-mcanal@igalia.com>
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
In-Reply-To: <20240403203517.731876-2-mcanal@igalia.com>
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

On 4/3/24 17:24, Maíra Canal wrote:
> The commit 509433d8146c ("drm/v3d: Expose the total GPU usage stats on sysfs")
> introduced the calculation of global GPU stats. For the regards, it used
> the already existing infrastructure provided by commit 09a93cc4f7d1 ("drm/v3d:
> Implement show_fdinfo() callback for GPU usage stats"). While adding
> global GPU stats calculation ability, the author forgot to delete the
> existing one.
> 
> Currently, the value of `enabled_ns` is incremented twice by the end of
> the job, when it should be added just once. Therefore, delete the
> leftovers from commit 509433d8146c ("drm/v3d: Expose the total GPU usage
> stats on sysfs").
> 
> Fixes: 509433d8146c ("drm/v3d: Expose the total GPU usage stats on sysfs")
> Reported-by: Tvrtko Ursulin <tursulin@igalia.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

As this patch is a isolated bugfix and it was reviewed by two
developers, I'm applying it to drm-misc/drm-misc-fixes.

I'll address the feedback for the rest of the series later and send a
v2.

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_irq.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index 2e04f6cb661e..ce6b2fb341d1 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -105,7 +105,6 @@ v3d_irq(int irq, void *arg)
>   		struct v3d_file_priv *file = v3d->bin_job->base.file->driver_priv;
>   		u64 runtime = local_clock() - file->start_ns[V3D_BIN];
>   
> -		file->enabled_ns[V3D_BIN] += local_clock() - file->start_ns[V3D_BIN];
>   		file->jobs_sent[V3D_BIN]++;
>   		v3d->queue[V3D_BIN].jobs_sent++;
>   
> @@ -126,7 +125,6 @@ v3d_irq(int irq, void *arg)
>   		struct v3d_file_priv *file = v3d->render_job->base.file->driver_priv;
>   		u64 runtime = local_clock() - file->start_ns[V3D_RENDER];
>   
> -		file->enabled_ns[V3D_RENDER] += local_clock() - file->start_ns[V3D_RENDER];
>   		file->jobs_sent[V3D_RENDER]++;
>   		v3d->queue[V3D_RENDER].jobs_sent++;
>   
> @@ -147,7 +145,6 @@ v3d_irq(int irq, void *arg)
>   		struct v3d_file_priv *file = v3d->csd_job->base.file->driver_priv;
>   		u64 runtime = local_clock() - file->start_ns[V3D_CSD];
>   
> -		file->enabled_ns[V3D_CSD] += local_clock() - file->start_ns[V3D_CSD];
>   		file->jobs_sent[V3D_CSD]++;
>   		v3d->queue[V3D_CSD].jobs_sent++;
>   
> @@ -195,7 +192,6 @@ v3d_hub_irq(int irq, void *arg)
>   		struct v3d_file_priv *file = v3d->tfu_job->base.file->driver_priv;
>   		u64 runtime = local_clock() - file->start_ns[V3D_TFU];
>   
> -		file->enabled_ns[V3D_TFU] += local_clock() - file->start_ns[V3D_TFU];
>   		file->jobs_sent[V3D_TFU]++;
>   		v3d->queue[V3D_TFU].jobs_sent++;
>   
