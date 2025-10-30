Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC31C1EF16
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D44A10E251;
	Thu, 30 Oct 2025 08:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E17WCylw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zd1s1Dn2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E17WCylw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zd1s1Dn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C345810E251
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:19:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 748E8337BD;
 Thu, 30 Oct 2025 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761812351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5JINUefxFB4/fBFCxJryM4mP5zVpRyjTZwfdQqWpcqE=;
 b=E17WCylwfLZTQfR9vF7jji8RDAw66nuQIr7PmrMJPslBFJFGHwsak0w1rNj+OPxn4BJYdN
 SiALPKUAwLi2ejHbWztUQrTGjf2X/XXqOCEfB59maSA0ACkOrl2BC5EEKYw2lK0pRWjwVS
 iR58yxNW0lV3+EM69bljpb5CGeYg7QY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761812351;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5JINUefxFB4/fBFCxJryM4mP5zVpRyjTZwfdQqWpcqE=;
 b=zd1s1Dn28Bmuk4RXxdk6GG4SMXxpWTyKSpN0Y2SOPjhRh47Jsm8ahb+5i+8NRX2CvSAdtU
 2xXY59DxKAVCaPBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761812351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5JINUefxFB4/fBFCxJryM4mP5zVpRyjTZwfdQqWpcqE=;
 b=E17WCylwfLZTQfR9vF7jji8RDAw66nuQIr7PmrMJPslBFJFGHwsak0w1rNj+OPxn4BJYdN
 SiALPKUAwLi2ejHbWztUQrTGjf2X/XXqOCEfB59maSA0ACkOrl2BC5EEKYw2lK0pRWjwVS
 iR58yxNW0lV3+EM69bljpb5CGeYg7QY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761812351;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5JINUefxFB4/fBFCxJryM4mP5zVpRyjTZwfdQqWpcqE=;
 b=zd1s1Dn28Bmuk4RXxdk6GG4SMXxpWTyKSpN0Y2SOPjhRh47Jsm8ahb+5i+8NRX2CvSAdtU
 2xXY59DxKAVCaPBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58FA913393;
 Thu, 30 Oct 2025 08:19:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id du0UFX8fA2nmLAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Oct 2025 08:19:11 +0000
Message-ID: <3f408516-adeb-4c09-9c70-419db59b8605@suse.de>
Date: Thu, 30 Oct 2025 09:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
 external sync
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251027095550.110562-1-tzimmermann@suse.de>
 <1e4a29e7-bf98-4193-962a-66fd251e2c72@collabora.com>
 <IA0PR11MB718584C85B844B3ED6115858F8FAA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <IA0PR11MB718584C85B844B3ED6115858F8FAA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; TO_DN_EQ_ADDR_SOME(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, collabora.com:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
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

Hi Vivek

Am 29.10.25 um 06:47 schrieb Kasireddy, Vivek:
> Hi Thomas, Dmitry,
>
>> Subject: Re: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
>> external sync
>>
>> On 10/27/25 12:52, Thomas Zimmermann wrote:
>>> For each plane, store the buffer object's sync status in the state
>>> of the plane's respective CRTC. During the CRTC's atomic flush,
>>> ignore the vblank timer if any of the CRTC's plane's buffer object
>>> is synchronized to an external source. Instead send the vblank event
>>> immediately. Avoids corner cases where a vblank event happens too
>>> late for the next frame to be page flipped in time.
>>>
>>> Exporters of GEM objects sometimes interfere with the vblank timer;
>>> resulting in framerate drops. Hence detect this case and handle it
>>> as outlined above.
>>>
>>> The vblank timer is still active and fires in regular intervals
>>> according to the guest display refresh. This rate limits clients
>>> that only wait for the next vblank to occur, such as fbcon. These
>>> clients would otherwise produce a very high number of frames per
>>> second.
>>>
>>> v4:
>>> - only handle imported GEM buffer objects (Dmitri, Vivek)
>>> - fix test for plane visibility (Vivek)
>>> - always enable vblank timer to make waiting clients happy
>>> v3:
>>> - disable vblank unconditionally
>>> - compute status on each commit
>>> v2:
>>> - enable/disable vblank timer according to buffer setup
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>> This patch was previously called "drm/virtgpu: Make vblank event
>>> dependent on the host resource". Earlier versions where meant for
>>> testing, rather than being merged. See [1] for a discussion of when
>>> the fixed problem happens.
>>>
>>> [1] https://lore.kernel.org/dri-devel/20251016145230.79270-1-
>>> tzimmermann@suse.de/
>>> ---
>>>   drivers/gpu/drm/virtio/virtgpu_display.c | 67 ++++++++++++++++++++++--
>>>   drivers/gpu/drm/virtio/virtgpu_drv.h     | 15 ++++++
>>>   drivers/gpu/drm/virtio/virtgpu_plane.c   | 28 +++++++++-
>>>   3 files changed, 104 insertions(+), 6 deletions(-)
>> No problems spotted. I'd only extended comment in the code explicitly
>> stating that drm_gem_is_imported() is the workaround, might edit it on
>> applying. Will wait for Vivek's feedback. Thanks.
> I applied this patch and tested 3 different scenarios:
> 1) blob=true + imported buffers
> root@localhost:weston_upstream/weston# ./build/clients/weston-simple-egl -o &
> Using config: r8g8b8a0
> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> has EGL_EXT_surface_compression
> 245 frames in 5 seconds: 49.000000 fps
> 236 frames in 5 seconds: 47.200001 fps
> 279 frames in 5 seconds: 55.799999 fps
> 240 frames in 5 seconds: 48.000000 fps
> 244 frames in 5 seconds: 48.799999 fps
> 283 frames in 5 seconds: 56.599998 fps
> 274 frames in 5 seconds: 54.799999 fps
>
> 2) blob=true
> root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-egl -o &
> Using config: r8g8b8a0
> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> has EGL_EXT_surface_compression
> 167 frames in 5 seconds: 33.400002 fps
> 208 frames in 5 seconds: 41.599998 fps
> 203 frames in 5 seconds: 40.599998 fps
> 252 frames in 5 seconds: 50.400002 fps
> 180 frames in 5 seconds: 36.000000 fps
> 219 frames in 5 seconds: 43.799999 fps
> 176 frames in 5 seconds: 35.200001 fps
> 220 frames in 5 seconds: 44.000000 fps
>
> 3) blob=false
> root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-egl -o &
> [1] 1137
> Using config: r8g8b8a0
> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> has EGL_EXT_surface_compression
> 285 frames in 5 seconds: 57.000000 fps
> 291 frames in 5 seconds: 58.200001 fps
> 290 frames in 5 seconds: 58.000000 fps
> 297 frames in 5 seconds: 59.400002 fps
> 291 frames in 5 seconds: 58.200001 fps
> 292 frames in 5 seconds: 58.400002 fps
>
> The problem in the first 2 cases above is that as long as blob=true, the vblank timer
> is not helpful as we would be over-synchronizing. Note that even in the second
> case, if blob=true, then even dumb BOs would satisfy bo->guest_blob condition.
>
> So, I added the following changes to Thomas' patch and can now achieve FPS >= 58
> in all 3 cases above:

