Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A54311EC43
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671056EDC0;
	Fri, 13 Dec 2019 20:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2AC6EDBD;
 Fri, 13 Dec 2019 20:55:52 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N4hj5-1hgJJF1jsd-011keL; Fri, 13 Dec 2019 21:55:46 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 14/24] drm/etnaviv: avoid deprecated timespec
Date: Fri, 13 Dec 2019 21:53:42 +0100
Message-Id: <20191213205417.3871055-5-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191213204936.3643476-1-arnd@arndb.de>
References: <20191213204936.3643476-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:r92YBRaBXy3/JX2J+fT8urQ4Y2VslJu3D8eS/ONhWKD9Siyihuq
 Va1xbokFXv2qOaAwItkQRBTmAt9Mtv9Edg61oZmK2gLLe4KX1n5P3BZmg2rpZFDFi3+ll+X
 8j5V2WM4hCp4k+jAT8aMWyzVqXgbkVeN17h/AqalSR3FXTwajsbf+Cds6FDfOHGnAHFIwSo
 bTNgGAsMKAunGLjYutquQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2jP1BHDr7cA=:vhxlyfV4om5CS/jeHhc0C1
 KZYrfq+zNX3qsIiiNpKVotB/gyjO2fRJmDf1bkSp1e7gFhUswzYySChge0HKYGXphuF0JqHUZ
 MXcUI70hl0r4t9l7RyTsFld25zoDk6vl9vcFZjphw0ZJGcVy+Mv8C4/mj0xlLngI1gG85e5W/
 zco3XMTdG0CTLig9n13IUUepWTq7dQDWr+XBhqTh2Y6ZqntyjEWa29WaYG3xqdTXFau/emPmh
 nEz8BWyg+ZoMlAGA8FOFH/RC+CWV+BjKf8+jly10+21Kx1LEqV+9A+CLrNnMmKYQ64/VEtPOX
 HD5B32FXs/n0YdExhOJbjp4yoJnKAMvus01Id75Srjj3alYilPple+Wuh7/W5CB9JYch4lXYR
 v+H0K3ivkMCIOWlE5oN3+ZzGSlQ8jnDcMnKuDh+nRdqGBMWCdYIM1c6rn5EWX5KXVYziYPica
 tYETi5O2YDcibs3SorxG0jwUNbBoHIXPMW2iKLIMmUU2Vor2zZAeVep1IIUoDC6I+Zh8GJZXB
 Nfqtgnr489otQw4Y7JfqenPe9t++//acpA7wqYxft0+pd38H8UaVv7qZtQAsOypFfq5UP4qjF
 LGiFsFvnykYyLWignGLjwCvUduS+9LB1ebnPHsctoR0AaGbcqjMn+dAIiXSeS+DNVGJ9e4pbE
 irTcavMIn22tdZUNoBcoJYgqYeolhEJIO03xkv/+YSM5cPfb7/0EX3gDBME/47TAO2/xIYfbk
 q7dpVKOYA6iIBmI05qWN87g2hmTPggYb3Eb3/WLQqqGXjsGpI4byV6tXJpA1dnp+vOyqnoBJv
 5o+r6ZsX8EaknnewrlyKWfI8aH5GV0736kIY6M43oouzmbqvmdOdUdNP5JCpZ0zOrPBEJziU6
 AF1Y7WCqiGEXQicSrwXQ==
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
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct timespec is being removed from the kernel because it often leads
to code that is not y2038-safe.

In the etnaviv driver, monotonic timestamps are used, which do not suffer
from overflow, but the usage of timespec here gets in the way of removing
the interface completely.

Pass down the user-supplied 64-bit value here rather than converting
it to an intermediate timespec to avoid the conversion.

The conversion is transparent for all regular CLOCK_MONOTONIC values,
but is a small change in behavior for excessively large values: the
existing code would treat e.g. tv_sec=0x100000000 the same as tv_sec=0
and not block, while the new code it would block for up to 2^31
seconds. The new behavior is more logical here, but if it causes problems,
the truncation can be put back.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 11 +++--------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h | 11 ++++++-----
 drivers/gpu/drm/etnaviv/etnaviv_gem.c |  4 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gem.h |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  5 +++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  5 +++--
 6 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 95d72dc00280..3eb0f9223bea 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -282,11 +282,6 @@ static int etnaviv_ioctl_gem_new(struct drm_device *dev, void *data,
 			args->flags, &args->handle);
 }
 
