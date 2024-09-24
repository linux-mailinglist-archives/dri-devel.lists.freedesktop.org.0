Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF19984EF8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C1310E02F;
	Tue, 24 Sep 2024 23:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RZfbnLFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E68A10E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lVGrogRJ5/ibcpWwrkJ/fDzsxfjOA/jAdbQFGrsRUhY=; b=RZfbnLFFxJseapl1lA5GOGuQeS
 4tCdJlwJj9QF4RA7OpSV4wQvP/Nz4ZhBAujIm6eEf4Ces5PlkFsVetY66Oz18Aj4CfI2lDY9vBTAb
 B7xo34nyZ65URY5P6pt4vjUiSpwJnBxR3oFd7S7H/o95+FCXEwx2BB97QPHndrmN0GKJhexBzrhg3
 PRgQ42zCNXknhCNvkaBqiBGvh0tUJDxq4tokkf9/fNSkUne5JSlIqzD7/vij5viULc81dvMUZu5W7
 pA8VXoxUvWz9SawJn9jvIRKnXzPs9E0xbMnhRajkqhGxczBD16eFN+x7HBTadF7eo/nfx7aFezBsL
 lJ0jzO5w==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1stEwt-000eWD-P6; Wed, 25 Sep 2024 01:28:04 +0200
Message-ID: <5fc3e586-cc8d-4ee5-ad1a-23740d1075a1@igalia.com>
Date: Tue, 24 Sep 2024 20:27:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Use v3d_perfmon_find(..)
To: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Christian Gmeiner <cgmeiner@igalia.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
References: <20240923152000.185980-1-christian.gmeiner@gmail.com>
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
In-Reply-To: <20240923152000.185980-1-christian.gmeiner@gmail.com>
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

On 9/23/24 12:19, Christian Gmeiner wrote:
> From: Christian Gmeiner <cgmeiner@igalia.com>
> 
> Replace the open coded v3d_perfmon_find(..) with the real
> thing.
> 
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>

Thanks for your patch!

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Applied to misc/kernel.git (drm-misc-next).

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_perfmon.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
> index cd7f1eedf17f..54a486a9b74c 100644
> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -402,11 +402,7 @@ int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
>   	if (req->pad != 0)
>   		return -EINVAL;
>   
> -	mutex_lock(&v3d_priv->perfmon.lock);
> -	perfmon = idr_find(&v3d_priv->perfmon.idr, req->id);
> -	v3d_perfmon_get(perfmon);
> -	mutex_unlock(&v3d_priv->perfmon.lock);
> -
> +	perfmon = v3d_perfmon_find(v3d_priv, req->id);
>   	if (!perfmon)
>   		return -EINVAL;
>   
