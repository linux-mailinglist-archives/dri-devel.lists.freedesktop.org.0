Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A165695F3D1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 16:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1841C10E21B;
	Mon, 26 Aug 2024 14:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dc8a9aGS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dx43YwUj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dc8a9aGS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dx43YwUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A68510E218;
 Mon, 26 Aug 2024 14:26:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 76D081F88E;
 Mon, 26 Aug 2024 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724682391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wa0GrujLyRktBjXtErBVv/t2vyB8G9m9XnQsx7R8eSk=;
 b=dc8a9aGS+3gZsqXOuW24gHzWhRTmX4aiNqZzDUo9T8RAAlT222tlyb1acyEQhT14k1bXqB
 kIdNaxA90cEAK1Fn2qZHBa0jLCCnEmeT4ZFRrfRjJGeLvgVordfdcZPZ+PCTp6fU7WdOo1
 J9m5cNYl6CyN4nazKjdG0KRyPKKIM8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724682391;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wa0GrujLyRktBjXtErBVv/t2vyB8G9m9XnQsx7R8eSk=;
 b=dx43YwUjHa4BOi3x22NXNIauMubM6LeIfODXwf3fi0l2fxhzldN+qg1zfimtqeeBYAUe8I
 HKTinEIrChx/ZgBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724682391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wa0GrujLyRktBjXtErBVv/t2vyB8G9m9XnQsx7R8eSk=;
 b=dc8a9aGS+3gZsqXOuW24gHzWhRTmX4aiNqZzDUo9T8RAAlT222tlyb1acyEQhT14k1bXqB
 kIdNaxA90cEAK1Fn2qZHBa0jLCCnEmeT4ZFRrfRjJGeLvgVordfdcZPZ+PCTp6fU7WdOo1
 J9m5cNYl6CyN4nazKjdG0KRyPKKIM8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724682391;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wa0GrujLyRktBjXtErBVv/t2vyB8G9m9XnQsx7R8eSk=;
 b=dx43YwUjHa4BOi3x22NXNIauMubM6LeIfODXwf3fi0l2fxhzldN+qg1zfimtqeeBYAUe8I
 HKTinEIrChx/ZgBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EADBF13724;
 Mon, 26 Aug 2024 14:26:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FdHxN5aQzGbcVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Aug 2024 14:26:30 +0000
