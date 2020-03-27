Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4281974FC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616AE89F2A;
	Mon, 30 Mar 2020 07:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAAD6EA74
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 20:00:31 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id q188so12183568qke.8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 13:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D8fCTtzi21rJlCDdrk/Qt4mRhY2LRYMqkZWb9k+PBbA=;
 b=C5617SlJKHaltq+P4jD+zs0K+W3xo/qPxCOnByb/v3+uCZBo4Uw70HHcyTUH0tYvgz
 I3jOTCrtR/FJDnqCuavzCyNe/VlZQkUTvnkjJHzReUgOotK95HUP3J/V430Z3dS7ahya
 7DsUVJg0Y4hUIwJSJm9aa5WGBoU26QeTO7KzarIiEcINrKXaHeIR5eeAyLHzysBr0CNW
 1aLFndYPAFSe/4jeO3bxY0dFvAnB2I+5vAkgEzFVsUVZ/hEcYO8JE4iOKtbn1UNH0Vqb
 KWBPZ+lxf4V+NpQSm4AW7kbPjbRSj9R1jJBpuTahH41hQodlwY3ziH+JRit3oCbOXnLs
 sEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D8fCTtzi21rJlCDdrk/Qt4mRhY2LRYMqkZWb9k+PBbA=;
 b=tVYc9Qs/wi1PhrL9n0PTQM0mYGueEcfcavzXflZEL3PxHZqX7SxiQQrct2UnLiCrGO
 ZmBOts7Wr8wyrjBeYoiQui2bK935QiVXh4IA7lQpg17qaNWwC2CNP0woHwQc4d+zeB+H
 D6aG9n/+WfNFZ9Yj6NzMyWd8Ulcs95ysiGlpMaLolIqwfQtFBzNMX2/O8Aa9dGEiE9h7
 ykHUc+z7gFrPpzWnCE1RLQCgTAZbgxm9OQu5LVKloYXB5qadWERaxqvf5StnIGkFSxyG
 IyEe5Qb4qbroFjMqN5aXUgaXA3Kup5eojaeMomFM3HeIChHRmbFF/iZmNl8F4MBWJSej
 gYAQ==
X-Gm-Message-State: ANhLgQ1XKCeEF6NB9GIt++C1E1fJxUEYXII8uZhoJNhsUy99ZgmG3W8g
 yM14yBNDbUhXERF7dAh1uICgwA==
X-Google-Smtp-Source: ADFU+vvrgv81gk4o6ZONBv5TnpgQOQoDOlqWAan4RLn09G+ZQn+4gCIv3XDzhdy5FMhauUz+aYj37w==
X-Received: by 2002:ae9:ed45:: with SMTP id c66mr1018159qkg.488.1585339230457; 
 Fri, 27 Mar 2020 13:00:30 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id b189sm4414461qkc.104.2020.03.27.13.00.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 13:00:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jHv9U-0007fN-Rs; Fri, 27 Mar 2020 17:00:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v3 hmm 0/9] Small hmm_range_fault() cleanups
Date: Fri, 27 Mar 2020 17:00:12 -0300
Message-Id: <20200327200021.29372-1-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:45 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

This is v3 with some minor adjustments made.

We are at the end of the dev cycle, and as nothing major has come up I'll push
this toward linux-next to get some coverage and decide next week what goes
this cycle.

v3 changes:
 - Keep NEED_WRITE_FAULT and NEED_FAULT separate (CH)
 - Use CH's vesion of hmm_can_fault and drop the inline
v2: https://lore.kernel.org/r/20200324011457.2817-1-jgg@ziepe.ca
v1: https://lore.kernel.org/r/20200320164905.21722-1-jgg@ziepe.ca

Thanks to everyone who looked on this,
Jason

Jason Gunthorpe (9):
  mm/hmm: remove pgmap checking for devmap pages
  mm/hmm: return the fault type from hmm_pte_need_fault()
  mm/hmm: remove unused code and tidy comments
  mm/hmm: remove HMM_FAULT_SNAPSHOT
  mm/hmm: remove the CONFIG_TRANSPARENT_HUGEPAGE #ifdef
  mm/hmm: use device_private_entry_to_pfn()
  mm/hmm: do not unconditionally set pfns when returning EBUSY
  mm/hmm: do not set pfns when returning an error code
  mm/hmm: return error for non-vma snapshots

 Documentation/vm/hmm.rst                |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |   2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c   |   2 +-
 include/linux/hmm.h                     | 109 +--------
 mm/hmm.c                                | 307 +++++++++---------------
 5 files changed, 128 insertions(+), 304 deletions(-)

-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
