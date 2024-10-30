Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 212199B59FC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 03:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3B610E73A;
	Wed, 30 Oct 2024 02:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B5510E0E4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 02:35:37 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XdWQz6P6bz1jw59;
 Wed, 30 Oct 2024 10:34:03 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 629511A0188;
 Wed, 30 Oct 2024 10:35:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 30 Oct
 2024 10:35:34 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <dave.stevenson@raspberrypi.com>,
 <quic_jjohnson@quicinc.com>, <mcanal@igalia.com>,
 <skhan@linuxfoundation.org>, <davidgow@google.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 0/3] drm/tests: Fix some memory leaks
Date: Wed, 30 Oct 2024 10:35:01 +0800
Message-ID: <20241030023504.530425-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)
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

Fix some memory leaks in drm tests.

Changes in v4:
- Return NULL early if drm_display_mode_from_cea_vic() return NULL
  for drm_kunit_display_mode_from_cea_vic() helper as Maxime suggested.
- Split out the separate ttm test patch.

Changes in v3:
- Adjust drm/drm_edid.h header to drm_kunit_helpers.c.
- Drop the "helper" in the helper name.
- s/fllowing/following/
- Add Acked-by.

Changes in v2:
- Fix it with new introduced helper instead of drm_mode_destroy().
- Update the commit message.
- Add Reviewed-by.

Jinjie Ruan (3):
  drm/tests: helpers: Add helper for drm_display_mode_from_cea_vic()
  drm/connector: hdmi: Fix memory leak in
    drm_display_mode_from_cea_vic()
  drm/tests: hdmi: Fix memory leaks in drm_display_mode_from_cea_vic()

 drivers/gpu/drm/tests/drm_connector_test.c    | 24 +++++------
 .../drm/tests/drm_hdmi_state_helper_test.c    |  8 ++--
 drivers/gpu/drm/tests/drm_kunit_helpers.c     | 42 +++++++++++++++++++
 include/drm/drm_kunit_helpers.h               |  4 ++
 4 files changed, 62 insertions(+), 16 deletions(-)

-- 
2.34.1

