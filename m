Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K4ZDRQzqmm8NAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D830921A645
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E2710E2EE;
	Fri,  6 Mar 2026 01:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PX4ZsstA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469C810E2EB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 01:51:12 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-662f91bba0fso7283952eaf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 17:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772761871; x=1773366671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kg1pvIkGDhzpoqZiSRhgo/PesZkDB1/rihGlwx1MvAg=;
 b=PX4ZsstA23W9ANHLJGKInjgtZrPOrQmVQ4dUJDtASoI3qPHAxqP47KuELeMHfPyVsO
 K1iO6H2bo+tyr4yKRKgYhSoYd8cOvn+FS/7OWp6rVkpuo1cAkWq9WBrDOTKEz4sk8cOl
 J/OmP0Yd7wx7NA2bzBCOMAtpafroKpe2UxMRkurHoCEqZTC9oaJuJmOLaCkLFaajbTJ+
 YtwGuzQajGzpl5d4ccWim62Cr9XliIDl+BL91bEPleWENL/SK4VuTRoVuLQEX9Jc/uyi
 g19/Rwpc8Lppm5jBfCqTtEpaSqL33Ml3rCrT+dPizA3g1+rGa8o675Sjb+u2XysXPOkQ
 bA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772761871; x=1773366671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kg1pvIkGDhzpoqZiSRhgo/PesZkDB1/rihGlwx1MvAg=;
 b=FAcT1d8FuKzIcr0aFX8b16k01NzKGbVtZWTF65XJTF+12Uah/X1GKYJEVfct1xlyZV
 rSpFC533qq3wbZC/O9sXqZ2APKhftxoBp+ZzeQ7hNpi6iiTnFDP1GkXnSmZBxrRyv0Ok
 MsJ6CjS2OBB/bEvWBt4njzmjV3s5br0Wa86uihxcVqPvMzJGYEy4yyFUmPkroIPcyLAJ
 /h6nd1UR6fbuRunIs5bzhGBHdO4OVeseawra4Hj+H4LhG27OSZiuSOkkJHziY1WitVEV
 tVkJJKqrjSSWv45ZcrjHswhYBfNt9ndqN4Xi3XrUNAHnjFVw3BjgNZKbxK1mIgLUaOj/
 uk8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcX9lfDdMRg9kSqXuwZKCxVYHZ2CxIgwnlt1DaIWCHsXJ53kJJ6SoUm5sYiPmPTnJtUX0SU6dUnJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9cIdVJs0L1Wpr7dCiqROhLl5UdzB8x6SVVfgCch/rcvdze4N1
 6cveJ+DME/iKYHlOd1J8k6cqxcZwNTsq61HTduz4UuqtfroJl+H2FaaO
X-Gm-Gg: ATEYQzx6uVc34ohKQspodxGhkaZAH8EYEY0VBMiq3QROBKnMee+EJgZszDZKvhSvB0z
 XJcstmW2ozeoVKL2Qgd19yeQqraoOjWrOvaMfHZwiqyMKh4H+8XJaRSejD8tl1azL7/Pzf3o8xv
 mjvcgoj/wd8WdYgsyPiF6BwgEGmNsxZZbtBTze9nfw9LutzhCLipEavVKX2MDvFDaqQhYPOucO1
 3MBY7vwtEKRi4Gfx3x4UAwzZ+6DWvDMtNRmHXw7TukJhGCnhVcRYMD+qFu4m2J785W011p5zKpH
 eNssMUNEoMqOSn5FTtVqHXRkDrWcvkEt8XGAu0cT9uXvn3NMfFuKkyrXWkAjsG2MefADJWZgFJ6
 me8rRMV0CpzdoFhJhmg/DPnDng2BGHT07qESsMt2FdoNBvyfSPoRF1839U5Xdu42hylgoaWhxos
 NNVJLrxRWo4iXDc8gAMSfkauVw70R+ZdrKO15pQ/yw1mouBCoP
X-Received: by 2002:a05:6820:1521:b0:679:c5f3:b1fe with SMTP id
 006d021491bc7-67b9c35cee8mr289127eaf.5.1772761871399; 
 Thu, 05 Mar 2026 17:51:11 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-67b9cc1a627sm115245eaf.6.2026.03.05.17.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:51:10 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [RFC PATCH 5/7] dyndbg: hoist static_key_apply_queued up
Date: Thu,  5 Mar 2026 18:50:08 -0700
Message-ID: <20260306015022.1940986-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306015022.1940986-1-jim.cromie@gmail.com>
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: D830921A645
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:intel-gvt-dev@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:akpm@linux-foundation.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,linux-foundation.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

hoist static_key_apply_queued from ddebug_change to exec_queries.
This can reduce IPIs when multiple queries are submitted together in
the same command-buffer, as when they're separated by by \n ; or %.
It won't affect single command submissions, or settings of
class-map-params, which are submitted 1 bit at a time.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e555a8dbdc27..80fa8d2143e8 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -386,8 +386,6 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 			dp->flags = newflags;
 		}
 	}
-	pr_debug("applied queued updates to %d sites in total\n", nfound);
-	static_key_apply_queued();
 	mutex_unlock(&ddebug_lock);
 
 	return nfound;
@@ -719,10 +717,12 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		}
 		i++;
 	}
-	if (i)
+	if (i) {
 		v2pr_info("processed %d queries, with %d matches, %d errs\n",
 			 i, nfound, errs);
-
+		pr_debug("applied queued updates to %d sites in total\n", nfound);
+		static_key_apply_queued();
+	}
 	if (exitcode)
 		return exitcode;
 	return nfound;
-- 
2.53.0

