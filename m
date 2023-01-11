Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106F6665FB1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BD210E767;
	Wed, 11 Jan 2023 15:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB5810E767;
 Wed, 11 Jan 2023 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673452244; bh=dejsgE3Ez/67WXZ8VD64EdJhbcaTHAeJCXvwM7APl2o=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=b1xwBMzSmZjZAGrMcc5ukE1wtNmAp3WxjkT4sWFQGR38WpcBunwCqGr1Zas1/jQyV
 S0LTaFpCMIYoNG4R4sXAKfrdwuzAsfts7CQ0Vuu03XbtK54ljfWRVavykPoV42HSB9
 KU3tFGK8dZlaREldkf7dGk32PXdWG/MmogmvqYIc=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Wed, 11 Jan 2023 16:50:44 +0100 (CET)
X-EA-Auth: TMlNij5nhUdtDQ4SpLM6IYnEDTxtuqjBkguRcd4KwH/DlESbPp9RituNi8rLvrnlqMWLkEhVjODFBx/z+HL5Fr66OQ31zz/p
Date: Wed, 11 Jan 2023 21:20:40 +0530
From: Deepak R Varma <drv@mailo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] drm/i915: Avoid full proxy f_ops debug attributes
Message-ID: <cover.1673451705.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series proposes to replace a combination of DEFINE_SIMPLE_ATTRIBUTE() +
debugfs_create_file() by a combination of DEFINE_DEBUGFS_ATTRIBUTE() +
debugfs_create_file_unsafe(). The change reduced overhead in terms of managing
the full proxy f_ops at runtime. The patches 1 & 2 covers for the DRRS and FBC
f_ops debugfs attributes respectively.

Following coccicheck make command helped identify this change:

make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

Changes in v3:
   Patch 1/2: fix checkpatch function parameter alignment complaint
   Patch 2/2: None

Changes in v2:
   - Individual patches clubbed in patch set
   - Update patch log message to include coccicheck make command


Deepak R Varma (2):
  drm/i915/display: Avoid full proxy f_ops for DRRS debug attributes
  drm/i915/fbc: Avoid full proxy f_ops for FBC debug attributes

 drivers/gpu/drm/i915/display/intel_drrs.c |  8 ++++----
 drivers/gpu/drm/i915/display/intel_fbc.c  | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.34.1



