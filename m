Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49243B57CBC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 15:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2120010E4A8;
	Mon, 15 Sep 2025 13:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="GFjgKUgO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Mon, 15 Sep 2025 13:23:22 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C0310E4A8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 13:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1757942600; x=1758547400; i=natalie.vock@gmx.de;
 bh=fyMOOUCoam/ib37j55c/zuWeEgYq6oPxD2lOjfP63RQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=GFjgKUgOZmUHk12ycUGvnLub9uprLKfmNnNOeWlBC8tgA66KhahDio1aNRhWRTBL
 qXHui2FsSs/w04QvXD2HyQ17cEt+aw/CmgLiGAfNzvjc2IvlGjVJ4hHK+rPfBpTte
 HBXUbP+cm3vt+4BFJEv7EMnJrhedHUhWMQOsjdhjLmsNYNR97UnrPOIuAF35ozBdv
 X4gQb4zlAQodRsF0S6JFMBSID7+7ES/+jJ/PGBAQZhvyMSkNcxdcT7ifrfhZFIXc7
 jhswxKXiaM5dS1DiTlaFSC0iv+2p4ipbeGRLUqsIDRls5OckmCtOCxQxFbsNYiSWn
 LHj3hJIHxufvsv0KNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7iCg-1uLK443Tda-00zh5p; Mon, 15
 Sep 2025 15:17:42 +0200
Message-ID: <6f4d8e35-5230-49ed-99e2-3d923e9d0012@gmx.de>
Date: Mon, 15 Sep 2025 15:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cgroup/dmem, drm/ttm: Improve protection in contended
 cases
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
 <01e2369e-1df2-446d-9f9d-59c86cc55a04@amd.com>
Content-Language: en-US
From: Natalie Vock <natalie.vock@gmx.de>
In-Reply-To: <01e2369e-1df2-446d-9f9d-59c86cc55a04@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Kx8C6UwtyWAsWPeku0jGhVghNmmker5SpH3buvNp42ADPhAsz0n
 SbTKeJoLFHXKtupg7khyFKlGZcnQJaZ01dfsg4/3w3x0pEjK+7raTYyS0XurQdm0Lpb2PDx
 n/fyNpRykSKz3V84Mbxx0tIPyHLEMXGTq7OQIhshSArCw5F0IxMp7gU3D1YBDJvXUCXFoMr
 7WqyvPLpMYHkvfC5Cu1ZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EG2Ms3GNLDs=;NIAAApGbRLeEv0UagC3iZNon+CC
 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
 KN20vPick/dwD8F6xE4
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

On 9/15/25 14:48, Christian K=C3=B6nig wrote:
> On 15.09.25 14:36, Natalie Vock wrote:
>> Hi all,
>>
>> I've been looking into some cases where dmem protection fails to preven=
t
>> allocations from ending up in GTT when VRAM gets scarce and apps start
>> competing hard.
>>
>> In short, this is because other (unprotected) applications end up
>> filling VRAM before protected applications do. This causes TTM to back
>> off and try allocating in GTT before anything else, and that is where
>> the allocation is placed in the end. The existing eviction protection
>> cannot prevent this, because no attempt at evicting is ever made
>> (although you could consider the backing-off as an immediate eviction t=
o
>> GTT).
>=20
> Well depending on what you gave as GEM flags from userspace that is expe=
cted behavior.
>=20
> For applications using RADV we usually give GTT|VRAM as placement which =
basically tells the kernel that it shouldn't evict at all and immediately =
fallback to GTT.

Yeah, in general this behavior is completely expected - though I'd argue=
=20
that protecting VRAM via dmemcg influences the semantics a little here.

Giving GTT|VRAM as placement from userspace essentially says "ok, please=
=20
try allocating this in VRAM, but it's ok to fall back to GTT" - whereas=20
specifying VRAM only essentially says "ok, please allocate this in VRAM,=
=20
and really try hard to keep it in VRAM whatever the cost".

Usually, resource allocation failing is good enough of an indicator that=
=20
it's not possible to allocate in VRAM. However, when the application's=20
memory is protected by dmemcg, it essentially says that it actually=20
should be possible to allocate up to that amount of memory - the cgroup=20
is entitled to that memory, and the other unprotected cgroups have to=20
make do with the rest.

I think it's a justifiable tradeoff between the indended function of=20
VRAM|GTT and the intended function of dmem memory protection to evict=20
these unprotected cgroups for only as long as the usage doesn't exceed=20
the awarded protection - this is what this series implements (dropping=20
the GTT flag in userspace would have negative implications in the case=20
the app uses more memory than the protection afforded to it, and as I=20
described, just letting protected memory allocations fall back to GTT is=
=20
insufficient too).

Thanks,
Natalie

>=20
> Regards,
> Christian.
>=20
>>
>> This series tries to alleviate this by adding a special case when the
>> allocation is protected by cgroups: Instead of backing off immediately,
>> TTM will try evicting unprotected buffers from the domain to make space
>> for the protected one. This ensures that applications can actually use
>> all the memory protection awarded to them by the system, without being
>> prone to ping-ponging (only protected allocations can evict unprotected
>> ones, never the other way around).
>>
>> The first two patches just add a few small utilities needed to implemen=
t
>> this to the dmem controller. The second two patches are the TTM
>> implementation:
>>
>> "drm/ttm: Be more aggressive..." decouples cgroup charging from resourc=
e
>> allocation to allow us to hold on to the charge even if allocation fail=
s
>> on first try, and adds a path to call ttm_bo_evict_alloc when the
>> charged allocation falls within min/low protection limits.
>>
>> "drm/ttm: Use common ancestor..." is a more general improvement in
>> correctly implementing cgroup protection semantics. With recursive
>> protection rules, unused memory protection afforded to a parent node is
>> transferred to children recursively, which helps protect entire
>> subtrees from stealing each others' memory without needing to protect
>> each cgroup individually. This doesn't apply when considering direct
>> siblings inside the same subtree, so in order to not break
>> prioritization between these siblings, we need to consider the
>> relationship of evictor and evictee when calculating protection.
>> In practice, this fixes cases where a protected cgroup cannot steal
>> memory from unprotected siblings (which, in turn, leads to eviction
>> failures and new allocations being placed in GTT).
>>
>> Thanks,
>> Natalie
>>
>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>> ---
>> Natalie Vock (4):
>>        cgroup/dmem: Add queries for protection values
>>        cgroup/dmem: Add dmem_cgroup_common_ancestor helper
>>        drm/ttm: Be more aggressive when allocating below protection lim=
it
>>        drm/ttm: Use common ancestor of evictor and evictee as limit poo=
l
>>
>>   drivers/gpu/drm/ttm/ttm_bo.c       | 79 +++++++++++++++++++++++++++++=
+++------
>>   drivers/gpu/drm/ttm/ttm_resource.c | 48 ++++++++++++++++-------
>>   include/drm/ttm/ttm_resource.h     |  6 ++-
>>   include/linux/cgroup_dmem.h        | 25 ++++++++++++
>>   kernel/cgroup/dmem.c               | 73 +++++++++++++++++++++++++++++=
++++++
>>   5 files changed, 205 insertions(+), 26 deletions(-)
>> ---
>> base-commit: f3e82936857b3bd77b824ecd2fa7839dd99ec0c6
>> change-id: 20250915-dmemcg-aggressive-protect-5cf37f717cdb
>>
>> Best regards,
>=20

