Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF274CB29CA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 10:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9B910E282;
	Wed, 10 Dec 2025 09:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AK3PVh+Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MYadPk56";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AK3PVh+Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MYadPk56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AC210E6C7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 09:57:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C687D5BD21;
 Wed, 10 Dec 2025 09:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765360626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SxPTt3XmlnSFZ18urnZ50SEofQyqnAOgbKd3PNWkJWU=;
 b=AK3PVh+Zwj1d45yK1/GvPYJxAK682XrE9I+zbNCx/L6JobI+840/FSFejJhJ+jLUo9kRGV
 nFTArGtXNSz63JaAiuDFbP/G1eha4lh4DDDztb9m7kbXoi4vCB/yySwlNoiSaG2TKPGOZY
 zU3NXPsox1km1MsIXTfB08GGiEccoLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765360626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SxPTt3XmlnSFZ18urnZ50SEofQyqnAOgbKd3PNWkJWU=;
 b=MYadPk5667M/8uxXnmVc7iryhMbhpcfVCR9ISk5bJ/Px7JwcO3eZFRq5S/ZLxt//a9hrh+
 AKhamL6md6FgQNAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765360626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SxPTt3XmlnSFZ18urnZ50SEofQyqnAOgbKd3PNWkJWU=;
 b=AK3PVh+Zwj1d45yK1/GvPYJxAK682XrE9I+zbNCx/L6JobI+840/FSFejJhJ+jLUo9kRGV
 nFTArGtXNSz63JaAiuDFbP/G1eha4lh4DDDztb9m7kbXoi4vCB/yySwlNoiSaG2TKPGOZY
 zU3NXPsox1km1MsIXTfB08GGiEccoLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765360626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SxPTt3XmlnSFZ18urnZ50SEofQyqnAOgbKd3PNWkJWU=;
 b=MYadPk5667M/8uxXnmVc7iryhMbhpcfVCR9ISk5bJ/Px7JwcO3eZFRq5S/ZLxt//a9hrh+
 AKhamL6md6FgQNAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 069683EA63;
 Wed, 10 Dec 2025 09:57:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WgwzAPJDOWlIagAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Dec 2025 09:57:06 +0000
Message-ID: <f7ebd77f-8a30-4e65-8871-ad5915c310f5@suse.de>
Date: Wed, 10 Dec 2025 10:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/13] drm: Introduce GEM-UMA memory management
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, ogabbay@kernel.org, mamin506@gmail.com,
 lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-doc@vger.kernel.org
References: <20251209140141.94407-1-tzimmermann@suse.de>
 <20251209152734.6851f3ac@fedora>
 <2b95d76e-2672-4cae-a545-73c407f2b20c@suse.de>
 <20251209163011.436e613b@fedora>
 <44d3e6c9-6759-4a76-9016-c9749badab94@suse.de>
 <20251210102157.76f4ec8f@fedora>
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
In-Reply-To: <20251210102157.76f4ec8f@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[28];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,tomeuvizoso.net,imgtec.com,arm.com,collabora.com,igalia.com,redhat.com,chromium.org,lwn.net,lists.freedesktop.org,lists.linux.dev,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLzxzh56npx61idbi11ft8b9pb)];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url, imap1.dmz-prg2.suse.org:helo,
 suse.de:mid]
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

Am 10.12.25 um 10:21 schrieb Boris Brezillon:
[...]
> n that, I agree.
>
>> Also what stops you from fixing any of this in the context of gem-uma?
> That's exactly what I want to do, except that, rather than fixing it,
> I'd like to get it right from the start and progressively move existing
> GPU/accel drivers using gem-shmem to gem-uma. If you blindly move every
> GPU/accel drivers currently using gem-shmem to gem-uma (which is just a
> rebranded gem-shmem), you're just moving the problem, you're not
> solving it. And all of a sudden, gem-uma, which I wanted to be this

Just to be clear, I'm trying to get the simple drivers out of the way 
first. Nothing more. Solving problems with the UMA drivers is out of 
question wrt this series.

> clean slate with well defined rules, on top of which we can more
> easily add building blocks for advanced stuff (reclaim, sparse
> allocation, ...), is back to this far west.

I've done something similar with GEM VRAM helpers a few years back. We 
had drivers running TTM on cinsiderably simple hardware. They all went 
to VRAM helpers at some point Still that took quite some time. With UMA 
the problem seems more complex and the drivers are moving targets. I 
feel like this will take years until you see the fruits of that work. 
All while you have to maintain GEM's UMA and SHMEM code at the same time.

>
>> It should even be easier, as you won't have to keep my use cases in mind.
> I might be wrong, but KMS use cases are probably not the problematic
> ones.
>
>> In parallel, gem-shmem could go in its own direction.
> My understanding is that you're primarily targeting KMS drivers, so why
> don't you fork gem-shem with something called gem-shmem-for-kms (or
> gem-shmem-dumb) that does just enough for you, and nothing more?
>
> I'm saying that with a bit of sarcasm, and I certainly get how painful
> it is to go and patch all KMS drivers to rename things. But if you think
> about it for a second, it's just as painful (if not more) to fork
> gem-uma in all users that might get in the way of a cleaner
> abstraction. Not only that, but all of a sudden, you need a lot more
> synchronization to get that approved, and until that happens, you're
> blocked on the real stuff: designing something that's sounds for
> more complex use cases GPU/accel drivers care about.

There's nothing sarcastic about that. Forking from GEM SHMEM in the 
'opposite direction' would be the other alternative. I can try to 
provide something like GEM sysmem helpers with a simplified 
implementation of GEM shmem that provides what the simple drivers need.

Best regards
Thomas

>
>> I'd like to do
>> some changes and simplifications there, which conflict with where
>> gem-uma will be heading.
> Just to be clear, I'm not going to block this if that's the direction
> people want to take, but I wanted to point out that making it easier for
> you might mean making others' life harder. When I initially proposed to
> fork gem-shmem it was not with the goal of pulling all current
> GPU/accel users in directly, but rather design something that provides
> the same set of features (with the ability to add more), with better
> defined rules, so we don't end up in the same situation. What you're
> doing here is the opposite: gem-uma becomes the gem-shmem's
> forget-about box, and as a result, it becomes someone else's problem.
>
> Regards,
>
> Boris

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


