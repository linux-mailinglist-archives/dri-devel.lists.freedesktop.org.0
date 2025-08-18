Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241AB2AC8D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAAC10E482;
	Mon, 18 Aug 2025 15:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nljW5Nl1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BB710E47F;
 Mon, 18 Aug 2025 15:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755530525; x=1787066525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ok4Nga5EdvT8YebjMT8S09VKu9UQdSTJqpymlD77/BU=;
 b=nljW5Nl1uZ2vfTj5ura/H7xEP04zj33lHpl14YmL26obGI0M0APWMhSH
 pKJCC+sHbulin3pPQgKO+E5ngu2IAp3WjL9R7+fBOAcR6+dJ3vXhXn3d9
 AHOlblsaa/aGXUHLLv3dihmBBqOdMY1/ld7HcJJv5nZrajKhUo4hYWD80
 fyNxeowaz0jlr6DfODRuu+yH+JsxQ3w2Ed20TOYHB/M478IHa/CMw4Iba
 c2yourcKwlcl2bW4qeZv9GsDMlazkzXAk4aXpg34gi8Dw2E1873Tk8Cfc
 Mwiv/BOCZCPTCOSqk42zLnU3vD6m95IVWMj6MGZRsMpGBZbqa83kZkBzq A==;
X-CSE-ConnectionGUID: I2f0Gw6nTO+s7WnXPG+W0A==
X-CSE-MsgGUID: XKpeFilnT3+Anb1u+CAjYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69205829"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="69205829"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:22:04 -0700
X-CSE-ConnectionGUID: zoxagRbXTi6yXEiiZDQQLg==
X-CSE-MsgGUID: 25c+7n9mQLmsdqa1kwLJ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171837197"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:22:04 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/8] Replace xe_hmm with gpusvm
Date: Mon, 18 Aug 2025 16:21:53 +0100
Message-ID: <20250818152152.67815-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
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

As a first step to moving userptr handling over to drm, replace the hmm
usage in xe over to gpusvm, which already offers similar functionality. As
some prep steps we also align on some of the missing pieces that were
already handled in xe_hmm.

v2:
  - Rework the gpusvm API based on feedback.
  - Unify SVM and userptr vm struct so we use the same notifier lock.
  - Drop the mark pages as dirty patch.
  - Various other improvements.
v3:
  - Further unify common handling of userptr and svm in xe.
v4:
  - Allow building xe without userptr, like when building on UML.
v5:
  - Rebase on lastest drm-tip. Lots of conflicts.

-- 
2.50.1

