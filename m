Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A6E11EC3B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059ED6EDBE;
	Fri, 13 Dec 2019 20:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBD46EDBE;
 Fri, 13 Dec 2019 20:55:22 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MmUcL-1hxQSf3K9x-00iQa3; Fri, 13 Dec 2019 21:55:12 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 13/24] drm/etnaviv: reject timeouts with tv_nsec >=
 NSEC_PER_SEC
Date: Fri, 13 Dec 2019 21:53:41 +0100
Message-Id: <20191213205417.3871055-4-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191213204936.3643476-1-arnd@arndb.de>
References: <20191213204936.3643476-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:FtcvkRP+PxTuM1kB/nONVs3z2xlMBVJVd9+R6nDY92C5vgjuYmC
 BxkfZJviB6exJbAT+s5FqrACns+dIYWedVsSQH9vpfEn6Tdd3xkx2Y1Dw0iBSRfN40+Tuuc
 uCsxnZ0cpiOB0iZh0DN/b4KGJdHFOJmdi7tw3SQx+zCAHahyUH4Ov0bSe+pLy/Omb0Ac78/
 hez/uq0rgQ0VgO+oUQn8w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gIg+rV75Vvo=:zI2EcLL6lmBx+OCsRoc1e5
 MmRS3WIMSHuTTcT9/PtTyry4RW+qEysUDyVEHsrs2M5oFZ/EaugmFtOcQNiuKbd2vNn9mOuX5
 n66LaOonAY1Ugd9fiHDV+v3QRa8uomPJ/xMzvrgTLY1Yhu4mD6BsKl2Vk1XJU53FrdMSrMX4z
 v7MssgxRY3yPDFHuFrIoxlHbhp+QYcxM+W2+++e/pPomSxrw4kwHMYxPvu9XwF0Z0sKr69c9k
 v7K2j56CXz3idaZ4scBjDNfsLks09PJgPW4dujia7Jz2qD+897HyjWVlzhg62wRluIn3X/yEw
 hywPROlcXgvvsI/YyHbRnVkXdqe4dqNSE0jjlhc5fsPQximRVQcVf0XZzKlFf8/r+PKG75bui
 J0LkVvImNrvWe46lP/5rQLED7zS77at9LWQ3Swxve0GUItDjpRi0X4mfFibml8XZ1jc0fluI6
 mVHpS3+LgV8a+YGPXvxZ4hNuu9zzfQAllcbzYaV3YamYlv4eWngiu74j1NHN/Wf7Y4Bgo9SYz
 nk8PpHC2bMFzV3peDQH8SkQIpNyMwpeaqSYGL2RIx03mPdpt5bojTh/qXSXeIyi/MmmslB7+0
 10f2MhJCHTbbshfGeiCuJoQenbOalmyCYrg2MovmyJQM52JZVO4aa2MgNxtJCUv124QKgVYXq
 itKQFWfHUILXo26guQ1rJUObv0JMM0yHAeYiiHNLWwsbYoxPdhNisSMLY2RPQiPie14SP/Ds0
 8U4Kw2jmMyf7SpeTO7hziC7Ve7s9pAlz3ncZIie/erUHgtvxX4kk/VzK1nL9qmZIwxPg+4pCq
 EaAy0IIuHERsu9ppg0MTvc6V/iA6/sqcvJNxH/rXkzSmIUVVEoCyRTKxBzB6vbX+GdBxHSr+B
 EVFmgnFtc9yvY4/XQHiQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most kernel interfaces that take a timespec require normalized
representation with tv_nsec between 0 and NSEC_PER_SEC.

Passing values larger than 0x100000000ull further behaves differently
on 32-bit and 64-bit kernels, and can cause the latter to spend a long
time counting seconds in timespec64_sub()/set_normalized_timespec64().

Reject those large values at the user interface to enforce sane and
portable behavior.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 1f9c01be40d7..95d72dc00280 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -297,6 +297,9 @@ static int etnaviv_ioctl_gem_cpu_prep(struct drm_device *dev, void *data,
 	if (args->op & ~(ETNA_PREP_READ | ETNA_PREP_WRITE | ETNA_PREP_NOSYNC))
 		return -EINVAL;
 
+	if (args->timeout.tv_nsec > NSEC_PER_SEC)
+		return -EINVAL;
+
 	obj = drm_gem_object_lookup(file, args->handle);
 	if (!obj)
 		return -ENOENT;
@@ -360,6 +363,9 @@ static int etnaviv_ioctl_wait_fence(struct drm_device *dev, void *data,
 	if (args->flags & ~(ETNA_WAIT_NONBLOCK))
 		return -EINVAL;
 
+	if (args->timeout.tv_nsec > NSEC_PER_SEC)
+		return -EINVAL;
+
 	if (args->pipe >= ETNA_MAX_PIPES)
 		return -EINVAL;
 
@@ -411,6 +417,9 @@ static int etnaviv_ioctl_gem_wait(struct drm_device *dev, void *data,
 	if (args->flags & ~(ETNA_WAIT_NONBLOCK))
 		return -EINVAL;
 
+	if (args->timeout.tv_nsec > NSEC_PER_SEC)
+		return -EINVAL;
+
 	if (args->pipe >= ETNA_MAX_PIPES)
 		return -EINVAL;
 
-- 
2.20.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
