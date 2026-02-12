Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B6AHowbjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1718128867
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE76510E696;
	Thu, 12 Feb 2026 00:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eykxYPR5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com
 [209.85.160.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DFC10E68A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:59 +0000 (UTC)
Received: by mail-oa1-f68.google.com with SMTP id
 586e51a60fabf-40438a46d7cso4152240fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855299; x=1771460099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wf7/zBvOgrITLiWTgUHE6tkvA0Ri6ORcXp17wBs7VZ8=;
 b=eykxYPR5Lh/+czVxr+0EI3GK1ynlCvSeQur2YlGvebKIhpOdPzZEh9so/EgESOSNoP
 Dr8XMQu2+sf/Lhv+8WkKkQx7SGGe2caz/wzFlHjG+eiriFbGOGeK4+ac0/BTRtCWxQXV
 GJ5d6bDZbGWXNOt3Ga5v1dJlRlzr8SnnywvnXRwbPmwcm4ERqvg3a9bkbQJ4uzvxkPKc
 lq416K/0s/KyGsQzv7hEPf9ABsYSQx0GaHYkxwo0vMhpMxw++N1NJ6CK7lF9m7tUbLhn
 Ir+0CmeExpIT7IXOcb1y//KbPM8WgwOWhFUu6EY0ocX+bA8IKG0+auTvpCtcJSy+KYz9
 uYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855299; x=1771460099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wf7/zBvOgrITLiWTgUHE6tkvA0Ri6ORcXp17wBs7VZ8=;
 b=GwMcJA95ZqZdjNuIy9Fd5cElOZwGg2XY78W8SD3CodXU+SoK5Ob9uycNRt7JJGYmyd
 Z+dpWUVse9PD1o27w2vV9ZMdX0d3mREMjf5cdVsUEba0Kz1T+5tyQnYRcQWyR2sn8Fgx
 JJ66Sc12QcvHZdBa2fO5p9iY4Zf4Wu653D1EjU2bYht2pc0OewPxrfmOn4pbqqQUrAGL
 4SShwfimXf3e2m8pVnsPagB/vWE9TZbrnBEeYxWLGdWYTlw79X1mjTc2NzhVHLLMoZjm
 JXEa18MuDmuYhaunbRvGgmf7cJR7amnTbl6Rp4z5wygbDS0WI6kGzp+w2bmk1zGYcxCA
 +VYQ==
X-Gm-Message-State: AOJu0Ywp2vru6dipxD66QqXi9eJrKGqzpIMecZewAJo3brClfpI9P1yA
 4aJgx2jhsX9x4V3uCPRiZrvXgA/s+v9e9SM5nuwQOv9dD6tlX714G/NhzcmJHs3N
X-Gm-Gg: AZuq6aLzIXrqYiOHEddESbHyhmT6v+3bukPc/ijlbX2bGvxmpEbamKYM42ctc8ufCI9
 HJ1UyKBBgrLIjk3ON3NkyzaEJ2lFhgHNdFX+D/S3H7n9TLq490XRYogrWA/pMvvxN+HHF8KXImT
 8qrDTRLw+flJLW1PTYHhVsbp1C63w5GJ69Y3BRvmF4fOu5gIhhcnNGiYhiWx7Ct1vZUXRe4cphj
 IDuZi3oAV4XXmFS6f4oGbPG7Db3BKzewmcYnMvWfsG+vDoVlAWqECxdF1e1V0a0DFzLpTeWfTWV
 oWv+cRR5y0zS9wJTDvvEl+IpplRawkWI1KCxfIxsgBX26O0/s5qQ6wt1a3R/boINTVmVDrTcdhg
 kozaOWp1n8auolcXquxfDSA9ZWmzwxGXnu15HQhGHgqqnLY8fhN6uJroLYZY1eG9PI6DGlVnsjB
 ohbDxe4nyDXKrA4WzQ+NmOllrC+VvAIdlLDv28UoWDyLmQGlWJln0thz9+z7GW72g=
X-Received: by 2002:a05:6871:8003:b0:3e8:5127:e75b with SMTP id
 586e51a60fabf-40ec721331amr635421fac.30.1770855298858; 
 Wed, 11 Feb 2026 16:14:58 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:58 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 43/61] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Wed, 11 Feb 2026 17:13:38 -0700
Message-ID: <20260212001359.97296-44-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-43-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: F1718128867
X-Rspamd-Action: no action

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe has
drm.debug callsites.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index f931ff9b1ec0..340e8ca91281 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -21,6 +21,8 @@
 #include "xe_pm.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * DOC: DRM Client usage stats
  *
-- 
2.53.0

