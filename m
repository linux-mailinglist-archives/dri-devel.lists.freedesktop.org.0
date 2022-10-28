Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA2611CB9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 23:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B513C10E8E6;
	Fri, 28 Oct 2022 21:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABFF10E8E6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 21:53:26 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so5662379pjd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 14:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uwCxQi/lzbG99sopXdaVgVE2DsVCsrVGzk6dQZZnkc8=;
 b=I2wDE32iuPDJS6Ln4R3C7D+1bXa0yvl0RCT+wy/Vt0bL7g0cgQTolmDJ1THfnJ8khZ
 jDEdnMGi8XvZMvYAHMAkQxMDjybr0ID5erEsw7n6tALBv/ktbg7bhZ4rLNKN82hdrShW
 J9ifmwTQrN86Sp5PxD+oOtzKrNwbXuElrxYMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uwCxQi/lzbG99sopXdaVgVE2DsVCsrVGzk6dQZZnkc8=;
 b=JApveCdT9xYnoH3WZWoNO6JnwANw1QDmqay7dvuTV0l6mmsibKEFYFCj1ft67Hyvep
 oJhfQxki8CIWHGxhzMx0NgM2Gk/UnERceRJx1bljxfB2l2JL82w8mbmbEKpuyfsTg7iw
 /NYOzrDX+NY+TC6SDsuZnrDQRYeNSl06G2T81vei2bO5dQzTA9HuxbpTTfTuiK0/BIST
 1by3yxVW4YqM34t8L1V3LxVtMoXS1jfotaEc60SP6/aqi0LO5V4sWVmdXnoEWSerIrLu
 YHgytgjQAltlArKx2H1nOUyyBY9AWFOM8SRb6EzEW1fRJoK5k7EIuMaMwQsx9Y6eq+Mf
 hQsw==
X-Gm-Message-State: ACrzQf1K6CwRvBXdGhcoN7FkMx3llliUaODZg/s+Ydap4yzcIT4CWl7A
 9/oLyNimdZJi7TU81BDOBNtaRQ==
X-Google-Smtp-Source: AMsMyM7Z7henHLAjyucT+QXQnehtd5Zyu7DPcyrdvjnKBnTvpxyYd8nxtXTnemCxJqDLmGYfSMu6QA==
X-Received: by 2002:a17:90b:3e81:b0:20d:bbe5:f332 with SMTP id
 rj1-20020a17090b3e8100b0020dbbe5f332mr19029604pjb.112.1666994006140; 
 Fri, 28 Oct 2022 14:53:26 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:65f9:c180:249c:190f])
 by smtp.gmail.com with UTF8SMTPSA id
 a4-20020a621a04000000b00545f5046372sm3251964pfa.208.2022.10.28.14.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 14:53:25 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH] drm/i915: Set PROBE_PREFER_ASYNCHRONOUS
Date: Fri, 28 Oct 2022 14:53:22 -0700
Message-Id: <20221028145319.1.I87b119c576d486ad139faf1b7278d97e158aabe4@changeid>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Feng Tang <feng.tang@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver often takes a good 100ms to start, but in some particularly
bad cases takes more than 1 second.

In surveying risk for this driver, I poked around for cross-device
shared state, which can be a source of race conditions. GVT support
(intel_gvt_devices) seems potentially suspect, but it has an appropriate
mutex, and doesn't seem to care about ordering -- if devices are present
when the kvmgt module loads, they'll get picked up; and if they probe
later than kvmgt, they'll attach then.

Additionally, I see past discussions about this patch [1], which
concluded that there were problems at the time due to the way
hdac_i915.c called request_module("i915") and expected it to complete
probing [2]. Work has since been merged [3] to fix that problem.

This driver was pinpointed as part of a survey of drivers that take more
than 100ms in their initcall (i.e., are built in, and probing
synchronously) on a lab of ChromeOS systems.

[1] [RFC] i915: make the probe asynchronous
    https://lore.kernel.org/all/20180604053219.2040-1-feng.tang@intel.com/

[2] https://lore.kernel.org/all/s5hin4d1e3f.wl-tiwai@suse.de/

[3] Commit f9b54e1961c7 ("ALSA: hda/i915: Allow delayed i915 audio
    component binding")

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/i915/i915_pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 38460a0bd7cb..1cb1f87aea86 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1371,7 +1371,10 @@ static struct pci_driver i915_pci_driver = {
 	.probe = i915_pci_probe,
 	.remove = i915_pci_remove,
 	.shutdown = i915_pci_shutdown,
-	.driver.pm = &i915_pm_ops,
+	.driver = {
+		.pm = &i915_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
 };
 
 int i915_pci_register_driver(void)
-- 
2.38.1.273.g43a17bfeac-goog

