Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHttCaAAemn31QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:27:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C74A1347
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF8C10E09E;
	Wed, 28 Jan 2026 12:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="gTRY/WK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 882 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jan 2026 12:27:07 UTC
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2FF10E09E;
 Wed, 28 Jan 2026 12:27:07 +0000 (UTC)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SB138M1478460; Wed, 28 Jan 2026 04:12:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=Sd3tTNC9Qi1NraZ3FKZVjxKypYrlKrXHxdzsRn97YZE=; b=gTRY/WK5dlMJ
 +w33bnXlRn1cCiq77T2CcMcXQkZLDeCgVL96iSn62FmkkrRxzBM9MIvA0/cb+Yqp
 7K2voFCBRv+61xwztZqJKWxwspJ55PsOpC1EDOp9KTPbF6BIJWuk9ijNdT5ye3hN
 2qFlu8Baf7zOiO2sS+AFcRFjCj8EIQBI+FWjL8w8MnzADaoEJNxQSdivlV6UW3he
 /wb0Y/R32ZcnznUNp/NThA2xnL9bV+ILuQu5yUUX8YQKP21FSmcApEMpZ5O3AuC3
 /zWNiD+9HEYCHz+k7PzzpBd2lBlTxy8vvfv8sVuLDoGyHUQax4GHXHh1oNeRoIln
 Y1F/zIHK8w==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4bycg226fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Jan 2026 04:12:23 -0800 (PST)
Received: from devbig003.atn7.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 28 Jan 2026 12:12:18 +0000
From: Chris Mason <clm@meta.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Jarkko Sakkinen
 <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>, Vishal Verma
 <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Benjamin LaHaise <bcrl@kvack.org>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>,
 Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>,
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Mike Marshall
 <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Tony Luck
 <tony.luck@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Dave
 Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Babu Moger
 <babu.moger@amd.com>, Carlos Maiolino <cem@kernel.org>, Damien Le Moal
 <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain
 <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, Jann Horn <jannh@google.com>, Pedro Falcato
 <pfalcato@suse.de>, David Howells <dhowells@redhat.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn"
 <serge@hallyn.com>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>,
 <linux-sgx@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nvdimm@lists.linux.dev>, <linux-cxl@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-aio@kvack.org>,
 <linux-erofs@lists.ozlabs.org>, <linux-ext4@vger.kernel.org>,
 <linux-mm@kvack.org>, <ntfs3@lists.linux.dev>,
 <devel@lists.orangefs.org>, <linux-xfs@vger.kernel.org>,
 <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>, Jason
 Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 07/13] mm: update secretmem to use VMA flags on
 mmap_prepare
Date: Wed, 28 Jan 2026 04:08:36 -0800
Message-ID: <20260128121200.283932-1-clm@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a243a09b0a5d0581e963d696de1735f61f5b2075.1769097829.git.lorenzo.stoakes@oracle.com>
References: <cover.1769097829.git.lorenzo.stoakes@oracle.com>
 <a243a09b0a5d0581e963d696de1735f61f5b2075.1769097829.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:108::150d]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5OCBTYWx0ZWRfX/YMdvd0IEW+M
 mfJ/bYR9k4eRvDbs9QGzO+ygu2VSotJCKMMxUusrpYkrvYdQaFJRWVvBv2EkD12mCpCYEvw+XB/
 DwyN2M8BBbTeyqqZ9/i9fDyEPE0MOIwU1pNj8r3a1/SGXN38+xZGlcMtDVhwJA1iofmGT+NTjsa
 3wJFzmew6yuj81cYLEWiubhhxDZMBD6hVVMuqCOVg+bB7Gz9bEYCH56KvIcfJ13/7NnDlwWy1ay
 rut+pW91VzKqtLFjeZDFQXQuymj3+pWlazUmuuQXtfS+yB5rh8eIrZb/ZGDSDilJLhwKOSnwEsm
 tXIPQzyp+XE21UBIWU7JysVYMwhm9BUIbA4gV+4NNGJrteyEtklAhziLQl5fV0j0MzIV6sri7hz
 h9QDQw7JEBl4y5dfKeMuesm0LqUNBE+g04KLVmq1Y9FiJcFdRQVCoCh0B4S6SthUPRAGT0RWyAc
 Vh/HaT4eUcQ+KnB1bbQ==