Message-ID: <69f3eb8d-67b3-41f1-b813-210a682f3ba3@suse.de>
Date: Mon, 26 Aug 2024 16:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix kerneldoc for "Returns" section
To: renjun wang <renjunw0@foxmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, lyude@redhat.com,
 imre.deak@intel.com, Wayne.Lin@amd.com, ville.syrjala@linux.intel.com,
 vidya.srinivas@intel.com, jouni.hogander@intel.com,
 andi.shyti@linux.intel.com, janusz.krzysztofik@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <tencent_37A873672B5CD20DECAF99DEDAC5E45C3106@qq.com>
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
In-Reply-To: <tencent_37A873672B5CD20DECAF99DEDAC5E45C3106@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[foxmail.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch]; 
 RCPT_COUNT_TWELVE(0.00)[20]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[foxmail.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
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



Am 24.08.24 um 10:36 schrieb renjun wang:
> The blank line between title "Returns:" and detail description is not
> allowed, otherwise the title will goes under the description block in
> generated .html file after running `make htmldocs`.
>
> There are a few examples for current kerneldoc:
> https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#c.drm_crtc_commit_wait
> https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#c.drm_atomic_get_crtc_state
> https://www.kernel.org/doc/html/latest/gpu/i915.html#c.i915_vma_pin_fence
>
> Signed-off-by: renjun wang <renjunw0@foxmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

I'll add this patch and the other doc fix to the drm-misc tree. Thanks a 
lot for the fixes.

Best regards
Thomas

> ---
>   drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 ----
>   drivers/gpu/drm/drm_atomic.c                  | 6 ------
>   drivers/gpu/drm/drm_atomic_helper.c           | 2 --
>   drivers/gpu/drm/drm_file.c                    | 7 -------
>   drivers/gpu/drm/drm_gem.c                     | 7 ++-----
>   drivers/gpu/drm/drm_modes.c                   | 1 -
>   drivers/gpu/drm/drm_rect.c                    | 1 -
>   drivers/gpu/drm/drm_vblank.c                  | 2 --
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    | 1 -
>   drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  | 1 -
>   drivers/gpu/drm/i915/i915_vma.h               | 1 -
>   11 files changed, 2 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index fc2ceae61db2..e68d23997d53 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5569,7 +5569,6 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_check_mgr);
>    * drm_dp_atomic_release_time_slots()
>    *
>    * Returns:
> - *
>    * 0 if the new state is valid, negative error code otherwise.
>    */
>   int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
> @@ -5606,7 +5605,6 @@ EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
>    * topology object.
>    *
>    * RETURNS:
> - *
>    * The MST topology state or error pointer.
>    */
>   struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
> @@ -5626,7 +5624,6 @@ EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
>    * topology object.
>    *
>    * Returns:
> - *
>    * The old MST topology state, or NULL if there's no topology state for this MST mgr
>    * in the global atomic state
>    */
> @@ -5651,7 +5648,6 @@ EXPORT_SYMBOL(drm_atomic_get_old_mst_topology_state);
>    * topology object.
>    *
>    * Returns:
> - *
>    * The new MST topology state, or NULL if there's no topology state for this MST mgr
>    * in the global atomic state
>    */
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 6e516c39a372..0fc99da93afe 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -63,7 +63,6 @@ EXPORT_SYMBOL(__drm_crtc_commit_free);
>    * hardware and flipped to.
>    *
>    * Returns:
> - *
>    * 0 on success, a negative error code otherwise.
>    */
>   int drm_crtc_commit_wait(struct drm_crtc_commit *commit)
> @@ -337,7 +336,6 @@ EXPORT_SYMBOL(__drm_atomic_state_free);
>    * not created by userspace through an IOCTL call.
>    *
>    * Returns:
> - *
>    * Either the allocated state or the error code encoded into the pointer. When
>    * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
>    * entire atomic sequence must be restarted. All other errors are fatal.
> @@ -518,7 +516,6 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
>    * is consistent.
>    *
>    * Returns:
> - *
>    * Either the allocated state or the error code encoded into the pointer. When
>    * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
>    * entire atomic sequence must be restarted. All other errors are fatal.
> @@ -828,7 +825,6 @@ EXPORT_SYMBOL(drm_atomic_private_obj_fini);
>    * object lock to make sure that the state is consistent.
>    *
>    * RETURNS:
> - *
>    * Either the allocated state or the error code encoded into a pointer.
>    */
>   struct drm_private_state *
> @@ -1061,7 +1057,6 @@ EXPORT_SYMBOL(drm_atomic_get_new_crtc_for_encoder);
>    * make sure that the state is consistent.
>    *
>    * Returns:
> - *
>    * Either the allocated state or the error code encoded into the pointer. When
>    * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
>    * entire atomic sequence must be restarted. All other errors are fatal.
> @@ -1169,7 +1164,6 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
>    * state is consistent.
>    *
>    * Returns:
> - *
>    * Either the allocated state or the error code encoded into the pointer. When
>    * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
>    * entire atomic sequence must be restarted.
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index fb97b51b38f1..43cdf39019a4 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2266,7 +2266,6 @@ crtc_or_fake_commit(struct drm_atomic_state *state, struct drm_crtc *crtc)
>    * automatically.
>    *
>    * Returns:
> - *
>    * 0 on success. -EBUSY when userspace schedules nonblocking commits too fast,
>    * -ENOMEM on allocation failures and -EINTR when a signal is pending.
>    */
> @@ -3009,7 +3008,6 @@ EXPORT_SYMBOL(drm_atomic_helper_cleanup_planes);
>    * don't pass the right state structures to the callbacks.
>    *
>    * Returns:
> - *
>    * Returns 0 on success. Can return -ERESTARTSYS when @stall is true and the
>    * waiting for the previous commits has been interrupted.
>    */
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 714e42b05108..7beed6902208 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -355,7 +355,6 @@ int drm_open_helper(struct file *filp, struct drm_minor *minor)
>    * resources for it. It also calls the &drm_driver.open driver callback.
>    *
>    * RETURNS:
> - *
>    * 0 on success or negative errno value on failure.
>    */
>   int drm_open(struct inode *inode, struct file *filp)
> @@ -417,7 +416,6 @@ void drm_lastclose(struct drm_device * dev)
>    * DRM device also proceeds to call the &drm_driver.lastclose driver callback.
>    *
>    * RETURNS:
> - *
>    * Always succeeds and returns 0.
>    */
>   int drm_release(struct inode *inode, struct file *filp)
> @@ -489,7 +487,6 @@ void drm_file_update_pid(struct drm_file *filp)
>    * call the &drm_driver.lastclose driver callback.
>    *
>    * RETURNS:
> - *
>    * Always succeeds and returns 0.
>    */
>   int drm_release_noglobal(struct inode *inode, struct file *filp)
> @@ -532,7 +529,6 @@ EXPORT_SYMBOL(drm_release_noglobal);
>    * safety.
>    *
>    * RETURNS:
> - *
>    * Number of bytes read (always aligned to full events, and can be 0) or a
>    * negative error code on failure.
>    */
> @@ -618,7 +614,6 @@ EXPORT_SYMBOL(drm_read);
>    * See also drm_read().
>    *
>    * RETURNS:
> - *
>    * Mask of POLL flags indicating the current status of the file.
>    */
>   __poll_t drm_poll(struct file *filp, struct poll_table_struct *wait)
> @@ -656,7 +651,6 @@ EXPORT_SYMBOL(drm_poll);
>    * already hold &drm_device.event_lock.
>    *
>    * RETURNS:
> - *
>    * 0 on success or a negative error code on failure.
>    */
>   int drm_event_reserve_init_locked(struct drm_device *dev,
> @@ -698,7 +692,6 @@ EXPORT_SYMBOL(drm_event_reserve_init_locked);
>    * drm_event_reserve_init_locked() instead.
>    *
>    * RETURNS:
> - *
>    * 0 on success or a negative error code on failure.
>    */
>   int drm_event_reserve_init(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index d4bbc5d109c8..149b8e25da5b 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -689,7 +689,6 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>    * For a single handle lookup, use drm_gem_object_lookup().
>    *
>    * Returns:
> - *
>    * @objs filled in with GEM object pointers. Returned GEM objects need to be
>    * released with drm_gem_object_put(). -ENOENT is returned on a lookup
>    * failure. 0 is returned on success.
> @@ -737,12 +736,11 @@ EXPORT_SYMBOL(drm_gem_objects_lookup);
>    * @filp: DRM file private date
>    * @handle: userspace handle
>    *
> - * Returns:
> + * If looking up an array of handles, use drm_gem_objects_lookup().
>    *
> + * Returns:
>    * A reference to the object named by the handle if such exists on @filp, NULL
>    * otherwise.
> - *
> - * If looking up an array of handles, use drm_gem_objects_lookup().
>    */
>   struct drm_gem_object *
>   drm_gem_object_lookup(struct drm_file *filp, u32 handle)
> @@ -763,7 +761,6 @@ EXPORT_SYMBOL(drm_gem_object_lookup);
>    * @timeout: timeout value in jiffies or zero to return immediately
>    *
>    * Returns:
> - *
>    * Returns -ERESTARTSYS if interrupted, 0 if the wait timed out, or
>    * greater than 0 on success.
>    */
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 1a0890083aee..6ba167a33461 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -539,7 +539,6 @@ static int fill_analog_mode(struct drm_device *dev,
>    * to reach those resolutions.
>    *
>    * Returns:
> - *
>    * A pointer to the mode, allocated with drm_mode_create(). Returns NULL
>    * on error.
>    */
> diff --git a/drivers/gpu/drm/drm_rect.c b/drivers/gpu/drm/drm_rect.c
> index 85c79a38c13a..492acce0516f 100644
> --- a/drivers/gpu/drm/drm_rect.c
> +++ b/drivers/gpu/drm/drm_rect.c
> @@ -85,7 +85,6 @@ static u32 clip_scaled(int src, int dst, int *clip)
>    * factors from @src to @dst.
>    *
>    * RETURNS:
> - *
>    * %true if rectangle @dst is still visible after being clipped,
>    * %false otherwise.
>    */
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index cc3571e25a9a..6428b7975dd6 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -686,7 +686,6 @@ EXPORT_SYMBOL(drm_calc_timestamping_constants);
>    * drm_atomic_helper_calc_timestamping_constants().
>    *
>    * Returns:
> - *
>    * Returns true on success, and false on failure, i.e. when no accurate
>    * timestamp could be acquired.
>    */
> @@ -831,7 +830,6 @@ EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp_internal);
>    * drm_atomic_helper_calc_timestamping_constants().
>    *
>    * Returns:
> - *
>    * Returns true on success, and false on failure, i.e. when no accurate
>    * timestamp could be acquired.
>    */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 5d7446a48ae7..3dc61cbd2e11 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -89,7 +89,6 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj);
>    * @handle: userspace handle
>    *
>    * Returns:
> - *
>    * A pointer to the object named by the handle if such exists on @filp, NULL
>    * otherwise. This object is only valid whilst under the RCU read lock, and
>    * note carefully the object may be in the process of being destroyed.
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> index 93bc1cc1ee7e..0ffba50981e3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> @@ -418,7 +418,6 @@ int __i915_vma_pin_fence(struct i915_vma *vma)
>    * For an untiled surface, this removes any existing fence.
>    *
>    * Returns:
> - *
>    * 0 on success, negative error code on failure.
>    */
>   int i915_vma_pin_fence(struct i915_vma *vma)
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index e356dfb883d3..6a6be8048aa8 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -389,7 +389,6 @@ void i915_vma_unpin_iomap(struct i915_vma *vma);
>    * i915_vma_unpin_fence().
>    *
>    * Returns:
> - *
>    * True if the vma has a fence, false otherwise.
>    */
>   int __must_check i915_vma_pin_fence(struct i915_vma *vma);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

