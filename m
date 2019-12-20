Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBF51292AA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086216E1B8;
	Mon, 23 Dec 2019 08:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50051.outbound.protection.outlook.com [40.107.5.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923066E061;
 Fri, 20 Dec 2019 13:45:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUflxqZUiD9xyXj63/lAzz9Nt8E9uicRnIqyEJZ9VCJ8sI6mITQ539u/KIlJauS+Zz65u+JNi5mJR0I1w4W+YvM6HMSheVGv1SVaAKsukjFIeI56YgceGGKRvlt+42EYB23fWS62n0DQmsTwGNuvTR3Tkl4iCsu95FELu+mrUVhYgRphHsuESWVYdcMX56HLFqLaGAKPxY3X+kNdMI2l/TVrTdoCceZ3GsfAnld7Ch5jJsCwz0UgWTg+d1LXRvnVCaD/0u1iqu22sIUw6BXLh4SlrTWEadqwuTFsDjpR/ojzwV30VTRsQB09IudiUm9KEl8eYeqrfh3UTiG4+z2bIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlU172fXnhIILXI5qa5xCkkFFSaMSnId4T0nVx/nBkg=;
 b=QG8Rl7uPKsNJo5A5ktODGvV40H3gk8buBgCjP8gJgIwFIbnLdfY/fwBWLLsoofJzHmt1tANHSr8VW430pStkH7iLBAjOLETdGHpaIqPgPvAwanCbMkK64bjDGTArE5jrh6Pk/vNEotHKAe49Eb21iXI7nfM+AEA8cMGJJg4XmZ452DkMOjinIB0AhPkFItqdXGxE47jfF4FXGg/4W1DNnZz5ek/OB8dtTXhouHmMUZZPuoZhrQGKxxnIip1SNQJbgZWls4IqreQ+GWeFCujsANL6+8/p3xtCvCJSJrWqVq+GEQoAxfNi6L2BxGg3rxRPvmrrtwjFRFFf9lz9880r6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlU172fXnhIILXI5qa5xCkkFFSaMSnId4T0nVx/nBkg=;
 b=oRskD7rufY7V/whYRqbUlnv06HYjhAi0A3BZPaFTHoUKP5NCG5enAIJIh6UblQZaa1U4Qd1TgyHqdzqyhmAm/4pOkC5oYJUi+WZ5t63lgGzfkUg8GlueLm91VKEW1n+sI7679/7M14k662uH7TBkw4TsJuw6uy6UhMC70atvI50=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6256.eurprd05.prod.outlook.com (20.178.204.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Fri, 20 Dec 2019 13:45:33 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b%6]) with mapi id 15.20.2559.012; Fri, 20 Dec 2019
 13:45:33 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC v2 05/12] drm/i915/svm: Page table mirroring support
Thread-Topic: [RFC v2 05/12] drm/i915/svm: Page table mirroring support
Thread-Index: AQHVsgG/1g0JQ+cEg0CVcAhvy37lc6e+zcmAgAG23ICAAo7SgA==
Date: Fri, 20 Dec 2019 13:45:33 +0000
Message-ID: <20191220134529.GW16762@mellanox.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-6-niranjana.vishwanathapura@intel.com>
 <20191217203103.GG16762@mellanox.com>
 <20191218224147.GB17413@nvishwa1-DESK.sc.intel.com>
