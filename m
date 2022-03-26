Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478F4E8428
	for <lists+dri-devel@lfdr.de>; Sat, 26 Mar 2022 21:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA7D10E206;
	Sat, 26 Mar 2022 20:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C62C10E206;
 Sat, 26 Mar 2022 20:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EpyjKKqNIRXrzYQY+o6UBoBbTJ4LcHleDtq3fEVCeEc=; b=pWSUnu9topVqu3bzkXVR9nQkUX
 33pXwHN+Z50EjhibNMzKiZt0RQytD1yecu7pmrN81jl2kKBItH4363YhxC8OUF0KvPvNgV3+Q7Rbz
 wwyHP/O1XXrkEHzmZvmhMoB5b/45VeI6iMzynGQ7MUs0W32OYEZ8PlorRXuECX0YgN/21Ym6sYwzd
 HiWdsfEdyIXFhcIEuC4DzYuJB/KV+axhgQZPfezJi+1SvLLjvA7cl5OFi35sSSay9rVbrKeFlVYJE
 yt5H4Vz3JvwtVJ/3gEm/69uYjdqe0TqrHyNpCLoai6kv7a4qlVT2p1I3+vIa2EQLuI59Ol7z26kFZ
 3IphbG/Q==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nYCy9-0007e9-DK; Sat, 26 Mar 2022 21:25:05 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, daniel@ffwll.ch, harry.wentland@amd.com,
 Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com
Subject: [PATCH 0/2] remove DC_FP_* wrappers in dml files
Date: Sat, 26 Mar 2022 19:24:46 -0100
Message-Id: <20220326202448.2046077-1-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Jasdeep Dhillon <jdhillon@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From FPU documentation, developers must not use DC_FP_START/END in dml
files, but invoke it when calling FPU-associated functions (isolated in
dml folder). Therefore, the first patch renames dcn10_validate_bandwidth
in dml/calcs to dcn_ for generalization, declares dcn10_validate_bandwidth
in dcn10 - that calls dcn_validate_bandwidth and wraps with DC_FP_*
accordingly. The second patch removes invocations of DC_FP_* from dml
files and properly wraps FPU functions in dc code outside dml folder.

Melissa Wen (2):
  drm/amd/display: detach fpu operations from dcn10_validate_bandwidth
    in calcs
  drm/amd/display: remove DC_FP_* wrapper from dml folder

 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c | 10 ++++++++--
 .../drm/amd/display/dc/dcn10/dcn10_resource.c | 16 ++++++++++++++++
 .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 19 +------------------
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  |  2 --
 .../gpu/drm/amd/display/dc/inc/dcn_calcs.h    |  2 +-
 5 files changed, 26 insertions(+), 23 deletions(-)

-- 
2.35.1

