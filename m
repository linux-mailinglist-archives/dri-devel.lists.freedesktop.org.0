Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A5B053E1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F7510E548;
	Tue, 15 Jul 2025 07:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXEKOdd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6146510E548;
 Tue, 15 Jul 2025 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752566388; x=1784102388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UeR90blzl1UkanLlvwh7Gs4nuz3Jzfvnov9b2Px8QHk=;
 b=OXEKOdd0Sxjs15A1de5OkADyNii8INyrNId5xt7j3whzggibr37S6DDI
 AY9oHsqZZuUtwZqjUUJM0D7u62iifj71MdifpxpN35DlxcqmmyyvBuyky
 bOG5hFIRqbYdKtL0kTLH/7P26xqckghwrl+NQr/X0hA1ulDQGrDBjDJ9J
 udjnrrET7gs85DTrzr3U/3Hxbny8y2EcuAgblVLpCUmg+82ov08Qa/qlq
 SmzEt/geznFP8AHM04l3/w3aeaErEH7rMAsLsv++PddyyAf5JDUcD0avy
 sqgievRNmhONBp1YW5poYktTfTEjwZlIEBS+gVpGJH2zQcTwBx72cScCf w==;
X-CSE-ConnectionGUID: RSD/Oa36Qj+qvfqOoNWrDg==
X-CSE-MsgGUID: 7hpqi/oIRiarYEmj+1PJEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54920733"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54920733"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:59:47 -0700
X-CSE-ConnectionGUID: LAglGVJPSx+FTNAdNBYyDw==
X-CSE-MsgGUID: ZxagDbPCR3a8lGaD4xN+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="156565039"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:59:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ubaZS-0000000Fadw-49Fb; Tue, 15 Jul 2025 10:59:26 +0300
Date: Tue, 15 Jul 2025 10:59:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, seanjc@google.com,
 pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, dave@stgolabs.net, jonathan.cameron@huawei.com,
 dave.jiang@intel.com, alison.schofield@intel.com,
 vishal.l.verma@intel.com, ira.weiny@intel.com,
 dan.j.williams@intel.com, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, marcin.s.wojtas@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, arend.vanspriel@broadcom.com,
 ilpo.jarvinen@linux.intel.com, jirislaby@kernel.org,
 jgross@suse.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, akpm@linux-foundation.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ming.li@zohomail.com, linux-cxl@vger.kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, kvalo@kernel.org, johannes.berg@intel.com,
 quic_ramess@quicinc.com, ragazenta@gmail.com,
 jeff.johnson@oss.qualcomm.com, mingo@kernel.org, j@jannau.net,
 linux@treblig.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 shenlichuan@vivo.com, yujiaoliang@vivo.com, colin.i.king@gmail.com,
 cvam0000@gmail.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com
Subject: Re: [PATCH] treewide: Fix typo "notifer"
Message-ID: <aHYKXgc2k5wDY32c@smile.fi.intel.com>
References: <B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com>
 <2025071545-endnote-imprison-2b98@gregkh>
 <5D06C25920559D71+06c9ce34-9867-495c-9842-dcfe9f1d51bb@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5D06C25920559D71+06c9ce34-9867-495c-9842-dcfe9f1d51bb@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Tue, Jul 15, 2025 at 03:53:18PM +0800, WangYuli wrote:
> On 2025/7/15 15:22, Greg KH wrote:
> > Please break this up into one-patch-per-subsystem, like is required for
> > things like this.

> Honestly, I've always been quite unsure how to handle situations like this.
> 
> It seems every subsystem maintainer has different preferences.

True, but at least if you see the specific driver in the MAINTAINERS, split for
that driver. For instance, 8250_dw in this patch is exactly the case.

> I've previously encountered some maintainers who suggested I split such
> patches by subsystem so each maintainer could merge them into their tree
> without contention. However, other ones have argued that fixing spelling
> errors isn't worth multiple commits, claiming it would create chaos.

> Since I genuinely discover these spelling errors by chance each time, and to
> avoid giving the impression I'm "spamming" the kernel tree for some ulterior
> motive, I've opted to squash them into a single commit.
> 
> That said, I personally don't have any strong feelings or preferences on
> this matter. Since you've requested it, I'll go ahead and split it up and
> send a v2 patchset.

-- 
With Best Regards,
Andy Shevchenko


