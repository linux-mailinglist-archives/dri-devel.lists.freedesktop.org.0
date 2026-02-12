Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHzHLJwbjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA31288DF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E29B10E6C0;
	Thu, 12 Feb 2026 00:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cKu1+PxL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D386810E697
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:05 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id
 006d021491bc7-67242e24be4so1651083eaf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855305; x=1771460105; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cNJusfF9NIqMYQD+JrgsPdBVznNJP7QjaWZHV+FFebs=;
 b=cKu1+PxLN8lnwdYGFuYK0vL5f8l6uJC91kkSmZSKshKKUVb8iLemOIbVufYaBQ8gH0
 INwlHPbmbGBCGnkIfcum2vCm6U0e6MCp8exhHbcK5VzgswgTxzC2ff4mDlySsvJ6p+nw
 E7ho/EH6UoDCfc2qPZe9oMyI461q4OUWO7Ms45yKazMD9ukxWqAW9NAojf+g3TDvTxhi
 UhDQh8gs+Q/fvcl1bgdUkAAZaOJbOirAWg1IQWn6BB9/ld24MKFBxMjVhFROmT9oJFlC
 Q9vO3S3tBliLAOUMIizmTiHUxB4FgftUkTTtJ1e8BWIyuM4ZnFDvLJHdKcyhf0rTDO3K
 oUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855305; x=1771460105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cNJusfF9NIqMYQD+JrgsPdBVznNJP7QjaWZHV+FFebs=;
 b=xMTi2BRyT8Dikb7zNoZJ4QUhzX4Iu61SFyEnYvD5+aRWSmiBABO0LvMNp50SR4z/6L
 MYAdYw2CetiRwMiHtMOywDiUPU2f68qwMkHN0/VJnZWkl0vl5fULv1Gm3HvY1x0aIulj
 XhS0FnOiIWllsBBE1C9syWHJnxyxNJP+SIG1z8EYYwlRMaZqADz4C/jUcd9L7fRiye95
 qLxZ5U63qj6FkX+bEZIceH4kO4jMf+7KniTXWTg695FT84z+rHzm0SH0JBTTHBQ1t2f1
 z03whcFi1b8WyfdPs3A50vK9N+2nwrvlYMIFfz4CXGeLj+gYDpxSqFXdeU31LkDeL6gb
 uVXA==
X-Gm-Message-State: AOJu0YxqsQBHP46wQTSrIpK209MDMN9fnaUFrxuRpsoMc3o2ShqEJjhp
 IRyklkXYKkQiTiGu663US+FdGnCHBLLQU1zVhRnhAh3AL90ujmvXYecLaDB23Qba
X-Gm-Gg: AZuq6aKiaTwHhPzMWRQnPDpTAtakT2bAM/p66mM9RJXRtBXjgf1kmiw0VZF4qh6rWDF
 VGONxjwbaaIPhtSIbti8QR0Ad02jiAOxnFMlN35aFtcne4UqjBoIixvNwktXqJlUfINYSXWdCqu
 WxbQN/+Pus2eVIIYsXxaMLZaqQJS+qSbUSf8LpQxzf61phXsgZ6lwxW5xpsaXGFNCpSRzayz8Ie
 Hi3YQ/usOCTqB7JBfwQ2JUvE2Ms6uIyWJ/yBFXmgDtircBPMzAsGyfDHe4J++6i8pbZXrD6q5E4
 xPsi+kGM5w0TaCS2HMCYUn5VAdTW2UkAWLSTyb3ar+zZ0ueOj7ypbSimcMFb/2U7KFLalwxPR1p
 kre6sxFTzAZQ0dOaZmu0H568slmtjUD4XPfh7/0Y1c6Q64lwI6i1BdrvbYYIBeuIFDiAuCFNRHn
 lLbjV36A8YGPko5Zana1R52whOu1RE5Gdfer6CGn2qLceIeYMZNI5L
X-Received: by 2002:a05:6820:210d:b0:65d:3c7:b57 with SMTP id
 006d021491bc7-675992f37e5mr524322eaf.34.1770855304964; 
 Wed, 11 Feb 2026 16:15:04 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:04 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 50/61] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Wed, 11 Feb 2026 17:13:45 -0700
Message-ID: <20260212001359.97296-51-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-50-jim.cromie@gmail.com>
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
 <20260212001359.97296-38-jim.cromie@gmail.com>
 <20260212001359.97296-39-jim.cromie@gmail.com>
 <20260212001359.97296-40-jim.cromie@gmail.com>
 <20260212001359.97296-41-jim.cromie@gmail.com>
 <20260212001359.97296-42-jim.cromie@gmail.com>
 <20260212001359.97296-43-jim.cromie@gmail.com>
 <20260212001359.97296-44-jim.cromie@gmail.com>
 <20260212001359.97296-45-jim.cromie@gmail.com>
 <20260212001359.97296-46-jim.cromie@gmail.com>
 <20260212001359.97296-47-jim.cromie@gmail.com>
 <20260212001359.97296-48-jim.cromie@gmail.com>
 <20260212001359.97296-49-jim.cromie@gmail.com>
 <20260212001359.97296-50-jim.cromie@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 68EA31288DF
X-Rspamd-Action: no action

The vmwgfx driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 599052d07ae8..4d8f2f3c8add 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -259,6 +259,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.53.0

