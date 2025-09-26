Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81470BA27F5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 08:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A82710E333;
	Fri, 26 Sep 2025 06:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CotwOiFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D56A10E327;
 Fri, 26 Sep 2025 06:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758867158; x=1790403158;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3b1DoHvwlfCM+66B6GpuiOg8jxgg+U/X4cmVSyKherM=;
 b=CotwOiFSZMwew6i/p/GhyyGlj93+sp3MoeBsMoH0p9yel7/0JH+yWY5a
 GWwCt/kPTh66VEh9hpIip6OWwgcpEVKa4+sdWg6FVRHO37mtda8IkY/Go
 /dJXnkFYLVjxhMT9DqHbY+hQQYCTLaJYhS2msFofVxz5rjI5MmU1iWwvM
 +yZxuC8WVRwxPmGw69VFuJa4jB6ErVIm9jOCGycdkT5yKuFfj2TRPjeFb
 Duv6nOIBONULT/Xk3ZFz4eTG0JzD/4tEpC3U5pp88J/UdyWlD5u4QIWiE
 t/Pjvx9E8Qugu4hrsTtwbpNmFBV70VpaqXTsbHy/B17u1fJ7nagPyCZiO w==;
X-CSE-ConnectionGUID: xxMi8CDNSA2nZv2+9iBqWw==
X-CSE-MsgGUID: z+eZda4AQjOfsUym+RjCGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61303744"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61303744"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 23:12:37 -0700
X-CSE-ConnectionGUID: OR2xvG1LTae+xiBzbN33JA==
X-CSE-MsgGUID: Q7jgc+IgRR2ctQfXAt/GvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="214662782"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 23:12:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 23:12:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 23:12:27 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 23:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O06XAUOmXH6RvdwGvSXnxCPwCWuuslRPOMWgFFpT4uyFM4XHWsPMfxBrM0ujhyCh2ICg5kUwNSgJ7lNKQ0MP4xnaxFfkN/hUhj+cg1f89FU9H01nsPeGk5kG5f0KX1uTcmOJid/vBTRWi9rhrJasZhHcCu5eOBctUcrxyS2zJCJDVSUQClfeWGtgYC1xXyLMrus4XqZPhzli0VfOTIyY829AR0djVo+lGMAY2HKL45mviaJ4pQ/6c9W+M9cEjOvGze4VZ2wOlhb6CU/1WfujccBWzxpduREGHnvwi7tg3jAQDk3Dd3egXUYFAOeU1AqwizVNPjytX6+iAyZiRjOwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSoUAZXA8uAYektDRGn+5sb/wDHtcC88kjE4G6Rpoo0=;
 b=LE7cTgWWfUzsyNhbcnE8gqNs05qSG07aVQMA0j8t6T7UyDWpfzgeiC616Ael54/9u7FnMF99rZg7ZoFijn5sf1z/InfkKZqSJOmfbC5vCMjDeyjoPwFHpH2EaylMLIN2v403IwLbON2buJ80NyERULNypj9BVKnWigmYKNwPw6JqlHyfB8hLuu4jP1hE0e/XXM1NWzsJiBn3HHApgIzF9vmSpDOzXmfRfD33tkRynC+Vi1xftE17JnSfmwreEEyx7XnFlugm6gRfmH0oFTHNvJMevninPj7FiUCZ39WzFI9QFsf/8jMn8wOlAG1Tex13Ssqt0O8MWPKn0zvwB4QFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH8PR11MB7047.namprd11.prod.outlook.com (2603:10b6:510:215::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 06:12:19 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 06:12:19 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Jason
 Gunthorpe <jgg@nvidia.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>, "Logan
 Gunthorpe" <logang@deltatee.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Topic: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Index: AQHcJhH5Hi/XzGn7NEC5e+4cxcvJFLSWGoCAgAIWItCAAKwBgIAASuAwgAFOcYCAAGQ08IAEQCiAgAAQEACAAJXxIIAAmVaAgAAFRQCAABLXAIAASZgAgAAITACAAAe3gIAABICAgAACuoCAAALjgIAAnAEggACKBICAAR26cIAAr2mAgAAKW4CAAIVB4A==
Date: Fri, 26 Sep 2025 06:12:19 +0000
Message-ID: <IA0PR11MB7185C8F6E826139E42ED29CBF81EA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
 <20250923131247.GK1391379@nvidia.com>
 <8da25244-be1e-4d88-86bc-5a6f377bdbc1@amd.com>
 <20250923133839.GL1391379@nvidia.com>
 <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
 <IA0PR11MB71855457D1061D0A2344A5CFF81CA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <1d9065f3-8784-4497-b92c-001ae0e78b63@amd.com>
 <IA0PR11MB7185239DB2331A899561AA7DF81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ab09c09638c4482f99047672680c247b98c961c9.camel@linux.intel.com>
 <50c946f3-08c5-421e-80bf-61834a58eddf@amd.com>
In-Reply-To: <50c946f3-08c5-421e-80bf-61834a58eddf@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH8PR11MB7047:EE_
x-ms-office365-filtering-correlation-id: 67d104d8-8eed-4b18-4f6a-08ddfcc3a64e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?XJ3zbGZfzdbt5nHQrYJAnCm3EyK5+Sz14X8eqDqDxIHztzJxIbcLfzzzX3?=
 =?iso-8859-1?Q?yDpsuZ2474BUujOIfCRZmHH7KQ8+Rxwrz4cKqNWqzzBGUJmC9pv/WLuTgQ?=
 =?iso-8859-1?Q?T/qCmFFfGp/riPxRetDPfiKoq8YkJNco0gdKei49rSFR1kfWCsOmXdu3+0?=
 =?iso-8859-1?Q?XO4JBuazQRFe7iRfWXexxQG3CAjT525Ju6GESW0LVDRa+BPqRECOmGr5zG?=
 =?iso-8859-1?Q?CP2PddAcXI+dYXAe5u81zTUdVI+XSfI93jdmK5kQOK25banwPwAAxhQdio?=
 =?iso-8859-1?Q?ZpDFVUFYUczbyABqWWRbimIrj5w0dARUAyN1p2bYDT+jdcTeAx/CgvJLiV?=
 =?iso-8859-1?Q?Vtshtq9onirX9KQ1TAn7qr83mDMoxx2RgbMW3oPel3H9ffioeS3amkdrJr?=
 =?iso-8859-1?Q?RBPTeeWdF/ulKVtr+TnlNRc9tc/pnq+yhysG/cMC0kkhzQfMf2nhF2AHRX?=
 =?iso-8859-1?Q?VB6V4W2TDxhMRGuf2F7AO232iuyVMcj+pLtGGnDorJxL7fzysUoPVKdDxI?=
 =?iso-8859-1?Q?i/Ej07sP8/Xsa7twJYrLeq6ZWXHGiU32KM4KFE128SP7ot4gQ9BZMCVVx+?=
 =?iso-8859-1?Q?i3j1fOcngbz0gWlfmv7KM1glJcFD3e3k/0E9hvyc0gpBjh+JkZQF+4gI4+?=
 =?iso-8859-1?Q?xKAOkj/RkKUYh59qWjSK2hkhAW5zQ3F5xmGKb67kdnb0I8IV5Ub2ukN0C+?=
 =?iso-8859-1?Q?JbEMGCS/COHXsLtZnGukYP+VJrr2B/SZ3eA06tE98AJ2j52+EGRl65UY9T?=
 =?iso-8859-1?Q?n4Tc8MvQ+UqVsCGyCZmOVFWhCvjAtilIPzwu9gg4t1zT2nv6hr5pg2HH/p?=
 =?iso-8859-1?Q?pZm3S63G5tZ2pcb7L3VBg4fuj/luFQAjIEZNUo9Me41Y9BZf7I7glgOQZt?=
 =?iso-8859-1?Q?/NtJEeS+BCooSgAlQ69tieE+ovVXMNUS2xOXaQ6YC65qMSx/jc0KPWJfgp?=
 =?iso-8859-1?Q?GKfGngHfBuV66VxH8t6fhm3kMXyNBDcK6WUwnw4kCiNe7rH1j85DvvEZh0?=
 =?iso-8859-1?Q?BJjUkKnpfreUf5mGMlo5wbniMjvHbpOUqKjN9zVV7zMFJGJ1hkF/3JVJ18?=
 =?iso-8859-1?Q?ROEg83zB0OOeZSK2lKdn4jJndQmQO/wNNDHHaiqyDQII1AZSMgD6wZDaCu?=
 =?iso-8859-1?Q?EznHbewZeS0xAdupv1/l70RDAVDafgSZmk1XAbiSxmhdIqU//Shz18cvif?=
 =?iso-8859-1?Q?j9gjQ0R9/hYtIuj04VtKcysI8X6XOj2kMtfaUwHxnPNq5WYCl2tp34AHM+?=
 =?iso-8859-1?Q?2P6pkZBxvBdTWwcQjJIB3cj5tksg7g/z/beqajcOf5TzUmzzM93Kx367om?=
 =?iso-8859-1?Q?ip7eRf/s3Dm5Y/DngC2irDuLi+Tr+FTo9mu0uYt7wTXi59UiT5lMU279Qu?=
 =?iso-8859-1?Q?wuCD2t/BvDERbzlROTFqVGNw33/nF/wVBCU8YCt/RxqLJc39qhAr1WIGOW?=
 =?iso-8859-1?Q?2S/pxm1RTNrE5n8IaRtci1mEnweizW5wAuaYa0z98YFMeq9B3jNO6wbc5n?=
 =?iso-8859-1?Q?MR2SrjcSGIEzEYNe4xa0KGg6SJA20lUkieJs6NghitFw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2TmXVdogZ50Plw0y0yxUAh4uG1mppKNQvEbB7aI9qYB5Ob5Boj5WqEAL/4?=
 =?iso-8859-1?Q?amY7f1wRo3O/OBUig42HQySqCBF5naGPgSQ29dybrSk95gRFiRQVLaKH5n?=
 =?iso-8859-1?Q?ZIOn7MJZsjZeGCEZZ4QWvn4rX+mr5jcxUH98Nx63OGmfG5kdGp+stgSMus?=
 =?iso-8859-1?Q?BNxXbV1zLvTKNgoCdGa09imC+0/GGcpyy60lTLSJDrRd0FP7haFJbnhkJT?=
 =?iso-8859-1?Q?TLwt4pZRnWQSrGGsBVVJjOXRHXJ29RL1aFfGRRcXcQqddqafw3n0WifjqT?=
 =?iso-8859-1?Q?Dmf7jpPqhLC6f0f2Ps/gx9AdXSnt7cBJBmSO6wFzwWhUEifl0NtGz7xLJw?=
 =?iso-8859-1?Q?Q1XuAaKhPhBv876jGIYIZDtU4MuMy0gr80lEFIla6cENStrmpPkN4ANodi?=
 =?iso-8859-1?Q?+vxaJgOeLh1cBvzc9f5DPpmGWoH4I6BCfzJKyMNC7p20Cr0fQKH36dE/mz?=
 =?iso-8859-1?Q?QoABMjicjtZmE80PlG8L+0lMvnSVisOA3wvQLy5g40HKvcRzAKeinzDKtD?=
 =?iso-8859-1?Q?hhHqUFQuiMtjCNc/PtGpNEr6gYO3in6FwcuVCslAM48HrsSK3a+sZwP79g?=
 =?iso-8859-1?Q?tw5q+jkIPMIPe24inlwPwWJsewfj2NnguFxT0usE3EhBoTf5USI+JorDNF?=
 =?iso-8859-1?Q?MYvZoTJi2dr8lq9ie1VOV5QJFEpLIJPO1eBVN5CufoDQfK0vlwvpLN2jAR?=
 =?iso-8859-1?Q?tqXt4Ap9aBnguWbUCjh7bneOkWGkNEnLEpfXlPf4Xg7rfuC5LWyNhZNZOB?=
 =?iso-8859-1?Q?cvNnMbJg6bbmVyjXwc77lqFBEj6Oata7VKCKgo/nEDKyOPRn/P2PfA5gW+?=
 =?iso-8859-1?Q?MTobZWJ90ardS4y+wY0TnD2E/WN6OhaZyAgAxm0xGA424B+H79Sh3fsc9G?=
 =?iso-8859-1?Q?F5Rc+T/XOpol2L+wPafCTJfM02RaEYqngV42B/hZB30SW0VrHlYOfGLZSc?=
 =?iso-8859-1?Q?0IPbMOOJ3HriL8fjURWg0CH0nOSpU8A32R6otX4uZWD4My7jNy+XvdU82s?=
 =?iso-8859-1?Q?h8Pl+LHr1vj9qiSBsCtTFQgR3loXOAN/SX2Lzb5X6Uz1zN4uRsni2o+7Cz?=
 =?iso-8859-1?Q?GvEY2Wvyc6xAnWVpLlUReegvJw/u7wAH8MCEjMgTPl6pUTOwHH9hudd2oM?=
 =?iso-8859-1?Q?onjs8BGAUjJd6zKvi6fAf++Y6tC+NWoxAnyt6peccZ/+3nWX9mPfEjzCZF?=
 =?iso-8859-1?Q?YvYQecP68NdML0B12mFKk88xWJtcSa8XBt/DIhmeIPTZRZhdgnQ0A4Uwm4?=
 =?iso-8859-1?Q?i/1/uLf1TqSpfXg7w4ONgskRzs1cKc1KG0k/UA3soUomRSpkI+beEZ3hIo?=
 =?iso-8859-1?Q?ykfcrYWG8z5Mh9cAC3n3efZroQFKqO0RrgYbTNu+MpIHEMaHTmgwazX5wh?=
 =?iso-8859-1?Q?ejfoOZYbmafs2GCQiPZsgsssj5tzqulaPIgk7Eeysgk8+HjueBxcQNllcZ?=
 =?iso-8859-1?Q?qwOLfflSwbZNAHfq2dDCXqBqJibk863t3Y7DMc/f0df2kWXyEMVpWtvEy+?=
 =?iso-8859-1?Q?yKdgK1qjmNRH1VYXd6h+PPr8HFD36c+HurJRbNKzlLKlikc55++Dga7VR9?=
 =?iso-8859-1?Q?44vUu5cJ3ke5I/5bFgWHb/t7ERqcu9OQ3syOs9/oIMX9c4VLta16T2X7JP?=
 =?iso-8859-1?Q?eH2PXLDMHYK/ElaWYQnj57pWoAUDzWlqtO?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d104d8-8eed-4b18-4f6a-08ddfcc3a64e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 06:12:19.4837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qNjR0xOTXvrL2zUeMLIUmplC5Fe7IsU+x4yziuLU86R2ueL8waYR6UN5YT3QvkSUdES+3e+kn4zJ/dWKWTUyRuAkbqFBwP6K4auIHnGYBGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7047
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

Hi Christian, Thomas,

> Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for devic=
e
> functions of Intel GPUs
>=20
> On 25.09.25 12:51, Thomas Hellstr=F6m wrote:
> >>> In that case I strongly suggest to add a private DMA-buf interface
> >>> for the DMA-
> >>> bufs exported by vfio-pci which returns which BAR and offset the
> >>> DMA-buf
> >>> represents.
> >
> > @Christian, Is what you're referring to here the "dma_buf private
> > interconnect" we've been discussing previously, now only between vfio-
> > pci and any interested importers instead of private to a known exporter
> > and importer?
> >
> > If so I have a POC I can post as an RFC on a way to negotiate such an
> > interconnect.
I'll start testing with the RFC patches Thomas posted and see how they can
be improved to make them suitable not only for this use-case but also for
the other (iommufd/kvm) use-cases as well.

>=20
> I was just about to write something up as well, but feel free to go ahead=
 if
> you already have something.
>=20
> >> Does this private dmabuf interface already exist or does it need to
> >> be created
> >> from the ground up?
>=20
> Every driver which supports both exporting and importing DMA-buf has
> code to detect when somebody tries to re-import a buffer previously
> exported from the same device.
>=20
> Now some drivers like amdgpu and I think XE as well also detect if the bu=
ffer
> is from another device handled by the same driver which potentially have
> private interconnects (XGMI or similar).
>=20
> See function amdgpu_dmabuf_is_xgmi_accessible() in amdgpu_dma_buf.c
> for an example.
>=20
> >> If it already exists, could you please share an example/reference of
> >> how you
> >> have used it with amdgpu or other drivers?
>=20
> Well what's new is that we need to do this between two drivers unreleated
> to each other.
Right, that is a key difference.

>=20
> As far as I know previously that was all inside AMD drivers for example,
> while in this case vfio is a common vendor agnostic driver.
>=20
> So we should probably make sure to get that right and vendor agnostic
> etc....
>=20
> >> If it doesn't exist, I was wondering if it should be based on any
> >> particular best
> >> practices/ideas (or design patterns) that already exist in other
> >> drivers?
> >
> > @Vivek, another question: Also on the guest side we're exporting dma-
> > mapped adresses that are imported and somehow decoded by the guest
> > virtio-gpu driver? Is something similar needed there?
AFAICS, nothing else is needed because Qemu is the one that decodes or
resolves the dma-mapped addresses (that are imported by virtio-gpu) and
identifies the right memory region (and its owner, which could be a vfio-de=
v
or system memory). Details are found in the last patch of this Qemu series:
https://lore.kernel.org/qemu-devel/20250903054438.1179384-1-vivek.kasireddy=
@intel.com/

> >
> > Also how would the guest side VF driver know that what is assumed to be
> > a PF on the same device is actually a PF on the same device and not a
> > completely different device with another driver? (In which case I
> > assume it would like to export a system dma-buf)?
Good question. AFAICS, there is no definitive way for the Xe VF driver to
know who is the ultimate consumer of its buffer on the Host side. In other
words, the real question is how should it decide whether to create the
dmabuf from VRAM or migrate the backing object to system memory and
then create the dmabuf. Here are a few options I have tried so far:
1) If the importer (virtio-gpu) has allow_peer2peer set to true, and if Xe
is running in VF mode, then assume that PF of the same device is active
on the Host side and thus create a dmabuf from VRAM.

