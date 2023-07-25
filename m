Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1231C760B75
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBEF10E39C;
	Tue, 25 Jul 2023 07:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 387 seconds by postgrey-1.36 at gabe;
 Tue, 25 Jul 2023 03:24:43 UTC
Received: from out-41.mta0.migadu.com (out-41.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF3810E150
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 03:24:43 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1690255481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6p0DFvIoLJzSIVM0qRIM/GXeN12xkckyA9Fji4TGEhI=;
 b=r9D+tXFVa/N1RN+BLv5WgR5iQ4rwtyebnPM62Sh3w2AQ+19WlSlFOjsJl5wosr8TEtJchn
 V877L2MD6oNieyuMlTG6JawmQ1ns/Fjh33pHsVXqhR6CCRTDc2499SUTwOS+JRsWVrdweW
 vS3GyBw0+b28Uj9NeJVk00fqQ8IPfLM=
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/47] mm: vmscan: move shrinker-related code into a
 separate file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
Date: Tue, 25 Jul 2023 11:23:54 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <6FE62F56-1B4E-4E2A-BEA9-0DA6907A2FA9@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
 <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
 <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
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



> On Jul 25, 2023, at 11:09, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
>=20
>=20
> On 2023/7/25 10:35, Muchun Song wrote:
>>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>>>=20
>>> The mm/vmscan.c file is too large, so separate the shrinker-related
>>> code from it into a separate file. No functional changes.
>>>=20
>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>> ---
>>> include/linux/shrinker.h |   3 +
>>> mm/Makefile              |   4 +-
>>> mm/shrinker.c            | 707 =
+++++++++++++++++++++++++++++++++++++++
>>> mm/vmscan.c              | 701 =
--------------------------------------
>>> 4 files changed, 712 insertions(+), 703 deletions(-)
>>> create mode 100644 mm/shrinker.c
>>>=20
>>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>>> index 224293b2dd06..961cb84e51f5 100644
>>> --- a/include/linux/shrinker.h
>>> +++ b/include/linux/shrinker.h
>>> @@ -96,6 +96,9 @@ struct shrinker {
>>>  */
>>> #define SHRINKER_NONSLAB (1 << 3)
>>>=20
>>> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct =
mem_cgroup *memcg,
>>> +    int priority);
>> A good cleanup, vmscan.c is so huge.
>> I'd like to introduce a new header in mm/ directory and contains =
those
>> declarations of functions (like this and other debug function in
>> shrinker_debug.c) since they are used internally across mm.
>=20
> How about putting them in the mm/internal.h file?

Either is fine to me.

>=20
>> Thanks.


