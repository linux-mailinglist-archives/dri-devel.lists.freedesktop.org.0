Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3BF22AB4E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 11:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088856E87C;
	Thu, 23 Jul 2020 09:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF4C899BC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 09:05:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f18so4425040wrs.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 02:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LreLnnZrmwYYHqpYhGckfxJZdjPdivebpamaHVtnHss=;
 b=dp4NOUJqQL/scm6GUYDjAXuLDt4cgSIbswqtZ6cIJfZCxfzC1NpMAwaIZ+2dvElcj9
 SDC0T7IQ44exhyDpzJ9m7bbXA8SelqJO/TmmnZPQfFDK63km9fcYn7YvPWQPd4zttNZm
 DgWrxRl6zwWKV+SF2Dezay6uB7J+zAzzIPC7iRSeLSi9hP4VzjDj2CYgg7Y9mSk1PDhz
 A52xl0Ki7OzQ5at/zyyUJtmVloPz8Vqhq2ZgYD6xs3fo1wUAWRJNN6adh8xK05051VJA
 f8qrpe2alI3fnTVS4Nrfn641a/3JssxJhg5jEeT8FUwJs2HZAvWCnrUvgjhoOUId9/CY
 j47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LreLnnZrmwYYHqpYhGckfxJZdjPdivebpamaHVtnHss=;
 b=US8ga6GajXh+YlBhuWLWnyJiqBkFDd5QkmRROfdggFxzJA3JK2fVf3FqH6iVYtyaLJ
 qeH6O8PWhntjI5ZuhgFZ0gLWnLuPtgl5oWlP3UMCk6Lt6vVy+rrqdUh3aPY2uxVk4wYV
 fKB4e3oGH8oLonml0Q73ifellV8X+dBWMjdeYga36F4KlcgCrYWn15jt3xWUXRtwxk56
 hl1Ikc+ckbOrvm/mnsG3yCnhYunDnXUjgGGW8XQXzUOQd8jNGpQ1K4isZsLZyiz70/W5
 mttyXP+v0u1ONMBBZLrObMUOV+vwIsS/NSHyFRj5AguxjBHg1AlWcAnDmMwrBr3oKrAq
 zHRQ==
X-Gm-Message-State: AOAM532HTEN0XmV7LjMb+h7OdPKJV75ehAuo+BEt+d32db9sy9CTbkjp
 eOPmrMPnxzoIkO39OI55Ia0XUg==
X-Google-Smtp-Source: ABdhPJzqffe9YMOSst9S78aI/iVWmungmYo/9CY48wTFHegSvIqIB1PAqtLGwVADRl5r9zYcZipJCA==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr3032026wrn.51.1595495156669; 
 Thu, 23 Jul 2020 02:05:56 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5ce9:901f:7444:d44d])
 by smtp.gmail.com with ESMTPSA id 62sm2947397wrq.31.2020.07.23.02.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 02:05:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH 2/2] drm/meson: overlay: fix Amlogic Compressed Framebuffer
 modifier layout extract
Date: Thu, 23 Jul 2020 11:05:51 +0200
Message-Id: <20200723090551.27529-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200723090551.27529-1-narmstrong@baylibre.com>
References: <20200723090551.27529-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bitwise operation worked because the result is casted in a lower bits
integer, and was not changed after the modifier defines rework.

Use the correct operation as already used in meson_overlay_atomic_update().

Fixes: e860785d5730 ("drm/meson: overlay: setup overlay for Amlogic FBC")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index a8bcc70644df..83ec613bbfb6 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -756,8 +756,7 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 	if ((modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) ==
 			DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) {
 		unsigned int layout = modifier &
-			DRM_FORMAT_MOD_AMLOGIC_FBC(
-				__fourcc_mod_amlogic_layout_mask, 0);
+			__fourcc_mod_amlogic_layout_mask;
 		unsigned int options =
 			(modifier >> __fourcc_mod_amlogic_options_shift) &
 			__fourcc_mod_amlogic_options_mask;
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
