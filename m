Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62B91974FE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4857989F5B;
	Mon, 30 Mar 2020 07:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC316EA75
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 20:00:34 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c145so12149605qke.12
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 13:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TyPTTIrgr5jFkg31+AHSLRGpSHCvL1+EWcgijYv1QPM=;
 b=noYJUaxTqgZy/wHPJ7HGyMyohSauQN1H/BBlkuBWc8iQCW/ZppJ+LwXNIRokuECBml
 u6KEyLpSSemzeGjYlvPG3hJinN1mPYzfpw2TKQpLGrRm3QkSvLfqx+7sdqisc85aoNbF
 dAE0zPXSTZ5VOOUE4p3EJNV+nlIxlCbdWMU7jIWo61XJz2jsxynfZ8Jsv8TM8jKjjwLg
 W/OnoLB7/2LjBbA/03Wp1larZqxPw94OAM/d0G0vnQYlKbXBzvfptKdfRp2LDnmVwPiJ
 NmoLTGimt357fCiaJDyo9V+hfs+zQXXNlC4UR7IdT0Vh9odOWaoD5d7y5ym3WEq75ble
 uW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TyPTTIrgr5jFkg31+AHSLRGpSHCvL1+EWcgijYv1QPM=;
 b=L5qQO0v3gSsC7Ro/bpCAi38KeSoYf4TfWp0c3JTCZyfw9PPNNfAwc12i7yUDgoY9zn
 F7T0MzMzN7zvl98fgzZicmKElYGuUrvqOqKpzAlBKDEr5VSZVr2oU1oZ/kOf6o1DXGAl
 Jp8lVgiOIDpnw4jSgPRESyBjEsQ1oW4TbAD4zWysy2A+6sUEwN6qh4EwoUfRxU5UMWyL
 v2hSlQYMyS+v+BATa5j3qIBO803cqeAgkTARVTWguaHJReLoCh3lKK8N8uU3Q1jacLop
 vLHD/FF2JFmWU58ph+Z0dcRS0eRfBFlYDoMVQCR/kFtjGQFbhgvbQu75PMkXu9P8MfrV
 TVhg==
X-Gm-Message-State: ANhLgQ3GBkqslffb7RR6hZVwcnIMLFVfaPqPcEN4Vcb8x/hlvQHG2J3J
 xfNfLyEBg3DJjW3GoG2wSA8BeA==
X-Google-Smtp-Source: ADFU+vusyRe6ojBp5llZXnMxLYofwoFjLl3UfJlP4qaMzbvBMyNTtVgrylTbiL3g/n+IqSKDUu4X9Q==
X-Received: by 2002:a37:30f:: with SMTP id 15mr1101270qkd.44.1585339233822;
 Fri, 27 Mar 2020 13:00:33 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id f1sm3946514qkl.91.2020.03.27.13.00.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 13:00:27 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jHv9V-0007fy-6Y; Fri, 27 Mar 2020 17:00:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 6/9] mm/hmm: use device_private_entry_to_pfn()
Date: Fri, 27 Mar 2020 17:00:18 -0300
Message-Id: <20200327200021.29372-7-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200327200021.29372-1-jgg@ziepe.ca>
References: <20200327200021.29372-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:45 +0000
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

swp_offset() should not be called directly, the wrappers are supposed to
abstract away the encoding of the device_private specific information in
the swap entry.

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 3a71ec72b0a42f..3303686bf16d24 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -261,7 +261,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		 */
 		if (hmm_is_device_private_entry(range, entry)) {
 			*pfn = hmm_device_entry_from_pfn(range,
-					    swp_offset(entry));
+				device_private_entry_to_pfn(entry));
 			*pfn |= range->flags[HMM_PFN_VALID];
 			if (is_write_device_private_entry(entry))
 				*pfn |= range->flags[HMM_PFN_WRITE];
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