-#define TS(t) ((struct timespec){ \
-	.tv_sec = (t).tv_sec, \
-	.tv_nsec = (t).tv_nsec \
-})
-
 static int etnaviv_ioctl_gem_cpu_prep(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -304,7 +299,7 @@ static int etnaviv_ioctl_gem_cpu_prep(struct drm_device *dev, void *data,
 	if (!obj)
 		return -ENOENT;
 
-	ret = etnaviv_gem_cpu_prep(obj, args->op, &TS(args->timeout));
+	ret = etnaviv_gem_cpu_prep(obj, args->op, &args->timeout);
 
 	drm_gem_object_put_unlocked(obj);
 
@@ -357,7 +352,7 @@ static int etnaviv_ioctl_wait_fence(struct drm_device *dev, void *data,
 {
 	struct drm_etnaviv_wait_fence *args = data;
 	struct etnaviv_drm_private *priv = dev->dev_private;
-	struct timespec *timeout = &TS(args->timeout);
+	struct drm_etnaviv_timespec *timeout = &args->timeout;
 	struct etnaviv_gpu *gpu;
 
 	if (args->flags & ~(ETNA_WAIT_NONBLOCK))
@@ -409,7 +404,7 @@ static int etnaviv_ioctl_gem_wait(struct drm_device *dev, void *data,
 {
 	struct etnaviv_drm_private *priv = dev->dev_private;
 	struct drm_etnaviv_gem_wait *args = data;
-	struct timespec *timeout = &TS(args->timeout);
+	struct drm_etnaviv_timespec *timeout = &args->timeout;
 	struct drm_gem_object *obj;
 	struct etnaviv_gpu *gpu;
 	int ret;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 32cfa5a48d42..efc656efeb0f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -61,7 +61,7 @@ int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
 void etnaviv_gem_prime_unpin(struct drm_gem_object *obj);
 void *etnaviv_gem_vmap(struct drm_gem_object *obj);
 int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
-		struct timespec *timeout);
+		struct drm_etnaviv_timespec *timeout);
 int etnaviv_gem_cpu_fini(struct drm_gem_object *obj);
 void etnaviv_gem_free_object(struct drm_gem_object *obj);
 int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
@@ -107,11 +107,12 @@ static inline size_t size_vstruct(size_t nelem, size_t elem_size, size_t base)
  * between the specified timeout and the current CLOCK_MONOTONIC time.
  */
 static inline unsigned long etnaviv_timeout_to_jiffies(
-	const struct timespec *timeout)
+	const struct drm_etnaviv_timespec *timeout)
 {
-	struct timespec64 ts, to;
-
-	to = timespec_to_timespec64(*timeout);
+	struct timespec64 ts, to = {
+		.tv_sec = timeout->tv_sec,
+		.tv_nsec = timeout->tv_nsec,
+	};
 
 	ktime_get_ts64(&ts);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index cb1faaac380a..6adea180d629 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -373,7 +373,7 @@ static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
 }
 
 int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
-		struct timespec *timeout)
+		struct drm_etnaviv_timespec *timeout)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct drm_device *dev = obj->dev;
@@ -431,7 +431,7 @@ int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
 }
 
 int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
-	struct timespec *timeout)
+	struct drm_etnaviv_timespec *timeout)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index d6270acce619..6b68fe16041b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -112,7 +112,7 @@ struct etnaviv_gem_submit {
 void etnaviv_submit_put(struct etnaviv_gem_submit * submit);
 
 int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
-	struct timespec *timeout);
+	struct drm_etnaviv_timespec *timeout);
 int etnaviv_gem_new_private(struct drm_device *dev, size_t size, u32 flags,
 	const struct etnaviv_gem_ops *ops, struct etnaviv_gem_object **res);
 void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index d47d1a8e0219..799ec20b267d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1132,7 +1132,7 @@ static void event_free(struct etnaviv_gpu *gpu, unsigned int event)
  * Cmdstream submission/retirement:
  */
 int etnaviv_gpu_wait_fence_interruptible(struct etnaviv_gpu *gpu,
-	u32 id, struct timespec *timeout)
+	u32 id, struct drm_etnaviv_timespec *timeout)
 {
 	struct dma_fence *fence;
 	int ret;
@@ -1179,7 +1179,8 @@ int etnaviv_gpu_wait_fence_interruptible(struct etnaviv_gpu *gpu,
  * that lock in this function while waiting.
  */
 int etnaviv_gpu_wait_obj_inactive(struct etnaviv_gpu *gpu,
-	struct etnaviv_gem_object *etnaviv_obj, struct timespec *timeout)
+	struct etnaviv_gem_object *etnaviv_obj,
+	struct drm_etnaviv_timespec *timeout)
 {
 	unsigned long remaining;
 	long ret;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 8f9bd4edc96a..97bb48042b4d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -169,9 +169,10 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m);
 void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu);
 void etnaviv_gpu_retire(struct etnaviv_gpu *gpu);
 int etnaviv_gpu_wait_fence_interruptible(struct etnaviv_gpu *gpu,
-	u32 fence, struct timespec *timeout);
+	u32 fence, struct drm_etnaviv_timespec *timeout);
 int etnaviv_gpu_wait_obj_inactive(struct etnaviv_gpu *gpu,
-	struct etnaviv_gem_object *etnaviv_obj, struct timespec *timeout);
+	struct etnaviv_gem_object *etnaviv_obj,
+	struct drm_etnaviv_timespec *timeout);
 struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit);
 int etnaviv_gpu_pm_get_sync(struct etnaviv_gpu *gpu);
 void etnaviv_gpu_pm_put(struct etnaviv_gpu *gpu);
-- 
2.20.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
