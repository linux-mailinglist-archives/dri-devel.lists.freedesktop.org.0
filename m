Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830DC9863F3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8A310EA5C;
	Wed, 25 Sep 2024 15:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pK0s3joC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F4C10E122;
 Wed, 25 Sep 2024 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9nu9bx8RLqUAcZIzcd6cSZ72vpnqmJ5hf11/LATlcPA=; b=pK0s3joCbbminBLUuPeQBSBJi+
 xwI/ItsLUUi3ELy+/SVcytm+NVazXeCbS4qcizchN7FSUeSP47CQOnFG8TIcOHSevN4ZbTMJgKimI
 to3pR92E+SplEwn46s5425j7Qn22a9rASKBCgWop5qgOQaOKkUANmjzTtgsriYO1yZ2cNprvxEYDS
 tUc5b1JsIgd/HTF5uoBcTlvHJSjSqvbSnco1Hkdt0RZX94hpXznszQNcReBZpd3wc0l6hvBG7rqQ9
 XinDYc9T55PJPBZOuKtmuolIqFopqnk0Hb5iPT5e9Kb6tVNxF5UDu2/HqxxM6LTu+k0J72G17g/eU
 hQEg/TEw==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1stUAs-000y8P-NM; Wed, 25 Sep 2024 17:43:31 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, Rodrigo.Siqueira@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/amd/display: increase MAX_SURFACES in line with
 planes and streams
Date: Wed, 25 Sep 2024 12:37:17 -0300
Message-ID: <20240925154324.348774-1-mwen@igalia.com>
X-Mailer: git-send-email 2.45.2
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

Hi!

AFAIU, the driver is defining two different max number of surfaces:
MAX_SURFACES (dc.h) and MAX_SURFACE_NUM (dc_types.h) Many years ago,
MAX_SURFACES was set 3 just to prevent a stack size warning as in
091a97e542cf ("drm/amd/display: Fix warning. Set MAX_SURFACES to 3")[1].
But according to commit 3cfd03b79425 ("update max streams per
surface")[2], from 2023, six is the real max number of surfaces
supported by any asics and the warning that motivated [1] seems not
valid anymore.

This mismatch looks a bit problematic per se, and I wonder if we should
start using only one definition (MAX_SURFACES or MAX_SURFACE_NUM) in the
whole driver.

Also, with MAX_PLANES and MAX_STREAMS both set as 6, there are some
driver with `max_slave_planes = 2` and so the maximum of 3 surfaces can
cause an array-index-out-of-bonds, as reported by [3] and pointed out in
the second patch of this series (MAX_SURFACES < plane_count).

I suppose that this blew up after 1d0c9ded4519 ("Introduce overlay
cursor mode") [4], since it uses one more DCN plane for cursor overlay
mode.

So, the first patch just update MAX_SURFACES to 6 and the second add
some debug prints to warn when changes on these values might cause
array-index-out-of-bounds.

Let me know your thoughts.

Thanks,

Melissa

[1] https://gitlab.freedesktop.org/agd5f/linux/-/commit/091a97e542cf
[2] https://gitlab.freedesktop.org/agd5f/linux/-/commit/3cfd03b79425
[3] https://gitlab.freedesktop.org/drm/amd/-/issues/3594
[4] https://lore.kernel.org/amd-gfx/20240315170959.165505-2-sunpeng.li@amd.com/

Melissa Wen (2):
  drm/amd/display: increase max surfaces in line with planes and streams
  drm/amd/display: add warnings for MAX_SURFACES mismatch

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 +++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc.h           |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.45.2

