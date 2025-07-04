Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5E1AF9B18
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 21:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC9410E09E;
	Fri,  4 Jul 2025 19:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="F4ulFDGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D113210E09E;
 Fri,  4 Jul 2025 19:20:25 +0000 (UTC)
Received: from wse-pc.fritz.box (pd9e59880.dip0.t-ipconnect.de
 [217.229.152.128]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPA id CECFC2FC00A2;
 Fri,  4 Jul 2025 21:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1751656823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hfOhpq8fyOjaZ56cdFC/wn/8XOnBTOc0qDrbyCqpV9k=;
 b=F4ulFDGP6WyMJHaMAse7nkNMyECngO4ZXyITARDd188ZhSZYDkUaic7mBEfNfE+5w3UK3f
 O4nqweDNvunSUChrr9HOLaD7ySmR4jX05FFg4NwEJwn5MZCak+lzNdV1RabvS0/t60YlLJ
 XsBK6FnA9G9xEzTP1ZtiFnum+E80sX4=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Werner Sembach <wse@tuxedocomputers.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] drm/i915/display: Avoid unsupported 300Hz output mode
 on a TUXEDO device
Date: Fri,  4 Jul 2025 21:03:45 +0200
Message-ID: <20250704192007.526044-1-wse@tuxedocomputers.com>
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

RFC because I'm not sure if this is the right approach.

The flicker manifests ever few seconds 1-3 black frames in quick
succession.

On windows 300Hz can not be selected for the iGPU, but the panel advertises
it.

A cleaner solution would probably to go over the pixel clock, but for this
device there is only one 300Hz mode in the panels edid and that is at the
nativ resolution. Chroma subsampling was not tested as linux afaik offers
no way to easily enforce it for intel gpus.

Tim Guttzeit (1):
  drm/i915/display: Avoid unsupported output mode with 300Hz on TUXEDO
    device

 drivers/gpu/drm/i915/display/intel_dp.c     |  5 ++++
 drivers/gpu/drm/i915/display/intel_quirks.c | 30 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
 3 files changed, 36 insertions(+)

-- 
2.43.0

