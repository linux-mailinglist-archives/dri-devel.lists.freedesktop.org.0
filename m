Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59066A57497
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 23:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39FB10EC45;
	Fri,  7 Mar 2025 22:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpriOGzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661EB10EC37;
 Fri,  7 Mar 2025 22:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741385151; x=1772921151;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XtisT4hX248fTnxFlJ2HB+TWxhjR5XPuaE5suEEzKoc=;
 b=jpriOGzhKwUXPMZ8ZCBGjg+i8MaHOI7psdH4bAbBgBnoy4QAWqWZ+dXD
 5PswMQbWG8QoFuour1a5Ta9KzQiRJPHY52ii6fPf5Qapon2uD12ueDQW/
 1WKnHwx89F9SAH+gYZZAvfnFT1qFbNnCb/kwEkrbwT4MDMCfuDgbmb9n+
 QxOlMvpXp0XVArCpTTLlV4bbJY6Jt8ciNhMYrfgVfx6VMFQkD1uEaLMM3
 MACUR3RmtvFvHWRbQCd5YFDETHUyKx8rdIqSEhZ+g8vE9ezsLyIkIeemV
 bsdFbSrWibPOnK8xQTNfjJpYg/ekElJLA0fMS01doaq4fqQEkXBD/L/nE w==;
X-CSE-ConnectionGUID: rKJKgbS7QHu6pPQzAhHhFQ==
X-CSE-MsgGUID: qBZ4A8KLRBOJRisYwVi/Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="60002835"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="60002835"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:05:49 -0800
X-CSE-ConnectionGUID: yu/d8EIOTluWG2VD4y33KA==
X-CSE-MsgGUID: dp6y6GzZQS+qxLFYfHWqkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="124452483"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:05:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 14:05:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 14:05:48 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 14:05:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a51RA8ouAWlXzaR1SllHfRuT/qX4A67+lpL2ewM8W9jUL/Za9Gf+4xvNuqB3gZLrS/KKNuAGHmex7ir3g3zxa3ptYH1+imY1GMHZiJ1qmvjXQUYozzsqbCqblZO0ggrY7tpfDYMTh+9mzZdKrrORT68vtcGuP5ci8SZEWoSzWY4/6dtNDDERlLM1IYW3pj+cUKrLj6pLxkgnoqeufuqfWqVqsgS39tHsRpULw4acwxS+WO3ZVkARVUxoOOMefnIabQelMVYbTDluD2HWbyfGuEMrHIT7U1ddW8R0ZEcPUUVEyhuBoYQ15tXGx+KwwDlkKgWRaim3VwoQpiRPt3jLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYs9/f709h5dIhGxje6yYQ+ljRSMkoqBx4g1oJG7a6k=;
 b=RqZSp14K+Xx0SsF+vEDFoEtTVtFtPh1wxVrzeK9D07Ievkmzi08gkZlIPrZIYinruCP+2x5aXSYDpRjv8D4A7FD0b0Y33zq+y6XJGjZzaqB/0vit6wT1IhvmiBmuSfSHcFNillH+BU2SMcqryvVYGjPwazJ5lC+O/T1Pn+U91rjuelHNSuxyyk0H34RYWCR+I69xQ4agYS/q93NKjAxDuRi1aenWdT4Szgt0Gy62Ug64xnZNz31esdoTypR7iKTXTycGYRpz1hnhuvS9/gqjO5wMxdSKfXG6NcuYbDnVgW7829RA5UFF3JHUbUYAm/RqBVUd6yQeE4BDiTGCUjvszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB4944.namprd11.prod.outlook.com (2603:10b6:a03:2ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Fri, 7 Mar
 2025 22:05:41 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 22:05:41 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 3/6] drm/xe/xe_vm: Add per VM pagefault info
Thread-Topic: [PATCH v5 3/6] drm/xe/xe_vm: Add per VM pagefault info
Thread-Index: AQHbjSgjon1kBfH950OiGY/HoV0zrLNnobKAgACczRA=
Date: Fri, 7 Mar 2025 22:05:41 +0000
Message-ID: <CH0PR11MB544448B0D5E9FB19908A8D50E5D52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250304170854.67195-1-jonathan.cavitt@intel.com>
 <20250304170854.67195-4-jonathan.cavitt@intel.com>
 <890216ca-e30c-4573-a9ef-14ed1e39ae07@intel.com>
