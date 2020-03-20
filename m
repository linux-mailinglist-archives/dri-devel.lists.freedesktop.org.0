Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246218DF85
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9946E2E4;
	Sat, 21 Mar 2020 10:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBE46E1A5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 16:58:23 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id j4so7515992qkc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 09:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=87iKgwaPy8pXzXL9YA5WV3WZml27jYwBmFGI1UGSVUk=;
 b=NaCjjzldyTssF/3z0KZL0Fqab/MMlCzRVjrru2siMv9BUoCtsVnQTd1gi0e4g7Bv7C
 7lWk8bdKCdsAa8UzZNISAM9HmDetrX83wCNt9BSFlOheErwFqT8tMGKNvHewjQr45veO
 HWg6Vy16BlP0KGklKKcCiS4VNcLzsIKutYoiODMmJPm1d2altsZ0q+sdSgGp2+g62JZb
 3CyCsoqW0ZnZ0HCHgfI/B0TdbvC598XLc03bFzjXoW1P352HHxZ0KJ8lx/pW9bAVegn3
 mG+bqtTK0HVO+f8zqeTr/natEqIDzoAw+jhHbk3xIlfLbjCkv7KSx/3qYUaodlY+D0bf
 kGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=87iKgwaPy8pXzXL9YA5WV3WZml27jYwBmFGI1UGSVUk=;
 b=kKf6larjLq9Qp/9Gqx9rP7MLBrU6kGlPPm2Zh5SxAfO24sB7UngHb2HDVd5hD6PLYn
 IFamSWcBZXJy8j+ebERhk+13o2h2F8XSvf8vMe4cLF2Y1fG/V+N5enKziD/bf0jUJ97/
 zIi0JDS6AykpkanaLarMJri42DmYXm7YUubP/zgcpq2wOLI3ENGqGg/s+1VOLDiafUoO
 Vd0JY0j7yPFoKPw2tEQTHvijgXgCmphlfCo5SEdWZMdflFqLCTzVhBHnqSqbFx8uefVE
 RpvDVD24AGoBgSPYX2X6qTMc0sz9WcqHfjClKt63LAJwQqJUlDVFf7xtXLj6Pxi3hOvJ
 p4Gw==
X-Gm-Message-State: ANhLgQ24G/RhSzVjyL7giBwbLRtg5RQ0ccyrzHcltVWTX7F6MMpk5piY
 8OH8xd8/V6ue6ACqJTtlBiGnrpMTwVI0WA==
X-Google-Smtp-Source: ADFU+vvveuclm6zQpq1BtpQVw2AZCya6AVI9ugZ2/VnoudKnWPkwAxuYh/+4WEp0jmf9H9GqVc8R6Q==
X-Received: by 2002:a37:8581:: with SMTP id h123mr8465387qkd.158.1584723024381; 
 Fri, 20 Mar 2020 09:50:24 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id x74sm4382043qkb.40.2020.03.20.09.50.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Mar 2020 09:50:23 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jFKql-0005jg-5N; Fri, 20 Mar 2020 13:50:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 0/6] Small hmm_range_fault() cleanups
Date: Fri, 20 Mar 2020 13:48:59 -0300
Message-Id: <20200320164905.21722-1-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:29 +0000
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

I've had these in my work queue for a bit, nothing profound here, just some
small edits for clarity.

Ralph's hmm tester will need a small diff to work after this - which
illustrates how setting default_flags == 0 is the same as what was called
SNAPSHOT:

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 6ca953926dc13f..5f31f5b3e64cb9 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -300,7 +300,7 @@ static int dmirror_range_fault(struct dmirror *dmirror,
 
 		range->notifier_seq = mmu_interval_read_begin(range->notifier);
 		down_read(&mm->mmap_sem);
-		count = hmm_range_fault(range, 0);
+		count = hmm_range_fault(range);
 		up_read(&mm->mmap_sem);
 		if (count <= 0) {
 			if (count == 0 || count == -EBUSY)
@@ -337,8 +337,7 @@ static int dmirror_fault(struct dmirror *dmirror, unsigned long start,
 		.flags = dmirror_hmm_flags,
 		.values = dmirror_hmm_values,
 		.pfn_shift = DPT_SHIFT,
-		.pfn_flags_mask = ~(dmirror_hmm_flags[HMM_PFN_VALID] |
-				    dmirror_hmm_flags[HMM_PFN_WRITE]),
+		.pfn_flags_mask = 0,
 		.default_flags = dmirror_hmm_flags[HMM_PFN_VALID] |
 				(write ? dmirror_hmm_flags[HMM_PFN_WRITE] : 0),
 		.dev_private_owner = dmirror->mdevice,
@@ -872,7 +871,7 @@ static int dmirror_range_snapshot(struct dmirror *dmirror,
 		range->notifier_seq = mmu_interval_read_begin(range->notifier);
 
 		down_read(&mm->mmap_sem);
-		count = hmm_range_fault(range, HMM_FAULT_SNAPSHOT);
+		count = hmm_range_fault(range);
 		up_read(&mm->mmap_sem);
 		if (count <= 0) {
 			if (count == 0 || count == -EBUSY)
@@ -916,7 +915,7 @@ static int dmirror_snapshot(struct dmirror *dmirror,
 		.flags = dmirror_hmm_flags,
 		.values = dmirror_hmm_values,
 		.pfn_shift = DPT_SHIFT,
-		.pfn_flags_mask = ~0ULL,
+		.pfn_flags_mask = 0,
 		.dev_private_owner = dmirror->mdevice,
 	};
 	int ret = 0;

Jason Gunthorpe (6):
  mm/hmm: remove pgmap checking for devmap pages
  mm/hmm: return the fault type from hmm_pte_need_fault()
  mm/hmm: remove unused code and tidy comments
  mm/hmm: remove HMM_FAULT_SNAPSHOT
  mm/hmm: remove the CONFIG_TRANSPARENT_HUGEPAGE #ifdef
  mm/hmm: use device_private_entry_to_pfn()

 Documentation/vm/hmm.rst                |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |   2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c   |   2 +-
 include/linux/hmm.h                     |  55 +-----
 mm/hmm.c                                | 238 +++++++++---------------
 5 files changed, 98 insertions(+), 211 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
