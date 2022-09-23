Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4115E83AD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5B910E97D;
	Fri, 23 Sep 2022 20:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC5210E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:34 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id rt12so1084356pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PCPU7pjQsz2sISTfhiNbNnCu1P7dpEEV5lOobjZTacw=;
 b=Iu9IAyDuLzG+6v/Qe/VDx2yB77cAoW4xXxxoWLwcPs2hQ2vdFhoGM7rk54C0JPoyAN
 AaLg5lQQvhHAFcTmsUdZWlK9hHQlqBPwPeDuvjvIf+b16rmlZZjb/iy/HTS0LU78apjW
 nLGtaiMCoXEcj1ad5zoxgqn0DT23BivJkRE/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PCPU7pjQsz2sISTfhiNbNnCu1P7dpEEV5lOobjZTacw=;
 b=Ykv/3a3yvOSwlkA+C2w4Kw+B8o1KaT3RH/oKF//AdR8bjwJnnN9DM7RweveXHPLDn7
 DHTrKSc3HlBvrIYlHWED7WcxClQX70dqL/WCLa3Ham9VIg0X+dGYY5hXJlaCZ/KvKPaE
 jJQEeDE96wk0acfmLFFiT9x1nothkVSbxKLceydm2x7Z1Vc1Y6/eisJ3VdgleUnlXtA7
 AdEkXz8NpdJC0qYlbeDxMlXVklERRCJ1Vmwy7eFN8Ly7VNB59zJGWxWQJ2csUzJxIVcd
 KP74l1V7H1AHY5BL2YBocbuZ4lNf+VvPluZ5oqMSlL0Qm3GwJyiYlRKWdb3rLLUZxqQy
 NiOQ==
X-Gm-Message-State: ACrzQf3BfpkpEhzvhWf5uwb+FE/sjZyJ38jEHRB7kjAmkNNytF+lqMSP
 t2V2ZVCx0YCMaiJmFQ1QZX9ppA==
X-Google-Smtp-Source: AMsMyM6XUwdmhAaIK2A3UxRxY7Sbzemd3FVYShW5LY9Q79SPPQFgRGi67TrIU8bwe4lKUNw9bOUpJw==
X-Received: by 2002:a17:90b:4b09:b0:202:ad77:9ee1 with SMTP id
 lx9-20020a17090b4b0900b00202ad779ee1mr11743471pjb.10.1663964914034; 
 Fri, 23 Sep 2022 13:28:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 p67-20020a622946000000b00528bd940390sm6579869pfp.153.2022.09.23.13.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:32 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 13/16] mempool: Use kmalloc_size_roundup() to match ksize()
 usage
Date: Fri, 23 Sep 2022 13:28:19 -0700
Message-Id: <20220923202822.2667581-14-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=821; h=from:subject;
 bh=1Gas3SCsMDWgBChil0VwFgY9Fr6zuZgi/zbZ+v/amZU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhblw9hPBOt2abeHvNz251QmxKrK5qZ9E2npmHln
 zyeWomSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5QAKCRCJcvTf3G3AJoKkD/
 0Rw7ftGkpv6Cp14LlheghY8ULuROeYsl+xBHJIECYJxb7Zj7xNiTAKJPkYJG2rfH7dJMP4mnVCyvlE
 aX9DI2jRbF0DpDm8X4kNTAYLiAnekyLGRBI1uuwyosPWzFt5fthMVPKTGw4skU5eJeoliXwvKRjc7w
 H2hvKX03v8bjW2hWSueT4lkm2RIg4t4qCd7tAHcfkVFPluuXqkRyHl5jKKj/gvloXfr0a7NEcoK6+B
 OMr9c7RIevNvATAWl7BVsl1C+sgXBlqnebMSX5UB3sQFDThE2TOU6PM8pwx2uGkviWtrIORGwdnrqF
 0BWUxYm3S7RgbB0E08f07OQbs6iZbOosdIECqTf8jwkxFWpqXk+ywZexmptnljyesSCsq4Q45yeVtp
 CivmXPCHnnW/ltVIwlzqLXkKSA1ANCZugfA9MQMfNYzYLJmYhU2oE75hyFkzyLL6O7DnVutl/lmgOX
 3BjHh5o+PuSYbw4gy0xL95tSHEokwlTTS9maudQ7pyB/lQFm8Got/UmZKScGYd6rVWQ+NR3+w3ud3e
 oz3kjiT0YzaO+sAjrsJDYKalavBaxhajZL8QMmPOZRL6XigFy+8x9O7y3Ji6lN4tryxNvAYJ08zYoV
 GZZ+QW0vnk/Etuibtx0IyAfth89gRlflFdIp1c7NouB249gCifAsYbMMOFbA==
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
 linux-hardening@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Yonghong Song <yhs@fb.com>, David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Alex Elder <elder@kernel.org>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Round up allocations with kmalloc_size_roundup() so that mempool's use
of ksize() is always accurate and no special handling of the memory is
needed by KASAN, UBSAN_BOUNDS, nor FORTIFY_SOURCE.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 mm/mempool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mempool.c b/mm/mempool.c
index 96488b13a1ef..0f3107b28e6b 100644
--- a/mm/mempool.c
+++ b/mm/mempool.c
@@ -526,7 +526,7 @@ EXPORT_SYMBOL(mempool_free_slab);
  */
 void *mempool_kmalloc(gfp_t gfp_mask, void *pool_data)
 {
-	size_t size = (size_t)pool_data;
+	size_t size = kmalloc_size_roundup((size_t)pool_data);
 	return kmalloc(size, gfp_mask);
 }
 EXPORT_SYMBOL(mempool_kmalloc);
-- 
2.34.1