In-Reply-To: <890216ca-e30c-4573-a9ef-14ed1e39ae07@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB4944:EE_
x-ms-office365-filtering-correlation-id: 785b2dad-551a-4443-d251-08dd5dc43332
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ilfjcMpmYg9qRaUEsREWyfaM07iTzaivcDzq52surP84KpaqF8lzl7CktaLM?=
 =?us-ascii?Q?03G8WLKyH8+Ri9Qb89Rzx037zNDLzaK8v3PrpXw7w8XmWjoxKclwFG24weFC?=
 =?us-ascii?Q?lAMeqywpcrv/S+04DI0izgVZhXmlNd6tG2i3vAOeH31XbKQd2MljZd/S/P3a?=
 =?us-ascii?Q?b2j/AmRDpCP/5ty0ImWqWHG4A3hYG7Zptk36onoZEvzavCLVbg1s9OpsIPqp?=
 =?us-ascii?Q?tuDiGHvzOi1sWWWY7vGzEyrdsfGXeWxlkxvEn4RUpqsGy2AenUX90Ch154fu?=
 =?us-ascii?Q?sNOHYKwPW6npcrhz/HFrrJfq+XGlSokN35IGzsM4haZ1IJDPYC8xhELZV6Pg?=
 =?us-ascii?Q?Xi/0P8iCWI5GmGTQGc3BPSIGapwbiPBmYFR3YKJOSmMBJ0oSASBlW5I0Xa3x?=
 =?us-ascii?Q?xJIWzc581PxVSSF9PGvknsx1HpPnrwxrLhLgtQoPo/eWoorEOPZV+og6AQ1J?=
 =?us-ascii?Q?DuxfvR1RIDXuMPHDZ4bjgwak2+yQ+1Wuxeo+d4q3WLP/f1O2z/p3qhKS2xxI?=
 =?us-ascii?Q?Ok1MKa8BG1PBc77SHLZtR3+E0fFO/uoz4AXSnVJjV3+spuRNf1PF0SmKnUmI?=
 =?us-ascii?Q?ncW7tKpmRaDsucU/f0QekAfUgQcKxHkVXI/OVrQvDIvpM8qA7cZvIdX1d2qr?=
 =?us-ascii?Q?DY0JEdoDuTKsaIcgLRSXkHWbBJQTyuMoL8apewCoK2SulrrA2AkvQR9U3F6W?=
 =?us-ascii?Q?IIZAqbI4Nsv/uGjdP/i+ObDuRtdZ0Vd1mRrgBZbP34tUZ+Dl3/ToP5q3PLjV?=
 =?us-ascii?Q?5rkS9pIUCT/r+dqr4RMS+pTe3O4/T1V/ffLZEANI7f/jypBTW/mPJjavbNGi?=
 =?us-ascii?Q?QGeeVWHIJLr/CXybjm9/7pv2B8ikkyScgL+CiEWcEhFy7gXI4WoRUUJDp4iF?=
 =?us-ascii?Q?W9znxmL4o8bpccGKVeXw0+wj5iem2Pdcoc+hQTkhicswiCnmob2ap48wrzXv?=
 =?us-ascii?Q?yYAp8hzrmmEQl9Ub6g/vSyM80pK3gefhT8IOGGzmAcvcl1rvYRS3ZLxx3HlC?=
 =?us-ascii?Q?3p+ODvbt6CF/eZKqIkoBsf3iqcPb49TKof6fsrcZP76d0sF5NRTQeAM7fDTQ?=
 =?us-ascii?Q?Et1jkmd4QcHAd6+yHjJ12Fmb7G5ldQABr9n2hdxP7mbTovN/G4nUvG35AZz7?=
 =?us-ascii?Q?i1i6vWS/zaWVbWseV8mmLaiXyGARwIVzwAltlvv9/Ogc4boUF9Ob23JMgpf3?=
 =?us-ascii?Q?z7U4zevpEzsejYoefIjIXq3IYQTlqjlekEUHLvqk4bRYBsagHAnXCDkaKKkT?=
 =?us-ascii?Q?2uIyoqqVaz7UFRyeVrOxRGrvML71E2CBR6a7ubXMJJpCo28QfBGhy7irkvYl?=
 =?us-ascii?Q?tz676AxqBJ4V55CBQ18xrZ22sr3nltYfRoDQBvWVelARK+dGVG5QXaGEdQsS?=
 =?us-ascii?Q?RKTTs+beXYgwoVT0LUXhUa15NwOYvxH6g+Pzz/S8U7afGRM3mSSAKSiLsfCi?=
 =?us-ascii?Q?inG0y5jqoFxSdgxkEQ4mBIZHQWfyzpDx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ujlJ0btrVCAsq6kMQkbth0ptXpdLfNBffKvAECHApV2LBNs+wqAl5dxGpGkO?=
 =?us-ascii?Q?7cwZIrcfZMY6QxS/Ncn97hJM+3KvRBgyZjAoUrc2D5xhQ3kRswlqH+JntON8?=
 =?us-ascii?Q?jPVOlZ2oFCEWXTi9rRvWt1k414f+67MI90kz4k9HyxGqG0HVq5wTeLWRT4XG?=
 =?us-ascii?Q?BsmDXvhbZ2HOoL2yeLJWC+2hDDA/qTW7GoWJ/A162NuNvxkBhelM1vo0JjsY?=
 =?us-ascii?Q?oQfhrUUnvAZGAnt+fWrfGeTdMiHEXxdRNHcafuHxwRlD+J1L+5V/WIPo3TTT?=
 =?us-ascii?Q?3ubu/6Y2A46WWIwhYxFgWLGLr34X4Yrc2BOpB1z+F31gKEzSm0sY+bsIJbzy?=
 =?us-ascii?Q?obocNkb+H6DvIhQWenD1T3LlNKBuj9u2ptEdHQy8XXMDFwRx10Efr9MlAwaV?=
 =?us-ascii?Q?VdBLQ2GruB8VXaPT8rqid9oY3EK42FEM56XA9yiVvqIQW7bxgfGRgGBoQebp?=
 =?us-ascii?Q?AwNXMrBSjgGI0rQpJY4wHOpLBkfiEevCiefpQlY5vY55Pkvc/uQdD9U7IE5i?=
 =?us-ascii?Q?EdeFVJSvuy3myBRZpygsE+WCDB6aOCW87b8qWOLbo4LBiPyk03mFJFF1S0jK?=
 =?us-ascii?Q?MlECzKJ6rI/Y4eOvukZK+E9MH6ydiGAx8WxZ8wfy4KcNBaiqnkoGE6SIoweH?=
 =?us-ascii?Q?RwKnFDaCQhbdBrYLSytVptwePpJjrDb4FtlYJmAQhV2YqHZ4dvrfIPfR/fB/?=
 =?us-ascii?Q?mGP/97N1NtMMPEvyU9cPk3bXaaeTEa6AAWIAVBy0qluRkmO+auGmb5pFQ1dr?=
 =?us-ascii?Q?9MMQvylWXQULyq5GaWs2+sJVzUUc0Ta4nMx9Gszi7IkvzlbCbJlYZrGPinaC?=
 =?us-ascii?Q?dKXAD7S9Xop+xCqlj+XWuoGiw2bLjjTfBvNQzRSe9r9/vssK6RVzzRAC7ztY?=
 =?us-ascii?Q?CmmFdUIH28Pdnhagr2yCor8Rswuuh6guxcCXeLDqaFVv0J8Vm9lCvR/5TawN?=
 =?us-ascii?Q?h2FJajGqLn2DAaNrE56i14wmvMdOSkjCgW9Tg/aXSuvMYvmT8DhRUhCPK/+l?=
 =?us-ascii?Q?6C38a7l3MZPmT6WWoP/A7p/Z+WZXG0gai2zjlmpZYpQj4aoaLflrRu3LmzsR?=
 =?us-ascii?Q?qydOMGXobu9k0UF3x6Mn34HQjgOMSsyU5RziOHDHLPJndIIwVLdZ9ffvQLGi?=
 =?us-ascii?Q?bN7+TNo71WcbvHjh3FWMCOsBkkgrkvgOYVtEqkL3P1sQKD/GuHzYKleqqtti?=
 =?us-ascii?Q?fBVJEXJ8b0iwqRKfRWrv+eEqRtz55X4zv8OdH3Yu+J9UYUyg7jfkOlpCSFcS?=
 =?us-ascii?Q?vVK4OVOrI+2cNZaHr6v/s3y3shHX5AAF0FMz+eFZIAUrkdzbDhZ607QuNP5H?=
 =?us-ascii?Q?eFX0iMjXkm5vVZF1KpJmP5oqxokfwHDCIv8+zHpgqB45Pd2SbOw9IL9aMpGq?=
 =?us-ascii?Q?+Mhh7RdHMiVj0kVRABqWeS0JUYhBGzytknJcdXqjH53PZB8PUrWRiRjUQ1CY?=
 =?us-ascii?Q?eeHNyJaNVj7w1Vn/m6XcYPtxZuG/r9aFwqk04RhSkmAqHrle5clPmmU7sY0q?=
 =?us-ascii?Q?BKQgZ3WinYij/26/L3UfnyMFZS6rqTsA/jdizBHYnex5AL4Xx/enUB1LBC9i?=
 =?us-ascii?Q?XJV487P7siaHOQyisAaFIr4WZAiS7rAQtrqIpWVu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785b2dad-551a-4443-d251-08dd5dc43332
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 22:05:41.0193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZfLPWGGNTstij4JJS2l66GKbN4VPXGJ4FHPiBUFkbnOg+q/Uk/Yh7Te9c6/j7kEOR3uGXszcww0Jr5GevBXh191KVAywpwyi6d9NNIMEkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4944
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

