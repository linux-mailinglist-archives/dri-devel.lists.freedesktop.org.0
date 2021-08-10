Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E515F3E8624
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 00:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AF0896FA;
	Tue, 10 Aug 2021 22:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 449 seconds by postgrey-1.36 at gabe;
 Tue, 10 Aug 2021 20:07:08 UTC
Received: from mr85p00im-zteg06023901.me.com (mr85p00im-zteg06023901.me.com
 [17.58.23.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37737887B3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 20:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1628625583; bh=s1cPm8HegoNT9dGbcJEQxgA1i4oLOeLZQ2A1TVk/fM8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=goiGI7eU6Z7Tjdg870Mh4akNLrN4f6U4yEBOgfRq8KRdHV8JhScJrQE16pnW+IX6N
 ZAm88enVqfwXcM4nSqzSBl1QTaOAKfQIYRzpMVNqgShMufSQUD2V0hgZieEx8NC8Ge
 ucXxWNafukC5s7WfSZb2q/XFN3ePeuxYF/lgGApLj2wqTBdvW+6tFictT+3odBnfk1
 iIgi57dGcHmKeQjFyFSLN297P2OLGpyOvHrUJhgnkdVicXXjMNxV/uEE9MBGVGpqEH
 5vS5PVItd4adDiKhjkLeSMBBC6/pzEd5OQL6sPK4/eHDtDTzv+qxxgo3soM3Y0zlHc
 hq/4erqyhWHXw==
Received: from hitch.danm.net (c-73-98-236-45.hsd1.ut.comcast.net
 [73.98.236.45])
 by mr85p00im-zteg06023901.me.com (Postfix) with ESMTPSA id 058D76804D7;
 Tue, 10 Aug 2021 19:59:42 +0000 (UTC)
From: Dan Moulding <dmoulding@me.com>
To: dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com, ray.huang@amd.com, jason@jlekstrand.net,
 Dan Moulding <dmoulding@me.com>
Subject: [PATCH 1/1] drm: ttm: Don't bail from ttm_global_init if
 debugfs_create_dir fails
Date: Tue, 10 Aug 2021 13:59:06 -0600
Message-Id: <20210810195906.22220-2-dmoulding@me.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810195906.22220-1-dmoulding@me.com>
References: <20210810195906.22220-1-dmoulding@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-08-10=5F08:2021-08-06=5F01,2021-08-10=5F08,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=854
 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2108100132
X-Mailman-Approved-At: Tue, 10 Aug 2021 22:42:22 +0000
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

In 69de4421bb4c ("drm/ttm: Initialize debugfs from
ttm_global_init()"), ttm_global_init was changed so that if creation
of the debugfs global root directory fails, ttm_global_init will bail
out early and return an error, leading to initialization failure of
DRM drivers. However, not every system will be using debugfs. On such
a system, debugfs directory creation can be expected to fail, but DRM
drivers must still be usable. This changes it so that if creation of
TTM's debugfs root directory fails, then no biggie: keep calm and
carry on.

Fixes: 69de4421bb4c ("drm/ttm: Initialize debugfs from ttm_global_init()")
Signed-off-by: Dan Moulding <dmoulding@me.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 74e3b460132b..2df59b3c2ea1 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -78,9 +78,7 @@ static int ttm_global_init(void)
 
 	ttm_debugfs_root = debugfs_create_dir("ttm", NULL);
 	if (IS_ERR(ttm_debugfs_root)) {
-		ret = PTR_ERR(ttm_debugfs_root);
 		ttm_debugfs_root = NULL;
-		goto out;
 	}
 
 	/* Limit the number of pages in the pool to about 50% of the total
-- 
2.31.1

