Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C4F8BB4DA
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 22:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD77112999;
	Fri,  3 May 2024 20:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMUgfQEO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45066112995;
 Fri,  3 May 2024 20:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714768183; x=1746304183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dmuInDlD0Y1dMVNXHxPSsvHo9AoiKcICQBZ5+fCOSfM=;
 b=jMUgfQEOktbVcjnewpAI0H3x7XThK/PycQkXxU5lPkZgHR6EmsFQckng
 mhQP4U5Wy++zytXvcLzM9LlG0Gh9m1jz6S+id/N2c6HCUIQ7sBn0IAbQM
 dv0Tsc7/6WwQPjmkyApVz5wKWuE4wjDD3UiM3TveqPScFCsRmpm5JtohT
 LJmkArEl6IQPvOGBS7NmNrmzTZt/yMtOWv9jlMAzxclOvHX4SDr6kWROu
 Nxx72Bew8KxrU8PIaqHhTPZkMjhWmlANwUwQaKiAVk/1gZFnIWNOQjubV
 z23m0PjyGS5XiI0p2gUnGGWiJyoqp5JRDMT3n8N4JH0eOV43ISiPiAN+H g==;
X-CSE-ConnectionGUID: dtKiP2B6STCoy+cc3UIfrg==
X-CSE-MsgGUID: 3eU7zli7Q36YpL0z5lm24g==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13535800"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="13535800"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 13:29:43 -0700
X-CSE-ConnectionGUID: 7PCBIqF+QWGcOSvhgR7rIw==
X-CSE-MsgGUID: iD/c7V6TQaSE3DPviPvCHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27531366"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 13:29:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 13:29:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 13:29:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 13:29:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 13:29:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxnS2tzn4m0+NKgO32OgDC9GO4JSVlQhtn7VkfX06hM4KnWErPzCRMNZO9Wacnc53EXRiyI9pjBlpa0EBArLtAvKzzbHlOE3p/xDx2DuJJaIYuocC0SqKkdV+KeYed5gQdteNYz5/kWOUG3TLIDYU61jKxBSAxR9TmSYU+4a5tFCXugz+9g3HsS4OJSUTLvgDMcYi6J5q4gqamQOW/e3kZ7fMBBhmjDbvUR6KHd9fR4szgURuvRovHj+F5q8qpDaBL77RI4ZXuB5uXKqZ8CuPHrkBP1+JJgHG5A84jkddiI4hG3d9RiNvaP6yxYvKzZVyGHFPYsqs2aTZYf7es7muQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3qLFgqhVXfhgt8MYCv90YNjd24UNVGr20JVVDHq33s=;
 b=cnRuckTLLyLULOpBMa8F7dPgxEn33YDp3QJlVRkcpxHVpxrb93Np8Nyl8NjJbGaDAFvOahPL72Mnp8cTpLAGEbDcTtLuJCEKhRff93EtDWQ7rw2wkYnH9iH7OM8oL2ezxRFR6jdXxllXBivNuKDvHhHNRnXyiPXgTspd6NG+qzSqkufV1mB045fg6IDQgs2JS4qQZvFZXR+jbPXakA32zCemkA33SY+49hrjvisp1YbjfOSbSp+3cP6pQIIgXuIY2aOEANfWAkTFVXC/rC1wNhONvE1Y9N9ScBXgbix/LPmw2oNAvWMa43DULnQiT/gOVTzqBD3o+WWUJcVVjUX59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 20:29:39 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.021; Fri, 3 May 2024
 20:29:39 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: RE: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Topic: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Index: AQHaSZDNP3fdwvIgF0K88ldd8EilIrFZUEuAgAAW4fCAALG4gIAAI09QgAA3bwCABhSRIIAAKiwAgAGpRnCAFa1zAIAAF6WggAClagCAAiZXgIAAIx+AgAAvHwCAAB2VgIAELjoAgAIqYwCAABiGAIAAVwWAgAIXDYCAABKpAIAAPDQAgAAlzoCAAEh/EIABMkcAgAAGVhCAAClZAIAANSFA
Date: Fri, 3 May 2024 20:29:39 +0000
Message-ID: <SA1PR11MB69911B3E675B1072A17A3E49921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240430173002.GV941030@nvidia.com>
 <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local> <20240501000915.GY941030@nvidia.com>
 <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
 <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
 <20240502124632.GB3341011@nvidia.com>
 <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
 <SA1PR11MB6991945628597BCD9D111ECD92182@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503133732.GD3341011@nvidia.com>
 <SA1PR11MB699156AB3B2603DF1762BEA7921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503162812.GF3341011@nvidia.com>
