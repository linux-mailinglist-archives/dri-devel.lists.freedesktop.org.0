Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70B9124161
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1646EA3D;
	Wed, 18 Dec 2019 08:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AA16E121;
 Tue, 17 Dec 2019 20:31:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsKoUYi0zuNy8kb6qtZE8ovcBMO0UKq8xVTHt+HKcQy3uj1aCP1WN3HW7o3VbFy+uF+EN5KftdJxtxihwQEwLvM0ANAslNhX0y5QHPN/VXIMk8VSiCS6yIjdQx5keKMFSNHMnFrg6EowdDbYroPaJZq97G7Lr4hqM0ZVlA5QJdrcweeoP+yrzDRMjcqKzpqX6GwxDFIznF2Th/kOThUOWlJhqfv8jwMC4kReAgmhU6C3ybMT012mRZMwxaJhaBYBtLPXA8wZwe2vCMdPWNmYyvD+AvCN2Lc7VBHOh6Ei/Z3c8HVxm9Jm4Tebc/hSNDpkATwSk+LLAqxBU3DUnZVN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWP0XlQzBSOyLUN9h3gYJ3PYKh3Ogy0DK6uhNFs5GrE=;
 b=gWAYhSHEnF4mUFU3Ra9fhKJlyhZUdq5+IG5rGhKNKHv2mP+U2O+v75gknSzAkMVKE4/C4GC9JIaHUcYZYWDU30P7pReKtW0x2GJGwgMl74z39sQA6+9cYhPvSd3brc298I7pIuVlawfDOkdxPhwDKAzRqQbV4QDZALO8YCAG0O488SrOFw8kVVWmuLEL9YhhiPgu1QFRED9DW0dEFnHneWyi8H622v6x0Ai1HVuPnE4FhOmlRZn/3GBiRr5VTi8PcVL33BMjXhCsw4AihaYG+iC+a6ukQGVJmtQtxk0YdTmDCOQpoDS0fBUv6X0SUWBQdavtiEadMaoAsohaDacK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWP0XlQzBSOyLUN9h3gYJ3PYKh3Ogy0DK6uhNFs5GrE=;
 b=g+UoS48w+9jr4NElVO5u8EGkaSXNCKmja8XVPOb0pNMgMzCAZ6rUeuTpDLV/hoZUUMGhZPTRrM9IKnPBnJmnUaBUi6aYyKNR4IYJXOAivPkN6kN0Z2LSraXynmZ7WcFspI8klSTQxsFq58B8AWLNh25ogq+schIcUUI865FtHkY=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4445.eurprd05.prod.outlook.com (52.133.15.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Tue, 17 Dec 2019 20:31:07 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b%6]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 20:31:07 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC v2 05/12] drm/i915/svm: Page table mirroring support
Thread-Topic: [RFC v2 05/12] drm/i915/svm: Page table mirroring support
Thread-Index: AQHVsgG/1g0JQ+cEg0CVcAhvy37lc6e+zcmA
Date: Tue, 17 Dec 2019 20:31:07 +0000
Message-ID: <20191217203103.GG16762@mellanox.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-6-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191213215614.24558-6-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN3PR03CA0073.namprd03.prod.outlook.com
 (2a01:111:e400:7a4d::33) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a14be4c4-ac40-4074-578f-08d783300b88
