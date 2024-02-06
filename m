Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2E84B697
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 14:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B70310F37D;
	Tue,  6 Feb 2024 13:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KCqvr9T2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CB310F37D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707226829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QpY62CAbzs1kZlSzF8o4OMEgSIRU4oj8654lX7CLtwY=;
 b=KCqvr9T255jbRjcl4l/JVl5kgZM+HNTMG5/NiYi0yLNiyXdp0BKoJHN7+kwXkzFe54JPmK
 t7y+w4D6yc5r2EMiPvke/cABptTNwoeO7/fNxifCYiO3Km1312UOrLyeNh1PbZrjPM5vMn
 4yaUvn7EwHYRq41V5VdAa0rH+BccKMc=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-m3NRxWCROKGkcIVITq4DwQ-1; Tue, 06 Feb 2024 08:40:28 -0500
X-MC-Unique: m3NRxWCROKGkcIVITq4DwQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-59cf1c2c833so27885eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 05:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226827; x=1707831627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QpY62CAbzs1kZlSzF8o4OMEgSIRU4oj8654lX7CLtwY=;
 b=gSq1KVNp3AVAoes+XURJb0UR6PGb2CM8RTJpNi9FAC5zWKCdccHR0xQNyyqCJZ4lBD
 L+Hs8FRQEuJMnEWYMPWFmuK7Rog7ce5n4mXT1+pwA+Aliis4ruECf6MD8t1/F6LVrzFM
 8Tn8QMKPtYxRZVPTQoIK8n9OM/GlifV745CpdD6ZcT05fjQF/VrQ4WzynjQvc1E6MkDm
 psRT8/Zb8pBg+EM1TUCC/tS697IIcRCgPbeTLEE9DoUQrNof7UC4RAn8PqesAgoEuN+d
 DwlHzpbMdtz494zT+fwwX2BlBFfHFbGlKQPnIIsZQ5Pgh+r5YiYiSokIpIRaSKvmIoeh
 jWXA==
X-Gm-Message-State: AOJu0YznMqqDR/oF8GUqKMXkTkn3EdWa4avJ8ZqDJjnMHmSGuNlEGwNO
 0rWp5zvsZ729UX6TLXsAuFP+G2qwvW/SdVqtRQcujNG3m83mL7A5K7roAkW+/cLir47Ill6PhdS
 IvrHYSGD7rptb2W2JVs2Tk1PSdB/Z90nDiK7gQa8o4qk/KTk0xKciE8wsfyX7X07gHw==
X-Received: by 2002:a4a:ce99:0:b0:59c:d8cd:ecee with SMTP id
 f25-20020a4ace99000000b0059cd8cdeceemr2888549oos.1.1707226827547; 
 Tue, 06 Feb 2024 05:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/7qqy2ReBTKnpMmJvYKlOG0fD0tyMjSKFr2o9dpUPWVtDK2/MoKz3eco4vYEvlU68ed5c1w==
X-Received: by 2002:a4a:ce99:0:b0:59c:d8cd:ecee with SMTP id
 f25-20020a4ace99000000b0059cd8cdeceemr2888514oos.1.1707226827219; 
 Tue, 06 Feb 2024 05:40:27 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUIM1d7cKsnx6ZBJxdCTNBxX2IVrCI36r3smohJVNNMP6NIN7DryE10Ug4aKiENWtwcqhfhIcWl7RQQffJaLibEgC6l534MQFXFEaGQ1fuSx/MEW0HKeF+rKJ8FwYo7nr0latl9rdDhIb8VfxNVOLKr1MpxJTOuQRs2QuH1z9ycoLqulqFfFGFauS6o8gmDcpIk4v2qvzBYZ6oW8hBR/wNOpixarPC28/cf9aUFfTIkR2K34LpUjW0MIWDaFWIkKxW+3mBkAQ69eeo6X6N1Muoye96s3+6fbTrfEo31aHZ8AELlFcDrEhOQpXlwP4rPRztEhDBtVxwKaPc2BYXFolrofZUKCzNSBA8mRAF2fKKuUOFJExCdLYFVyGK1JyLqF6/uCn79
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 vu4-20020a05620a560400b0078544c8be9asm903791qkn.87.2024.02.06.05.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:40:26 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v3 00/10] Make PCI's devres API more consistent
Date: Tue,  6 Feb 2024 14:39:46 +0100
Message-ID: <20240206134000.23561-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Changes in v3:
  - Use the term "PCI devres API" in some forgotten places.
  - Fix more grammar errors in patch #3.
  - Remove the comment advising to call (the outdated) pcim_intx() in pci.c
  - Rename __pcim_request_region_range() flags-field "exclusive" to
    "req_flags", since this is what the int actually represents.
  - Remove the call to pcim_region_request() from patch #10. (Hans)

