Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96392D39BC7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86C910E309;
	Mon, 19 Jan 2026 01:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S5dnYFod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD3C10E309
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:12:08 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-64d00702990so716285a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785127; x=1769389927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s0u8eLdbLCl3RDSNLAMEHYXwCr/EaTB1bb2BDCNJLyI=;
 b=S5dnYFod0NPGHmQdsQj4HNGJLaWwYhTZaFr776uv27n86G8gJs8dA8zxAy4JPYSOmM
 UI+WBCZ/sHyWCC1RpHsF8yCWYtlumSx1mHmSke/u7C4YHaOqOgqhQGeG0rE5mpUVKMuU
 PFh/w6HfrUlN6+lLI7Q5c8Prlv2dqQd74pIifOpcGZeW1nNMiv3s7SYi6wSkCcb11BaV
 ZzY9lYjPYd1GcaWSes8nBp72PS2k6KRdgwJ6NQVxqirHBGUqzNBxUrVD8Xin9wvRa1K7
 696ictE/0mcaFsfZaA3ctGxj4yV7uu7dPKfAP2wfeLHTmbfZiO/E3KPPDhZ4siEfr8ia
 QOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785127; x=1769389927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s0u8eLdbLCl3RDSNLAMEHYXwCr/EaTB1bb2BDCNJLyI=;
 b=XOor0AzzM7OyqN7yay6w6B9LD5MpV+KoHPhf+LjAtUeqjsBXy0Bz4lShJwYIMYE1BN
 HldMPZrnMnNB06tXiZDGlYUdTu3nFw1EGelJ7xQb65VZx+dxGlJagtexVoQAqgq8cHOf
 6rG0EmiwackLiJl103ucvez25sjAGaj1n+yrYAu61JV1v88vDolAlH7ouNnKXulXx9pW
 UQV1//cGOOmwQ7soN3z4mlqHy9xiNVWB6C3lsnyCjdADvXgfuNpmCIH1sE3g/URzP+1N
 QEhoLDNTNbPaNDpZkfwVygofWDNtBhA57qddk99PNaZYjWoXW61h4dcVm5WN4acrMF3h
 jUzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLbEVoM//SAHNBvyZsly2tA/uYxfvGRWappBCbZca4Nwf4Dp68z8feGzDWypBiHie5P6BsmT7iSpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4IxG15kTRCRxgU+lkZ6ySaO48Nd1NTJahFPcBc2DjyPmoHA0f
 x7GsbkShrzLNrMk4FOQReJzmw8br89pVE55FE2QIUq+3IqzFsTPNCUrl
X-Gm-Gg: AY/fxX6kwaIgzdtjrH0CpJfF2f8898vgyE2AAgH1m+xXiAq7NxFvHqeUBfHy5s2mGSl
 B587q34E7noaUkTAvpzcOgWHWKq+xPcH9xfNLnH4z05p+b3kBFykUe85yHpsTg7ucIhPJNICCye
 ChGrzz47JnDduRrSWWoWBwCa1OdhI4D+/FWX1K0gH8tX8VVFqOIP2fD1is1UhA7fy1xB3iRNbjb
 QTREnLbVEK3wfy/uOPIozXLIJfnlsqm/cRtwJMpzeY5VBES6Y/GVmF0PxbL5wk71x4cbncgK3p7
 yNO+RRkIWmMaL6NkYZSKJrlaJwbgzqdkgIOi/9pTTjL9iib7pITyoftZ7tRSF6075QoDYT53Oaa
 ehH2k9BK3iPwd9TA9hgzlQ/r2pBt2BJruRCDz3WqA6a3YLQix1GaeS3g+EFOoQQmkhSKnFJAm2a
 05gR1dYrp0q2unt6XHGOGUT6RL6bm3utNUaM3BadzYO/eWyPLD9x1piAHNYAb6JIbN
X-Received: by 2002:a05:6402:5216:b0:64b:3b7c:7920 with SMTP id
 4fb4d7f45d1cf-65452cd36d2mr4017295a12.8.1768785126847; 
 Sun, 18 Jan 2026 17:12:06 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:12:06 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 12/17] drm/amd/display: Build HDMI vsif in correct slot
Date: Mon, 19 Jan 2026 02:11:41 +0100
Message-ID: <20260119011146.62302-13-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

[Why]
HDMI vsif was assigned to vsp_infopacket (FreeSync) field

[How]
Build HDMI vsif in the correct hfvsif_infopacket field

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3c535a361882..ef7e02ebda41 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7362,7 +7362,7 @@ create_stream_for_sink(struct drm_connector *connector,
 	update_stream_signal(stream, sink);
 
 	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
-		mod_build_hf_vsif_infopacket(stream, &stream->vsp_infopacket);
+		mod_build_hf_vsif_infopacket(stream, &stream->hfvsif_infopacket);
 
 	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT ||
 	    stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST ||
-- 
2.52.0

