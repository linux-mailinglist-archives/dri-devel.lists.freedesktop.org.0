Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD58C1EFB
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 09:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1577110E0C1;
	Fri, 10 May 2024 07:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MzzrrDtt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BMiGYrU7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MzzrrDtt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BMiGYrU7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C150810E0C1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 07:32:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 74EBB350F8;
 Fri, 10 May 2024 07:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715326322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qgLTu6ojNC1LYvNtdAHcRvXL7v76gaVC0vMu+ow8NCA=;
 b=MzzrrDttOIy+esuAr88JvIiM8lYckYKuioeESsATlJ7kVuuqi3d40CDtJXAawdAo7FDS+O
 T5EaTfTo8RTf4/vIlXOQPElWGYps8lOSDxN4A4YaUcO+8S43Ip3g5HWZU1K7gLe+czlNHA
 FVAAFRc/mWP7gvRrQwI5Qw+bgcZO9Sc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715326322;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qgLTu6ojNC1LYvNtdAHcRvXL7v76gaVC0vMu+ow8NCA=;
 b=BMiGYrU7LRTDT66q+UbW/BOVxgPEokA6r2/QKkB1tYzbSt3DeT4zISK71MkltWRti3+M4o
 raCCdU3OpWyTnLDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715326322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qgLTu6ojNC1LYvNtdAHcRvXL7v76gaVC0vMu+ow8NCA=;
 b=MzzrrDttOIy+esuAr88JvIiM8lYckYKuioeESsATlJ7kVuuqi3d40CDtJXAawdAo7FDS+O
 T5EaTfTo8RTf4/vIlXOQPElWGYps8lOSDxN4A4YaUcO+8S43Ip3g5HWZU1K7gLe+czlNHA
 FVAAFRc/mWP7gvRrQwI5Qw+bgcZO9Sc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715326322;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qgLTu6ojNC1LYvNtdAHcRvXL7v76gaVC0vMu+ow8NCA=;
 b=BMiGYrU7LRTDT66q+UbW/BOVxgPEokA6r2/QKkB1tYzbSt3DeT4zISK71MkltWRti3+M4o
 raCCdU3OpWyTnLDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F87B139AA;
 Fri, 10 May 2024 07:32:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lmHtFXLNPWYXEwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 May 2024 07:32:02 +0000
Message-ID: <d8822317-db81-4179-93b8-18629a95af73@suse.de>
Date: Fri, 10 May 2024 09:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: simpledrm, running display servers, and drivers replacing
 simpledrm while the display server is running
To: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org
References: <9215788.EvYhyI6sBW.ref@nerdopolis2>
 <9215788.EvYhyI6sBW@nerdopolis2>
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
In-Reply-To: <9215788.EvYhyI6sBW@nerdopolis2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.996]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[verizon.net];
 FREEMAIL_TO(0.00)[verizon.net,lists.freedesktop.org];
 RCPT_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_SOME(0.00)[]
X-Spam-Score: -4.29
X-Spam-Flag: NO
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

Am 09.05.24 um 15:06 schrieb nerdopolis:
>
> Hi
>
>
> So I have been made aware of an apparent race condition of some 
> drivers taking a bit longer to load, which could lead to a possible 
> race condition of display servers/greeters using the simpledrm device, 
> and then experiencing problems once the real driver loads, the 
> simpledrm device that the display servers are using as their primary 
> GPU goes away.
>
>
> For example Weston crashes, Xorg crashes, wlroots seems to stay 
> running, but doesn't draw anything on the screen, kwin aborts,
>
> This is if you boot on a QEMU machine with the virtio card, with 
> modprobe.blacklist=virtio_gpu, and then, when the display server is 
> running, run sudo modprobe virtio-gpu
>
>
> Namely, it's been recently reported here: 
> https://github.com/sddm/sddm/issues/1917 and here 
> https://github.com/systemd/systemd/issues/32509
>
>
> My thinking: Instead of simpledrm's /dev/dri/card0 device going away 
> when the real driver loads, is it possible for simpledrm to instead 
> simulate an unplug of the fake display/CRTC?
>

To my knowledge, there's no hotplugging for CRTCs.

> That way in theory, the simpledrm device will now be useless for 
> drawing for drawing to the screen at that point, since the real driver 
> is now taken over, but this way here, at least the display server 
> doesn't lose its handles to the /dev/dri/card0 device, (and then maybe 
> only remove itself once the final handle to it closes?)
>
>
> Is something like this possible to do with the way simpledrm works 
> with the low level video memory? Or is this not possible?
>

Userspace needs to be prepared that graphics devices can do hotplugging. 
The correct solution is to make compositors work without graphics devices.

The next best solution is to keep the final DRM device open until a new 
one shows up. All DRM graphics drivers with hotplugging support are 
required to accept commands after their hardware has been unplugged. 
They simply won't display anything.

Best regards
Thomas


>
> Thanks
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

