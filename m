Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E0A89679F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 10:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB70E11256B;
	Wed,  3 Apr 2024 08:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FrWDNTdR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B87111256B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 08:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712131644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=46k5EOtNpPpRezM1uLkG14XJOI7Jh+iRtVOqi3t9M8k=;
 b=FrWDNTdRL4e1b15/UtZqXWdf3xW3OGSGklIep3WJNGc/pkEkZtVhVRZBgGn/qk6w1MLiUG
 E+mJbMy+SraPi/wAJKFhCNGl3dZJQzZK2r6N8XSPG9n3QD/3h63exNoR2O0ri1pKzmoG95
 rKmMhaiXziUTYZXLPsfXR/5ZSP1ON4s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-isU3-CrUPl-JGkPIcoDHcg-1; Wed, 03 Apr 2024 04:07:22 -0400
X-MC-Unique: isU3-CrUPl-JGkPIcoDHcg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-34370209778so339169f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 01:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712131642; x=1712736442;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=46k5EOtNpPpRezM1uLkG14XJOI7Jh+iRtVOqi3t9M8k=;
 b=N0cfnwOUb2CPQATGZd52ghwGGX6VHYdhsuAgyxquH5V56egmThHZhLbBatg/aNtUEP
 7Tj8uRBUZA5KAWdpV6MS0bctbVHDkJJdtEZs3vh06Vqo3ssh74YyVyuU9D97r6ZkTWzo
 OIAOkRSEsn+7Fvr4z+e3yU1dO9qi0Zcr+u7fkrHlmWV1fpjELRDCTdstcCzf2lRe/XXC
 Gj0KtW9NZiex65C7LvzyGWg90nwmAz9tDAvYN1W0hIuvnYLryuPsZH42MY1KhxppG+CJ
 kYMWxexU4/XDuBReyvCQjunqoHLHAnneaS/9dn8TgrSSWf/HPASMj4gwyilsvVkBMoHq
 n08A==
X-Gm-Message-State: AOJu0YxSKkSCBAmi9+6RuXlfYDhwEbQGiAOk7yLU//rwcJ3bFLq1XQ3E
 DhjQPCb5DIPifMGbh6aHPNv7iWiCJcjinPHpRc0lnopPu8XZcucOqQ+LD7i+4eIn/bfMPdOqI9l
 pn4pOmMgyH9mI8Vpq8NRo0nqQcgb/nqXwO+g3aOc/ChQS2/V3dEGJpjkWMh6tEKfxEQ==
X-Received: by 2002:a05:600c:5114:b0:414:8084:a2e7 with SMTP id
 o20-20020a05600c511400b004148084a2e7mr11598221wms.4.1712131641726; 
 Wed, 03 Apr 2024 01:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPlqw1V0i7idyMsB6HeezWkDKxElDOlk06ycKPdYELPgnLUzHbjveNDfaoy4XyWSI6DjV1SQ==
X-Received: by 2002:a05:600c:5114:b0:414:8084:a2e7 with SMTP id
 o20-20020a05600c511400b004148084a2e7mr11598194wms.4.1712131641311; 
 Wed, 03 Apr 2024 01:07:21 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 fa14-20020a05600c518e00b004159df274d5sm5504535wmb.6.2024.04.03.01.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:07:20 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v5 00/10] Make PCI's devres API more consistent
Date: Wed,  3 Apr 2024 10:07:00 +0200
Message-ID: <20240403080712.13986-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.44.0
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

I now regard this to be the final version of my cleanup, hoping that we
can make it to Linux 6.10 – otherwise this would end up blocking my
other work for another release cycle.

@Heiner:
Thx for the feedback on the other list. Since none of that was
fundamental (bugs, errors and so on) I suggest we postpone further
improvements of the PCI devres API to a release cycle following 6.10.
Maybe we could then even try to port drivers using the old API, removing
that one entirely.

Changes in v5:
  - Add Hans's Reviewed-by to vboxvideo patch (Hans de Goede)
  - Remove stable-kernel from CC in vboxvideo patch (Hans de Goede)

Changes in v4:
  - Rebase against linux-next

Changes in v3:
  - Use the term "PCI devres API" at some forgotten places.
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
 drivers/pci/devres.c                  | 1013 +++++++++++++++++++++----
 drivers/pci/iomap.c                   |   18 +
 drivers/pci/pci.c                     |  123 ++-
 drivers/pci/pci.h                     |   21 +-
 include/linux/pci.h                   |   18 +-
 6 files changed, 1001 insertions(+), 212 deletions(-)

-- 
2.44.0

