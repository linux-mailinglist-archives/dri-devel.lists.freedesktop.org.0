Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48D5B191BB
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EF310E1BB;
	Sun,  3 Aug 2025 03:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hG8m9Gz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79A210E05F;
 Sun,  3 Aug 2025 03:58:36 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3e3d0cba6a7so12044955ab.0; 
 Sat, 02 Aug 2025 20:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193516; x=1754798316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfwMXVBLo5LDCQiepRGuFL3bGQZQgq3Btw/uQ5I/5wQ=;
 b=hG8m9Gz05o03DiYKVD866FUHkGFfW7hae9iHRw07RRG1m3H2PLFTXSfKhHw2TNCATw
 qOMFO6ZuCSwWLUCRQVHath3j101RZOnTrncTY8A+tTXK3ZPTWdz5kVm0Wz0Cdaw0ycQi
 h3enrfE7HpAQBEZwTQLARn99TIFd2vuSjK+8RSQCklQ5u9WjafPfrYAZSoiUg4dJFnDH
 x8Q1tDcYqUtGtUC42ZBdedSGc9A+illpKbN2KcNJb/DETs8CmITJK8z1O6lGXLBnLvCH
 DuCwcw9IwrpUsd0Mz2jiFsKY3n0l/rzNfl8orTP2Nlca2wWheLOuvb7WdO2UrH2zZLsj
 mFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193516; x=1754798316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfwMXVBLo5LDCQiepRGuFL3bGQZQgq3Btw/uQ5I/5wQ=;
 b=e6tgII+SW/agOOSKWwJw7VydDI8XybG843q/f3i1ZaK0A4yFqh/Q61HwoN6eoK08/z
 XlVQ8ma/L2FKLBmtKdLOcbcvK43fHcIJPEx1628SzuHh9VXy9ZJ7EEJg8tU99CEJd83A
 JGXxX2FeY8c0TmvVgOuCLQ2gPbCFVu/4V6hBOvcUmn0RODyZbaExTMdenrXTbxt7nLQV
 +yZjb6uCZmRTCZnPQwq3Clq7tjkCZnAsmQlZmj/dKYUJrspNU1o9mWNax4cBTM9npGTb
 galBGpdj54ga3tk54V7/3NK/2a4/5PCLqjphM3RLVZon3JxmfYniezG9Irjta9KeTp/U
 vgZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1fR3qP7Fva8mwJAphuOVZa3pyMVD06K0LnlefYbXP3JmN0c6210orGhmVbjcX5Oxi7dgnPD8NkM+nSxG6hQ==@lists.freedesktop.org,
 AJvYcCUoy9xVaZ7hiCCRNMufvy9z+i2nhmC5pocGx4EFSJIjS2eMVoFuQeXeziPDEoohL8X8vQLYQkEphWBs@lists.freedesktop.org,
 AJvYcCWu2k1y5JjA1Xj+TKAhBGavqz9hyCNK16PmFi8iLkcRS2J3qFswgd56oHdyVD96ByV4J3pX3joi@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx75BRb1JsUfkAHs42xMfOn1Fe/IXP/oVFoNOmhTKc8gmV5HfzO
 PUxMRNlscVhAepLS+W+/tTmp1dvceLBEV4KAfcpsFo7USys0DGcHvnEp
X-Gm-Gg: ASbGncvUXJ6jMDekC0i/dv5bsN3HG6IwtkoTYAecEDm1CFjfv9Jo6pKF79ajSjpssdm
 wHa/gqUfoP0HeksjWIpyth9LVL8xejToJxSMDl5krkbocNKcJgd8iDhueVc4U8zk9XldREUWBOA
 8fO3Ls12L0ptlhOwKe0H3WXhOEtIzIgjL22KOI2V/mid6DQ9Nxl6g7E1W+zPGRpHjHhK7Nm11nn
 imJYDD5ls0YJm+4TOVUWOBeDd6jlTb8gYA7h95BWG6gc30Iz9DPlssrPxsWR7ttlx/OKk2+fUk9
 K9UI5LsDHj8FO1nPcgdOhrXYYudQe7C0tkMhT7ogFLW9xnv8Z9uAyL9ADxMcQ6wUrrYmfVZ3VXh
 8c3kmORNj10I5rAZm4/vk/yPG7d9ACIol0Dw3di+MSDQxOGhI3hic2j46wKEpyG+4xKYqMyL9Uc
 ImFA==
X-Google-Smtp-Source: AGHT+IEFfqhK3Yu96GZwkzn3H2xfn17hF1ni9VF+BRmo2ZqR7bTqyB9jhLRitAgzMOgRv2m2JMXKjg==
X-Received: by 2002:a05:6e02:2612:b0:3e3:d8af:3847 with SMTP id
 e9e14a558f8ab-3e416181770mr93924425ab.16.1754193515916; 
 Sat, 02 Aug 2025 20:58:35 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:35 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com,
 linux-doc@vger.kernel.org
Subject: [PATCH v4 02/58] docs/dyndbg: explain flags parse 1st
Date: Sat,  2 Aug 2025 21:57:20 -0600
Message-ID: <20250803035816.603405-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d953..63a511f2337bc 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,9 +109,18 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
+Note: because the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword values.  Flag errs will hide keyword errs:
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
 keywords are:::
 
   match-spec ::= 'func' string |
-- 
2.50.1

