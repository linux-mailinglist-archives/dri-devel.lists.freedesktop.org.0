Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74428CAE6CE
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 00:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE3710E3DB;
	Mon,  8 Dec 2025 23:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dPK9vLKm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C289710E19A;
 Mon,  8 Dec 2025 23:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XhqaW39AUfdmfVF3SAApUCNomIwhTRkOqAKbbso7g8c=; b=dPK9vLKm4nIyiPmfjW1ulRk0ml
 oeosvczXe4tj5/2+LLEVTccpWI62JsB4biqPJ8zOXli5BzGtRT4G3nM/Xs+4BQwh80VztMdJ/12/L
 8LpTSBrr0KTi53X5ZfSU44KQO0O+AzLCFLq5MHb9whRag/0o/RWog+QaGNfaYdaMkUr4Idf1i96R2
 iMVk9agnL1cVWy06kdv/asC1oTxzipSZkqMzEkddB3ih4sU1B7i4UEHYX/8KTeH9eyZdUamcuwOfR
 VDlhUXGy4c4093TgPxtvmgEQy6FmROZyGZgV9GL5U3JaqoMcfqioTqUaZZA5hKbVJkBYhOKcA7h9w
 sAiS6OvQ==;
Received: from [186.208.73.250] (helo=django)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vSkxw-00AGsY-VA; Tue, 09 Dec 2025 00:48:29 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com
Cc: kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/2] Fixes on CM3 helper for plane shaper LUT
Date: Mon,  8 Dec 2025 22:44:13 -0100
Message-ID: <20251208234741.293037-1-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some unexpected banding and shimmer effects when using
steamOS/gamescope color pipeline for HDR on DCN32 or newer families.
Those problems are not present in Steam Deck (DCN301). It happens on
DCN32 because plane shaper LUT uses DCN30 CM3 helper to translate curves
instead of DCN10 CM helper. This series identifies the necessary changes
on CM3 helper to reduce differences on color transformation made by
those two helpers.

Patch 1 aims to solve the shimmer/colorful points that looks like a
wrong map of black values on red/green/blue colors. Patch 2 extends the
delta clamping fix made in commit 27fc10d1095f ("drm/amd/display: Fix
the delta clamping for shaper LUT") to solve some banding effects.

Banding is not fully solved by any helper and needs further
investigation.

One easy way to check the current and expected behavior is moving the
cursor (doing composition) to get the expected result from GFX. When the
cursor disappears, those color transformations are back to be done by
the display hw.

Lemme know your thoughts!

Melissa

Melissa Wen (2):
  drm/amd/display: fix wrong color value mapping on DCN32 shaper LUT
  drm/amd/display: extend delta clamping logic to CM3 LUT helper

 .../amd/display/dc/dcn30/dcn30_cm_common.c    | 32 +++++++++++++++----
 .../display/dc/dwb/dcn30/dcn30_cm_common.h    |  2 +-
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   |  9 +++---
 .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 17 ++++++----
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 16 ++++++----
 5 files changed, 50 insertions(+), 26 deletions(-)

-- 
2.51.0

