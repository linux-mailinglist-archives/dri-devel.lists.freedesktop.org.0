Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE812A550A2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E5E10E316;
	Thu,  6 Mar 2025 16:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GLwilzkx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA9E10E18D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:26:07 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ff6ae7667dso1672240a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278367; x=1741883167; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bwdp+8POnpYEEnQ2mWPyy8f6+vYv2yxFxSEYWvX3Jsg=;
 b=GLwilzkxScUzyvfC22rljnF+sRuY39WpPar9EhY21LUvC2KIvYxKv3oEKykcITcS3Z
 3IisSaHLXYuXmwJwMhWs0zpJ7b35Bhw2eO1rSKqS/ZBxlkOR6imLhz1NuA/BzTWXK/A/
 6cmXUBcTrez0Io6SDwIK2Enw0xpT7CsBgpq+aB/8hBBuCHIVRpNeE7mbmbo6/gW6ssZ/
 VMyQ67+2Wm1+ifgpp4joLVOgliQ3STZbMT0GQlhMJTBzIWkqfuGI7O7FgwJECeHQ9B0S
 XQ9Vwnja2+LO0a5H0igeQe7H/ObrBfXfZ+2sj998vlZaNSnIdb9I8HCPYOrqjcl5gq+V
 5ltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278367; x=1741883167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bwdp+8POnpYEEnQ2mWPyy8f6+vYv2yxFxSEYWvX3Jsg=;
 b=JKMFtFTMSbCpnm2kr8Lf5fEtQQq9IvHu/f6UdmLAEt6dobziq93x5sbGtYdcBmzcLm
 S7gekPmOlRrxxkoRrlOHnTjtQlGjUiCYPFaKH7SbHJzXjC7HVZB+RJ3n5Yn51hITH3MC
 /Mx8fB5VirKRqmEK/hMP+U4d78TEaTzCV9NZ4TWBEs4/7snBtrOn6fOdGAzJFwcQWETQ
 erD5l16fd8WqFy3bsPCpRhKRRn6l3/fHIcXNJMbYtcNGKQO7ATVCcwACr/851dMB9L7H
 b9M2oC/vi9EmRnsFKO0i+vwATIw+Vx4Hxfg5tzG6DlEmdjj5OpRKDe9OwXPqyEJ0av8Y
 5LCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPgmRT8uEEEKG03X8flJv4rRPyyOMIF+IXlp5dNTYF9vDtmqCLCNDaZiCFYryYSQ19ZofxRt8Nclo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpPjC1eXGoAPKW6IW2WwnGLSyaGqeeIUueAXjRfoGt4KwFZhXT
 pnxjFP1MY8unFhi4e1WhgDdSj33BW9a5srdxsUU9P6p1Mcn0uuZS
X-Gm-Gg: ASbGncvyJF2BAu5ACG4/jV5v8MH5QYBoxkZJahEccL0THJF7NxdnAVZ2OL1WSEcfpEb
 nYWOf46neUNvOAzDr1QsSH73AoT8QjLhd6wnW0ODtqbMM6kYbOPBa7GA0JBXeL3ZDjeDJscyEaO
 fkiDgnH60j7JO6lgUeij5q3+qnK2Uw7y8u6DdTUJH5aq0ZZgHpQidjMpZOGxJT1mwdnTR60bIlH
 JexPxwPZlzwVRdDv6cuYjfJrEYre912sdiQrC1psfXoiyxoFbcOa2lNNI3axm2yZPlDo29tyrEZ
 cT/8PvspNPtZslJFglcKgn1Z8QUDoQxmvBnD7qFtBFDbNUpbhubR5g+gVucs/AHxMw3SZjghDEI
 =
X-Google-Smtp-Source: AGHT+IFHH+1zpB7N9XuTVJAOvoyUY8hkKo2wZOm3e52unMZzsjH5Hx1bGZW2MZ4mGhzudOerhh255w==
X-Received: by 2002:a17:90b:4b44:b0:2ff:7b28:a51c with SMTP id
 98e67ed59e1d1-2ff7b28a652mr259914a91.34.1741278367078; 
 Thu, 06 Mar 2025 08:26:07 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:26:06 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Date: Fri,  7 Mar 2025 00:25:26 +0800
Message-Id: <20250306162541.2633025-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
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

Change return type to bool for better clarity. Update the kernel doc
comment accordingly, including fixing "@value" to "@val" and adjusting
examples. Also mark the function with __attribute_const__ to allow
potential compiler optimizations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..44e5765b8bec 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
 
 /**
  * parity8 - get the parity of an u8 value
- * @value: the value to be examined
+ * @val: the value to be examined
  *
  * Determine the parity of the u8 argument.
  *
  * Returns:
- * 0 for even parity, 1 for odd parity
+ * false for even parity, true for odd parity
  *
  * Note: This function informs you about the current parity. Example to bail
  * out when parity is odd:
  *
- *	if (parity8(val) == 1)
+ *	if (parity8(val) == true)
  *		return -EBADMSG;
  *
  * If you need to calculate a parity bit, you need to draw the conclusion from
  * this result yourself. Example to enforce odd parity, parity bit is bit 7:
  *
- *	if (parity8(val) == 0)
+ *	if (parity8(val) == false)
  *		val ^= BIT(7);
  */
-static inline int parity8(u8 val)
+static inline __attribute_const__ bool parity8(u8 val)
 {
 	/*
 	 * One explanation of this algorithm:
-- 
2.34.1

