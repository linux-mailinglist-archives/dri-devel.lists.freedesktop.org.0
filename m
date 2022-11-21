Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17600631EAE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD8C10E29D;
	Mon, 21 Nov 2022 10:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543DF10E0F3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 10:45:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD28F220CA;
 Mon, 21 Nov 2022 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669027535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RugJ/Vs0Ex4Xdi3D2qrH/fjMvV7y5sfT1XTZyfr+pbg=;
 b=MdoJ5UwH63tcwuWIZcTcfG2gipmK6hQdIyy+ueSB8ED4SZRXp4pb64rNlGY5NTg53MAPSZ
 a1uIyzQc2GGasTP1rTje7UqsV80au10AQ81fZY3JS1SGVg8bP1eC05BaI6X2ka11J1f34D
 dUZWkRu+BzEshhK8rX2MjADDmOt2ILo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669027535;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RugJ/Vs0Ex4Xdi3D2qrH/fjMvV7y5sfT1XTZyfr+pbg=;
 b=Vbsfilx1z9z4j9ldcueP6gpaDgY13hBkvIr6NXIZGLOYQJN/UxEAS9mw24xlBA/SuE20eV
 rQxELyhHwWtZflCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 871021376E;
 Mon, 21 Nov 2022 10:45:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KN0bIM9We2NaGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Nov 2022 10:45:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, thierry.reding@gmail.com,
 sam@ravnborg.org, emma@anholt.net, david@lechnology.com,
 kamlesh.gurudasani@gmail.com, noralf@tronnes.org, javierm@redhat.com
Subject: [PATCH 2/8] drm/ili9225: Call MIPI DBI mode_valid helper
Date: Mon, 21 Nov 2022 11:45:26 +0100
Message-Id: <20221121104532.8301-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121104532.8301-1-tzimmermann@suse.de>
References: <20221121104532.8301-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MIPI DBI drivers validate each mode against their native resolution.
Add this test to ili9225.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/ili9225.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 815bab2858231..f05a2d25866c1 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -326,6 +326,7 @@ static int ili9225_dbi_command(struct mipi_dbi *dbi, u8 *cmd, u8 *par,
 }
 
 static const struct drm_simple_display_pipe_funcs ili9225_pipe_funcs = {
+	.mode_valid	= mipi_dbi_pipe_mode_valid,
 	.enable		= ili9225_pipe_enable,
 	.disable	= ili9225_pipe_disable,
 	.update		= ili9225_pipe_update,
-- 
2.38.1