-----Original Message-----
From: Mun, Gwan-gyeong <gwan-gyeong.mun@intel.com>=20
Sent: Friday, March 7, 2025 4:40 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.c=
om>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.li=
n@intel.com>; dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 3/6] drm/xe/xe_vm: Add per VM pagefault info
>=20
> On 3/4/25 7:08 PM, Jonathan Cavitt wrote:
> > Add additional information to each VM so they can report up to the last
> > 50 seen pagefaults.  Only failed pagefaults are saved this way, as
> > successful pagefaults should recover and not need to be reported to
> > userspace.
> >=20
> The unrecoverable pagefault scenario causes a caterr or context reset.=20
> so It would be enough to store one uncoverable pagefault for providing a=
=20
> unrecoverable pagefault details to userspace. how do you think?

That's probably correct, though just to be safe, I'm going to continue to r=
eport
multipe pagefaults at a time since there's not any harm in it.
-Jonathan Cavitt

>=20
> G.G.
>=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++
> >   drivers/gpu/drm/xe/xe_vm.c           | 45 +++++++++++++++++++++++++++=
+
> >   drivers/gpu/drm/xe/xe_vm.h           |  6 ++++
> >   drivers/gpu/drm/xe/xe_vm_types.h     | 20 +++++++++++++
> >   4 files changed, 88 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/=
xe_gt_pagefault.c
> > index 07b52d3c1a60..84907fb4295e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -335,6 +335,22 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u=
32 *msg, u32 len)
> >   	return full ? -ENOSPC : 0;
> >   }
> >  =20
> > +static void save_pagefault_to_vm(struct xe_device *xe, struct xe_pagef=
ault *pf)
> > +{
> > +	struct xe_vm *vm;
> > +	struct xe_pagefault *store;
> > +
> > +	vm =3D asid_to_vm(xe, pf->asid);
> > +	if (IS_ERR(vm))
> > +		return;
> > +
> > +	spin_lock(&vm->pfs.lock);
> > +	store =3D kzalloc(sizeof(*pf), GFP_KERNEL);
> > +	memcpy(store, pf, sizeof(*pf));
> > +	xe_vm_add_pf_entry(vm, store);
> > +	spin_unlock(&vm->pfs.lock);
> > +}
> > +
> >   #define USM_QUEUE_MAX_RUNTIME_MS	20
> >  =20
> >   static void pf_queue_work_func(struct work_struct *w)
> > @@ -353,6 +369,7 @@ static void pf_queue_work_func(struct work_struct *=
w)
> >   		ret =3D handle_pagefault(gt, &pf);
> >   		if (unlikely(ret)) {
> >   			print_pagefault(xe, &pf);
> > +			save_pagefault_to_vm(xe, &pf);
> >   			pf.fault_unsuccessful =3D 1;
> >   			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
> >   		}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 996000f2424e..6211b971bbbd 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -746,6 +746,46 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
> >   		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> >   }
> >  =20
> > +static void free_pf_entry(struct xe_vm *vm, struct xe_vm_pf_entry *e)
> > +{
> > +	list_del(&e->list);
> > +	kfree(e->pf);
> > +	kfree(e);
> > +	vm->pfs.len--;
> > +}
> > +
> > +void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf)
> > +{
> > +	struct xe_vm_pf_entry *e =3D NULL;
> > +
> > +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> > +	xe_assert(vm->xe, e);
> > +
> > +	spin_lock(&vm->pfs.lock);
> > +	list_add_tail(&e->list, &vm->pfs.list);
> > +	vm->pfs.len++;
> > +	/**
> > +	 * Limit the number of pfs in the pf list to prevent memory overuse.
> > +	 */
> > +	if (vm->pfs.len > MAX_PFS) {
> > +		struct xe_vm_pf_entry *rem =3D
> > +			list_first_entry(&vm->pfs.list, struct xe_vm_pf_entry, list);
> > +
> > +		free_pf_entry(vm, rem);
> > +	}
> > +	spin_unlock(&vm->pfs.lock);
> > +}
> > +
> > +void xe_vm_remove_pf_entries(struct xe_vm *vm)
> > +{
> > +	struct xe_vm_pf_entry *e, *tmp;
> > +
> > +	spin_lock(&vm->pfs.lock);
> > +	list_for_each_entry_safe(e, tmp, &vm->pfs.list, list)
> > +		free_pf_entry(vm, e);
> > +	spin_unlock(&vm->pfs.lock);
> > +}
> > +
> >   static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_bi=
nds)
> >   {
> >   	int i;
> > @@ -1448,6 +1488,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, =
u32 flags)
> >   	init_rwsem(&vm->userptr.notifier_lock);
> >   	spin_lock_init(&vm->userptr.invalidated_lock);
> >  =20
> > +	INIT_LIST_HEAD(&vm->pfs.list);
> > +	spin_lock_init(&vm->pfs.lock);
> > +
> >   	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> >  =20
> >   	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> > @@ -1672,6 +1715,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >   	}
> >   	up_write(&xe->usm.lock);
> >  =20
> > +	xe_vm_remove_pf_entries(vm);
> > +
> >   	for_each_tile(tile, xe, id)
> >   		xe_range_fence_tree_fini(&vm->rftree[id]);
> >  =20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index f66075f8a6fe..4d94ab5c8ea4 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -12,6 +12,8 @@
> >   #include "xe_map.h"
> >   #include "xe_vm_types.h"
> >  =20
> > +#define MAX_PFS 50
> > +
> >   struct drm_device;
> >   struct drm_printer;
> >   struct drm_file;
> > @@ -244,6 +246,10 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma=
 *uvma);
