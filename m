Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23C25E5904
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 05:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5106010E00B;
	Thu, 22 Sep 2022 03:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B1C10E00B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 03:10:23 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id e5so7968485pfl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 20:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Vn16rLGrbDDjaKey8W5tBl33Bv/zSWk+J99kOTcbUQE=;
 b=AE85R2lewHV6WpJoVOU7vYZV1LEmLLSYclgKQnUnY2xKVDNii5Fo/BkTgD3yH2NCT3
 SVad2gPnMgif6X0cTuEEQWajnZUigllF8Swz/AIt7V/3KOVHG8p4eV2QEjA7+Ig8Tbzm
 hCWNqHwmKS+0LzUeaR2ah/lhPJclhFqcjfbic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Vn16rLGrbDDjaKey8W5tBl33Bv/zSWk+J99kOTcbUQE=;
 b=M2O0Ocf6jWxqXtePSn/TtEMZs3G2m+txOxtzC4WhR5Td6+mFWFFrJ1xj0pQtOhSZna
 17ETkEUP9NRPepW7C3imMBVe1sRJ0Vij18Atzskh6Z+S60K3aBAa7CHxis/MwO0f/emD
 EDZtPBmaRIWA5gV37X8JxvlqaKHuwdvF0dTJYwIRl/rGsqfJvznk/x/kSXOKOxw9oUy2
 jErsPwgtOwtiNMrJWtVL3D23a9wOTH/Je92a7c+6/8cOWdNSCGZpahBQTKtwGxCB4pAO
 5wHFtuVCbR5PRWK7Z6i6wbOdJj152Eekonp8I8wBfkyDv4X/8xmG7iR96PsLjSgFXTVf
 +bKQ==
X-Gm-Message-State: ACrzQf2lSrXkgZzbCPcwldfGFwPPg0NspL/gTWXfr9hLFv2Yw0PgIAzB
 qan4IkOtBfAHOCO5DLSz6msWgg==
X-Google-Smtp-Source: AMsMyM5kbtfQXBGy+UgqYmJ89cy++RVO/0JPV5R9E0qA9P5D2h03X/wzrRsUp18SKmZq4kCTVEHctQ==
X-Received: by 2002:a05:6a00:2314:b0:546:ce91:89a3 with SMTP id
 h20-20020a056a00231400b00546ce9189a3mr1393996pfh.77.1663816223317; 
 Wed, 21 Sep 2022 20:10:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a170902bd9500b001785fa792f4sm2713016pls.243.2022.09.21.20.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 20:10:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 00/12] slab: Introduce kmalloc_size_roundup()
Date: Wed, 21 Sep 2022 20:10:01 -0700
Message-Id: <20220922031013.2150682-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4981; h=from:subject;
 bh=s4SaVhOuX1ncHIDJErOKK4BV4PgBIHpDN/h97+EEvV8=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjK9ISNp90ZWOfSod9OsDV3Pgtvy1E13pzv3DCmYbF
 tf0g8d2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyvSEgAKCRCJcvTf3G3AJkzwD/
 wIy7miKIK9lOw6XzF5heENIATw2uhYlNzjs0acveP+ZCyoyc5I/WgCfqRAXAmHiXedbujzGw2FDqqT
 syY2emsesoSNP3gS/GOKo8RJDSOQC9cSQtEjb+mjbPF7Fkzqn/ZGRwMTbs9UaBsTj9Tj2fL7NNiO9p
 dwoQsa5XdmYV2vD0OlPuGJimN4Jz3oRQSNVQkawd+40awqnlGD9yQqU64uaLr5mwdGgPkIuw3aLLFd
 5YiPwZw6bM1vgbnqBIuIHr/Z7XwM9EEapPwfqVdg/9dcOavsB633n1itcgsIqIDBioJGxOM0Ts7T86
 4Jlikvby9AVebqTHq4+YuA+QwXaCQlzI8PxvKGF5ANAjeoheIYOhRCZTs4Dpe3aQtWFnO3FqVYLrzT
 cc2coPLbTlqbCxnMzWO5XK6k+LQJYAS5r5kCiddkkzITSqNSDkHLgAWrVT+WoO8GDM5wBJEy4K4BDX
 /s7uUaLCb4fXbubShHzmjelGTOPkp/YtKLrJhFLmk8oztScmMVc7cus/HhSCEpn2aXj3zHgtLJzUfw
 SN01q4wcwhmS6xqLuWl/PHEsTyaH69+g+rznvzhR64VGsg0V8g68wKeLcHDL9rQRALeFd3MBdV5n9s
 KFNBVsIrnbnnS1eImonqd1xuYH0pPRl+0Ng4aVcGGvP/yynpBokeriuTdCqA==
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
Cc: linux-wireless@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Jakub Kicinski <kuba@kernel.org>, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jacob Shin <jacob.shin@amd.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series fixes up the cases where callers of ksize() use it to
opportunistically grow their buffer sizes, which can run afoul of the
__alloc_size hinting that CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE
use to perform dynamic buffer bounds checking. Quoting the first patch:


