Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D43189DDA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 15:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CB46E900;
	Wed, 18 Mar 2020 14:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFA06E90A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584541755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gWOXv5Yb9V3KGTzmeEkckOh2z0rULvDkPQ4DB67eZhk=;
 b=B7r1acOoMazmCQsgEKZkeR1x6Jkf27LnibIYuC4qjxcRkbyrv1v2Sob6fR2EGso1rkTXOQ
 GEWPj2rLXP2DQY7TeW/DYEQOpMAXmfjzz+7bDGGu4/4/jhNfqmE3WxQY1tH/0J1m0jQH5Y
 VighVygJiw3cKiaccAqPZmQwjQ7qLIE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-0dUrrKtrMfCowsV229sugg-1; Wed, 18 Mar 2020 10:28:05 -0400
X-MC-Unique: 0dUrrKtrMfCowsV229sugg-1
Received: by mail-wm1-f71.google.com with SMTP id s20so1164399wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 07:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=gWOXv5Yb9V3KGTzmeEkckOh2z0rULvDkPQ4DB67eZhk=;
 b=IZv7cVHKUlUjJb+LhLb1dQ0lqS60Zk9h6SNfvQe0rbF3sUc4mvVVpI/8LwOzzUqmwW
 CLA4NVWSeHKhWvqSCYHR2PRyD7wy92KQ4NFzZWND+bp/MaVnmi7PRjSCZ+9O07Qpv/f/
 yB/FhbGmfucaQojwlwZAFzL23nPmLgqF2gknh6ZQ1UufP9FC5ODlscZfJJdTg3Nm+52B
 FxNl9G5EHztQxCekGSHWjWMoi2vyCG0kxAsp4Nz2kbtU3XVys5T19S63081ExzJn2v4X
 1Evhgwums70jNFUkQGx1mRSOMfGuRe2nIVdtbTCWaSov7rRZF7JGgD2pfDtxAOyaDJh3
 s8Sg==
X-Gm-Message-State: ANhLgQ1LZAzVCtalWdd8CTFebXbxBUW7Al1jrrz0+8QHdHsN/mfb6OSB
 GvWPS1/fZ5N41rNlH9ouY+HvapmACLZ9WZUbJ8TuIZ7wwfxrDUwaIPWT0IR3Kr7AO9gz6Tj0Jfo
 /WiRDVAwEYRlJVMDukOF3BJN/30HM
X-Received: by 2002:a1c:7dc8:: with SMTP id y191mr5271150wmc.167.1584541684027; 
 Wed, 18 Mar 2020 07:28:04 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtnVVOOIDNZ/z5fOj6z4VK6kqH+2jsdkhv7gYmbMo0jooPiHZIll+eUrpX3RNx8hnVg0NZ+jg==
X-Received: by 2002:a1c:7dc8:: with SMTP id y191mr5271125wmc.167.1584541683698; 
 Wed, 18 Mar 2020 07:28:03 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id h15sm9177079wrw.97.2020.03.18.07.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 07:28:03 -0700 (PDT)
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Atomic KMS API lacks the ability to set cursor hot-spot coordinates
Message-ID: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
Date: Wed, 18 Mar 2020 15:28:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

I'm not sure if $subject was a conscious design decision, or an oversight,
but that does not really matter.

ATM the Atomic KMS API lacks the ability to set cursor hot-spot
coordinates. Mutter (and Weston) have tried to emulate this by shifting
the coordinates for where to draw the cursor by the hotspot-coordinates
and always using 0x0 for the hotspot.

But this breaks the so called "seamless mouse mode" for virtual-machines
and there really is no way to fix this but to allow passing the proper
hotspot coordinates to the virtual gfx-card.

Seamless-mode consists of 2 parts:

1) Letting the VM-viewer window-system draw the cursor as it normally
would draw it.

2) Giving absolute coordinates of the mouse to the VM by e.g. emulating
an USB drawing tablet. These coordinates come from translating the
coordinates where the VM-viewer window-system is drawing the cursor
to an absolute position using the top left corner of the view as 0x0
and the bottom right corner as max-abs-x,max-abs-y.

2) Means that any coordinates the window-system inside the VM passes to
the VM's gfx-card for where to draw the cursor are basically totally
ignored to avoid lag / flicker (and to not have to grab the cursor /
confine it to the VM-viewer window and to not have to warp the
pointer).

This means that the offset added to the coordinates by e.g. mutter to
emulate the hotspot are ignored. For Seamless mouse mode to keep working
properly the window-system inside the VM need to pass the VM's gfx-card
the correct hotspot when setting the cursor. Which currently is not
possible when restricting oneself to the atomic APIs.

Also see: https://gitlab.gnome.org/GNOME/mutter/issues/1094
Where this is currently being tracked from the mutter side. Mutter
internally has both atomic and legacy paths. The plan for now is to
push the hotspot-emulation by shifting coordinates thing into the
atomic path, fixing seamless mouse mode when running in legacy mode,
combined with blacklisting vboxvideo, vmwgfx, qxl and cirrus from
using atomic mode.

This is of course a workaround, eventually we would like to see
the atomic API extended to allow passing the cursor hot spot.

I'm not really familiar enough with the atomic API to come up with
an API design for this, but if there are suggestions on how this
should look like from the uAPI side then I can take a shot at
implementing this (and hooking it up in mutter's atomic code
paths to test it).

Regards,

Hans



p.s.

Before people start discussing how the VM / VM-viewer is broken here and
the VM needs to be fixed. Seamless mouse mode exists for at least a
decade and has worked fine during this entire decade. It also works
fine when using the legacy (non atomic) DRM_IOCTL_MODE_CURSOR2 ioctl;

Also this problem reproduces with 2 completely independent VM code-bases,
it has been seen on both qemu-kvm VMs and on VirtualBox VMs and I would
not be surprised if other hypervisors are also affected.

And on the API consumer side this problem has been triggered by both
mutter and Weston.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
