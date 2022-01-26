Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED3149CDE6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54CE10E74F;
	Wed, 26 Jan 2022 15:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9293D10E5DD;
 Wed, 26 Jan 2022 15:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210526; x=1674746526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dndPtOYPqTOwezjdRbI7YJ3xH5ITLRnkk+dRRTMDA+8=;
 b=UNy4eDegL9rK133I/ZWqLCn5b21EQa6hYL0UvHY1U4yXom2DEuDaGwXY
 6v8p9HPpAXYelrw8MzE9zzfnXe6weturP7qFluEZVwFlp4I4j5XTSAE12
 DI7KOI+KKV8LrDZNWfAfq4LiI03Xym3DZlfnCnMYXZ7Oy+NtyVEUh6nZw
 I5qPnD9FsVqMy8T0jqG7Cer+MkdKOrVMA8dh1IiMVquhId4aVZDdsvPgS
 fJLTAm4H6FR2JbKvlPA/0nmqeLt7cNgHopdBeisw3AzwI3lult0hFS+17
 w2nQFjUi8se4gEmlnOArwPvA3nrXVcYooOX48oeinQwQTbcUHHvaL6KIC Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885186"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885186"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386213"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:03 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/20] Initial support for small BAR recovery
Date: Wed, 26 Jan 2022 15:21:35 +0000
Message-Id: <20220126152155.3070602-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting from DG2 we will have resizable BAR support for device local-memory,
but in some cases the final BAR size might still be smaller than the total
local-memory size. In such cases only part of local-memory will be CPU
accessible, while the remainder is only accessible via the GPU. This series adds
the basic enablers needed to ensure that the entire local-memory range is
usable.

Patches 1-3 are taken directly from Arun' in-progress series[1], which reworks
part of the allocator, and for example, allows us to allocate memory within a
sub-range, and is needed when allocating mappable memory. These patches are only
included here for the benefit of CI testing.

[1] https://patchwork.freedesktop.org/series/98979/

-- 
2.34.1

