Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3AC9506A6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 15:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C022510E359;
	Tue, 13 Aug 2024 13:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HQyieqHh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d5zwIPJx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HQyieqHh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d5zwIPJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB7710E359
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 13:37:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B8346227F0;
 Tue, 13 Aug 2024 13:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723556237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=seNHqNV6jju2OasX9akxnbsnWIiDEyvas8Q58gIkFQg=;
 b=HQyieqHhePKDPgs9hU3IrjJfrc8YZA5uytqPIh4nueknq57IOsVCNGEDhNCWj8rpqiYrix
 c0wUSiKQgTfcMjfTxppKnRYfKEJBHKWahWn28qbowkO1R2ucSqmUCX/QGHRq5g4Q20OAAe
 bcXHCgfeUMA6+GxOklHNr91emlNBeAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723556237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=seNHqNV6jju2OasX9akxnbsnWIiDEyvas8Q58gIkFQg=;
 b=d5zwIPJx5OV1nedU+WjTy3Q+JriHGCJSATrOn3lFL3I7qiYMU7quGUNTq2HyMP6S0VQ0sQ
 Wv4OIHocty6611CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723556237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=seNHqNV6jju2OasX9akxnbsnWIiDEyvas8Q58gIkFQg=;
 b=HQyieqHhePKDPgs9hU3IrjJfrc8YZA5uytqPIh4nueknq57IOsVCNGEDhNCWj8rpqiYrix
 c0wUSiKQgTfcMjfTxppKnRYfKEJBHKWahWn28qbowkO1R2ucSqmUCX/QGHRq5g4Q20OAAe
 bcXHCgfeUMA6+GxOklHNr91emlNBeAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723556237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=seNHqNV6jju2OasX9akxnbsnWIiDEyvas8Q58gIkFQg=;
 b=d5zwIPJx5OV1nedU+WjTy3Q+JriHGCJSATrOn3lFL3I7qiYMU7quGUNTq2HyMP6S0VQ0sQ
 Wv4OIHocty6611CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AB3713ABD;
 Tue, 13 Aug 2024 13:37:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sca+HI1hu2ZFGAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Aug 2024 13:37:17 +0000
Message-ID: <49b58a1f-1504-400c-8fd5-a6a85e46a274@suse.de>
Date: Tue, 13 Aug 2024 15:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] drm/ast: Remove BMC output
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240812093211.382263-1-tzimmermann@suse.de>
 <20240812093211.382263-10-tzimmermann@suse.de>
 <d5adc9b9-2536-439f-b7a2-58677135872b@redhat.com>
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
In-Reply-To: <d5adc9b9-2536-439f-b7a2-58677135872b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
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

Am 13.08.24 um 15:20 schrieb Jocelyn Falempe:
>
>
> On 12/08/2024 11:30, Thomas Zimmermann wrote:
>> Ast's BMC connector tracks the status of an underlying physical
>> connector and updates the BMC status accordingly. This functionality
>> works around GNOME's settings app, which cannot handle multiple
>> outputs on the same CRTC.
>>
>> The workaround is now obsolete as all code for physical outputs
>> handle BMC support internally. Hence, remove the driver's code and
>> the BMC output entirely.
>>
> Thanks, it looks good to me.
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com> +

Thanks for reviewing. If no further comments come in, I'll merge the 
patchset later this week.

Best regards
Thomas

