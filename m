Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F228AE449
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 13:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D3911331D;
	Tue, 23 Apr 2024 11:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EU4AIK/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFCE113315;
 Tue, 23 Apr 2024 11:40:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75D3161378;
 Tue, 23 Apr 2024 11:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F7FC116B1;
 Tue, 23 Apr 2024 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713872426;
 bh=j7L54d9WUWPSsPM8HcAhEmP8NtCCzciLBHdJr/eBWGE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EU4AIK/O+ohldd2vZZ6C2S05M5YdUvaRMVlnF1mVseyhfq1kCu8lEFYeYb/DhKDwG
 ivJon5hiZPXnRJNg7qvVuI8ezQlZ66AHyIdXAPWYGSIirFfMzqocj1Fl+jCHHVDR8r
 /BXHQfaUK/okTmmU5YbDj5c2y/5tsdRLGSOBf6vIn+0a86OLA9rgAFjUWkKDt9hItE
 fkg2qn/RH0u6+8ZLRzRRPapjKUoaqZWiqJ2P6ztRpuI1DETleOCHwCLmHBaAhsNl0t
 pjBT03ii/gW5giUgsiJclcWPnDok0bA3OUvV/lYihyMh3hhox60tGzYQrcVPe1HVk+
 c6HMGVZu8MdWA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kees Cook <keescook@chromium.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 16/18] drm/radeon: silence UBSAN warning (v3)
Date: Tue, 23 Apr 2024 07:01:12 -0400
Message-ID: <20240423110118.1652940-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423110118.1652940-1-sashal@kernel.org>
References: <20240423110118.1652940-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.7
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

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 781d41fed19caf900c8405064676813dc9921d32 ]

Convert a variable sized array from [1] to [].

v2: fix up a few more.
v3: integrate comments from Kees.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Jeff Johnson <quic_jjohnson@quicinc.com> (v2)
Acked-by: Christian König <christian.koenig@amd.com> (v1)
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: keescook@chromium.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/pptable.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/pptable.h b/drivers/gpu/drm/radeon/pptable.h
index 94947229888ba..b7f22597ee95e 100644
--- a/drivers/gpu/drm/radeon/pptable.h
+++ b/drivers/gpu/drm/radeon/pptable.h
@@ -424,7 +424,7 @@ typedef struct _ATOM_PPLIB_SUMO_CLOCK_INFO{
 typedef struct _ATOM_PPLIB_STATE_V2
 {
       //number of valid dpm levels in this state; Driver uses it to calculate the whole 
-      //size of the state: sizeof(ATOM_PPLIB_STATE_V2) + (ucNumDPMLevels - 1) * sizeof(UCHAR)
+      //size of the state: struct_size(ATOM_PPLIB_STATE_V2, clockInfoIndex, ucNumDPMLevels)
       UCHAR ucNumDPMLevels;
       
       //a index to the array of nonClockInfos
@@ -432,14 +432,14 @@ typedef struct _ATOM_PPLIB_STATE_V2
       /**
       * Driver will read the first ucNumDPMLevels in this array
       */
-      UCHAR clockInfoIndex[1];
+      UCHAR clockInfoIndex[] __counted_by(ucNumDPMLevels);
 } ATOM_PPLIB_STATE_V2;
 
 typedef struct _StateArray{
     //how many states we have 
     UCHAR ucNumEntries;
     
-    ATOM_PPLIB_STATE_V2 states[1];
+    ATOM_PPLIB_STATE_V2 states[] __counted_by(ucNumEntries);
 }StateArray;
 
 
@@ -450,7 +450,7 @@ typedef struct _ClockInfoArray{
     //sizeof(ATOM_PPLIB_CLOCK_INFO)
     UCHAR ucEntrySize;
     
-    UCHAR clockInfo[1];
+    UCHAR clockInfo[] __counted_by(ucNumEntries);
 }ClockInfoArray;
 
 typedef struct _NonClockInfoArray{
@@ -460,7 +460,7 @@ typedef struct _NonClockInfoArray{
     //sizeof(ATOM_PPLIB_NONCLOCK_INFO)
     UCHAR ucEntrySize;
     
-    ATOM_PPLIB_NONCLOCK_INFO nonClockInfo[1];
+    ATOM_PPLIB_NONCLOCK_INFO nonClockInfo[] __counted_by(ucNumEntries);
 }NonClockInfoArray;
 
 typedef struct _ATOM_PPLIB_Clock_Voltage_Dependency_Record
-- 
2.43.0

