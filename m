Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F849DFBDA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 09:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6551710E519;
	Mon,  2 Dec 2024 08:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=itb.spb.ru header.i=@itb.spb.ru header.b="YZCkkwv0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 395 seconds by postgrey-1.36 at gabe;
 Mon, 02 Dec 2024 08:08:43 UTC
Received: from forward202b.mail.yandex.net (forward202b.mail.yandex.net
 [178.154.239.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81C210E48A;
 Mon,  2 Dec 2024 08:08:43 +0000 (UTC)
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net
 [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
 by forward202b.mail.yandex.net (Yandex) with ESMTPS id 3DF4B64A6B;
 Mon,  2 Dec 2024 11:02:39 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:2720:0:640:5aee:0])
 by forward101a.mail.yandex.net (Yandex) with ESMTPS id 803B560F03;
 Mon,  2 Dec 2024 11:02:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id f1ZvNeGOfiE0-wjjuYp10; 
 Mon, 02 Dec 2024 11:02:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itb.spb.ru; s=mail;
 t=1733126523; bh=fAvlWEkjGOo1q72idjWA0Eucb8ySH4M7IRqqfWdyYRE=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=YZCkkwv0CsBqEe9B3jleawzwSzgsrdVWTohT8pxpvgP4vnYIybRWF2MoGiOFsWpJQ
 t0u4obNc4EDN19bYamRefun5j7kg56DW7YghxnRW/uriBhWV6+C1yP0KyoU19KYt1S
 1oQXmUZu5CD2fgaGtmHWiO4v5D1Gf56aQFBvbB0w=
Authentication-Results: mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net;
 dkim=pass header.i=@itb.spb.ru
From: Ivan Stepchenko <sid@itb.spb.ru>
To: Kenneth Feng <kenneth.feng@amd.com>
Cc: Ivan Stepchenko <sid@itb.spb.ru>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tim Huang <Tim.Huang@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alexander Richards <electrodeyt@gmail.com>,
 Samasth Norway Ananda <samasth.norway.ananda@oracle.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Rex Zhu <Rex.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH] drm: amd: Fix potential NULL pointer dereference in
 atomctrl_get_smc_sclk_range_table
Date: Mon,  2 Dec 2024 11:00:43 +0300
Message-Id: <20241202080043.5343-1-sid@itb.spb.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:27:09 +0000
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

The function atomctrl_get_smc_sclk_range_table() does not check the return
value of smu_atom_get_data_table(). If smu_atom_get_data_table() fails to
retrieve SMU_Info table, it returns NULL which is later dereferenced.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a23eefa2f461 ("drm/amd/powerplay: enable dpm for baffin.")
Cc: stable@vger.kernel.org
Signed-off-by: Ivan Stepchenko <sid@itb.spb.ru>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
index fe24219c3bf4..4bd92fd782be 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
@@ -992,6 +992,8 @@ int atomctrl_get_smc_sclk_range_table(struct pp_hwmgr *hwmgr, struct pp_atom_ctr
 			GetIndexIntoMasterTable(DATA, SMU_Info),
 			&size, &frev, &crev);
 
+	if (!psmu_info)
+		return -EINVAL;
 
 	for (i = 0; i < psmu_info->ucSclkEntryNum; i++) {
 		table->entry[i].ucVco_setting = psmu_info->asSclkFcwRangeEntry[i].ucVco_setting;
-- 
2.34.1

