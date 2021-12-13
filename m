Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC484732AB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 18:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD0A10E7CC;
	Mon, 13 Dec 2021 17:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF53310E7CC;
 Mon, 13 Dec 2021 17:08:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8463AB8119C;
 Mon, 13 Dec 2021 17:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362DDC34600;
 Mon, 13 Dec 2021 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639415278;
 bh=neBt5nn9ZDsOLz1R6GX+iLe1RoxSI+6JFmIJJuJGOM0=;
 h=From:To:Cc:Subject:Date:From;
 b=EpaYBxB6RTzEkof55lhj5kJznoCYa8wkYWYDQzAnf74eSSV171ueJdKSnEQ0y0zDC
 GV24qU2mqxkcRUi3LIudjYfWwgqrbSBNepy3FeloNhbslzbZOQyvED92wJvpVVcWv4
 +WRxJD+Yr34poOyV5bKbZ6OwqobExRzeR+NJbvG3wGeqqIENvPZ5DS0ZTEZBtho6FV
 qY+KFlkMiJB8q6Us7ImGI6kfSexlD7VrQ70Qv0bSQL/1tMqFdOaztPF/lg5dxUoBv9
 ZRKYBdr8RIM9EUNeGoU0FALmnEPXqcLuzSmb/igp1AdkS+XqjssMoBkohrM7lnLvbj
 /PJJedJuN2mnA==
From: broonie@kernel.org
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915: Fix implicit use of struct pci_dev
Date: Mon, 13 Dec 2021 17:07:53 +0000
Message-Id: <20211213170753.3680209-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485; h=from:subject;
 bh=B59CtkeqUpZIIn0KhhMhY3pnZ+yxmQeyEKr7IZrsk8w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBht3y2JtsKLj2V+9iMEpWfnUWMcbwBrIfWSzUmUbsa
 bEL5Wo6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYbd8tgAKCRAk1otyXVSH0IY1B/
 sHYIhA3nx44JRUiss3UuH4hNzVKaeDEzZemZ59oD0ZPum4dkUSYe04dctBsWpFm09LxVO6EogTUx+k
 Mz2JeTzKayWBOs0DCeopFFBs9UzbGcuBp2Zb99NHKWzkvvGYf5z6lDonbrmHv38xRzPLZZmkOXt9OF
 bQ0vAZNSWW9vnhsMvQdPqTnAYPjeh6420NmMG6lM8MPwgOBYn4mW+UQCgeCz1W/fv0A6kfusmW22MH
 dOwaN/2v0/P6LDyoIAjuLzKPPdONk1d92ZUw9vnTmn1QoP5C+vBI3noPy60dINLO7tcx6nM0Rs1Hxv
 tdVG5Dx5QgKWfT6V4lhocXG5egOMyf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: intel-gfx@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Brown <broonie@kernel.org>

intel_device_info.h references struct pci_dev but does not ensure that
the struct has been declared, causing build failures if something in
other headers changes so that the implicit dependency it is relying on
is no longer satisfied:

In file included from /tmp/next/build/drivers/gpu/drm/i915/intel_device_info.h:32,
                 from /tmp/next/build/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:11,
                 from /tmp/next/build/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:11:
/tmp/next/build/drivers/gpu/drm/i915/display/intel_display.h:643:39: error: 'struct pci_dev' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
  643 | bool intel_modeset_probe_defer(struct pci_dev *pdev);
      |                                       ^~~~~~~
cc1: all warnings being treated as errors

Add a declaration of the struct to fix this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/i915/display/intel_display.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 4b688a9727b39..377790393a855 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -57,6 +57,7 @@ struct intel_plane;
 struct intel_plane_state;
 struct intel_remapped_info;
 struct intel_rotation_info;
+struct pci_dev;
 
 enum i915_gpio {
 	GPIOA,
-- 
2.30.2

