Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB5EBD1EAA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 10:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A1610E3FC;
	Mon, 13 Oct 2025 08:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PS4HC6v/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A033010E3ED
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760342657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNgRxzTbojhUcy5Nfjro5vW4IMApJi/bgnya/sKGgbg=;
 b=PS4HC6v/9fLVRGUyULFUDVBqIRc80Sd+dSUos+P8Tt1c84EbYWoYjZP2zz40BEIE9MkI8f
 zDhQDu2VZbpXJFvXh6Sz+Pu0YhHE2YMrpjTksK5KcogjfDgRGCFglbDME8k8EE9UTBueio
 NC7liigKB+v45iQADPGQChLo2lgJ0Ok=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-4BPKEIgNN8abZzSSB-D1tg-1; Mon, 13 Oct 2025 04:04:16 -0400
X-MC-Unique: 4BPKEIgNN8abZzSSB-D1tg-1
X-Mimecast-MFC-AGG-ID: 4BPKEIgNN8abZzSSB-D1tg_1760342655
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3efa77de998so4113668f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 01:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760342655; x=1760947455;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=16wu8NKiFa7wsA390Q2IJzGsm9R0LwhwvXIpVe7UC70=;
 b=oWVlWFsHqOBwa8QQp4y2hRxOwL8xrcQfbHv9MaEZMaXvndtMkfF+kQTPPwjqjNhZKz
 H5WTO2QR4p0JfPgaZoJtj41cf1boS49AzerRKbR6c15hBQiwiRrjq27ucCBEFOttZnPA
 PBOCXisER7lrI+ghP8fSDpfnjWGGH9wg4z+5FB957xW2tre8wnAnoJ2Of1Xj+MCXR5fT
 6K80EL+uITQ1Se+o7yz4PqdDhK8hzp3+K6WZVXqkhc909jNbGZnGI1bN0cYYqoCVJQE+
 S0HpPHV/3BtuJPkAyipsk4cSl+8Q6rRCGJTj/HsFTpke/2SZccGQ2ci58CJ/Tcl5J9yk
 3nqg==
X-Gm-Message-State: AOJu0YzgW7MWStx6y70J+wmxp3xmN/njw9HqkPsoZEHvYoEDd38j8+/U
 Uu0QLQopJyi/AX858IO2ZglvwbXNmh8tvm0D2RZEXRG2hDi/NP1hpL3ENr39NEpFoiVeYZM0FQZ
 5qrYJv6cO9hKDmVfoV5FZVCmiAlAsIqmTL5ZO6jZcL0hMExS4DijAfXA5uGwtBrJAWfO0ng==
X-Gm-Gg: ASbGncsmrpvdWcWO4ykjM8UOZkkqCXjodV2ipH/HeSqpcBDczKgXEX4oEvceeqDMEds
 fwqwKkGB7UDERwvwoqGr6QtcrvSfNRJiRcsvFW9f0xisD6ZGz7XBRikZnWNR8jrYc58/qMT7D2l
 ecwbx52sIxWtqYuGwlGmHFxlGRL9jHzy+yTuDmDWwgLMz6JXhmERovGaIfiP+sTA/ttOhUYe2gl
 xSaE+FXpuMuuBtEZnxUrH5m5e6jOjf8vbEaLUlmO+sQOyb7Eyg3GqjEq1P3hhvbTljkyfqW3INX
 +JMpHfQXKD+u3FChC3bvFVPUYHJpPt89MDZwwnFRFtVlsEc8GxkgVwKVBItrdBPf38E7+6DbfVC
 6hSpwi5tXG4qar9XHa1EgCbs=
X-Received: by 2002:a05:6000:1a8a:b0:3f1:ee44:8bf6 with SMTP id
 ffacd0b85a97d-4266e8de00emr12048267f8f.51.1760342655067; 
 Mon, 13 Oct 2025 01:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgAXOu9a2cQ0bmSBcRJChjtvQrEskQFZ6sekkzar6Ywr85/eEH653vy8tmu9ysh0bSFt+2nA==
X-Received: by 2002:a05:6000:1a8a:b0:3f1:ee44:8bf6 with SMTP id
 ffacd0b85a97d-4266e8de00emr12048248f8f.51.1760342654613; 
 Mon, 13 Oct 2025 01:04:14 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb4982b25sm173253135e9.7.2025.10.13.01.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 01:04:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede
 <hansg@kernel.org>, nickblack@linux.com
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: Adding EDID support to simpledrm on top of the EFI sysfb ?
In-Reply-To: <b99e3a32-6d3e-48a0-9936-a67999354a44@suse.de>
References: <301d7da1-5101-4f16-90cd-5bb4ac41c87b@kernel.org>
 <b99e3a32-6d3e-48a0-9936-a67999354a44@suse.de>
Date: Mon, 13 Oct 2025 10:04:12 +0200
Message-ID: <871pn7i5xf.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AlNVUa-kJ1USqq4zKLnjOA5XlOBKOwKLQseZQBL1sXg_1760342655
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hello Hans,

> Hi Hans
>
> Am 11.10.25 um 12:02 schrieb Hans de Goede:
>> Hi,
>>
>> A while ago I did a blogpost about not having the native GPU drivers in
>> the initrd: https://hansdegoede.dreamwidth.org/28291.html
>>
>> With the Fedora /boot partition size increase there has been renewed
>> interest in this and as a result I got an interesting comment on
>> the blog post pointing out that there are EFI protocols to get EDID
>> info for the monitor (presumably for the one the GOP has lit up).
>>
>> It would be useful to see if we can hook this up so that the simpledrm
>> device can report the physical dimensions of the screen and the boot
>> splash does not need to guess the DPI and thus does not need to guess
>> whether to do hiDPI scaling or not. The comment is here:
>>
>> https://hansdegoede.dreamwidth.org/28291.html?thread=3D14467#cmt14467
>>
>> and it points to:
>>
>> https://uefi.org/sites/default/files/resources/2_-_AMD_UEFI_Plugfest_EDI=
D_Spring2012.pdf
>> https://uefi.org/specs/UEFI/2.9_A/12_Protocols_Console_Support.html
>>
>> Unfortunately I do not have time to work on this myself, hence this
>> email in the hope that someone else can pick this idea up.
>
> There are now efidrm and vesadrm, which support specifically the=20
> features that we get from the rsp. standards, hardware=C2=A0 and bootload=
er.=20
> For VESA and EFI the EDID can be transferred from grub via bootparams. A=
=20
> patch [1] is on its way into upstream grub. The Linux kernel stores that=
=20
> data in edid_info, from where it is picked up by efidrm and vesadrm.=C2=
=A0 If=20
> the EFI framebuffer comes directly from the EFI calls, we need to=20
> implement this in the kernel, but the principle is the same. I also have=
=20
> ideas for making this work on Coreboot.
>
> For simpledrm, I'd rather strip if from the ability to use EFI/VESA=20
> framebuffers and focus on simple-framebuffer DT nodes. These sometimes=20
> come with DPI information. Maybe we could extend the DT to support EDID=
=20
> as well.
>
> [1] https://lists.gnu.org/archive/html/grub-devel/2025-10/msg00043.html
>
> I have long been working on all this and it is now slowly coming together=
.
>

I agree with Thomas.

We are still not enabling these DRM drivers in Fedora though, but maybe it
is time to do that and just disable CONFIG_SYSFB_SIMPLEFB. I can propose a
change request for Fedora 44 to do this.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

