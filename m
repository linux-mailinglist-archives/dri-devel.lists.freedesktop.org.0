Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B040F74D648
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 15:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CEA10E25B;
	Mon, 10 Jul 2023 13:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7966D10E0FC;
 Mon, 10 Jul 2023 13:01:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 042211FF7A;
 Mon, 10 Jul 2023 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688994078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zUoLo2iOzomOZ9vT6lH81AsiLcKSFTf6r6yeZLXs+I=;
 b=XOuadsPfz67AOSh7Ed7yHanRtTkDg8+PQa5iqXvtYgoQ13QNaWanlTvotm22780rhMVc5c
 XMZ5B5u7dGHYW1r6KrvKRtIBSeSQ9zvLvgzbuZZ6PwL5ac+OiNkeICP1qMsOV59reVFZic
 /4J6NeP1sx0oElFAXxuxXMYooJuJ2rI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688994078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zUoLo2iOzomOZ9vT6lH81AsiLcKSFTf6r6yeZLXs+I=;
 b=grGc3342L/FzeU0I0LmlEHzF8hTY8FFCaYR9DhKTHgmez1voinzZf/yiixCQrBjCiOz0Fx
 V4hMFgMLnvYfh2Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C3FA13A05;
 Mon, 10 Jul 2023 13:01:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2MfgJB0BrGTTFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 13:01:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 07/17] vfio-mdev: Remove flag FBINFO_DEFAULT from fbdev sample
 driver
Date: Mon, 10 Jul 2023 14:50:11 +0200
Message-ID: <20230710130113.14563-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710130113.14563-1-tzimmermann@suse.de>
References: <20230710130113.14563-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
 Kirti Wankhede <kwankhede@nvidia.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The flag FBINFO_DEFAULT is 0 and has no effect, as struct fbinfo.flags
has been allocated to zero by framebuffer_alloc(). So do not set it.

Flags should signal differences from the default values. After cleaning
up all occurences of FBINFO_DEFAULT, the token can be removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Kirti Wankhede <kwankhede@nvidia.com>
---
 samples/vfio-mdev/mdpy-fb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
index 3c8001b9e407..cda477b28685 100644
--- a/samples/vfio-mdev/mdpy-fb.c
+++ b/samples/vfio-mdev/mdpy-fb.c
@@ -162,7 +162,6 @@ static int mdpy_fb_probe(struct pci_dev *pdev,
 	}
 
 	info->fbops = &mdpy_fb_ops;
-	info->flags = FBINFO_DEFAULT;
 	info->pseudo_palette = par->palette;
 
 	ret = register_framebuffer(info);
-- 
2.41.0

