Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0CA4E3272
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 22:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA53010E496;
	Mon, 21 Mar 2022 21:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7C210E497
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 21:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BA2NX4x2iCbeURYzHQoS8utf2aV6LFcUCSHKo7/Ktoo=; b=m7yjYgVnAFqCSGLfM2SPG70zm5
 u5DoDzZUx8nWjrOtQjk2fvFgni5O4ThAfLoehlgngcUf+BHvdIAHFfJHn8Q26lzpqNKtHI90FIeKv
 o+rDgQFxTj1mhyRlgNI1+jg0cuI154X/6460cSFvv8jbTIOfzqW9HuR6yqUO92l2qx64SLY8qSmh1
 zOvusQZyRKhlj3bYU1RA9JQtEVFs3E47aNWi/oJH1GPCw7zoQ3PcLJGS1QF7WTYNC7Ew5d3ImQHJu
 3FhVAp1PZ9qs8b0QFV/l3rJsNRzZeiesIx/4N1SUiWgOa84VxfWzVgR2iYavxtDGTNt1h5lThZsst
 07SyPe9Q==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nWPLN-0000ww-GH; Mon, 21 Mar 2022 22:13:37 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	emma@anholt.net
Subject: [PATCH 0/2] drm/v3d: replace objs lookup steps with
 drm_gem_objects_lookup
Date: Mon, 21 Mar 2022 20:13:14 -0100
Message-Id: <20220321211316.1423294-1-mwen@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch just prevents to iterate on a NULL job->bo array during
job cleanup. This situation can happen when v3d_lookup_bos() fails to
allocate memory for the job->bo array and job->bo_count was already set.
The second replace BOs lookup steps in v3d_lookup_bos() with the
common code in drm_gem_objects_lookup().

Melissa Wen (2):
  drm/v3d: cleanup BOs properly when lookup_bos fails
  drm/v3d: replace obj lookup steps with drm_gem_objects_lookup

 drivers/gpu/drm/v3d/v3d_gem.c | 55 ++++-------------------------------
 1 file changed, 6 insertions(+), 49 deletions(-)

-- 
2.35.1

