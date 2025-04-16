Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0C8A8B750
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 13:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750E210E8D0;
	Wed, 16 Apr 2025 11:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qC9rshun";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D1F10E8C9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 11:06:52 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C466A965;
 Wed, 16 Apr 2025 13:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744801485;
 bh=MItm8lfg7E21L1vIBXLReQo7hX1VUAj4VEBvbFisqZE=;
 h=From:Subject:Date:To:Cc:From;
 b=qC9rshunoFPJTVYEBtXZLhs2K1cIrIlA7aqHAbdD9PbPINT4OznhORb6VXBp6SAJj
 Ily5xjnjg3s8x3XzYSSnHrgYChzQ1BuEXpSnk2Quvdounh3tAUHSw7RdktEJ+9dhZR
 /4xgh+tS10NMFnPv41Df8F+OZJroSW21ssXjxsYY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/2] drm/tidss: Delay reset if we have a splash-screen
Date: Wed, 16 Apr 2025 14:06:28 +0300
Message-Id: <20250416-tidss-splash-v1-0-4ff396eb5008@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADSP/2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0Mz3ZLMlOJi3eKCnMTiDF3jFIs0YyOLJHNDMwMloJaCotS0zAqwcdG
 xtbUAaVb/Ol4AAAA=
X-Change-ID: 20250416-tidss-splash-3d8f328b7160
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=869;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=MItm8lfg7E21L1vIBXLReQo7hX1VUAj4VEBvbFisqZE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/49DPxxfKLpcZ7G4rANhH82N8fji5+GFN7rDx
 y+R+wmemjaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/+PQwAKCRD6PaqMvJYe
 9bwCEACaKS0vBsmA/uj0Hpf7onTI2RJWGA6XDX/luy5hA5rbiXMN2/tnreZ/zXD3WVkeVLMB2Q5
 T5PYt1v+Sh1zLZon6exPF6ZnRIHMQVZP1F7qeH/b2U4nUHylro9VtZfPdbHautaWjxZJOPZB3dU
 k/nHo+fV6KeSdzXzw4Br0cDw5mUhmheiMOCxby4FeYX7zBy/JqhGw8/zxzPAVRSa+sjcaTLzeBB
 wPeB4a8B+mqQWPCELIG6WVDtmayRosYctMiX5VzcPyD7+WBjeUM/C5BbIxYT1YmvzNgUpyzPD1V
 znM6ZrT7c3ZwjX6RWnRbEhaBNxFIFYq2Q51cpZwuoKAElee402GySx//pquaJVWe32zlba/HQ07
 cIWL7dmOLKRgIQ5BmNtdpoBQNTfeeXjmtwFuVIdKBL1lofVIoRMZaSN5Ss6tZynF+xLCTaZTYgJ
 jxe48VcZIiH9uDAoxUjcOvMV+rNuufC1VWTX+MDT3m7BB3B3JklBczzyryniVV7bxgtFKBz4V5p
 JSWPvpErxSLGSzRE1eNe23G+Vb/FsL7f8c0sRs7cb4DLQEx39C3eV18pkgWf365yCaRCbgwMWhQ
 0mbpZFY76aDlAiNJhr1LluhjvdKpG1atDz5NObpOaZo9y1uw/1YH/8WqwGWCL5eL7ZFVxHKY7cp
 aiMmpTRiZorFYew==
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

These two patches are part of a bigger work to improve splash-screen
support (i.e. the bootloader sets up the initial display, and we try to
keep that on the screen until something else (Weston/X11) takes over).

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (2):
      drm/tidss: Add some support for splash-screen
      drm/tidss: Remove early fb

 drivers/gpu/drm/tidss/tidss_dispc.c | 126 ++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/tidss/tidss_dispc.h |   5 ++
 drivers/gpu/drm/tidss/tidss_drv.c   |  38 ++++++++++-
 drivers/gpu/drm/tidss/tidss_drv.h   |   2 +
 4 files changed, 156 insertions(+), 15 deletions(-)
---
base-commit: aec8a40228acb385d60feec59b54573d307e60f3
change-id: 20250416-tidss-splash-3d8f328b7160

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

