Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84003EFBB7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588A06E42A;
	Wed, 18 Aug 2021 06:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41266E416
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:14:16 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso1604693pjy.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m1lc/nY2hnA6HnQKSHDtLAeIlS0dmnOBqNYLAvTUlGA=;
 b=FS+HfMzV5+fC3odMkVXrJwEqyh1+slSdNTkOPSLEnKpgB5aUu5pQ/txX3nZwmH9j9N
 JpUNb1Ke8Nib613Cf+hSPfr5Treumucoekmun+SpdbNf+2vy/QfKVo4jA8B9b1nCNQor
 TC8YvVHzeO23Q0aiI3WkjSxOlWzmH2+99jfiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m1lc/nY2hnA6HnQKSHDtLAeIlS0dmnOBqNYLAvTUlGA=;
 b=FizQtFM+Xja3XfNjTXjhSNMBb83CTL5r+PxytR7b1lxfCkvm2ldzPlJVSISfQkPz6S
 Y4HDX+OuHh8MMAj2WHMes6VWKaG8FwSzdNg1HnCeWGsdCQVdW6cA9oc7OQMx21gIJUFK
 3VvdYVFcDHgRptn6nFT/1+3/0eGTajb0wxygoTa4FG/UMkH7a91Oih0lhXYX67saHNDJ
 AJXK69f4Oi+zjLGFrneOC5+iXrw3iFOMI4zvTXtEKEhhEfkYEMEGZdFfs9qgdrdi0QAY
 ZIRBT7dvF91cOyRC11XbziPek3pObgPavfYZIxCCcnXbJU3xpb1gs0CBNxIXrfvZdI3C
 Qp/A==
X-Gm-Message-State: AOAM530Cs3K2PuBkhnKQU698OaqYKxubC+BI54Th96d8lZuRvTo3FavJ
 SPFbttGtdOzAsqNtXGw2RMhCmw==
X-Google-Smtp-Source: ABdhPJwpjXTG6518NueOetV3W8JiXoD95XPqR41s/nyPvt6mMXPV0yaLuwDelBW15us2G4JddcQdZA==
X-Received: by 2002:a17:90a:7848:: with SMTP id
 y8mr7473374pjl.223.1629267256351; 
 Tue, 17 Aug 2021 23:14:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c2sm4955669pfi.80.2021.08.17.23.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:14:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Ariel Elior <aelior@marvell.com>,
 GR-everest-linux-l2@marvell.com, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 43/63] net: qede: Use memset_startat() for counters
Date: Tue, 17 Aug 2021 23:05:13 -0700
Message-Id: <20210818060533.3569517-44-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1815; h=from:subject;
 bh=jbnLApEqieW/++fy2QnZQqeijBkPN++4uUcql8IdpbU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMnXjTo191/u7GxZ37Wuvyxz1yYXjk6kYYtU6NG
 Uk/+1reJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJwAKCRCJcvTf3G3AJkUKEA
 CP9QtdF99HOjstydZyty+TXWHCHvk+L8yaRJLfQw9Ij2yJtDUvVtXCUQSdzfwtxENfHB4LlV+pLMa0
 qtp570ToxI9xdKB+Abev9OkcAH5UA98HTqhTsHmWJGnTyekyI18DDinSJIB0eLexCslyevedljP+I0
 QwGGo7hbN2h4cNBdVfqf7XV3IlJQUfMOqisWo+S9yQprBKthAsTiNykj7Z4XkUt6ZjwQxHdovfcNxr
 y8X7Xi2L5LS5RUO5L2qMg49ufYnSh+87p3iZSePm58cBLa6PcS3TS+fgKFWq6rKeq7vfzHvCpl9c7m
 0Pi2EHJcBRd8x9Bq+0tTmOFbFJj7lE8rPmNRx5iXfmxnplgxUINQjPc04CKf01oNBQ5V2tlOBzEhYh
 lZkFnyIwxJit2hdyIBpT+Q/x61E/7iEhBXoo2xHetZ1taACUz+5xMZQcqpmrQMWxuQgbwSwepHUAvL
 ZuGf6b7xvI0ywqYOA0nuNIJ8EVw6IByYxIAIEjfx0glGfIIeP/tLoIsgTV930k309/s9y6TBWRCz8o
 h5lLHubwZ57QjtbHRdw0A7frEqm19KSAvXwam0MAB43vm0TSt7vbCCiR0uj/9PR2prngJ9eQUl6K5U
 BuIjpDHq3lGaWV82neHsDnTIdWx4qjzZBWqMMF/rnI56q46Pfk7bv8/pmkfw==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Use memset_startat() so memset() doesn't get confused about writing
beyond the destination member that is intended to be the starting point
of zeroing through the end of the struct.

The old code was doing the wrong thing: it starts from the second member
and writes beyond int_info, clobbering qede_lock:

struct qede_dev {
	...
        struct qed_int_info             int_info;

        /* Smaller private variant of the RTNL lock */
        struct mutex                    qede_lock;
	...

struct qed_int_info {
        struct msix_entry       *msix;
        u8                      msix_cnt;

        /* This should be updated by the protocol driver */
        u8                      used_cnt;
};

Cc: Ariel Elior <aelior@marvell.com>
Cc: GR-everest-linux-l2@marvell.com
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/qlogic/qede/qede_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qede/qede_main.c b/drivers/net/ethernet/qlogic/qede/qede_main.c
index d400e9b235bf..0ed9a0c8452c 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_main.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_main.c
@@ -2419,7 +2419,7 @@ static int qede_load(struct qede_dev *edev, enum qede_load_mode mode,
 	goto out;
 err4:
 	qede_sync_free_irqs(edev);
-	memset(&edev->int_info.msix_cnt, 0, sizeof(struct qed_int_info));
+	memset_startat(&edev->int_info, 0, msix_cnt);
 err3:
 	qede_napi_disable_remove(edev);
 err2:
-- 
2.30.2

