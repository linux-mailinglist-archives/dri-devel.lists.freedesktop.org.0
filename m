Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 349363B9D2F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 09:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28A689FAD;
	Fri,  2 Jul 2021 07:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBE589F99
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 07:56:45 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC40820532;
 Fri,  2 Jul 2021 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jLkXfq4VNPDDu3AqTkwDt2HVrf29fppGYF6t6K+fS0=;
 b=ZPpkgOsmSRYR0mbOOJzMXMHdxBXcZUblEzKnSrNNYsuUfA1IQIYWXPIZ3nh7BEcsrrLx7r
 6pFLfI1CmpG9H1WJfiKMJGaTVJ6YF9F2v4Nzf/kPiNCbZ4TCypX6UAlb4BYeqaBFDFrJuh
 SMCbbBg1ihhzpJ9JJgKx+Jftn9LUDVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jLkXfq4VNPDDu3AqTkwDt2HVrf29fppGYF6t6K+fS0=;
 b=DUP3SgPEfsA/uem5vZwncDNkJNv8nKhk56O5k5OW9cpon6eCMxEl6fjZ51P5dUJ7qWELIx
 wtvWrQ2Y7KbdwECA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C0AF411CD7;
 Fri,  2 Jul 2021 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jLkXfq4VNPDDu3AqTkwDt2HVrf29fppGYF6t6K+fS0=;
 b=ZPpkgOsmSRYR0mbOOJzMXMHdxBXcZUblEzKnSrNNYsuUfA1IQIYWXPIZ3nh7BEcsrrLx7r
 6pFLfI1CmpG9H1WJfiKMJGaTVJ6YF9F2v4Nzf/kPiNCbZ4TCypX6UAlb4BYeqaBFDFrJuh
 SMCbbBg1ihhzpJ9JJgKx+Jftn9LUDVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jLkXfq4VNPDDu3AqTkwDt2HVrf29fppGYF6t6K+fS0=;
 b=DUP3SgPEfsA/uem5vZwncDNkJNv8nKhk56O5k5OW9cpon6eCMxEl6fjZ51P5dUJ7qWELIx
 wtvWrQ2Y7KbdwECA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id GEYtLrvG3mBSDwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Jul 2021 07:56:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v2 1/4] drm/mgag200: Don't pass flags to drm_dev_register()
Date: Fri,  2 Jul 2021 09:56:39 +0200
Message-Id: <20210702075642.27834-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702075642.27834-1-tzimmermann@suse.de>
References: <20210702075642.27834-1-tzimmermann@suse.de>
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

The flags argument is only relevant for UMS drivers. Pass 0.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 36d1bfb3213f..b616fbbd4493 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -355,7 +355,7 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return PTR_ERR(mdev);
 	dev = &mdev->base;
 
-	ret = drm_dev_register(dev, ent->driver_data);
+	ret = drm_dev_register(dev, 0);
 	if (ret)
 		return ret;
 
-- 
2.32.0

