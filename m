Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E045F89CFFB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 03:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B30112A0F;
	Tue,  9 Apr 2024 01:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Qx1hPnXd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE04112A0F;
 Tue,  9 Apr 2024 01:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K3W57waH2wt/4k9KQXrCvtsTMHC/sRQFgi4Ey4VUSR8=; b=Qx1hPnXdl02Q586CwHKTy9SKj+
 Ug6wJPzHeRqu4vC8dREH/xXUdrfkDzJn1YWO2c3yDz3YY9w3APVNxZ2RtX0mv8c1nP5Y5g9hTXfTq
 7jDitgPmet1Ts+pFnrJ8oUMb38e0ECVYXQn7qs9tIEl6HTh+E4xdR69q0iwGGruDM7hQ5dbZs/CFk
 ax4AYPhSA4dxz6u3a6Be02LxijZ0KipO4zt5Ww+Z7KGJwi6p3Gmllwc7txR9RSOvlMxli2vD+0FD4
 aFi5X6mhFZtW5Nkn0441ytTHQAqYJLpWZKCydDMpD13YheXMKXa4yPYIspQVp1Qnsb8ZSGCg2TRvX
 xaL92vIA==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ru0Ya-002hx1-SQ; Tue, 09 Apr 2024 03:45:53 +0200
Message-ID: <589ba372-0a5f-4e82-847c-e3b952cf5647@igalia.com>
Date: Mon, 8 Apr 2024 22:45:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/vkms: Use drm_crtc_vblank_crtc()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
 <20240408190611.24914-5-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20240408190611.24914-5-ville.syrjala@linux.intel.com>
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

On 4/8/24 16:06, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Replace the open coded drm_crtc_vblank_crtc() with the real
> thing.
> 
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: "Maíra Canal" <mairacanal@riseup.net>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_crtc.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 61e500b8c9da..40b4d084e3ce 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -61,9 +61,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>   
>   static int vkms_enable_vblank(struct drm_crtc *crtc)
>   {
> -	struct drm_device *dev = crtc->dev;
> -	unsigned int pipe = drm_crtc_index(crtc);
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>   	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>   
>   	drm_calc_timestamping_constants(crtc, &crtc->mode);
> @@ -88,10 +86,9 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>   				      bool in_vblank_irq)
>   {
>   	struct drm_device *dev = crtc->dev;
> -	unsigned int pipe = crtc->index;
>   	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>   	struct vkms_output *output = &vkmsdev->output;
> -	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>   
>   	if (!READ_ONCE(vblank->enabled)) {
>   		*vblank_time = ktime_get();