2) Rely on the user (or admin) that is launching Qemu to determine if the P=
F
on the Host and the VF are compatible (same device) and therefore configure
virtio-gpu and the VF device to be virtual P2P peers like this:
   qemu-system-x86_64 -m 4096m ....
  -device ioh3420,id=3Droot_port1,bus=3Dpcie.0
  -device x3130-upstream,id=3Dupstream1,bus=3Droot_port1
  -device xio3130-downstream,id=3Ddownstream1,bus=3Dupstream1,chassis=3D9
  -device xio3130-downstream,id=3Ddownstream2,bus=3Dupstream1,chassis=3D10
  -device vfio-pci,host=3D0000:03:00.1,bus=3Ddownstream1
  -device virtio-gpu,max_outputs=3D1,blob=3Dtrue,xres=3D1920,yres=3D1080,bu=
s=3Ddownstream2
  -display gtk,gl=3Don

I am sure there may be better ideas but I think the first option above is a=
 lot
more straightforward. However, currently, virtio-gpu's allow_peer2peer is
always set to true but I'd like to set it to false and add a Qemu option to=
 toggle=20
it while launching the VM. This way the user gets to decide (based on what
GPU device is active on the Host) whether the Xe VF driver can create the
dmabuf from system memory or VRAM.

>=20
> Another question is how is lifetime handled? E.g. does the guest know tha=
t
> a DMA-buf exists for it's BAR area?
Yes, the Guest VM knows that. The virtio-gpu driver (a dynamic importer)
which imports the scanout buffer from Xe VF driver calls dma_buf_pin().
So, the backing object stays pinned until Host/Qemu signals (via a fence)
that it is done accessing (or using) the Guest's buffer.

