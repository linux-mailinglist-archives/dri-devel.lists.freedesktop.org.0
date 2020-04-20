Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B41351B1F0E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83116E89A;
	Tue, 21 Apr 2020 06:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 817 seconds by postgrey-1.36 at gabe;
 Mon, 20 Apr 2020 12:58:43 UTC
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b6:217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159CE89CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 12:58:43 +0000 (UTC)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 9CE652E14F4;
 Mon, 20 Apr 2020 15:58:41 +0300 (MSK)
Received: from vla5-58875c36c028.qloud-c.yandex.net
 (vla5-58875c36c028.qloud-c.yandex.net [2a02:6b8:c18:340b:0:640:5887:5c36])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 vYUVHqaz0b-weMm0mo5; Mon, 20 Apr 2020 15:58:41 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1587387521; bh=HjdmdYygeeJ5137hzpj+Y1ykLwmniRhEcglGSxy1hbo=;
 h=In-Reply-To:References:Date:Message-ID:From:To:Subject;
 b=ts2EEt6iBKDg7tjZ5rHl8YvO/SfhXJ8jAZt0XhskA5x4wW0K4QuMHllCBszsbZj9/
 TIWvRE9QrSu7lGo/onOKkHMo86gvNPgMf9/yQI4NTdlbLHv/Qx40QY8KJ5RKRvT2LG
 543mBq8+gfTMfJjqPpsxXlxUFyGCoEJB6efGF1ek=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from unknown (unknown [2a02:6b8:b080:8201::1:2])
 by vla5-58875c36c028.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wTBkqLIxIr-weXa9KZS; Mon, 20 Apr 2020 15:58:40 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH] drm/ast: Allocate initial CRTC state of the correct size
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <158738670022.7365.11535132795669408878.stgit@buzz>
 <30efe6f4-3d2f-f147-0801-9f727f797725@suse.de>
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Message-ID: <24722c20-ac21-473a-a544-bd7a063f92df@yandex-team.ru>
Date: Mon, 20 Apr 2020 15:58:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <30efe6f4-3d2f-f147-0801-9f727f797725@suse.de>
Content-Language: en-CA
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 20/04/2020 15.55, Thomas Zimmermann wrote:
> Hi Konstantin
> 
> Am 20.04.20 um 14:45 schrieb Konstantin Khlebnikov:
>> I've stumbled upon this too. Trivial fix was posted but stuck in review.
>> This is patch from Thomas Zimmermann changed according to suggestions by
>> Daniel Vetter from https://patchwork.kernel.org/patch/11356157/
> 
> Did you find it on the mailing list? I was waiting for this patch to get
> merged. Apparently I forgot to push it? I'll take care of the patch.

Ah, my bad. After deeper look I've found v2
https://patchwork.kernel.org/patch/11357645/
But in State=New, it's definitely lost

> 
> Best regards
> Thomas
> 
>>
>>
>> The ast driver inherits from DRM's CRTC state, but still uses the atomic
>> helper for struct drm_crtc_funcs.reset, drm_atomic_helper_crtc_reset().
>>
>> The helper only allocates enough memory for the core CRTC state. That
>> results in an out-ouf-bounds access when duplicating the initial CRTC
>> state. Simplified backtrace shown below:
>>
>> [   21.469321] ==================================================================
>> [   21.469434] BUG: KASAN: slab-out-of-bounds in ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
>> [   21.469445] Read of size 8 at addr ffff888036c1c5f8 by task systemd-udevd/382
>> [   21.469451]
>> [   21.469464] CPU: 2 PID: 382 Comm: systemd-udevd Tainted: G            E     5.5.0-rc6-1-default+ #214
>> [   21.469473] Hardware name: Sun Microsystems SUN FIRE X2270 M2/SUN FIRE X2270 M2, BIOS 2.05    07/01/2010
>> [   21.469480] Call Trace:
>> [   21.469501]  dump_stack+0xb8/0x110
>> [   21.469528]  print_address_description.constprop.0+0x1b/0x1e0
>> [   21.469557]  ? ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
>> [   21.469581]  ? ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
>> [   21.469597]  __kasan_report.cold+0x1a/0x35
>> [   21.469640]  ? ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
>> [   21.469665]  kasan_report+0xe/0x20
>> [   21.469693]  ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
>> [   21.469733]  drm_atomic_get_crtc_state+0xbf/0x1c0
>> [   21.469768]  __drm_atomic_helper_set_config+0x81/0x5a0
>> [   21.469803]  ? drm_atomic_plane_check+0x690/0x690
>> [   21.469843]  ? drm_client_rotation+0xae/0x240
>> [   21.469876]  drm_client_modeset_commit_atomic+0x230/0x390
>> [   21.469888]  ? __mutex_lock+0x8f0/0xbe0
>> [   21.469929]  ? drm_client_firmware_config.isra.0+0xa60/0xa60
>> [   21.469948]  ? drm_client_modeset_commit_force+0x28/0x230
>> [   21.470031]  ? memset+0x20/0x40
>> [   21.470078]  drm_client_modeset_commit_force+0x90/0x230
>> [   21.470110]  drm_fb_helper_restore_fbdev_mode_unlocked+0x5f/0xc0
>> [   21.470132]  drm_fb_helper_set_par+0x59/0x70
>> [   21.470155]  fbcon_init+0x61d/0xad0
>> [   21.470185]  ? drm_fb_helper_restore_fbdev_mode_unlocked+0xc0/0xc0
>> [   21.470232]  visual_init+0x187/0x240
>> [   21.470266]  do_bind_con_driver+0x2e3/0x460
>> [   21.470321]  do_take_over_console+0x20a/0x290
>> [   21.470371]  do_fbcon_takeover+0x85/0x100
>> [   21.470402]  register_framebuffer+0x2fd/0x490
>> [   21.470425]  ? kzalloc.constprop.0+0x10/0x10
>> [   21.470503]  __drm_fb_helper_initial_config_and_unlock+0xf2/0x140
>> [   21.470533]  drm_fbdev_client_hotplug+0x162/0x250
>> [   21.470563]  drm_fbdev_generic_setup+0xd2/0x155
>> [   21.470602]  ast_driver_load+0x688/0x850 [ast]
>> <...>
>> [   21.472625] ==================================================================
>>
>> Allocating enough memory for struct ast_crtc_state in a custom ast CRTC
>> reset handler fixes the problem.
>>
>> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
>> Fixes: 83be6a3ceb11 ("drm/ast: Introduce struct ast_crtc_state")
>> Link: https://patchwork.kernel.org/patch/11356157/
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/gpu/drm/ast/ast_mode.c |   13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
>> index cdd6c46d6557..17143e6bbfec 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -918,8 +918,19 @@ static void ast_crtc_atomic_destroy_state(struct drm_crtc *crtc,
>>   	kfree(ast_state);
>>   }
>>   
>> +static void ast_crtc_reset(struct drm_crtc *crtc)
>> +{
>> +	struct ast_crtc_state *state =
>> +		kzalloc(sizeof(*state), GFP_KERNEL);
>> +
>> +	if (crtc->state)
>> +		ast_crtc_atomic_destroy_state(crtc, crtc->state);
>> +
>> +	__drm_atomic_helper_crtc_reset(crtc, &state->base);
>> +}
>> +
>>   static const struct drm_crtc_funcs ast_crtc_funcs = {
>> -	.reset = drm_atomic_helper_crtc_reset,
>> +	.reset = ast_crtc_reset,
>>   	.set_config = drm_crtc_helper_set_config,
>>   	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>>   	.destroy = ast_crtc_destroy,
>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
