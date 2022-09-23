Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB65E838A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E67110E5DF;
	Fri, 23 Sep 2022 20:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9A810E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:30 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so1313768pjl.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=G7kCAYdmee+RZ/2FVUhmFmKba16DTFtB/qncTXfqL0g=;
 b=Y6E7L9J9UR374oBO9JTlj0UyLXz47O6O/vrwsT4xNx7MOToGuF3Haek94epLF2gKFc
 YHBgJXmOtfririgUsUdUJ7cJUEJhj34PvSPp7NewDy4HIxUbfstnz0HwtTKsvV+jUdM9
 ewYTBmIsL92mb0z3umh2K5ZPB3wBhsrYJr07w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=G7kCAYdmee+RZ/2FVUhmFmKba16DTFtB/qncTXfqL0g=;
 b=toHAysY2rWCTNy+mLhpzWzM2xIQp0CIPCgae554e0SvVuwiKKFeypZmEgOs9uVKtG0
 TO4wCqwH+nVWUDQRVirsDbvLzs1R37agdBirJhEgGD86P4RG+FLiufgWovf4/Y6CertW
 UUPKQZj5a/+26QzmWYEMjd4Yw7m7Avy8XSrOzBtJFipnp9ACvH7H1+vb1LneIaPPv8sD
 0Q4u0daAta1KJa1aeTit2nuxcgFukqnLKwKLqIs5TBb9T8n4glV+vtRYUTVNqu4Lk6Ol
 yzb3WNiBZjskqVf3et99V7SrGw+4PIply/ZOWsUHxYo4U1AXNs1CoOduN9Z6hvz90LcH
 x7qA==
X-Gm-Message-State: ACrzQf2JDtLIikdq/rBuaNBWnmHYI2uve3q/Z2ZFLqO8si5SgQ+zPg0B
 1POmL/yOiSuAwrUxHdnjrnsY+Q==
X-Google-Smtp-Source: AMsMyM4OIH2Kbz3W/dS5nJOpu2wzufZOda+7SbBQGOF/tLPl7Mw1AUJglcwrNduXNP5ZLvyQaDEecg==
X-Received: by 2002:a17:90b:1942:b0:202:cf66:f37f with SMTP id
 nk2-20020a17090b194200b00202cf66f37fmr22638049pjb.15.1663964909318; 
 Fri, 23 Sep 2022 13:28:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a6553cc000000b0041d6d37deb5sm6016364pgr.81.2022.09.23.13.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:28 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 06/16] igb: Proactively round up to kmalloc bucket size
Date: Fri, 23 Sep 2022 13:28:12 -0700
Message-Id: <20220923202822.2667581-7-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; h=from:subject;
 bh=laYkgTmsp2Dcg0WHHOT6ZPL9V6mSc2dOwctf45ZQYvY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhbkDJzHnX+sI3Vo1Qv14V482wiYBuOHMxTmnIBU
 huucnceJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5AAKCRCJcvTf3G3AJiyLEA
 CGMES+fC6ye1bGeS3O38IPkN3IQzERShfic80XY4a30XyimxkLkJSmvXpj+ewPNbHKoiUJTxKgZb/K
 XnxJDpvuDtFtz8bmbN5m2Yd+S7u9U0FJix4D0Bjc65bO2BLZ1p4skZ00ujWbdyLS1BgmyosrJ9xVP9
 Jeb1iFSNfgRZVKqrPKkicjNZr+6mjZxTYoH7c+LPVPfoyyMsulrIGhvF9VSVGvkUMxknLO8TmnWGGL
 YXw+DzIp3KOAD7McaSE+ctkuIt/4FqAoG9rJOaNF0THgqKo9qaiN3ta16/oNWQocOWuZiKKVTKaDQl
 ec8EwXmI83Hw0xcmg1Pk7Nyaa5u6CNYuOr6/QPIyHM/G9zTOgaQKJDjVdTfOWZueQU0z56sMQd76h2
 EgoHovJDkExXKzaR3tSExdysEeji5cAz5MTF6B5PhevY//J2SrfmsF3Umuqd3PdQ8Z+4FkekBNeaIt
 Wpzdj496etMeazF2E/aottRll8HUp1QXtMIraqM7WAgkIUg557ze4RTKXXeQvpWrgT6a464S9QSBKF
 D28gqdBRRs+c1X8XxNNTSpIWgjw0U1bUDku7eV4GRnqprMwn16uXdgttSoB7bVSJibtA6uv2jYfhpW
 HJE8ECmRl+W/2kM5Fz/2+NW1rofopoBc5f5LUPED2ZPHjOI5nqOO7GaJaF1w==
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, linux-hardening@vger.kernel.org,
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

In preparation for removing the "silently change allocation size"
users of ksize(), explicitly round up all q_vector allocations so that
allocations can be correctly compared to ksize().

Additionally fix potential use-after-free in the case of new allocation
failure: only free memory if the replacement allocation succeeds.

Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/intel/igb/igb_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
index 2796e81d2726..eb51e531c096 100644
--- a/drivers/net/ethernet/intel/igb/igb_main.c
+++ b/drivers/net/ethernet/intel/igb/igb_main.c
@@ -1195,15 +1195,16 @@ static int igb_alloc_q_vector(struct igb_adapter *adapter,
 		return -ENOMEM;
 
 	ring_count = txr_count + rxr_count;
-	size = struct_size(q_vector, ring, ring_count);
+	size = kmalloc_size_roundup(struct_size(q_vector, ring, ring_count));
 
 	/* allocate q_vector and rings */
 	q_vector = adapter->q_vector[v_idx];
 	if (!q_vector) {
 		q_vector = kzalloc(size, GFP_KERNEL);
 	} else if (size > ksize(q_vector)) {
-		kfree_rcu(q_vector, rcu);
 		q_vector = kzalloc(size, GFP_KERNEL);
+		if (q_vector)
+			kfree_rcu(q_vector, rcu);
 	} else {
 		memset(q_vector, 0, size);
 	}
-- 
2.34.1

