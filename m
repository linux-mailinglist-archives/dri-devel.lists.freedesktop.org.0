Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6420D60D5BE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 22:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC8910E265;
	Tue, 25 Oct 2022 20:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169F510E16B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 20:39:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 14DB8CE1DC7;
 Tue, 25 Oct 2022 20:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1190BC433C1;
 Tue, 25 Oct 2022 20:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666730339;
 bh=pNxIekC28wfpOc5Ypgdt8TBFN8v88QrFVDS9wqoB4fk=;
 h=From:To:Cc:Subject:Date:From;
 b=RqSfv94sp39rY9R6dfnKNtA2yzyyL+taF+AKAbt1StMoVeHrtOmoZ8ZmMBXJ3krGy
 M280K4bsUBIoOIHOGnsOcYDpHG4zzHCwDB2UlH1lj9XqKQQ/c59IeIWCxRi/So+So1
 9YdUIZBVduYEZ2X9LjSbAmi+lV5q17+kcrwyC8SYNJdPS5iw4NwroUyds1T3C6z0Cj
 8dGKvrKF3RoP70esMxj9xNR3mEfVfRJFsKoSZ2eei4mESQfW7/WTW8UllreUfuXm2l
 n3F06FCCOIHuqCd4/nW8IrlGIyY/pdfabLlj4WNAyoXrpyK0r8S/p+trjChtqiu1fm
 Dar8mob5nL9SA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@redhat.com>
Subject: [PATCH v2 0/8] agp: Convert to generic power management
Date: Tue, 25 Oct 2022 15:38:44 -0500
Message-Id: <20221025203852.681822-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Vaibhav converted several AGP drivers from legacy PCI power management to
generic power management [1].  This series converts the rest of them.

v1 posted at [2].

Changes from v1 to v2:
  - Convert from SIMPLE_DEV_PM_OPS() (which is deprecated) to
    DEFINE_SIMPLE_DEV_PM_OPS() and remove __maybe_unused annotations.

[1] https://lore.kernel.org/all/20210112080924.1038907-1-vaibhavgupta40@gmail.com/#t
[2] https://lore.kernel.org/all/20220607034340.307318-1-helgaas@kernel.org/

Bjorn Helgaas (8):
  agp/efficeon: Convert to generic power management
  agp/intel: Convert to generic power management
  agp/amd-k7: Convert to generic power management
  agp/ati: Convert to generic power management
  agp/nvidia: Convert to generic power management
  agp/amd64: Update to DEFINE_SIMPLE_DEV_PM_OPS()
  agp/sis: Update to DEFINE_SIMPLE_DEV_PM_OPS()
  agp/via: Update to DEFINE_SIMPLE_DEV_PM_OPS()

 drivers/char/agp/amd-k7-agp.c   | 24 ++++--------------------
 drivers/char/agp/amd64-agp.c    |  6 ++----
 drivers/char/agp/ati-agp.c      | 22 ++++------------------
 drivers/char/agp/efficeon-agp.c | 16 ++++------------
 drivers/char/agp/intel-agp.c    | 11 +++++------
 drivers/char/agp/nvidia-agp.c   | 24 ++++--------------------
 drivers/char/agp/sis-agp.c      |  7 ++-----
 drivers/char/agp/via-agp.c      |  6 ++----
 8 files changed, 27 insertions(+), 89 deletions(-)

-- 
2.25.1

