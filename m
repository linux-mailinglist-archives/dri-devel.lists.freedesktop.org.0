Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE3A9A00F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 06:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820A110E720;
	Thu, 24 Apr 2025 04:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEmqqI8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAFF10E720;
 Thu, 24 Apr 2025 04:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745468557; x=1777004557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fMS/kGBSmIfCKH56MLMZ2gfFmwW7GhlAOaCaM/BfykU=;
 b=VEmqqI8p6wQq7IlnET7N17Hbm+OWDCOWp3wzmT3TVsP9Dfi2iWj91Dvd
 SGrPP1JuJNzBxCGmo2YP5+w+iBpKawbJyVXoSq+JRgSlpVLz23Jpkx8Ti
 1SVnIdb4DYnfk4cJmCP6RAQgdODK8HP2PeQIrAEe7B0V+SCv1PuHGr8nS
 i8hnslI6IwrMpz6Bcw/3PI+5ujFCsFldpLaneC9jCrLapZZ2royDtsrrr
 gN9fxjCk4wb2uqoH04XJEi3woZy3rGtJzt/i3BqQ0tdd+niCswIo+7oGr
 afdxI92peSgxY1cx7LWy6dN7mxOeDDWCMgaozX6k3AjRleeIpw0I7xOrO g==;
X-CSE-ConnectionGUID: G/A+7FDkRs2Ud4x/rP3tsg==
X-CSE-MsgGUID: z8inDHSLQqq266pF3zGO6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64614466"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="64614466"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 21:22:36 -0700
X-CSE-ConnectionGUID: at45LpyRTSmOFd7zv6yx2g==
X-CSE-MsgGUID: vAK3jKtfRRGOR5k0E1XuJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="163472952"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 21:22:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 21:22:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 21:22:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 21:22:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpE8kYOuP2UjXQWdikCKBPOlSlgbThKEJ4wMArZzgLXGJwPivnbJBeDB0xLn614RWsL4Zbd9rbzgyDPk+fTTH/EQdHv/ZYjlQV+gAJlc60UY1Y04jO0DYPB9F7SIS1mf3K3p0/o+oyTnVXAoYU2/DBspJLWnUsbek+DgpZvtZsdAdLHp55bkaskyoyWOJN6x9hQA1gXbrPrFYdS4qNQTUlFIylwe0wWSH9wDjcOcpoHIFMqia7i/49Shej+RkggWVwkCDKh4rP4KEmdjpNwH0oELK3I7VX1dsMSZXwVdcbb7PPj0kvufVUrc5YG7zj2e2vvw7Lg55bUii+IxfBb4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgGAxr1PYqmEghm1MFYcWPfF4AQAYeoJzHSES5wRQw8=;
 b=IEpgAet0uQgSAaH3dnE8m00Z1nYOqSlcznKCxtOzuG3AugreLWbDMTEJprRExb7BppewGUkMUzgKlH4fkfm77Fgt3Rk/yJqxsx5ufDKVdfmXnGFUDcIouZBA68ztUyk7LWIvsoR8xInSIF6gEnHr2aqjv3UdnmYW2bwyxrrWw4X6pOPnG8JP0XVIk72KwjSSy0wzt6l5kMY035FqwRQFAxo4aFxhSpAmTfufYKY5PFaT8O9+zCdARN1CUOiXyXuKjTSj7Adh8a4Me8nvAAaZSbrtgDMVUoVPEqii2CxhDZrbzJ9dqWrtP8rDGDBoKsLBDOZsLPX66HxnLjGCMlhddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Thu, 24 Apr
 2025 04:22:33 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 04:22:32 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v21 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v21 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHbtIz/J0t1jVl1R0agNnUd1ptIibOyLqBA
Date: Thu, 24 Apr 2025 04:22:32 +0000
Message-ID: <DM4PR11MB5456CFC1B1234E116F6A8C86EA852@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250423201858.132630-1-jonathan.cavitt@intel.com>
 <20250423201858.132630-6-jonathan.cavitt@intel.com>
