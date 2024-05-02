Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966328B959A
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D2D10EECB;
	Thu,  2 May 2024 07:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU72hEoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8CB10EF2C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 07:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714636241; x=1746172241;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0+rx+nPFaKo58yWxHu6gCzMUN05L5zk5HHVeATxTYIA=;
 b=HU72hEoHnRt6NcUNaUFTD3maIP8Zj1DbGuzbyZdzwELeY9wUqloV9Pfy
 tC4KIJ5WVJS7UNq/iz+urP/iPT1jqXTx9l1N0nOORv9NOOa4xHehm7qPB
 SR1krdBYssaIvpENJoM3yfXcb+Nn0EbYmsINAJ5SDtUddtIr+T4VIWvvh
 NIMBHAyHSVBXpiec1Ij9cMRn04m8w5QT4iZkwD6OQp/FaKBo9jtNphIeG
 4Hs+YVrwEtGqBpK51vMsEddtUgXqeYiPmSw+fDaRX7T5jqxjmN6jFWQzD
 GQZHRgZ1DXxxALvhmJxNLPfxwkF/e9ixmTboL6SIHyBcjQPUXiXAgDQ58 Q==;
X-CSE-ConnectionGUID: 5Cq57R7oTBWH7y7edOKJfg==
X-CSE-MsgGUID: FBhNOoh+Txywiq5mH3Hnng==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10546914"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10546914"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 00:50:40 -0700
X-CSE-ConnectionGUID: Abpu+9mfS/SLqTVUh/P9iw==
X-CSE-MsgGUID: 6W0eMdKnSo+c9Jb5EhLgeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31708897"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 00:50:40 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 00:50:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 00:50:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 00:50:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oceZFmZjlojjpIXWltDhEGq1AFJM/CSsEZuTmqciy/PVf5rTcV3V+zMgeyQEdBYnt9jb3QVtdmRfDiNh/qbJVZ9XBhsjYDUVemgtOUbwpbX1Q8g9wnwHOBFf5FPxPauDty40iEF6wPqCXmhAPUiA0vAPkjQ7nUlD1DgzJdeYPcuSSVOZhzH5mnzqJadeJx9l0Fka6v4UAHXJtOtiYfPXgEJzwOVL7uXZCIH+Kge+8InJ1qWN/eQC+orUleTp5kyFCg5G2jreutdTIDK7yaQYFfEq/PnnKD+uJHDGBfehwClGAvtXQKEt/ZzwN10xhVk+eum8dxls/EOIl455FVqZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdbNwaUbtv9+hAd0rB2B9O7shnIkBTggy1I5AhHBU7E=;
 b=lcaMpHGHkCunym68km4wE7cdkdA4ATXKAdFDnKznpsFXwzkDN97ZijHBbNdxAWqXdRcYLRbqUG3VlboizuuJY6+mq58Hd4y9H8mdjD93jRc1vYadQne8KVw6a6ureum/Cw+OrlwRh5yF5w8b/dCACd9P9LwXW8czmn8XOyJyHt/5Q5u4KJUUObTctldavq8u0zJWj7xAI4+eGujKcouY/3n2pmEER7MbNrchj7z2XtP2vwNFUvlrBk+eOLJow3aGq+jZ7GXMVCi4I9AUE080ZbB4AhJPj/owa+UyEC612munp6mV4SLmuPdC53tMF0JDKt4ym4M0CtNZYSxU+AZkbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by LV8PR11MB8748.namprd11.prod.outlook.com (2603:10b6:408:200::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Thu, 2 May
 2024 07:50:37 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.7544.023; Thu, 2 May 2024
 07:50:36 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>
Subject: RE: [PATCH v1 2/2] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Thread-Topic: [PATCH v1 2/2] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Thread-Index: AQHalILXkvPPqcFAaEeF7XrDtjddVLGBcWgAgADym4CAAPcxIA==
Date: Thu, 2 May 2024 07:50:36 +0000
Message-ID: <IA0PR11MB718509BB8B56455710DB2033F8182@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240422063602.3690124-1-vivek.kasireddy@intel.com>
 <20240422063602.3690124-3-vivek.kasireddy@intel.com>
 <20240430162450.711f4616.alex.williamson@redhat.com>
 <20240501125309.GB941030@nvidia.com>
In-Reply-To: <20240501125309.GB941030@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|LV8PR11MB8748:EE_
x-ms-office365-filtering-correlation-id: 0b19f865-b384-49bd-4645-08dc6a7c8ddd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?fxRt7kI6czlWry81epYPoyOSjzhMu5Q9KujazSdJDLqC4lfEGxoWihPJZsj5?=
 =?us-ascii?Q?WP07/FyAgxBI2mRlpdChZf5lVWFUXrVinsIG3ZkbqvsnDKUZ7m0YDLyCzkUq?=
 =?us-ascii?Q?2oo9PkkVegDB8rr4Pq1dCspDMT2SZW3NJPMw6oeFIU37gtBIrmjfRWiozd8N?=
 =?us-ascii?Q?Jq3HtF7ls9Wja5I5IPnB7eTaQgTWHE50zgt4nDGeVMZW2iQGxNdzd3l+R6LX?=
 =?us-ascii?Q?13ShEhLZk4I/jX2VeFGf8+DyWkZ4cEwfIyfUaUn5/kEQFBejNM92pRJ1MhTB?=
 =?us-ascii?Q?iYetc+37PIKrRLbePaXyEBpStSDhs+zjcwReefIDNDnxJci0b1yEuWvuSWyM?=
 =?us-ascii?Q?rhIGAYxuderZTSyhT86a5V+k8APm7Ks8MjJihk5R0j67W9OrlwsF0iyQMOmn?=
 =?us-ascii?Q?Ho0u74S7kBCB2nf9l4+y0v/pshLOtSSW8tIY8DlihRoy2FzFYccE/yg2jT1D?=
 =?us-ascii?Q?a0x1nVTuDWbcaVbuhuCitBNAF+Xm0TVqUeZzK+3uFzHQbWXlc+tqIl1Z0L+l?=
 =?us-ascii?Q?ZfQr6g3axn8SG1SX7gfoohY6QjHZDq/89rt+GmvSDd7uDUATPVSBbADsUnKJ?=
 =?us-ascii?Q?pAJIOR9XW2lUP4sAVpIa1//WSjgUt2vcJMmHS0rwbPuHb7Q9IreAnmq4DYQW?=
 =?us-ascii?Q?mo7JQoIeyn7DBhJHy+rsNZh0oJ2w9z52/hN5nhoPLQJ3o1RnZMJFk8OxIoAH?=
 =?us-ascii?Q?FOw0/ND4fzcax+63ChzFDiQBUNzXOwQODCnmK2hBr1y9dGG6oKNvBg+6r7Lk?=
 =?us-ascii?Q?tq+Wp9+Vd4JnpjnJe5fFmzD4icbxuo9ectu5ddJopKJ0R2ktF8qMWnGqnC6D?=
 =?us-ascii?Q?tRAQtfrfDoQG/sg3Rux+OfQ7UkiO6w4xuQp077uyJ48zmXxTrcsifg8IHx0M?=
 =?us-ascii?Q?WeYgocFbfgz0xIvPMth/ILikftnzXSs7xeYMStnszechtHw/cqTBsolT9EII?=
 =?us-ascii?Q?ebA0FBiZAXVl9Zia1RN1ttKp3TQjiT15E82Q+wgjiK2Mg2JC19PRq1Mylfip?=
 =?us-ascii?Q?olVbZ4ss7j6SGMhGshF0dtKZl8fNputWKgSjwx4fhdX1nOJAXRM6uhy6f7r4?=
 =?us-ascii?Q?haeHXs6Z6MPIDhCiuiQct2UF2hFU8w02p2rFuIN7LwMl80EIJvE1KONmnIEv?=
 =?us-ascii?Q?6iPv8R4AsQ2Ime+gIwdSSYpPH8dPRbAcwoszP2UK0mTf1YFGEmEYns0BWx8G?=
 =?us-ascii?Q?P0CWwP/0jrClBSyiezQjjT+RohmBRWQ4T63C8eJFa5hp0znqnvA1XKt53Tb+?=
 =?us-ascii?Q?UBNmrYTqtle7VtiFItlc2bDFRU/KlbAsLj2ZDM2W5sv+g2Vu/jkxX7yu2zjz?=
 =?us-ascii?Q?LOpvlC798aQ1PWGY5z+xICy+nu/zq4wd/ABX12ZI70soQw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eJKoGRtYgQesRTibuC74H8HAUCC+/uaw+GQhwfNCrKeSx2SZU5CxdjVFi+rU?=
 =?us-ascii?Q?L0HVm/nwdoSZlYiomrr/Q2lSr+LHdCSolMT1x2A6wKivxSMS9fXly6t75Etx?=
 =?us-ascii?Q?EA3uWcPimAC0eE8R51Kt+vbzOwpmS1ju9Gu5c2cn/Vn6t+DVr5caSm8pLm6g?=
 =?us-ascii?Q?Ljgph2XrAOfTjNSYbrDv98Tygr1EaY4gcUhZuoGRwBeM9uSyLwJttH1XBQfX?=
 =?us-ascii?Q?KvTmEZQLJUkJSp3M2WaSr81rBCuXRvDtA4FlZmlcj0pnfhUcj9e4n4aBa1sk?=
 =?us-ascii?Q?seztCVubWR77ZAhcAD041ZQ6yPTnvS0xhzS4K5Z/5NeG1y13JrwHTxrXybfE?=
 =?us-ascii?Q?5wdeGSd/rgoe8zGDmrrLaG6RgC9wnSmEd2w5epbCgJhgMrWb9cVbx0UYdi9V?=
 =?us-ascii?Q?Bw3jTaWGUv7Tcx7Kxdh8/gwtpUCSLGZI8uyXhh1a4EJQnNhY39Qb8cCIP49T?=
 =?us-ascii?Q?AmTasVmz47FN/yhBBHlsjT0E+Vr0Bk3AvaMX8Jc/xF2cL7uzehXsnixXC0ZZ?=
 =?us-ascii?Q?vHhRBgrk6XBjZaIUnFmt1NevYrdh8B/I2ZTpBpws3LfTnYiK/KQ+kftLnbJN?=
 =?us-ascii?Q?BxzsqdaWKX8j/l9DsebzBGP9UNQh0ePCD1MDfoOYOF/AjYOjSCCUOPRbyJc7?=
 =?us-ascii?Q?SXDDsfFgAgdJh9h0TU5f23g9LQBAKKKSY630hB7oq/oeghoHz8k5HSZenVrJ?=
 =?us-ascii?Q?L2nY0NQtCRdHhLXXBM/5zMEl2nAn0OBouKLvl+w81uHmHFXr1vvDfFgw2R85?=
 =?us-ascii?Q?L6N5Z5TzIiKKSStUXdXK57niX8x2VhWiGe+4GYWJ6R5OzhLX5WQyeJDiKmF5?=
 =?us-ascii?Q?QimmBUVdxemlWPnxl28tsJc7c885HSQVt7tNwDZIr+PFYQ7M6KqyQ1RcmzDW?=
 =?us-ascii?Q?bXnKwpypduZWcHSg4Csrq4va0F5tE+3J81OnYlaOpM0vYpKUjI3qrfv6qAa5?=
 =?us-ascii?Q?v/aFdxjWXFV9qPJfaiyQBjbJdH+PdEDeRtlQEM5Y4AEOZVeVXt+ZSFpP/AQH?=
 =?us-ascii?Q?599V8edLjQnqUE6gUI2MvYbRP3u1ovqUj2GKMvhN4/SceynElIHNGsLsRoA1?=
 =?us-ascii?Q?s5bGc+WZH98RzHyzCxUGBsiO3iviNw0ugZ+VCjC/yInOdnG2uIcGBo5pzLkN?=
 =?us-ascii?Q?uIT5tFndWozkX97mFC7A//T/h+5yYo5A51FSpjQzY8xzcYrJjsWEUokIgIDq?=
 =?us-ascii?Q?Ypk91z85JGEKNL7eYYq2Dhz2VsCUh5xoViycKNcnjjAa4FmACqWk8BslLoyM?=
 =?us-ascii?Q?d4R7bAkqvYr11CsLmy6YDsFWr+qXGuqxMCrzW9jVgUvV/fj0ZtzoPtCpMXC+?=
 =?us-ascii?Q?9L9oEcqWibBdORlMsZdF4Bz1tcsSqlJnwVrgsWe1Yl7MASvMr+4ZUSgObsJY?=
 =?us-ascii?Q?60+fz9E7frJ4i1tUNJxY2bQUnQv+AhRFgHYXMpJBKstUmdAID0zHHguYqBuu?=
 =?us-ascii?Q?9+iNroPEGaFbsZA3AjvW8LtpiG19K6brXJS3tpSQKdqDlESejgtV69jBBQ2E?=
 =?us-ascii?Q?QUBLuNwLxJmqMC0PVyS+03QB1p1bxBvIX/ZWLd3lFyWnmSIWxFiHQvlc7QAc?=
 =?us-ascii?Q?a+cXbSCElu5/lbyIDYz4DPfvHXNGQsGnYOnNXALq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b19f865-b384-49bd-4645-08dc6a7c8ddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2024 07:50:36.8312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mf6xeJsYwnjqhnEoXbxC7Cq/iaMAfg+8CgpW08arQlGzfGdhUe2uO4NmdnR9a967p/zuQLPPR0K1KpbKwC2KF/kC8Gr/kVRJQQkNSOQ0jCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8748
X-OriginatorOrg: intel.com
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

Hi Jason,

>=20
> On Tue, Apr 30, 2024 at 04:24:50PM -0600, Alex Williamson wrote:
> > > +static vm_fault_t vfio_pci_dma_buf_fault(struct vm_fault *vmf)
> > > +{
> > > +	struct vm_area_struct *vma =3D vmf->vma;
> > > +	struct vfio_pci_dma_buf *priv =3D vma->vm_private_data;
> > > +	pgoff_t pgoff =3D vmf->pgoff;
> > > +
> > > +	if (pgoff >=3D priv->nr_pages)
> > > +		return VM_FAULT_SIGBUS;
> > > +
> > > +	return vmf_insert_pfn(vma, vmf->address,
> > > +			      page_to_pfn(priv->pages[pgoff]));
> > > +}
> >
> > How does this prevent the MMIO space from being mmap'd when disabled
> at
> > the device?  How is the mmap revoked when the MMIO becomes disabled?
> > Is it part of the move protocol?
In this case, I think the importers that mmap'd the dmabuf need to be track=
ed
separately and their VMA PTEs need to be zapped when MMIO access is revoked=
.

>=20
> Yes, we should not have a mmap handler for dmabuf. vfio memory must be
> mmapped in the normal way.
Although optional, I think most dmabuf exporters (drm ones) provide a mmap
handler. Otherwise, there is no easy way to provide CPU access (backup slow=
 path)
to the dmabuf for the importer.

>=20
> > > +static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> > > +{
> > > +	struct vfio_pci_dma_buf *priv =3D dmabuf->priv;
> > > +
> > > +	/*
> > > +	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the
> list.
> > > +	 * The refcount prevents both.
> > > +	 */
> > > +	if (priv->vdev) {
> > > +		release_p2p_pages(priv, priv->nr_pages);
> > > +		kfree(priv->pages);
> > > +		down_write(&priv->vdev->memory_lock);
> > > +		list_del_init(&priv->dmabufs_elm);
> > > +		up_write(&priv->vdev->memory_lock);
> >
> > Why are we acquiring and releasing the memory_lock write lock
> > throughout when we're not modifying the device memory enable state?
> > Ugh, we're using it to implicitly lock dmabufs_elm/dmabufs aren't we...
>=20
> Not really implicitly, but yes the dmabufs list is locked by the
> memory_lock.
>=20
> > > +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev,
> u32 flags,
> > > +				  struct vfio_device_feature_dma_buf __user
> *arg,
> > > +				  size_t argsz)
> > > +{
> > > +	struct vfio_device_feature_dma_buf get_dma_buf;
> > > +	struct vfio_region_p2p_area *p2p_areas;
> > > +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > > +	struct vfio_pci_dma_buf *priv;
> > > +	int i, ret;
> > > +
> > > +	ret =3D vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> > > +				 sizeof(get_dma_buf));
> > > +	if (ret !=3D 1)
> > > +		return ret;
> > > +
> > > +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> > > +		return -EFAULT;
> > > +
> > > +	p2p_areas =3D memdup_array_user(&arg->p2p_areas,
> > > +				      get_dma_buf.nr_areas,
> > > +				      sizeof(*p2p_areas));
> > > +	if (IS_ERR(p2p_areas))
> > > +		return PTR_ERR(p2p_areas);
> > > +
> > > +	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> > > +	if (!priv)
> > > +		return -ENOMEM;
> >
> > p2p_areas is leaked.
>=20
> What is this new p2p_areas thing? It wasn't in my patch..
As noted in the commit message, this is one of the things I added to
your original patch.

>=20
> > > +	exp_info.ops =3D &vfio_pci_dmabuf_ops;
> > > +	exp_info.size =3D priv->nr_pages << PAGE_SHIFT;
> > > +	exp_info.flags =3D get_dma_buf.open_flags;
> >
> > open_flags from userspace are unchecked.
>=20
> Huh. That seems to be a dmabuf pattern. :\
>=20
> > > +	exp_info.priv =3D priv;
> > > +
> > > +	priv->dmabuf =3D dma_buf_export(&exp_info);
> > > +	if (IS_ERR(priv->dmabuf)) {
> > > +		ret =3D PTR_ERR(priv->dmabuf);
> > > +		goto err_free_pages;
> > > +	}
> > > +
> > > +	/* dma_buf_put() now frees priv */
> > > +	INIT_LIST_HEAD(&priv->dmabufs_elm);
> > > +	down_write(&vdev->memory_lock);
> > > +	dma_resv_lock(priv->dmabuf->resv, NULL);
> > > +	priv->revoked =3D !__vfio_pci_memory_enabled(vdev);
> > > +	vfio_device_try_get_registration(&vdev->vdev);
> >
> > I guess we're assuming this can't fail in the ioctl path of an open
> > device?
>=20
> Seems like a bug added here.. My version had this as
> vfio_device_get(). This stuff has probably changed since I wrote it.
vfio_device_try_get_registration() is essentially doing the same thing as
vfio_device_get() except that we need check the return value of
vfio_device_try_get_registration() which I plan to do in v2.

>=20
> > > +	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> > > +	dma_resv_unlock(priv->dmabuf->resv);
> >
> > What was the purpose of locking this?
>=20
> ?
>=20
> > > +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool
> revoked)
> > > +{
> > > +	struct vfio_pci_dma_buf *priv;
> > > +	struct vfio_pci_dma_buf *tmp;
> > > +
> > > +	lockdep_assert_held_write(&vdev->memory_lock);
> > > +
> > > +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm)
> {
> > > +		if (!get_file_rcu(&priv->dmabuf->file))
> > > +			continue;
> >
> > Does this indicate the file was closed?
>=20
> Yes.. The original patch was clearer, Christian asked to open
> code it:
>=20
> + * Returns true if a reference was successfully obtained. The caller mus=
t
> + * interlock with the dmabuf's release function in some way, such as RCU=
, to
> + * ensure that this is not called on freed memory.
>=20
> A description of how the locking is working should be put in a comment
> above that code.
Sure, will add it in v2.

>=20
> > > @@ -623,6 +625,8 @@ static int vfio_basic_config_write(struct
> vfio_pci_core_device *vdev, int pos,
> > >  		*virt_cmd &=3D cpu_to_le16(~mask);
> > >  		*virt_cmd |=3D cpu_to_le16(new_cmd & mask);
> > >
> > > +		if (__vfio_pci_memory_enabled(vdev))
> > > +			vfio_pci_dma_buf_move(vdev, false);
> > >  		up_write(&vdev->memory_lock);
> > >  	}
> >
> > FLR is also accessible through config space.
>=20
> That needs fixing up
>=20
> > > @@ -1246,7 +1248,10 @@ static int vfio_pci_ioctl_reset(struct
> vfio_pci_core_device *vdev,
> > >  	 */
> > >  	vfio_pci_set_power_state(vdev, PCI_D0);
> > >
> > > +	vfio_pci_dma_buf_move(vdev, true);
> > >  	ret =3D pci_try_reset_function(vdev->pdev);
> > > +	if (__vfio_pci_memory_enabled(vdev))
> > > +		vfio_pci_dma_buf_move(vdev, false);
> > >  	up_write(&vdev->memory_lock);
> > >
> >
> > What about runtime power management?
>=20
> Yes
>=20
> Yes, I somehow thing it was added
Ok, I'll handle runtime PM and FLR cases in v2.

>=20
> > > -static int vfio_pci_core_feature_token(struct vfio_device *device, u=
32
> flags,
> > > -				       uuid_t __user *arg, size_t argsz)
> > > +static int vfio_pci_core_feature_token(struct vfio_pci_core_device
> *vdev,
> > > +				       u32 flags, uuid_t __user *arg,
> > > +				       size_t argsz)
> > >  {
> > > -	struct vfio_pci_core_device *vdev =3D
> > > -		container_of(device, struct vfio_pci_core_device, vdev);
> >
> > Why is only this existing function updated?  If the core device deref
> > is common then apply it to all and do so in a separate patch.  Thanks,
>=20
> Hm, I think that was som rebasing issue.
Yeah, looks like the above change may not be needed.

>=20
> > > +/**
> > > + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> > > + * region selected.
> > > + *
> > > + * open_flags are the typical flags passed to open(2), eg O_RDWR,
> O_CLOEXEC,
> > > + * etc. offset/length specify a slice of the region to create the dm=
abuf
> from.
> > > + * If both are 0 then the whole region is used.
> > > + *
> > > + * Return: The fd number on success, -1 and errno is set on failure.
> > > + */
> > > +#define VFIO_DEVICE_FEATURE_DMA_BUF 11
> > > +
> > > +struct vfio_region_p2p_area {
> > > +	__u32	region_index;
> > > +	__u32	__pad;
> > > +	__u64	offset;
> > > +	__u64	length;
> > > +};
> > > +
> > > +struct vfio_device_feature_dma_buf {
> > > +	__u32	open_flags;
> > > +	__u32	nr_areas;
> > > +	struct vfio_region_p2p_area p2p_areas[];
> > > +};
>=20
> Still have no clue what this p2p areas is. You want to create a dmabuf
> out of a scatterlist? Why??
Because the data associated with a buffer that needs to be shared can
come from multiple ranges. I probably should have used the terms ranges
or slices or chunks to make it more clear instead of p2p areas.

In my use-case, GPU A (in a guest VM and bound to vfio-pci on Host) writes
to a buffer (framebuffer in device mem/VRAM in this case) that needs to be
shared with GPU B on the Host. Since the framebuffer can be at-least 8 MB
(assuming 1920x1080) or more in size, it is not reasonable to expect that i=
t
would be allocated as one big contiguous chunk in device memory/VRAM.

>=20
> I'm also not sure of the use of the pci_p2pdma family of functions, it
> is a bold step to make struct pages, that isn't going to work in quite
I guess things may have changed since the last discussion on this topic or
maybe I misunderstood but I thought Christoph's suggestion was to use
struct pages to populate the scatterlist instead of using DMA addresses
and, I figured pci_p2pdma APIs can easily help with that.

Do you see any significant drawback in using pci_p2pdma APIs? Or, could
you please explain why this approach would not work in a lot of cases?

> alot of cases. It is really hacky/wrong to immediately call
> pci_alloc_p2pmem() to defeat the internal genalloc.
In my use-case, I need to use all the pages from the pool and I don't see a=
ny
better way to do it.

>=20
> I'd rather we stick with the original design. Leon is working on DMA
> API changes that should address half the issue.
Ok, I'll keep an eye out for Leon's work.

Thanks,
Vivek

>=20
> Jason
