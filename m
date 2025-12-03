Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F94DC9EB45
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 11:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC85610E672;
	Wed,  3 Dec 2025 10:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKuF/Pu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3E610E672
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 10:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764757840; x=1796293840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ex4yp0DOTkoFkt2x0EIxntGcCcOHzUkfftORF0VeF0k=;
 b=kKuF/Pu+e62FwySDKPCB7yhSi+gq2mw5H6fYN08Ozz07xE/MoWFgpslD
 yvNTZ+prLBPVKPRvSWPfTTp50JlyyC+r5T6KGRT/53cRrYmYjFX6HFsyq
 tQtrmVm8FyEdTZzYVjdb9YActLH0gps6QQVWKs0pxJ2pJpl8wtD6t1Wq2
 7sQYLNsZwSlTdLCPEeLxQJQKTzPcnydSute+WO/klMa+Krjd7WSyvcAzO
 baTU15HSZFkpj/MuMdVklwwCEA22bAHQor3lojgjPz/RaY/opqGuLOIPG
 iDeH1rdfY4hSyqq7IMCQRvpehZAmyKN4bhzI9BeOHBJOOlOpnoESw1m2o g==;
X-CSE-ConnectionGUID: NEcys8O4SGSrakZdo3QPjw==
X-CSE-MsgGUID: J4URsY7yQJGXM5Aas7AnoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54295793"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="54295793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 02:30:40 -0800
X-CSE-ConnectionGUID: ZhJZdhKJSau9XettcOgwwA==
X-CSE-MsgGUID: nmR5KVlsS1i4rh21Y2R/iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="195059310"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 02:30:38 -0800
Date: Wed, 3 Dec 2025 11:30:36 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Helge Deller <deller@gmx.de>, Thorsten Blum <thorsten.blum@linux.dev>,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev/pxafb: Fix multiple clamped values in
 pxafb_adjust_timing
Message-ID: <aTARTP6VhZG7-JEf@black.igk.intel.com>
References: <20251202181600.511166-2-thorsten.blum@linux.dev>
 <a7213b69-f6ae-4975-8c8b-2783dbe9f9b3@gmx.de>
 <C3FDBCE7-14D9-4999-B463-C2E3E384E7DB@linux.dev>
 <77ac64e5-709d-4eb5-8b47-9fc15e579d1a@gmx.de>
 <aTAHkxg1_LDzZNSb@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTAHkxg1_LDzZNSb@smile.fi.intel.com>
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

On Wed, Dec 03, 2025 at 11:49:07AM +0200, Andy Shevchenko wrote:
> On Tue, Dec 02, 2025 at 08:36:08PM +0100, Helge Deller wrote:
> > On 12/2/25 19:36, Thorsten Blum wrote:
> > > On 2. Dec 2025, at 19:28, Helge Deller wrote:
> > > > On 12/2/25 19:15, Thorsten Blum wrote:
> 
> ...
> 
> > > > How did you notice? Do you actually have the hardware and tested it?
> > > 
> > > I only compile-tested it.
> > > 
> > > I stumbled upon another driver with the same bug and then used grep to
> > > search for other instances and found about 6 or 7, including this one.
> > 
> > Ok. But this then means, maybe the clamping isn't needed (since nobody complained),
> > or that nobody noticed because nobody uses the driver any longer.
> 
> I think it's a combination of factors: 1) rarely people have this hardware,
> especially nowadays, to run more or less new kernel; 2) there are no conditions
> happened that this patch fixes in their environments; 3) something else I
> missed.

I had a quick look at commit 3f16ff608a75 and seems like there wasn't much
happening either way.

Raag
