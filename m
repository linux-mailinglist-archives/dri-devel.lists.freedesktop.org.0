Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AFC326AC0
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 01:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A1A6E204;
	Sat, 27 Feb 2021 00:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2949F6E204
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 00:26:27 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id d2so7072498pjs.4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 16:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/UVGg/ISF601pQ44Q+AW/V2c0aA7uu1NXfRGhEzBS0=;
 b=keTd5zYbqA9gwk4Uaro+3JqZ9872UDO1JsC80/jsTJxIsyuig3TVI/q4lNsDYk5ftd
 S7N6YBXAhQY7hlWOxjTl0Iic+WFw/i+v7dcGsQzxxBJR8GHd/DbPSSg5Kq9uFsXdrs2/
 L+etcLD4oHplqJ3hp7Wo1d4Tepqr7omII7sT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R/UVGg/ISF601pQ44Q+AW/V2c0aA7uu1NXfRGhEzBS0=;
 b=g20BlIA6+G3CDZjhERpugJpVBUqT9oYFXF1reMD8meOOuP03D0g1wS+aqzmylkfYM+
 EYdz9qFOWBZrnG4EuRmARNMWiidOsHqm6E6YmgCFIEmc1bcXsuBZRz68cRy6wIt77lWM
 hZxF9OzZcVf42T67M/JspFJS4CXwGFLtbvaAe/lfIN8nHlZuQNNy6ffSfzyWG4O7SzK3
 baLN0U68dkjWCkVsWsEwsyVSzy1B1yhkqSI8VHKMUhKo7ici73tXSgKFufvqD2XuxUjT
 8A4U2JO8oIWF8ZY6fSg9c/wlgEVZFYGfeQ53obRFKjfgiMFbk4UejCllOMjbt8woHudA
 geww==
X-Gm-Message-State: AOAM530xHi+waBbZ2rj2lvJ/hdSjXcBPzb7LtmaV4zXaAK08a7M+n9y7
 RXIsTGzESF24CTYwQqO6IiPR2w==
X-Google-Smtp-Source: ABdhPJzIq2C5D14QoUWkzHAZD2YlxQuywims+rrfXXpNGQ/xXi+aZQWAi1bXsvy4+Ten03V0eUsjgA==
X-Received: by 2002:a17:90b:1c03:: with SMTP id
 oc3mr6085295pjb.124.1614385586622; 
 Fri, 26 Feb 2021 16:26:26 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:7525:b50:4b48:1a6d])
 by smtp.gmail.com with ESMTPSA id t6sm9793744pgp.57.2021.02.26.16.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 16:26:25 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH 1/3] drm/msm: Fix speed-bin support not to access outside
 valid memory
Date: Fri, 26 Feb 2021 16:26:01 -0800
Message-Id: <20210226162521.1.Ib5ae69a80704c3a2992100b9b5bac1a6cc470249@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210227002603.3260599-1-dianders@chromium.org>
References: <20210227002603.3260599-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Niklas Cassel <niklas.cassel@linaro.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When running the latest kernel on an sc7180 with KASAN I got this
splat:
  BUG: KASAN: slab-out-of-bounds in a6xx_gpu_init+0x618/0x644
  Read of size 4 at addr ffffff8088f36100 by task kworker/7:1/58
  CPU: 7 PID: 58 Comm: kworker/7:1 Not tainted 5.11.0+ #3
  Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
  Workqueue: events deferred_probe_work_func
  Call trace:
   dump_backtrace+0x0/0x3a8
   show_stack+0x24/0x30
   dump_stack+0x174/0x1e0
   print_address_description+0x70/0x2e4
   kasan_report+0x178/0x1bc
   __asan_report_load4_noabort+0x44/0x50
   a6xx_gpu_init+0x618/0x644
   adreno_bind+0x26c/0x438

This is because the speed bin is defined like this:
  gpu_speed_bin: gpu_speed_bin@1d2 {
    reg = <0x1d2 0x2>;
    bits = <5 8>;
  };

As you can see the "length" is 2 bytes. That means that the nvmem
subsystem allocates only 2 bytes. The GPU code, however, was casting
the pointer allocated by nvmem to a (u32 *) and dereferencing. That's
not so good.

Let's fix this to just use the nvmem_cell_read_u16() accessor function
which simplifies things and also gets rid of the splat.

Let's also put an explicit conversion from little endian in place just
to make things clear. The nvmem subsystem today is assuming little
endian and this makes it clear. Specifically, the way the above sc7180
cell is interpreted:

NVMEM:
 +--------+--------+--------+--------+--------+
 | ...... | 0x1d3  | 0x1d2  | ...... | 0x000  |
 +--------+--------+--------+--------+--------+
              ^       ^
             msb     lsb

You can see that the least significant data is at the lower address
which is little endian.

NOTE: someone who is truly paying attention might wonder about me
picking the "u16" version of this accessor instead of the "u8" (since
the value is 8 bits big) or the u32 version (just for fun). At the
moment you need to pick the accessor that exactly matches the length
the cell was specified as in the device tree. Hopefully future
patches to the nvmem subsystem will fix this.

Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++--------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ba8e9d3cf0fe..0e2024defd79 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1350,35 +1350,20 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 		u32 revn)
 {
 	struct opp_table *opp_table;
-	struct nvmem_cell *cell;
 	u32 supp_hw = UINT_MAX;
-	void *buf;
-
-	cell = nvmem_cell_get(dev, "speed_bin");
-	/*
-	 * -ENOENT means that the platform doesn't support speedbin which is
-	 * fine
-	 */
-	if (PTR_ERR(cell) == -ENOENT)
-		return 0;
-	else if (IS_ERR(cell)) {
-		DRM_DEV_ERROR(dev,
-				"failed to read speed-bin. Some OPPs may not be supported by hardware");
-		goto done;
-	}
+	u16 speedbin;
+	int ret;
 
-	buf = nvmem_cell_read(cell, NULL);
-	if (IS_ERR(buf)) {
-		nvmem_cell_put(cell);
+	ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
+	if (ret) {
 		DRM_DEV_ERROR(dev,
-				"failed to read speed-bin. Some OPPs may not be supported by hardware");
+			      "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
+			      ret);
 		goto done;
 	}
+	speedbin = le16_to_cpu(speedbin);
 
-	supp_hw = fuse_to_supp_hw(dev, revn, *((u32 *) buf));
-
-	kfree(buf);
-	nvmem_cell_put(cell);
+	supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
 
 done:
 	opp_table = dev_pm_opp_set_supported_hw(dev, &supp_hw, 1);
-- 
2.30.1.766.gb4fecdf3b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