In-Reply-To: <20250423201858.132630-6-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MN0PR11MB5961:EE_
x-ms-office365-filtering-correlation-id: ff30e8ed-03a4-4ef4-597e-08dd82e7a258
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ab9yXTUljp0Dt35AIgv6kokIaZFMDAcDhBcQuJu/9qbe9J2eAGi9+8UL7gFX?=
 =?us-ascii?Q?DWzwiJ/R4pA4sRZqFpgbjNJD20nu04APuQgM0Cvix9UWtlAB9bCfe/Wsb3cD?=
 =?us-ascii?Q?/3eZKGQQFtyZcs0xiCYYyqS16r3E2x6X11HbsyWf2kGlK+X44gOW8FbSn5ct?=
 =?us-ascii?Q?DA/np9CxwMrPJf2nLRi2kjsE2+PAzmNYfmCzLe4nKFMIv2WuoNJMRFKc4re0?=
 =?us-ascii?Q?Fb6C2ls8V6IA3C8KZeckFwoeoiVHhdDGiy8ZnaXwZ5fiWIaDenGMy1y5GLFA?=
 =?us-ascii?Q?EcWcrVQmrT9L1CFabaFgmsUQBcF9MTPQ2g2x/fCug64Uh471icrgIHlwmh7x?=
 =?us-ascii?Q?JbulDFGk8HktbHsABQ6cQTtvaiXqWHIDPQ2PxNmIfWpg8p0hwK5Hg9eFH0Ic?=
 =?us-ascii?Q?WRQOTafc/xFPGdEFn3sZHlcQOJVec+Xqv/cpFw4sqdBOsfUwuR/MWK7wern5?=
 =?us-ascii?Q?bTG4BpalzEAk473VLncOMXvR6xe6p+7ZjXye1ihlMsiGj6zdusClMN1c7ppy?=
 =?us-ascii?Q?RCIVyOINoClEQjrHoXRs5orQurBxqM8ecxsKmzba15stDyQhSJzXW6p5304V?=
 =?us-ascii?Q?CMpcAvXIUqs/qB5nSzBTfw3YbjwwCujFcejBxwpZNtVEjjcoLdeeZAKbdIbe?=
 =?us-ascii?Q?jKW4PqCb7O7FXkyYAVKbLbxEq03UZIC82D4smnSH9HuJHMOzJN//NFsemyd1?=
 =?us-ascii?Q?TRX3DWMDBgyb+y2EpBsowtJrc8yV1u/3hZeGUcDcl3M3d9S6moUh5qxR/NkF?=
 =?us-ascii?Q?ekxmOIk2V6PyADocY8i+1tIWUUXJSmAg7ptihTnxDFWSGYDvlu0bohO1RSRy?=
 =?us-ascii?Q?JXIZtdozpefO8IJQ6TJlHJ+SJO3GBz13dtUijSNytpjI2KNcaxLPCxmTELRk?=
 =?us-ascii?Q?eUvMUa5/cL7cEaEDAEkl3PEyMRCtYiWeFoBcgO9Bu0gplP4Gu/SnZw2cRHik?=
 =?us-ascii?Q?c6iLF3BsA3SJuaOtF/jy/AENswOG11VpVG+TMibPhMPFJvLZTrKR5+O98Jmq?=
 =?us-ascii?Q?ShUTjvBH2iltcr/PNX9a6dI9LBMkeGmT6EHkrAo2Hvj+q7cUCBlZyyKwNOM8?=
 =?us-ascii?Q?hVsxb4iTmm0GDKYwrCCUt8Ww6tmetpBKcAFULGFe85Sz7KhbcTHsTjDU4qOQ?=
 =?us-ascii?Q?FUF6ebPN4cA5stpaFGuq4rc3sGSJrDSP5U8lweQHUTG4PHCH6/302Hmk3nM2?=
 =?us-ascii?Q?DCNLn7JFG+Wojl+YPOGa9cde2AMpeB/B01bZ2RuGt/OoZZzXSErKnK88ErVk?=
 =?us-ascii?Q?eWpIpaedzxsa6oRDAiQAwWz7Ux2QIxS/KTwgHA6ust8Au6jArh0s2t7qoFix?=
 =?us-ascii?Q?+IwdLv5eQKYLkIezicoWUKejbjB54H0T7W5OCMHmnBxFgU2goW4KGoT5OaFd?=
 =?us-ascii?Q?ix22DX45UABiK1/V/YWH6v5jPDqlKHHT5QJbTYYJOb2OHwxDaupyQ9j7mn/m?=
 =?us-ascii?Q?+k3CkmSvSI/0qzwIfXdbILnyj5JnFH0LaOIdpTpWucdq7dn5t3NoUbJ202Sv?=
 =?us-ascii?Q?8caWO89+oq0os7o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pya0h75OnT899xL0FqFGxaWHAn9VK/LZeuds4TQ+Z9xMMK6JLZuwmIqeZyZQ?=
 =?us-ascii?Q?qOL9m7opOofQuqnUC+W6bYKEjmqcqwjf/W+Yx4jFSk5lt9GJp3VsX/zF+g2Y?=
 =?us-ascii?Q?VlUREKSHx3w1xJZIxZx+l6b5kxIHfQYIxS5x+i6spfWmi2zsVWqnNTLd0laO?=
 =?us-ascii?Q?MfUy4dlRg20V6YLkTXFn5TzYOKWW7ANKvgPABzwlMHUNN9rk5PjHIiOiaqmq?=
 =?us-ascii?Q?CPN52CKHXMUxXLrzt/8x3tNrxUD+6b3sFISsLApbDBK+Ff0ndmbL5ChqXzcJ?=
 =?us-ascii?Q?fvRhwqLu/w03G16ed++LFd5yL+ONKd6xb2b9YjEQrxjrTLohQa6BZ68QLbsK?=
 =?us-ascii?Q?glZ8EL1/yfsrZ/PamDWd8vmZXiyTCP1DJIUfiKgdDLq8hbt11m+o3WjhZcPj?=
 =?us-ascii?Q?bmTFh415aHIA3dXOsA1UOMfpcXMftNCIvq+tDencJ/KI9wL4a4okHAhsrRMh?=
 =?us-ascii?Q?FJtUtGkKzErO7BPSwJpDYpnV7PHBzJXfMwOKymlM0XWfEKB/va0964S5B74i?=
 =?us-ascii?Q?ANlVBujaFQqoJoRhGtkUpCjnCc/i/gpJhau9ldKieqXfIu5MZspflPuY7XUB?=
 =?us-ascii?Q?RVuV9vSEI+t3kn7PSax3Le0dJAEHs60khFrNNyqGd1dSGqhzn/7xt+94nhZA?=
 =?us-ascii?Q?nB+AAF5lKSnM1Za9kKGgyk4L74hz92Xps5IPDZwufSq9podhPN809BQkVBY3?=
 =?us-ascii?Q?3hb7tzq3IIhmOGFrQ7kyW/vbzYiToFK1kXeVbSo6sjNmNUt6pHXBfA97R0q6?=
 =?us-ascii?Q?7FGmguR13remm5GgL7EfrysFfCiCYNa0rYLkCM7G1V8OdTmAyoo3HPkXiZ1e?=
 =?us-ascii?Q?TnbZxCMe19mgVUsJdkx8yoyqWAuio2z/ffkNWlNUM3634w9i2ng2Mr6l7GdK?=
 =?us-ascii?Q?e78ZAL/fnMCRm6eS/V0DLVFKuaoNplmtmB8Od6LqHRxtzfo8OZzTZAbyYFCm?=
 =?us-ascii?Q?zXctnYgwwLicRb8lx831SCOx2kmumbKSeyhDTGygHBiPZp2X3/TjqhZ/8sP9?=
 =?us-ascii?Q?BLDvWhL10LjX/9IBgOE6mb38bfoIm6aYeuww7jBcoU71vu9+uqyimOPEIwmh?=
 =?us-ascii?Q?F2EhwWVTUAW6FKvgY3O1bA84nto67Hc2lH78XJP6Qfht2dcbPFTqOGeivZu9?=
 =?us-ascii?Q?n1Pe+4LonepH7Jy5utvTWBekQJuANA80ijFXmd70lOnP6Fu1jrv+atRrzsRq?=
 =?us-ascii?Q?YeJa0nK35hCifhg77Sg00B+SqcbiOjrbP0hULP8yMGYu3v5F+YuG7JHEnm1C?=
 =?us-ascii?Q?r4TnwnD2Wh5QmVLF1wVYBAs2N66VWsB0AuPSBdlDWrXr6VXcK9AIVRgGCbPW?=
 =?us-ascii?Q?9dAX72jY/cX9dqv4zsaP13zDnLGsr+qmr/VUAd0oLtMNCFKV3AX0BVEFJsYc?=
 =?us-ascii?Q?OL/Vu4nRnme10NF0wH/MfaAYNn0bk6xft6zBOmSczWudARNSbFBLSD5YhMHQ?=
 =?us-ascii?Q?CVvmVp7eqhHxrOTxMn7ibIR14KzgMGfA2yYW9VIV3G2iGoImwWQGczrIgppe?=
 =?us-ascii?Q?NaPz86fW2cT7uSPTGbCcun5ZMOhkc5nWn7hL7ND//4E+e8AOl589H2lLLRcz?=
 =?us-ascii?Q?+s9FzwwicX0xiFgN9zsxFRAHzo+IoQUNYmDasA9k?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff30e8ed-03a4-4ef4-597e-08dd82e7a258
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 04:22:32.8679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/b4ttfC5mmi1CnbePE6unB5MRDMbac/NtfkxwQcvk7scnScZ8SEOuaKVRMj//BGn0gqLITijWDpFKo1dk8aVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
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

