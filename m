Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A691C57C2
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B3189E63;
	Tue,  5 May 2020 14:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B141589E63
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 14:02:17 +0000 (UTC)
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N49Qd-1j5KPS3F33-0107Nn; Tue, 05 May 2020 16:02:11 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 John Clements <john.clements@amd.com>
Subject: [PATCH] drm/amdgpu: allocate large structures dynamically
Date: Tue,  5 May 2020 16:01:52 +0200
Message-Id: <20200505140208.284473-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:TSc6c1YhMkCs/1m6SAPJGzLtfTJo7NH6Kjg0A5Q4anVbFFYTPN5
 1czvuDksXTPHuVVr43jFu9sB5c2K9U6ytyW55vWyZ4r7H0ZUmFKe76IuD5mBKMJUf1MmwPe
 tlZvkffxNQkE68Ei2SmM2ddGqT4IuwdBy7H+4QdwPa2l1iB61k6gKOkn+y+Hiaa/z4D32XR
 4c8iHqP3q0nR2voq6Q9XQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ehOmyu1YHYk=:YfokoQK8msooNpbn1YmqWu
 OB8R4hZYKfau7q9kunjemn98+cEQ83JLib4NTIyyi7SXBQlM2UwbtF7lmaC91tJHHITRe5swG
 39aHpP4h60fJDMPo35ysmZ6bQqiJrrkbkNj6GQoczvZhNtnWmPQ9/pZMIuF1Bxx+0GX1t5H9V
 8soeOvbfWOjDrUEibO3tHcSEWbm+Yu8BUP1vMp6yalpadQuXwhXMjwvivJX0XJabCEGNG/qRl
 er9HM3fbhZb5zRNfqBcY3pqmhSJv+2rf4T90SL45KksdW7L7oQ9FldpwfArZBmsJUznZxUHbh
 9hXQs5mn49vQXjB4gY499V168K/8gLQdHAUxp4Sxf2PSoZbWjags0nn8FT2SSm1R+7W9Ac63Y
 2+qgAspf/KnaaLRYw0AxOd+8qxbj+IFtRRUyFyHGu0uQHrOgyn19q1zdkc2H6rt4BhQDqyqh2
 HxLHQCLBlmD7mQ9HUtmUSXSwnYAnN5faU7rK7drwpq6yHla8i7dvl6IE30adDSJ6OYK47rDq6
 zEZZZCBYrNMjF808LpJIalmU1GLyIaHsrdkp0kzUR3yGEr8p3xRuWh7LnWa+5juk5dpB/rJM9
 yuiJ4ZT6hsyAsFyN2/bemmwsaEqDEZVpXAm+vpvVP99ZJSDCwE47tX6UDuL4VUDK6gRlDBVTq
 xhpfMP+/EbAm5WjojLeJQo5eHGE7EbAUm1A7RkounGFSYdRFmaUSZAUf57MbYcWmIm8Hu7FeH
 uA9rLOi0+w1T6PGTl4QgcW3lurPeHQIxVMfMiZzZwJb+KCUnQbNYpp0UdfuBib7a4L44eBtFC
 kn0PlqTfzUUwHMjku0boUq9b2pW5q8tkPyqqbXi3JkkTbTWn+c=
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
Cc: Arnd Bergmann <arnd@arndb.de>, Guchun Chen <guchun.chen@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dennis Li <Dennis.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After the structure was padded to 1024 bytes, it is no longer
suitable for being a local variable, as the function surpasses
the warning limit for 32-bit architectures:

drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:587:5: error: stack frame size of 1072 bytes in function 'amdgpu_ras_feature_enable' [-Werror,-Wframe-larger-than=]
int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
    ^

Use kzalloc() instead to get it from the heap.

Fixes: a0d254820f43 ("drm/amdgpu: update RAS TA to Host interface")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 31 +++++++++++++++++--------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 538895cfd862..7348619253c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -588,19 +588,23 @@ int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
 		struct ras_common_if *head, bool enable)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
-	union ta_ras_cmd_input info;
+	union ta_ras_cmd_input *info;
 	int ret;
 
 	if (!con)
 		return -EINVAL;
 
+        info = kzalloc(sizeof(union ta_ras_cmd_input), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
 	if (!enable) {
-		info.disable_features = (struct ta_ras_disable_features_input) {
+		info->disable_features = (struct ta_ras_disable_features_input) {
 			.block_id =  amdgpu_ras_block_to_ta(head->block),
 			.error_type = amdgpu_ras_error_to_ta(head->type),
 		};
 	} else {
-		info.enable_features = (struct ta_ras_enable_features_input) {
+		info->enable_features = (struct ta_ras_enable_features_input) {
 			.block_id =  amdgpu_ras_block_to_ta(head->block),
 			.error_type = amdgpu_ras_error_to_ta(head->type),
 		};
@@ -609,26 +613,33 @@ int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
 	/* Do not enable if it is not allowed. */
 	WARN_ON(enable && !amdgpu_ras_is_feature_allowed(adev, head));
 	/* Are we alerady in that state we are going to set? */
-	if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head)))
-		return 0;
+	if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head))) {
+		ret = 0;
+		goto out;
+	}
 
 	if (!amdgpu_ras_intr_triggered()) {
-		ret = psp_ras_enable_features(&adev->psp, &info, enable);
+		ret = psp_ras_enable_features(&adev->psp, info, enable);
 		if (ret) {
 			amdgpu_ras_parse_status_code(adev,
 						     enable ? "enable":"disable",
 						     ras_block_str(head->block),
 						    (enum ta_ras_status)ret);
 			if (ret == TA_RAS_STATUS__RESET_NEEDED)
-				return -EAGAIN;
-			return -EINVAL;
+				ret = -EAGAIN;
+			else
+				ret = -EINVAL;
+
+			goto out;
 		}
 	}
 
 	/* setup the obj */
 	__amdgpu_ras_feature_enable(adev, head, enable);
-
-	return 0;
+	ret = 0;
+out:
+	kfree(info);
+	return ret;
 }
 
 /* Only used in device probe stage and called only once. */
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
