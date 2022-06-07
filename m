Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737A541731
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 23:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424CA10FA14;
	Tue,  7 Jun 2022 21:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B8710FA09
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654635715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DmWx/HtcjqYi7JTMOK9VA2Mvf2gZ14LWzJ8rqY3sV7Y=;
 b=aBM8QoJKpkxNv8N4OsdRq4XWnCiCMUIz2wl4HH3k7krMkAVFALy3tVvfcP4Q0Z4xtF8bFL
 CqwjJZKTX9uywB4gnoZbjLwMnSfgn5TlmiPf0RnSMqVXn8R9xGjwIAadCHzeDYnGlTNRYJ
 NHJ+0sxg3aKkBRbAmg9NhFPO82WGB+E=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-7odGe_h9PqunuMIIK4f7VA-1; Tue, 07 Jun 2022 17:01:54 -0400
X-MC-Unique: 7odGe_h9PqunuMIIK4f7VA-1
Received: by mail-io1-f72.google.com with SMTP id
 k5-20020a6bba05000000b00668eb755190so8673041iof.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 14:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=DmWx/HtcjqYi7JTMOK9VA2Mvf2gZ14LWzJ8rqY3sV7Y=;
 b=yzawvVv9wJBPYJ5l5igYv1KuGksbFyzhI1yNEkPd3BvA+P+Ku34sY3yp3s8aQ58CV5
 OBMZ1UhLM9Tu48jqjdPpSHPNnK2SiFbVjg3AzOJWhjLzXDInNKbjXPtPAaVRGG9pmryZ
 wrULt+WlYCKSmORC5j7O/ZYC+3nWVaTPAHaqKsEBWNXEUwkUU69ybB3jy6V95gT2weO9
 ZxY0VR+IcnZtoJIyTztSKs9qRrk84EJ08JdzGeWAzekYgr3wOFJbfqGcdxDNewiMjdrJ
 eCZobXyr6sPqYBm0bF/aOYv8AONyLjfX92V8L77gM6JFUTht4Ap9i593WjNlNAuytXS5
 PHGg==
X-Gm-Message-State: AOAM533n8zKW5nfgF1bnTY6dPkaXNp4BJUY66jwYR2wuCdhzYsv96JNQ
 EHEYbz4ZS+DYFcZc38YJOZgvEBoz5M8L0A5Ak4EgCnsdweSENlXxD7uXFZmtG7tdYzznK2/4SCf
 b0/x3qQJop/w5rsBr8IWPN7PHYumF
X-Received: by 2002:a05:6638:2404:b0:331:48f:bac0 with SMTP id
 z4-20020a056638240400b00331048fbac0mr15750910jat.306.1654635713431; 
 Tue, 07 Jun 2022 14:01:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz8j3m6BGhMI89N/Xkj0XEQSk7cnDz7RN7p+Q2qYByc9Z8m7/k4hnjD+DhU7yc8TOyDhvgxg==
X-Received: by 2002:a05:6638:2404:b0:331:48f:bac0 with SMTP id
 z4-20020a056638240400b00331048fbac0mr15750891jat.306.1654635713144; 
 Tue, 07 Jun 2022 14:01:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 b38-20020a0295a9000000b0032e271a558csm7025990jai.168.2022.06.07.14.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 14:01:52 -0700 (PDT)
Date: Tue, 7 Jun 2022 15:01:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 0/2] Improve vfio-pci primary GPU assignment behavior
Message-ID: <20220607150151.11c7d2f6.alex.williamson@redhat.com>
In-Reply-To: <badc8e91-f843-2c96-9c02-4fbb59accdc4@redhat.com>
References: <165453797543.3592816.6381793341352595461.stgit@omen>
 <badc8e91-f843-2c96-9c02-4fbb59accdc4@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Jun 2022 19:40:40 +0200
Javier Martinez Canillas <javierm@redhat.com> wrote:

