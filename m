Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 489456999FD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 17:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0366B10EDF3;
	Thu, 16 Feb 2023 16:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9469010EDE3;
 Thu, 16 Feb 2023 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676564876; x=1708100876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bB0yEoEN0ySb53usISPK4arHDA3rAgb2rtiAcLaJYXg=;
 b=jRZ70FEgkLP+J8/H0P9dIkTgoTYe2usp5pxyDGqheYRkN1Ty2791UTYD
 mReE1Pjcn8SnR6BB74x1gbLsGkmJXEz0OWqApdWtAWdGI6TLDInerrYVl
 uhGX0h/DUf9LncL0BmhdTijl/5Pp7o0oK/pVcsoPUwXID+gbs1Eklka5Z
 YClCVqaX1xkzE3kiMXx+uaGQUgoiNgqviMvPZ1S8wmiqSfAciNVP/1yjJ
 nExxp9njR81FCA6P3ZjGicR4ZRCHFp1KZgGCsJso7gV7c0RSnQpFby9Tp
 TI/u4zCZ5/Mms7wptogrXeS1VYb+14DjmckK7SrK5DI8ApP1E3LdtZKJM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="311389356"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="311389356"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:27:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="794080663"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="794080663"
Received: from ksushmit-mobl1.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:27:53 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] drm: Add a gpu page-table walker
Date: Thu, 16 Feb 2023 17:27:28 +0100
Message-Id: <20230216162729.219979-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A slightly unusual cover letter for a single patch.

The page table walker is currently used by the xe driver only,
but the code is generic so we can be good citizens and add it to drm
as a helper, for possible use by other drivers,
If so we can merge the commit when we merge the xe driver.

The question raised here is
*) Should it be a generic drm helper or xe-specific with changed
   prefixes?
*) If a drm helper, should we use a config option?

For usage examples, see xe_pt.c
https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_pt.c

Thanks,
Thomas

Thomas Hellström (1):
  drm: Add a gpu page-table walker helper

 drivers/gpu/drm/Makefile      |   1 +
 drivers/gpu/drm/drm_pt_walk.c | 159 +++++++++++++++++++++++++++++++++
 include/drm/drm_pt_walk.h     | 161 ++++++++++++++++++++++++++++++++++
 3 files changed, 321 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_pt_walk.c
 create mode 100644 include/drm/drm_pt_walk.h

-- 
2.34.1

