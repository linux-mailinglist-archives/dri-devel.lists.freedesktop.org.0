Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A5906C78
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFC410E07B;
	Thu, 13 Jun 2024 11:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BzJcAgxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B20010E07B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718279447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vwtGUAzgjpCKqtdRSzTm8xlIpjclH657dtQUJu4HtYg=;
 b=BzJcAgxzynj6rw7jngsmBQvYRE2Mk5wO0YR932vCFO3DMFq33lYIhF9qS/lb2tRQhGYlsD
 k3t2L5sflsRQYPS6r6AOZn5D1w4N+ad7Y7hCY/7g/mS/hSlp/oBftavjW6CFy2hi0qzxpO
 heEBzuAgDgucStuAZQ2tOl/U0TCeNqk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-9nLbd-a8O76hJC_ho4TgOQ-1; Thu, 13 Jun 2024 07:50:46 -0400
X-MC-Unique: 9nLbd-a8O76hJC_ho4TgOQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-36073543200so107603f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 04:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718279445; x=1718884245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vwtGUAzgjpCKqtdRSzTm8xlIpjclH657dtQUJu4HtYg=;
 b=xM4sgJovSrBOsWx4fy1CenaxYRRZR347IzZo2Besrj5/UcWLgzqGZzm5bWiYfp+eqB
 rQPv346tMPdDdLWKzOu2dpADq3CZGuHAH6xpr6zWIp73JVgV6HGOLqvRJ9ZpgbYO8vyw
 X0AdcDGD9qUBq68L6D8kBmuJ4s85uOK9WKjgDDzxqKRdmh1s0RgNMdglH2FtKAfA2m0v
 r9KpxupJ5lNCGzNPhXnggcmM8lOc+u8I2Y37+0bXlpG4KpWcVQif0PGP9dXGtv/a6FFQ
 LtpMYf1dE4yn90muKxDAhWXs2c9WatBdPmGvRzmT6IzAxdSfphWNH7eb+6Eeyuw2Jl5N
 akPA==
X-Gm-Message-State: AOJu0YxS/xsL8RQm8QnO98LeKI8QjRgGDR1g09e64bU8Tder/o+HspFo
 qywiBWeIonR67sl7fWHvA+xjr1KJhUL3V4ySNmQT6stU/QDGyFyrHKmwJArlaZyXMXNMbTHXC6g
 7R7fOTxb7T4eZlwKkM3Pyj7lXkPjkz+J8A5d/S7NUJ3izfbdHyEOkJLqtrLDBhPfIdg==
X-Received: by 2002:a05:6000:1aca:b0:35f:2f28:27b9 with SMTP id
 ffacd0b85a97d-36079a4f9d6mr191223f8f.4.1718279445256; 
 Thu, 13 Jun 2024 04:50:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRbsSHxYqnMWViAKh/hWHtNSlYYom+vTUZKo7+eJH0rRpbiLhlrz2AggEkXvSfmy/PB7rHSQ==
X-Received: by 2002:a05:6000:1aca:b0:35f:2f28:27b9 with SMTP id
 ffacd0b85a97d-36079a4f9d6mr191192f8f.4.1718279444799; 
 Thu, 13 Jun 2024 04:50:44 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c883sm1510620f8f.29.2024.06.13.04.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:50:44 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v9 00/13] Make PCI's devres API more consistent
Date: Thu, 13 Jun 2024 13:50:13 +0200
Message-ID: <20240613115032.29098-1-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
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

Changes in v9:
  - Remove forgotten dead code ('enabled' bit in struct pci_dev) in
    patch No.8 ("Move pinned status bit...")
  - Rework patch No.3:
      - Change title from "Reimplement plural devres functions"
        to "Add partial-BAR devres support".
      - Drop excessive details about the general cleanup from the commit
	message. Only motivate why this patch's new infrastructure is
	necessary.
  - Fix some minor spelling issues (s/pci/PCI ...)

Changes in v8:
  - Rebase the series on the already merged patches which were slightly
    modified by Bjorn Helgaas.
  - Reword the pci_intx() commit message so it clearly states it's about
    reworking pci_intx().
  - Move the removal of find_pci_dr() from patch "Remove legacy
    pcim_release()" to patch "Give pci_intx() its own devres callback"
    since this later patch already removed all calls to that function.
  - In patch "Give pci_intx() its own devres callback": use
    pci_is_enabled() (and, thus, the enabled_cnt in struct pci_dev)
    instead of a separate enabled field. (Bjorn)

Changes in v7:
  - Split the entire series in smaller, more atomic chunks / patches
    (Bjorn)
  - Remove functions (such as pcim_iomap_region_range()) that do not yet
    have a user (Bjorn)
  - Don't export interfaces publicly anymore, except for
    pcim_iomap_range(), needed by vboxvideo (Bjorn)
  - Mention the actual (vboxvideo) bug in "PCI: Warn users..." commit
    (Bjorn)
  - Drop docstring warnings on PCI-internal functions (Bjorn)
  - Rework docstring warnings
  - Fix spelling in a few places. Rewrapp paragraphs (Bjorn)

Changes in v6:
  - Restructure the cleanup in pcim_iomap_regions_request_all() so that
    it doesn't trigger a (false positive) test robot warning. No
    behavior change intended. (Dan Carpenter)

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
  - Add a NOTE to pcim_iomap() to warn about this function being the one
    exception that does just return NULL.
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

Philipp Stanner (13):
  PCI: Add and use devres helper for bit masks
  PCI: Add devres helpers for iomap table
  PCI: Add partial-BAR devres support
  PCI: Deprecate two surplus devres functions
  PCI: Make devres region requests consistent
  PCI: Warn users about complicated devres nature
  PCI: Remove enabled status bit from pci_devres
  PCI: Move pinned status bit to struct pci_dev
  PCI: Give pcim_set_mwi() its own devres callback
  PCI: Give pci_intx() its own devres callback
  PCI: Remove legacy pcim_release()
  PCI: Add pcim_iomap_range()
  drm/vboxvideo: fix mapping leaks

 drivers/gpu/drm/vboxvideo/vbox_main.c |  20 +-
 drivers/pci/devres.c                  | 903 +++++++++++++++++++++-----
 drivers/pci/iomap.c                   |  16 +
 drivers/pci/pci.c                     |  94 ++-
 drivers/pci/pci.h                     |  23 +-
 include/linux/pci.h                   |   5 +-
 6 files changed, 858 insertions(+), 203 deletions(-)

-- 
2.45.0

