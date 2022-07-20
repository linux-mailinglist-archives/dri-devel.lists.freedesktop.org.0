Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA44A57BE98
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 21:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF3A1134DE;
	Wed, 20 Jul 2022 19:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DC8113268;
 Wed, 20 Jul 2022 19:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gR2QJnGnzypR+W7djQaUNnNk+t89NVQfrPLkux7hgB8=; b=Ffnn2/LoAfxiTWrosDxVvJQ682
 /5tnAkcKauOQSORT7SQjIGlMY3UVak8MWtv//vrn1lH3b10pccLtMMws7Ig2083KVCtLNCOTbyuW3
 8+HfpQfp6OUp95IU4S4VZlaQXZ9GKfwNG+hhMFj+MyPkU2nBPmkTz0GY+5GNEo+9h0B3qPd9C8ToS
 plGhiWKlm/6HNkcvrqe8xi9QG0OqdNQ91dLgVkmB2E0HMvJLj/xKA7R/T+Abh7tZJo4gbEDFPKG/f
 30yRODUAiYDDAyg8QKHoAxXVPCThcZPLHNVv6ZEDZ+vjspNVziLOGR1jdzYKg/cYFqs7gvUtCHyqP
 NMnFnXDA==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oEFRM-000fxI-CI; Wed, 20 Jul 2022 21:33:00 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@linux.ie, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, Rodrigo.Siqueira@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com
Subject: [PATCH 0/5] drm/amd/display: FPU cleanup in clk_mgr files for powerpc
Date: Wed, 20 Jul 2022 18:32:03 -0100
Message-Id: <20220720193208.1131493-1-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An initial report from Guenter[1] shows some soft-fp vs hard-fp error
from DCN31 clk mgr for powerpc. I was not able to reproduce it
cross-compiling with gcc-powerpc-linux-gnu and gcc-11.3, but thanks to
Maíra tips, I can reproduce the issue using make.cross, as follows:

- wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
- chmod +x ~/bin/make.cross
- mkdir build_dir
- COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 ~/make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash

with a config file generate by allmodconfig

So, the first patch fix the issue reported by Guenter. The second is
just a cleanup in dcn31_resource file to remove useless DC_FP_ wrapper.
Finally, the last three patches I'm removing the -mno-gnu-attribute
option, that was just hiding FPU-associated code in clk mgr files of
dcn21/30/301, and moving them to DML folder. This series doesn't cover
recent drivers dcn32/314.

Thanks Guenter, Maíra, Siqueira and Alex for all inputs on this
debugging process. Let me know your thoughts on this approach.

Melissa

[1] https://lore.kernel.org/amd-gfx/20220618232737.2036722-1-linux@roeck-us.net/

Melissa Wen (5):
  drm/amd/display: fix soft-fp vs hard-fp on DCN 3.1 family for powerpc
  drm/amd/display: remove useless FPU protection wrapper from
    dcn31_resource file
  drm/amd/display: move FPU code on dcn21 clk_mgr
  drm/amd/display: move FPU code from dcn30 clk mgr to DML folder
  drm/amd/display: move FPU code from dcn301 clk mgr to DML folder

 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  18 --
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 234 +----------------
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h |   7 +
 .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  |  63 +----
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    |  86 +------
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.h    |   3 +
 .../drm/amd/display/dc/dcn31/dcn31_resource.c |  11 +-
 .../amd/display/dc/dcn315/dcn315_resource.c   |   5 +-
 .../amd/display/dc/dcn316/dcn316_resource.c   |   5 +-
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 235 ++++++++++++++++++
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.h  |   2 +
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  |  63 ++++-
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.h  |   1 +
 .../amd/display/dc/dml/dcn301/dcn301_fpu.c    |  74 ++++++
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  |  11 +
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.h  |   3 +
 16 files changed, 423 insertions(+), 398 deletions(-)

-- 
2.35.1

