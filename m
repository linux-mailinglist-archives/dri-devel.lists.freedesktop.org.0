Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76512716CA2
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 20:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EAE10E402;
	Tue, 30 May 2023 18:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC7610E3ED;
 Tue, 30 May 2023 18:38:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEDFC61AC8;
 Tue, 30 May 2023 18:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9ABC433D2;
 Tue, 30 May 2023 18:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685471894;
 bh=R428jiSZDAX6DHR8ts6m0vqcXTKepKpchm6a+qPH+OY=;
 h=From:Date:Subject:To:Cc:From;
 b=KQgZuTkKWqoSq+oilWFqPQsNCxBJxAeihlJDeYTAtEuDHMYOdqDQkmJl3amI46C9J
 pWXOYdIUCMk4m6qoUhhZEjRU6HIjP47Y+4GeblN8FdPkd9i/tYxsf8uarNY7Br5an8
 8ulaJkIr3VDPDWD/aVFQWG+TgOO6V13itO+pU5GzcRUh9+M3J22MpmxGq5/Dn0HbHa
 BQDMpzKrw4VuIzR5wFUYXEV5Feqdn4SitYR4vi7TUKrTZrxj/S7Dps64R1BIKDcKNs
 jHMillahFPpCsHjuM09bT59iqQaS7G4zSK6FAh5YAPO0ugAOpNdvcSSnjadwAzFSPP
 fJ2IO7bGwfC1A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 30 May 2023 11:37:56 -0700
Subject: [PATCH] drm/i915/pxp: Fix size_t format specifier in
 gsccs_send_message()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230530-i915-pxp-size_t-wformat-v1-1-9631081e2e5b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAINCdmQC/x2OywqDMBAAf6Xk3KVqKn38SimSx0YXNIZkq7biv
 zd6nMMMs4qEkTCJ52kVESdKNPoM5fkkTKd8i0A2s6iKSha1LIAeZQ1hCZDohw3D7MY4KIbS3iT
 a0t1tJUW2tUoIOipvut3X18thtgxGmQ6bHifsYSZvxiEoJt0juI83nAcgjOQZI/A3YILEkQzv0
 RDR0XLsvt7b9gdOnW01vgAAAA==
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3570; i=nathan@kernel.org;
 h=from:subject:message-id; bh=R428jiSZDAX6DHR8ts6m0vqcXTKepKpchm6a+qPH+OY=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCllTlOb4sWfnmhTt26wrGvfxtNbGXHq7tye9b0L+nZsZ
 cplXbaxo5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExEn42R4U+tj+aCk76qZczz
 o+ZFdz78xK4z9eFc1SibGae3OTvEejP8r7z2e9pVc2+97RWC3x7nrzju/v3bLv05BpIBi2+xM0z
 xZAIA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: alan.previn.teres.alexis@intel.com, radhakrishna.sripada@intel.com,
 intel-gfx@lists.freedesktop.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When building ARCH=i386 allmodconfig, the following warning occurs:

  In file included from include/linux/device.h:15,
                   from include/linux/node.h:18,
                   from include/linux/cpu.h:17,
                   from include/linux/static_call.h:135,
                   from arch/x86/include/asm/perf_event.h:5,
                   from include/linux/perf_event.h:25,
                   from drivers/gpu/drm/i915/i915_pmu.h:11,
                   from drivers/gpu/drm/i915/gt/intel_engine_types.h:21,
                   from drivers/gpu/drm/i915/gt/intel_context_types.h:18,
                   from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:20,
                   from drivers/gpu/drm/i915/i915_request.h:34,
                   from drivers/gpu/drm/i915/i915_active.h:13,
                   from drivers/gpu/drm/i915/gt/intel_context.h:13,
                   from drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:8:
  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c: In function 'gsccs_send_message':
  include/drm/drm_print.h:456:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
    456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
        |                                       ^~~~~~~~
  include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
    110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
        |                              ^~~
  include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
    146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
        |                                                             ^~~~~~~
  include/drm/drm_print.h:456:9: note: in expansion of macro 'dev_warn'
    456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
        |         ^~~~
  include/drm/drm_print.h:466:9: note: in expansion of macro '__drm_printk'
    466 |         __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
        |         ^~~~~~~~~~~~
  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:146:17: note: in expansion of macro 'drm_warn'
    146 |                 drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%ld)\n",
        |                 ^~~~~~~~
  cc1: all warnings being treated as errors

Use the '%zu' format specifier, as the variable is a 'size_t'.

Fixes: dc9ac125d81f ("drm/i915/pxp: Add GSC-CS backend to send GSC fw messages")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
index 8dc41de3f6f7..a217821eb0fb 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -143,7 +143,7 @@ gsccs_send_message(struct intel_pxp *pxp,
 
 	reply_size = header->message_size - sizeof(*header);
 	if (reply_size > msg_out_size_max) {
-		drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%ld)\n",
+		drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%zu)\n",
 			 reply_size, msg_out_size_max);
 		reply_size = msg_out_size_max;
 	}

---
base-commit: 08264f85c5c05ecc38d409c84d48cfb00ccd3bc4
change-id: 20230530-i915-pxp-size_t-wformat-1d73ed1f8d23

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

