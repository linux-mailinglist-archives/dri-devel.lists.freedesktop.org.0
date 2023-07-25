Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD90760B78
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13B010E3A1;
	Tue, 25 Jul 2023 07:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 437 seconds by postgrey-1.36 at gabe;
 Tue, 25 Jul 2023 02:43:17 UTC
Received: from out-7.mta1.migadu.com (out-7.mta1.migadu.com [95.215.58.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DB110E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 02:43:17 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1690252555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+VnVPZa4UeOCG7Yrfiew8gKr6k3ViuPV5Oe7aKEwA0=;
 b=OouSnERnVUq8t87+qMJi+ElF1O+pkB5HJ/XjlEV4XPIdaL5qKz/r9JLMMUeUfOnb3ZMOdj
 khOpzTQ2idnb6S4y6b+9cHD3wy9I4UTOUPXGpsseW4bB+Gm8jsDjdu3ImL8BlNp++kk+K8
 DDellGRauVWKhKhaf7FrGB51gwHD7wU=
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/47] mm: vmscan: move shrinker-related code into a
 separate file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-2-zhengqi.arch@bytedance.com>
Date: Tue, 25 Jul 2023 10:35:01 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 25 Jul 2023 07:19:08 +0000
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
Cc: kvm@vger.kernel.org, djwong@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Linux Memory Management List <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com,
 Vlastimil Babka <vbabka@suse.cz>, linux-raid@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, netdev <netdev@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
> The mm/vmscan.c file is too large, so separate the shrinker-related
> code from it into a separate file. No functional changes.
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> include/linux/shrinker.h |   3 +
> mm/Makefile              |   4 +-
> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
> mm/vmscan.c              | 701 --------------------------------------
> 4 files changed, 712 insertions(+), 703 deletions(-)
> create mode 100644 mm/shrinker.c
>=20
> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index 224293b2dd06..961cb84e51f5 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -96,6 +96,9 @@ struct shrinker {
>  */
> #define SHRINKER_NONSLAB (1 << 3)
>=20
> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup =
*memcg,
> +			   int priority);

A good cleanup, vmscan.c is so huge.

I'd like to introduce a new header in mm/ directory and contains those
declarations of functions (like this and other debug function in
shrinker_debug.c) since they are used internally across mm.

Thanks.

