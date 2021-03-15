Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878F33BC20
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 15:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8A1890EA;
	Mon, 15 Mar 2021 14:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BCA8901E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 14:34:36 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso14879966pjb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=soZF5v7lT9Dyi1mOKGPLcZ6n6wXgVSldyvSnnFs1msA=;
 b=mxdzBBReuuFHC4MBfgFZq+288jOa+pAqaf8TYbYpC5jNdsJMtEIkVeO0fV+0d8bqf6
 hnHF0TbmcoHPtllat+n6bWBFwMiJnySOSqzdG8ONBl5s5Bsu07zD80+J17s/l5/xjMVW
 4/gaLzuvtdVH3hmz1aWnptLfRv8VTIdXKv1IB45SA/MDTWTSH43pdfljdqMnwpeQcPX/
 +DtBRUMFAGV8/GHuKQp1GlW9cGUnREpA3UFLO5w/9GTulzVEOKhF79Nb8zp6iGI6IEIU
 Zn5UMSAmchcY2DJA/Ykuc0XdH02rmwjOnggT9gD4Cy9i7/beIOiuCORqGBtowxoJCrRs
 LURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=soZF5v7lT9Dyi1mOKGPLcZ6n6wXgVSldyvSnnFs1msA=;
 b=ZWZ4znlKpMt50MpWKqVHYDX6Vbe6Dz7t0dxKFsrPcpYM7o0q8fnViaWr0zKj5DUnTy
 oeYmrKfOEIQ2cHk1HVRUyaUl/p4r7seUIa168wrMPgQd4sPEWyb1Aj3dEslVDAIJsa0K
 o+SDJXhGmJNdIb4ilrf2E8LUDGNi21DbIn0ORWQMsgqyimzUAHAyTTEW0b1iuQIBMdNY
 o6bos2tNXnKaQhRDNhObMGfc74pAU4psdxHVKK4GN5lQ7bS5/3Qf/BbsfPYGn9dnaTQh
 mGw51GsBoshAGE/KI05owoyzDWEXAxj7x3stfYPVGQF9QLCfRoRm31a9rCNgh7uGSpjM
 884w==
X-Gm-Message-State: AOAM530rsfGOP9ijSy55WIkFEzqRJUlOWoxpKdh8T9dYTrn2Hn9tQxoA
 KEirznb3w6OVT52cHx9C/M2sQkxY7XE57w==
X-Google-Smtp-Source: ABdhPJykoZRYEM/BE5xaZCQbNoY6MNE9uJVHNVZ2bqlNCuGgE05upIUDvP3oBtbjDUxTyAmZDmVNgA==
X-Received: by 2002:a17:90b:108f:: with SMTP id
 gj15mr13488187pjb.177.1615818875236; 
 Mon, 15 Mar 2021 07:34:35 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id x190sm13520383pfx.166.2021.03.15.07.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 07:34:34 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915: Drop legacy IOCTLs on new HW
Date: Mon, 15 Mar 2021 09:34:25 -0500
Message-Id: <20210315143428.1471489-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These three patches exist to clean up some of our IOCTL mess in i915.
We've got more clean-up we should do eventually, but these are some of the
easiest to drop and most egregious cases.

Test-with: 20210121083742.46592-1-ashutosh.dixit@intel.com

Ashutosh Dixit (1):
  drm/i915: Disable pread/pwrite ioctl's for future platforms (v3)

Jason Ekstrand (2):
  drm/i915/gem: Drop legacy execbuffer support (v2)
  drm/i915/gem: Drop relocation support on all new hardware (v5)

 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 113 ++----------------
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 -
 drivers/gpu/drm/i915/i915_drv.c               |   2 +-
 drivers/gpu/drm/i915/i915_gem.c               |  14 +++
 include/uapi/drm/i915_drm.h                   |   1 +
 5 files changed, 26 insertions(+), 106 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