>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/ast/ast_drv.h  |   4 --
>>   drivers/gpu/drm/ast/ast_mode.c | 107 ---------------------------------
>>   2 files changed, 111 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h 
>> b/drivers/gpu/drm/ast/ast_drv.h
>> index 3a4f80cb5c0f..a4cde495fde4 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -206,10 +206,6 @@ struct ast_device {
>>               struct drm_encoder encoder;
>>               struct drm_connector connector;
>>           } astdp;
>> -        struct {
>> -            struct drm_encoder encoder;
>> -            struct ast_bmc_connector bmc_connector;
>> -        } bmc;
>>       } output;
>>         bool support_wide_screen;
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index d823e9d85b04..ed496fb32bf3 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -34,10 +34,8 @@
>>     #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>> -#include <drm/drm_atomic_state_helper.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_damage_helper.h>
>> -#include <drm/drm_edid.h>
>>   #include <drm/drm_format_helper.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>> @@ -1309,103 +1307,6 @@ static int ast_crtc_init(struct drm_device *dev)
>>       return 0;
>>   }
>>   -/*
>> - * BMC virtual Connector
>> - */
>> -
>> -static const struct drm_encoder_funcs ast_bmc_encoder_funcs = {
>> -    .destroy = drm_encoder_cleanup,
>> -};
>> -
>> -static int ast_bmc_connector_helper_detect_ctx(struct drm_connector 
>> *connector,
>> -                           struct drm_modeset_acquire_ctx *ctx,
>> -                           bool force)
>> -{
>> -    struct ast_bmc_connector *bmc_connector = 
>> to_ast_bmc_connector(connector);
>> -    struct drm_connector *physical_connector = 
>> bmc_connector->physical_connector;
>> -
>> -    /*
>> -     * Most user-space compositors cannot handle more than one 
>> connected
>> -     * connector per CRTC. Hence, we only mark the BMC as connected 
>> if the
>> -     * physical connector is disconnected. If the physical 
>> connector's status
>> -     * is connected or unknown, the BMC remains disconnected. This 
>> has no
>> -     * effect on the output of the BMC.
>> -     *
>> -     * FIXME: Remove this logic once user-space compositors can 
>> handle more
>> -     *        than one connector per CRTC. The BMC should always be 
>> connected.
>> -     */
>> -
>> -    if (physical_connector && physical_connector->status == 
>> connector_status_disconnected)
>> -        return connector_status_connected;
>> -
>> -    return connector_status_disconnected;
>> -}
>> -
>> -static int ast_bmc_connector_helper_get_modes(struct drm_connector 
>> *connector)
>> -{
>> -    return drm_add_modes_noedid(connector, 4096, 4096);
>> -}
>> -
>> -static const struct drm_connector_helper_funcs 
>> ast_bmc_connector_helper_funcs = {
>> -    .get_modes = ast_bmc_connector_helper_get_modes,
>> -    .detect_ctx = ast_bmc_connector_helper_detect_ctx,
>> -};
>> -
>> -static const struct drm_connector_funcs ast_bmc_connector_funcs = {
>> -    .reset = drm_atomic_helper_connector_reset,
>> -    .fill_modes = drm_helper_probe_single_connector_modes,
>> -    .destroy = drm_connector_cleanup,
>> -    .atomic_duplicate_state = 
>> drm_atomic_helper_connector_duplicate_state,
>> -    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> -};
>> -
>> -static int ast_bmc_connector_init(struct drm_device *dev,
>> -                  struct ast_bmc_connector *bmc_connector,
>> -                  struct drm_connector *physical_connector)
>> -{
>> -    struct drm_connector *connector = &bmc_connector->base;
>> -    int ret;
>> -
>> -    ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
>> -                 DRM_MODE_CONNECTOR_VIRTUAL);
>> -    if (ret)
>> -        return ret;
>> -
>> -    drm_connector_helper_add(connector, 
>> &ast_bmc_connector_helper_funcs);
>> -
>> -    bmc_connector->physical_connector = physical_connector;
>> -
>> -    return 0;
>> -}
>> -
>> -static int ast_bmc_output_init(struct ast_device *ast,
>> -                   struct drm_connector *physical_connector)
>> -{
>> -    struct drm_device *dev = &ast->base;
>> -    struct drm_crtc *crtc = &ast->crtc;
>> -    struct drm_encoder *encoder = &ast->output.bmc.encoder;
>> -    struct ast_bmc_connector *bmc_connector = 
>> &ast->output.bmc.bmc_connector;
>> -    struct drm_connector *connector = &bmc_connector->base;
>> -    int ret;
>> -
>> -    ret = drm_encoder_init(dev, encoder,
>> -                   &ast_bmc_encoder_funcs,
>> -                   DRM_MODE_ENCODER_VIRTUAL, "ast_bmc");
>> -    if (ret)
>> -        return ret;
>> -    encoder->possible_crtcs = drm_crtc_mask(crtc);
>> -
>> -    ret = ast_bmc_connector_init(dev, bmc_connector, 
>> physical_connector);
>> -    if (ret)
>> -        return ret;
>> -
>> -    ret = drm_connector_attach_encoder(connector, encoder);
>> -    if (ret)
>> -        return ret;
>> -
>> -    return 0;
>> -}
>> -
>>   /*
>>    * Mode config
>>    */
>> @@ -1457,7 +1358,6 @@ static const struct drm_mode_config_funcs 
>> ast_mode_config_funcs = {
>>   int ast_mode_config_init(struct ast_device *ast)
>>   {
>>       struct drm_device *dev = &ast->base;
>> -    struct drm_connector *physical_connector = NULL;
>>       int ret;
>>         ret = drmm_mutex_init(dev, &ast->modeset_lock);
>> @@ -1502,29 +1402,22 @@ int ast_mode_config_init(struct ast_device *ast)
>>           ret = ast_vga_output_init(ast);
>>           if (ret)
>>               return ret;
>> -        physical_connector = &ast->output.vga.connector;
>>       }
>>       if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
>>           ret = ast_sil164_output_init(ast);
>>           if (ret)
>>               return ret;
>> -        physical_connector = &ast->output.sil164.connector;
>>       }
>>       if (ast->tx_chip_types & AST_TX_DP501_BIT) {
>>           ret = ast_dp501_output_init(ast);
>>           if (ret)
>>               return ret;
>> -        physical_connector = &ast->output.dp501.connector;
>>       }
>>       if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
>>           ret = ast_astdp_output_init(ast);
>>           if (ret)
>>               return ret;
>> -        physical_connector = &ast->output.astdp.connector;
>>       }
>> -    ret = ast_bmc_output_init(ast, physical_connector);
>> -    if (ret)
>> -        return ret;
>>         drm_mode_config_reset(dev);
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

