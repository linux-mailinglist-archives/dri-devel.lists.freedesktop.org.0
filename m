Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHUaOGEbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952FA12878C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBD110E67C;
	Thu, 12 Feb 2026 00:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ojp2pN+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D10E10E676
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:22 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id
 5614622812f47-45f09874c4cso4521966b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855260; x=1771460060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/T7xCe3QaPFPQYMK0AQupsD8ReBPm07UYUII+UU2Wzc=;
 b=Ojp2pN+ORjVMObSN4262Z88rnPG7nRZOBSlUhlfgyJ39o8mJ5bvHMLyu6rq6CcDM/e
 agHBN0layqyxq3LLw3cT89NAC4RhZs+SoiDR9tvOmmGh8dNoTGu57ZPWBSWvx8FIFj+e
 TrLrz2LuxHsDvv4/uWlcxUMyxAFxshMhm9e48bNuUxb4l7lt1hIEwhZjLR5SI9lgjujr
 ndwHee508nJIRFSaCH+tHsIaRT1zS4KpT2fPLE31h6C7ry+3khSsCidkcqe3pkb/GiBu
 e+r7kpkI9EubP9Os4dYLBswC6yKt/7ea7l2dt7/zZZfS8+LcAzCqXHAlQFx1ZmMBNiH8
 QBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855260; x=1771460060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/T7xCe3QaPFPQYMK0AQupsD8ReBPm07UYUII+UU2Wzc=;
 b=F+bU/a7tk7JI3AWL7HYJnd6/aLIiTz5zkpb51oZIBJDUA2cdDwNHa3jKpYXwrb6R9N
 0rOVetTSRp9GytwKlazWcf/FRQyUqis80xIQHnDevL2ZPTK5b6aWb535t+11ZSg6tIgh
 sCfk0rNnv6t00bmtgaJFDnMJkpBbZcm4yOFpxJ6VYU0HXuhnNrOwDc37nCO94y+LrkR1
 eD9pWWzwduB9ug8FEq8xYUHMxKdnRGcg7HVH8VNSbs6qGQCelRsVRSTJIq6LPbbvG7ZK
 okd2qqEpro2pAsy5ZbsBIMwt5gmGQQ7ZNpf278jZpfn3e96oxSutm3rmGx9WYdF7YaL5
 ryKA==
X-Gm-Message-State: AOJu0YwNEzoCQ1vY3P+adGFp/3HsNDdePODTkmwVu8Yyfd4QPE+Zs4Cj
 81SPBQEPqrdH60nHfdvU+I+5rye8LNuYHqsjkavAZ1gJY+Maz6aSzzp/IyD1Q3dG
X-Gm-Gg: AZuq6aK1AagIFr9BUwgYjZPATYRM8npG5jRCvQxRaf37zuHq++x6R5Vf8XPOtLcTfAF
 HWfKLMm/ndNXfFLSS48sdP+/Ps4YS6qs7hDEo2JzUAnSEUeAFC0Yb8P+L2lV6ke/Y/C0IjU/FXE
 8QgN3O8+f6o+rBY7fzZ0VgWeu8qVysDWpSMxDVQ8A4CgRQxrlnDwwESlzzFpmi3jT0N243gW063
 yr+/FJdUJPGM0abicyO7Ised6qqxblA0lUxnajLcipgU2pyKjp2eAqrQINaw8TYARLD6rJ2qF94
 /eIqJt0QjNAztww5wXvDL+09JFhY6VDUhhQTFqonKZkPc3yRACbeUFtfAtAdEebdfz/dv0p8T7H
 IOFI6pLnQkvoQWeqRzBJN4SfTWBtiYXrvTFghxNfimHCLebMUrN6DsFN+WDWN+3QWPleDr0frMJ
 2gBZz+B9R/eyNb+SpF8y2218bPM3UTz+EON+P06u+2959sz5BQ43yb
X-Received: by 2002:a05:6808:448c:b0:450:d504:9281 with SMTP id
 5614622812f47-4637b918ec1mr578408b6e.59.1770855260057; 
 Wed, 11 Feb 2026 16:14:20 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:19 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 08/61] dyndbg: make ddebug_class_param union members same size
Date: Wed, 11 Feb 2026 17:13:03 -0700
Message-ID: <20260212001359.97296-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-8-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
 <20260212001359.97296-8-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 952FA12878C
X-Rspamd-Action: no action

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index a10adac8e8f0..441305277914 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -104,7 +104,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 55e07b706c84..1d13e3ee3e12 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -811,7 +811,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.53.0

