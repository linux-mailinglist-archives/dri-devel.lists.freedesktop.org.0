Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E070B2246E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 12:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F5510E338;
	Tue, 12 Aug 2025 10:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6h3biQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEE710E335;
 Tue, 12 Aug 2025 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754993995; x=1786529995;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zAFcp/QTnT1l2ukv+QsVhroNnQIXExZ6gbQ8kNI15Z4=;
 b=S6h3biQaxWwgB07RQ8QSsK15azAhx+EqLByBMqgqlbtik/wWGEsqTx3G
 OITkgsZ0TsS6pVFDRQyElikxLyiakmLenno92BAbBztjKyRK9z2fCefbY
 iAho9pXHB690fkhIjC/48aqm6Y3tMQT4SrPPkU/FAGA8OAsPxyW6gEIZb
 IHuPvT8a1/xaYBEkqTjntAGOL94h8UbytpLVbjq7ng06m4NM6q5OgaHW5
 L/5UTbPOSJuqAhe5V1RjXLEEwi6Dd8WRLwCHWKbzVN66k5Gze8PWnXA2c
 Ab6+v/+jsrGvil5Rmx0Po8K58XaljeliG3uAjhY3Ku/MmD8fMEnkuEV0c w==;
X-CSE-ConnectionGUID: L4fdyhuhSY+42plUvUdTlA==
X-CSE-MsgGUID: P6NwSb/sQj6zJoPQ/IyBEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="59878878"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="59878878"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 03:19:55 -0700
X-CSE-ConnectionGUID: 62bdU62AR6WszWkrgbbdkg==
X-CSE-MsgGUID: 3V+TzUoRQm6AY0MpzI0QHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="197014270"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.68])
 ([10.245.245.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 03:19:53 -0700
Message-ID: <72385b2e6aa14b31b5d24deee0bc744af834f2da.camel@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: airlied@gmail.com, matthew.brost@intel.com
Date: Tue, 12 Aug 2025 12:19:51 +0200
In-Reply-To: <1ffa7bec-ed8d-47d7-9002-66c08b1c6e8f@amd.com>
References: <20250806132838.1831-1-christian.koenig@amd.com>
 <3ff97e0ee433817c0c071c264d3a28622d717dfa.camel@linux.intel.com>
 <d6830af2-52aa-4ca6-85c5-2a4635ce6c7d@amd.com>
 <be9d451d511f8bc4652d835a2c28fa823aaf05f1.camel@linux.intel.com>
 <76b287bf-9698-4df2-ac20-70b178a3a7c1@amd.com>
 <a0bf9d3ab00bf18783c75e453324e232633501f8.camel@linux.intel.com>
 <1ffa7bec-ed8d-47d7-9002-66c08b1c6e8f@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Tue, 2025-08-12 at 11:17 +0200, Christian K=C3=B6nig wrote:
> On 11.08.25 17:16, Thomas Hellstr=C3=B6m wrote:
> > >=20
> > > > FWIW If I understand the code correctly, i915 bypasses this by
> > > > setting
> > > > up user-space mappings not by vm_insert_pfn_prot() but using
> > > > apply_to_page_range(), mapping the whole bo.
> > >=20
> > > Yeah, that's probably not something we can do. Even filling in
> > > 2MiB
> > > of address space at a time caused performance problems for TTM.
> >=20
> > Wasn't that because of repeated calls to vmf_insert_pfn_prot(),
> > repeating the caching checks and page-table walk all the time?=C2=A0
>=20
> Only partially, the main problem was that only a fraction of the BO
> was actually CPU accessed. So filling in more than faulted was just
> overhead.
>=20
> > I think apply_to_page_range() should be pretty fast. Also, to avoid
> > regressions due to changing the number of prefaulted pages, we
> > could
> > perhaps honor the MADV_RANDOM and MADV_SEQUENTIAL advises for UMD
> > to
> > use; one faulting a single page only, one faulting the whole bo
>=20
> Ah! In my thinking apply_to_page_range() would always fault in the
> whole BO, if that still works for only a partial range than that
> should be ok.

Yes, it looks like it works with partial ranges.

>=20
> > , but
> > also see below:
> >=20
> > >=20
> > > We should probably just drop overriding the attributes in
> > > vmf_insert_pfn_prot().
> >=20
> > I think either solution will see resistance with arch people. We
> > should
> > probably involve them in the discussion.
>=20
> Any specific person I should CC or just x86@kernel.org?

scripts/get_maintainer.pl of a tiny change into the PAT code gives me
the following: Hopefully some of these should trigger some replies and
insights:


./scripts/get_maintainer.pl 0001-arch-mm-dummy-commit.patch=20
Dave Hansen <dave.hansen@linux.intel.com> (maintainer:X86 MM)
Andy Lutomirski <luto@kernel.org> (maintainer:X86 MM)
Peter Zijlstra <peterz@infradead.org> (maintainer:X86 MM)
Thomas Gleixner <tglx@linutronix.de> (maintainer:X86 ARCHITECTURE (32-
BIT AND 64-BIT))
Ingo Molnar <mingo@redhat.com> (maintainer:X86 ARCHITECTURE (32-BIT AND
64-BIT),commit_signer:10/16=3D62%,authored:2/16=3D12%)
Borislav Petkov <bp@alien8.de> (maintainer:X86 ARCHITECTURE (32-BIT AND
64-BIT))
x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
"H. Peter Anvin" <hpa@zytor.com> (reviewer:X86 ARCHITECTURE (32-BIT AND
64-BIT))
Andrew Morton <akpm@linux-foundation.org> (commit_signer:7/16=3D44%)
David Hildenbrand <david@redhat.com>
(commit_signer:6/16=3D38%,authored:6/16=3D38%,added_lines:68/105=3D65%,remo=
ve

d_lines:214/292=3D73%)
"Liam R. Howlett" <Liam.Howlett@oracle.com> (commit_signer:5/16=3D31%)
Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (commit_signer:5/16=3D31%)
Sean Christopherson <seanjc@google.com>
(authored:2/16=3D12%,added_lines:15/105=3D14%,removed_lines:31/292=3D11%)
"Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
(authored:1/16=3D6%)
Shivank Garg <shivankg@amd.com> (authored:1/16=3D6%)
Peter Xu <peterx@redhat.com> (added_lines:7/105=3D7%)
Dan Williams <dan.j.williams@intel.com> (removed_lines:27/292=3D9%)


>=20
> Thanks,
> Christian

