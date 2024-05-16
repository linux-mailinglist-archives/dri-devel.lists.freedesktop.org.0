Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2099B8C790C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 17:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409FD10E0EF;
	Thu, 16 May 2024 15:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UebOtaG3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wb8aJBkz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UebOtaG3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wb8aJBkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEE910E07B;
 Thu, 16 May 2024 15:11:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 418BF5C5E4;
 Thu, 16 May 2024 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715872271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TWsNhdWC+0hz6kWSSDfih1pRgMNTkptNUpRyAltINrw=;
 b=UebOtaG3lxF0EPaVhKqZa09gwg6UeTbPsWFjZLxdadpqZizNe38XBHMINlf5TBEHFUAx0H
 pZj+gkskQVQHipYxfCql/onDzxm7Ue0H0x4SlHsSsbVaqjMM5473Yxp6+Ab5r9/vRhPNkt
 ULJr+pIdPBcj4YbuXdeL6p4yH2TZVwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715872271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TWsNhdWC+0hz6kWSSDfih1pRgMNTkptNUpRyAltINrw=;
 b=Wb8aJBkzZ+Woy0F43imZ9zb9vAOhO2yTHxvJBtcEhCjcZYC9YUhqJBsDxmk7MOBXGWFTng
 A6ghL1ZfgAu4OEDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715872271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TWsNhdWC+0hz6kWSSDfih1pRgMNTkptNUpRyAltINrw=;
 b=UebOtaG3lxF0EPaVhKqZa09gwg6UeTbPsWFjZLxdadpqZizNe38XBHMINlf5TBEHFUAx0H
 pZj+gkskQVQHipYxfCql/onDzxm7Ue0H0x4SlHsSsbVaqjMM5473Yxp6+Ab5r9/vRhPNkt
 ULJr+pIdPBcj4YbuXdeL6p4yH2TZVwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715872271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TWsNhdWC+0hz6kWSSDfih1pRgMNTkptNUpRyAltINrw=;
 b=Wb8aJBkzZ+Woy0F43imZ9zb9vAOhO2yTHxvJBtcEhCjcZYC9YUhqJBsDxmk7MOBXGWFTng
 A6ghL1ZfgAu4OEDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8966137C3;
 Thu, 16 May 2024 15:11:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id t7ONNw4iRmblewAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 16 May 2024 15:11:10 +0000
Message-ID: <82731e7d-e34f-46c4-8f54-c5d7d3d60b5a@suse.de>
Date: Thu, 16 May 2024 17:11:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ACPI: video: Fix name collision with architecture's
 video.o
To: Hans de Goede <hdegoede@redhat.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>
Cc: lenb@kernel.org, arnd@arndb.de, chaitanya.kumar.borah@intel.com,
 suresh.kumar.kurmi@intel.com, jani.saarinen@intel.com,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240516124317.710-1-tzimmermann@suse.de>
 <CAJZ5v0gw620SLfxM66FfVeWMTN=dSZZtpH-=mFT_0HsumT3SsA@mail.gmail.com>
 <1850b44d-e468-44db-82b7-f57e77fe49ba@redhat.com>
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
In-Reply-To: <1850b44d-e468-44db-82b7-f57e77fe49ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.29
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[archlinux.org:url,suse.de:email]
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

Am 16.05.24 um 17:03 schrieb Hans de Goede:
> Hi,
>
> On 5/16/24 3:04 PM, Rafael J. Wysocki wrote:
>> CC Hans who has been doing the majority of the ACPI video work.
>>
>> On Thu, May 16, 2024 at 2:43 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Commit 2fd001cd3600 ("arch: Rename fbdev header and source files")
>>> renames the video source files under arch/ such that they does not
>>> refer to fbdev any longer. The new files named video.o conflict with
>>> ACPI's video.ko module.
>> And surely nobody knew or was unable to check upfront that there was a
>> video.ko already in the kernel.
> Sorry, but nack for this change. I very deliberately kept the module-name
> as video when renaming the actual .c file from video.c to acpi_video.c
> because many people pass drivers/video/acpi_video.c module arguments
> on the kernel commandline using video.param=val .
>
> Try e.g. doing a duckduckgo search for 1 off:
>
> "video.only_lcd"
> "video.allow_duplicates"
> "video.brightness_switch_enabled"

Ok, that makes sense. I'll rename the other files.

Best regards
Thomas

>
> And you will find a lot of hits. The last one is even documented as
> being "video.brightness_switch_enabled" in the main kernel-parameters.txt
> as well as separately:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/kernel-parameters.txt#n39
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/kernel-parameters.txt#n7152
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/firmware-guide/acpi/video_extension.rst#n118
>
> https://wiki.archlinux.org/title/Lenovo_ThinkPad_X1_Carbon#Brightness_control
>
> If you rename this module then peoples config will break for
> a whole lot of users.
>
> So lets not do that and lets rename the new module which is causing
> the conflict in the first place instead.
>
> Regards,
>
> Hans
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