In-Reply-To: <20240503162812.GF3341011@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA0PR11MB4621:EE_
x-ms-office365-filtering-correlation-id: cd930094-3ad7-49f1-e96b-08dc6bafc1fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?feRgWPAHhqderOD5pAePmGjwpzJ7LDdsXjVrXhMBiZFEteO5unHmVmVvpv?=
 =?iso-8859-1?Q?SbmAbqL1YPNlzU/EXoeJGNBYvKfnWrBAxTXMHbXTHjJu4ESh9VKz3Iz+0h?=
 =?iso-8859-1?Q?eT2cdyASBhBwh+oQ7nRE5p+R+jtE3D3gCBFNcsCg2W5Mrbyq/SoltyDSaZ?=
 =?iso-8859-1?Q?I24eW8RYqBSTfS+OoLBMWHUPlotb8OeoIpwyFQsjnHg6ZCNryGH4svSBpG?=
 =?iso-8859-1?Q?r7YTfaIV1z57gk4rz46e6PChpERLsbiWDmRJ6CmnKBJMVRBdwgx934wRrV?=
 =?iso-8859-1?Q?URX9RZKr8rfjMxyA9NLKHIHgl6oave0igeyDQK91zjBHDehrYcyMUiSMOI?=
 =?iso-8859-1?Q?v9cRawQxTfsAN3hxQ5cU6NuSIvEX1aK5wOyGEQalAXAB89CYOHCdK/MNa0?=
 =?iso-8859-1?Q?NFwnrW0yI/ofWVAjgW+ZuhxckOIJXukmlLLmFUNMnutYkw1avDa6Wbd1WF?=
 =?iso-8859-1?Q?ryshL6m4ha/qr89hD5+AWv8bM+oSa+f4WRc1sygS0Gp4mkAo5TPaAMg1jB?=
 =?iso-8859-1?Q?V130OIaErtDBV+tI8OF8MH//18VzZ7czjkuLoMc5KMRux9b7jgKTxyc7Bh?=
 =?iso-8859-1?Q?KNkFmPntUbzkDv6gIZokacGryt9a4bwcG/pij4e9SX7ieB/Q8w0I+LtdKa?=
 =?iso-8859-1?Q?7K6frifZxACa06iw0IxEEaxenMif6MTHorYcF6xOi/Gmb3oR1EQfDTaDDR?=
 =?iso-8859-1?Q?okOX7YcVAsNYbQmdzcV9mhIWPXiQjIyCFT2V1hrv7UYn6Ht25Xio6P87Em?=
 =?iso-8859-1?Q?ZewWyEjHNaHQ24fOBI4NLy6xFdOUl6QpyNIiSdnCxl11W1OSpw3pRNnS+L?=
 =?iso-8859-1?Q?eJoO/o4LxZKK5SEwslsTidL7JbNmJ+kB+W3ETTUHU4DQEcuBBh+HxMb8N7?=
 =?iso-8859-1?Q?O/D0JAmO9h0eaypgIKSEK5hkEd1+AbqHfH9fsDAiPy+5f7+rO/BA9BfDz5?=
 =?iso-8859-1?Q?nEZsMY3hhvALCfIqO7K4s5Ji/lfMMipeZjJMH3loAcQNvU6aas/X06TsqR?=
 =?iso-8859-1?Q?Bnz7hd6a3ICwxZ41znMtHfuhbs9aiZkfCMKXZdfbbVcSxwx4GldHBoumEx?=
 =?iso-8859-1?Q?/4j7WhC2/Rw7H/ZoVDcYQefaEJKU21Di58dX3upg4Pb8Qe28xf9hi6+NYd?=
 =?iso-8859-1?Q?W/d97dC45NvneW4vrU9RMsc0fdn6/BLLAtdTr11VkJOOXwQ6jDfj61NyOz?=
 =?iso-8859-1?Q?Vvwpcs58rR8QeOAPxcYaZ6l2kC+ezLRaiMyqWUl0A1hLOtYl+MVCXlaoQe?=
 =?iso-8859-1?Q?ytBZKHIhWXCw3JV6rA7Cff41DCrh0LWW8ak/0/EFD+UasM3EyPES1OiABK?=
 =?iso-8859-1?Q?4+2y4OqAqCETZeA5ERECGYWC8LzwBwtTgfkNnmPOsHQNaRo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/BHLkLKMJY01Tp7Ws3E5I2Dm1rKq5onrMT490/rMd/Ekr1bBmQyrcXwQZe?=
 =?iso-8859-1?Q?YEm+vpa3GoqXTijLcjUIJ0LdHtrFe9gZKM5x1PMF0vgAhtSO+XbkOGKtCj?=
 =?iso-8859-1?Q?0k64ieKuQCZQuI47O9RsXUjDaCTdOVFHrDPGhooel4MXP6wqp+x8iwp15q?=
 =?iso-8859-1?Q?51A2Mh+ocH+c0FSmQkiHI9o47hjnelcK1wHTlt1ysIWRsCT2FQ14NClb2t?=
 =?iso-8859-1?Q?dSt2Yj9oX8Vi8TE4+ytxpQvj8rEJ6A68Whc4aOOsy4pR4zHuz+rP9zBpWS?=
 =?iso-8859-1?Q?9v897qVb8rv4Z/nY+Ml53otWENxx5hba6j7nJeUiItzCx6qT3T/Fue9k1p?=
 =?iso-8859-1?Q?w2FxjgAePpCH6zXD5b20p3fgfCmbnPOuH0eFnXUMrcwJJN9NqpOQNHW/il?=
 =?iso-8859-1?Q?fFRLG6tMIzAc8ToHSlBc5k3x/alelrKhNKT2Na7nS2wAi+jPqYP0PPtnm/?=
 =?iso-8859-1?Q?Sggu4TDw9/1MPgrbrNMD5ROcGReFlDCdiibhn4yZU1h5Bgc68jI+7iMTTU?=
 =?iso-8859-1?Q?oub2uphgzQHwRuADj9nwdj+BelIzNEPgpNM1RRn0a2LBOZmSedaELOEoXd?=
 =?iso-8859-1?Q?4DxvIeNNeGIVcrRfFbJHzrWbygbFcQZn7R1nssaCtOTXwlas2J0GbGw3DR?=
 =?iso-8859-1?Q?PWG1DJ0keOnMBXIOEy4J4sFRFpDw5DPSCQbx8PVU4e0mupMMjwvn0wRXhy?=
 =?iso-8859-1?Q?wOpDsz/tTF/xn1V5RomCloeFGAez7f8TVq3etyaEVIO/fTgJKTs89xirGf?=
 =?iso-8859-1?Q?cJIXLCsqG9+b3ZYyiBJn7NOh9WCgEMAHvh56YKxq2CLOCNeFDWIC1Ftcba?=
 =?iso-8859-1?Q?/J+bqP939QflUEiy2xrryUrJ4oKMLkD7387Uz6WBic5jX5T9W/iCa1Jjhi?=
 =?iso-8859-1?Q?x3EPXoc30nRhzqOZrQhiklZSB4Sgk4uHwIQgRP2U4sLzJZqDShoP5AXcrR?=
 =?iso-8859-1?Q?vma3W6M0Kr9kzc0sOB96SEOnqXN/mYTpPWzBuON111Yqtxbap0Gi4ibuYA?=
 =?iso-8859-1?Q?/s0ZKre+K+VIGReNCBt5CkrVrcRvj2Mn2U9qrCTtF0s21sm8nPGFbJw9yi?=
 =?iso-8859-1?Q?CIdyL3DzD/+PJfmzJICiP7FWZS6M6RyjsCVWXJKIu7vorJulkMeAmrQfid?=
 =?iso-8859-1?Q?SqcuKWluP7yCl/xq6+LVm1j9S+B9c6XAp4uTbDrumek5BKvObZVA4d3ET5?=
 =?iso-8859-1?Q?th+HHUKyOR4ArTe6hJX1Z70OpoKF0JPrePEWLU9lodRQfW36I8T6RvS98n?=
 =?iso-8859-1?Q?9V7dc/Pd4ZXT2tqXPi2ykVu7skprQP12eP+vM4CQBGbZbdQDbXOIg7nX8z?=
 =?iso-8859-1?Q?+gDdjzQVQ0gThTzogreK7+K/gtetNv6+iSJf2JyDOVwGdSwes8CXUyy0A9?=
 =?iso-8859-1?Q?ggYjZmskfYp13VznLjZZRzIkF7HjRplzXmP78V7BZG7Ix/gEyTCxp26x9h?=
 =?iso-8859-1?Q?jxP5aOFkg4zlVAA6FbF2UrL74rdvMaT/g6TNBgEOcWudXqJ5cMIAPP4Cfn?=
 =?iso-8859-1?Q?+1hSU/sFS7igCL9M3kkCrme4TOBAomMJ4kQbTWmAd9psctB/ZS/xQ8Fee7?=
 =?iso-8859-1?Q?yPughRhO/cxYA4V777yo81lzCIZkaZiLGPZOiRJk9BHfDyTKzjIGBvIPUR?=
 =?iso-8859-1?Q?r+w268GvqYlKs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd930094-3ad7-49f1-e96b-08dc6bafc1fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 20:29:39.7584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cqiSXJN3RGPxzU7Perdhc8jqt+0oPg4DDCsHv6efoceqaB8vuK2du4lJKeDDSXnYsbwa/QAs1JyaAg0PB3AsDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
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



