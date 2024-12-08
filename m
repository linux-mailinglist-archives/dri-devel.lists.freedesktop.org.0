Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407049E8625
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 17:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524C710E081;
	Sun,  8 Dec 2024 16:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=freebsd.org header.i=@freebsd.org header.b="dUkrMKjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D5F10E0E9;
 Sun,  8 Dec 2024 15:17:34 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R11" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4Y5pWx1hRLz3w0H;
 Sun,  8 Dec 2024 15:17:33 +0000 (UTC)
 (envelope-from emaste@freebsd.org)
Received: from freefall.freebsd.org (freefall.freebsd.org
 [IPv6:2610:1c1:1:6074::16:84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "freefall.freebsd.org", Issuer "R10" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Y5pWx0n9Yz512y;
 Sun,  8 Dec 2024 15:17:33 +0000 (UTC)
 (envelope-from emaste@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1733671053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=unAloAcfwZIXIT5TaezstF1w+cHR7mmPIT2gdUO+cTM=;
 b=dUkrMKjoBCZe/l0cPy0pBj7pYzZK0YqTn/l5BmZsjpM1acs1W12VdHcXfTewuhZTuR7S0H
 xSEQwNUdBmj7RPkKPpMXqCERvzi8K9rEKr+neo5j1ujfVoXManWom+RsNS7AXbt5ArztQI
 x2XmLoYubQugUZ0ywuB5H9yBiOdGZ7h/7cTIy+DTQZX1MX7QMwE7L0Y1eckUU6rIEj5EKB
 6exDIYn3Evsh3bP0ZrQjU68Zne12qPmQXISfb91tyunegd2TOsQO81opTeOKZTFCvPGNOR
 loOF2ifjjFw7lYo9Qb5zZe3MMVzeriMwJ8xI2jW3txSH+ktzZCYUhqRI5KNJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1733671053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=unAloAcfwZIXIT5TaezstF1w+cHR7mmPIT2gdUO+cTM=;
 b=BkcQ116nd0ydqy1NNVCS/VGZg3+0ktxApgYjJiekplGSJ1oOWewBqE3sbhSHEY8PDQuFIQ
 rKjH6lB5ii0z1N7fDkQtaflgdDM13Z+KaSHSJW5x0rymi7/JClA7gSstI5kcOXNzR1kvUU
 r8SGSuoFieiukFO2ben6Sxt6kR4ZWrTx137b1wSpj13su91lgcBHSbIrDc4JAcARGaD6ub
 lRg0ViJ5NRW++yEC1gg2axhgP4mM223L5/HeowBeSwAL1Zd+X+ckuSu1Gn35ALQNyukHoV
 0QsMxUDXU4a3kCU9ZxIcLsFjUKINRDT0gx8K65F2LZE6CzAU2vnMmda0K4oZJw==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1733671053; a=rsa-sha256; cv=none;
 b=PGgtr66aEpuu7zX0/Dfoa1H3aaJhjosKgkvfVfrX7v39+jj5BWSlhmHDiGEmueRPIOJogj
 9SKP8dea0xIJ7jq8QkUrsCetSFjbWtw7/pQGy6QND983xaV0esE06BTYbeZbaHpCN0jYmx
 6pmBMMHFR8BuOv/ZIRVT0/6HxY73ikEO8hNG2S/E9Hb2YPgEyRJ00wQ2ftL27+ZAHXezLA
 mXx81edPk3HQpj97W1kQ7mlJnAKJW5m0K1fOCkETRlHaMH6ZrkmP3jg6NtUhPPTB1rpxPt
 JEr4kRC0nKRARvUQnNbSr8cXQ+chJu+xLXF51yT9mtczAyvucHG1ANS/rPf6vw==
Received: by freefall.freebsd.org (Postfix, from userid 1079)
 id 07B296372; Sun, 08 Dec 2024 15:17:33 +0000 (UTC)
From: Ed Maste <emaste@FreeBSD.org>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ed Maste <emaste@FreeBSD.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Update license on selftest lists to MIT
Date: Sun,  8 Dec 2024 15:17:27 +0000
Message-ID: <20241208151727.71695-1-emaste@FreeBSD.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Dec 2024 16:07:50 +0000
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

These two files (i915_live_selftests.h, i915_mock_selftests.h) were
introduced in commit 953c7f82eb89 ("drm/i915: Provide a hook for
selftests") and are effectively just a list of selftests.

The selftest implementation itself is largely in i915_selftest.c, and
uses a MIT license.  Graphics drivers are shared with other operating
systems and have long used a permissive license (or dual license) to
facilitate this.

The two selftest list files carried no license when introduced in
953c7f82eb89, presumably as they were considered trivial.  Notably the
general selftest header i915_selftest.h (which does have non-trivial
content) also has an MIT license.

The GPL-2.0 SPDX tag in these two files came from b24413180f56, where
Greg Kroah-Hartman added the tag to all files that had no license.  This
makes sense in general, but it is clear from the context of the original
selftest commit here that these files are a trivial part of an otherwise
MIT-licensed patch to a MIT-licensed component, and should have an MIT
license.

Signed-off-by: Ed Maste <emaste@FreeBSD.org>
---
 drivers/gpu/drm/i915/selftests/i915_live_selftests.h | 2 +-
 drivers/gpu/drm/i915/selftests/i915_mock_selftests.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
index 5aee6c9a8295..264b951c4f77 100644
--- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 
 #ifndef selftest
 #define selftest(x, y)
diff --git a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
index 0c22e0fc9059..18935e311748 100644
--- a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 
 #ifndef selftest
 #define selftest(x, y)
-- 
2.46.2

