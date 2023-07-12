Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E04750239
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F006610E3BD;
	Wed, 12 Jul 2023 08:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A90310E3BD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 08:59:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A606861692;
 Wed, 12 Jul 2023 08:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6DBC433C9;
 Wed, 12 Jul 2023 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689152394;
 bh=BR+iCpSuQ7vxUhB+UPskQqo1D8fyS+p3rbke57h/srY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=koAZdbFhYit8+IZ+/sRyA0ny8Ba4SKLjFvY3BBuxstMtA/AsdoJZJ6Pjrr6IdRc9S
 Q4ZDSiDq12k8y1EjsHEA3nHJaNHxSRlSMpqkkpyceqFYmU+4MMt2y0iQBNsoYLenYZ
 nMqrdNFAYDH7199G/Z9c6owb80OAR5qI+T2D74HnAzwUc1f7ZNtIzoOZeAMwDc32VB
 hTyCX2R7tDYpBvMfmhQ3b4VHFeoKvasKZSmyNYEF6XDvCbb/Tk8cGX9x+Xn5/K77Iq
 CZcV6wTzt3WVjpHsgTJJkW8IOpEQv/JxMuxJysuffxhSffvDhZKXAClzW+S0DKaFMo
 kfcugQulRuodg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 4/7] vgacon: let vgacon_doresize() return void
Date: Wed, 12 Jul 2023 10:59:39 +0200
Message-ID: <20230712085942.5064-5-jirislaby@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712085942.5064-1-jirislaby@kernel.org>
References: <20230712085942.5064-1-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-serial@vger.kernel.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The return value is neither used, nor vgacon_doresize() returns an
error. So change the reurn type to void.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/console/vgacon.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 7cb15851ea56..07f6b97d9b81 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -528,7 +528,7 @@ static void vgacon_cursor(struct vc_data *c, int mode)
 	}
 }
 
-static int vgacon_doresize(struct vc_data *c,
+static void vgacon_doresize(struct vc_data *c,
 		unsigned int width, unsigned int height)
 {
 	unsigned long flags;
@@ -587,7 +587,6 @@ static int vgacon_doresize(struct vc_data *c,
 	}
 
 	raw_spin_unlock_irqrestore(&vga_lock, flags);
-	return 0;
 }
 
 static int vgacon_switch(struct vc_data *c)
-- 
2.41.0

