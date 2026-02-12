Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDzqKoIbjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637DB128849
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F2010E693;
	Thu, 12 Feb 2026 00:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nq/PAcQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1627210E68E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:53 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-40ea36b56b7so1442737fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855292; x=1771460092; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=26vMP3nfkpOdAIVisqGbQnZnw5iiyCO+aaCVYuAOEzg=;
 b=Nq/PAcQzij3B77sNUe4lYf8M3Smn/016pKJgHbsq1VpU91pbuJs+PJa8HwXcujunwr
 74cVCHnPrlg18aaMRkFc9pqE3LaWvENq6NV2tpxeO4LAPE5IPv6XbT9Yo/ySY6HCxla0
 iHUekH+FiaLEozvsYb6ISD35NMqC0KLgqP3aJocC2tiQHJVesDtVQX+spoEWaxiuNk3X
 oi47kXoB/MsPz0DQANnJY+2OPWc97MvFC29hci/neltFsg/9ZH7dWyKAm6al0ZOhlzz9
 Pz49cbHLROs+Stzjzan39mcCp2k77/oH9xOcKx7XVDLH9ivzpAzRx+8TKFys0xqooTzl
 VGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855292; x=1771460092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=26vMP3nfkpOdAIVisqGbQnZnw5iiyCO+aaCVYuAOEzg=;
 b=AhcHE2L1eB6qYV5jvQ7/vWioY3Izr4GCKjeWh/uMQa5u001GzCAisZeiG0hNPEVU91
 WvWii3NwI4orI/DzIu1ED0MOaL2aVymAgRoMJ6UopMvW8lF0lveHlJS8unKoCjjLU+lk
 ORvOpAZzFNonO/xEq/yqEnRWrl0ZDU3DKGaBXkILT34r/8IrYIh/iTZZcyYgoiKwEkq6
 gAASh86anS2dMh9RTnx07QqbTEXwhpyqsVFj2/iYS1A/Syw6cqut7pU8owrxbX1KNwVa
 cp2U3Dz2hjdqyfvglPKFKCaDCKTc2Pdp+mTZXYJHpNB+eYsYlIdLjd2zAKCKxHulYfzl
 kskw==
X-Gm-Message-State: AOJu0YxUrCuVzz1CDrLFehy+K8PAnwZBcJvFfgpgunBRNgjpjwKMmw44
 8PVcH9GpjjFwO3L7ZY5ur50py9+ShIy5qLQoXeG5vMTn1WmZqMUx8Zwv1DUOhQ==
X-Gm-Gg: AZuq6aLzFvhMy8fUIAYNLQa26YGt6vwXV7Zh0Y8+Gz6t7MzEHnlo/mbkl58zugafl6X
 Uh+e/+f1cdL5hCAnqkUqKsFXA5YnmurMTosWXoawwEt+jK7gS3QEn/8oO9L2E6HSUHPtAoznUnX
 7yYLZRXqS06yGdqLFFH2UBRtYzfJrKDNQpg8IRBCK6u/pE9/DVtcFFq4HfqUF8PQsth4cbVrm00
 gCH+bVLckHm4fMoLvKd8jCVkODCOKz0ygQDAh1UqS+d8RH+EPRdvsSmo6plkmtIX+gFns0F5mbp
 x8fjHpZtE1a1QDg0X75zV/GbQHfbvr8wYfyJtfh26tHPg1aHxAJilF35WJofag73Ub74FHY/LXi
 0qh5g4P2Ko5GNDYXAqE8R1dLfbqKYhLqKfD7JmI+Uj++NP5a/Bj6IORbxTPQTPot0StnwXxLu7S
 hocQCQauSd13V+GJ2dGSPvIhpLBIz7I+iQnvNVSJ4DJSzn1K41HhJP
X-Received: by 2002:a05:6870:36cd:b0:409:4570:aa63 with SMTP id
 586e51a60fabf-40eca2fd9femr276441fac.49.1770855292177; 
 Wed, 11 Feb 2026 16:14:52 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:51 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 36/61] drm-print: modernize an archaic comment
Date: Wed, 11 Feb 2026 17:13:31 -0700
Message-ID: <20260212001359.97296-37-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-36-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 637DB128849
X-Rspamd-Action: no action

In the year 2025 it is no longer noteworthy that drm.debug logging is
adjustable at runtime, via sysfs node.  Simplify the statement.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 94064ec6c229..c3df2f3f47d8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -89,10 +89,9 @@ extern unsigned long __drm_debug;
  *  - ...
  *  - drm.debug=0x1ff will enable all messages
  *
- * An interesting feature is that it's possible to enable verbose logging at
- * run-time by echoing the debug value in its sysfs node::
+ * You can also alter the logged categories at run-time:
  *
- *   # echo 0xf > /sys/module/drm/parameters/debug
+ *   #> echo 0xf > /sys/module/drm/parameters/debug
  *
  */
 enum drm_debug_category {
-- 
2.53.0

