Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F183DBFE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 15:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DF010FAFE;
	Fri, 26 Jan 2024 14:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2144610FB19;
 Fri, 26 Jan 2024 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706279684; x=1737815684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m9PT2Y6MD4xV1VmnnGIAd5vfJa/7eZ8Onp2JUOf3Gts=;
 b=nMMN5vKwJHEEJqI9JbO9z35IYk6CdfvlhU/02rTn3fZwP7Muba6v9BAS
 Wji+iFlPqIDMlQRnf5lwqPD+Ka4rQJLITL8Ferhb2tmcwry/KYYazz4wL
 gONCfgTs9zKoOcWRGVJf23MnsihXIQNDSjlhN+pJvYb+hxs81o4x2DXG3
 bP9y1POAfykt6ZpZY5qoif8PuwKb5IYXHbd7OHBulLLtwUSS6+Z6oApHc
 JE8S8ygq1fFCCC2NvV7TOTUYczj/PL/e3ZgLUJ+oTfvL9tEFQl4dCxxfK
 kyqgAOllUuluuDhfahMfgjBTurA2agW+9USIlZo3Wx4E0ziLYO4yzBcos Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9139837"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9139837"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 06:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="906320961"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="906320961"
Received: from tgl-lenovo-03.sh.intel.com ([10.239.87.93])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jan 2024 06:34:36 -0800
From: wangxiaoming321 <xiaoming.wang@intel.com>
To: lucas.demarchi@intel.com, ogabbay@kernel.org,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/display: Fix memleak in display initialization
Date: Fri, 26 Jan 2024 22:34:33 +0800
Message-Id: <20240126143433.997078-1-xiaoming.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125063633.989944-1-xiaoming.wang@intel.com>
References: <20240125063633.989944-1-xiaoming.wang@intel.com>
MIME-Version: 1.0
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
Cc: wangxiaoming321 <xiaoming.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

intel_power_domains_init has been called twice in xe_device_probe:
xe_device_probe -> xe_display_init_nommio -> intel_power_domains_init(xe)
xe_device_probe -> xe_display_init_noirq -> intel_display_driver_probe_noirq
-> intel_power_domains_init(i915)

It needs add a flag to avoid power_domains->power_wells double malloc.

unreferenced object 0xffff88811150ee00 (size 512):
  comm "systemd-udevd", pid 506, jiffies 4294674198 (age 3605.560s)
  hex dump (first 32 bytes):
    10 b4 9d a0 ff ff ff ff ff ff ff ff ff ff ff ff  ................
    ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8134b901>] __kmem_cache_alloc_node+0x1c1/0x2b0
    [<ffffffff812c98b2>] __kmalloc+0x52/0x150
    [<ffffffffa08b0033>] __set_power_wells+0xc3/0x360 [xe]
    [<ffffffffa08562fc>] xe_display_init_nommio+0x4c/0x70 [xe]
    [<ffffffffa07f0d1c>] xe_device_probe+0x3c/0x5a0 [xe]
    [<ffffffffa082e48f>] xe_pci_probe+0x33f/0x5a0 [xe]
    [<ffffffff817f2187>] local_pci_probe+0x47/0xa0
    [<ffffffff817f3db3>] pci_device_probe+0xc3/0x1f0
    [<ffffffff8192f2a2>] really_probe+0x1a2/0x410
    [<ffffffff8192f598>] __driver_probe_device+0x78/0x160
    [<ffffffff8192f6ae>] driver_probe_device+0x1e/0x90
    [<ffffffff8192f92a>] __driver_attach+0xda/0x1d0
    [<ffffffff8192c95c>] bus_for_each_dev+0x7c/0xd0
    [<ffffffff8192e159>] bus_add_driver+0x119/0x220
    [<ffffffff81930d00>] driver_register+0x60/0x120
    [<ffffffffa05e50a0>] 0xffffffffa05e50a0

Signed-off-by: wangxiaoming321 <xiaoming.wang@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index bf9685acf75a..3b48a1cb7c54 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -36,6 +36,8 @@
 	for_each_power_well_reverse(__dev_priv, __power_well)		        \
 		for_each_if(test_bit((__domain), (__power_well)->domains.bits))
 
+static int intel_power_domains_init_flag = 0;
+
 const char *
 intel_display_power_domain_str(enum intel_display_power_domain domain)
 {
@@ -1016,6 +1018,11 @@ int intel_power_domains_init(struct drm_i915_private *dev_priv)
 {
 	struct i915_power_domains *power_domains = &dev_priv->display.power.domains;
 
+	if(intel_power_domains_init_flag == 1)
+		return 0;
+
+	intel_power_domains_init_flag++;
+
 	dev_priv->display.params.disable_power_well =
 		sanitize_disable_power_well_option(dev_priv,
 						   dev_priv->display.params.disable_power_well);
@@ -1041,6 +1048,7 @@ int intel_power_domains_init(struct drm_i915_private *dev_priv)
  */
 void intel_power_domains_cleanup(struct drm_i915_private *dev_priv)
 {
+	intel_power_domains_init_flag = 0;
 	intel_display_power_map_cleanup(&dev_priv->display.power.domains);
 }
 
-- 
2.25.1