In the effort to help the compiler reason about buffer sizes, the
__alloc_size attribute was added to allocators. This improves the scope
of the compiler's ability to apply CONFIG_UBSAN_BOUNDS and (in the near
future) CONFIG_FORTIFY_SOURCE. For most allocations, this works well,
as the vast majority of callers are not expecting to use more memory
than what they asked for.

There is, however, one common exception to this: anticipatory resizing
of kmalloc allocations. These cases all use ksize() to determine the
actual bucket size of a given allocation (e.g. 128 when 126 was asked
for). This comes in two styles in the kernel:

1) An allocation has been determined to be too small, and needs to be
   resized. Instead of the caller choosing its own next best size, it
   wants to minimize the number of calls to krealloc(), so it just uses
   ksize() plus some additional bytes, forcing the realloc into the next
   bucket size, from which it can learn how large it is now. For example:

	data = krealloc(data, ksize(data) + 1, gfp);
	data_len = ksize(data);

2) The minimum size of an allocation is calculated, but since it may
   grow in the future, just use all the space available in the chosen
   bucket immediately, to avoid needing to reallocate later. A good
   example of this is skbuff's allocators:

	data = kmalloc_reserve(size, gfp_mask, node, &pfmemalloc);
	...
	/* kmalloc(size) might give us more room than requested.
	 * Put skb_shared_info exactly at the end of allocated zone,
	 * to allow max possible filling before reallocation.
	 */
	osize = ksize(data);
        size = SKB_WITH_OVERHEAD(osize);

In both cases, the "how large is the allocation?" question is answered
_after_ the allocation, where the compiler hinting is not in an easy place
to make the association any more. This mismatch between the compiler's
view of the buffer length and the code's intention about how much it is
going to actually use has already caused problems[1]. It is possible to
fix this by reordering the use of the "actual size" information.

We can serve the needs of users of ksize() and still have accurate buffer
length hinting for the compiler by doing the bucket size calculation
_before_ the allocation. Code can instead ask "how large an allocation
would I get for a given size?".

Introduce kmalloc_size_roundup(), to serve this function so we can start
replacing the "anticipatory resizing" uses of ksize().

[1] https://github.com/ClangBuiltLinux/linux/issues/1599
    https://github.com/KSPP/linux/issues/183
-------

And after adding kmalloc_size_roundup(), put it to use with the various
ksize() callers, restore the previously removed __alloc_size hint,
and fix the use of __malloc annotations.

I tried to trim the CC list on this series since it got rather long. I
kept all the suggested mailing lists, though. :)

Thanks!

-Kees

Kees Cook (12):
  slab: Introduce kmalloc_size_roundup()
  skbuff: Proactively round up to kmalloc bucket size
  net: ipa: Proactively round up to kmalloc bucket size
  btrfs: send: Proactively round up to kmalloc bucket size
  dma-buf: Proactively round up to kmalloc bucket size
  coredump: Proactively round up to kmalloc bucket size
  igb: Proactively round up to kmalloc bucket size
  openvswitch: Proactively round up to kmalloc bucket size
  x86/microcode/AMD: Track patch allocation size explicitly
  iwlwifi: Track scan_cmd allocation size explicitly
  slab: Remove __malloc attribute from realloc functions
  slab: Restore __alloc_size attribute to __kmalloc_track_caller

 arch/x86/include/asm/microcode.h              |  1 +
 arch/x86/kernel/cpu/microcode/amd.c           |  3 +-
 drivers/dma-buf/dma-resv.c                    |  9 +++-
 drivers/net/ethernet/intel/igb/igb_main.c     |  1 +
 drivers/net/ipa/gsi_trans.c                   |  7 ++-
 drivers/net/wireless/intel/iwlwifi/dvm/dev.h  |  1 +
 drivers/net/wireless/intel/iwlwifi/dvm/scan.c | 10 +++-
 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h  |  3 +-
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c  |  3 +-
 drivers/net/wireless/intel/iwlwifi/mvm/scan.c |  6 +--
 fs/btrfs/send.c                               | 11 +++--
 fs/coredump.c                                 |  7 ++-
 include/linux/compiler_types.h                | 13 ++----
 include/linux/slab.h                          | 46 ++++++++++++++++---
 mm/slab_common.c                              | 17 +++++++
 net/core/skbuff.c                             | 34 +++++++-------
 net/openvswitch/flow_netlink.c                |  4 +-
 17 files changed, 125 insertions(+), 51 deletions(-)

-- 
2.34.1

