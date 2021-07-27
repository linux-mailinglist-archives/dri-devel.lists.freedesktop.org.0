Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944CD3D8142
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F226EAA3;
	Tue, 27 Jul 2021 21:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDC16E9EF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:16:55 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id m1so1904483pjv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DGTay7iAWSyVSQKDJdUkixgvUstnCPUf4gCx6hmeZFg=;
 b=dNYQWvNnvzIA2X1XyugwcYlkkWjvJM3Vr3U1hCAtNIdHPOPlyGNYt6+nUriTVJE1MY
 iZgmYH0qJz+aQ+mXI12gMaGW3TxvwmtxZIYqXUw/22X3My9fPAG+Pxwau+0K9PSBrncN
 iFPA2Fm2fkDwZ73RqhbPCUL3LZE0YvDxxcwSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DGTay7iAWSyVSQKDJdUkixgvUstnCPUf4gCx6hmeZFg=;
 b=q3O1YomGcfvIB2getXkIFP/3g82yQ9zxepsSDJdS/wacseVFR3X8+4yqH9zafWsPpd
 nGi4qHljXpS09stoMcGWMZmMJ8+uWdFWKD4gW6KGFtQ5+oTofwmoTDmyhpX/7Dzi1m+T
 TP5K8otDbCGXwcB+ZfIVF34+PPI0wfkqKWoTVb8aYPP0jfCQ3ek9r06QZAJar/AxZSY9
 4CkxQD3ERINjoOSb2mFGT3bzlODJHQo1u8qQiZYNWbayrgmr+zRGc5kx5SgW8aC+i/Lt
 eKckqBNJmmwrg6XzLz4XUyoiAIQSIYP9oWwJcpUG5+k19BesEpcf4czvfsbX71U95kxW
 +5kQ==
X-Gm-Message-State: AOAM5315PXCsKZM3QNd/YjwZnW6+PLqaYtIEZnmtD7LwY55pnfq2st0i
 L6dLZlwNoQzkRzPGqJN7z/90Fg==
X-Google-Smtp-Source: ABdhPJy6DyjMlXCxT3T2XebScQyyxEXTMu8TCjUAq1vEYKkzbYwWyNRsUTrVbClktjUGmOBVunhffg==
X-Received: by 2002:a65:64c4:: with SMTP id t4mr25559293pgv.222.1627420615303; 
 Tue, 27 Jul 2021 14:16:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j187sm4758930pfb.132.2021.07.27.14.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:16:54 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 45/64] intel_th: msu: Use memset_after() for clearing hw header
Date: Tue, 27 Jul 2021 13:58:36 -0700
Message-Id: <20210727205855.411487-46-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172; h=from:subject;
 bh=4YDV077FmH9lemmMexWp8eMo9bjnp2d96nCsgVn4crc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOK9ttF+ksljVKBeZVm/usaI00laWjD4Unf8h1d
 eoh1+beJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzigAKCRCJcvTf3G3AJhvxD/
 0XZptAWWII5Sd1eI6hMq+jc4oUfLp5M5OPVb2emcgAAU0hAdSFxWDSUreT7263Ke3iOrhK498DJ36F
 DFKeXG2Kgg+H8VsBs/8iBRv3fcGi9/Ws4R5EVR3wO8T1tGxps7guCF9Qt6VBQ1s4MJ6uP1WduVwPNZ
 ZlByIdd7bbTAOVP0DQkaoixkgPdZnttNUp6Rr9N82rM1ej3G08+KapIFaiYMmhQSc7X5eCVxNKiziy
 OaiXcQBIN39iFbSTkPqmGWB/O8O9gN3mx3NTI/59TdmWDsSIEA0nZvbfdngpv2IWvghbSAnYrPfRoP
 PgSUX4wsUmyVbVKlsPRTFFnPc//4u4ziXfaO+NBESwrPcAmCy46pnKciUhYP1HH9VEi+ZCFb+SruMD
 MadjaGn2+3NdXFhWFV8895TTZ9u2+OKWtOQfqo11ynnlTm/DCGHvWB/AFn/6JdmHikaEpmcDR35+C+
 Egf9o3kqDZ/B2qBqmcNmBMEV+0x48LZBOC/a5eqPn2bWsV9AJA1QV8ZZ/okfq56/5BwWZsW3rb5Jgy
 w2lr+ZeijJNIcye0PRUUdx3g1rzpx5+DXlN5Ntxi5rE5nrCFrcdyM6t9z+TbSBsR3Gd5kdMjV62eDG
 arvpuLcVrVwUegzp+aFtKOIzZCN084P4qbo3Isqj7ayth3CARHq/kmH7pGPQ==
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
 drivers/hwtracing/intel_th/msu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index 432ade0842f6..f3e266b0756c 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -658,13 +658,11 @@ static void msc_buffer_clear_hw_header(struct msc *msc)
 
 	list_for_each_entry(win, &msc->win_list, entry) {
 		unsigned int blk;
-		size_t hw_sz = sizeof(struct msc_block_desc) -
-			offsetof(struct msc_block_desc, hw_tag);
 
 		for_each_sg(win->sgt->sgl, sg, win->nr_segs, blk) {
 			struct msc_block_desc *bdesc = sg_virt(sg);
 
-			memset(&bdesc->hw_tag, 0, hw_sz);
+			memset_after(bdesc, 0, res0);
 		}
 	}
 }
-- 
2.30.2

