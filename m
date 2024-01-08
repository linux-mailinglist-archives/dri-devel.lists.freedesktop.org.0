Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1F827A79
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 23:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6886910E08E;
	Mon,  8 Jan 2024 22:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BF389DFB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 21:57:18 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d542701796so7143835ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 13:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704751038; x=1705355838;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VSE3cgI8OHcQJYYKxTLpy8I+dfZdmjSESmHHPD8Kva8=;
 b=HbAeeKObi58puDNayhXZ0QQ5UBM5WKj/L+kf3FJEErYZkXRXlx2/LKNuEaMZ+AHDnk
 g8MrMWzOyk+zi9nmbGBuK6VMm9OvdHXrNnd/lYUTFteXMFDwOrZ68GohhfaeLyye0WRC
 UBz7v3QHPA4OOIYzHAHuVy4R/k/VT37r8wFio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704751038; x=1705355838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VSE3cgI8OHcQJYYKxTLpy8I+dfZdmjSESmHHPD8Kva8=;
 b=O8pUyXCKPsyO7ynYhXZoWtaX5k33HvTnGFOu7XMrcueagxesIFrh5CsLhFU4ZlivBO
 Rx264tOjKhJIpWo4o6j2Y0Ko9MNVQ72TKefmon/3d+OYeBd4GaF8GfxiD9P+nDsHUkuu
 lyCUVDrLDqpR9WaT30C/uqzmah8m+zs9BVog16Pwp48bivucPHhKi825WN+rC51o3XV3
 qr5fWwXvMW41YUTd3lXm6jrLfGZdHcpPiH1lY/Mr4Qzlu1ADvCkiNAXBKO1HT6nLkrfm
 mS2AEz7ULG4l/f6DxZjct19w3VhgPZmHGVKXv/WK+6rPoah3gkvzSjU/mU4cdicnu1AC
 y9TQ==
X-Gm-Message-State: AOJu0Yw42rPDqdh10VEdCeoBgosUg/wg6CRXMwJxsv3cXgD08msC8XMF
 eAdMsvLewId0Re3n4OQu7d5Sey/v/A9xS1kYdjfGTcfD1rqpES9iZCV9Nwv68yaMymX5LnNqysp
 zR/f3hZ1WVTrELFTgCDT4oslV3UNqTQya+yuX/y0d9VGRSgcyHPC7kBRx0dXeDkxny6XIUYOXNZ
 q6skGei3I8DfvsG/gM17A9
X-Google-Smtp-Source: AGHT+IHnWqW20UbfIo6c6P2fySNfGs+60hCSTjc84ZhdZKds79SVTVtsFqdNg27rXxNec8ZFEgjfAA==
X-Received: by 2002:a17:902:c3c1:b0:1d4:c27d:8428 with SMTP id
 j1-20020a170902c3c100b001d4c27d8428mr1991706plj.60.1704751037696; 
 Mon, 08 Jan 2024 13:57:17 -0800 (PST)
Received: from localhost ([216.221.31.53]) by smtp.gmail.com with ESMTPSA id
 jf12-20020a170903268c00b001d3e44faf1asm352279plb.272.2024.01.08.13.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 13:57:17 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Add SVGA_3D_CMD_DEFINE_GB_SURFACE_V4 to command
 array.
Date: Mon,  8 Jan 2024 15:16:55 -0600
Message-Id: <20240108211655.13187-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Jan 2024 22:01:05 +0000
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
Cc: Ian Forbes <ian.forbes@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without this definition device errors will display the command name
as (null) when debug logging is enabled.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 36987ef3fc30..472c4821528f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3603,6 +3603,8 @@ static const struct vmw_cmd_entry vmw_cmd_entries[SVGA_3D_CMD_MAX] = {
 		    &vmw_cmd_dx_bind_streamoutput, true, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE_V2,
 		    &vmw_cmd_dx_so_define, true, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V4,
+		    &vmw_cmd_invalid, false, false, true),
 };
 
 bool vmw_cmd_describe(const void *buf, u32 *size, char const **cmd)
-- 
2.34.1

