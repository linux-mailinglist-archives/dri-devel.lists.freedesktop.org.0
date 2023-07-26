Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D23762D9E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3F010E42A;
	Wed, 26 Jul 2023 07:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-1.mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB3A10E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:14:04 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1690355641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGcKZp3hFkU5xFrSCjAkw6H7DFoCu3eaWoJYWwGl/BE=;
 b=oAdnd9nZjeI3kyPEsvbWMnutbGwA6A/dnneU8CJq7+Jt5loXWooRhnwIByjGtqjMSkXONA
 pNjiGN0aO6zYh0sGJrXLfhIGW2JwY9JyCA6cMT7CdHDW/adI6zyBptMVHroPA7pSViOJ/f
 hCfYb58R4eJqbPwcBX6PzM13HtrcK50=
MIME-Version: 1.0
Subject: Re: [PATCH v2 21/47] mm: workingset: dynamically allocate the
 mm-shadow shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-22-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 15:13:37 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <08F2140B-0684-4FB0-8FB9-CEB88882F884@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-22-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Wed, 26 Jul 2023 07:30:32 +0000
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
 linux-mm@kvack.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 cel@kernel.org, x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 yujie.liu@intel.com, Vlastimil Babka <vbabka@suse.cz>,
 linux-raid@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 tytso@mit.edu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
> Use new APIs to dynamically allocate the mm-shadow shrinker.
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> mm/workingset.c | 26 ++++++++++++++------------
> 1 file changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/mm/workingset.c b/mm/workingset.c
> index 4686ae363000..4bc85f739b13 100644
> --- a/mm/workingset.c
> +++ b/mm/workingset.c
> @@ -762,12 +762,7 @@ static unsigned long scan_shadow_nodes(struct =
shrinker *shrinker,
> NULL);
> }
>=20
> -static struct shrinker workingset_shadow_shrinker =3D {
> -	.count_objects =3D count_shadow_nodes,
> -	.scan_objects =3D scan_shadow_nodes,
> -	.seeks =3D 0, /* ->count reports only fully expendable nodes */
> -	.flags =3D SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
> -};
> +static struct shrinker *workingset_shadow_shrinker;


Same as patch #17.=
