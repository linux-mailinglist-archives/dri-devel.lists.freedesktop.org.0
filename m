Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F50BE6F5F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 09:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD6710EB35;
	Fri, 17 Oct 2025 07:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="X6p4m42Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QXt5H5qF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="owp9hZhP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nnI2/ojJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0684A10EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 07:38:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7814B1FD4D;
 Fri, 17 Oct 2025 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760686689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DoF+byEptQdp83rlKC0HOTP/saF4BP5c7CHlPn1YTQ4=;
 b=X6p4m42Yapb4McDGMRmJNW18TOElllUdSj8NR/IlavbJ5Z9XQloDZhwPzUoujvpVyg0J51
 GBTKFD8KQ/c1qLQsex9T9/J5/V+aHnWuKCuTis93X9ZWXG+ndps7E4fK3fHmWa6aLcwcSy
 Tk8/COflHVPTou3P8kJyqqM3DlBV8z4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760686689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DoF+byEptQdp83rlKC0HOTP/saF4BP5c7CHlPn1YTQ4=;
 b=QXt5H5qF3OTqZx6N9oLvDh3VIFsZ7mqQl/w7/2gDrX2bys6wrJYKVxLIKebVPXlGqXswJf
 xgH0x+q8QLy89ICQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=owp9hZhP;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="nnI2/ojJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760686688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DoF+byEptQdp83rlKC0HOTP/saF4BP5c7CHlPn1YTQ4=;
 b=owp9hZhPU3fOZ040vrwg/n1VY7i+k/zP1yAy3KKx5Pe7el8TOXpqyenR+uxWlpsZI+JxTY
 q8a1MkXs/FwWVwygzEP8uYXFwdsHvH1aPQ8OvjJDBbWNc7dg+xu9uzMTX01yNSX639xvzQ
 HWhYilYCsY0V1C5WyHI3aqjQqcri+N8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760686688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DoF+byEptQdp83rlKC0HOTP/saF4BP5c7CHlPn1YTQ4=;
 b=nnI2/ojJqahF0VwSkdw9bQCdgXFwL1hNK0yoSl7ZoRJs9Iqo+JpDySzlaY8O+we6EwnDmC
 FmXfKGBoyvZMRjDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3818C136C6;
 Fri, 17 Oct 2025 07:38:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4yF6DGDy8Wi1QQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Oct 2025 07:38:08 +0000
