Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146F7762DA7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C1E10E43A;
	Wed, 26 Jul 2023 07:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-6.mta1.migadu.com (out-6.mta1.migadu.com
 [IPv6:2001:41d0:203:375::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873CE10E418
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:06:07 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1690355165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qP6Rsnsz9/WW+azSq2vXZZSPSLEyAJb/Z8peE40gYgo=;
 b=vw9dtxapJigzblTo3NGynfsv+/mQB1bNWjl6Q4rEAUF9PXc7LtA8X1zBeOoHG+17byUEV5
 rePGXHXPmPLeGOzGrE1/eqTwEdZgvDm17pzQtihT75dgxUeL35Q3sxqIVQekgyvV9/7bXJ
 pXhSlPCuY6BK9bze6xRNH/dP9jDuXVc=
MIME-Version: 1.0
Subject: Re: [PATCH v2 18/47] rcu: dynamically allocate the rcu-kfree shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-19-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 15:05:26 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <07191509-5186-487B-96D5-F859498CB93E@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-19-zhengqi.arch@bytedance.com>
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
 senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
> Use new APIs to dynamically allocate the rcu-kfree shrinker.
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> kernel/rcu/tree.c | 21 +++++++++++++--------
> 1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index 1449cb69a0e0..d068ce3567fc 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -3445,12 +3445,7 @@ kfree_rcu_shrink_scan(struct shrinker *shrink, =
struct shrink_control *sc)
> return freed =3D=3D 0 ? SHRINK_STOP : freed;
> }
>=20
> -static struct shrinker kfree_rcu_shrinker =3D {
> -	.count_objects =3D kfree_rcu_shrink_count,
> -	.scan_objects =3D kfree_rcu_shrink_scan,
> -	.batch =3D 0,
> -	.seeks =3D DEFAULT_SEEKS,
> -};
> +static struct shrinker *kfree_rcu_shrinker;

Same as patch #17.=
