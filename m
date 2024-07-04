Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF29275C5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 14:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A8110EAB7;
	Thu,  4 Jul 2024 12:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WLoevO+N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WiCRhc82";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WLoevO+N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WiCRhc82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB96D10EAB5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 12:16:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E1FA2197E;
 Thu,  4 Jul 2024 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720095400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iE0cGMTjgno2BNOENEpExvNLplyG+PROxhp43+zycVA=;
 b=WLoevO+NZ3oTBgxi+Irr/OaVQksPQBEJiBv4VkDzdJyO3kRLTTo3yJTlWTSlBVcRVMyGBS
 4GrLFQs3rMr8W8s7Rmo6avg0OUn+LkkPNsR1yWs+sSj4Xq5zof/RMOsA1fhd6Mmkt7tsgx
 zxdqchDQ63I2d+bA09qNLaT1lCHvtBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720095400;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iE0cGMTjgno2BNOENEpExvNLplyG+PROxhp43+zycVA=;
 b=WiCRhc82m8IrbEoP+3XFH+ccUWGbTQ5hxdc6SbfYf5XQ8cVHPbuH93eHr6AWXr/1sJ1Aea
 rftJvS41sH9cRmDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720095400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iE0cGMTjgno2BNOENEpExvNLplyG+PROxhp43+zycVA=;
 b=WLoevO+NZ3oTBgxi+Irr/OaVQksPQBEJiBv4VkDzdJyO3kRLTTo3yJTlWTSlBVcRVMyGBS
 4GrLFQs3rMr8W8s7Rmo6avg0OUn+LkkPNsR1yWs+sSj4Xq5zof/RMOsA1fhd6Mmkt7tsgx
 zxdqchDQ63I2d+bA09qNLaT1lCHvtBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720095400;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iE0cGMTjgno2BNOENEpExvNLplyG+PROxhp43+zycVA=;
 b=WiCRhc82m8IrbEoP+3XFH+ccUWGbTQ5hxdc6SbfYf5XQ8cVHPbuH93eHr6AWXr/1sJ1Aea
 rftJvS41sH9cRmDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 263881369F;
 Thu,  4 Jul 2024 12:16:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oFjAB6iShmZ2CgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Jul 2024 12:16:40 +0000
Message-ID: <119aeaca-9a9f-4914-8730-6dacf72705f5@suse.de>
Date: Thu, 4 Jul 2024 14:16:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/mgag200: Only set VIDRST bits in CRTC modesetting
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240703135502.29190-1-tzimmermann@suse.de>
 <20240703135502.29190-2-tzimmermann@suse.de>
 <bdc20978-933d-4b57-8350-3775fa01e145@redhat.com>
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
In-Reply-To: <bdc20978-933d-4b57-8350-3775fa01e145@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -4.29
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

Hi

Am 04.07.24 um 14:03 schrieb Jocelyn Falempe:
>
>
> On 03/07/2024 15:40, Thomas Zimmermann wrote:
>> The VRSTEN and HRSTEN bits control whether a CRTC synchronizes its
>> display signal with an external source on the VIDRST pin. The G200WB
>> and G200EW3 models synchronize with a BMC chip, but different external
>> video encoders, such as the Matrox Maven, can also be attached to the
>> pin.
>
> If I understand correctly, it's a kind of VSYNC with the BMC, to avoid
> tearing when using the remote console ?

I closely looked through the code behind enable_vidrst and 
disable_vidrst. The involved registers are mostly undocumented, but from 
the comments I assume that the BMC has to stop scanning out the display 
signal. It's likely that it only picks up mode changes after the scanout 
has been re-enabled.

BTW we've seen various models with BMC attached, but only G200EW3 and 
G200WB use this code for synchronization. Do you think we could enable 
it for all models and BMCs?