> -----Original Message-----
> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, May 3, 2024 12:28 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; Daniel Vetter
> <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org; intel-
> xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>;
> Welty, Brian <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Leon Romanovsky
> <leon@kernel.org>
> Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg tab=
le
> from hmm range
>=20
> On Fri, May 03, 2024 at 02:43:19PM +0000, Zeng, Oak wrote:
> > > > 2.
> > > > Then call hmm_range_fault a second time
> > > > Setting the hmm_range start/end only to cover valid pfns
> > > > With all valid pfns, set the REQ_FAULT flag
> > >
> > > Why would you do this? The first already did the faults you needed an=
d
> > > returned all the easy pfns that don't require faulting.
> >
> > But we have use case where we want to fault-in pages other than the
> > page which contains the GPU fault address, e.g., user malloc'ed or
> > mmap'ed 8MiB buffer, and no CPU touching of this buffer before GPU
> > access it. Let's say GPU access caused a GPU page fault a 2MiB
> > place. The first hmm-range-fault would only fault-in the page at
> > 2MiB place, because in the first call we only set REQ_FAULT to the
> > pfn at 2MiB place.
>=20
> Honestly, that doesn't make alot of sense to me, but if you really
> want that you should add some new flag and have hmm_range_fault do
> this kind of speculative faulting. I think you will end up
> significantly over faulting.