Content-Type: multipart/mixed; boundary="------------RG0Pyqn3wopEmyzRi5eCDu0Y"
Message-ID: <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
Date: Fri, 17 Oct 2025 09:38:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
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
In-Reply-To: <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Rspamd-Queue-Id: 7814B1FD4D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.41 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MIME_BASE64_TEXT(0.10)[]; MX_GOOD(-0.01)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+];
 TO_DN_EQ_ADDR_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; HAS_ATTACHMENT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[localhost:email, suse.de:email, suse.de:mid,
 suse.de:dkim, ia0pr11mb7185.na:email, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.41
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

This is a multi-part message in MIME format.
--------------RG0Pyqn3wopEmyzRi5eCDu0Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Am 17.10.25 um 08:03 schrieb Kasireddy, Vivek:
> Hi Thomas,
>
>> Subject: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
>> resource
>>
>> For each plane, store the buffer object's host backing in the state
>> of the plane's respective CRTC. The host synchronizes output of buffer
>> objects with a host resource to its own refresh cycle; thus avoiding
>> tearing. During the CRTC's atomic flush, ignore the vblank timer if
>> any of the CRTC's plane's buffer object has a host resource. Instead
>> send the vblank event immdiatelly. Avoids corner cases where a vblank
>> event happens too late for the next frame to be page flipped in time.
>>
>> The host synchronizes a plane's output to the host repaint cycle if
>> the plane's buffer object has an associated host resource. An atomic
>> commit blocks until the host cycle completes and then arms the vblank
>> event. The guest compositor is thereby synchronized to the host's
>> output rate.
>>
>> To avoid delays, send out the vblank event immediately instead of
>> just arming it. Otherwise the event might be too late to page flip
>> the compositor's next frame.
>>
>> The vblank timer is still active and fires in regular intervals
>> according to the guest display refresh. This rate limits clients
>> that only wait for the next vblank to occur, such as fbcon. These
>> clients would otherwise produce a very high number of frames per
>> second.
>>
>> For commits without host resource, the vblank timer rate-limits the
>> guest output by generating vblank events at the guest display refresh
>> rate as before.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> There was a discussion about interference between vblank timers and
>> the host repaint cycle at [1]. This patch address a possible corner
>> case were the timing gets bad.
>>
>> [1] https://lore.kernel.org/dri-
>> devel/IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.na
>> mprd11.prod.outlook.com/
>> ---
>>   drivers/gpu/drm/virtio/virtgpu_display.c | 72 ++++++++++++++++++++++--
>>   drivers/gpu/drm/virtio/virtgpu_drv.h     | 15 +++++
>>   drivers/gpu/drm/virtio/virtgpu_plane.c   | 16 +++++-
>>   3 files changed, 98 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c
>> b/drivers/gpu/drm/virtio/virtgpu_display.c
>> index e972d9b015a9..43df1fa7d629 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
>> @@ -49,14 +49,76 @@
>>   #define drm_connector_to_virtio_gpu_output(x) \
>>   	container_of(x, struct virtio_gpu_output, conn)
>>
>> +static void virtio_gpu_crtc_state_destroy(struct virtio_gpu_crtc_state
>> *vgcrtc_state)
>> +{
>> +	__drm_atomic_helper_crtc_destroy_state(&vgcrtc_state->base);
>> +
>> +	kfree(vgcrtc_state);
>> +}
>> +
>> +static bool virtio_gpu_crtc_state_send_event_on_flush(struct
>> virtio_gpu_crtc_state *vgcrtc_state)
>> +{
>> +	struct drm_crtc_state *crtc_state = &vgcrtc_state->base;
>> +
>> +	/*
>> +	 * The CRTC's output is vsync'ed if at least one plane's output is
>> +	 * sync'ed to the host refresh.
>> +	 */
>> +	return vgcrtc_state->send_event_on_flush & crtc_state->plane_mask;
>> +}
>> +
>> +static void virtio_gpu_crtc_reset(struct drm_crtc *crtc)
>> +{
>> +	struct virtio_gpu_crtc_state *vgcrtc_state;
>> +
>> +	if (crtc->state)
>> +		virtio_gpu_crtc_state_destroy(to_virtio_gpu_crtc_state(crtc-
>>> state));
>> +
>> +	vgcrtc_state = kzalloc(sizeof(*vgcrtc_state), GFP_KERNEL);
>> +	if (vgcrtc_state) {
>> +		vgcrtc_state->send_event_on_flush = 0ul;
>> +		__drm_atomic_helper_crtc_reset(crtc, &vgcrtc_state->base);
>> +	} else {
>> +		__drm_atomic_helper_crtc_reset(crtc, NULL);
>> +	}
>> +}
>> +
>> +static struct drm_crtc_state *virtio_gpu_crtc_atomic_duplicate_state(struct
>> drm_crtc *crtc)
>> +{
>> +	struct drm_device *dev = crtc->dev;
>> +	struct drm_crtc_state *crtc_state = crtc->state;
>> +	struct virtio_gpu_crtc_state *new_vgcrtc_state;
>> +	struct virtio_gpu_crtc_state *vgcrtc_state;
>> +
>> +	if (drm_WARN_ON(dev, !crtc_state))
>> +		return NULL;
>> +
>> +	new_vgcrtc_state = kzalloc(sizeof(*new_vgcrtc_state), GFP_KERNEL);
>> +	if (!new_vgcrtc_state)
>> +		return NULL;
>> +
>> +	vgcrtc_state = to_virtio_gpu_crtc_state(crtc_state);
>> +
>> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_vgcrtc_state-
>>> base);
>> +	vgcrtc_state->send_event_on_flush = vgcrtc_state-
>>> send_event_on_flush;
>> +
>> +	return &new_vgcrtc_state->base;
>> +}
>> +
>> +static void virtio_gpu_crtc_atomic_destroy_state(struct drm_crtc *crtc,
>> +						 struct drm_crtc_state *crtc_state)
>> +{
>> +	virtio_gpu_crtc_state_destroy(to_virtio_gpu_crtc_state(crtc_state));
>> +}
>> +
>>   static const struct drm_crtc_funcs virtio_gpu_crtc_funcs = {
>>   	.set_config             = drm_atomic_helper_set_config,
>>   	.destroy                = drm_crtc_cleanup,
>>
>>   	.page_flip              = drm_atomic_helper_page_flip,
>> -	.reset                  = drm_atomic_helper_crtc_reset,
>> -	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
>> -	.atomic_destroy_state   = drm_atomic_helper_crtc_destroy_state,
>> +	.reset                  = virtio_gpu_crtc_reset,
>> +	.atomic_duplicate_state = virtio_gpu_crtc_atomic_duplicate_state,
>> +	.atomic_destroy_state   = virtio_gpu_crtc_atomic_destroy_state,
>>   	DRM_CRTC_VBLANK_TIMER_FUNCS,
>>   };
>>
>> @@ -129,7 +191,9 @@ static void virtio_gpu_crtc_atomic_flush(struct
>> drm_crtc *crtc,
>>   {
>>   	struct drm_device *dev = crtc->dev;
>>   	struct drm_crtc_state *crtc_state =
>> drm_atomic_get_new_crtc_state(state, crtc);
>> +	struct virtio_gpu_crtc_state *vgcrtc_state =
>> to_virtio_gpu_crtc_state(crtc_state);
>>   	struct virtio_gpu_output *output =
>> drm_crtc_to_virtio_gpu_output(crtc);
>> +	bool send_event_on_flush =
>> virtio_gpu_crtc_state_send_event_on_flush(vgcrtc_state);
>>   	struct drm_pending_vblank_event *event;
>>
>>   	/*
>> @@ -147,7 +211,7 @@ static void virtio_gpu_crtc_atomic_flush(struct
>> drm_crtc *crtc,
>>   	crtc_state->event = NULL;
>>
>>   	if (event) {
>> -		if (drm_crtc_vblank_get(crtc) == 0)
>> +		if (!send_event_on_flush && drm_crtc_vblank_get(crtc) == 0)
>>   			drm_crtc_arm_vblank_event(crtc, event);
>>   		else
>>   			drm_crtc_send_vblank_event(crtc, event);
> As suspected, before applying this patch, the frame rate was halved:
> root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-egl -o &
> Using config: r8g8b8a0
> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> has EGL_EXT_surface_compression
> 150 frames in 5 seconds: 30.000000 fps
> 149 frames in 5 seconds: 29.799999 fps
> 152 frames in 5 seconds: 30.400000 fps
>
> And, after applying this patch:
> root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-egl -o &
> Using config: r8g8b8a0
> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> has EGL_EXT_surface_compression
> 277 frames in 5 seconds: 55.400002 fps
> 273 frames in 5 seconds: 54.599998 fps
> 298 frames in 5 seconds: 59.599998 fps
> 284 frames in 5 seconds: 56.799999 fps
> 287 frames in 5 seconds: 57.400002 fps
> 272 frames in 5 seconds: 54.400002 fps
> 289 frames in 5 seconds: 57.799999 fps
> 287 frames in 5 seconds: 57.400002 fps
> 289 frames in 5 seconds: 57.799999 fps
> 272 frames in 5 seconds: 54.400002 fps
> 266 frames in 5 seconds: 53.200001 fps
> 261 frames in 5 seconds: 52.200001 fps
> 277 frames in 5 seconds: 55.400002 fps
> 256 frames in 5 seconds: 51.200001 fps
> 179 frames in 5 seconds: 35.799999 fps
> 169 frames in 5 seconds: 33.799999 fps
> 178 frames in 5 seconds: 35.599998 fps
> 211 frames in 5 seconds: 42.200001 fps
> 255 frames in 5 seconds: 51.000000 fps
>
> As you can see, the frame rate/performance improves but it occasionally
> drops into the 30s and 40s, which is a bit concerning because if I revert
> this patch and a036f5fceedb ("drm/virtgpu: Use vblank timer") and test
> again, I do not see this drop.
>
> This suggests that the vblank event is still delayed in some other corner
> cases, which might be challenging to figure out.

There's little difference between the current event handling and the one 
where no vblanks have been set up. I suspect that the vblank timer 
callback interferes with the locking in atomic_flush. That would also 
explain why the fps drop at no clear pattern.

Could you please test the attached patch? It enables/disables the vblank 
timer depending on the buffer resources; as you suggested before.  Does 
this make a difference?

Best regards
Thomas

>
> Tested by running Gnome Wayland after launching Qemu with following
> (relevant) parameters:
> qemu-system-x86_64 -m 4096m -enable-kvm .........
> -device vfio-pci,host=0000:03:00.1
> -device virtio-gpu,max_outputs=1,xres=1920,yres=1080,blob=true
> -display gtk,gl=on
> -object memory-backend-memfd,id=mem1,size=4096M
> -machine q35,accel=kvm,memory-backend=mem1
>
> Thanks,
> Vivek
>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
>> b/drivers/gpu/drm/virtio/virtgpu_drv.h
>> index f17660a71a3e..671fc3b61bc6 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>> @@ -195,6 +195,21 @@ struct virtio_gpu_framebuffer {
>>   #define to_virtio_gpu_framebuffer(x) \
>>   	container_of(x, struct virtio_gpu_framebuffer, base)
>>
>> +struct virtio_gpu_crtc_state {
>> +	struct drm_crtc_state base;
>> +
>> +	/*
>> +	 * Send vblank event immediately from atomic_flush. Set from each
>> +	 * plane's atomic check and depends on the buffer object. Buffers
>> +	 * with host backing are vsync'd already and should send immediately;
>> +	 * others should wait for the VBLANK timer.
>> +	 */
>> +	u32 send_event_on_flush;
>> +};
>> +
>> +#define to_virtio_gpu_crtc_state(x) \
>> +	container_of(x, struct virtio_gpu_crtc_state, base)
>> +
>>   struct virtio_gpu_plane_state {
>>   	struct drm_plane_state base;
>>   	struct virtio_gpu_fence *fence;
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c
>> b/drivers/gpu/drm/virtio/virtgpu_plane.c
>> index 29e4b458ae57..d04721c5d505 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
>> @@ -104,7 +104,8 @@ static int virtio_gpu_plane_atomic_check(struct
>> drm_plane *plane,
>>
>> plane);
>>   	bool is_cursor = plane->type == DRM_PLANE_TYPE_CURSOR;
>>   	struct drm_crtc_state *crtc_state;
>> -	int ret;
>> +	struct virtio_gpu_crtc_state *vgcrtc_state;
>> +	int ret, i;
>>
>>   	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
>>   		return 0;
>> @@ -126,6 +127,19 @@ static int virtio_gpu_plane_atomic_check(struct
>> drm_plane *plane,
>>   						  DRM_PLANE_NO_SCALING,
>>   						  DRM_PLANE_NO_SCALING,
>>   						  is_cursor, true);
>> +
>> +	vgcrtc_state = to_virtio_gpu_crtc_state(crtc_state);
>> +	vgcrtc_state->send_event_on_flush &= ~drm_plane_mask(plane);
>> +
>> +	for (i = 0; i < new_plane_state->fb->format->num_planes; ++i) {
>> +		struct virtio_gpu_object *bo =
>> gem_to_virtio_gpu_obj(new_plane_state->fb->obj[i]);
>> +
>> +		if (bo->host3d_blob || bo->guest_blob) {
>> +			vgcrtc_state->send_event_on_flush |=
>> drm_plane_mask(plane);
>> +			break; /* only need to find one */
>> +		}
>> +	}
>> +
>>   	return ret;
>>   }
>>
>> --
>> 2.51.0

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


--------------RG0Pyqn3wopEmyzRi5eCDu0Y
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-virtgpu-Make-vblank-event-dependent-on-the-host-.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-virtgpu-Make-vblank-event-dependent-on-the-host-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmMDc2OGQ5ZDc0NTVmOWM2ZWVjMWY5N2EyNTk1ZjZhMjhlYjFlNjM4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAxNiBPY3QgMjAyNSAxNTowMToyMyArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIGRybS92aXJ0Z3B1OiBNYWtlIHZibGFuayBldmVudCBkZXBlbmRlbnQgb24g
dGhlIGhvc3QgcmVzb3VyY2UKCkZvciBlYWNoIHBsYW5lLCBzdG9yZSB0aGUgYnVmZmVyIG9i
amVjdCdzIGhvc3QgYmFja2luZyBpbiB0aGUgc3RhdGUKb2YgdGhlIHBsYW5lJ3MgcmVzcGVj
dGl2ZSBDUlRDLiBUaGUgaG9zdCBzeW5jaHJvbml6ZXMgb3V0cHV0IG9mIGJ1ZmZlcgpvYmpl
Y3RzIHdpdGggYSBob3N0IHJlc291cmNlIHRvIGl0cyBvd24gcmVmcmVzaCBjeWNsZTsgdGh1
cyBhdm9pZGluZwp0ZWFyaW5nLiBEdXJpbmcgdGhlIENSVEMncyBhdG9taWMgZmx1c2gsIGln
bm9yZSB0aGUgdmJsYW5rIHRpbWVyIGlmCmFueSBvZiB0aGUgQ1JUQydzIHBsYW5lJ3MgYnVm
ZmVyIG9iamVjdCBoYXMgYSBob3N0IHJlc291cmNlLiBJbnN0ZWFkCnNlbmQgdGhlIHZibGFu
ayBldmVudCBpbW1kaWF0ZWxseS4gQXZvaWRzIGNvcm5lciBjYXNlcyB3aGVyZSBhIHZibGFu
awpldmVudCBoYXBwZW5zIHRvbyBsYXRlIGZvciB0aGUgbmV4dCBmcmFtZSB0byBiZSBwYWdl
IGZsaXBwZWQgaW4gdGltZS4KClRoZSBob3N0IHN5bmNocm9uaXplcyBhIHBsYW5lJ3Mgb3V0
cHV0IHRvIHRoZSBob3N0IHJlcGFpbnQgY3ljbGUgaWYKdGhlIHBsYW5lJ3MgYnVmZmVyIG9i
amVjdCBoYXMgYW4gYXNzb2NpYXRlZCBob3N0IHJlc291cmNlLiBBbiBhdG9taWMKY29tbWl0
IGJsb2NrcyB1bnRpbCB0aGUgaG9zdCBjeWNsZSBjb21wbGV0ZXMgYW5kIHRoZW4gYXJtcyB0
aGUgdmJsYW5rCmV2ZW50LiBUaGUgZ3Vlc3QgY29tcG9zaXRvciBpcyB0aGVyZWJ5IHN5bmNo
cm9uaXplZCB0byB0aGUgaG9zdCdzCm91dHB1dCByYXRlLgoKVG8gYXZvaWQgZGVsYXlzLCBz
ZW5kIG91dCB0aGUgdmJsYW5rIGV2ZW50IGltbWVkaWF0ZWx5IGluc3RlYWQgb2YKanVzdCBh
cm1pbmcgaXQuIE90aGVyd2lzZSB0aGUgZXZlbnQgbWlnaHQgYmUgdG9vIGxhdGUgdG8gcGFn
ZSBmbGlwCnRoZSBjb21wb3NpdG9yJ3MgbmV4dCBmcmFtZS4KClRoZSB2YmxhbmsgdGltZXIg
aXMgc3RpbGwgYWN0aXZlIGFuZCBmaXJlcyBpbiByZWd1bGFyIGludGVydmFscwphY2NvcmRp
bmcgdG8gdGhlIGd1ZXN0IGRpc3BsYXkgcmVmcmVzaC4gVGhpcyByYXRlIGxpbWl0cyBjbGll
bnRzCnRoYXQgb25seSB3YWl0IGZvciB0aGUgbmV4dCB2YmxhbmsgdG8gb2NjdXIsIHN1Y2gg
YXMgZmJjb24uIFRoZXNlCmNsaWVudHMgd291bGQgb3RoZXJ3aXNlIHByb2R1Y2UgYSB2ZXJ5
IGhpZ2ggbnVtYmVyIG9mIGZyYW1lcyBwZXIKc2Vjb25kLgoKRm9yIGNvbW1pdHMgd2l0aG91
dCBob3N0IHJlc291cmNlLCB0aGUgdmJsYW5rIHRpbWVyIHJhdGUtbGltaXRzIHRoZQpndWVz
dCBvdXRwdXQgYnkgZ2VuZXJhdGluZyB2YmxhbmsgZXZlbnRzIGF0IHRoZSBndWVzdCBkaXNw
bGF5IHJlZnJlc2gKcmF0ZSBhcyBiZWZvcmUuCgp2MjoKLSBlbmFibGUvZGlzYWJsZSB2Ymxh
bmsgdGltZXIgYWNjb3JkaW5nIHRvIGJ1ZmZlciBzZXR1cAoKU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X2Rpc3BsYXkuYyB8IDk0ICsrKysrKysrKysrKysrKysrKysr
KystLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oICAgICB8IDE0ICsr
KysKIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jICAgfCAxNiArKyst
CiAzIGZpbGVzIGNoYW5nZWQsIDExNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZGlzcGxheS5jCmluZGV4IGU5NzJk
OWIwMTVhOS4uNzFkYzg3ZTIxZTdjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9kaXNwbGF5LmMKQEAgLTQ5LDE0ICs0OSw3NiBAQAogI2RlZmluZSBkcm1fY29ubmVj
dG9yX3RvX3ZpcnRpb19ncHVfb3V0cHV0KHgpIFwKIAljb250YWluZXJfb2YoeCwgc3RydWN0
IHZpcnRpb19ncHVfb3V0cHV0LCBjb25uKQogCitzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2Ny
dGNfc3RhdGVfZGVzdHJveShzdHJ1Y3QgdmlydGlvX2dwdV9jcnRjX3N0YXRlICp2Z2NydGNf
c3RhdGUpCit7CisJX19kcm1fYXRvbWljX2hlbHBlcl9jcnRjX2Rlc3Ryb3lfc3RhdGUoJnZn
Y3J0Y19zdGF0ZS0+YmFzZSk7CisKKwlrZnJlZSh2Z2NydGNfc3RhdGUpOworfQorCitzdGF0
aWMgYm9vbCB2aXJ0aW9fZ3B1X2NydGNfc3RhdGVfc2VuZF9ldmVudF9vbl9mbHVzaChzdHJ1
Y3QgdmlydGlvX2dwdV9jcnRjX3N0YXRlICp2Z2NydGNfc3RhdGUpCit7CisJc3RydWN0IGRy
bV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlID0gJnZnY3J0Y19zdGF0ZS0+YmFzZTsKKworCS8q
CisJICogVGhlIENSVEMncyBvdXRwdXQgaXMgdnN5bmMnZWQgaWYgYXQgbGVhc3Qgb25lIHBs
YW5lJ3Mgb3V0cHV0IGlzCisJICogc3luYydlZCB0byB0aGUgaG9zdCByZWZyZXNoLgorCSAq
LworCXJldHVybiB2Z2NydGNfc3RhdGUtPnBsYW5lX3N5bmNlZF90b19ob3N0ICYgY3J0Y19z
dGF0ZS0+cGxhbmVfbWFzazsKK30KKworc3RhdGljIHZvaWQgdmlydGlvX2dwdV9jcnRjX3Jl
c2V0KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKK3sKKwlzdHJ1Y3QgdmlydGlvX2dwdV9jcnRj
X3N0YXRlICp2Z2NydGNfc3RhdGU7CisKKwlpZiAoY3J0Yy0+c3RhdGUpCisJCXZpcnRpb19n
cHVfY3J0Y19zdGF0ZV9kZXN0cm95KHRvX3ZpcnRpb19ncHVfY3J0Y19zdGF0ZShjcnRjLT5z
dGF0ZSkpOworCisJdmdjcnRjX3N0YXRlID0ga3phbGxvYyhzaXplb2YoKnZnY3J0Y19zdGF0
ZSksIEdGUF9LRVJORUwpOworCWlmICh2Z2NydGNfc3RhdGUpIHsKKwkJdmdjcnRjX3N0YXRl
LT5wbGFuZV9zeW5jZWRfdG9faG9zdCA9IDB1bDsKKwkJX19kcm1fYXRvbWljX2hlbHBlcl9j
cnRjX3Jlc2V0KGNydGMsICZ2Z2NydGNfc3RhdGUtPmJhc2UpOworCX0gZWxzZSB7CisJCV9f
ZHJtX2F0b21pY19oZWxwZXJfY3J0Y19yZXNldChjcnRjLCBOVUxMKTsKKwl9Cit9CisKK3N0
YXRpYyBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnZpcnRpb19ncHVfY3J0Y19hdG9taWNfZHVw
bGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKK3sKKwlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2ID0gY3J0Yy0+ZGV2OworCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19z
dGF0ZSA9IGNydGMtPnN0YXRlOworCXN0cnVjdCB2aXJ0aW9fZ3B1X2NydGNfc3RhdGUgKm5l
d192Z2NydGNfc3RhdGU7CisJc3RydWN0IHZpcnRpb19ncHVfY3J0Y19zdGF0ZSAqdmdjcnRj
X3N0YXRlOworCisJaWYgKGRybV9XQVJOX09OKGRldiwgIWNydGNfc3RhdGUpKQorCQlyZXR1
cm4gTlVMTDsKKworCW5ld192Z2NydGNfc3RhdGUgPSBremFsbG9jKHNpemVvZigqbmV3X3Zn
Y3J0Y19zdGF0ZSksIEdGUF9LRVJORUwpOworCWlmICghbmV3X3ZnY3J0Y19zdGF0ZSkKKwkJ
cmV0dXJuIE5VTEw7CisKKwl2Z2NydGNfc3RhdGUgPSB0b192aXJ0aW9fZ3B1X2NydGNfc3Rh
dGUoY3J0Y19zdGF0ZSk7CisKKwlfX2RybV9hdG9taWNfaGVscGVyX2NydGNfZHVwbGljYXRl
X3N0YXRlKGNydGMsICZuZXdfdmdjcnRjX3N0YXRlLT5iYXNlKTsKKwl2Z2NydGNfc3RhdGUt
PnBsYW5lX3N5bmNlZF90b19ob3N0ID0gdmdjcnRjX3N0YXRlLT5wbGFuZV9zeW5jZWRfdG9f
aG9zdDsKKworCXJldHVybiAmbmV3X3ZnY3J0Y19zdGF0ZS0+YmFzZTsKK30KKworc3RhdGlj
IHZvaWQgdmlydGlvX2dwdV9jcnRjX2F0b21pY19kZXN0cm95X3N0YXRlKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKKwkJCQkJCSBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUp
Cit7CisJdmlydGlvX2dwdV9jcnRjX3N0YXRlX2Rlc3Ryb3kodG9fdmlydGlvX2dwdV9jcnRj
X3N0YXRlKGNydGNfc3RhdGUpKTsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0
Y19mdW5jcyB2aXJ0aW9fZ3B1X2NydGNfZnVuY3MgPSB7CiAJLnNldF9jb25maWcgICAgICAg
ICAgICAgPSBkcm1fYXRvbWljX2hlbHBlcl9zZXRfY29uZmlnLAogCS5kZXN0cm95ICAgICAg
ICAgICAgICAgID0gZHJtX2NydGNfY2xlYW51cCwKIAogCS5wYWdlX2ZsaXAgICAgICAgICAg
ICAgID0gZHJtX2F0b21pY19oZWxwZXJfcGFnZV9mbGlwLAotCS5yZXNldCAgICAgICAgICAg
ICAgICAgID0gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19yZXNldCwKLQkuYXRvbWljX2R1cGxp
Y2F0ZV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2NydGNfZHVwbGljYXRlX3N0YXRlLAot
CS5hdG9taWNfZGVzdHJveV9zdGF0ZSAgID0gZHJtX2F0b21pY19oZWxwZXJfY3J0Y19kZXN0
cm95X3N0YXRlLAorCS5yZXNldCAgICAgICAgICAgICAgICAgID0gdmlydGlvX2dwdV9jcnRj
X3Jlc2V0LAorCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gdmlydGlvX2dwdV9jcnRjX2F0
b21pY19kdXBsaWNhdGVfc3RhdGUsCisJLmF0b21pY19kZXN0cm95X3N0YXRlICAgPSB2aXJ0
aW9fZ3B1X2NydGNfYXRvbWljX2Rlc3Ryb3lfc3RhdGUsCiAJRFJNX0NSVENfVkJMQU5LX1RJ
TUVSX0ZVTkNTLAogfTsKIApAQCAtMTAyLDcgKzE2NCwxMCBAQCBzdGF0aWMgdm9pZCB2aXJ0
aW9fZ3B1X2NydGNfbW9kZV9zZXRfbm9mYihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiBzdGF0
aWMgdm9pZCB2aXJ0aW9fZ3B1X2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCiAJCQkJCSAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQogewotCWRy
bV9jcnRjX3ZibGFua19vbihjcnRjKTsKKwlzdHJ1Y3QgdmlydGlvX2dwdV9jcnRjX3N0YXRl
ICp2Z2NydGNfc3RhdGUgPSB0b192aXJ0aW9fZ3B1X2NydGNfc3RhdGUoY3J0Yy0+c3RhdGUp
OworCisJaWYgKCF2aXJ0aW9fZ3B1X2NydGNfc3RhdGVfc2VuZF9ldmVudF9vbl9mbHVzaCh2
Z2NydGNfc3RhdGUpKQorCQlkcm1fY3J0Y192Ymxhbmtfb24oY3J0Yyk7CiB9CiAKIHN0YXRp
YyB2b2lkIHZpcnRpb19ncHVfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCkBAIC0xMTEsOCArMTc2LDEwIEBAIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfY3J0
Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJc3RydWN0IGRybV9k
ZXZpY2UgKmRldiA9IGNydGMtPmRldjsKIAlzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZn
ZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKIAlzdHJ1Y3QgdmlydGlvX2dwdV9vdXRwdXQgKm91
dHB1dCA9IGRybV9jcnRjX3RvX3ZpcnRpb19ncHVfb3V0cHV0KGNydGMpOworCXN0cnVjdCB2
aXJ0aW9fZ3B1X2NydGNfc3RhdGUgKnZnY3J0Y19zdGF0ZSA9IHRvX3ZpcnRpb19ncHVfY3J0
Y19zdGF0ZShjcnRjLT5zdGF0ZSk7CiAKLQlkcm1fY3J0Y192Ymxhbmtfb2ZmKGNydGMpOwor
CWlmICghdmlydGlvX2dwdV9jcnRjX3N0YXRlX3NlbmRfZXZlbnRfb25fZmx1c2godmdjcnRj
X3N0YXRlKSkKKwkJZHJtX2NydGNfdmJsYW5rX29mZihjcnRjKTsKIAogCXZpcnRpb19ncHVf
Y21kX3NldF9zY2Fub3V0KHZnZGV2LCBvdXRwdXQtPmluZGV4LCAwLCAwLCAwLCAwLCAwKTsK
IAl2aXJ0aW9fZ3B1X25vdGlmeSh2Z2Rldik7CkBAIC0xMjEsNiArMTg4LDE5IEBAIHN0YXRp
YyB2b2lkIHZpcnRpb19ncHVfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCiBzdGF0aWMgaW50IHZpcnRpb19ncHVfY3J0Y19hdG9taWNfY2hlY2soc3RydWN0
IGRybV9jcnRjICpjcnRjLAogCQkJCQlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUp
CiB7CisJc3RydWN0IGRybV9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0ZSA9IGRybV9hdG9t
aWNfZ2V0X25ld19jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKTsKKwlzdHJ1Y3QgdmlydGlvX2dw
dV9jcnRjX3N0YXRlICpuZXdfdmdjcnRjX3N0YXRlID0gdG9fdmlydGlvX2dwdV9jcnRjX3N0
YXRlKG5ld19jcnRjX3N0YXRlKTsKKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRj
X3N0YXRlID0gZHJtX2F0b21pY19nZXRfb2xkX2NydGNfc3RhdGUoc3RhdGUsIGNydGMpOwor
CXN0cnVjdCB2aXJ0aW9fZ3B1X2NydGNfc3RhdGUgKm9sZF92Z2NydGNfc3RhdGUgPSB0b192
aXJ0aW9fZ3B1X2NydGNfc3RhdGUob2xkX2NydGNfc3RhdGUpOworCisJLyoKKwkgKiBIYW5k
bGluZyBvZiB2YmxhbmsgZXZlbnRzIGNoYW5nZXMgYWNyb3NzIHVwZGF0ZXMuIERvIGEgZnVs
bCBtb2Rlc2V0CisJICogdG8gZW5hYmxlL2Rpc2FibGUgdGhlIHZibGFuayB0aW1lci4KKwkg
Ki8KKwlpZiAodmlydGlvX2dwdV9jcnRjX3N0YXRlX3NlbmRfZXZlbnRfb25fZmx1c2gobmV3
X3ZnY3J0Y19zdGF0ZSkgIT0KKwkgICAgdmlydGlvX2dwdV9jcnRjX3N0YXRlX3NlbmRfZXZl
bnRfb25fZmx1c2gob2xkX3ZnY3J0Y19zdGF0ZSkpCisJCW5ld19jcnRjX3N0YXRlLT5tb2Rl
X2NoYW5nZWQgPSB0cnVlOworCiAJcmV0dXJuIDA7CiB9CiAKQEAgLTEyOSw3ICsyMDksOSBA
QCBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2NydGNfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY3J0Yy0+ZGV2Owog
CXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25l
d19jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKTsKKwlzdHJ1Y3QgdmlydGlvX2dwdV9jcnRjX3N0
YXRlICp2Z2NydGNfc3RhdGUgPSB0b192aXJ0aW9fZ3B1X2NydGNfc3RhdGUoY3J0Y19zdGF0
ZSk7CiAJc3RydWN0IHZpcnRpb19ncHVfb3V0cHV0ICpvdXRwdXQgPSBkcm1fY3J0Y190b192
aXJ0aW9fZ3B1X291dHB1dChjcnRjKTsKKwlib29sIHNlbmRfZXZlbnRfb25fZmx1c2ggPSB2
aXJ0aW9fZ3B1X2NydGNfc3RhdGVfc2VuZF9ldmVudF9vbl9mbHVzaCh2Z2NydGNfc3RhdGUp
OwogCXN0cnVjdCBkcm1fcGVuZGluZ192YmxhbmtfZXZlbnQgKmV2ZW50OwogCiAJLyoKQEAg
LTE0Nyw3ICsyMjksNyBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2NydGNfYXRvbWljX2Zs
dXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAljcnRjX3N0YXRlLT5ldmVudCA9IE5VTEw7
CiAKIAlpZiAoZXZlbnQpIHsKLQkJaWYgKGRybV9jcnRjX3ZibGFua19nZXQoY3J0YykgPT0g
MCkKKwkJaWYgKCFzZW5kX2V2ZW50X29uX2ZsdXNoICYmIGRybV9jcnRjX3ZibGFua19nZXQo
Y3J0YykgPT0gMCkKIAkJCWRybV9jcnRjX2FybV92YmxhbmtfZXZlbnQoY3J0YywgZXZlbnQp
OwogCQllbHNlCiAJCQlkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBldmVudCk7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggYi9k
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKaW5kZXggZjE3NjYwYTcxYTNl
Li5mZjFhYWM2ZTNjM2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgK
QEAgLTE5NSw2ICsxOTUsMjAgQEAgc3RydWN0IHZpcnRpb19ncHVfZnJhbWVidWZmZXIgewog
I2RlZmluZSB0b192aXJ0aW9fZ3B1X2ZyYW1lYnVmZmVyKHgpIFwKIAljb250YWluZXJfb2Yo
eCwgc3RydWN0IHZpcnRpb19ncHVfZnJhbWVidWZmZXIsIGJhc2UpCiAKK3N0cnVjdCB2aXJ0
aW9fZ3B1X2NydGNfc3RhdGUgeworCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSBiYXNlOworCisJ
LyoKKwkgKiBTZXQgZnJvbSBlYWNoIHBsYW5lJ3MgYXRvbWljIGNoZWNrIGFuZCBkZXBlbmRz
IG9uIHRoZSBwbGFuZSdzIGJ1ZmZlcgorCSAqIG9iamVjdHMuIEJ1ZmZlcnMgd2l0aCBob3N0
IHJlc291cmNlcyBhcmUgdnN5bmMnZCBhbHJlYWR5LiBVc2VkIGJ5IHRoZQorCSAqIENSVEMg
Zm9yIHZibGFuayBoYW5kbGluZy4KKwkgKi8KKwl1MzIgcGxhbmVfc3luY2VkX3RvX2hvc3Q7
Cit9OworCisjZGVmaW5lIHRvX3ZpcnRpb19ncHVfY3J0Y19zdGF0ZSh4KSBcCisJY29udGFp
bmVyX29mKHgsIHN0cnVjdCB2aXJ0aW9fZ3B1X2NydGNfc3RhdGUsIGJhc2UpCisKIHN0cnVj
dCB2aXJ0aW9fZ3B1X3BsYW5lX3N0YXRlIHsKIAlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlIGJh
c2U7CiAJc3RydWN0IHZpcnRpb19ncHVfZmVuY2UgKmZlbmNlOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfcGxhbmUuYwppbmRleCAyOWU0YjQ1OGFlNTcuLmQ2MDUzOTMzNGE4
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMKQEAgLTEwNCw3
ICsxMDQsOCBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfcGxhbmVfYXRvbWljX2NoZWNrKHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCQkJCQkJCQkJCSBwbGFuZSk7CiAJYm9vbCBpc19j
dXJzb3IgPSBwbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9DVVJTT1I7CiAJc3RydWN0
IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOwotCWludCByZXQ7CisJc3RydWN0IHZpcnRp
b19ncHVfY3J0Y19zdGF0ZSAqdmdjcnRjX3N0YXRlOworCWludCByZXQsIGk7CiAKIAlpZiAo
IW5ld19wbGFuZV9zdGF0ZS0+ZmIgfHwgV0FSTl9PTighbmV3X3BsYW5lX3N0YXRlLT5jcnRj
KSkKIAkJcmV0dXJuIDA7CkBAIC0xMjYsNiArMTI3LDE5IEBAIHN0YXRpYyBpbnQgdmlydGlv
X2dwdV9wbGFuZV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJCQkJ
CQkgIERSTV9QTEFORV9OT19TQ0FMSU5HLAogCQkJCQkJICBEUk1fUExBTkVfTk9fU0NBTElO
RywKIAkJCQkJCSAgaXNfY3Vyc29yLCB0cnVlKTsKKworCXZnY3J0Y19zdGF0ZSA9IHRvX3Zp
cnRpb19ncHVfY3J0Y19zdGF0ZShjcnRjX3N0YXRlKTsKKwl2Z2NydGNfc3RhdGUtPnBsYW5l
X3N5bmNlZF90b19ob3N0ICY9IH5kcm1fcGxhbmVfbWFzayhwbGFuZSk7CisKKwlmb3IgKGkg
PSAwOyBpIDwgbmV3X3BsYW5lX3N0YXRlLT5mYi0+Zm9ybWF0LT5udW1fcGxhbmVzOyArK2kp
IHsKKwkJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibyA9IGdlbV90b192aXJ0aW9fZ3B1
X29iaihuZXdfcGxhbmVfc3RhdGUtPmZiLT5vYmpbaV0pOworCisJCWlmIChiby0+aG9zdDNk
X2Jsb2IgfHwgYm8tPmd1ZXN0X2Jsb2IpIHsKKwkJCXZnY3J0Y19zdGF0ZS0+cGxhbmVfc3lu
Y2VkX3RvX2hvc3QgfD0gZHJtX3BsYW5lX21hc2socGxhbmUpOworCQkJYnJlYWs7IC8qIG9u
bHkgbmVlZCB0byBmaW5kIG9uZSAqLworCQl9CisJfQorCiAJcmV0dXJuIHJldDsKIH0KIAot
LSAKMi41MS4wCgo=

--------------RG0Pyqn3wopEmyzRi5eCDu0Y--
