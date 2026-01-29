Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOoONYwMe2nfAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CBFACA07
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF20210E7DC;
	Thu, 29 Jan 2026 07:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WwgPVbZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com
 [209.85.160.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18CA10E7E0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:30:14 +0000 (UTC)
Received: by mail-oa1-f65.google.com with SMTP id
 586e51a60fabf-4094b31a037so277318fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769671814; x=1770276614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
 b=WwgPVbZM04UtWJC9VYtQJNFcOBY5B5k6KahPcToR5I7zUeYFIn4+6g2DvFfz4EgDYz
 s4GCgtXTeRm3wtfGhdhau0MAcUWHMsa8m+BuwKEGtjidR3UkqQMcroJPb4lSLJ2E+F33
 jy3VFEt1l99rTZ0asNk6KxxlWwbqSMBS883z49lO2fGmXrxJI5g+STBQdllAWtFPEFvg
 jdqbfpVh/rDck0fJSyv+vZef0OxN/5ppAEycCimH+P6IXo0pEzpUWHo4oR/jVbR0+H+a
 CvTDA6riQf3RFqqXwh0yKGOPnjKXdjZAPwXRuRyFffJpY3JdVLRfJ9iClyfUeoA6iTEk
 VHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769671814; x=1770276614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
 b=mQKaBH4z8sY9+A3RZQBeIm0e4bB7F5D7GrZy79g7EsTZMkNNRt+9+kN2Bl1ouDRT2b
 7JFtERDpjT5iW+VZLavw6e5QOqCKLUluORqDYEOsZA6479WKlRIECWxpQP7d6DPtdyUE
 AUw/524fnfKBxq717HIyvEidTIkhN2qQ12o5Ij+R+Y2YdoMopvPkz6LAb5rQeCn861q2
 TI0jq0LydEGdr7rQNcTxgvREydI8yL1j/DoTpVNJlcCNLnpsnj16B0XNEVHUYIr3yO1L
 rYndGT9nUedF1CN4h5UxUUexswd+CNLl+JqCaPLaPP49ZquVYwH6gd3NbGQNhiMh1DJC
 zZrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcxsM4cFeWNF7oJMyQC7KA6WISChhuzIUNMDWbbBzFWQdWN8DS1AYAsYjBBaXqjdvreJaW+Xgd/Wc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHuY11lJoUvyXjVBZBs1dFIUH3Yu23L9c7Dn2FX4RoZBqsuRKm
 az413gzlEpN0TTnMB7Hkixapzv5qWK1S84KcjZZPGma2dfuNtEONpp/m
X-Gm-Gg: AZuq6aIAZBmq3Rav1QfT8grqSJv9OZmAuyH6O15QGtjbIzdcuJ1lWdk4Bg8P+BBL1BX
 AHVnAJC5E2juSeOckWCvXoKa71LV4DJC8aLhO2zlaqGywtabJg8d0JIFT1RCLxp6wc2mNgiFE5g
 uqIXekkMGEo7ecVp6ZwZVCT0F/+oQeZiWUCBuLoCT/0u9OWR5Y1eqMlztSNdMsNkrc2cmuj59iB
 epN0RCBQCl4T/svGYSeX6/RhPJH+bj0wwX+mKS7ikO3IwfDIlmoseCuwYYpp4rZg1P7itxRNELj
 vK+h/wObQDDS7Zj16HyAsUwD2SLw2EYiJSZOICJ3EHl6A8X/IWACukT4tXikDe8pwFn0qMRwySt
 E/n/8tBL+Np/GyNzHB6iTZEinroSttZx7vDOmUaC60kYnAKD0EthUPGOs1IltIdEIqvImwpQgke
 T5SGfAtFVvZ95SiqQTbKo3jRtjt/Qhrv4KJHEr2YRO
X-Received: by 2002:a05:6820:440f:b0:65f:1296:76a2 with SMTP id
 006d021491bc7-662f20db184mr4107061eaf.67.1769671813988; 
 Wed, 28 Jan 2026 23:30:13 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-662f9961dffsm2868953eaf.5.2026.01.28.23.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:30:13 -0800 (PST)
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
Subject: [PATCH v9 06/32] test-dyndbg: fixup CLASSMAP usage error
Date: Thu, 29 Jan 2026 00:28:52 -0700
Message-ID: <20260129072932.2190803-7-jim.cromie@gmail.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:ukaszb@chromium.org,m:louis.chauvet@bootlin.com,m:bagasdotme@gmail.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:pmladek@suse.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,chromium.org,bootlin.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,suse.com,linuxfoundation.org,vger.kernel.org,linux-foundation.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 89CBFACA07
X-Rspamd-Action: no action

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..396144cf351b 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.52.0

