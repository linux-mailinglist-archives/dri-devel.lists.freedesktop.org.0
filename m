Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1704174D97
	for <lists+dri-devel@lfdr.de>; Sun,  1 Mar 2020 15:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94106E20F;
	Sun,  1 Mar 2020 14:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760081.outbound.protection.outlook.com [40.107.76.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD56B6E20F
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2020 14:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obbasbzIJhfn2IyBpvBL/2sHTuzY/OVE0xebX4N1FKmUmx4YRCadr5Bxjp5ldRV1adwVj000yk3N7U28e7+/OjuEFXCW2XdW2n5YRYpHbl6pY4IIfK/+Zp1eREzcUP516Ot0qrh6JeS263/N57Jkr/szfLkcuO49QWPBamtbZJGiZ/k9tYjVotI/Xbqh+JqJqyCA/g5Es8SdDuKS46BDRJi5fAQizrNt8Yp3bsyYRIHM+BZffsfQwJFqZuHR//WUxHfqsGah4DdRtxpLMEXgSMPO6/fp40KOv9I6npU7iX+98T8+WHFOvOdMqcirzI5B/cBuUQ9q3jC47ktrhEpt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPsNVr1/VjhKUktG3+yVmkhO9AzXgVANPN9rZKgCHhE=;
 b=FX6Fo2OtS/8rW6RixaZcpPtlvUXPhUc4sutMwyYQRiVs0VTE2ySzKLMIRD1RKixHGJrrZXo1Ofx3/8qdyzthzDvfTv9Nmwt13ye3JbiIzUIekKiepYljziv6E9mKb3pZhq5Ad+hOPWQtqhLs6SoT0RM5S2Zi2IHwshuaM3JG46Nz5LoQhWgoJ7zgSpqG06YwvSAsq4N5oieN1GrH2esCm9URodcgK4eA8oGPoLECi36rCaVIcpRmsMMQJYi/yVC8L0Q6UEhHcX7n6LkHkNmPV9zbq7anEVmV2VeukDpglSRNNtw+vmYmux1RhWl0lZsFOoh6Q6Yokjg+KnHnVLfXCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPsNVr1/VjhKUktG3+yVmkhO9AzXgVANPN9rZKgCHhE=;
 b=cpeQA+GfmrbAeRmiwkk+CyXm2tbs0PU7l4Q6grg7QmLo4cO37RkSu0UjyRgiWQHHZRlqLQDBZ13ZxLD+uSrjj4iZGK3SLMQGFv323bQUzmh56LZF7Q3l4LXxbq0dUjH5uO7f2XzY++QBJs55kB6rHEjajk5QjM1aq4BM+ID962M=
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (2603:10b6:208:c7::25)
 by MN2PR05MB6830.namprd05.prod.outlook.com (2603:10b6:208:1be::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.5; Sun, 1 Mar
 2020 14:03:46 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::b4a2:5c46:955a:2850]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::b4a2:5c46:955a:2850%7]) with mapi id 15.20.2793.011; Sun, 1 Mar 2020
 14:03:44 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "hdanton@sina.com" <hdanton@sina.com>, "thomas_os@shipmail.org"
 <thomas_os@shipmail.org>
Subject: Re: [PATCH v4 5/9] drm/ttm, drm/vmwgfx: Support huge TTM pagefaults
Thread-Topic: [PATCH v4 5/9] drm/ttm, drm/vmwgfx: Support huge TTM pagefaults
Thread-Index: AQHV79BFTb9FxT47g0qreTe+xyrlNagzxMoA
Date: Sun, 1 Mar 2020 14:03:44 +0000
Message-ID: <39b3614c5bc472981bd12419492af9f7764bf980.camel@vmware.com>
References: <20200220122719.4302-1-thomas_os@shipmail.org>
 <20200301134928.16128-1-hdanton@sina.com>
