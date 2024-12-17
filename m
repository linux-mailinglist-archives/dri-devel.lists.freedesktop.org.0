Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EAB9F4D4B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E2310E982;
	Tue, 17 Dec 2024 14:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iicg//OS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A4A10E980;
 Tue, 17 Dec 2024 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734444769; x=1765980769;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:to:date:message-id;
 bh=CaJltsNoeXmQRM5tsrufBanE2Qh55lz8mcyu1kKLRZI=;
 b=iicg//OSV5i/SCFCeueD4W+PgHTT+P2Pl79hrZYH0SBN4oryzVdv9uV6
 B9TPoYAfFxAzm0e/Oo5PeOnnWEu2IZqSXCjCBbkv/EuBsawmzQE6PQIk5
 1OvpEz+Q/TqRsEYGIJZRiCdWtRQ6MoAga9f10y/H0TE6qSf7A7T+XRvxM
 +mjzwRZSSvUNYpKBZH+gzw54aqsGwNbf5nw3TQGhAIwWyfNB0aaDlBBdn
 oBCS0As339RV4+iT41IfzDy54lKJfWVJ6a07LeNkPKO/RxifyaxOg7MUD
 msubPOPhF0DypRnVO9ThkZr6xSCM4i5UAEEDNbQFPsfO6rdwuJX6z5OfU Q==;
X-CSE-ConnectionGUID: YZtDgqrRT0KKXqVZWtNAjg==
X-CSE-MsgGUID: W6HT6pBBRwSc3sN/0CUpMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45565579"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="45565579"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:12:49 -0800
X-CSE-ConnectionGUID: 6xIGBbAZRg24d1z6RCCp5w==
X-CSE-MsgGUID: 7t8X2hqiRQ2+hLjYJM4LUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="97588802"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.245.114])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:12:46 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173392197322.40386.12252741494998606453@jlahtine-mobl.ger.corp.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
 <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
 <173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com>
 <d2141daa-b556-4487-a310-69a7fea4eae8@amd.com>
 <173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com>
 <bbe0193c-8869-488a-ae23-139a244654c8@amd.com>
 <173392197322.40386.12252741494998606453@jlahtine-mobl.ger.corp.intel.com>
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Linux MM <linux-mm@kvack.org>, Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 17 Dec 2024 16:12:42 +0200
Message-ID: <173444476233.58433.15197725556816943129@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.10
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

Quoting Joonas Lahtinen (2024-12-11 14:59:33)
> Quoting Christian K=C3=B6nig (2024-12-10 16:03:14)

<SNIP>

> > If you really want to expose an interface to userspace which walks the =
process
> > page table, installs an MMU notifier, kmaps the resulting page and then=
 memcpy
> > to/from it then you absolutely *must* run that by guys like Christoph H=
ellwig,
> > Andrew and even Linus.

> > I'm pretty sure that those guys will note that a device driver should
> > absolutely not mess with such stuff.

<SNIP>

> >     But that seems like a high-overhead thing to do due to the overhead=
 of
> >     setting up a transfer per data word and going over the PCI bus twice
> >     compared to accessing the memory directly by CPU when it trivially =
can.
> >=20
> >=20
> > Understandable, but that will create another way of accessing process m=
emory.

Based on this feedback and some further discussion, we now have an alternat=
ive
implementation for this interface via access_process_vm function posted by =
Mika:

https://lore.kernel.org/dri-devel/20241216141721.2051279-1-mika.kuoppala@li=
nux.intel.com/

It's a couple of dozen lines don't need to do any open-coded kmapping, only=
 utilizing
the pre-existing memory access functions.

Hopefully that would address the above concerns?

Regards, Joonas

PS. It could still be optimized further to directly use the struct mm
from within the mm notifier, and go with access_remote_vm using that,
but would require new symbol export.

For demonstration it is implemented by grabbing the task_struct and using
the already exported access_process_vm function.
