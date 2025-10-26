Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C81C0B68F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 00:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F21810E116;
	Sun, 26 Oct 2025 23:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="sLvNX/F/";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="XxFpk6Kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F285410E12D
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 23:03:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-jrjn.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761519836; 
 b=mxCT8gtfvIEUXX+NtKArXzpVcH+9QQ4DMqg1KwbQmIb/F540Jvfsax2WpStgb938Y9hYZoNSkp
 aTNdW94jjzj7Q69Pq5gXSW2UB79fhzB+Wf542qbewALb5QJVPCV0+qrJ4R8+o+rca4pMbapg+b
 kaijhYN/MOTIQt42pikanRJXdfsHYJGVF5OBBpMykc6TzzuwfMY4gh+vVI1cQjfKlpgvFNYooo
 RGr03zLV4wbaITta8nS+ibNG1C0c4BGqYvXEAyeE7LQ1rG7+NW9XOQ/jBmJYePC2GhS5Nm7sTm
 9XVuGFAzGwcbPHiUrcXzLF3dEmuzfDTsY638gh3e/ElYWw==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-jrjn.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-jrjn.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761519836; 
 bh=X85Z4DhxPeHwX9zmh4XP31D3/HzYWiFyWUzUtKstvdU=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=QlaO7onKJ86dM/ad2dDQMA1Ebpi0C/zGj0xmOctvMhCDSE9J7agSgUQ6OJZQN2y5n4UNbrpIEu
 s+bWNggPC7axEaAyIq7saSg0gNwnK2Ac58AW4dHiyxFn5enZMnEVJOV8QVch3uyCNxVTwNGcPF
 T7LFbzfU22bMTHnE3SM4/6A6f4MF4nINENO4j5udTp57vAmhdTdPT0pwPRfGluTNUN1htng7uc
 j8plFRJoZ7IsHSPcSgzQ+syLi2pDB5/Xq4cm9BDeo1wyACNrC39yV3NBlx0tlcNaBYg8ZIj59E
 5RXHh1hr8AgXB+ho4fpryvhS4OlhadSniSNGyrwX+8gCng==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=9y3uMz1ds+GG7HsxTvljl2MUtAE+FKu5xxJF3oOFGCE=; b=sLvNX/F/vd3MRbMBOiaiN/raLl
 iHVfK65eH+vV1D6Lm9BGpxnzUYdqVG+329/rCgHerYNaqGV7Z0QrT57t1F9fth482IkScqc61IN0G
 2PnfCpvVtbrMAEhOgxxkhexIjNYIdaIa+dKzf5SO9S6xpyK3xYmhJ4eJNzxlBA1GLQ4s=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-jrjn.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vD9mD-00000005uu0-0BcX
 for dri-devel@lists.freedesktop.org; Sun, 26 Oct 2025 23:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=9y3uMz1ds+GG7HsxTvljl2MUtAE+FKu5xxJF3oOFGCE=; b=XxFpk6Kneh75XeaOaazc0LK8i9
 dGxhpLI4WxmTA9hAjbjEJzFxdzy5JFZR/Zeq+tnwKW4nX5CW8WO+QwichOHs0NRgdrtFQhLeQQgXA
 u/HDY6pi4RoIbSJBYy23BDRfERUqA/yGgllGiPcFbUWqid2WAeJNNbYZ1QRwCnud0ZIw=;
Received: from [87.17.42.198] (port=63736 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vD9lr-00000000KNm-2ji4; Sun, 26 Oct 2025 23:03:31 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 27 Oct 2025 00:03:02 +0100
Subject: [PATCH RFC 2/3] MAINTAINERS: add entry for DRM splash client
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-drm_client_splash-v1-2-00698933b34a@valla.it>
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
In-Reply-To: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-embedded@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; i=francesco@valla.it;
 h=from:subject:message-id; bh=X85Z4DhxPeHwX9zmh4XP31D3/HzYWiFyWUzUtKstvdU=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDBn/Vhxk+pHU/d87/HulnfLb337npd7c6isK8fLyqTpxe
 9/0tZcOd5SyMIhxMciKKbKErLtxb89c829pGxgfwcxhZQIZwsDFKQAT+W/IyLD7y7EJr/U/qRw0
 ZPXTM/R+eflv3OfLr3ynTpt3/Pe5c0EOjAz7Dx9o2M5wPL34ZlBy3ZyaeIMjCeq2f3rO/W3UfJP
 51pQXAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: a09e33992bdd37147a7b793f305c7a35
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vD9mD-00000005uu0-0BcX-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-jrjn.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

Add myself as maintainer for the DRM splash client.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3da2c26a796b82b9de4143c1591a9b1d44d42194..b365a6199dd427b0c66452cbc419d1fc0618c502 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8643,6 +8643,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/drm_privacy_screen*
 F:	include/drm/drm_privacy_screen*
 
+DRM SPLASH
+M:	Francesco Valla <francesco@valla.it>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/clients/drm_splash.c
+
 DRM TTM SUBSYSTEM
 M:	Christian Koenig <christian.koenig@amd.com>
 M:	Huang Rui <ray.huang@amd.com>

-- 
2.51.0

