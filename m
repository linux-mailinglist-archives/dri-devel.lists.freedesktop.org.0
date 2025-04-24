Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D670A9AD19
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 14:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A08710E7DD;
	Thu, 24 Apr 2025 12:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RX/rpA1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F186510E03F;
 Thu, 24 Apr 2025 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745497126; x=1777033126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/SIGb0KfVl9bAOu3LcoksRG7hybyYEhBnkKi3Y/mkq4=;
 b=RX/rpA1xV7YRnSp/+m/JiCZUxs9i3IQGApcrO8pkg26FLhdESHX70OiL
 OOz8uuWVgG45aBIMHmplMUpE0Bm6ssQ8kO+hyYbxliuTKRz+Xffgw94hI
 dr7mjM0RoGKVWQgHIs5ezH7nptur0sNZ10lajiHoN3LJ8c7YwMJCwPdRD
 FASCu+nPQW1xevtmUOQ6rl9xM3n7fhryzcFQ9nEgAu6pGNETtcjXxiASS
 GXxBsf/emQVlgYlPqXC572fbOozeA8U71q5vgCQqLwNOPt20faDQ2JG5c
 xpLHnJ9gcfbAc8OxIcZM4K+LUhobq4cJUvb5pt/0tpTtk759kKZkq3mXJ g==;
X-CSE-ConnectionGUID: 92a/jjkjRaeLDY6hD2YV3Q==
X-CSE-MsgGUID: BvKUh5ppSiidiqxOzgq5vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50947921"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="50947921"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 05:18:45 -0700
X-CSE-ConnectionGUID: jnI00CMNSGycvGYjpURjaQ==
X-CSE-MsgGUID: XNqqMy0jRa+Jnxl34vyn1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137589301"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.164])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 05:18:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/7] Replace xe_hmm with gpusvm
Date: Thu, 24 Apr 2025 13:18:28 +0100
Message-ID: <20250424121827.862729-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
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

-- 
2.49.0

