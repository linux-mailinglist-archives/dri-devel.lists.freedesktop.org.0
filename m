Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6343D8159
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CE26EABA;
	Tue, 27 Jul 2021 21:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86676E9EF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:16:57 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id e5so52039pld.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=as474LhSy42cHKge7Gy2Fn1oqutkW78m6VkSl3HByJE=;
 b=lSOk/hBBmMlB1rYWTRaPXPIkKi/CxdsLOHI3vbEi2GSoFn58wsWtYlaoOfqvPj59dt
 ooaVxGQyHEHZnH0A70oChu8vvpJt9DQZz91T5V7lJ7/jvA+gX2vgTxoF4L8nNLo3A1bm
 hHNtGTPTcV/mXDEkppwsVuEpgI+3vO6Y1uBxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=as474LhSy42cHKge7Gy2Fn1oqutkW78m6VkSl3HByJE=;
 b=KkqoMwr0gAGFj7PWrvz/OUzzH8ZNvVbOyvxPbOZdFwsTK0Flo36nBqi8Ou1BMRIgH0
 6Xv2cF9PDtQ9qLNl2Tlj+Bh+Y74Uyh+fIgPkGCwA4kvTa6lS7Yf/M503pmDq4n2bBi1c
 nM12RDj11qCRwtmzX5vtmf9Tv5XSwpxFXRtpvkRjxjY0a8X2HZpXWiUshXyhXfHmZEo8
 +PqTtf8ZTvjxzsLRkey2/VrqFCn6dqbvNpgF7OftSdTkONiKeMMjTSB2IAykmpnRc9Pi
 SncI2mgIkqcqMaXuPgP1QIQrIk51fAzCqtaQyhfM8TBgryPzF22OtqEyfmHTPEhDmmul
 90wA==
X-Gm-Message-State: AOAM532AYvCM1YvtohPVilRjTduy8/jzcF92iLG9P1br4hqyUS1xdrrX
 ku/2THpUFWi4dBfCljs+SBjVXg==
X-Google-Smtp-Source: ABdhPJxGaEK/7GM0+vAKulISQNQ8zNmBoY4IggEYKPysQEG+1vegv9sBaDZhhkPzUiJxyIhOdVgTMQ==
X-Received: by 2002:a17:90b:4a4d:: with SMTP id
 lb13mr6031654pjb.221.1627420617450; 
 Tue, 27 Jul 2021 14:16:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q19sm5028194pgj.17.2021.07.27.14.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:16:54 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 46/64] IB/mthca: Use memset_after() for clearing mpt_entry
Date: Tue, 27 Jul 2021 13:58:37 -0700
Message-Id: <20210727205855.411487-47-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; h=from:subject;
 bh=EIIm+0VdwQ9IH2XMV6ts5pIWwaxyRwboIG5815tF7+o=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOKarr4bIPgvwWH2qKkwLe6/q8cDAlBzD3bLA24
 ll85FGeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzigAKCRCJcvTf3G3AJvwwEA
 ChEYdVEvOlY6ZSSDwSK+GqTMcoJtHYXIXerlg3cv7Z5B/nj+4tsVkjpbbg6qYJ7G6Wn5LCRzlLTF/B
 JEQNK1K018MnLFUCnQdrWeHhqOML4Z+QY9330qvih8kbryLwUmmPm8tMDr8k7xeqODqXV0ysJUPb2N
 xVAh/ldKgMIWN0SIEK4b/AeC9lC2gYUHs0M9ufsvUwE/w7u4/dJRXGEtfOnpjbz9EiJRevDyOxG/L7
 5kQTjyY65fkZSD9d3DQYA0of/YGF5vIAzSb90hB4BR+6elYWhMJodLf6s9scmQdVrWhXQ4dVg6J+8M
 ycSHtAUfvV0kejqMCcI904M9g4jJuniybmlBLuzSIsi21ELju85L/7B9KiYaqlPgChXogQSPXNk5Kd
 54beIYuu1Fd49rYR1R8WtEoklJaIrmJSkYaEDaYgFR3e7sXiui1Lo6/7QEjLjklWuNupXgY7d+KgBw
 oCFrVzGvwPnUGDQnGEfR2OxN6HzTznt5SuyVEVOZkOSmgu5uS6ad9csIugS5srvBjmEQQuXMfiCcAe
 FRY7ypPn9oUPWMah/ykVuPdD7cmvKT/OghOEHP/qza9WeqolkQBPyj4t9m6qBq2lsFMVjj3xVeXXM2
 +eC9JXnzHZx87wkFYpcVJstfzhif8T3qljrVvmM3fY2NknXhqRg98uBOWpsQ==
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
 drivers/infiniband/hw/mthca/mthca_mr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/mthca/mthca_mr.c b/drivers/infiniband/hw/mthca/mthca_mr.c
index ce0e0867e488..64adba5c067d 100644
--- a/drivers/infiniband/hw/mthca/mthca_mr.c
+++ b/drivers/infiniband/hw/mthca/mthca_mr.c
@@ -469,8 +469,7 @@ int mthca_mr_alloc(struct mthca_dev *dev, u32 pd, int buffer_size_shift,
 	mpt_entry->start     = cpu_to_be64(iova);
 	mpt_entry->length    = cpu_to_be64(total_size);
 
-	memset(&mpt_entry->lkey, 0,
-	       sizeof *mpt_entry - offsetof(struct mthca_mpt_entry, lkey));
+	memset_after(mpt_entry, 0, length);
 
 	if (mr->mtt)
 		mpt_entry->mtt_seg =
-- 
2.30.2

