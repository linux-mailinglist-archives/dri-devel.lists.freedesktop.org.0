Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6A4A49878
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705C810EC6D;
	Fri, 28 Feb 2025 11:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="S2Bymyau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2344710EBB3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 23:16:53 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Z3nKM5dhRz9sqL;
 Fri, 28 Feb 2025 00:16:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
 s=MBO0001; t=1740698200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ELa5D/D34VuKPMdQJYbPumskuGUUaVxi92U53xY248I=;
 b=S2BymyauBHssgWZ987eQDTAWbxsFchlBOYzi9MHvItPAKaITPnSTrmBUqTeC2yh4gKHVGk
 weGNfcdLf0wqWjOY35k985v/3kP0v7XrpEVcOdRG+KfOPpTNeqJcthZvVhMnQZ7h7t2lcA
 WChu78pgAe6yzzhbqPl1gzNUw6DM+couU2iKCltLtz7Ea+SGJeIQ4A4cUBisO5A6mdNepr
 NgEfIGyPmbyaVb8dZuxyvDegJrnrDWxTTzJFSlQ/Qn10dCZAu2bUnBh5NtboMVHURWkGjy
 CCc4tD+k6YkPNf2UdNVo9OcFeb1eWpSbkvxj9kRAC1CCGKd0tfEnGHgWlplB2g==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Subject: [PATCH 0/4] drm/amd/display: move from kzalloc(size * nr, ...) to
 kcalloc(nr, size, ...)
Date: Thu, 27 Feb 2025 18:16:20 -0500
Message-Id: <20250227-amd-display-v1-0-52a060a78d08@ethancedwards.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETywGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNz3cTcFN2UzOKCnMRK3UQLYxOjZFPTRMtEAyWgjoKi1LTMCrBp0bG
 1tQDfWN/RXQAAAA==
X-Change-ID: 20250227-amd-display-a8342c55a9a0
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=qryNsb6eKMy0Wo+mVn5eYMTnjQFI42YtE83+U+++mzs=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeHBCLzRGTFJEM1h0L3h0SVhuTGZMV3MrdFgxUjlXOUk0CmltSDNoSDlmM3Npd0IxN1RD
 azNxS0dWaEVPTmlrQlZUWlBtZm81ejJVSE9Hd3M2L0xrMHdjMWlaUUlZd2NIRUsKd0VUMnhERXl
 yRFE2dDMxTFhQYmtoL2ZTcGpNdlVSVjQ0cmwxcXJuMm9vdTFvaHZ2dlhzYitvZmhmMHlwNGU5YQ
 oxUXJPTlpOTVVqZmR1RnczZWFyZ01zbnRPbExxNTQ2bWx4N0pZQUVBWEVkUGdBPT0KPS91Ni8KL
 S0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-Mailman-Approved-At: Fri, 28 Feb 2025 11:42:15 +0000
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

We are trying to get rid of all multiplications from allocation
functions to prevent integer overflows. Here the multiplications are
probably safe, but using kcalloc() is more appropriate and improves
readability. It is also safer. This series contains a few patches
with these fixes.

Part of the Kernel Self Protection Project efforts. Links below have
more details.

Link: https://github.com/KSPP/linux/issues/162
Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
Ethan Carter Edwards (4):
      drm/amd/display: change kzalloc to kcalloc in dcn30_validate_bandwidth()
      drm/amd/display: change kzalloc to kcalloc in dcn31_validate_bandwidth()
      drm/amd/display: change kzalloc to kcalloc in dcn314_validate_bandwidth()
      drm/amd/display: change kzalloc to kcalloc in dml1_validate()

 drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c   | 3 ++-
 drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c   | 3 ++-
 drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c | 3 ++-
 drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c   | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250227-amd-display-a8342c55a9a0

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>

