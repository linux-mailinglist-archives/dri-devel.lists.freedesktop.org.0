Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E173EFC4A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231656E438;
	Wed, 18 Aug 2021 06:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1486E43B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:24:13 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so8216821pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wNrSyu18+TQvxqozBk6dKmc83xjPuqXEkZM9+CZkQs8=;
 b=hq0RZc8pvhUdG6LQCrGBNQbN7VTMq2CkOF4QQtsj4WrxV2UTBN34Md8Gi7LkipMBy6
 xL7jSFJnNHOowLO3Jca2aK8bMlaJLC+laeAIEoH1LMm2sWoMULTrkMcKoRbBAsM8UOpd
 ihsdkkeDmGTdleDP1YZNWHcSi4UiGfzn3DsyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wNrSyu18+TQvxqozBk6dKmc83xjPuqXEkZM9+CZkQs8=;
 b=XRuHeWXMlc3ebobkLE+cFd4rPdW+61WuuRVX77RKVagAAw8/TfnozQBsG1HGWxF2xV
 Ss4y8TSFMUr1MWQ1mcSBy/eB0Bdvbw6tO+hcTHGhoOozBoWwSYGWyLaFieSjYl+WV3p/
 G4F+vtPYIEc4R4lRkD8V/aHyBQGEgOO9I3zkCNiPlaf//2HEwqMjCob1fFb8EUzGc9hv
 4XmuOIn2jugkkp/etbdCZ18n8eVdfkSToLtw4/5vtnPMxfIMj0QhU8ZAzihzZI0HusRI
 IE+4vgJZLDwzLUq/NdDJzLzHtzsGnJSQTwfFsm6q28ArB2v2oHOKA/S5qs1QeV+mkX3d
 kbgw==
X-Gm-Message-State: AOAM530++MUNNeEkYTXewcyJy0KlqbVaxcriUHthiXRZFjOFKMrgujBw
 PT54645Rt/MICaZrSqrtquqRVQ==
X-Google-Smtp-Source: ABdhPJxMkEdSe0VUFwn+z4vxkdsUFqJ2UwImPieDkAd2A7unXagJo2uR8zh40lbVDVJdC8iJXw8UiA==
X-Received: by 2002:a17:902:cec3:b0:12d:92c4:1ea6 with SMTP id
 d3-20020a170902cec300b0012d92c41ea6mr5911733plg.36.1629267853392; 
 Tue, 17 Aug 2021 23:24:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y13sm2710073pjr.50.2021.08.17.23.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:24:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 49/63] btrfs: Use memset_startat() to clear end of struct
Date: Tue, 17 Aug 2021 23:05:19 -0700
Message-Id: <20210818060533.3569517-50-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; h=from:subject;
 bh=j07ODF9kjbRRiHohObgJ1N/RHPZCTrQAmspnQvku4YA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMpNf/1TOA8EHO13yPM2WoVQcddjcJSpXNg/q95
 NGD5Kx+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKQAKCRCJcvTf3G3AJiFDD/
 43YRq8chsycAfEPzeH3ODP8oX8vzyejO0KZxGwB29jISLONkndclAADo87JB841bplfSqHF4g/N0Yr
 9BPUFM/u9aD6MYInBsgRcfvidkMVdvLwJHJroTXouReKf+wENJpCE42XqDFb6/OHW+qszfq48l2ZsZ
 vlrJcOJH5B/7MGz2vGlPOqarS6QPhKxELyHgWma5US/BF+fmqXoGyLI96PzJHBVwD8Fv1vRW+FZyYX
 mS0c778XSYdo50TMLiLEeybc58/w6WbytsuOe2gDRaDra0L+tnQU3bUemlEwF/otdXngLgjznL3aHr
 03wBbU/uuuYnsF2VxKSH3eTmyOXxM0Fc0gfhMAHlPYOx3FWaj25UujliZBiwYTeajzJsMlNaMxhyYC
 CNKnLKNfyeqkcnmjrNFG0fLVNoy2o0OR5zMuoedsu9e9ywbM82GfxRkHbOU9ZMZ5GgY2NMQXjzSHXm
 JS7ECNId/+w48q42Qz1RDDbkk71kX5clz/7ywEULnxcdaVF9VLida+SAjBnEmtDTTT5a3LFsbnweA7
 31UgpReo5DWgV9+9dvXi/NGJgP+uufVyB7FGtNrTHKNpqkfmCVfC6YFh7uVwrtuLat1U/8LUy3Rdgf
 RT0NM3pRRzNQ/fI9ZSg5+8wsIv5qwbvYlgUlhc046qXy22//QbKOPQkqvAQQ==
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

Cc: Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/btrfs/root-tree.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/root-tree.c b/fs/btrfs/root-tree.c
index 702dc5441f03..12ceb14a1141 100644
--- a/fs/btrfs/root-tree.c
+++ b/fs/btrfs/root-tree.c
@@ -39,10 +39,8 @@ static void btrfs_read_root_item(struct extent_buffer *eb, int slot,
 		need_reset = 1;
 	}
 	if (need_reset) {
-		memset(&item->generation_v2, 0,
-			sizeof(*item) - offsetof(struct btrfs_root_item,
-					generation_v2));
-
+		/* Clear all members from generation_v2 onwards. */
+		memset_startat(item, 0, generation_v2);
 		generate_random_guid(item->uuid);
 	}
 }
-- 
2.30.2

