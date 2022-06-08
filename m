Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0178F5427A4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DA010EE4F;
	Wed,  8 Jun 2022 07:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F60D10EE15
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654674190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AH2f+hvLt6o5Ulhr8X9RVVcxLh1vpT+51fFKDTk13/I=;
 b=NwrTcpt0/T7PhvvE5l6vQe2j4vET52Y6WUtC1Kh2E1HUJc/x4YeOqO+yycDpVoF/SG6h1P
 B0ZVBkK2HL4PqynG6TMryOXhCc8jom5r0scInIS2lYJSZOrqwmnKedGDyJComdFeW/DazM
 Pt+PQ3YbTM5PVIieR9jZJggPWs05lxs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-1GjcdoIZO0eu-TsxarhuMw-1; Wed, 08 Jun 2022 03:43:09 -0400
X-MC-Unique: 1GjcdoIZO0eu-TsxarhuMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00FB1800971;
 Wed,  8 Jun 2022 07:43:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2D67400F3FF;
 Wed,  8 Jun 2022 07:43:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C8C3E18003AA; Wed,  8 Jun 2022 09:43:06 +0200 (CEST)
Date: Wed, 8 Jun 2022 09:43:06 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 0/2] Improve vfio-pci primary GPU assignment behavior
Message-ID: <20220608074306.wyav3oerq5crdk6c@sirius.home.kraxel.org>
References: <165453797543.3592816.6381793341352595461.stgit@omen>
 <badc8e91-f843-2c96-9c02-4fbb59accdc4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <badc8e91-f843-2c96-9c02-4fbb59accdc4@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

  Hi,

> But also, this issue isn't something that only affects graphic devices,
> right? AFAIU from [1] and [2], the same issue happens if a PCI device
> has to be bound to vfio-pci but already was bound to a host driver.

Nope.  There is a standard procedure to bind and unbind pci drivers via
sysfs, using /sys/bus/pci/drivers/$name/{bind,unbind}.

> The fact that DRM happens to have some infrastructure to remove devices
> that conflict with an aperture is just a coincidence.

No.  It's a consequence of firmware framebuffers not being linked to the
pci device actually backing them, so some other way is needed to find
and solve conflicts.

> The series [0] mentioned above, adds a sysfb_disable() that disables the
> Generic System Framebuffer logic that is what registers the framebuffer
> devices that are bound to these generic video drivers. On disable, the
> devices registered by sysfb are also unregistered.

As Alex already mentioned this might not have the desired effect on
systems with multiple GPUs (I think even without considering vfio-pci).

> That is, do you want to remove the {vesa,efi,simple}fb and simpledrm
> drivers or is there a need to also remove real fbdev and DRM drivers?

Boot framebuffers are the problem because they are neither visible nor
manageable in /sys/bus/pci.  For real fbdev/drm drivers the standard pci
unbind can be used.

take care,
  Gerd

