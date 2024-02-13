Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE5852AB4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 09:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFF310E14A;
	Tue, 13 Feb 2024 08:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HLthi65g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512AA10E14A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 08:17:14 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-128.elisa-laajakaista.fi [91.154.35.128])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85995D49;
 Tue, 13 Feb 2024 09:17:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707812223;
 bh=ks4fukdqMyGr+GEJndFKiSXNpWWX9ybSOnrpYXFOU+8=;
 h=From:Subject:Date:To:Cc:From;
 b=HLthi65gqWy/28VHJhje68hii13RB0OOcUZ8FVQHYysiUsqUWTnk/C1P0LDp2G+j+
 9SHogsvACyLtwUfCdOC+7daRKJUhrWIh+DNMz/oYqdfUItTlyItoxn4NlSaJeH3UXG
 OMvpAgTtCqCq/1lZRG5FdYS84PrUAqyAmNhhJWUQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/2] drm/tidss: Fixes for zpos and multi-display
Date: Tue, 13 Feb 2024 10:16:35 +0200
Message-Id: <20240213-tidss-fixes-v1-0-d709e8dfa505@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGMly2UC/x3LSwqAMAwA0atI1hb6Q8GriAtJo2ZTpRERSu9uc
 PkYpoJQYRKYugqFHhY+s8L1HeCx5p0MJzV466P1Lpibk4jZ+CUxiGGMDtNgI4IeV6E/6DAvrX1
 Tdut1XQAAAA==
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Devarsh Thakkar <devarsht@ti.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=668;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ks4fukdqMyGr+GEJndFKiSXNpWWX9ybSOnrpYXFOU+8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlyyV55l6tBmXG7ff/FpJCDglNGuypuv4flkXj7
 84AVLkkESqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZcsleQAKCRD6PaqMvJYe
 9eulEACsmMyrXHHrhieBrENiD5omeb8WHKRM8oq53fMSR9pVKgFXW+IQdy7WferMD7ozjKLBsAN
 9MGsBFUQPuPJV+7qA/gpYLV1s8b5dwjBrTbM3FqlJsObRraUICyG8ODdoOiNtmHNEB03MZCwrrj
 ehTTnXc6Kn8nISJIzHiMVhqhW848nZBxUANHDNAnBteEgv8wtC2QBA7qaxprCztK6vd+LRae+aZ
 EsjOchQ2UtwUW88uHcERtC0wnIKm8puwPEJp0AVMooEtTHERfyLUEaKidNhWUf1Tb8Tau2+19vF
 w5PvjUeW+dQVyJ1Pc1BMYbfomUAVK9CP1s3u1o2qUyJGv+VlBEnq3dOwH+t9dRHBW/lCYIDsOOB
 m5HTQjBinNcjdv/T+3HNaG43UUFpuaDGrrR3RaEXTiBgwjTL3ay00PFfG2le7SOMeeXAIiQaOs4
 6QDy3YsMdIjXxNJKiOIlvyr/xAlEIJm144ZN/Q9NjgILeSbc0fuA3RxdN7OcsGHGDsUBwmjpnTw
 S/AhpURae4shRCGEjTcS8XkekI8KeVM5aKkKF3/bndFnksAiE6Z3jaaM4q9lEmt/oLW0tyPw9hx
 1ecVf7ovb5RB7LhYzUehlJoyBlfYFGn3Ak+C9eMRvY0UQvy9HbaziC7+1V6PnebnPa5tddyvXaO
 RQ4x8ZNSckT6rZQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Two fixes for tidss: The first one helps Weston deal with the planes,
the second fixes a possible sync-lost issue with multiple displays.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (2):
      drm/tidss: Fix initial plane zpos values
      drm/tidss: Fix sync-lost issue with two displays

 drivers/gpu/drm/tidss/tidss_crtc.c  | 10 ++++++++++
 drivers/gpu/drm/tidss/tidss_plane.c |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)
---
base-commit: 423af970da74db7eed1b14f2b7f115714a67aeb8
change-id: 20240213-tidss-fixes-cc3741cd604c

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