Also, note that since virtio-gpu registers a move_notify() callback, it can
let Qemu know of any location changes associated with the backing store
of the imported scanout buffer by sending attach_backing and
detach_backing cmds.

Thanks,
Vivek

>=20
> Regards,
> Christian.
>=20
> >
> > Thanks,
> > Thomas
> >
> >
> >
> >>
> >>>
> >>> Ideally using the same structure Qemu used to provide the offset to
> >>> the vfio-
> >>> pci driver, but not a must have.
> >>>
> >>> This way the driver for the GPU PF (XE) can leverage this
> >>> interface, validates
> >>> that the DMA-buf comes from a VF it feels responsible for and do
> >>> the math to
> >>> figure out in which parts of the VRAM needs to be accessed to
> >>> scanout the
> >>> picture.
> >> Sounds good. This is definitely a viable path forward and it looks
> >> like we are all
> >> in agreement with this idea.
> >>
> >> I guess we can start exploring how to implement the private dmabuf
> >> interface
> >> mechanism right away.
> >>
> >> Thanks,
> >> Vivek
> >>
> >>>
> >>> This way this private vfio-pci interface can also be used by
> >>> iommufd for
> >>> example.
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>
> >>>> Thanks,
> >>>> Vivek
> >>>>
> >>>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>>>
> >>>>>>
> >>>>>>> What Simona agreed on is exactly what I proposed as well,
> >>>>>>> that you
> >>>>>>> get a private interface for exactly that use case.
> >>>>>>
> >>>>>> A "private" interface to exchange phys_addr_t between at
> >>>>>> least
> >>>>>> VFIO/KVM/iommufd - sure no complaint with that.
> >>>>>>
> >>>>>> Jason
> >>>>
> >>
> >

