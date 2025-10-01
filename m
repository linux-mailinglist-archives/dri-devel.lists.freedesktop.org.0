Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C90BB0433
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 14:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAB810E095;
	Wed,  1 Oct 2025 12:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDaXI9bS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB5010E095;
 Wed,  1 Oct 2025 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759320038; x=1790856038;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dRQcB8GLQBycqfRcHZl9UDpBlWs1DGUahFyZdAVFz2A=;
 b=nDaXI9bSAjiMzgjyFtuORoZQSjeXX7br2SovQ8/UE1gObQBxvLeh7QtN
 B9vi6G75IKBmB2kzXtbSLds+JH3xC7NH1SuaOd3wgniBeEjThwcssu4lZ
 FovAQ6bajMbyMARLnDPaSOOWVXi+l5Ifq2woDYZ6B8HAvizOi6zvmKGnI
 zLJmXAfASF80a3bz0IA/z32zpNuvxY+E5pAVL8YreKTWr8zBD0PZcUQA2
 EY5LmS4j6GRam4fXceQkskApGA6unqxcu+HR4AdP2361Z0Ft0fF3IEEfM
 meolNJF3sJrnpX4SZFo/VIVoyDSh4XF9IpIEW6cXDnjtgU0igAyIyvXbT g==;
X-CSE-ConnectionGUID: kD0ttmOFRQSwCtl5Gw6aNw==
X-CSE-MsgGUID: yho8M4nUSJ6mEpjpZT9VpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65444692"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="65444692"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 05:00:38 -0700
X-CSE-ConnectionGUID: 17nQnyBlTUq5qFlD33DdIg==
X-CSE-MsgGUID: +AK7a2HgSZ+gn/1JPQrtxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178575408"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.98])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 05:00:32 -0700
Date: Wed, 1 Oct 2025 14:00:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, andi.shyti@linux.intel.com,
 ville.syrjala@linux.intel.com, nitin.r.gote@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzkaller@googlegroups.com
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in
 eb_release_vmas
Message-ID: <aN0X3ck-egLMn_Xy@ashyti-mobl2.lan>
References: <CAGfirffPy5biFVLtSNEW60UCXa6_=-=NrQbU7iLQ8+BXnFQ=1A@mail.gmail.com>
 <175922381867.30706.10351894191632562572@jlahtine-mobl>
 <CAGfirfdDe879wFzABVZkTV7grEimpnc0XrrKpj2SX1w_TLtgNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGfirfdDe879wFzABVZkTV7grEimpnc0XrrKpj2SX1w_TLtgNg@mail.gmail.com>
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

On Wed, Oct 01, 2025 at 12:14:41AM +0900, 김강민 wrote:
> Ok, I will do it.

when you do, can you please paste the link here?

Thanks,
Andi

> Best Regards,
> GangMin Kim.
> 
> 2025년 9월 30일 (화) 오후 6:17, Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>님이 작성:
> >
> > Hi,
> >
> > Can you please open a bug as per the instructions in:
> >
> > https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
> >
> > Thanks in advance!
> >
> > Regards, Joonas
