Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD7D595F42
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 17:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB4096F0E;
	Tue, 16 Aug 2022 15:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDAB11B68C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 15:37:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B6091FE96;
 Tue, 16 Aug 2022 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660664222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvVW75pSWEXq7CYezqMwR/bNGlxupt7EmzHbZX5yzGE=;
 b=iGuPWnlELmE8eWxDkyX004/5+tpH35FA3YMcCBcWtxxCDj9JspuXcMPtfvNYEzhk7i+aKy
 JBYsoeLQJ2dGPjior2V0/vLB34w6esUK8CJZmwl2h1nbpu0w9USbeZ1vr8l3VJjyBQ4bLU
 HRfupqe3ragCXgk0879gj/ZYOVU8sHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660664222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvVW75pSWEXq7CYezqMwR/bNGlxupt7EmzHbZX5yzGE=;
 b=rJ+eQ8fDz1vtNO6axLuThokNvNclNfTs2SH8kK4jpsKjrpvJNlz8kthTca6Uo0AfageE2H
 ALGi3RLxcH0nfoCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B1E913B1A;
 Tue, 16 Aug 2022 15:37:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YDViDZ65+2LKJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 16 Aug 2022 15:37:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/12] drm/udl: Suppress error print for -EPROTO at URB
 completion
Date: Tue, 16 Aug 2022 17:36:48 +0200
Message-Id: <20220816153655.27526-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220816153655.27526-1-tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver may receive -EPROTO at the URB completion when the device
gets disconnected, and it's a normal situation.  Suppress the error
print for that, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index a9f6b710b254..6aed6e0f669c 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -126,6 +126,7 @@ void udl_urb_completion(struct urb *urb)
 	if (urb->status) {
 		if (!(urb->status == -ENOENT ||
 		    urb->status == -ECONNRESET ||
+		    urb->status == -EPROTO ||
 		    urb->status == -ESHUTDOWN)) {
 			DRM_ERROR("%s - nonzero write bulk status received: %d\n",
 				__func__, urb->status);
-- 
2.35.3

