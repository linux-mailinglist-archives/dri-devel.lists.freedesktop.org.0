Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CA97930E7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 23:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABD910E521;
	Tue,  5 Sep 2023 21:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEF710E521
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 21:27:41 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RgJWK0Fd4zDqXL;
 Tue,  5 Sep 2023 21:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693949261; bh=UbCNfpJ2iYv4OT+FGI/rAxnQ+FU3FTA5HjspoDIWjDE=;
 h=From:Subject:Date:To:Cc:From;
 b=N5yeO3gHUplK1D0jPsrK9uNx+PtclxcnsUG9wmqtiscyvS9EwZ7SHMyf5mjJ7mASR
 rp1Q8y1lplOOjG8F+cOQfu09kZsZCwtoT29wobsFb27nNqb8Ad8pPkhzFmyQMl8JNO
 7s6RvywRd7ER8/IP7x38Lv83d4mwZx9KUblnRUN4=
X-Riseup-User-ID: 6934392532D780A5519A9C895F9BC6107AB603C0A435710DDE58289EC8876F82
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RgJWC2Qf0zFpyg;
 Tue,  5 Sep 2023 21:27:34 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 0/2] Add KUnit tests for drm_fb_blit()
Date: Tue, 05 Sep 2023 18:27:08 -0300
Message-Id: <20230905-final-gsoc-v2-0-b52e8cb068ea@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACyd92QC/23MSw7CIBSF4a00dyyGV5V25D5MBwQv7U0MNFCJp
 mHvYscO/5Ocb4eMiTDD2O2QsFCmGFrIUwdusWFGRo/WILlUfOCCeQr2yeYcHVNDb43WWjnjoR3
 WhJ7eB3afWi+Ut5g+h13Eb/3LFMEEQyW4u15MPxh5S5TxtZ4DbjDVWr+0aALApQAAAA==
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, mairacanal@riseup.net,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset tests the drm_fb_blit() function.

As this function can be used with already tested formats, the first
patch adds calls to drm_fb_blit() on the tests of supported formats.

Some supported formats were not yet covered by the existing tests
because they are only supported by drm_fb_blit(). The second patch
adds those format conversion tests.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
Changes in v2:
- Split the patch into two (Maíra Canal)
- Link to v1: https://lore.kernel.org/r/20230901-final-gsoc-v1-1-e310c7685982@riseup.net

---
Arthur Grillo (2):
      drm/tests: Add calls to drm_fb_blit() on supported format conversion tests
      drm/tests: Add new format conversion tests to better cover drm_fb_blit()

 drivers/gpu/drm/tests/drm_format_helper_test.c | 284 +++++++++++++++++++++++++
 1 file changed, 284 insertions(+)
---
base-commit: f45acf7acf75921c0409d452f0165f51a19a74fd
change-id: 20230901-final-gsoc-395a84443c8f

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>

