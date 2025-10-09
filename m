Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6400BCA729
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC72B10EAD1;
	Thu,  9 Oct 2025 17:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R8Im8tds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B8710EACF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:58:48 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-42f5e9e4314so12589725ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032728; x=1760637528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=upmZ+84nb0PGLfZ0odEvQVtU0YnnK5GejiW4j5Z157Q=;
 b=R8Im8tdsv2zzqASIRywI5B236infNfWjEGa4pwGA7nhPyqZMtWw3Jv8JtMbXv6phpp
 i4MlAtADR4S4M3OMN7kXgSN1gT2Sl2W2odc9BLV4GQx+BMrjsQdJbqBT3gGbh3ONPww/
 wME6y5Vg52qe/zJSjuF7ql6wR7Yil0CMA3pBDW4YOl9nugC8rtbvcn95hXwfSRJqoh/N
 ge4kGDUaaXrg52YOs1Ybj//tjmWgQxi1r5ubaB88NdudJvY9ddt+MUaRbqzX5JhxYSVX
 6z9DLaLbM/H4abE0PyQW9Q4MCED0qdjYbqA3Q8P1WTW5QmOKV+tWWxdiop8G9inA4FHs
 e5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032728; x=1760637528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=upmZ+84nb0PGLfZ0odEvQVtU0YnnK5GejiW4j5Z157Q=;
 b=nZIdOQPbv9+q16SXiOv6RkZbhQdFl+HjaTpL68MWZgqFNRa6JwOdxniG9FbHGW9VxJ
 5xr54qgaVkf7rA3LPgYEY0wtosb5gOlbXhhZa5OYz29gpnAEip4RbbD9clvkaurtxTo8
 MtO+zEB0woWGar+aSZwWGTz9ZR1UeGE0Df9oBUZApHr85usNJ86b3WYiQSd/NgQXINf4
 H4UAd79od0hEnTnpFJomd2Gv6IUkDeTPkE2s9Nb07TLsIaqkByS5qMJghW/CLoueSogP
 xF9KhPUxAy5DirKSbwQxJ3iDKiBZAnPIH5uhTOrpCrrAHApeXsbSdIloFP5qhDhuVSPb
 Ruow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXETWyU3dnXdNS33z5tseTw+Kg4e3yV2SKCfsooTqMP8Nqlu4TjOM8MinTGfUt8zv5jVKS05+TMKgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz76AuomByMliwo0vdtgV0nhvt1+5YH8CsKWfXqPkQTxvBUDkUx
 9THa1JjOcka2/W6rubfxjtIdhORaXKxjEmrBzdw6PZ2h1xcBgHAOoyyU
X-Gm-Gg: ASbGnctKoAGMIkPGB2IFboJZvYIu50Fhrb0dY5HT13ZXhFYElFHuuUQ6n8yck5bHEbh
 HY9Wn/m3uQ/OwvsyDv/YyHGwIBIKHuypz4mvJr2hpvVV2RUKrU5An29xbPM7yraYj1MaNkzQKrg
 dc553QnFK71R3J7lv8C1YRAu8CQ96eBlxcU6tsQUHvDqlfnSv3Lz5+Yk18VYNXOjJk1mLYHI6kg
 7iMT8e6wSFD5B0f/sWxG9oiL1rYrhLtLz8ArK6h8uZB5zwA+jBrUen/PLoEzkE1jB2nBBGg9UnS
 sO5ArVl3Asv3cP5IcEeFQ3Z4zL9IhRbydTXeigvLPjLOxI+Vhi3WfhdFWohovuFfa7St8ksdQzr
 vSLfZXBFBI+bGaUiiHGeesLbzhN371PWph8by9FYuYDoJy1Oqj4MfY7e6hgnCx3u3F5KlO4RhWa
 CD6RBg2c66QM/WbWYinLRm/2sKsz+dORexMKa+5sbIh5KXRafk
X-Google-Smtp-Source: AGHT+IEP/KYeFsU48bhRAsguavBTqOpW4JiVNFuGMdDXElpSwlucCVx3RZG6w7iiJpXxsucAPDZNmA==
X-Received: by 2002:a05:6e02:18cf:b0:42e:73f7:79c4 with SMTP id
 e9e14a558f8ab-42f873fb613mr81674845ab.27.1760032728078; 
 Thu, 09 Oct 2025 10:58:48 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>,
 linux-doc@vger.kernel.org
Subject: [PATCH v5 02/30] docs/dyndbg: explain flags parse 1st
Date: Thu,  9 Oct 2025 11:58:06 -0600
Message-ID: <20251009175834.1024308-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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
index 4ac18c0a1d95..63a511f2337b 100644
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
2.51.0

