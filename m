Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E098F9A00A1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 07:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771B810E2D1;
	Wed, 16 Oct 2024 05:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6e60Oyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D57F10E2D1;
 Wed, 16 Oct 2024 05:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729056578; x=1760592578;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9urCDf1tyYbjkb4qg+xn+A7O5DQiTn7YhOfB7vNBzlg=;
 b=Z6e60OyznLzYjcN4gwL1Q6AoQxCqq+h02UT6l9ffsggoQ1D/ZjHQIElF
 c6aVetONRH65nQOmAfolf4MiRKu8l9cRvTkta1ZywFKM1DN87MzqFTNCv
 DqeBz/Z2fmbboEsSGcRBwj5191Oeg8+HrUz9FWcNIm+wpOnxRpDCtjGDG
 oSe9LcC3oezzEs0jTWzq7KrCc13CibPO7Dlg+HbWpDEM7efd1NqJ7ZNO6
 OpBiDvKymNMbkUkIWieIrkFw1o2rtwv1I2o51e1lnfbrUR9THO30I5FRV
 5qM8eeIbNpfToG2aGdlKMVHmFsVVjzAflTzlgHP047l4jaYP/eCF6/SnL g==;
X-CSE-ConnectionGUID: YPZwnTolSAu1ZyAEPkAGqw==
X-CSE-MsgGUID: MR8aQ6jUQ1ygv+YHyqMQFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45961896"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="45961896"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 22:29:38 -0700
X-CSE-ConnectionGUID: 3vCp0FfwQMGClKWnK86Z8g==
X-CSE-MsgGUID: 09Yka88TRg6EfmCt6gOHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="82770766"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 22:29:37 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 22:29:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 22:29:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 22:29:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 22:29:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8AqSl1M/9ZRAXBMjyV9HLyvL9RgVnn5LUVWJhWw97Mv8mxJU/+fWrfftkzls9XPOJ8X4w1pyQrT0YxMKOMlcPFBIZpoM+7uon+0+IbBW9oJ0ZWtOoTzwQLwwG1j/TtrGC7BBFpyliR+glxX22fnQag7b3LCbkT1lBaK3yVlk/aM6I6C1REIr1j0TnBjyykbsLsHBJ4BfogEaBCjIFs7RRC6LK4ikMMk6QcFHoJaxngF5Ql0PBABsLSgPyWSHPoqHrTlJRc7mBOXSqxcoh3I13CzNokZ7fi2jwTpDB285Ftm74p4AKqfA+hjPDOtMqYBSFplwoY9u7+1kdFbJp+lnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9urCDf1tyYbjkb4qg+xn+A7O5DQiTn7YhOfB7vNBzlg=;
 b=ilXREDEoO9XBnlRuqU4JnPh8cCN/i0T1xj2LbYERC62k1JX89Z/YMbV1kHZJpx4xD+MdenigW4kYEkrDsY7jZ1ztFjnw6oGhy0gALczlBVkVC1pV606QyMu2ZhPW7ozfkNOCA5YNb9SojSNDY0NvKPhIUBcXZEce9O79+SOE473w6Mp4pqi+nr4fVxvCOBi079Oesr/xdJTGUDpvN0YWA+Y0d1oEdjs/4OjVgPleMC9m1zSgrOLskFS4krS4/7eFFFUzH+b1uxtNwfajXygBXBIaPMdx/5TiPjBfUFiDBHgTQ0rqpVXH7bXhJC4CkQk2B0VLger2yLI9XSWdRzg3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.27; Wed, 16 Oct 2024 05:29:32 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 05:29:32 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v1 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Thread-Topic: [PATCH v1 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Thread-Index: AQHbHFQvAHWRDC/Db0iPupM7BWLvNLKIG0yAgABrqXA=
Date: Wed, 16 Oct 2024 05:29:02 +0000
Message-ID: <IA0PR11MB71855AF581EAA8EE8F43E820F8462@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
 <20241012024524.1377836-2-vivek.kasireddy@intel.com>
 <eddb423c-945f-40c9-b904-43ea8371f1c4@deltatee.com>
In-Reply-To: <eddb423c-945f-40c9-b904-43ea8371f1c4@deltatee.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS7PR11MB6126:EE_
x-ms-office365-filtering-correlation-id: 32314c59-a574-44cd-9610-08dceda37199
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NGw0K1Vsanl1RCtQY2VnRktmeDIzZ3U0Vm5VZXdzQ010K2x2VDB6dnhCUmt1?=
 =?utf-8?B?Wlo0R1JRUkpJNjdxSGFsams1R3A0UG9SOGQ4L05LTm1RbFh1dDlHUVg0TkxS?=
 =?utf-8?B?SUNvZTV5TTdkY0FWd01XMW9QcjVPSWdBaXRUVDlGVUV0c1E4VHRGUFVleHhk?=
 =?utf-8?B?K3ZLM0RjUTBCQ3BLb0VoY01BRWwxdnArV1M1ZzVQMDFBbGl3K3luNFBubzhD?=
 =?utf-8?B?b21nOHNxcktNenVmSDkwdUFyb3VRUWIycHo1NlVxQ3BjUUx5aFlWdysrWWZw?=
 =?utf-8?B?bi9PY2MxK0l4dXIyTW9xSXp5YjF2L1JMR3RRbHJNQVdlYmE2UTM5VFlERzRI?=
 =?utf-8?B?QkVUY2NTVjFUYlBHakk5U05aT2RrKzJ5ZHRpK1oyaHBLeXlpeTA5K05LWTQy?=
 =?utf-8?B?TGNPYjhoUk1NK2FYU0dxczUvNjVlNFZSTXByeFBFcFdjMGlybUlWSGgzZGRv?=
 =?utf-8?B?L3JPYU9QSlZmUkNOQkxDZ0IxYW5NZkJ3VHAwK2pqTlN3WEplaktBck9XT2g0?=
 =?utf-8?B?dUd5K3B3Ky8vQWZwcmNUUjk5TG9jVG9kL0M5OEZBSUtPc0FBa1l5YWV5cm1x?=
 =?utf-8?B?UUZqTmtRNzBCN3kwR1kzWXRxcGhEZ2RwUXk5bmhYU3BKcm93RDJ0YzBRaXo5?=
 =?utf-8?B?OGpKNEgzcDZNUThnUFRQYzZwek9NZjFlOE13WmR4RTJPcmV1YThQTmM3S1dN?=
 =?utf-8?B?RVZVTWd0WDFONlhlVzZYVVp3a01pdGFlZ0NYbGhPaDBTTThPRWVxdmYvSzlE?=
 =?utf-8?B?dUcrbFZ1YnhBR1U1aml0L3lwcFprRVBqRjc3dG1ocGRwZm5tcUltRytuSnNp?=
 =?utf-8?B?dTMxa2ZwcGQyalo2cXFxTklhTTY0cytObWZxazNFUldJaG1SYWpleXdXWGNK?=
 =?utf-8?B?MEtIR0hhaFM3WUNkR05xN09lMmpxU09XUEk0K0FSZThmSmFWd0QwNkZMZGlO?=
 =?utf-8?B?dE03ZkEyRzN1RUlyMllDL0RDdlhvTGc3bU15OXZKU0hFblJTc3JmQ2ZtQmcw?=
 =?utf-8?B?N2oxdTJXS0hFSmtEUkR2dDZsM2pDSjUxazY5UVhBaDdnS28vdU9ucUMvV0Fx?=
 =?utf-8?B?dnJ0S1NYU3pMVmxiMWF3YWMvREdNYmVGeTVyamxNVnd3aDZHemo0ditpYkpx?=
 =?utf-8?B?aUlzK3hpV0VaaGU3R2xmOEpPOEtoYXBIWXc0NHhaSDFkV29nNTBrSFJPVW0y?=
 =?utf-8?B?eGNGUm5UZHZtdU1kd2pYMUE3cUxxR0o4UmxVVnc4dFNRRWkwMzIzT2owUzhs?=
 =?utf-8?B?SlJtdnYya0Y1eWsxQTlXdDZpN2t6NllVK0xuOTJSdTNQMWh5MWNGRDB1YW4z?=
 =?utf-8?B?TjFPMHdtSC9XL3Y0OW9kR3p6azdaN1ZyRmxiNU56aU9Qa3RPSnMvTGhVbWR1?=
 =?utf-8?B?ZXdJVGh2QWxTanplcVN2QTJMeGx5RWdJR3pub3BVejhaRkZNNENmd3VJRGFl?=
 =?utf-8?B?SnhsWVVxNk9mcSt5ZndGN0ZKNEs3MWR6ZEhvS1pXY2pnYXBMOVF6UFJ6YVZN?=
 =?utf-8?B?SHhmR3RLMFMxWFl3RFlFNTBrZW1DUmlBM2ZiWWY3TDBZc0k2Y3NFSDU2aVdy?=
 =?utf-8?B?VU1keWZERnF5NDVMTEVNTGhFa1ZWT2VoSjlWUTk5dmlteDl3RDZtWnNFc212?=
 =?utf-8?B?TDFORFZ5Z2xoamppN0hPSjM1NUpjVDFRdldNWk5MNGVRbVozeG4yQXlLUTE5?=
 =?utf-8?B?OUgrMEJhL1JFLy8yem9uNUxzUit6SXB6MlJZT1daeXRiR2pYZDFxakgyTmdx?=
 =?utf-8?B?WEJtMDdoRnFaODFHaHpuZGlKMVhVOWJMUWhJaHRmcDdHREJlSkQ0bnBMUHg0?=
 =?utf-8?B?U0Z5R3RoNzhPL2NJMXFGZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlNxT3Z4WHNkc3ZDaDlvOTdvNXRFcHNwdkdRa3ZYbUZobUYvdElxZnRxRjZ2?=
 =?utf-8?B?S2pDdjhQNDkvelRYVStldnc4Z2xzRDUwTEFIbExocU1PQ20rck01VG04cEdP?=
 =?utf-8?B?SlE5OVJ2UTFUVXZKUld0eFNLM0lzUjlIZ0hwcm0vRU1ENmRRUURrNkxqK01l?=
 =?utf-8?B?Q0lhNGVTSElFZGhJdWZQdzV3SFNvUm9Vc1MwcU5YSzZ3NERMRi9UKzh6QXpj?=
 =?utf-8?B?cXJiaXYwdGVFWnpUOEhTMlJrZkJBdUc1cVRUQTlpVXc1Mi92bTFMdUIzaTJC?=
 =?utf-8?B?UU9VZisxTHVTaWFHMjE0SUZXRTRqUlM4ZEk0WHBVZHZZdzliN1Vaem96aUcz?=
 =?utf-8?B?MURBdTF5S3RpZzVOYlRxUm5HWnVHcDNmTTNiQjhJNnFEcEtWMy9aOWRDNWV2?=
 =?utf-8?B?QkFSQ1Q1cTlwb2h3c3oyVmZTV3JramZnMVd5anhKNndsNzZmZUxDZm1aV2NE?=
 =?utf-8?B?VWUwWkVFZ0lIcGxKclNpRWE5cjdUMEh5OEE5VEU0S3V0OTk0RytEUVo5NjBs?=
 =?utf-8?B?eit1SGFReEg4dXptOC9uZUQwTTFSbSs5L0lybW1DOG83aWV4d0RHTFBQUjNI?=
 =?utf-8?B?TWtvanZzN2w1ZU1hRHAwSzRFblJLY0VncEV3ZXdVUTRmWVVnOG0zTlBOVEly?=
 =?utf-8?B?YURxZ1hrRUxKZVREZ0RpdEplKzdNQWhSUEg3NE4wbVpudkZNbFZacWkzK1Bu?=
 =?utf-8?B?OStZdi9OMVg2UmY0NHdIbUE1RGxtanhnQjhLZlNXcWFJVDVNQnRrZE5xRUdY?=
 =?utf-8?B?VU1yWk53S0dVRGJOVnl6NnlFSzc3dDA3SmRjUlNlTk1pM0tHUEZ5YmFBdEV3?=
 =?utf-8?B?N0pDMHhSTDl2OThVNGdwSFd6c2dvNWoyaEtpdXpwb3hrTUlzNUJ4MlBOdHR2?=
 =?utf-8?B?QUdzRWJ1RTJuR3FvVmZtRkl2Zm9rMjFVb2VoSFVuTUtObURKQTE5ZkIyell1?=
 =?utf-8?B?M2hsdFpiT0JNWFV1aVdWMjlrTjFyQWc3Qi85K01TUmR2TzJsVTJEdHdtSTFr?=
 =?utf-8?B?Z2dZY0ttSExaSml3YVNPc3RvV2VqVEpYSzlVTkQ1SDlEanFoOUVjRFlqd08r?=
 =?utf-8?B?YWdjV0RHVU9YV0dwR2dDbHlHZzhjUGcwM3lIbGF6UEk3STVUZVdwVGczNUdl?=
 =?utf-8?B?RldKM3N0SU91Q25UNTVEbnpqOHkyTndoYlVRTVNJK1lHS2pWem1pMkFiZXFJ?=
 =?utf-8?B?ZzFFVEFVQ3RpbW1rVXNiTWJ3OHZsMElzdTl2Q09WclBoQTJ5OXRKVU54RExW?=
 =?utf-8?B?c1Vqc21BR1hMTFBVUVlpVjRyeUs4TjJHZE1ReGZaZ0FDUmxVTEJVZEFhbWZO?=
 =?utf-8?B?cVp1R2pTc3JYSHRiT0Nma29BU3YrWS9PeGdxQWhMSDBlWnBoMkYxZFR1SUJs?=
 =?utf-8?B?ZFN3S1l6Q0pBTEdNeDF5bENlb1dtN05UZ1ZnNm91Z09lMUsxaENrVE5Ba2JK?=
 =?utf-8?B?bGZwVUZzL1hQNFpvcGhtbEI1NHcrdld5ZjYwbVF2bEhrMEtsOHF2ZlZKdUJ6?=
 =?utf-8?B?dEtFVVR2UEpseklCdUJIV0k5UmF5R3lWcUplUEdyK3BaaXRSQWxQb1R2RjV0?=
 =?utf-8?B?QXhPV0pGRHl5WkpxRTZZRWZHR2E1bmpwd2xVSXF5WFhqTGJpRjJEb0FFbTZU?=
 =?utf-8?B?WWpBMHpBR01hOEFMZkxTTzRKa0FGbUxyZGZ0L3ZUaU1FNndlWllHNERUQjJt?=
 =?utf-8?B?bWlkRTZZd0lZSmtvZWhSYThWREFyVFhtME43UEhjbHJWRHczSklKMlR4akkr?=
 =?utf-8?B?YjBXWkhoR2tFbWhTU3R1dzhIVythcjZQeWVMYlkrb3d4ZGhkWVF0RGR0OUgw?=
 =?utf-8?B?eXZIMm1ETytKcVoreTFBMDhQWWVIajd0T2tGL3R2U3JCZDFxdGxuY3ZNdGQ2?=
 =?utf-8?B?MGZKZjhZWHZ3aXRsWWhmbjhSTUFscjRvbnFTL0xRRDlOUitYT1NzMFZjTTAv?=
 =?utf-8?B?UGhmVGkxalRlVGo0aytaWWFIakx1ZHhuMm1MZFN5eFc4NEp3VlJ3NnNVaFBt?=
 =?utf-8?B?WFNYQXFIMllUTlR5TGxYd3dDVjJ4aUp2MnE0YmhPQkc0MnlFSkhIUzExL3ox?=
 =?utf-8?B?TW9KWFlmcVV1azduUms3cEt5OGVGNHVpSFdneGo3ejZBQS9qdVFndEQrWXdP?=
 =?utf-8?Q?TG9LC4d1NFzcFqdW6JtqC5RMu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32314c59-a574-44cd-9610-08dceda37199
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 05:29:02.0926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: exrTTjiHRlNaaLkL55XI9xlKzb8lildHsJuC4A5RTlimS32nZE7ZPKpn5QvvN2WXZ0tt+IAD54BdG2bHBfwSe+daf9SoObEJ8aOi4nhhRY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
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

SGkgTG9nYW4sDQoNCj4gDQo+IE9uIDIwMjQtMTAtMTEgMjA6NDAsIFZpdmVrIEthc2lyZWRkeSB3
cm90ZToNCj4gPiBGdW5jdGlvbnMgb2YgdGhlIHNhbWUgUENJIGRldmljZSAoc3VjaCBhcyBhIFBG
IGFuZCBhIFZGKSBzaGFyZSB0aGUNCj4gPiBzYW1lIGJ1cyBhbmQgaGF2ZSBhIGNvbW1vbiByb290
IHBvcnQgYW5kIHR5cGljYWxseSwgdGhlIFBGIHByb3Zpc2lvbnMNCj4gPiByZXNvdXJjZXMgZm9y
IHRoZSBWRi4gVGhlcmVmb3JlLCB0aGV5IGNhbiBiZSBjb25zaWRlcmVkIGNvbXBhdGlibGUNCj4g
PiBhcyBmYXIgYXMgUDJQIGFjY2VzcyBpcyBjb25zaWRlcmVkLg0KPiA+DQo+ID4gQ3VycmVudGx5
LCBhbHRob3VnaCB0aGUgZGlzdGFuY2UgKDIpIGlzIGNvcnJlY3RseSBjYWxjdWxhdGVkIGZvcg0K
PiA+IGZ1bmN0aW9ucyBvZiB0aGUgc2FtZSBkZXZpY2UsIGFuIEFDUyBjaGVjayBmYWlsdXJlIHBy
ZXZlbnRzIFAyUCBETUENCj4gPiBhY2Nlc3MgYmV0d2VlbiB0aGVtLiBUaGVyZWZvcmUsIGludHJv
ZHVjZSBhIHNtYWxsIGZ1bmN0aW9uIG5hbWVkDQo+ID4gc2FtZV9wY2lfZGV2aWNlX2Z1bmN0aW9u
cygpIHRvIGRldGVybWluZSBpZiB0aGUgcHJvdmlkZXIgYW5kDQo+ID4gY2xpZW50IGJlbG9uZyB0
byB0aGUgc2FtZSBkZXZpY2UgYW5kIGZhY2lsaXRhdGUgUDJQIERNQSBiZXR3ZWVuDQo+ID4gdGhl
bSBieSBub3QgZW5mb3JjaW5nIHRoZSBBQ1MgY2hlY2suDQo+IA0KPiBJJ20gbm90IHRvdGFsbHkg
b3Bwb3NlZCB0byB0aGlzLiBCdXQgdGhlIGN1cnJlbnQgY29kZSB3YXMgZG9uZSB0aGlzIHdheQ0K
PiBmb3IgYSByZWFzb246IHdlIGNhbid0IGJlIHN1cmUgdGhhdCBmdW5jdGlvbnMgb24gYW55IGdp
dmVuIGRldmljZSBjYW4NCj4gdGFsayB0byBlYWNoIG90aGVyLiBTbyB0aGlzIGNoYW5nZSBtYXkg
YnJlYWsgaWYgdXNlZCB3aXRoIG90aGVyIGRldmljZXMNCj4gd2l0aCBtdWx0aXBsZSBmdW5jdGlv
bnMgdGhhdCBjYW4ndCB0YWxrIHRvIGVhY2ggb3RoZXIuDQo+IA0KPiBUaGF0IGJlaW5nIHNhaWQs
IHRoZSBvbmx5IGFsdGVybmF0aXZlIEkgY2FuIHRoaW5rIG9mIGlzIGFub3RoZXIgbGlzdCBvZg0K
PiBhbGxvd2VkIGRldmljZXMuIEhvd2V2ZXIsIGdpdmVuIHRoZSBwYWluIGl0J3MgYmVlbiBtYWlu
dGFpbmluZyBhbGxvd2VkDQo+IHJvb3QgcG9ydHMsIEknbSBub3QgdmVyeSBlbnRodXNpYXN0aWMg
YWJvdXQgY3JlYXRpbmcgYW5vdGhlciBsaXN0IG9mDQo+IGFsbG93ZWQgZGV2aWNlcyBpbiB0aGUg
a2VybmVsLg0KSSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGxpbWl0IHRoZSBwYXNzaW5n
IGNyaXRlcmlhIGZvciBkZXZpY2UgZnVuY3Rpb25zJw0KY29tcGF0aWJpbGl0eSB0byBJbnRlbCBH
UFVzIGZvciBub3cuIFRoZXNlIGFyZSB0aGUgZGV2aWNlcyBJIGFtIGN1cnJlbnRseQ0KdGVzdGlu
ZyB0aGF0IHdlIGtub3cgYXJlIFAyUCBjb21wYXRpYmxlLiBXb3VsZCB0aGlzIGJlIE9LPw0KDQpU
aGFua3MsDQpWaXZlaw0KDQo+IA0KPiBMb2dhbg0K