Thanks for testing. These changes mostly revert the patch back to an 
older rev. Let's merge this then to make progress with this bug. I'll 
send you an update soon.

Best regards
Thomas

> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index a4fa948023da..10c4a16a3908 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -159,7 +159,10 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
>   static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
>                                            struct drm_atomic_state *state)
>   {
> -       drm_crtc_vblank_on(crtc);
> +       struct virtio_gpu_crtc_state *vgcrtc_state = to_virtio_gpu_crtc_state(crtc->state);
> +
> +       if (!virtio_gpu_crtc_state_send_event_on_flush(vgcrtc_state))
> +               drm_crtc_vblank_on(crtc);
>   }
>
>   static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index 634e1a930783..8381892e6d4e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -99,6 +99,8 @@ static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
>   static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
>                                           struct drm_atomic_state *state)
>   {
> +       struct drm_device *dev = plane->dev;
> +       struct virtio_gpu_device *vgdev = dev->dev_private;
>          struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>                                                                                   plane);
>          struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
> @@ -138,13 +140,14 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
>
>          for (i = 0; i < new_plane_state->fb->format->num_planes; ++i) {
>                  struct drm_gem_object *obj = drm_gem_fb_get_obj(new_plane_state->fb, i);
> +               struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>
>                  /*
>                   * Exporters of GEM buffer objects sometimes interfere with the
>                   * vblank timer. Mark the plane as externally synchronized if we
>                   * find an imported GEM buffer object.
>                   */
> -               if (drm_gem_is_imported(obj)) {
> +               if (bo->guest_blob && !vgdev->has_virgl_3d) {
>                          vgcrtc_state->plane_synced_to_ext |= drm_plane_mask(plane);
>                          break; /* only need to find one */
>
> For testing the 3 cases, I ran Gnome Wayland like this:
> XDG_SESSION_TYPE=wayland dbus-run-session -- ./bin/gnome-shell --wayland --no-x11 &
>
> and here are the relevant options for Qemu cmd line I tested with:
> ./qemu-system-x86_64 -m 4096m
>   -device virtio-gpu,max_outputs=1,xres=1920,yres=1080,blob=true
> -display gtk,gl=on
> -object memory-backend-memfd,id=mem1,size=4096M
> -machine q35,accel=kvm,memory-backend=mem1 -usb -device usb-tablet -serial stdio
>
> Thanks,
> Vivek
>
>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>
>> --
>> Best regards,
>> Dmitry

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


