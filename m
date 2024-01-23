Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A70838A92
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 10:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A240210E715;
	Tue, 23 Jan 2024 09:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454D110E719
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706003087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cphQXX8XuT1Nm7Usg0W5GdqAqwTrHKAeifLIKj3Ewws=;
 b=Aj823TYUqPH8wdbujtai7yBLJaMjmE7iBqQAJXyCTBIU138FFyasbaGH1ryCNTLqOiniW1
 FMeHWK67gf7WNugsOYHzluJGwC5TYuUo4Ux0I7hhBdxlG+lZ5u5D56ly4GuEiEys+dP+3N
 h+n37lBvDWrdu8/EbV2bXBjgsWG8RKw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-vLIlAE1UMkCNYqw4oTUmqQ-1; Tue, 23 Jan 2024 04:44:45 -0500
X-MC-Unique: vLIlAE1UMkCNYqw4oTUmqQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-78313358d3bso124590685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706003085; x=1706607885;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cphQXX8XuT1Nm7Usg0W5GdqAqwTrHKAeifLIKj3Ewws=;
 b=ZivBO/4MERHg9pupVj7LgGCdylhlYvkVZTbx9VesjMxlHn22Bwwe5a3/lO+F0+yfq0
 RLiOVEsshQLR/phi4wvCO8FHsPszbyOZqJwwOxLF4wABWsiir6rAHuBKLao1Ry8Ct2TA
 cO0cIT8+5mfLISGTXTqmvl+dslONHmKBT2dseOT0Hyv3lKIm08tJrqKs1oplhPdCszS9
 3L++/DGK/GvAi4lTMzeUaDCRoEk3G9UdnFI0I9UzJdTjdFO9h2OXlxTuA/MnwInjqQaG
 9flBOKiiBr5oDBP+/LY3KBTqHDNDeah8LCYzfPTuY7Htd/6aPacizbCZ/KoYiIxetAEM
 czeg==
X-Gm-Message-State: AOJu0Yx31X2PvC23CHZLGtnebZXiJxY7DYYL8EpK3ZJPSsXouDCYmqA1
 c9mrM7aNCOGbw/gmNo33MLa4qYsLvIsLMh4kUu3hVyAPMFRfQBaqJ56U6+Tj56Dgt1ZTbH4wGH5
 ka8Dr4Cx4iy2wgoJvYDxim9KR2ekCRcO9SV2ogqvLOqsHje6IAXyvexE637iRZdzimQ==
X-Received: by 2002:ad4:5aad:0:b0:686:9f9e:2963 with SMTP id
 u13-20020ad45aad000000b006869f9e2963mr1450859qvg.5.1706003084841; 
 Tue, 23 Jan 2024 01:44:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDCQ2aTilrii2HWL3KnMWgohNXX1WVQoFY5wh45yF59z1xc/IopVs+Mm8bKJtO7SF5i4FZfw==
X-Received: by 2002:ad4:5aad:0:b0:686:9f9e:2963 with SMTP id
 u13-20020ad45aad000000b006869f9e2963mr1450849qvg.5.1706003084364; 
 Tue, 23 Jan 2024 01:44:44 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 nc5-20020a0562142dc500b00685e2ffcaf5sm2958704qvb.38.2024.01.23.01.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 01:44:44 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <pstanner@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Subject: [PATCH v2 00/10] Make PCI's devres API more consistent
Date: Tue, 23 Jan 2024 10:42:57 +0100
Message-ID: <20240123094317.15958-1-pstanner@redhat.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
  PCI: add new set of devres functions
  PCI: deprecate iomap-table functions
  PCI: warn users about complicated devres nature
  PCI: make devres region requests consistent
  PCI: move dev-enabled status bit to struct pci_dev
  PCI: move pinned status bit to struct pci_dev
  PCI: give pcim_set_mwi() its own devres callback
  PCI: give pci(m)_intx its own devres callback
  PCI: remove legacy pcim_release()
  drm/vboxvideo: fix mapping leaks

 Documentation/driver-api/pci/pci.rst  |    3 +
 drivers/gpu/drm/vboxvideo/vbox_main.c |   24 +-
 drivers/pci/devres.c                  | 1015 +++++++++++++++++++++----
 drivers/pci/iomap.c                   |   18 +
 drivers/pci/pci.c                     |  123 ++-
 drivers/pci/pci.h                     |   25 +-
 include/linux/pci.h                   |   18 +-
 7 files changed, 1011 insertions(+), 215 deletions(-)

-- 
2.43.0

