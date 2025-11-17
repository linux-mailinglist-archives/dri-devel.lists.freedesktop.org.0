Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5678C64D28
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1574910E369;
	Mon, 17 Nov 2025 15:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IsaZG9eZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E3F10E369
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763392489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kx8ZUuPVQ5znIDs7P4S73XyxKgfUqqBlKv9cHIMA/P0=;
 b=IsaZG9eZWHsqKLzh5Xp4iXhoMnyVHDo+VtcwTma46UG4GUstFvTgOKjMzC2tkxFvHjcLtu
 T7X5uV8WVtpdM5eshLo++m/XhzRw/lyJchx4wmKHGx3egObvEHm/T8aBY7Tbl/TbGKZ3Xs
 RvEPbfG0s1x5gedAiKj8HvroUDJ2/kM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-Gx-rrkVQNfCOdBj3jOjvDA-1; Mon, 17 Nov 2025 10:14:47 -0500
X-MC-Unique: Gx-rrkVQNfCOdBj3jOjvDA-1
X-Mimecast-MFC-AGG-ID: Gx-rrkVQNfCOdBj3jOjvDA_1763392487
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477a1e2b372so15399925e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763392486; x=1763997286;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kx8ZUuPVQ5znIDs7P4S73XyxKgfUqqBlKv9cHIMA/P0=;
 b=tILAGHRR/hHjSOp4ZqTQc/7rIPvWLurMs3IPyK7iX7lr9+08I3931b2ftTiqehzGiF
 bVKDCKLvVrRiioYhJf6B59r1bgMPObf0ad3FSKZx8xcFrYO3pA7av/uXsYVA6JJMkVjt
 7XQ7hx031E5u4N8l21uxjXmzY/7I7hhUdxGeUfD2sQ/5DVtk3iKBYUkrauRTsOtJSNcJ
 1mxI2ZQ+AEqp7/r4pldc0iherdLSDj9qo3Hs09r0Tb3XESJjQB25lHHmYDTbtz2JP0AY
 s4CYcbiVO7Q6bHyH98tMqphIhA1zqU1bpy1YTQGp5ZDuJlpoaukYcNu244Rx8yR7f0LT
 l+pA==
X-Gm-Message-State: AOJu0YxLghNqJqLZS0NYabdAZytowxrQSHNKbd0YclVSRCcP6cobaXjt
 fLIUhAGVV0PbcK7XK1tIDPcQiX5bCIYgIyfcvaccJ/CPb1I7WMf0MEj5d21cycH2BxoWg+N6Zkl
 LNQBPTPu+Oop0y9s40Zz3Gv0kdMJ2X1csC8h/7NIjRZFQeJGBBccyClQFz0FPuf1v7aRw7g==
X-Gm-Gg: ASbGncu0Ode3CZtyHs5ay7if8Uo1+4jqdDcfi0Km9IEGIhdp08VZyOScR9J7BFpRT3m
 db54UyVZLB6w/i1Wy/1O5Ej0adUnTAf577B/vBYd0LEvEMk09/o7mu0mNXhjLy7gtdMrdwF5X6X
 LGP2UITlmhNF0tVcITjSMizS1JYmAU0rLLPRNs0xjlWh8wUlCmRHwKIpiw6v2GbgCWVi66je9a+
 V9wH3pw5NCYxZStw+L2dJxLmt+NTFBNpWjo55djfRhYzBVkZavbycfAxv2KVS32ue1gYexERSdc
 hfmPD1NOTQ5z/sYNle61VoK0QBz9F1ih9M/zXCarEd0grTeKx7gv8r8aILbaYgwrJFqWbzG4HMX
 GUpTjeJujTsY4M1eV5sQBscClB6iSRV6FxlnluoO4eNIAU8KgWEQ9dKtmRXKFtplKf685
X-Received: by 2002:a05:600c:8b4b:b0:477:755b:5587 with SMTP id
 5b1f17b1804b1-4778fe55405mr135076695e9.8.1763392486530; 
 Mon, 17 Nov 2025 07:14:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1Imhn+5hGc5232CXEsbuOoPXvPaiufKMMUFle9A3qt/AF8KRLMNtNt270jXisxDN8USi6Ng==
X-Received: by 2002:a05:600c:8b4b:b0:477:755b:5587 with SMTP id
 5b1f17b1804b1-4778fe55405mr135076405e9.8.1763392486109; 
 Mon, 17 Nov 2025 07:14:46 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e2bcf9sm313765805e9.3.2025.11.17.07.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 07:14:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, deller@gmx.de, lukas@wunner.de,
 ville.syrjala@linux.intel.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] drm, fbcon, vga_switcheroo: Avoid race condition in
 fbcon setup
In-Reply-To: <9306d41f-6afc-4277-9198-a23e51cbd9f6@suse.de>
References: <20251105161549.98836-1-tzimmermann@suse.de>
 <87fradkkzp.fsf@ocarina.mail-host-address-is-not-set>
 <9306d41f-6afc-4277-9198-a23e51cbd9f6@suse.de>
Date: Mon, 17 Nov 2025 16:14:44 +0100
Message-ID: <87cy5glmhn.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RZCrYucoq2f9D3TTaUQA9ugDxs-SyUMM2m2ff4ikGs4_1763392487
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 17.11.25 um 11:32 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>> Hello Thomas,
>>
>>> Protect vga_switcheroo_client_fb_set() with console lock. Avoids OOB
>>> access in fbcon_remap_all(). Without holding the console lock the call
>>> races with switching outputs.
>>>
>>> VGA switcheroo calls fbcon_remap_all() when switching clients. The fbcon
>>> function uses struct fb_info.node, which is set by register_framebuffer().
>>> As the fb-helper code currently sets up VGA switcheroo before registering
>>> the framebuffer, the value of node is -1 and therefore not a legal value.
>>> For example, fbcon uses the value within set_con2fb_map() [1] as an index
>>> into an array.
>>>
>>> Moving vga_switcheroo_client_fb_set() after register_framebuffer() can
>>> result in VGA switching that does not switch fbcon correctly.
>>>
>>> Therefore move vga_switcheroo_client_fb_set() under fbcon_fb_registered(),
>>> which already holds the console lock. Fbdev calls fbcon_fb_registered()
>>> from within register_framebuffer(). Serializes the helper with VGA
>>> switcheroo's call to fbcon_remap_all().
>>>
>>> Although vga_switcheroo_client_fb_set() takes an instance of struct fb_info
>>> as parameter, it really only needs the contained fbcon state. Moving the
>>> call to fbcon initialization is therefore cleaner than before. Only amdgpu,
>>> i915, nouveau and radeon support vga_switcheroo. For all other drivers,
>>> this change does nothing.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Link: https://elixir.bootlin.com/linux/v6.17/source/drivers/video/fbdev/core/fbcon.c#L2942 # [1]
>>> ---
>> I'm not that familiar with fbcon and vga_switcheroo to properly review
>> your patch but after reading the explanation in the commit message and
>> reading the diff, the change does make sense to me.
>>
>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>>
>> But I think that would be good if you get some testing for the drivers
>> that make use of vga_switcheroo. Also, do you need a Fixes tag ?
>
> I've ran the testing on amdgpu and i915 so that nothing breaks. The bug 
> is hard to reproduce though. I've discovered it by reading the code.
>

Thanks.

I usually put that kind of information between the --- separator and the
start of the diff. Since that info can be useful for reviewers and doesn't
end in the commited patch, due tools like `git am` omitting that section.

> About Fixes, the problem has been in the code forever. So IDK what Fixes 
> would make sense. Just in case:
>

I see. Then I agree that having the tag is less useful.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