Above 2 steps hmm-range-fault approach is just my guess of what you were su=
ggesting. Since you don't like the CPU vma look up, so we come out this 2 s=
teps hmm-range-fault thing. The first step has the same functionality of a =
CPU vma lookup.

I also think this approach doesn't make sense.

In our original approach, we lookup cpu vma before migration. Calling hmm-r=
ange-fault in a non-speculative way, and there is no overfaulting, because =
we only call hmm-range-fault within a valid range that we get from CPU vma.

>=20
> It also doesn't make sense to do faulting in hmm prefetch if you are
> going to do migration to force the fault anyhow.

What do you mean by hmm prefetch?

As explained, we call hmm-range-fault in two scenarios:

1) call hmm-range-fault to get the current status of cpu page table without=
 causing CPU fault. When address range is already accessed by CPU before GP=
U, or when we migrate for such range, we run into this scenario

2) when CPU never access range and driver determined there is no need to mi=
grate, we call hmm-range-fault to trigger cpu fault and allocate system pag=
es for this range.

>=20
>=20
> > > > Basically use hmm_range_fault to figure out the valid address range
> > > > in the first round; then really fault (e.g., trigger cpu fault to
> > > > allocate system pages) in the second call the hmm range fault.
> > >
> > > You don't fault on prefetch. Prefetch is about mirroring already
> > > populated pages, it should not be causing new faults.
> >
> > Maybe there is different wording here. We have this scenario we call
> > it prefetch, or whatever you call it:
> >
> > GPU page fault at an address A, we want to map an address range
> > (e.g., 2MiB, or whatever size depending on setting) around address A
> > to GPU page table. The range around A could have no backing pages
> > when GPU page fault happens. We want to populate the 2MiB range. We
> > can call it prefetch because most of pages in this range is not
> > accessed by GPU yet, but we expect GPU to access it soon.
>=20
> This isn't prefetch, that is prefaulting.

