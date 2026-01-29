Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGjyGpAMe2nfAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF9ACA0E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7069810E7D9;
	Thu, 29 Jan 2026 07:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RyX/bWNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56B810E7DC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:30:17 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id
 5614622812f47-45c962424daso269516b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769671817; x=1770276617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGsz9erGUhMjPGOxoaearCe+6L/KMh0lW399GvOTyUQ=;
 b=RyX/bWNXlvS5T7g94ERyFMQXW3G2erGjFxJDUvh+0BMWiI73W6QFnXFyVGbAdoZBpR
 9k24tYW7TS05exK5hGoLZ/kkMJB5aSI9NAi8u5Fhc1qzuEI1IhObbIUIqEZ7URtNcDen
 NvFbSI3G+ipJmcmyAuc80kDGklXF43qVPpp+IYd0zsdZgU8okKYwvkBTZ5gmXMnGPyuo
 W59Sj7Pw5cl2ORuc9QPL2+vpFIpH00J4E0/sApREJbqNPpkQpbW3RYwjl008DXxQeZzZ
 uUwh7ShHoJ6R1fS03ou/ktX248DyiOQfCQIgzatpbxRw7SozgiIjP8eZ9EGNLY8cT5/z
 zcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769671817; x=1770276617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YGsz9erGUhMjPGOxoaearCe+6L/KMh0lW399GvOTyUQ=;
 b=PBgch3X2kOjj2bm+dJ4I8UVV0SsP+rF77RBbGgVZZyoOG0bEva17fDFRntgYoBdxcb
 GesYlMZv5+vAPVteC9GDbnFo9dz5gyw8FKV06enjbiVmYrPh4gyhtCxJk5bwKIpyzHe4
 4UDyrpiiiZgee2mSy9E3mFKFB+JW/H+Eugiw+BlEQZOy0FlzQHyiHKTYIwdYC7UYyfHF
 f6TFp8ieN9alaFugkC9VGXqnzg613WE1Ivf0Qa3GNC9itiDE6HXxoUzlvm3zwnVugjpO
 vCUl8N3SG6uu4wRv56OWDEUxdd3UbUR74Ghty2n2ryTLSrrOo95rLWNo7lUCSciHd97o
 v4TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDD6mOfpcqWhciepBNMvAPlpxlT1gt2DmEQY4ioDorU79k33ZoNLr2up0qTzCKMqsODQVAtAjZwTA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdX8ZmZpoI4jiJW8ZHacISpW2Jyog/hkXk135skk/WgrS2EyWT
 OVnBYrQAAd4OeJI/PoUbbM3uWfwiHrfFeKkuolqO1nGkAv0AVJosbrK+
X-Gm-Gg: AZuq6aIklZ1Ej4yH3dXN/aZ0FswOQNYB6o8XwKEZhrn1AbwBWRcQbt2hJ3SB4sS9cBn
 oHXNps7L9mHUOJVSMyl5o37NKp1iXkQU26NTnxG4XGe6PVBcclhhuNogbxiQRbgA/OFkd0BWcC6
 IxAfyr7tVWdojrus0L9YxwmlEP0DBzv0Kq64MrIpw5QCAJHimXLDDRuriLFClL72t7l1uo1sdHU
 kW63JC50G6A3vwIDmwMae3gas5ve2SAivY8ek2U/W91Wrrq2XKsHZ3ato/ZVyhSsN5Ms94iOInT
 ngZLfE6NED4fmdpI3daKaH4+DPaWGRyvLEV9l6JfSYx/CperuPqEr//fOKYfVVVoLWa4IheA37k
 cAu2aIiau0LNjuS+3pQk6fuY5yUs7eAflOyhTpDY2emsZkctJxrQyu9YI2hJhUokHA9Kvpo4RdJ
 xIiQKgm6MxCYA0UdP8cAv2mW7a+/sfEA0H+lvs+5oz5F6ZXVEaivU=
X-Received: by 2002:a05:6808:2f08:b0:45e:b6a5:c6d with SMTP id
 5614622812f47-45efc67e199mr4344900b6e.49.1769671817183; 
 Wed, 28 Jan 2026 23:30:17 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-45f08f20d7asm2611894b6e.12.2026.01.28.23.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:30:16 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 07/32] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Thu, 29 Jan 2026 00:28:53 -0700
Message-ID: <20260129072932.2190803-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
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
X-Spamd-Result: default: False [2.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:ukaszb@chromium.org,m:louis.chauvet@bootlin.com,m:bagasdotme@gmail.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:pmladek@suse.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,chromium.org,bootlin.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,suse.com,linuxfoundation.org,vger.kernel.org,linux-foundation.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1DFF9ACA0E
X-Rspamd-Action: no action

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e7578507945a..55e07b706c84 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1166,7 +1166,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.52.0

