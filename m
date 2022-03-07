Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170064D034C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B991010E04B;
	Mon,  7 Mar 2022 15:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B69110E04B;
 Mon,  7 Mar 2022 15:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ekoCRQmNWFKhpfawjal+IXcvFdj8PyUlUMcRDaQuc28=; b=i5j5DL3RjK2Dl0fbr3Vg+7qoN2
 R4bAmB6hn/DQZa+mzd1noXptXL3PX27H9Kq4u6oGslcjJd4p6B2NJN1y9cPiM7M5TvxZJjc9m+FtR
 gI8R20K7B/UNLuGox2ZScw+l8wisToyaiLqj31I5xcXOULZRaPhhcVafWZryXcVzc52cJ4xsK8X+m
 47DM8n5uLQCeWTRXCmHJvGK4W7xk7WnAL+UQCU3idjJxuOHAupNe0cO6b27/bIMmUWE/0wq7kreA4
 PbIzNGMJ24rKRgEKqvA4VnpVSrakmBAkDJLoa44PD08YkC4E+iTOr46yrNg2+c5RlOiPRtMd0sWO3
 +7euIODw==;
Received: from [192.168.12.191] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nRFat-0002rG-2r; Mon, 07 Mar 2022 16:48:19 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, Rodrigo.Siqueira@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com
Subject: [PATCH 0/3] Move FPU related code from DCN3.1x drivers to DML folder
Date: Mon,  7 Mar 2022 14:47:58 -0100
Message-Id: <20220307154801.2196284-1-mwen@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Melissa Wen <mwen@igalia.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, linux-kernel@vger.kernel.org,
 Jasdeep Dhillon <jdhillon@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series moves FPU code from DCN 3.1x drivers to dml/dcn31 folder to
isolate FPU operations. For this, it creates dcn31_fpu files to centralize
FPU operations and structs from dcn31x drivers, that include:
- _vcs_dpi_ip_params_st and _vcs_dpi_soc_bounding_box_st structs
- dcn31x_update_bw_bounding_box() functions
- dcn31_calculate_wm_and_dlg_fp()

Also, it adds dc_assert_fp_enabled() in public dml-fpu functions, as required,
and I've checked if their calls are properly wrapped by DC_FP_START/END (and
removed when inside dml/fpu files too).

Melissa Wen (3):
  drm/amd/dicplay: move FPU related code from dcn31 to dml/dcn31 folder
  drm/amd/display: move FPU related code from dcn315 to dml/dcn31 folder
  drm/amd/display: move FPU related code from dcn316 to dml/dcn31 folder

 drivers/gpu/drm/amd/display/dc/dcn31/Makefile |  26 -
 .../drm/amd/display/dc/dcn31/dcn31_resource.c | 355 +------
 .../drm/amd/display/dc/dcn31/dcn31_resource.h |   4 +-
 .../gpu/drm/amd/display/dc/dcn315/Makefile    |  26 -
 .../amd/display/dc/dcn315/dcn315_resource.c   | 232 +----
 .../amd/display/dc/dcn315/dcn315_resource.h   |   3 +
 .../gpu/drm/amd/display/dc/dcn316/Makefile    |  26 -
 .../amd/display/dc/dcn316/dcn316_resource.c   | 231 +----
 .../amd/display/dc/dcn316/dcn316_resource.h   |   3 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile   |   2 +
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  | 863 ++++++++++++++++++
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.h  |  44 +
 12 files changed, 921 insertions(+), 894 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h

-- 
2.34.1

