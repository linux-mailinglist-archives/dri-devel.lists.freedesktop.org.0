Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4091D5BB1A5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 19:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D146410E4EA;
	Fri, 16 Sep 2022 17:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0530610E4EA;
 Fri, 16 Sep 2022 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663349791; x=1694885791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BKCGNuAakjS1dJvNqfSqeh+DgjmU5iGuMK+7AZif4FA=;
 b=GmB7MZ/9gzPeJ1RCkKa4dM3PA9z+U3O6mvXa/7NpuJDPin8nRx7At/AS
 imref4yQepafOQIH74XdnZ9RCmb62wmnkF6Z+/juQwbzu4L3klUg0Oq7g
 VHMfMVaODwln48KN1uj5iT5chihAVpmxhWBOE9ALLMugP0NcCm+GioG5h
 ove7pWKQYJINTKPqnQDchJ3oRFWTM25dlRZh1t14YtqdJGQnptNRW8Mj+
 VckGlF9cTRY51npnJWE3sjyixf1pdlN+9w5qgycOuzfOAYd6uv1tS9Gzr
 f+45W6Yzdgd3JyO3l+aHT8bbpEs5jISrcDYANJBJbdYM2c/diYkX4OT8G Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="278769856"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="278769856"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 10:36:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="721499658"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 10:36:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Caz Yokoyama <caz@caztech.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [PATCH v2 0/3] drm/i915: Improvements to stolen memory setup
Date: Fri, 16 Sep 2022 10:36:05 -0700
Message-Id: <20220915-stolen-v2-0-20ff797de047@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-bbe61
Content-Transfer-Encoding: quoted-printable
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
Cc: tejas.upadhyay@intel.com, dri-devel@lists.freedesktop.org,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Better split, document, and make the code paths for integrated and discrete=
=0D
more similar.=0D
=0D
v2:=0D
  - s/GENMASK/REG_GENMASK64/ where appropriate=0D
  - Fix comment=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
Lucas De Marchi (3):=0D
      drm/i915: Add missing mask when reading GEN12_DSMBASE=0D
      drm/i915: Split i915_gem_init_stolen()=0D
      drm/i915/dgfx: Make failure to setup stolen non-fatal=0D
=0D
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 188 +++++++++++++++++--------=
----=0D
 drivers/gpu/drm/i915/i915_reg.h            |   1 +=0D
 2 files changed, 109 insertions(+), 80 deletions(-)=0D
---=0D
base-commit: 13d68eac4fd3384eeb113e183c4abe2e3afdf76c=0D
change-id: 20220915-stolen-7aa0e407368f=0D
=0D
Best regards,=0D
-- =0D
Lucas De Marchi <lucas.demarchi@intel.com>=0D