In-Reply-To: <20191218224147.GB17413@nvishwa1-DESK.sc.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:208:160::26) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 31a0451c-deda-41aa-7970-08d78552e2aa
x-ms-traffictypediagnostic: VI1PR05MB6256:
x-microsoft-antispam-prvs: <VI1PR05MB6256F23CA6D3A23391680D39CF2D0@VI1PR05MB6256.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 025796F161
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(199004)(189003)(66556008)(66476007)(2616005)(26005)(5660300002)(81166006)(66446008)(186003)(1076003)(66946007)(64756008)(6916009)(52116002)(6486002)(71200400001)(8936002)(2906002)(7416002)(478600001)(54906003)(33656002)(4326008)(86362001)(6512007)(36756003)(8676002)(6506007)(81156014)(316002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6256;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZEN1gy9zfyUUCXS1xaeg25viukm2lp3JZfzj8NsTkZqvm2xg/PML08WfilKnz4wp37dnF1eoN5CC2Dc4Ss4HWhRmnzPbi8AN896JFPOg71OHgr4FKcxHePXyadXSowaRkpalte/oINgYd7e4brXUh7bpnuvaTYrEzSWuhrX7dH+FbrSrkDhamYYxbL55a+3ozBvX2OjjronLvWEnip5YmOIb54ihNQAX7THyoduSh1+HwVpfbDEIC7EB9XJjjfg/ffsGcUO1ENmhlYkGMwoEkKGjeVVO11n3Ot5j1ryOgjw6QdqCNpG5xRnmIcO4iQ9Yh44qtunP0r5UI/eECh5cA/JFPaBPA2/GqcHA1ZP+OM3553O5Re0clJ4XauaUsN+KcrXENwptJPMOfT2Ew5Gc/sATE9EmKPB3e6gquGRQpAuERLbp4/WyxBTimD02JVqfdp3uqbIoimJmlQSBjmUzDxexsUImvaLODgNiaJBc19OH+qdpA8n83LLT/7cUXwHE
x-ms-exchange-transport-forked: True
Content-ID: <D04A178D2FE0F244AA59E0BA5FD62278@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a0451c-deda-41aa-7970-08d78552e2aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2019 13:45:33.5038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0zGW78S7s/pOv/eqG16fTz9M4fJaAa+jr062vJLNV0JCJN3LwYP9yaoM78Rj6i8uSHfQI981iWQ3RysTMWQxYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6256
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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

On Wed, Dec 18, 2019 at 02:41:47PM -0800, Niranjana Vishwanathapura wrote:
> > > +static u32 i915_svm_build_sg(struct i915_address_space *vm,
> > > +			     struct hmm_range *range,
> > > +			     struct sg_table *st)
> > > +{
> > > +	struct scatterlist *sg;
> > > +	u32 sg_page_sizes = 0;
> > > +	u64 i, npages;
> > > +
> > > +	sg = NULL;
> > > +	st->nents = 0;
> > > +	npages = (range->end - range->start) / PAGE_SIZE;
> > > +
> > > +	/*
> > > +	 * No need to dma map the host pages and later unmap it, as
> > > +	 * GPU is not allowed to access it with SVM.
> > > +	 * XXX: Need to dma map host pages for integrated graphics while
> > > +	 * extending SVM support there.
> > > +	 */
> > > +	for (i = 0; i < npages; i++) {
> > > +		u64 addr = range->pfns[i] & ~((1UL << range->pfn_shift) - 1);
> > > +
> > > +		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
> > > +			sg->length += PAGE_SIZE;
> > > +			sg_dma_len(sg) += PAGE_SIZE;
> > > +			continue;
> > > +		}
> > > +
> > > +		if (sg)
> > > +			sg_page_sizes |= sg->length;
> > > +
> > > +		sg =  sg ? __sg_next(sg) : st->sgl;
> > > +		sg_dma_address(sg) = addr;
> > > +		sg_dma_len(sg) = PAGE_SIZE;
> > 
> > This still can't be like this - assigning pfn to 'dma_address' is
> > fundamentally wrong.
> > 
> > Whatever explanation you had, this needs to be fixed up first before we get
> > to this patch.
> > 
> 
> The pfn is converted into a device address which goes into sg_dma_address.
> Ok, let me think about what else we can do here.

If you combine this with the other function and make it so only
DEVICE_PRIVATE pages get converted toa dma_address with out dma_map,
then that would make sense.

> > > +static int
> > > +i915_svm_invalidate_range_start(struct mmu_notifier *mn,
> > > +				const struct mmu_notifier_range *update)
> > > +{
> > > +	struct i915_svm *svm = container_of(mn, struct i915_svm, notifier);
> > > +	unsigned long length = update->end - update->start;
> > > +
> > > +	DRM_DEBUG_DRIVER("start 0x%lx length 0x%lx\n", update->start, length);
> > > +	if (!mmu_notifier_range_blockable(update))
> > > +		return -EAGAIN;
> > > +
> > > +	i915_gem_vm_unbind_svm_buffer(svm->vm, update->start, length);
> > > +	return 0;
> > > +}
> > 
> > I still think you should strive for a better design than putting a
> > notifier across the entire address space..
> > 
> 
> Yah, thought it could be later optimization.
> If I think about it, it has be be a new user API to set the range,
> or an intermediate data structure for tracking the bound ranges.
> Will look into it.

Well, there are lots of options. Like I said, implicit ODP uses a
level of the device page table to attach the notifier.

There are many performance trade offs here, it depends what works best
for your work load I suppose. But usually the fault path is the fast
thing, so I would think to avoid registering mmu_intervals on it and
accept the higher probability of collisions.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
