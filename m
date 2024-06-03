Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F938D7C71
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 09:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40B410E2DB;
	Mon,  3 Jun 2024 07:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfwCjBjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B98610E2DB;
 Mon,  3 Jun 2024 07:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717399716; x=1748935716;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=1uOBZ9DNGL1aMDu+BZY8z4um2Jts/ZdBXBPYGo1v13Y=;
 b=JfwCjBjWaxI+G+WgPLj+N0y57v3JrWDavVVHzyrYZrrHz8zeSLrUxBbj
 YUTMpQyuBE/XKF9cq5L2hy70uKiqZSQ/VcWJe4E4zPUw2zmL2TJ/pkUDw
 N5FgdsvdiyfW8SUMQ7no+V5YiWkTJgoZ2jJK7JETDatI0gVjJkFcRW9pd
 KMKWFtQdhIE4O2/5Y6Eru0r3O+lN0+5ILFbQzHvQA8gsZpgvBrVuq+DRf
 MCEGrlZNByjuO9QpQsUyjf73e+WYnqa1UKvH4Zhph68mrOcscDlSaGrV/
 StCr43wQpZgvUHm/LVtmFmGTo0DVAnCqYcftZ2Zl2JglyzV9hDCN9TkbR Q==;
X-CSE-ConnectionGUID: 3pXqmbSfRjmghow6cGiWfQ==
X-CSE-MsgGUID: IyjaXPR1SYG5F+mZMtZDPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24506599"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="24506599"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:28:35 -0700
X-CSE-ConnectionGUID: BDzlFZdESZe9aQx9tWMGsg==
X-CSE-MsgGUID: UpGVzFjxRRSssFOT0fwLWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="67631644"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.161])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:28:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Jun 2024 10:28:27 +0300 (EEST)
To: Chia-I Wu <olvaffe@gmail.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 christian.koenig@amd.com, alexander.deucher@amd.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>, 
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kernel/resource: optimize find_next_iomem_res
In-Reply-To: <CAPaKu7SsD+X7KAO=3vEYU_7YGM_f+7k1fdC9nEK=-NaJw8oYaA@mail.gmail.com>
Message-ID: <492bba9e-2e22-e6dd-e2e3-c218ec413c3e@linux.intel.com>
References: <20240531053704.2009827-1-olvaffe@gmail.com>
 <ZlmQ3_wcL3cgp4Hb@smile.fi.intel.com>
 <CAPaKu7SsD+X7KAO=3vEYU_7YGM_f+7k1fdC9nEK=-NaJw8oYaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2104200125-1717399707=:1529"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2104200125-1717399707=:1529
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 31 May 2024, Chia-I Wu wrote:
> On Fri, May 31, 2024 at 1:57=E2=80=AFAM Andy Shevchenko <andriy.shevchenk=
o@linux.intel.com>
> wrote:
>       On Thu, May 30, 2024 at 10:36:57PM -0700, Chia-I Wu wrote:
>       > We can skip children resources when the parent resource does not =
cover
>       > the range.
>       >
>       > This should help vmf_insert_* users on x86, such as several DRM
>       drivers.
>       > On my AMD Ryzen 5 7520C, when streaming data from cpu memory into
>       amdgpu
>       > bo, the throughput goes from 5.1GB/s to 6.6GB/s.=C2=A0 perf repor=
t says
>       >
>       >=C2=A0 =C2=A034.69%--__do_fault
>       >=C2=A0 =C2=A034.60%--amdgpu_gem_fault
>       >=C2=A0 =C2=A034.00%--ttm_bo_vm_fault_reserved
>       >=C2=A0 =C2=A032.95%--vmf_insert_pfn_prot
>       >=C2=A0 =C2=A025.89%--track_pfn_insert
>       >=C2=A0 =C2=A024.35%--lookup_memtype
>       >=C2=A0 =C2=A021.77%--pat_pagerange_is_ram
>       >=C2=A0 =C2=A020.80%--walk_system_ram_range
>       >=C2=A0 =C2=A017.42%--find_next_iomem_res
>       >
>       > before this change, and
>       >
>       >=C2=A0 =C2=A026.67%--__do_fault
>       >=C2=A0 =C2=A026.57%--amdgpu_gem_fault
>       >=C2=A0 =C2=A025.83%--ttm_bo_vm_fault_reserved
>       >=C2=A0 =C2=A024.40%--vmf_insert_pfn_prot
>       >=C2=A0 =C2=A014.30%--track_pfn_insert
>       >=C2=A0 =C2=A012.20%--lookup_memtype
>       >=C2=A0 =C2=A09.34%--pat_pagerange_is_ram
>       >=C2=A0 =C2=A08.22%--walk_system_ram_range
>       >=C2=A0 =C2=A05.09%--find_next_iomem_res
>       >
>       > after.
>=20
>       Is there any documentation that explicitly says that the children
>       resources
>       must not overlap parent's one? Do we have some test cases? (Either =
way
>       they
>       needs to be added / expanded).
>=20
> I think it's the opposite.=C2=A0 The assumption here is that a child=C2=
=A0is always a subset of
> its parent.=C2=A0 Thus, if the range to be checked is not covered by a pa=
rent, we can skip
> the children.
>
> That's guaranteed by=C2=A0__request_resource.=C2=A0 I am less sure about=
=C2=A0__insert_resource but
> it appears to be the case too.=C2=A0 FWIW, resource_is_exclusive has the =
same assumption
> already.

Yes, the children resources are contained within the parent resource (at=20
least in PCI but given the code, I'd expect that to be general state of=20
affairs).

> It looks like I need to do some refactoring to add tests.
>=20
>=20
>       P.S> I'm not so sure about this change. It needs a thoroughly testi=
ng,
>       esp.
>       in PCI case. Cc'ing to Ilpo.
>=20
> What's special about PCI?

--=20
 i.

--8323328-2104200125-1717399707=:1529--