> >  =20
> >   int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
> >  =20
> > +void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf);
> > +
> > +void xe_vm_remove_pf_entries(struct xe_vm *vm);
> > +
> >   bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktim=
e_t *end);
> >  =20
> >   int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_v=
m_types.h
> > index 52467b9b5348..10b0952db56c 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -18,6 +18,7 @@
> >   #include "xe_range_fence.h"
> >  =20
> >   struct xe_bo;
> > +struct xe_pagefault;
> >   struct xe_sync_entry;
> >   struct xe_user_fence;
> >   struct xe_vm;
> > @@ -135,6 +136,13 @@ struct xe_userptr_vma {
> >  =20
> >   struct xe_device;
> >  =20
> > +struct xe_vm_pf_entry {
> > +	/** @pf: observed pagefault */
> > +	struct xe_pagefault *pf;
> > +	/** @list: link into @xe_vm.pfs.list */
> > +	struct list_head list;
> > +};
> > +
> >   struct xe_vm {
> >   	/** @gpuvm: base GPUVM used to track VMAs */
> >   	struct drm_gpuvm gpuvm;
> > @@ -274,6 +282,18 @@ struct xe_vm {
> >   		bool capture_once;
> >   	} error_capture;
> >  =20
> > +	/**
> > +	 * @pfs: List of all pagefaults associated with this VM
> > +	 */
> > +	struct {
> > +		/** @lock: lock protecting @bans.list */
> > +		spinlock_t lock;
> > +		/** @list: list of xe_exec_queue_ban_entry entries */
> > +		struct list_head list;
> > +		/** @len: length of @bans.list */
> > +		unsigned int len;
> > +	} pfs;
> > +
> >   	/**
> >   	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
> >   	 * protected by the vm resv.
>=20
>=20
