Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D007DD3B48A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 18:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E65110E4E0;
	Mon, 19 Jan 2026 17:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M/kSTDKp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A2910E4DF;
 Mon, 19 Jan 2026 17:37:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EF4AF41AB5;
 Mon, 19 Jan 2026 17:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C9DC116C6;
 Mon, 19 Jan 2026 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768844272;
 bh=dlkRPImrZHLGkEr79eYuSv8PXMFAfKCUT+ghYXPvzSI=;
 h=Date:From:To:Cc:Subject:From;
 b=M/kSTDKp3ampYq2PhKsTb/fb6IKO3dW97o6YslD//iwkrR/e3BNyPHNezN+HJDeyo
 cmgkvXpCfHFEO+JUlUGDFAdl5YgowSqHDNpenTcLMkiFMAgoNeQvrs38oNbZQ2636u
 6DZ7G3gC704N54qYlGvJu4G2lnilMEp7q1eLspa5VOxqS9Zs0t6gxGLjMnpy0rzl6c
 pOXKhQnLpsm4QVG5Q9SZYh869Fr7C6NELxRbyNRFk1PVn9dTA81teDj7hymKoLirQT
 ZGI+q6yzB6tbZThBL4VrKRmBu16qz9aUaXe97K02WC3f+0CL0Fph0ftPS2ulWmioi8
 0Brm+7U2NsgBA==
Date: Mon, 19 Jan 2026 17:37:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <aW5r7NzicgqvpaUj@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c: In function 'drm_test_check_reject_hdr_infoframe_bpc_10':
/tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2926:49: error: passing argument 6 of 'drm_property_replace_blob_from_id' makes integer from pointer without a cast [-Wint-conversion]
 2926 |                                                 &replaced);
      |                                                 ^~~~~~~~~
      |                                                 |
      |                                                 bool * {aka _Bool *}
In file included from /tmp/next/build/include/drm/drm_connector.h:33,
                 from /tmp/next/build/include/drm/drm_modes.h:33,
                 from /tmp/next/build/include/drm/drm_crtc.h:32,
                 from /tmp/next/build/include/drm/drm_atomic.h:31,
                 from /tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:7:
/tmp/next/build/include/drm/drm_property.h:287:47: note: expected 'ssize_t' {aka 'long int'} but argument is of type 'bool *' {aka '_Bool *'}
  287 |                                       ssize_t max_size,
      |                                       ~~~~~~~~^~~~~~~~
/tmp/next/build/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:2922:15: error: too few arguments to function 'drm_property_replace_blob_from_id'
 2922 |         ret = drm_property_replace_blob_from_id(drm,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/drm/drm_property.h:282:5: note: declared here
  282 | int drm_property_replace_blob_from_id(struct drm_device *dev,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

   7436a87db99d5 (drm/tests: hdmi: check the infoframes behaviour)

interacting with

   ca59e33f5a1f6 (drm/atomic: add max_size check to drm_property_replace_blob_from_id())

I have applied a fixup:

From 7e99cf59cfdd75f6815ab3eb0b0d8140878bcd6f Mon Sep 17 00:00:00 2001
From: Mark Brown <broonie@kernel.org>
Date: Mon, 19 Jan 2026 17:27:36 +0000
Subject: [PATCH] drm: Fix up incompatible API change

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index d95786faf1817..dc1bda386387d 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -2921,7 +2921,7 @@ static void drm_test_check_reject_hdr_infoframe_bpc_10(struct kunit *test)
 
 	ret = drm_property_replace_blob_from_id(drm,
 						&new_conn_state->hdr_output_metadata,
-						hdr_blob->base.id,
+						hdr_blob->base.id, -1,
 						sizeof(struct hdr_output_metadata), -1,
 						&replaced);
 	KUNIT_ASSERT_EQ(test, ret, 0);
-- 
2.47.3
