Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91034CD4FA2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D1210E3D6;
	Mon, 22 Dec 2025 08:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Syu2tmjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12D410E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:22:01 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7d26a7e5639so4230645b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391721; x=1766996521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
 b=Syu2tmjspjbsxZBZzGro64cQcQxDsuaF1oafdwsRYTmhV8m9oLv/T5CGThXCSSQpre
 KwrMxpwtrWG5MJP9eiw0dK4sX9hEOF5Olgzz8RN+zkWTdm5bvz8yM1Iti+bTt/ma4xj4
 REgQJtNslUwRe6fs2prz34bzz/FH7AyHFkTIP3tyTqi3HrIOfPYmEEZXEY1qoPdxIhoS
 MG2flnVi8hF9xIDw2wcl44BbzQisCRQdSQKBB4Z9k5l1pHx2GClnvhHADK/gnD07xSVF
 M9MphcIiuAcEISZ/qBmS3WhnA70rBSHcMaUvKJFYaryXyqjUvSpYSkuvkQKDn0w7EpKD
 sV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391721; x=1766996521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
 b=sfjaQdHUNZjC7UaK6Qk3vhuHzRSd9S+EIrJz22uwuBglBxI6ylvSb05MRuMjwFEC5a
 5nMP6vUkdMOOA/4bsQKEDb7Xv7km1PvxflEyhKrFSY4P9bRhxnA0HspZcIdZ2gKPdbnc
 0FyrW+3qDZQfPa5wGumJfHRT9x1HYvzsNHrqb7cVIc/kOBQQuW93yOOaQUhKco61n0ld
 SFypBfvHll0/7Xr4LWYA4S4nX+boYTVZ0kmJNFeTOJffm3JzsMv1sQHG1w9tLWt4iM7E
 nY7POMpNLzVSyrHyCQuijI6ZA3pHVjpT0h6krBDO4qvtWFPdnLIlhYOAJ1RZX5yF/ep/
 uf4g==
X-Gm-Message-State: AOJu0Yz6/EW4K29NOfscuxDaEy8tCDcW1d8Axrr/zksNqT+bSiQMSarj
 x/kBpFooMbgyH6gfnUzpICueWl/bD5LoQ1fXEFvoxwsSmazjXLOJ2tXW
X-Gm-Gg: AY/fxX6Mu1hK4tJsLNR209CFNRVLMaXGX638uhPckgbMZ4H+cHJg7qZtPqvGFJBE0MZ
 w6Pw44nhY63NrcWNYAkdBfHINDjA6JxdqW+PiBFHYfgK0lUJs1EmV9wpGn8cC2s7pkoxPHt9erR
 b/zioR8UjFbfAQsSD6TdJJJ8hUmW9Uq4yU8bFr4A0kyzKaGOhFrWQjRaGBeR4hPTKrRqSFnmSBQ
 GsBpu9vafeBzMIrxO5r02AyQWpVqdZgbFf6y59BTwCcHvRZMbrufTA2y+SHiLLcD+l5q6CMWU1P
 cVI341Uu/3HkDkFePtgeUAeOEDd3/+iSKp7pb1lpVIJS/O8f1TypbXYaFaHowkgyQZVkLAfwimX
 RzkADq9nEVMp0rnmdbESxm7OT0NhhBT3vwSrw2oqsH1MjxWasXO2zWWTHmKucY7DPWM+x6l7hIw
 Jb0N/8lWGN
X-Google-Smtp-Source: AGHT+IG3eUuB5Tb1s+Zs70IjrZagHo/mf8fIHvmKfCB1AS8Rh4HCdjBPUwGbrg6oNBn8UN6DCsv0tQ==
X-Received: by 2002:a05:6a00:3e2a:b0:7ff:9657:d6c8 with SMTP id
 d2e1a72fcca58-7ff9657d93bmr10043630b3a.27.1766391721087; 
 Mon, 22 Dec 2025 00:22:01 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:22:00 -0800 (PST)
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
Subject: [PATCH v7 04/31] docs/dyndbg: explain flags parse 1st
Date: Mon, 22 Dec 2025 21:20:21 +1300
Message-ID: <20251222082049.1782440-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
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
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..e76ccd987704 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
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
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.52.0

