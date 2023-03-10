Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D036B5174
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 21:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E149F10E33C;
	Fri, 10 Mar 2023 20:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5875110E33C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 20:09:22 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PYHFY5Rd2zDqTL;
 Fri, 10 Mar 2023 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1678478962; bh=LiCKghL0zzLpMr0Rj7D+f8AvVpQsQr0GXpwVwfgf16s=;
 h=From:To:Cc:Subject:Date:From;
 b=f482EZ7tRTumZGQkwKg97ZUEOTYvm0bjLK8jaUbP13pNPZIie99txRoS0qbpsMvel
 n06f0zIP+paKXZXiajM+ZTf+lmRLpVP70N22QKgK7SS7Wt9NN0BBv5qwQihXmXDA2e
 S+Kmivpim3NO0bcIP1t6ifv+qVC3UHD9885TKVOU=
X-Riseup-User-ID: 97605DC7C339A705BD455B19376C52F61D769C3F753760BC8CD3A5A1F67CF8F0
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PYHFV680rz1yPW;
 Fri, 10 Mar 2023 20:09:18 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/format-helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()
Date: Fri, 10 Mar 2023 17:08:59 -0300
Message-Id: <20230310200901.216971-1-arthurgrillo@riseup.net>
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, tzimmermann@suse.de, jose.exposito89@gmail.com,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset aims to insert a unit test for the conversion from
XRGB8888 to monochromatic.

Previously this was a single patch, but as the changes grew from v1 to
v2, I thought it would be better to split it in two.

Thanks for reviewing!

Best regards,
~Arthur Grillo

---

v1->v2: https://lore.kernel.org/all/20230302200131.754154-1-arthurgrillo@riseup.net/
- Remove extra helper an use the existing one that Javier patched [1].
- Make the expected results more intuitive by using the BIT macro.
- Change the "destination_pitch" test case colors.

---

[1]: https://lore.kernel.org/all/20230307215039.346863-1-javierm@redhat.com/

---

Arthur Grillo (2):
  drm/format-helper: Add Kunit tests for drm_fb_xrgb8888_to_mono()
  drm/format-helper: Make "destination_pitch" test case usable for the
    monochrome case

 .../gpu/drm/tests/drm_format_helper_test.c    | 134 +++++++++++++-----
 1 file changed, 98 insertions(+), 36 deletions(-)

-- 
2.39.2