Changes in v2:
  - Make commit head lines congruent with PCI's style (Bjorn)
  - Add missing error checks for devm_add_action(). (Andy)
  - Repair the "Returns: " marks for docu generation (Andy)
  - Initialize the addr_devres struct with memset(). (Andy)
  - Make pcim_intx() a PCI-internal function so that new drivers won't
    be encouraged to use the outdated pci_intx() mechanism.
    (Andy / Philipp)
  - Fix grammar and spelling (Bjorn)
  - Be more precise on why pcim_iomap_table() is problematic (Bjorn)
  - Provide the actual structs' and functions' names in the commit
    messages (Bjorn)
  - Remove redundant variable initializers (Andy)
  - Regroup PM bitfield members in struct pci_dev (Andy)
  - Make pcim_intx() visible only for the PCI subsystem so that new    
    drivers won't use this outdated API (Andy, Myself)
  - Add a NOTE to pcim_iomap() to warn about this function being the    onee
    xception that does just return NULL.
  - Consistently use the term "PCI devres API"; also in Patch #10 (Bjorn)


¡Hola!

PCI's devres API suffers several weaknesses:

1. There are functions prefixed with pcim_. Those are always managed
   counterparts to never-managed functions prefixed with pci_ – or so one
   would like to think. There are some apparently unmanaged functions
   (all region-request / release functions, and pci_intx()) which
   suddenly become managed once the user has initialized the device with
   pcim_enable_device() instead of pci_enable_device(). This "sometimes
   yes, sometimes no" nature of those functions is confusing and
   therefore bug-provoking. In fact, it has already caused a bug in DRM.
   The last patch in this series fixes that bug.
2. iomappings: Instead of giving each mapping its own callback, the
   existing API uses a statically allocated struct tracking one mapping
   per bar. This is not extensible. Especially, you can't create
   _ranged_ managed mappings that way, which many drivers want.
3. Managed request functions only exist as "plural versions" with a
   bit-mask as a parameter. That's quite over-engineered considering
   that each user only ever mapps one, maybe two bars.

This series:
- add a set of new "singular" devres functions that use devres the way
  its intended, with one callback per resource.
- deprecates the existing iomap-table mechanism.
- deprecates the hybrid nature of pci_ functions.
- preserves backwards compatibility so that drivers using the existing
  API won't notice any changes.
- adds documentation, especially some warning users about the
  complicated nature of PCI's devres.


Note that this series is based on my "unify pci_iounmap"-series from a
few weeks ago. [1]

I tested this on a x86 VM with a simple pci test-device with two
regions. Operates and reserves resources as intended on my system.
Kasan and kmemleak didn't find any problems.

I believe this series cleans the API up as much as possible without
having to port all existing drivers to the new API. Especially, I think
that this implementation is easy to extend if the need for new managed
functions arises :)

Greetings,
P.

Philipp Stanner (10):
  PCI: Add new set of devres functions
  PCI: Deprecate iomap-table functions
  PCI: Warn users about complicated devres nature
  PCI: Make devres region requests consistent
  PCI: Move dev-enabled status bit to struct pci_dev
  PCI: Move pinned status bit to struct pci_dev
  PCI: Give pcim_set_mwi() its own devres callback
  PCI: Give pci(m)_intx its own devres callback
  PCI: Remove legacy pcim_release()
  drm/vboxvideo: fix mapping leaks

 drivers/gpu/drm/vboxvideo/vbox_main.c |   20 +-
 drivers/pci/devres.c                  | 1015 +++++++++++++++++++++----
 drivers/pci/iomap.c                   |   18 +
 drivers/pci/pci.c                     |  123 ++-
 drivers/pci/pci.h                     |   25 +-
 include/linux/pci.h                   |   18 +-
 6 files changed, 1004 insertions(+), 215 deletions(-)

-- 
2.43.0

