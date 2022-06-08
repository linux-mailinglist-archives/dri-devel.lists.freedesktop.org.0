Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DDD5429DC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 10:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA76510E156;
	Wed,  8 Jun 2022 08:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F2C10E047
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 08:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654678293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTJNxPhm7RLPPszuwy8H6thl/19s3griMfO8/U8OJSI=;
 b=ilM8zUFe30YwA55Z6ckaK9NaK3VDTsAhgWL/5k/pL9+cbeFpPKIu+BuBHJCWl3yxDDchDQ
 acf71PydUvCgsC6ZjNjscQ6uvnDZKpgERYOtgYgFIlzkd+NpU6mSP70NyrHAtwLxrRZ74c
 H813SJZrSVd/rjk/25hY5h2oCpzgoTo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-nFRMUZG_N4K6QWFRcQwYOg-1; Wed, 08 Jun 2022 04:51:32 -0400
X-MC-Unique: nFRMUZG_N4K6QWFRcQwYOg-1
Received: by mail-wr1-f72.google.com with SMTP id
 w8-20020adfde88000000b00213b7fa3a37so3798696wrl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 01:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YTJNxPhm7RLPPszuwy8H6thl/19s3griMfO8/U8OJSI=;
 b=GZVa7nfQugNY+PGYdORHDXuy4znl33lvE1HyCmfqe1IUWkx31IU5FXWBAT96JT2Ms7
 51pErcqiJ6V2hO/oVya7jsAdTEZ/oNoXbhyZkA3Dpa63WBparJLnHIC0Uxhbj3j3M8EX
 +JM8TXHQnqc5mU7zV35tDqn4R9kujDOend0IxT/TNdq/HZX8EGFPqAGSkVjoB0mW+yRQ
 Fa3HATcoeByivY45pA1S3yCVZjebvVA3cTRqsT/n+VUUxiI/nJ7rR8F3Wk9pkFuNlQ0q
 1aDgAYBE7SIh637d9tsV1DvNpDs+kJ+Q9COw0LhsaOLccDak4NcSHg23WYkoZ/3QrW2y
 rxuw==
X-Gm-Message-State: AOAM533JOQU484IyGk+2GeL9aNwKUnoMoSSS6Wx7ksU6eEAv/7Hystgk
 4RmU/wcz/RUrA/+aBOf3NoynCe1axeVBYYkGIn1t3MqEMeBzFCVs0yX4O2W2AkHpQkK4vhKAGux
 AWnmDvsseJZ7aIqT5h5i+sUvHuH1J
X-Received: by 2002:a5d:6c61:0:b0:210:7277:774c with SMTP id
 r1-20020a5d6c61000000b002107277774cmr32149893wrz.212.1654678290645; 
 Wed, 08 Jun 2022 01:51:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9FLAVx/XGPFkjTafQfU+5134QjcX4BkF6fWgLxlLiGCIxPsAWXQSt59EybZDIXIW+BiEaHw==
X-Received: by 2002:a5d:6c61:0:b0:210:7277:774c with SMTP id
 r1-20020a5d6c61000000b002107277774cmr32149854wrz.212.1654678290282; 
 Wed, 08 Jun 2022 01:51:30 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b0039c3b05540fsm20692462wmq.27.2022.06.08.01.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 01:51:29 -0700 (PDT)
Message-ID: <b8eee5a7-7428-fcfd-9266-fa63b9fde5e9@redhat.com>
Date: Wed, 8 Jun 2022 10:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/2] Improve vfio-pci primary GPU assignment behavior
To: Gerd Hoffmann <kraxel@redhat.com>
References: <165453797543.3592816.6381793341352595461.stgit@omen>
 <badc8e91-f843-2c96-9c02-4fbb59accdc4@redhat.com>
 <20220608074306.wyav3oerq5crdk6c@sirius.home.kraxel.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220608074306.wyav3oerq5crdk6c@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: tzimmermann@suse.de, kvm@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 dri-devel@lists.freedesktop.org, Laszlo Ersek <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Gerd and Alex,

On 6/8/22 09:43, Gerd Hoffmann wrote:
>   Hi,
> 
>> But also, this issue isn't something that only affects graphic devices,
>> right? AFAIU from [1] and [2], the same issue happens if a PCI device
>> has to be bound to vfio-pci but already was bound to a host driver.
> 
> Nope.  There is a standard procedure to bind and unbind pci drivers via
> sysfs, using /sys/bus/pci/drivers/$name/{bind,unbind}.
>

Yes, but the cover letter says:

"Users often employ kernel command line arguments to disable conflicting
drivers or perform unbinding in userspace to avoid this"

So I misunderstood that the goal was to avoid the need to do this via sysfs
in user-space. I understand now that the problem is that for real PCI devices
bound to a driver, you know the PCI device ID and bus so that you can use it,
but with platform devices bound to drivers that just use a firmware-provided
framebuffers you don't have that information to unbound.

Because you could use the standard sysfs bind/unbind interface for this too,
but don't have a way to know if the "simple-framebuffer" or "efi-framebuffer"
is associated with a PCI device that you want to pass through or another one.

The only information that could tell you that is the I/O memory resource that
is associated with the platform device registered and that's why you want to
use the drm_aperture_remove_conflicting_pci_framebuffers() helper.
 
>> The fact that DRM happens to have some infrastructure to remove devices
>> that conflict with an aperture is just a coincidence.
> 
> No.  It's a consequence of firmware framebuffers not being linked to the
> pci device actually backing them, so some other way is needed to find
> and solve conflicts.
>

Right, it's clear to me now. As mentioned I misunderstood your problem.

>> The series [0] mentioned above, adds a sysfb_disable() that disables the
>> Generic System Framebuffer logic that is what registers the framebuffer
>> devices that are bound to these generic video drivers. On disable, the
>> devices registered by sysfb are also unregistered.
> 
> As Alex already mentioned this might not have the desired effect on
> systems with multiple GPUs (I think even without considering vfio-pci).
>

That's correct, although the firmware framebuffer drivers are just a best
effort to allow having some display output even if there's no real video
driver (or if the user prevented them to load with "nomodeset").

We have talked about improving this, by unifying fbdev and DRM apertures
in a single list that could track all the devices registered and their
requested aperture so that all subsystems could use it. The reason why
I was pushing back on using the DRM aperture helper is that it would
make more complicated later to do this refactoring as more subsystems
use the current API.

But as Alex said, it wouldn't make the problem worse so I'm OK with this
if others agree that's the correct thing to do.
 
>> That is, do you want to remove the {vesa,efi,simple}fb and simpledrm
>> drivers or is there a need to also remove real fbdev and DRM drivers?
> 
> Boot framebuffers are the problem because they are neither visible nor
> manageable in /sys/bus/pci.  For real fbdev/drm drivers the standard pci
> unbind can be used.
>

Yes. Honestly I believe all this should be handled by the Linux device model.

That is, drivers could just do pci_request_region() / request_mem_region()
and drivers that want to unbind another bound device could do something like
pci_request_region_force() / request_mem_region_force() to kick them out.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

