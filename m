Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A56429FA
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 14:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A9110E073;
	Mon,  5 Dec 2022 13:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9804B89023
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 13:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bTIenh40FCC39XN+WcIw5A8gMY4IR7S1+OwUya3n/HQ=; b=hZn4Qk2htMRvxGIHZ3+p7LU0sl
 mzdDdAmXoDuzOXVV2dAMJ0+CsPDiF0UcO8eDhbe6Z+u8Kyfj438RZc3fPPdAaE+wUuUUhxpSPQtFp
 aR8qRujsKTg3/rPK7GCk23WjKJPaEuZxiSWHK7cnDfBR66rCfM1shDOsmHQ7XVBkMlIE1HRcM8++q
 mEcEJJtF+khg3mEBhd/jAwwdPMPZEafJriLzJgD8sNUOOBSzog+4yQkGi8kkKUYBYGbCt/JLnx0lZ
 LEvEnuGzskVsd7XOc7EM8HBBHM+dHKYrcZsWOceleKHlrtPOQ9t4nkiNHB9/DE8Vpf66+m+RZ8a3W
 jj59ROgQ==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p2Bx2-00FUSn-Or; Mon, 05 Dec 2022 14:56:08 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	emma@anholt.net,
	mwen@igalia.com
Subject: [PATCH v2 0/2] drm/v3d: replace obj lookup steps with
Date: Mon,  5 Dec 2022 12:55:36 -0100
Message-Id: <20221205135538.3545051-1-mwen@igalia.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maira Canal <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch just prevents to iterate on a NULL job->bo array during
job cleanup. This situation can happen when v3d_lookup_bos() fails to
allocate memory for the job->bo array and job->bo_count was already set.
The second replace BOs lookup steps in v3d_lookup_bos() with the
common code of drm_gem_objects_lookup().

v2:
- rebase to drm-misc-next

Melissa Wen (2):
  drm/v3d: cleanup BOs properly when lookup_bos fails
  drm/v3d: replace obj lookup steps with drm_gem_objects_lookup

 drivers/gpu/drm/v3d/v3d_gem.c | 55 ++++-------------------------------
 1 file changed, 6 insertions(+), 49 deletions(-)

-- 
2.35.1

