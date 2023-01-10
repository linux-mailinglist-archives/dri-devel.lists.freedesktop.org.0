Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB811664A15
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 19:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DF810E635;
	Tue, 10 Jan 2023 18:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5967A10E13B;
 Tue, 10 Jan 2023 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673375358; bh=ysQKgi/JrIlMmf5X/MsjVffw4bVjIB+SlJMK93Fc6kg=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=OexEuoD9w2rlMChDuyt0Lgha7b7LxqL3HJv8QJLNqyDAcSy+l2nixqXecxJQhxkqS
 5QvyViSKyMEvFCWmZ0A5h4m2Cmv2yE15Vo4a1D1+q+CD5JNsXKoC6xcif0M6+BLN9t
 Zf3EpUPIuX94dRxlKAXQI/s5DZHkkRBpBUhuCuG0=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Tue, 10 Jan 2023 19:29:18 +0100 (CET)
X-EA-Auth: oQ+AcTSeF9jeNjLefVNdNkG4EnXmo8P+THlMmFEOkOeY8Q9R+8z2jAIjLfGWEzOAlKzkPWXxiVB7FkaoUs3fWy/2E/lJeh2t
Date: Tue, 10 Jan 2023 23:59:12 +0530
From: Deepak R Varma <drv@mailo.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/i915/gvt: Avoid full proxy f_ops debug attributes
Message-ID: <cover.1673375066.git.drv@mailo.com>
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
the full proxy f_ops at runtime. The patches 1 & 2 covers for the scan_nonprivbb
 and vgpu_status f_ops debugfs attributes respectively.

Following coccicheck make command helped identify this change:
    
make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci



Deepak R Varma (2):
  drm/i915/gvt: Avoid full proxy f_ops for scan_nonprivbb debug
    attributes
  drm/i915/gvt: Avoid full proxy f_ops for vgpu_status debug attributes

 drivers/gpu/drm/i915/gvt/debugfs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.34.1



