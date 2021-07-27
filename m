Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 933673D80A1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE766EA6D;
	Tue, 27 Jul 2021 21:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7F46EA09
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:06:58 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so1227125pjd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p/9n5XlKkS6wfkCIPw1DbbDsmNaE09gzmWAUlzSJHk0=;
 b=SW72vFpyRvi/mMVr/UQMOgHPlxYF/P0e1ZiidnPntTAcbmVZzEGGh8mQvyc6/PMYan
 7VRaIK2m566aD8CTsIKSvbx/ZXJ+9IYZ/X/O7tqEYF1n1rL4di55gpn/tChdbhLwc+Wz
 CXtVDDX34F4hVt3hvgvuSFi8Unf3XeFPwkISI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p/9n5XlKkS6wfkCIPw1DbbDsmNaE09gzmWAUlzSJHk0=;
 b=MYLLYLE0EUXo4XQQ+CyH+DhdNLWoh9JQsDE0zP++QGrLk8ytjJTWZHo9n4pSLEbd5m
 6bgl660SrPK5Wj9aJVfHlP02PFvWrJmBtkQpNMW6PSPkc4QgZmM9GSuSt8MckvKHccLj
 gUSoHDniamoIkwrQoxrfg/uew4LZ3mJdjuPy0DlQwjpxj9R49PazNe6M1E/Wum9iQvKf
 phpXzBWsUxq0w0lVJZIQDdTYRZbTyVxMGVNTnQzxWSS/14zfIVTokG/quDc5onIDcyOC
 IaOzQ+Nq7+7pDUNagpo8lQKx2JMZfytNlshwGZ2O5PuskabyOKuS9h4sr024LYEMoByQ
 chXg==
X-Gm-Message-State: AOAM532FjYBg8aGwnLTJKYPdVME0ls/xkG7/3PfCICATy8CLHKa2v0JO
 rgsPUUa6viz3eFZaazUlEQdUOg==
X-Google-Smtp-Source: ABdhPJxaFQSeLhkc1zJ2oaBRJsMZBtjwIKQhIZuTJXa2K2J8IKVPpYMViisfXlARKBOGaL/7RusDbg==
X-Received: by 2002:a17:90a:12c7:: with SMTP id
 b7mr6026153pjg.205.1627420017868; 
 Tue, 27 Jul 2021 14:06:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r18sm5038817pgk.54.2021.07.27.14.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:06:54 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 41/64] net: dccp: Use memset_after() for TP zeroing
Date: Tue, 27 Jul 2021 13:58:32 -0700
Message-Id: <20210727205855.411487-42-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; h=from:subject;
 bh=setFCuudESAmPvU7TENmlV2MS4FRl7JRml2jjTFJDIg=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOJKZ5loXhOKkjkBoj4absMkEGlM+ZkGAgDZtTY
 /isiJOGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBziQAKCRCJcvTf3G3AJl2GEA
 CkmbILRtScVKazMb1tWpR5Wl/pQ4wUktuV62qIpYEEpFPkHrnESIQz1ChkzSepdcASTNc4T6oa0NP9
 WsXo723hzRQElBcUpAdaEQZWe/aRzQgxz6NuJ0ucec44ap26fdlOUq5jkNdSul5xj992thaeMiUWHl
 M4YJzdgCpzk8OEKhzLzvrViKkK+IaPDmTMBwHh7u5gjX9tk2OqSPx/ZXot6tYvhFg6/Oy0vv+xHrlp
 iovAgyyLvDPGPpUEgGj2aKBFXc/d/xxdCSuI3b1elrnHoEBod1sM3BVLd8BTraljZmNAi7wrINJzHM
 eu2aKaVwpvUJwWQr2BuBBRGeV74y1K8w+/Tvp0fufvz6558D1uGi5jCrDj5V4/Nj5+HrvI6IbWlYbY
 NSCPJB6kzUX1DRdtcu/6/wMtBFe02I7zLytHfwOcQVNqWqm6EA+YewjYVECp7lCvhT+po+Tp2LcZA6
 YKyyOzP6+CTDLOyriNbgoebelLFhlWWOSb9rZGEBhs9FxI4qFJJAxmatGkCcUH0MYAz6v5PPfjvR86
 yjrrxYWYwC6cjmhctqIhpAdMEd0GZec2ed3KYFABa9OyGSC8Ezex48JITcr9RBnKCdqux3UCJodziE
 nhi84Hw40jD0Ho9czi4juaFwDxA2xtuq+zKB1K159GTFsJfOh3CFAYS1xoow==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Use memset_after() so memset() doesn't get confused about writing
beyond the destination member that is intended to be the starting point
of zeroing through the end of the struct.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/dccp/trace.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/dccp/trace.h b/net/dccp/trace.h
index 5062421beee9..3c2594da49fc 100644
--- a/net/dccp/trace.h
+++ b/net/dccp/trace.h
@@ -60,9 +60,7 @@ TRACE_EVENT(dccp_probe,
 			__entry->tx_t_ipi = hc->tx_t_ipi;
 		} else {
 			__entry->tx_s = 0;
-			memset(&__entry->tx_rtt, 0, (void *)&__entry->tx_t_ipi -
-			       (void *)&__entry->tx_rtt +
-			       sizeof(__entry->tx_t_ipi));
+			memset_after(__entry, 0, tx_s);
 		}
 	),
 
-- 
2.30.2