> Hello Alex,
> 
> On 6/6/22 19:53, Alex Williamson wrote:
> > Users attempting to enable vfio PCI device assignment with a GPU will
> > often block the default PCI driver from the device to avoid conflicts
> > with the device initialization or release path.  This means that
> > vfio-pci is sometimes the first PCI driver to bind to the device.  In 
> > the case of assigning the primary graphics device, low-level console
> > drivers may still generate resource conflicts.  Users often employ
> > kernel command line arguments to disable conflicting drivers or
> > perform unbinding in userspace to avoid this, but the actual solution
> > is often distribution/kernel config specific based on the included
> > drivers.
> > 
> > We can instead allow vfio-pci to copy the behavior of
> > drm_aperture_remove_conflicting_pci_framebuffers() in order to remove
> > these low-level drivers with conflicting resources.  vfio-pci is not
> > however a DRM driver, nor does vfio-pci depend on DRM config options,
> > thus we split out and export the necessary DRM apterture support and
> > mirror the framebuffer and VGA support.
> > 
> > I'd be happy to pull this series in through the vfio branch if
> > approved by the DRM maintainers.  Thanks,
> >  
> 
> I understand your issue but I really don't think that using this helper
> is the correct thing to do. We already have some races with the current
> aperture infrastructure As an example you can look at [0].
> 
> The agreement on the mentioned thread is that we want to unify the fbdev
> and DRM drivers apertures into a single list, and ideally moving all to
> the Linux device model to handle the removal of conflicting devices.
> 
> That's why I don't feel that leaking the DRM aperture helper to another
> is desirable since it would make even harder to cleanup this later.

OTOH, this doesn't really make the problem worse and it identifies
another stakeholder to a full solution.
 
> But also, this issue isn't something that only affects graphic devices,
> right? AFAIU from [1] and [2], the same issue happens if a PCI device
> has to be bound to vfio-pci but already was bound to a host driver.

When we're shuffling between PCI drivers, we expect the unbind of the
previous driver to have released all the claimed resources.  If there
were a previously attached PCI graphics driver, then the code added in
patch 2/ is simply redundant since that PCI graphics driver must have
already performed similar actions.  The primary use case of this series
is where there is no previous PCI graphics driver and we have no
visibility to platform drivers carving chunks of the PCI resources into
different subsystems.  AFAIK, this is unique to graphics devices.

> The fact that DRM happens to have some infrastructure to remove devices
> that conflict with an aperture is just a coincidence. Since this is used
> to remove devices bound to drivers that make use of the firmware-provided
> system framebuffer.

It seems not so much a coincidence as an artifact of the exact problem
both PCI graphics drivers and now vfio-pci face.  We've created
platform devices to manage sub-ranges of resources, where the actual
parent of those resources is only discovered later and we don't
automatically resolve the resource conflict between that parent device
and these platform devices when binding the parent driver.
 
> The series [0] mentioned above, adds a sysfb_disable() that disables the
> Generic System Framebuffer logic that is what registers the framebuffer
> devices that are bound to these generic video drivers. On disable, the
> devices registered by sysfb are also unregistered.
> 
> Would be enough for your use case to use that helper function if it lands
> or do you really need to look at the apertures? That is, do you want to
> remove the {vesa,efi,simple}fb and simpledrm drivers or is there a need
> to also remove real fbdev and DRM drivers?

It's not clear to me how this helps.  I infer that sysfb_disable() is
intended to be used by, for example, a PCI console driver which would be
taking over the console and can therefore make a clear decision to end
sysfb support.  The vfio-pci driver is not a console driver so we can't
make any sort of blind assertion regarding sysfb.  We might be binding
to a secondary graphics card which has no sysfb drivers attached.  I'm
a lot more comfortable wielding an interface that intends to disable
drivers/devices relative to the resources of a given device rather than
a blanket means to disable a subsystem.

I wonder if the race issues aren't better solved by avoiding to create
platform devices exposing resource conflicts with known devices,
especially when those existing devices have drivers attached.  Thanks,

Alex

