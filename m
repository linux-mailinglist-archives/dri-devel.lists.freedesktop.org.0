Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64EAA4E75
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FB410E2DC;
	Wed, 30 Apr 2025 14:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="T0AMNRuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9096210E2B1;
 Wed, 30 Apr 2025 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LIu7VJz61SLNsihoHPV4xCQkbX9OCBXYRCb12otNTfU=; b=T0AMNRuBHw3YxWY040Yt+bSMZG
 E6L7RjM4KmdJGoFQIPEMMRL+iW3Tf7NApilWHFF/mW3hIkEEYWe5tbsdUbwz5tosjOwQaRbW4yLxo
 SPwTMvHWGGpbpIRMnAp9PtMvK958dk/JfbAO15BHsr2ASkJ960F724hv2hJlSTAJCV6u14k7PMLVo
 0EE5mX3fdaenYMNMIhNrnpBmsu9xfNn1HeI/DWf7cXhWNN1GrMJO5avjVnq8+l0yVbjHEeQpWriWD
 +NZ2nDrVmSqUSI9b9LA42pndKyWnxO5XXiroLp5Xzi/I1/Df8wTp/hrvlPhtc3dBdOM2Ft9cVnLqV
 AUbKRRdg==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uA8Mv-000vo2-7j; Wed, 30 Apr 2025 16:25:55 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH 0/5] drm/amd/display: remove code duplication on dcn401
Date: Wed, 30 Apr 2025 11:20:06 -0300
Message-ID: <20250430142549.829861-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
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

Hi,

I've been examining dcn401 code to figure out what is causing a wrong
cursor gamma on HDR issue reported in [1], and I found unnecessary code
duplications during this inspection. I don't have the HW, so I'd
appreciate if someone can validate this series (if it makes sense to you
ofc).

This series basically adds some hooks to dcn20 base functions that are
usually used in other hw versions and reuses those functions on dcn401
so that we can reduce many lines of code and also increase the coverage
of bug fixes by avoiding the kind of issue of [2]. Better for debugging
and maintainability too.

[1] https://gitlab.freedesktop.org/drm/amd/-/issues/4176
[2] https://lore.kernel.org/amd-gfx/20250430141156.827763-1-mwen@igalia.com/ 

Melissa Wen (5):
  drm/amd/display: add hook for program_tg
  drm/amd/display: hook up program_tg for dcn401
  drm/amd/display: remove duplicated program_front_end_for_ctx code
  drm/amd/display: remove duplicated post_unlock_program_front_end code
    on dcn401
  drm/amd/display: remove duplicated program_pipe code on dcn401

 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  40 +-
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 436 +-----------------
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.h |  10 +-
 .../amd/display/dc/hwss/dcn401/dcn401_init.c  |   5 +-
 .../drm/amd/display/dc/hwss/hw_sequencer.h    |   4 +
 5 files changed, 45 insertions(+), 450 deletions(-)

-- 
2.47.2