>
>>
>> Only set VRSTEN and HRSTEN bits in the CRTC mode-setting code, so the
>> driver maintains the bits independently from the BMC. Add the field
>> set_vidrst to the CRTC state for this purpose. Off by default, control
>> the CRTC VIDRST setting from the BMC's atomic_check helper. So if a
>> BMC (or another external clock) requires synchronization, it instructs
>> the CRTC to synchronize. >
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_bmc.c    | 26 +++++++++++++++++++-----
>>   drivers/gpu/drm/mgag200/mgag200_drv.h    |  5 ++++-
>>   drivers/gpu/drm/mgag200/mgag200_g200er.c |  2 +-
>>   drivers/gpu/drm/mgag200/mgag200_g200ev.c |  2 +-
>>   drivers/gpu/drm/mgag200/mgag200_g200se.c |  2 +-
>>   drivers/gpu/drm/mgag200/mgag200_mode.c   | 11 ++++++----
>>   6 files changed, 35 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c 
>> b/drivers/gpu/drm/mgag200/mgag200_bmc.c
>> index 23ef85aa7e37..cb5400333862 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
>> @@ -77,11 +77,6 @@ void mgag200_bmc_enable_vidrst(struct mga_device 
>> *mdev)
>>   {
>>       u8 tmp;
>>   -    /* Ensure that the vrsten and hrsten are set */
>> -    WREG8(MGAREG_CRTCEXT_INDEX, 1);
>> -    tmp = RREG8(MGAREG_CRTCEXT_DATA);
>> -    WREG8(MGAREG_CRTCEXT_DATA, tmp | 0x88);
>> -
>>       /* Assert rstlvl2 */
>>       WREG8(DAC_INDEX, MGA1064_REMHEADCTL2);
>>       tmp = RREG8(DAC_DATA);
>> @@ -108,6 +103,25 @@ void mgag200_bmc_enable_vidrst(struct mga_device 
>> *mdev)
>>       WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
>>   }
>>   +static int mgag200_bmc_encoder_helper_atomic_check(struct 
>> drm_encoder *encoder,
>> +                           struct drm_crtc_state *crtc_state,
>> +                           struct drm_connector_state *conn_state)
>> +{
>> +    struct mga_device *mdev = to_mga_device(encoder->dev);
>> +    struct mgag200_crtc_state *mgag200_crtc_state = 
>> to_mgag200_crtc_state(crtc_state);
>> +
>> +    if (mdev->info->has_vidrst)
>> +        mgag200_crtc_state->set_vidrst = true;
>> +    else
>> +        mgag200_crtc_state->set_vidrst = false;
>> +
>
> I think you can simplify it with:
>
> mgag200_crtc_state->set_vidrst = mdev->info->has_vidrst;

Ok.

Best regards
Thomas


>
>> +    return 0;
>> +}
>> +
>> +static const struct drm_encoder_helper_funcs 
>> mgag200_bmc_encoder_helper_funcs = {
>> +    .atomic_check = mgag200_bmc_encoder_helper_atomic_check,
>> +};
>> +
>>   static const struct drm_encoder_funcs mgag200_bmc_encoder_funcs = {
>>       .destroy = drm_encoder_cleanup,
>>   };
>> @@ -190,6 +204,8 @@ int mgag200_bmc_output_init(struct mga_device 
>> *mdev, struct drm_connector *physi
>>                      DRM_MODE_ENCODER_VIRTUAL, NULL);
>>       if (ret)
>>           return ret;
>> +    drm_encoder_helper_add(encoder, &mgag200_bmc_encoder_helper_funcs);
>> +
>>       encoder->possible_crtcs = drm_crtc_mask(crtc);
>>         bmc_connector = &mdev->output.bmc.bmc_connector;
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h 
>> b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> index 7f7dfbd0f013..4b75613de882 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -179,6 +179,8 @@ struct mgag200_crtc_state {
>>       const struct drm_format_info *format;
>>         struct mgag200_pll_values pixpllc;
>> +
>> +    bool set_vidrst;
>>   };
>>     static inline struct mgag200_crtc_state 
>> *to_mgag200_crtc_state(struct drm_crtc_state *base)
>> @@ -430,7 +432,8 @@ void mgag200_crtc_atomic_destroy_state(struct 
>> drm_crtc *crtc, struct drm_crtc_st
>>       .atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
>>       .atomic_destroy_state = mgag200_crtc_atomic_destroy_state
>>   -void mgag200_set_mode_regs(struct mga_device *mdev, const struct 
>> drm_display_mode *mode);
>> +void mgag200_set_mode_regs(struct mga_device *mdev, const struct 
>> drm_display_mode *mode,
>> +               bool set_vidrst);
>>   void mgag200_set_format_regs(struct mga_device *mdev, const struct 
>> drm_format_info *format);
>>   void mgag200_enable_display(struct mga_device *mdev);
>>   void mgag200_init_registers(struct mga_device *mdev);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200er.c
>> index 4e8a1756138d..abfbed6ec390 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
>> @@ -195,7 +195,7 @@ static void 
>> mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>           funcs->disable_vidrst(mdev);
>>         mgag200_set_format_regs(mdev, format);
>> -    mgag200_set_mode_regs(mdev, adjusted_mode);
>> +    mgag200_set_mode_regs(mdev, adjusted_mode, 
>> mgag200_crtc_state->set_vidrst);
>>         if (funcs->pixpllc_atomic_update)
>>           funcs->pixpllc_atomic_update(crtc, old_state);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>> index d884f3cb0ec7..acc99999e2b5 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>> @@ -196,7 +196,7 @@ static void 
>> mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>           funcs->disable_vidrst(mdev);
>>         mgag200_set_format_regs(mdev, format);
>> -    mgag200_set_mode_regs(mdev, adjusted_mode);
>> +    mgag200_set_mode_regs(mdev, adjusted_mode, 
>> mgag200_crtc_state->set_vidrst);
>>         if (funcs->pixpllc_atomic_update)
>>           funcs->pixpllc_atomic_update(crtc, old_state);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> index a824bb8ad579..be4e124102c6 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> @@ -327,7 +327,7 @@ static void 
>> mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>           funcs->disable_vidrst(mdev);
>>         mgag200_set_format_regs(mdev, format);
>> -    mgag200_set_mode_regs(mdev, adjusted_mode);
>> +    mgag200_set_mode_regs(mdev, adjusted_mode, 
>> mgag200_crtc_state->set_vidrst);
>>         if (funcs->pixpllc_atomic_update)
>>           funcs->pixpllc_atomic_update(crtc, old_state);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> index bb6204002cb3..4f4612192e30 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -201,9 +201,9 @@ void mgag200_init_registers(struct mga_device *mdev)
>>       WREG8(MGA_MISC_OUT, misc);
>>   }
>>   -void mgag200_set_mode_regs(struct mga_device *mdev, const struct 
>> drm_display_mode *mode)
>> +void mgag200_set_mode_regs(struct mga_device *mdev, const struct 
>> drm_display_mode *mode,
>> +               bool set_vidrst)
>>   {
>> -    const struct mgag200_device_info *info = mdev->info;
>>       unsigned int hdisplay, hsyncstart, hsyncend, htotal;
>>       unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
>>       u8 misc, crtcext1, crtcext2, crtcext5;
>> @@ -238,9 +238,11 @@ void mgag200_set_mode_regs(struct mga_device 
>> *mdev, const struct drm_display_mod
>>              ((hdisplay & 0x100) >> 7) |
>>              ((hsyncstart & 0x100) >> 6) |
>>               (htotal & 0x40);
>> -    if (info->has_vidrst)
>> +    if (set_vidrst)
>>           crtcext1 |= MGAREG_CRTCEXT1_VRSTEN |
>>                   MGAREG_CRTCEXT1_HRSTEN;
>> +    else
>> +        crtcext1 &= ~(MGAREG_CRTCEXT1_VRSTEN | MGAREG_CRTCEXT1_HRSTEN);
>>         crtcext2 = ((vtotal & 0xc00) >> 10) |
>>              ((vdisplay & 0x400) >> 8) |
>> @@ -656,7 +658,7 @@ void mgag200_crtc_helper_atomic_enable(struct 
>> drm_crtc *crtc, struct drm_atomic_
>>           funcs->disable_vidrst(mdev);
>>         mgag200_set_format_regs(mdev, format);
>> -    mgag200_set_mode_regs(mdev, adjusted_mode);
>> +    mgag200_set_mode_regs(mdev, adjusted_mode, 
>> mgag200_crtc_state->set_vidrst);
>>         if (funcs->pixpllc_atomic_update)
>>           funcs->pixpllc_atomic_update(crtc, old_state);
>> @@ -717,6 +719,7 @@ struct drm_crtc_state 
>> *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc
>>       new_mgag200_crtc_state->format = mgag200_crtc_state->format;
>>       memcpy(&new_mgag200_crtc_state->pixpllc, 
>> &mgag200_crtc_state->pixpllc,
>>              sizeof(new_mgag200_crtc_state->pixpllc));
>> +    new_mgag200_crtc_state->set_vidrst = 
>> mgag200_crtc_state->set_vidrst;
>>         return &new_mgag200_crtc_state->base;
>>   }
>
> With the small nitpick.
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