X-Proofpoint-GUID: 6cECoo2vZpz-_Y4sX-WfJbWu0BG9k_53
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=6979fd27 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=VZ3cX_PGfQEInpbj4y4A:9
X-Proofpoint-ORIG-GUID: 6cECoo2vZpz-_Y4sX-WfJbWu0BG9k_53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,linux.intel.com,redhat.com,alien8.de,zytor.com,arndb.de,linuxfoundation.org,intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net,amd.com,zeniv.linux.org.uk,suse.cz,kvack.org,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,linux.dev,paragon-software.com,omnibond.com,arm.com,wdc.com,infradead.org,oracle.com,suse.com,nvidia.com,paul-moore.com,namei.org,hallyn.com,rasmusvillemoes.dk,vger.kernel.org,lists.linux.dev,lists.freedesktop.org,lists.ozlabs.org,lists.orangefs.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[clm@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[94];
	NEURAL_HAM(-0.00)[-0.998];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:mid,meta.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oracle.com:email]
X-Rspamd-Queue-Id: 74C74A1347
X-Rspamd-Action: no action

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> This patch updates secretmem to use the new vma_flags_t type which will
> soon supersede vm_flags_t altogether.
> 
> In order to make this change we also have to update mlock_future_ok(), we
> replace the vm_flags_t parameter with a simple boolean is_vma_locked one,
> which also simplifies the invocation here.
> 
> This is laying the groundwork for eliminating the vm_flags_t in
> vm_area_desc and more broadly throughout the kernel.
> 

Hi everyone,

Running mm-new through AI review flagged this one:

> diff --git a/mm/mmap.c b/mm/mmap.c
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -225,12 +225,12 @@ static inline unsigned long round_hint_to_min(unsigned long hint)
>  	return hint;
>  }
>
> -bool mlock_future_ok(const struct mm_struct *mm, vm_flags_t vm_flags,
> -			unsigned long bytes)
> +bool mlock_future_ok(const struct mm_struct *mm, bool is_vma_locked,
> +		     unsigned long bytes)
>  {
>  	unsigned long locked_pages, limit_pages;
>
> -	if (!(vm_flags & VM_LOCKED) || capable(CAP_IPC_LOCK))
> +	if (!is_vma_locked || capable(CAP_IPC_LOCK))
>  		return true;

[ ... ]

> @@ -416,7 +416,7 @@
>  		if (!can_do_mlock())
>  			return -EPERM;
>
> -	if (!mlock_future_ok(mm, vm_flags, len))
> +	if (!mlock_future_ok(mm, vm_flags & VM_LOCKED, len))
>  		return -EAGAIN;

This looks correct - do_mmap() now extracts the VM_LOCKED bit from
vm_flags and passes that to mlock_future_ok().

However, it appears check_brk_limits() was not updated when
mlock_future_ok() changed its signature. The function at mm/mmap.c:111
still passes the raw def_flags value:

    return mlock_future_ok(current->mm, current->mm->def_flags, len)
        ? 0 : -EAGAIN;

When def_flags has any bit set, this converts to true, incorrectly
triggering mlock limit checks even when VM_LOCKED is not set. Should
this be passing (current->mm->def_flags & VM_LOCKED) instead?

[ ... ]

Additionally, the test stub at tools/testing/vma/vma_internal.h:1627
still has the old signature (mm, vm_flags_t vm_flags, bytes) while the
production code now uses (mm, bool is_vma_locked, bytes). This could
cause compilation issues or mask bugs in the test suite.


