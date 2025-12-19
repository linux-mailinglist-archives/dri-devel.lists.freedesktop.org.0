Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B386CCCE288
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 02:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEF210EC3E;
	Fri, 19 Dec 2025 01:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZSIVrwy7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EB510EC38
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 01:40:27 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-64472ea7d18so972735d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 17:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766108427; x=1766713227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWXueLrhDneeDmCGizpSHzMSgAg8yMgxTmeT/qXEn+I=;
 b=ZSIVrwy7q+GoR+DjKxlXoDjg1q1WRDrpQhklYWo7mM62S451u/6EIQGq4Ihp0SRnqe
 LcKPDup+3/cTHH4VgfIJhQY/P/jGaoA7Csd9sd5Wm0JruAOgMoYNbmeBFo4ynvaV/c3/
 ZxZf9NGQXqZvrm8GymHyvqoHCh+wgDedJb5HF/HA406N1O9eL3NydHK14dM96ZTDEyga
 6hGtRbmXSlgSdbmPjnk8uEnMWuClyUyGelSwFHPwZuXu3Wa6loQDzbuzzLOxaNVtZxaO
 cppyVGw4kTt3IAfBEQGKG8Mcc3YH9J8PLT/d2E84a0JLzLO75PXHe4+ud5CbyHtKoWy9
 yznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766108427; x=1766713227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TWXueLrhDneeDmCGizpSHzMSgAg8yMgxTmeT/qXEn+I=;
 b=uYsRbH6oteD4yE0Oi36QXdTn8kXJNih0rY/Z2iIoyqhWXQ/wdcvQ8Vrp5uLISFkiyk
 aU/LULUnhuhV5k5ynwArL/W44Ii9DgsX3tTW7LCdqxL9RrqC4JZKDJLxqfYOuEWuYtQH
 8Z5kRvbjpot+Ts21p/xOMO16NsrrkojCAamBvyJf9EU5XsWnxSL9Fw7bCKIN5JECKZnW
 W7Cwq2qKrvHHxJe3APNGdl9r1peUCyA2syQd6l5mxASgy+uYABsuibPvj/YZJ+Y+eKtG
 oLYxdBj7lxDw4dWTzN5llImrE9136Iswi7VWRb56AuybdAWIG92QMVXVBpiVo9gpph1n
 j7MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1eQO8FAYHejeQzWp/GycRh9EfIvFSxnVatDeFmxxXzi/H9TCzjtS6zeK7nlAG6/xpe3JS0SJiBpE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEYfcbier4ecx4y9byj6rJpJEbaaCHI29ImQ5etBBY/Zw0nlS1
 WFEF5QsS0waOh4sPrz7CCL/sfSHLbTHHXrZn7WZYpq7lNaRq1FtZ9b58
X-Gm-Gg: AY/fxX7NPth3WIqkHrrFRRdiRN/Ah8a+HCXwTokcLk5dnJcP7OvX818IlKjHQ5PARbd
 ofe18aUSQtIaLEnSMs+cSo7rR+IWIplXm+CHiYyMWTJUVxJ42d6MxN6TTyJ4LHmhYpfDaMwMN/g
 3ntBuNPQaQEW9MU+MdHhxmKRbpywzvmhXPU5ceetak7d72itYAVvOLQCOtG+8ZIA/IABwbtgQJA
 pAtG366byxnqM/FG3K739/+QeJhUmdT1enY6C7bkS3BPgZ0ca9mX9R6+D09vWIFIdzCdQm1mcyK
 IRvwyNchtrRQRsz/2QuG/7ztAx/AKhfU0v36rrulh3PFM/LTXrMFQc9nG6wAGCyMP8s5iBMJQt5
 wGz229o3nZhUT6OIJ837K0toSOQl9FQXVDJjkCLTp/lAzpyZZix3JoJCLv02XvI1213adj0x0on
 kc0j37lekcoTN4m/Y6sJh65w==
X-Google-Smtp-Source: AGHT+IH3p9ADp/oHBdoztOVSqKQjC9Vqk5imr82sTyt1OVvJnxpaC916KbcOtyFMgx08q9d2A6awgA==
X-Received: by 2002:a05:690e:1a20:b0:63e:145f:a4bd with SMTP id
 956f58d0204a3-6466a849f02mr942310d50.22.1766108426712; 
 Thu, 18 Dec 2025 17:40:26 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-78fb43782bfsm4425717b3.5.2025.12.18.17.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 17:40:22 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 27D7F4001B5F; Fri, 19 Dec 2025 08:40:18 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Media <linux-media@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Max Kellermann <max.kellermann@ionos.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Vitaly Wool <vitaly.wool@konsulko.se>, Harry Yoo <harry.yoo@oracle.com>,
 Mao Zhu <zhumao001@208suo.com>, Shaomin Deng <dengshaomin@cdjrlc.com>,
 Charles Han <hanchunchao@inspur.com>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>, Thomas Graf <tgraf@suug.ch>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH mm-hotfixes 2/4] textsearch: Describe @list member in ts_ops
 search
Date: Fri, 19 Dec 2025 08:40:05 +0700
Message-ID: <20251219014006.16328-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219014006.16328-2-bagasdotme@gmail.com>
References: <20251219014006.16328-2-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=896; i=bagasdotme@gmail.com;
 s=Zp7juWIhw0R1; h=from:subject;
 bh=1tOY86lhWOCbSHsqmK/tuDEilXGPwKXl/15tM3wSixs=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkuqxc3vZ90ZFcEw8Rtxid2Hom5f4yhYqXFcq57N+59L
 vj0bM6pRR2lLAxiXAyyYooskxL5mk7vMhK50L7WEWYOKxPIEAYuTgGYiNE2RobF7lMmi/C/YzPS
 7fCZWpbXxTBf8soDN/VTbIlqj6/Ud19jZGjc83oDg/Gns/PlE4ouzVAQWMm0aaeV5R+r5y+cjA4
 wf+EFAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Sphinx reports kernel-doc warning:

WARNING: ./include/linux/textsearch.h:49 struct member 'list' not described in 'ts_ops'

Describe @list member to fix it.

Cc: Thomas Graf <tgraf@suug.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Fixes: 2de4ff7bd658c9 ("[LIB]: Textsearch infrastructure.")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/linux/textsearch.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/textsearch.h b/include/linux/textsearch.h
index 6673e4d4ac2e1b..4933777404d618 100644
--- a/include/linux/textsearch.h
+++ b/include/linux/textsearch.h
@@ -35,6 +35,7 @@ struct ts_state
  * @get_pattern: return head of pattern
  * @get_pattern_len: return length of pattern
  * @owner: module reference to algorithm
+ * @list: list to search
  */
 struct ts_ops
 {
-- 
An old man doll... just what I always wanted! - Clara