In-Reply-To: <20200301134928.16128-1-hdanton@sina.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5 (3.30.5-1.fc29) 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be41a3e1-098e-4472-d727-08d7bde95afc
x-ms-traffictypediagnostic: MN2PR05MB6830:|MN2PR05MB6830:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6830C65D936B99E64C3FE8DAA1E60@MN2PR05MB6830.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0329B15C8A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(189003)(199004)(6486002)(2616005)(71200400001)(4326008)(54906003)(6506007)(107886003)(110136005)(5660300002)(316002)(66446008)(66556008)(8936002)(86362001)(478600001)(2906002)(81166006)(7416002)(186003)(8676002)(81156014)(64756008)(76116006)(26005)(66476007)(66946007)(91956017)(6512007)(36756003)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6830;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2icZ/+La2jyJpeGh2Vx7d4LPLjQJ338Kgi12NusYfH8D2Kdarbutx847hv4f0cw+VmC7TVg1fW239nz8ZjasjC1kiz/M/l2CLdvAN0b05GXQPqh3wIYqzgF+JJxWPr8Q2XlwMLFnuK6PkOD95kRmGoETBctj1TeBMw8x8agatgENMfJu4DGQrMsymrIclMZ8Nik0wH02rm4tJ1S0QJGoDZbydY4DRDsHioKu9/AYie+yS2f2MIcNgTFF3Yg48HbT5YEex4B9l9x0jqLl7dvK2UFVR05NckxtFcHmjXlm7ZRz8dRMiERJooFVUwR1beeB3DpHqo92YruMusL4H45qjBgyu1GcXBiZf2jyOWuWqV6wd8SGeiR/QS+1P6bqUTZ3T/NL1AraDoaiWyZSQ61UAheuzyazdHff9k3MHCemE+G2DUk39NGpeFOGNVpvss1MbBiTmPynGyg75ahTEGExK4xauHJaU9W1xygWhTIozC6nkBlLZv3NPKN77nMtJ5Wf
x-ms-exchange-antispam-messagedata: 0Zt0oWAWa1iof2TzhvcNdDpdIymhLUgsYTBdvfixfQeMfywzPm1pHoL5Vr9plBz8HC7+1pZ+DWeZCJfcj+Xw8liXdmn6rLYLnOtQoqIdBOPPHMQrdOk2t9FgzyLp7KBod8M0/jLhoTPDLaCvkhHMgw==
Content-ID: <C2ED34A6A6EF244A8B5FFE91EE786F5B@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be41a3e1-098e-4472-d727-08d7bde95afc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2020 14:03:44.5185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: al/DdpFSGxUhcUzP6ZKV+dWas8Z9X+XVxw23ELqpnfOFSddtCBH/lns2kpb2lgy+wwYr/1I1D1gNLeDKlwwsCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6830
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Pv-drivers <Pv-drivers@vmware.com>, Roland Scheidegger <sroland@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2020-03-01 at 21:49 +0800, Hillf Danton wrote:
> On Thu, 20 Feb 2020 13:27:15 +0100 Thomas Hellstrom wrote:
> > +
> > +static vm_fault_t ttm_bo_vm_huge_fault(struct vm_fault *vmf,
> > +				       enum page_entry_size pe_size)
> > +{
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	pgprot_t prot;
> > +	struct ttm_buffer_object *bo = vma->vm_private_data;
> > +	vm_fault_t ret;
> > +	pgoff_t fault_page_size = 0;
> > +	bool write = vmf->flags & FAULT_FLAG_WRITE;
> > +
> > +	switch (pe_size) {
> > +	case PE_SIZE_PMD:
> > +		fault_page_size = HPAGE_PMD_SIZE >> PAGE_SHIFT;
> > +		break;
> > +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> > +	case PE_SIZE_PUD:
> > +		fault_page_size = HPAGE_PUD_SIZE >> PAGE_SHIFT;
> > +		break;
> > +#endif
> > +	default:
> > +		WARN_ON_ONCE(1);
> > +		return VM_FAULT_FALLBACK;
> > +	}
> > +
> > +	/* Fallback on write dirty-tracking or COW */
> > +	if (write && ttm_pgprot_is_wrprotecting(vma->vm_page_prot))
> > +		return VM_FAULT_FALLBACK;
> > +
> > +	ret = ttm_bo_vm_reserve(bo, vmf);
> > +	if (ret)
> > +		return ret;
> > +
> > +	prot = vm_get_page_prot(vma->vm_flags);
> > +	ret = ttm_bo_vm_fault_reserved(vmf, prot, 1, fault_page_size);
> > +	if (ret == VM_FAULT_RETRY && !(vmf->flags &
> > FAULT_FLAG_RETRY_NOWAIT))
> > +		return ret;
> 
> Seems it does not make much sense to check VM_FAULT_RETRY and return
> as
> at least resv lock is left behind without care.

With this particular flag combination, both the mm_sem and the dma_resv
lock have already been released by TTM.

It's a special case allowing for drivers to release the mmap_sem when
waiting for IO.

That should probably be documented better in TTM.

/Thomas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
