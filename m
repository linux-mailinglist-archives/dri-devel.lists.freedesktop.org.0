Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1281A9F927E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 13:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A84710EF35;
	Fri, 20 Dec 2024 12:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0DqHpLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A4010E117;
 Fri, 20 Dec 2024 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734698827; x=1766234827;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=5Ocn+jWFBDXcvVZEroyNzYUYmGQOLYPSqU5A1IFsIBA=;
 b=C0DqHpLTRz1OSYXHhzscI49N2iYO7Z9HF4CHf6ujK6+XNd6kS6vCE97D
 SvyaDxE4rj2Fy0UUsxDgf80uZraYabJeodfCFe9oPWQV2v5WRCVv+QqW8
 tRr0OHBc91xA0fmznYIQecjf3gbG+dWKM6vKXWOCyGbcmDsJiWZG3Kzan
 /i4eK6ZS6sXybqk0mLIRI8+2NKuRr0MlalvjzZSklmypw3T9CH8PMYqkK
 mIx2qYL+PRFFxciyRQgxl0o7IGXNamqIgvkps6ElbdjPh8yxT58JpjjeR
 oS4hlDJfOPYQ58q45o8II28inG3tmz2S8QPtelogQAbLmowOy7S66vqcA g==;
X-CSE-ConnectionGUID: A/7K2Tg4S4+bBynqWKGJdQ==
X-CSE-MsgGUID: UKMKS2HzTxC069tsQrQKoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38930592"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="38930592"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 04:47:07 -0800
X-CSE-ConnectionGUID: 3nxr9j4TQiGTtaDiu+bX2g==
X-CSE-MsgGUID: Zn5u0Kx8TyiSvB26rr6IzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102634360"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 04:47:04 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Christoph Hellwig <hch@lst.de>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Linux MM <linux-mm@kvack.org>, Maciej
 Patelczyk <maciej.patelczyk@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
In-Reply-To: <173444476233.58433.15197725556816943129@jlahtine-mobl.ger.corp.intel.com>
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
 <173444476233.58433.15197725556816943129@jlahtine-mobl.ger.corp.intel.com>
Date: Fri, 20 Dec 2024 14:47:17 +0200
Message-ID: <87o716bjxm.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Joonas Lahtinen <joonas.lahtinen@linux.intel.com> writes:

> Quoting Joonas Lahtinen (2024-12-11 14:59:33)
>> Quoting Christian K=C3=B6nig (2024-12-10 16:03:14)
>
> <SNIP>
>
>> > If you really want to expose an interface to userspace which walks the=
 process
>> > page table, installs an MMU notifier, kmaps the resulting page and the=
n memcpy
>> > to/from it then you absolutely *must* run that by guys like Christoph =
Hellwig,
>> > Andrew and even Linus.
>
>> > I'm pretty sure that those guys will note that a device driver should
>> > absolutely not mess with such stuff.
>
> <SNIP>
>
>> >     But that seems like a high-overhead thing to do due to the overhea=
d of
>> >     setting up a transfer per data word and going over the PCI bus twi=
ce
>> >     compared to accessing the memory directly by CPU when it trivially=
 can.
>> >=20
>> >=20
>> > Understandable, but that will create another way of accessing process =
memory.
>
> Based on this feedback and some further discussion, we now have an altern=
ative
> implementation for this interface via access_process_vm function posted b=
y Mika:
>
> https://lore.kernel.org/dri-devel/20241216141721.2051279-1-mika.kuoppala@=
linux.intel.com/

v2:
https://lore.kernel.org/dri-devel/20241220113108.2386842-1-mika.kuoppala@li=
nux.intel.com/
-Mika

>
> It's a couple of dozen lines don't need to do any open-coded kmapping, on=
ly utilizing
> the pre-existing memory access functions.
>
> Hopefully that would address the above concerns?
>
> Regards, Joonas
>
> PS. It could still be optimized further to directly use the struct mm
> from within the mm notifier, and go with access_remote_vm using that,
> but would require new symbol export.
>
> For demonstration it is implemented by grabbing the task_struct and using
> the already exported access_process_vm function.
