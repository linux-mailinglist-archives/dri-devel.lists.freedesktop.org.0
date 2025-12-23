Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA7CCD922A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 12:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC9F10E204;
	Tue, 23 Dec 2025 11:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="TMqBj+bV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 465 seconds by postgrey-1.36 at gabe;
 Tue, 23 Dec 2025 11:40:03 UTC
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4B310E1FF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 11:40:02 +0000 (UTC)
Received: from aerhardt-tuxedo.fritz.box (p57b9501c.dip0.t-ipconnect.de
 [87.185.80.28]) (Authenticated sender: a.erhardt@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id BD23F2FC021C;
 Tue, 23 Dec 2025 12:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1766489536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZihsY0WFIsRpcU6kcB+37Rqu87odHLfFZrPhoZyqV4I=;
 b=TMqBj+bVL/NreD/P24WGR0uqLJjVy7fGqjUXY9he0Mn37hAhH2sLuuxhkefGEuYKT7fcbr
 ChvjkgujW+OJuVEv8C6VxN19zV4T92t+BqsWIGBZCGVcuwz+mv0CRUPQwnJRVEYKh511R9
 oF1TzZ1DbW/QrOQFGT/SPOO8F80+W10=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=a.erhardt@tuxedocomputers.com
 smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] drm: ensure that vblank diff is never negative
Date: Tue, 23 Dec 2025 12:22:45 +0100
Message-ID: <20251223112246.3026909-1-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I observed a rare freeze on a device and was able to track the cause down
to incorrect reporting of timestamps in the vblank code. The
drm_vlank_restore code expects that one timestamp is always larger than the
other, but not all drivers fulfill this assumption. This allows the
difference between the two timestamps to become negative. Most of the time,
this is not fatal, because the value is rounded after dividing through the
frame duration. Therefore, small negative values are converted into zeros.
However, if the value is sufficiently negative, the calculation might end
up reporting that -1 frames were missed. The negative result is stored in
an unsigned integer, causing a wrap-around.

So far, this behavior has been observed on some newer Intel devices (e.g.
using the Intel Core Ultra 7 155H) with the i915 driver and the patch has
been tested successfully as a fix. While the root cause is in the driver, I
think that handling this case with drm_WARN_ON_ONCE is a good idea. Without
the warning, driver issues can remain unnoticed for a long time because
they only cause problems under very specific (seemingly random)
cirucumstances.

Normal (expected) log example:
i915 0000:00:02.0: [drm:drm_vblank_restore] missed 1 vblanks in 4165983 ns, frame duration=4166666 ns, hw_diff=1

Abnormal (but non-fatal) log example:
i915 0000:00:02.0: [drm:drm_vblank_restore] missed 0 vblanks in -1135 ns, frame duration=4166666 ns, hw_diff=0

Abnormal and fatal log example:
i915 0000:00:02.0: [drm:drm_vblank_restore] missed -891996132 vblanks in -4118209 ns, frame duration=4166666 ns, hw_diff=0

Aaron Erhardt (1):
  drm: ensure that vblank diff is never negative

 drivers/gpu/drm/drm_vblank.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.0

