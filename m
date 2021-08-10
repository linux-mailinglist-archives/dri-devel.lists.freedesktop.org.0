Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBD83E8623
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 00:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D146E05D;
	Tue, 10 Aug 2021 22:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mr85p00im-zteg06023901.me.com (mr85p00im-zteg06023901.me.com
 [17.58.23.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496E98913B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 20:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1628625579; bh=zOyVSBw3qQLz6J0AOtQqfNf/gPiF0iVfs4SJrjPyvFU=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=ky4Myu6sW0LL+vRzJyaYl1kmqkAVrYJavQWmajemfEtDoP59VLWo1A3XYb5+5KO+v
 jkBnWSFGFO1gq3X5gEFJgaSlcmEjdZ6xno88euOodPn71jzBIVMuRcmz4dkj535BLD
 TwgJ2t7bjAQqjnaUO9mTY9o1yW7jGhl02t/K5F1kuE7fg++j1GETYGZzSLyCLnwfMZ
 vPFEovETvcNJ6e2EQ/qns7v/eGDEJJyZPJf847u2msaqOZMgqQXPyJE1hS0w8DfmrC
 hlZaWIJmJbwoPtbfSht2+w6VUd3n8MVNCcTppQ6O9BWvRG6GDLAWCuuFpk8E4z1Q1B
 8MzbSPRHSq2gw==
Received: from hitch.danm.net (c-73-98-236-45.hsd1.ut.comcast.net
 [73.98.236.45])
 by mr85p00im-zteg06023901.me.com (Postfix) with ESMTPSA id 9A0F6680663;
 Tue, 10 Aug 2021 19:59:38 +0000 (UTC)
From: Dan Moulding <dmoulding@me.com>
To: dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com, ray.huang@amd.com, jason@jlekstrand.net,
 Dan Moulding <dmoulding@me.com>
Subject: [PATCH 0/1] Fix DRM driver initialization failure in kernel v5.14
Date: Tue, 10 Aug 2021 13:59:05 -0600
Message-Id: <20210810195906.22220-1-dmoulding@me.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-08-10=5F08:2021-08-06=5F01,2021-08-10=5F08,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=592
 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 clxscore=1011 phishscore=0
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

After trying out kernel v5.14-rc5 on my system, I no longer get any
display output. Checking dmesg, I found it's because my DRM driver
(nouveau) is failing at ttm_device_init. That is failing because of a
behavior change in ttm_global_init with respect to debugfs. debugfs is
disabled on my system, which causes ttm_global_init to fail. The
following patch fixes the issue by ignoring the debugfs failure, which
is expected, rather than allowing it to cause ttm_global_init to fail.

Dan Moulding (1):
  drm: ttm: Don't bail from ttm_global_init if debugfs_create_dir fails

 drivers/gpu/drm/ttm/ttm_device.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.31.1