On Wed, April 23, 2025 1:19 PM Cavitt, Jonathan wrote:
> Add support for userspace to request a list of observed faults from a spe=
cified
> VM.
>=20
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
>=20
> v3:
> - Remove unnecessary size parameter from helper function, as it
>   is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>   purposes.  Total memory usage is reported separately.
>=20
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
>=20
> v5:
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
>=20
> v6:
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>   (jcavitt)
>=20
> v7:
> - Revert back to using xe_vm_get_property_ioctl
> - Apply better copy_to_user logic (jcavitt)
>=20
> v8:
> - Fix and clean up error value handling in ioctl (jcavitt)
> - Reapply return mask for fill_faults (jcavitt)
>=20
> v9:
> - Future-proof size logic for zero-size properties (jcavitt)
> - Add access and fault types (Jianxun)
> - Remove address type (Jianxun)
>=20
> v10:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>   single helper function (jcavitt)
> - Assert valid size (jcavitt)
>=20
> v11:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
>=20
> v12:
> - Use size_t instead of int (Raag)
>=20
> v13:
> - Remove engine class and instance (Ivan)
>=20
> v14:
> - Map access type, fault type, and fault level to user macros (Matt
>   Brost, Ivan)
>=20
> v15:
> - Remove unnecessary size assertion (jcavitt)
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
=20
LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c |   3 +
>  drivers/gpu/drm/xe/xe_vm.c     | 107
> +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   2 +
>  3 files changed, 112 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 75e753e0a682..6816dc3a428c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -196,6 +196,9 @@ static const struct drm_ioctl_desc xe_ioctls[] =3D {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE,
> xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl,
> DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY,
> xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
> +
>  };
>=20
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned l=
ong arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 107e397b4987..c20ac51d8573 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3600,6 +3600,113 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
>  	return err;
>  }
>=20
> +/*
> + * Map access type, fault type, and fault level from current bspec
> + * specification to user spec abstraction.  The current mapping is
> + * 1-to-1, but if there is ever a hardware change, we will need
> + * this abstraction layer to maintain API stability through the
> + * hardware change.
> + */
> +static u8 xe_to_user_access_type(u8 access_type) {
> +	return access_type;
> +}
> +
> +static u8 xe_to_user_fault_type(u8 fault_type) {
> +	return fault_type;
> +}
> +
> +static u8 xe_to_user_fault_level(u8 fault_level) {
> +	return fault_level;
> +}
> +
> +static int fill_faults(struct xe_vm *vm,
> +		       struct drm_xe_vm_get_property *args) {
> +	struct xe_vm_fault __user *usr_ptr =3D u64_to_user_ptr(args->data);
> +	struct xe_vm_fault store =3D { 0 };
> +	struct xe_vm_fault_entry *entry;
> +	int ret =3D 0, i =3D 0, count, entry_size;
> +
> +	entry_size =3D sizeof(struct xe_vm_fault);
> +	count =3D args->size / entry_size;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry(entry, &vm->faults.list, list) {
> +		if (i++ =3D=3D count)
> +			break;
> +
> +		memset(&store, 0, entry_size);
> +
> +		store.address =3D entry->address;
> +		store.address_precision =3D entry->address_precision;
> +
> +		store.access_type =3D xe_to_user_access_type(entry-
> >access_type);
> +		store.fault_type =3D xe_to_user_fault_type(entry->fault_type);
> +		store.fault_level =3D xe_to_user_fault_level(entry->fault_level);
> +
> +		ret =3D copy_to_user(usr_ptr, &store, entry_size);
> +		if (ret)
> +			break;
> +
> +		usr_ptr++;
> +	}
> +	spin_unlock(&vm->faults.lock);
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +static int xe_vm_get_property_helper(struct xe_vm *vm,
> +				     struct drm_xe_vm_get_property *args) {
> +	size_t size;
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size =3D size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> +		spin_unlock(&vm->faults.lock);
> +
> +		if (args->size)
> +			/*
> +			 * Number of faults may increase between calls to
> +			 * xe_vm_get_property_ioctl, so just report the
> +			 * number of faults the user requests if it's less
> +			 * than or equal to the number of faults in the VM
> +			 * fault array.
> +			 */
> +			return args->size <=3D size ? fill_faults(vm, args) : -
> EINVAL;
> +
> +		args->size =3D size;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe =3D to_xe_device(drm);
> +	struct xe_file *xef =3D to_xe_file(file);
> +	struct drm_xe_vm_get_property *args =3D data;
> +	struct xe_vm *vm;
> +	int ret =3D 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	vm =3D xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	ret =3D xe_vm_get_property_helper(vm, args);
> +
> +	xe_vm_put(vm);
> +	return ret;
> +}
> +
>  /**
>   * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>   * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h inde=
x
> 9bd7e93824da..63ec22458e04 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -196,6 +196,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void
> *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
>=20
>  void xe_vm_close_and_put(struct xe_vm *vm);
>=20
> --
> 2.43.0

