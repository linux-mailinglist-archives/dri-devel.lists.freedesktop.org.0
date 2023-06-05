Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C351722BF3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA6A10E2F3;
	Mon,  5 Jun 2023 15:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073DB10E2F3;
 Mon,  5 Jun 2023 15:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685980303; x=1717516303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wBlzO0m7e+06ffK6F4CZHPjf68k4XsbL0e49Ityn51E=;
 b=awAecAM/N7x6UJXrHUNUMkf3OR7MgvGyKyaYedDOHOexzzB9XQeu/Jyp
 iikLnpQ43taxd4gaJQ28kSWLmbE2pHc7fCiABc2BSwAE8GGNV1az8fl5m
 YJrXTHfg/Dv0yDarXhOHqa9ve5L/P8v47ikKWZhn+5R64CelEFkhebGmZ
 iHWMIoFbZB0J/qp8BpbfENi+jpp/Hpt2N6To4aMsJtSQUT+j+9OsoBVEt
 sIsmDq81Io/dxY/ou1HsD+2tPa2f1yw+fUlFIaw029pKglQoUB8UjI23J
 CpOz2LOg38QVPc3Z40rYNo09/SCSFtVI1adSQdN8qmyf7vct63C3MUyGk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359714610"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="359714610"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 08:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="773779105"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="773779105"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.8.179])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 08:51:33 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>
Subject: Re: [RESUBMIT][PATCH] x86/mm: Fix PAT bit missing from page
 protection modify mask
Date: Mon, 05 Jun 2023 17:51:31 +0200
Message-ID: <2227080.iZASKD2KPV@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <5083c051-dfcf-ae23-195f-4c92bb875009@suse.com>
References: <20230519183634.190364-1-janusz.krzysztofik@linux.intel.com>
 <bd70e7b8-1971-6982-979a-ce1eb4c93465@suse.com>
 <5083c051-dfcf-ae23-195f-4c92bb875009@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: x86@kernel.org, Yu Zhao <yuzhao@google.com>,
 David Hildenbrand <david@redhat.com>, intel-gfx@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marek =?ISO-8859-1?Q?Marczykowski=2DG=F3recki?=
 <marmarek@invisiblethingslab.com>, Ingo Molnar <mingo@redhat.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(fixed misspelled Cc: email address of intel-gfx list)

On Friday, 2 June 2023 16:53:30 CEST Juergen Gross wrote:
> On 02.06.23 16:48, Juergen Gross wrote:
> > On 02.06.23 16:43, Borislav Petkov wrote:
> >> On Thu, Jun 01, 2023 at 10:47:39AM +0200, Juergen Gross wrote:
> >>> As described in the commit message, this only works on bare metal due to 
the
> >>> PAT bit not being needed for WC mappings.
> >>>
> >>> Making this patch Xen specific would try to cure the symptoms without 
fixing
> >>> the underlying problem: _PAGE_PAT should be regarded the same way as the 
bits
> >>> for caching mode (_PAGE_CHG_MASK).
> >>
> >> So why isn't _PAGE_PAT part of _PAGE_CHG_MASK?
> > 
> > This would result in problems for large pages: _PAGE_PSE is at the same
> > position as _PAGE_PAT (large pages are using _PAGE_PAT_LARGE instead).
> > 
> > Yes, x86 ABI is a mess.
> 
> Oh, wait: I originally thought _PAGE_CHG_MASK would be used for large pages,
> too. There is _HPAGE_CHG_MASK for that purpose.

Since _HPAGE_CHG_MASK has the _PAGE_PSE aka _PAGE_PAT bit already set, while 
_PAGE_CHK_MASK has not, the real question is not about large pages processing, 
I believe, which won't change whether we add _PAGE_PAT to _PAGE_CHG_MASK or 
not.

If we extend _PAGE_CHG_MASK with _PAGE_PAT bit then its value will be not any 
different from _HPAGE_CHG_MASK.  Then, one may ask why _HPAGE_CHG_MASK, with 
_PAGE_PSE aka PAGE_PAT bit set unlike in _PAGE_CHG_MASK, was introduced once 
for use with large pages, and _PAGE_CHG_MASK left intact for use with standard 
pages, if we now think that adding that bit to _PAGE_CHG_MASK won't break 
processing of standard pages.

If we are sure that adding _PAGE_PAT to _PAGE_CHG_MASK won't break any of its 
users then let's go for it.

Thanks,
Janusz

> 
> So adding _PAGE_PAT to _PAGE_CHG_MASK and _PAGE_PAT_LARGE to _HPAGE_CHG_MASK
> should do the job. At least I hope so.
> 
> 
> Juergen
> 




