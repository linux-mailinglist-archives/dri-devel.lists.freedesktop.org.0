Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626BD18DF87
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6EA6E2EA;
	Sat, 21 Mar 2020 10:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881A26E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 16:59:19 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 37so3363308pgm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 09:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRjX7T7eft/qC+6bf7FfyU/mPCvn6DuztC5RzuHCyVc=;
 b=WmQkIo8wgTcT+49UEOC761MjUtOoLumkxcQrNLGTV5XIF/8lT1bx+3pCSL8T9xMdZY
 cWLs8vQSQKBV1VXMxQM5NR78QAl2OuRSqAVNbbPsuMvJzg/GjnWpmqSoglfFIAkV31+z
 MP+DUTjrCLJ6J7p5c6jvdGCaDAE5JuorkDPWMCl3cc8f1/br3nbePeINlV2no2Zpv0lA
 x996mvxPsYAJubp73Du4S2nS/wtnN/9QxMhJQCWR+gg4WbHEtK82IFnTkGk0BMjclTq/
 UasFQVqNKpkfmX/un/MPsIzZfDYZXMiTwx9ovm8X8Wk5Xzm8VVcGiy4D9LEPu/vagLD/
 G03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRjX7T7eft/qC+6bf7FfyU/mPCvn6DuztC5RzuHCyVc=;
 b=XGz9t+SU0wNSe6p6ZrqkyesXl2lnLqEr+btPyprBzxNHIP5V0hrEGFhZHgHCjsSK+l
 LfW/NTEHO6ZZo3xqBQHxm+XlI8kIu0EbcqYrE5efvqg4PjwBrjnKVsvv+TKrZ1jGC0V8
 GvLAb7C5j+E+jOGCvs6KnHJ7UrvbacvzT3TgRd/u740oxsHj4eVE902VHZw+jFngDi36
 c2gxAkWfiSmw7HD73g4CsVKb15EMXBrH0mSHRj4tApaf8Ap3WJ1wzEnb0HkDFjsreLu1
 v4ZfuiSwAaREsSlIe+JQ/FC35LM2lyo7V6PPaSz0KxHL47ZSb3LW8XaleKrgPCGUIaXx
 j67w==
X-Gm-Message-State: ANhLgQ0orgzMmQ/qhuElRLXXEUThzschUz8QPRXQKH/iXBGupsQ/KsIf
 QVXRxTW2PVGWGpC089xbiXk3CrQehTihww==
X-Google-Smtp-Source: ADFU+vtbRR/MYq87zJZvXdzKsxYqiR4x6njtZJXIu9qf6nhgSPf391EA27m+Q0Bt/DeLj3EN/58FoA==
X-Received: by 2002:a05:6214:12c7:: with SMTP id
 s7mr9363766qvv.218.1584723027380; 
 Fri, 20 Mar 2020 09:50:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id e2sm4452824qkg.63.2020.03.20.09.50.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Mar 2020 09:50:24 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jFKql-0005kU-FT; Fri, 20 Mar 2020 13:50:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 6/6] mm/hmm: use device_private_entry_to_pfn()
Date: Fri, 20 Mar 2020 13:49:05 -0300
Message-Id: <20200320164905.21722-7-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320164905.21722-1-jgg@ziepe.ca>
References: <20200320164905.21722-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:29 +0000
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

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index a09b4908e9c81a..fd9ee2b5fd9989 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -259,8 +259,8 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		 * the PFN even if not present.
 		 */
 		if (hmm_is_device_private_entry(range, entry)) {
-			*pfn = hmm_device_entry_from_pfn(range,
-					    swp_offset(entry));
+			*pfn = hmm_device_entry_from_pfn(
+				range, device_private_entry_to_pfn(entry));
 			*pfn |= range->flags[HMM_PFN_VALID];
 			if (is_write_device_private_entry(entry))
 				*pfn |= range->flags[HMM_PFN_WRITE];
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
