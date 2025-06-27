Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F155DAEB68D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB94010E9D4;
	Fri, 27 Jun 2025 11:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AxAVE4Pi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FDP2bQxz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LF4mjw0J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3cNaFWgD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207F510E9E2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 11:36:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A724F21168;
 Fri, 27 Jun 2025 11:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751024169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0AlFsNqL4V3TGcpyjHJNDkkPEW0oP8NBHquJ8G7mlNM=;
 b=AxAVE4PijmKzTOshxXrRtObTf1ZSDah/5zvkf171z0oCE8QwQ8e2HymJNtIP1zM/1/Bc4F
 zyaPlIBy/4d2O2CFs5jVmJ29A8iW6YhUd6k/lYes7BZwnY9aOI/ThY4zYVdyjWRQHNj034
 ave+1ibdkb2CoZb3qz4E/p33trQSia0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751024169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0AlFsNqL4V3TGcpyjHJNDkkPEW0oP8NBHquJ8G7mlNM=;
 b=FDP2bQxzNfeGTge555MjRRldFBLu3vSYYHICR01/t71URX7lIaSZlC5y93DhLrsbM3gy3B
 JKl9K4BrYUPcFqBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751024168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0AlFsNqL4V3TGcpyjHJNDkkPEW0oP8NBHquJ8G7mlNM=;
 b=LF4mjw0JaGUkjvau6jmklBM6G371b0uYK+OxbNrxPPoSUOE2+jphTEw7wpUZ7OxOeyU2lJ
 EpHX2BsQS7S+JibxbJh20AMopisR8n9qpZJHw/Ef4+67N/2ZevagPMbZ+gsCGFGf553KXE
 fvnMsB78mV3Dn+MsYW36p6RaLDeW6m8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751024168;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0AlFsNqL4V3TGcpyjHJNDkkPEW0oP8NBHquJ8G7mlNM=;
 b=3cNaFWgDUKFjAto26V44rYvq0mp5Bi+qsI4XQFHWHZeHAbkVV5TRoIb2t9pWQsKMCUFkNt
 HDNpGGe/9W8ENFBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E8ED138A7;
 Fri, 27 Jun 2025 11:36:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ieT+ESiCXmjQGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Jun 2025 11:36:08 +0000
Message-ID: <f7c816a7-e93e-4146-80dc-8fec6113fcea@suse.de>
Date: Fri, 27 Jun 2025 13:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] fbdev/simplefb: Add support for interconnect paths
To: Javier Martinez Canillas <javierm@redhat.com>,
 Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-5-f69b86cd3d7d@fairphone.com>
 <87ldpdd3dn.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87ldpdd3dn.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,fairphone.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,gmx.de];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TAGGED_RCPT(0.00)[dt];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, fairphone.com:email]
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

Am 27.06.25 um 09:56 schrieb Javier Martinez Canillas:
> Luca Weiss <luca.weiss@fairphone.com> writes:
>
>> Some devices might require keeping an interconnect path alive so that
>> the framebuffer continues working. Add support for that by setting the
>> bandwidth requirements appropriately for all provided interconnect
>> paths.
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   drivers/video/fbdev/simplefb.c | 83 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 83 insertions(+)
>>
> [...]
>
>> +static void simplefb_detach_icc(void *res)
>> +{
>> +	struct simplefb_par *par = res;
>> +	int i;
>> +
>> +	for (i = par->icc_count - 1; i >= 0; i--) {
>> +		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
>> +			icc_put(par->icc_paths[i]);
>> +	}
>> +}
>> +
>> +static int simplefb_attach_icc(struct simplefb_par *par,
>> +			       struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int ret, count, i;
>> +
>> +	count = of_count_phandle_with_args(dev->of_node, "interconnects",
>> +							 "#interconnect-cells");
>> +	if (count < 0)
>> +		return 0;
>> +
>> +	/* An interconnect path consists of two elements */
>> +	if (count % 2) {
>> +		dev_err(dev, "invalid interconnects value\n");
>> +		return -EINVAL;
>> +	}
>> +	par->icc_count = count / 2;
>> +
>> +	par->icc_paths = devm_kcalloc(dev, par->icc_count,
>> +				      sizeof(*par->icc_paths),
>> +				      GFP_KERNEL);
>> +	if (!par->icc_paths)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < par->icc_count; i++) {
>> +		par->icc_paths[i] = of_icc_get_by_index(dev, i);
>> +		if (IS_ERR_OR_NULL(par->icc_paths[i])) {
>> +			ret = PTR_ERR(par->icc_paths[i]);
>> +			if (ret == -EPROBE_DEFER)
>> +				goto err;
>> +			dev_err(dev, "failed to get interconnect path %u: %d\n", i, ret);
>> +			continue;
>> +		}
>> +
>> +		ret = icc_set_bw(par->icc_paths[i], 0, UINT_MAX);
>> +		if (ret) {
>> +			dev_err(dev, "failed to set interconnect bandwidth %u: %d\n", i, ret);
>> +			continue;
>> +		}
>> +	}
>> +
>> +	return devm_add_action_or_reset(dev, simplefb_detach_icc, par);
>> +
>> +err:
>> +	while (i) {
>> +		--i;
>> +		if (!IS_ERR_OR_NULL(par->icc_paths[i]))
>> +			icc_put(par->icc_paths[i]);
>> +	}
>> +	return ret;
>> +}
>> +#else
> These two functions contain the same logic that you are using in the
> simpledrm driver. I wonder if could be made helpers so that the code
> isn't duplicated in both drivers.

No please not!. Any work should rather be directed towards deleting 
simplefb entirely.

Best regards
Thomas

>
> But in any case it could be a follow-up of your series I think.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

