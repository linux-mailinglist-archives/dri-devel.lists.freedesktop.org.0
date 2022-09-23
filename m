Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5F5E8387
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9463210E919;
	Fri, 23 Sep 2022 20:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D52D10E5DF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:36 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id fs14so1052631pjb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1MqQrxnQnbWg62GSxHH0OEF1q347X/m+4lnjB2flQT0=;
 b=Sm/M1aPSgGxkRY3LHKu9WT6VO0RigAcBGr0kTvvwRsO2yiPnlyPOycSqBm+Mx8oFi3
 bspsiUMbtKdtztOA4+TN8PPA5DxAgy5IBcQaq/1bn/CTLSI6xp/mM0sWTL+QnjiHRtQm
 hkYMCwfmO+zSjZYsUL+mFvQC8TlG50HBWaABQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1MqQrxnQnbWg62GSxHH0OEF1q347X/m+4lnjB2flQT0=;
 b=fXnR2w9q4ho1f/gvieEFta2bGxAOkx0axa1to0pUjfAAcSduRbAgdRnzM07k4u5DOp
 MAWLaFm9G+SojSvhQE988jd/a7f7+GVYLZyx8ssdBH6XSZfS7mnag/DPLfi2lcMcnRVy
 4Dl3FEMgkzHguO0nIxt+hnx8/rDCAwFnPrHsC4oJxzc9UNQALnW8TcFfOAWE1LjS3YUP
 c9r0K7QuWbsgPi0BuOLS7pekzN4htd3VN/KRjiixDUnEWFjZHjnAIccoXgwpWdu1FhmV
 GO03V0pPVV6dgx8WW/3kp0IzFLSLVlTIk7MHHxwJKHIH71Vx5zos+xw6nDwL3IV30/Ct
 HC0w==
X-Gm-Message-State: ACrzQf3bXfUxA+IQV+GfhFOgnm2guZmT8dKw5B+1WvloyOgN8VDWAMPK
 W7fhDe3OULn2onPo/WG7crqTuw==
X-Google-Smtp-Source: AMsMyM6DPO4r131p/AkrnBJsIg/pPdpNgGZzqHysb3GkGzz8lYKLY18dMnHntypNM/af/tAornEd+g==
X-Received: by 2002:a17:90b:3e8d:b0:203:1b6d:2112 with SMTP id
 rj13-20020a17090b3e8d00b002031b6d2112mr23327438pjb.6.1663964915447; 
 Fri, 23 Sep 2022 13:28:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0053ae018a91esm7005618pfk.173.2022.09.23.13.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:32 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 12/16] devres: Use kmalloc_size_roundup() to match ksize()
 usage
Date: Fri, 23 Sep 2022 13:28:18 -0700
Message-Id: <20220923202822.2667581-13-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; h=from:subject;
 bh=p9b8wNdLQUTcKVpskeYovP9HfQefiLH6cTy/WYiH/34=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhblaNBFxJTohammexHC6CbeJ0+h67dRN4PBtvwk
 5JonPTWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5QAKCRCJcvTf3G3AJv3zD/
 9LAMXluSBHTtqxb1umMTVE5i5sD3JCHrbpRq7+nm/ihvkEJ1pnKlLOmxomGKq8yeaSA69bZA8KfZSc
 CR5xfaDsFWx4j9MHisTXdoYIizPEmbqQRRqOxkcdkdBTXGB4/9y7dICzF8nG/wZnRE5cg43nOsJxA/
 hh08sM/Jc50zsKD8NK3U423EdCAh5Mur1N+IQdBrcIDvnYzrV9ox60ZBhTx1GxtTQH29f1M7tkTsxb
 CVJH0I7rS5lLvIDvLckMlcpX75U4M6OfFXPwwIxp8zwb/SpdErJg9OQ0Bc5aPbHKg5h0mzeyjxITo4
 Z8ePU5LP/HNZ40tbLl/4YQUWf9RwhgxmPxlaMerypnyhhY7RPOqjaEt4QjEp435c3lkzt/jPKVyQ00
 /BWZWjk3oYQBVD1YkNvQadr0W7iugWkFBmy0TMQKbpGlH/9UDUI6ZWX0cskd2A9Vm/9DXzxZlWfb5T
 46CEGwe6OTc72/fqVunf113g0JP/k16VF9IW4+cBz7fPkxp8MWBVHYsuByyGXMUPaQPem/RWWPBSdo
 m2SZX1ZgW/fXrsnRcDrhQ1bd8TrDPmojcGJefLK+ix//dr8fGR/Mmu8QlKJ5P4e96wfEoqQZTf9cys
 itlMdKLXQRmGqut8owpdZR9a0jlrGiYaoK47SOl258qhzKf6gWj/fY7i/IJw==
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Yonghong Song <yhs@fb.com>, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Round up allocations with kmalloc_size_roundup() so that devres's use
of ksize() is always accurate and no special handling of the memory is
needed by KASAN, UBSAN_BOUNDS, nor FORTIFY_SOURCE.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/base/devres.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 864d0b3f566e..7db20ce7ea8a 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -101,6 +101,9 @@ static bool check_dr_size(size_t size, size_t *tot_size)
 					size, tot_size)))
 		return false;
 
+	/* Actually allocate the full kmalloc bucket size. */
+	*tot_size = kmalloc_size_roundup(*tot_size);
+
 	return true;
 }
 
-- 
2.34.1