x-ms-traffictypediagnostic: VI1PR05MB4445:
x-microsoft-antispam-prvs: <VI1PR05MB4445B432DC62157CB2FC2FA7CF500@VI1PR05MB4445.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(189003)(199004)(8936002)(478600001)(26005)(5660300002)(54906003)(316002)(4326008)(81166006)(81156014)(86362001)(36756003)(33656002)(2616005)(8676002)(6506007)(1076003)(71200400001)(52116002)(7416002)(6512007)(2906002)(66556008)(64756008)(66446008)(66946007)(66476007)(6486002)(186003)(6916009)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4445;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SjKxXavog07BTt1AdsKMrCzixlo/7L16M28n+PRZUTIeDUWcH51N92fHzeHg9qeLSEYV5CQG82APQPbMWtlrii1Jj+CYzPS1V6m+mu4nipvb0/10MfvcSeTpbAfA0vdyTnjByhAeib/CtUwEiCY3rjktHSRDNA6NZ3XQj636f4YA4Y5StjeytxmAYfLj+0MrNMtaSAjBXnLspMUNTdadqyQEts0eNVtc9qW+id6miugCxgb8bGU6cgEJ4hXgsTBo82k0xrliUkWP5OTnV9Ofs0Te26PuMBfQL+GjI43DCZrtd4/X4h9YUXFzOuUSinnDJBMz1K3IZ9+nAKzKxA4PtlpcIzdkm2kbkuxnXxff/S5XdmFJZXAts5GK+DoWSoxt0u/YglC40OEX30nFqtwPKx8Pzzv2DaLPZjAGpuWJl01fleMP2iLigR9NIUXUscNRTkw5AHSJ1UamxXI4upx2ldXC1OdpkN9H1M1UZSzux+g=
x-ms-exchange-transport-forked: True
Content-ID: <CC28EBB7682C0140A09B55E0CE6E08B6@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a14be4c4-ac40-4074-578f-08d783300b88
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 20:31:07.3287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3NF8JPLxDU63Q3vpAFV6lTP5VDEagPnUREg/LYrUYHDrPsKuHgeEXiy0e6xanFbnhb+xaXwXHOuLt9AJNip2iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4445
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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
Cc: "kenneth.w.graunke@intel.com" <kenneth.w.graunke@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jason.ekstrand@intel.com" <jason.ekstrand@intel.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 01:56:07PM -0800, Niranjana Vishwanathapura wrote:
> +static struct i915_svm *vm_get_svm(struct i915_address_space *vm)
> +{
> +	struct i915_svm *svm = vm->svm;
> +
> +	mutex_lock(&vm->svm_mutex);
> +	if (svm && !kref_get_unless_zero(&svm->ref))
> +		svm = NULL;

Quite strange to see a get_unless_zero under a lock..

> +static void release_svm(struct kref *ref)
> +{
> +	struct i915_svm *svm = container_of(ref, typeof(*svm), ref);
> +	struct i915_address_space *vm = svm->vm;
> +
> +	mmu_notifier_unregister(&svm->notifier, svm->notifier.mm);

This would be a lot better to use mmu_notifier_put to manage the
reference and deallocation.

> +static u32 i915_svm_build_sg(struct i915_address_space *vm,
> +			     struct hmm_range *range,
> +			     struct sg_table *st)
> +{
> +	struct scatterlist *sg;
> +	u32 sg_page_sizes = 0;
> +	u64 i, npages;
> +
> +	sg = NULL;
> +	st->nents = 0;
> +	npages = (range->end - range->start) / PAGE_SIZE;
> +
> +	/*
> +	 * No need to dma map the host pages and later unmap it, as
> +	 * GPU is not allowed to access it with SVM.
> +	 * XXX: Need to dma map host pages for integrated graphics while
> +	 * extending SVM support there.
> +	 */
> +	for (i = 0; i < npages; i++) {
> +		u64 addr = range->pfns[i] & ~((1UL << range->pfn_shift) - 1);
> +
> +		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
> +			sg->length += PAGE_SIZE;
> +			sg_dma_len(sg) += PAGE_SIZE;
> +			continue;
> +		}
> +
> +		if (sg)
> +			sg_page_sizes |= sg->length;
> +
> +		sg =  sg ? __sg_next(sg) : st->sgl;
> +		sg_dma_address(sg) = addr;
> +		sg_dma_len(sg) = PAGE_SIZE;

This still can't be like this - assigning pfn to 'dma_address' is
fundamentally wrong.

Whatever explanation you had, this needs to be fixed up first before we get
to this patch.

> +static int i915_range_fault(struct svm_notifier *sn,
> +			    struct drm_i915_gem_vm_bind *args,
> +			    struct sg_table *st, u64 *pfns)
> +{
> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	/* Have HMM fault pages within the fault window to the GPU. */
> +	struct hmm_range range = {
> +		.notifier = &sn->notifier,
> +		.start = sn->notifier.interval_tree.start,
> +		.end = sn->notifier.interval_tree.last + 1,
> +		.pfns = pfns,
> +		.pfn_shift = PAGE_SHIFT,
> +		.flags = i915_range_flags,
> +		.values = i915_range_values,
> +		.default_flags = (range.flags[HMM_PFN_VALID] |
> +				  ((args->flags & I915_GEM_VM_BIND_READONLY) ?
> +				   0 : range.flags[HMM_PFN_WRITE])),
> +		.pfn_flags_mask = 0,
> +
> +	};
> +	struct i915_svm *svm = sn->svm;
> +	struct mm_struct *mm = sn->notifier.mm;
> +	struct i915_address_space *vm = svm->vm;
> +	u32 sg_page_sizes;
> +	u64 flags;
> +	long ret;
> +
> +	while (true) {
> +		if (time_after(jiffies, timeout))
> +			return -EBUSY;
> +
> +		range.notifier_seq = mmu_interval_read_begin(range.notifier);
> +		down_read(&mm->mmap_sem);
> +		ret = hmm_range_fault(&range, 0);
> +		up_read(&mm->mmap_sem);
> +		if (ret <= 0) {
> +			if (ret == 0 || ret == -EBUSY)
> +				continue;
> +			return ret;
> +		}
> +
> +		sg_page_sizes = i915_svm_build_sg(vm, &range, st);
> +		mutex_lock(&svm->mutex);
> +		if (mmu_interval_read_retry(range.notifier,
> +					    range.notifier_seq)) {
> +			mutex_unlock(&svm->mutex);
> +			continue;
> +		}
> +		break;
> +	}
> +
> +	flags = (args->flags & I915_GEM_VM_BIND_READONLY) ?
> +		I915_GTT_SVM_READONLY : 0;
> +	ret = svm_bind_addr_commit(vm, args->start, args->length,
> +				   flags, st, sg_page_sizes);
> +	mutex_unlock(&svm->mutex);

This looks better..

> +int i915_gem_vm_bind_svm_buffer(struct i915_address_space *vm,
> +				struct drm_i915_gem_vm_bind *args)
> +{
> +	struct svm_notifier sn;
> +	struct i915_svm *svm;
> +	struct mm_struct *mm;
> +	struct sg_table st;
> +	u64 npages, *pfns;
> +	int ret = 0;
> +
> +	svm = vm_get_svm(vm);
> +	if (!svm)
> +		return -EINVAL;
> +
> +	mm = svm->notifier.mm;
> +	if (mm != current->mm) {
> +		ret = -EPERM;
> +		goto bind_done;
> +	}

Bit strange, we have APIs now to make it fairly easy to deal with
multiple processe, (ie the get/put scheme) why have this restriction?

> +
> +	args->length += (args->start & ~PAGE_MASK);
> +	args->start &= PAGE_MASK;
> +	DRM_DEBUG_DRIVER("%sing start 0x%llx length 0x%llx vm_id 0x%x\n",
> +			 (args->flags & I915_GEM_VM_BIND_UNBIND) ?
> +			 "Unbind" : "Bind", args->start, args->length,
> +			 args->vm_id);
> +	if (args->flags & I915_GEM_VM_BIND_UNBIND) {
> +		i915_gem_vm_unbind_svm_buffer(vm, args->start, args->length);
> +		goto bind_done;
> +	}
> +
> +	npages = args->length / PAGE_SIZE;
> +	if (unlikely(sg_alloc_table(&st, npages, GFP_KERNEL))) {
> +		ret = -ENOMEM;
> +		goto bind_done;
> +	}
> +
> +	pfns = kvmalloc_array(npages, sizeof(uint64_t), GFP_KERNEL);
> +	if (unlikely(!pfns)) {
> +		ret = -ENOMEM;
> +		goto range_done;
> +	}
> +
> +	ret = svm_bind_addr_prepare(vm, args->start, args->length);
> +	if (unlikely(ret))
> +		goto prepare_done;
> +
> +	sn.svm = svm;
> +	ret = mmu_interval_notifier_insert(&sn.notifier, mm,
> +					   args->start, args->length,
> +					   &i915_svm_mni_ops);
> +	if (!ret) {
> +		ret = i915_range_fault(&sn, args, &st, pfns);
> +		mmu_interval_notifier_remove(&sn.notifier);
> +	}

success oriented flow...

> +static int
> +i915_svm_invalidate_range_start(struct mmu_notifier *mn,
> +				const struct mmu_notifier_range *update)
> +{
> +	struct i915_svm *svm = container_of(mn, struct i915_svm, notifier);
> +	unsigned long length = update->end - update->start;
> +
> +	DRM_DEBUG_DRIVER("start 0x%lx length 0x%lx\n", update->start, length);
> +	if (!mmu_notifier_range_blockable(update))
> +		return -EAGAIN;
> +
> +	i915_gem_vm_unbind_svm_buffer(svm->vm, update->start, length);
> +	return 0;
> +}

I still think you should strive for a better design than putting a
notifier across the entire address space..

> +
> +#if defined(CONFIG_DRM_I915_SVM)
> +struct i915_svm {
> +	/* i915 address space */
> +	struct i915_address_space *vm;
> +
> +	struct mmu_notifier notifier;
> +	struct mutex mutex; /* protects svm operations */
> +	/*
> +	 * XXX: Probably just make use of mmu_notifier's reference
> +	 * counting (get/put) instead of our own.
> +	 */

Yes

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
