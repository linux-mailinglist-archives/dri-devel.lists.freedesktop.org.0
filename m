Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK6VGZ4bjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126EE1288ED
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933B810E6A8;
	Thu, 12 Feb 2026 00:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CUO+7NXV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D62610E68D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:54 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-408778a8ec4so2136300fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855293; x=1771460093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vB+cc01KMDy+1bX+9nVaruepBX97i9TSrBfN/R0HMBE=;
 b=CUO+7NXVKNfgtVlOuzQbhPs771bIWnqUgKxC8GkrbZgjIXPF/REk2ZJRpMq3TMEXxR
 R/WEiZuYZ1nl8utmSrLxFAGGbCEwLWdpD82QaAFhJiiMNAkGsL0NzyotFz0pew1Ht6Rh
 /PtMU7lBYL9SirXKkxEqt/6kTHfCJANXtbpDqu6iU73lc1QNjQTT2XhOBsidTy8Sosav
 QSoLIuv9Il01KZ5KmFcgbdyxq/2qXWPJeM5x7IdC3ITP7IpGZ2D1PrXpaSrpMLoDkmsN
 3O0YsmxiTmMDnKTbY4w7XdiMoBM4yGYnA/ndPaoGhMbYDAWmCl+bN3QFnnhooEZxd//g
 3O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855293; x=1771460093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vB+cc01KMDy+1bX+9nVaruepBX97i9TSrBfN/R0HMBE=;
 b=fs1o38T5LEjtXYCe1WcZDaOMD7mpmtApX0ljYonjmu3Kaz1MSjZbkPoCLMesWEeboN
 FyuqLNv3uIGTFrqoljDTkByHnU6uDL6fuJTa+CE7U7s5Dbu21M6VZWTzfBBhAgWgLxJu
 30lc7TM+cHEqlK9h8/HlWD793tpwSP0cwyQ5notqi3IOIdk7jMybqYqfvZ2qUiNCDXLz
 HRIXsuFRHjZ9NE9j4Z2vupCkvLyh44Ix4HrwIDQa6EJDirWYgEMRt/HJ9u0oJi/91VUo
 hcrNg/0KqiLfuVYISFRSn//F2QyjKbMpXF3XnRMGWEm4kbvvQ2pUiQsbMSgzd8iByrks
 U+Wg==
X-Gm-Message-State: AOJu0YzMiLpy+I1ATMJIwKANH9fZN+UOCGU4/tgQc5DAGxV0i2AskDeP
 DYjhnFPDQLR5wA1ts4wlqgrT63ZaqXswtH6Q5NeRwUVtFKx1CXvWJVfF6xIOEw==
X-Gm-Gg: AZuq6aKOy6zf6oQXVMISusW2OgCpNlNDfiDnrcgPX+AAe2JBsnRawd587jvdeSizDDB
 lkviYlPEmlY8gUB7MK0djO450S0zFp+IDxD4y+VP+S6OJ6M35Xux7Lf14yzeFxAUFjbrda4rClP
 6XacB3ScW+ZSduPexnUQwanW1PEzBd2Qebb4GzPBEl7EH1QM2CgfRHa2dv9tkAMu0wUXMLFZF0V
 U5Ouvt8eTqEN/HDL/JzF4aH9ye81JlWHWoE34A6dkwbZsE5Rf3oBy52n/qVCJKjspgmh0D8Vprs
 1Ah6BfQxG/DIuPqLtBxnUlHYqTamx2RuQtEU9SB/O04Ttel8qeB5twV29xwhJyn/SD2JTioZHkD
 4BPPOO/nnOK2+SUL4tiOuD7TOdRKBDEw87Bm+ndn7elBmmtI0s9orYpjb9o/pNF7+ISCfLXLcvI
 q840Edkgp0ZFgSeB/Id5/EWQd14orB2lXiSv+SXhYLfaL2zrwicEQy
X-Received: by 2002:a05:6870:d362:b0:408:9c71:bdaa with SMTP id
 586e51a60fabf-40eca3793fbmr305175fac.59.1770855293020; 
 Wed, 11 Feb 2026 16:14:53 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:52 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 37/61] drm-print: fix config-dependent unused variable
Date: Wed, 11 Feb 2026 17:13:32 -0700
Message-ID: <20260212001359.97296-38-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-37-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
 <20260212001359.97296-8-jim.cromie@gmail.com>
 <20260212001359.97296-9-jim.cromie@gmail.com>
 <20260212001359.97296-10-jim.cromie@gmail.com>
 <20260212001359.97296-11-jim.cromie@gmail.com>
 <20260212001359.97296-12-jim.cromie@gmail.com>
 <20260212001359.97296-13-jim.cromie@gmail.com>
 <20260212001359.97296-14-jim.cromie@gmail.com>
 <20260212001359.97296-15-jim.cromie@gmail.com>
 <20260212001359.97296-16-jim.cromie@gmail.com>
 <20260212001359.97296-17-jim.cromie@gmail.com>
 <20260212001359.97296-18-jim.cromie@gmail.com>
 <20260212001359.97296-19-jim.cromie@gmail.com>
 <20260212001359.97296-20-jim.cromie@gmail.com>
 <20260212001359.97296-21-jim.cromie@gmail.com>
 <20260212001359.97296-22-jim.cromie@gmail.com>
 <20260212001359.97296-23-jim.cromie@gmail.com>
 <20260212001359.97296-24-jim.cromie@gmail.com>
 <20260212001359.97296-25-jim.cromie@gmail.com>
 <20260212001359.97296-26-jim.cromie@gmail.com>
 <20260212001359.97296-27-jim.cromie@gmail.com>
 <20260212001359.97296-28-jim.cromie@gmail.com>
 <20260212001359.97296-29-jim.cromie@gmail.com>
 <20260212001359.97296-30-jim.cromie@gmail.com>
 <20260212001359.97296-31-jim.cromie@gmail.com>
 <20260212001359.97296-32-jim.cromie@gmail.com>
 <20260212001359.97296-33-jim.cromie@gmail.com>
 <20260212001359.97296-34-jim.cromie@gmail.com>
 <20260212001359.97296-35-jim.cromie@gmail.com>
 <20260212001359.97296-36-jim.cromie@gmail.com>
 <20260212001359.97296-37-jim.cromie@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 126EE1288ED
X-Rspamd-Action: no action

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __drm_printfn_dbg() gets an
unused variable warning/error on 'category', even though the usage
follows immediately, in drm_debug_enabled(category).

For static-key optimized dyndbg, the macro doesn't actually check the
category var, since the static-key patches in the proper state.  The
compiler evidently sees this lack of reference and complains.

So this drops the local var and refs the field directly in the
macro-call, which avoids the warning/error.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 93dd714d4533..ceede094ff13 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -213,9 +213,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
-- 
2.53.0

