Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNEeAaAbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A11288FB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4199A10E6B6;
	Thu, 12 Feb 2026 00:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rzt0hydH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B55A10E6A8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:17 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-45f015a3259so2189690b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855316; x=1771460116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=itF3vwyXyfK+TMwyoU9sGD9iKGxLHHfMgIqK/qhk49k=;
 b=Rzt0hydHON3+GyZEDRZZ95u9dAduIeCqWl5S/5M6v4g70ONufHNSv8KhK2hUmB08Te
 uAoCZwZBMKtQKhL6WhlGLGJHz1UoKnVUPXoz32tQKrMWXG7mF++U3JLx/pvPaIr91yKN
 +29M4pjHgAUnvIY3ocpsYKpqh16yHO6mKG2gUEjZIaRKETq2761fYniBMGT838cO0JLv
 G8Hn4GhX+W48kJkL+PjOAHaY7kYUQxYHl8JiybSqSjsXGnZkAGLUmvYr09CRWK3f2Jxj
 S/vBBPKSAlRpdCQjtGNqaMb3XUmMzR7PqiLk1dL5TURo+HxVyKNdSMWcLdRQSyS6cqaQ
 +gQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855316; x=1771460116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=itF3vwyXyfK+TMwyoU9sGD9iKGxLHHfMgIqK/qhk49k=;
 b=O6Zrd87XjKCNJIKZsVMJ4qvXACu20pUi+RcFmriq9t2xvxb0mbH4PXqDoHtlElXxpw
 4Dsl3dQYTu9Jo+DnxZVo+JZpwJVJOZcrL6gTQ2l/ccEg2et9t/XgcfebhrElM0w7lrd2
 C/Ul3p7FbrpZJ1H6aKfoWeOLDSKMRJ4mRFAjnI6Uo7xBeZdiIOdWofWyoE135LIKj6DO
 4myCeQoPcCEjqC/5dyUpA9pRwSi2AaO6UyVHxiY3e3rgGbv9Of2JLoMUmIx7FvAHoKcQ
 d7qk7ziM08nNMdMzKgb4GEXmNV51PT/GiEVXefxBTbWBNwxMQleGVsvzoh0/y+m+1IKc
 OV9w==
X-Gm-Message-State: AOJu0YxixSkL9aeL7RH7h8QE6OmDCQWRKbvmlnED/pyGQZkvUB411v9z
 dviuFqMisd3gYWnmS1GMK1/Q2USVI8eQNVGhRhmTZCflaoXBSAz8Dfisw/Yc5Q==
X-Gm-Gg: AZuq6aJf+A2vIMlyMlMEPEBh0R1WCoIQ/x5K+T20359A4Cnl0wM8FOGXJxl8X/e33Vq
 aKwM5PyEC4jqpX0GLdwKE2xRdKE1eR9tk/yH8W0QVvLtP/UMcUsQZAX9QifARf467VvvZR11xn0
 vCPQGBMWJ0NLIOV8PyiJaf2XnaCEwlJK8sPOFsZjAYWo3rhTjucBJIdbh/PYekNVQ9yWXrMg2pC
 hRac9HBb+tbOl7G2a5fZWk+dPJ4F25U1eufmkO2n9zn20TUGSyxG22OKSRAS38Sla4or0pS4Fdh
 GveBbsx9irFluOxfxbS0tfDtQXBs1jhGNiKSoWqoZvHXbVsQbig2SbRne1ZJi3wDFgS4CMgb0u8
 f+SdflAY738GMMXKm821JdoURVSl7MOBhvToHY62GzP20mcpanb5iUWLJbM0Gv68uGqyY1CEkdm
 vUdF8QC5TjNpP05j5CYq5QqsU8FBp78H2+1uN0UeJuA3epp6af5xWB
X-Received: by 2002:a05:6820:1f12:b0:675:2e2e:5699 with SMTP id
 006d021491bc7-67598942d4fmr563272eaf.21.1770855316201; 
 Wed, 11 Feb 2026 16:15:16 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 60/61] accel/ethosu: enable drm.debug control
Date: Wed, 11 Feb 2026 17:13:57 -0700
Message-ID: <20260212001359.97296-63-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-62-jim.cromie@gmail.com>
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
 <20260212001359.97296-51-jim.cromie@gmail.com>
 <20260212001359.97296-52-jim.cromie@gmail.com>
 <20260212001359.97296-53-jim.cromie@gmail.com>
 <20260212001359.97296-54-jim.cromie@gmail.com>
 <20260212001359.97296-55-jim.cromie@gmail.com>
 <20260212001359.97296-56-jim.cromie@gmail.com>
 <20260212001359.97296-57-jim.cromie@gmail.com>
 <20260212001359.97296-58-jim.cromie@gmail.com>
 <20260212001359.97296-59-jim.cromie@gmail.com>
 <20260212001359.97296-60-jim.cromie@gmail.com>
 <20260212001359.97296-61-jim.cromie@gmail.com>
 <20260212001359.97296-62-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: A97A11288FB
X-Rspamd-Action: no action

ethosu.ko has several drm*dbg() calls, it must call DRM_CLASSMAP_USE
to tell dynamic-debug what classmap enables them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/ethosu/ethosu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index e05a69bf5574..242f4af37f18 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -23,6 +23,8 @@
 #include "ethosu_gem.h"
 #include "ethosu_job.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static int ethosu_ioctl_dev_query(struct drm_device *ddev, void *data,
 				  struct drm_file *file)
 {
-- 
2.53.0

