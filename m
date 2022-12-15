Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6958364D9B6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 11:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941D710E523;
	Thu, 15 Dec 2022 10:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2A410E534;
 Thu, 15 Dec 2022 10:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671101271; x=1702637271;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:cc:to:from:subject:message-id:date;
 bh=zXYj1X5CN56Thb0qJ7a7VOyNGgqdnnoyOz96f3OSkIQ=;
 b=oBwLuG6d6woeX1UwtYcqzOCZ2yZ336xc6NGjY67Ja3kSZTJqzwE0WwKh
 WOan53kSGHg4FZapfpMCXSEN6vWU3SPG2UsPVHrtHjyI4yHkridqz8VIj
 I1VR2hNWDnqydkh4ZjVz/Oc9z0Unos6vtdGDmERg3MlHCfzYHGy72bw2J
 EeKJ+KvdaZVJ5/yXn0bD+pomVM/lXk7tHeF0zVKro6GO3OLWZr4Z3+SAe
 zRe72A44h0tMWDEY/81kvn05qDz7nBD7ATbhTUhqpBSOiDV//fjEA7As0
 GipOxBQdwno9NMXKP9kLlwDR1IeGFMkt9kX2l6hwWFatwVkpNlvimUXIK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="318688889"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; d="scan'208";a="318688889"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 02:47:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="712856394"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; d="scan'208";a="712856394"
Received: from wokeeffe-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.6.24])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 02:47:43 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPM=9twhAL+c8mOLmidY_tEhEKwCh-CTjfs5yryOk8oGjMxuug@mail.gmail.com>
References: <Yz8rIxV7bVCcfZb0@kroah.com>
 <20221007013708.1946061-1-zyytlz.wz@163.com>
 <CAPM=9ty0+ouf+rQWhM=9XSKFOA2zxKfa00MsNBvwrQGPQm2uPQ@mail.gmail.com>
 <CAJedcCwxioxr+4TBTdrEjAZh97J3oroSHSgax+bxSNRXCBvkRg@mail.gmail.com>
 <CAPM=9twhAL+c8mOLmidY_tEhEKwCh-CTjfs5yryOk8oGjMxuug@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>, Zheng Hacker <hackerzheng666@gmail.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <167110126066.5360.11413014428644610672@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 15 Dec 2022 12:47:40 +0200
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
Cc: alex000young@gmail.com, security@kernel.org, airlied@linux.ie,
 gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 1002992920@qq.com, Zheng Wang <zyytlz.wz@163.com>,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(+ Tvrtko as FYI)

Zhenyu, can you take a look at the patch ASAP.

Regards, Joonas

Quoting Dave Airlie (2022-10-27 08:12:31)
> On Thu, 27 Oct 2022 at 13:26, Zheng Hacker <hackerzheng666@gmail.com> wro=
te:
> >
> > Dave Airlie <airlied@gmail.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=8827=E6=
=97=A5=E5=91=A8=E5=9B=9B 08:01=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Fri, 7 Oct 2022 at 11:38, Zheng Wang <zyytlz.wz@163.com> wrote:
> > > >
> > > > If intel_gvt_dma_map_guest_page failed, it will call
> > > > ppgtt_invalidate_spt, which will finally free the spt.
> > > > But the caller does not notice that, it will free spt again in erro=
r path.
> > > >
> > > > Fix this by spliting invalidate and free in ppgtt_invalidate_spt.
> > > > Only free spt when in good case.
> > > >
> > > > Reported-by: Zheng Wang <hackerzheng666@gmail.com>
> > > > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> > >
> > > Has this landed in a tree yet, since it's a possible CVE, might be
> > > good to merge it somewhere.
> > >
> > > Dave.
> > >
> >
> > Hi Dave,
> >
> > This patched hasn't been merged yet. Could you please help with this?
>=20
> I'll add some more people who can probably look at it.
>=20
> Dave.
