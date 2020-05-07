Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE57A1CA673
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D1D6EAA5;
	Fri,  8 May 2020 08:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6A76E979;
 Thu,  7 May 2020 11:25:07 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B8738379BE6317962F8C;
 Thu,  7 May 2020 19:25:03 +0800 (CST)
Received: from huawei.com (10.67.174.156) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 19:24:57 +0800
From: ChenTao <chentao107@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/amd/dc: Remove a useless comparison
Date: Thu, 7 May 2020 19:24:12 +0800
Message-ID: <20200507112412.10829-1-chentao107@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.67.174.156]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
Cc: sunpeng.li@amd.com, Anthony.Koo@amd.com, Rodrigo.Siqueira@amd.com,
 murton.liu@amd.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, chentao107@huawei.com,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, christian.koenig@amd.com,
 Su.Chung@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following warning:

'en' is uint32_t and can never be negative.

drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_hpd.c:132:10: warning:
comparison of unsigned expression < 0 is always false [-Wtype-limits]
  if ((en < GPIO_DDC_LINE_MIN) || (en > GPIO_DDC_LINE_MAX)) {
drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/hw_generic.c:109:10: warning:
comparison of unsigned expression < 0 is always false [-Wtype-limits]
  if ((en < GPIO_DDC_LINE_MIN) || (en > GPIO_DDC_LINE_MAX)) {

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: ChenTao <chentao107@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c | 2 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c
index f9e847e6555d..6cd50232c432 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_generic.c
@@ -106,7 +106,7 @@ void dal_hw_generic_init(
 	enum gpio_id id,
 	uint32_t en)
 {
-	if ((en < GPIO_DDC_LINE_MIN) || (en > GPIO_DDC_LINE_MAX)) {
+	if (en > GPIO_DDC_LINE_MAX) {
 		ASSERT_CRITICAL(false);
 		*hw_generic = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
index 692f29de7797..f91f426699c0 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
@@ -129,7 +129,7 @@ void dal_hw_hpd_init(
 	enum gpio_id id,
 	uint32_t en)
 {
-	if ((en < GPIO_DDC_LINE_MIN) || (en > GPIO_DDC_LINE_MAX)) {
+	if (en > GPIO_DDC_LINE_MAX) {
 		ASSERT_CRITICAL(false);
 		*hw_hpd = NULL;
 	}
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
