Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9029822E60
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 14:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B49610E257;
	Wed,  3 Jan 2024 13:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B79710E065
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 13:31:57 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDCCF975;
 Wed,  3 Jan 2024 14:30:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1704288656;
 bh=/a3FQfU+ot843llE5YtaY8TVMQkIl+uXFLMym5WrLkc=;
 h=From:Subject:Date:To:Cc:From;
 b=L0+xittV+g1SMEGY6VCqPfxbAmv8Yjh8SVBo3bIuwtlCtQq3mFpFlsKBrzbxKgRlZ
 qTlBuN7Df7DEMZ16HKe3mOTI+44Onn5z/X6G3KSYPXontCkm7zQVOgtwu1rJ8Z4FTP
 uj9bM6eJU7VACGsNdz20VfjZa4fPnhqsdgvizpDY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/2] drm/bridge: sii902x: Crash fixes
Date: Wed, 03 Jan 2024 15:31:06 +0200
Message-Id: <20240103-si902x-fixes-v1-0-b9fd3e448411@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJthlWUC/x3LTQqAIBBA4avErBP8q6yrRIvKqWZj4UAI4t2Tl
 h+Pl4ExEjJMTYaILzHdoUK1DezXGk4U5KtBS22lkkYwjVIncVBCFrZ3flCd2Rwi1OWJ+Id6zEs
 pH1RZNU5eAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Boris Brezillon <bbrezillon@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>, 
 Jyri Sarha <jsarha@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=558;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/a3FQfU+ot843llE5YtaY8TVMQkIl+uXFLMym5WrLkc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBllWHGuUT5WXW87Ha/0sIaEz8Jxs1wwJLLTOz6X
 Qm42BYATz+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZZVhxgAKCRD6PaqMvJYe
 9fyoD/wIgLOvxYeFfGb9xeWdoQKzvcIVHemlkNk39Iyfxwp+2cF0zcg1LTImtXusDiTq4K9gSpR
 R8nGJHevGseUJVxeOKZDdIfJdW88oJqF8c1e1+oaAJRK8TvqoIheyo153EgdBEVuDH2buE3O5A3
 QxNlP4Btw4ItnfAeSD3pFgumzhy1ZTsu/yONALYjOPNrctAoVN23lKC7DN34WlG8cJEwLH//9iV
 PRjGPtG407TkwUJ3lCBkGQ4dM70WaPhDsuQYt9W4MUamedz/nVx/9zG8C4JJ9qJZGRvpw/2Hk6P
 tc9oULoYIeooWNqtw5VxOt7C2cNvUpZBCtmdzZVe123W+QZOCB1EVwei5zVx5X4mquYQUFrrV/e
 P0N8qAxsWrwaNZbuvW8NfhCByLU3Q4LOB92uDyOcN4RbQZDeHs3dAxmUGXq2J1qEpirIqfhXt/j
 NYtRXWc8ZauevXpeLaD39eA4kP6hJEPH11QVsQtbS260YPY+1NAofaf2UMl78JGfJ7fVH7mgpxJ
 GDAvjPzZjkAydJWnkc5vkZAkfn77LfIJhEQ199r6rL73KxtI7z8BNbOTrCTYw2crKaJ1gUEZ6vs
 SiTh1iCMtH73BGhZjHSt5sM4UrCtk9yWJuDaDZVYN31/A6esj6xqE+pbQ0050mz0MscQGR9V+jf
 LVKIGXXVmeFMD0w==
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
Cc: Nishanth Menon <nm@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two small fixes to sii902x for crashes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (2):
      drm/bridge: sii902x: Fix probing race issue
      drm/bridge: sii902x: Fix audio codec unregistration

 drivers/gpu/drm/bridge/sii902x.c | 42 +++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)
---
base-commit: 0c75d52190b8bfa22cdb66e07148aea599c4535d
change-id: 20240103-si902x-fixes-468d7153b8ee

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