Sure, prefaulting is a better name.=20

We do have another prefetch API which can be called from user space to pref=
etch before GPU job submission.


>=20
> > You mentioned "already populated pages". Who populated those pages
> > then? Is it a CPU access populated them? If CPU access those pages
> > first, it is true pages can be already populated.
>=20
> Yes, I would think that is a pretty common case
>=20
> > But it is also a valid use case where GPU access address before CPU
> > so there is no "already populated pages" on GPU page fault. Please
> > let us know what is the picture in your head. We seem picture it
> > completely differently.
>=20
> And sure, this could happen too, but I feel like it is an application
> issue to be not prefaulting the buffers it knows the GPU is going to
> touch.
>=20
> Again, our experiments have shown that taking the fault path is so
> slow that sane applications must explicitly prefault and prefetch as
> much as possible to avoid the faults in the first place.

I agree fault path has a huge overhead. We all agree.


>=20
> I'm not sure I full agree there is a real need to agressively optimize
> the faulting path like you are describing when it shouldn't really be
> used in a performant application :\

As a driver, we need to support all possible scenarios. Our way of using hm=
m-range-fault is just generalized enough to deal with both situation: when =
application is smart enough to prefetch/prefault, sure hmm-range-fault just=
 get back the existing pfns; otherwise it falls back to the slow faulting p=
ath.

It is not an aggressive optimization. The codes is written for fast path bu=
t it also works for slow path.


>=20
> > 2) decide a migration window per migration granularity (e.g., 2MiB)
> > settings, inside the CPU VMA. If CPU VMA is smaller than the
> > migration granular, migration window is the whole CPU vma range;
> > otherwise, partially of the VMA range is migrated.
>=20
> Seems rather arbitary to me. You are quite likely to capture some
> memory that is CPU memory and cause thrashing. As I said before in
> common cases the heap will be large single VMAs, so this kind of
> scheme is just going to fault a whole bunch of unrelated malloc
> objects over to the GPU.

I want to listen more here.

Here is my understanding. Malloc of small size such as less than one page, =
or a few pages, memory is allocated from heap.

When malloc is much more than one pages, the GlibC's behavior is mmap it di=
rectly from OS, vs from heap

In glibC the threshold is defined by MMAP_THRESHOLD. The default value is 1=
28K: https://www.gnu.org/software/libc/manual/html_node/Memory-Allocation-T=
unables.html

So on the heap, it is some small VMAs each contains a few pages, normally o=
ne page per VMA. In the worst case, VMA on pages shouldn't be bigger than M=
MAP_THRESHOLD.

In a reasonable GPU application, people use GPU for compute which usually i=
nvolves large amount of data which can be many MiB, sometimes it can even b=
e many GiB of data

Now going back our scheme. I picture in most application, the CPU vma searc=
h end up big vma, MiB, GiB etc

If we end up with a vma that is only a few pages, we fault in the whole vma=
. It is true that for this case we fault in unrelated malloc objects. Maybe=
 we can fine tune here to only fault in one page (which is minimum fault si=
ze) for such case. Admittedly one page can also have bunch of unrelated obj=
ects. But overall we think this should not be  common case.

Let me know if this understanding is correct.

Or what would you like to do in such situation?

>=20
> Not sure how it is really a good idea.
>=20
> Adaptive locality of memory is still an unsolved problem in Linux,
> sadly.
>=20
> > > However, the migration stuff should really not be in the driver
> > > either. That should be core DRM logic to manage that. It is so
> > > convoluted and full of policy that all the drivers should be working
> > > in the same way.
> >
> > Completely agreed. Moving migration infrastructures to DRM is part
> > of our plan. We want to first prove of concept with xekmd driver,
> > then move helpers, infrastructures to DRM. Driver should be as easy
> > as implementation a few callback functions for device specific page
> > table programming and device migration, and calling some DRM common
> > functions during gpu page fault.
>=20
> You'd be better to start out this way so people can look at and
> understand the core code on its own merits.

The two steps way were agreed with DRM maintainers, see here:  https://lore=
.kernel.org/dri-devel/SA1PR11MB6991045CC69EC8E1C576A715925F2@SA1PR11MB6991.=
namprd11.prod.outlook.com/, bullet 4)


Oak

>=20
> Jason
