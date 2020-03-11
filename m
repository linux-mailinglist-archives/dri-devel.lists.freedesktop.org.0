Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EFD182AAC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DD66EA48;
	Thu, 12 Mar 2020 08:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848836E9E3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 18:35:18 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id t13so2312875qtn.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 11:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eYOHMjSMYAiqyn3S+V97OaKejU5YnzW7DlF+2YMOcF0=;
 b=Oj2+9cL+KscU9a9zK4Suzl5t1bo3inZGbyVIq9f/zeCmxkVp6hpJxKiilnqnMZQ/FY
 88384yWaxGdO7AK2SvS4w/5ttmUJ1QwwiIIQkIru3m4YEvr6DVRfcc2LZX2b+WisWs3x
 Q9/ZJPxajspOeqvaygRv/+e66+A+86ngTjF2dHCc+iW767kCXhfOPdAWbvM9qhpvmh52
 a1hdeiAzVdj1EC+964oWge4gJ1EvDWASPw6bKneNMxHD5zeTPMdbLleLYVkd/wi+PWZ9
 2CJq/Ge+3bDYLHuaBaG8pI2c5Dwhg7JguuNwrBTyac857oUPLrhjtOnYkU9jB4pEhySk
 Wr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eYOHMjSMYAiqyn3S+V97OaKejU5YnzW7DlF+2YMOcF0=;
 b=gF1NlFluiMm5f9J1bHbRmnt4QintKO+usxH2x4SxO6eQ5OFCG45n9GBAD5jvM9galH
 ukmvXxKzCc8r9FKly02+nhh2mKlaFsYPjVtBlN5Ww1HhIhaRPnINSoy0c7L0LOLK2MsC
 QoS67ZZ86Uj0W9jR3XgKaova9q2s84LR0NcrAA0DACqvyfnKvPGiPyQp4r518iPKZFXF
 PxJTO61dIx11d+/TfqxPDOWWpaJQO4ix0MY5H8mliQKLETNgKoGmycQLML70gcfgkcn4
 7yUmVWILv9MSyM7owOGfox4xMB4dGGraFUZiEup3Rv3DXqFhLQM39XratIJP3HecgX1v
 kVIQ==
X-Gm-Message-State: ANhLgQ2TufL5qhhRJartNaMzhBOrXGtIv7nLEmy1OgltKJuTo+/awtPo
 eiDbNWX1iIoxL919eihZ//RhEw==
X-Google-Smtp-Source: ADFU+vvtZI7GOONaM2bhtDz46uIiycc1D5Nn8U4YJ8Luo17HKLeSzNTw8qbnVEqbl89i5RN+bVZ38Q==
X-Received: by 2002:ac8:1758:: with SMTP id u24mr4036108qtk.148.1583951716868; 
 Wed, 11 Mar 2020 11:35:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id u26sm948048qku.97.2020.03.11.11.35.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 11:35:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC6CJ-00016R-6m; Wed, 11 Mar 2020 15:35:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH  hmm 4/8] mm/hmm: add missing pfns set to hmm_vma_walk_pmd()
Date: Wed, 11 Mar 2020 15:35:02 -0300
Message-Id: <20200311183506.3997-5-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311183506.3997-1-jgg@ziepe.ca>
References: <20200311183506.3997-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

All success exit paths from the walker functions must set the pfns array.

A migration entry with no required fault is a HMM_PFN_NONE return, just
like the pte case.

Fixes: d08faca018c4 ("mm/hmm: properly handle migration pmd")
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 32dcbfd3908315..5f5ccf13dd1e85 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -394,7 +394,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 			pmd_migration_entry_wait(walk->mm, pmdp);
 			return -EBUSY;
 		}
-		return 0;
+		return hmm_pfns_fill(start, end, range, HMM_PFN_NONE);
 	} else if (!pmd_present(pmd))
 		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
