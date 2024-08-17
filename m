Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098D6955462
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 02:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A3A10E846;
	Sat, 17 Aug 2024 00:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIx+9EYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562EC10E846
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 00:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723856009; x=1755392009;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fXk5baNRS+SxF+ZKwERO04TtWnFqdX49da6iwmb2qpc=;
 b=WIx+9EYqFL0DoSkHj1Oz21rgDC+bNZe+N1j7VAeXgFheahXiMurnhyK6
 mEqvRTHbvxG0usSGUdsMtjCvM5bP+VamFbaWAF0RU9+ibQ1CcGlcOKsB7
 JCfXZGM4mDQjhY/DE0rp/mYY+sA3ixZ4XKluvCep/UgQcSRQv/fcuFgHy
 EkdCgaTsT5q2raMUVpZMvfz3Jzm9ev0+CN3bR9lbFzpCPxKtuOz4sN12s
 MRM3wSt1/mztEKWT/yB50e/lHBrc94w/syHtu8Y83oRZLpmbNDLp8Oakx
 goE+jb28GDSLFWfsfF1o4ForlRtAzRJ+U2KKh+xz7tHf3tdk55ELaJGEK Q==;
X-CSE-ConnectionGUID: FMvbPrFtSFGvwGLlWMuSxg==
X-CSE-MsgGUID: BuxwJT5rRty0sl6yC1qojQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22311923"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="22311923"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 17:53:29 -0700
X-CSE-ConnectionGUID: LKiPVg0BTDS0I6rnkNPixA==
X-CSE-MsgGUID: PyBg9i+NTnOnrkZXDjFm+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="60103531"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 17:53:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 17:53:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 17:53:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 17:53:28 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 17:53:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5wrgSQBW+knlAF5aJ8KBvDmz3ejhGbjX7hsbdrxpyrbYa57UXMxX0Y4TybJv7od2UQFy2RqqbT95+VKDkAzu/5m8iYJaQ2P7DojcX7yaxyjV8Wb8e7BPfnfub322mZY3F3o3msfylDfZRTGwKri0Eauaks4cZVrN8JLPOs3t1r0iap5vhwUZU0PzwBoBfC5ywdh2t4VMfGcsCtXbRwSzhuvmL2dpqXXv0fcISZRHPJ9FjRUZfdWytOjWL0IFu6ClIlQvPaoCqR9c1dG90TkH9EKBLxI4H0ucaor8piWotFvL7JAu03TZjNWyqCw2sG85ruTdcRSHY8FKJ03dT2jSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9Byiz7eEXA14JSILfeh8UtkCbpFUWiJEYLk/9EJGPg=;
 b=Ly9eKXIbYEJVw3kdaUQx6OGsR5Cx2HJXKnbHW65xUUYzqiSt04BQpCkB2sqCWLvPXrf7IlsPw/fiBRxmWx4pJn2djjw24345gHJ/Qlp5/LDD2xbGQgir/Ouv65qN/3SnRN5yQk3Kd5kuAZQgdk2Ory5n+GRUywOEf8zlap/ofS6cv2V5tCg3o4ixXmlUvdfSXRK5NQsK05xaZiMUcXkG499AltU0TGE9wN6IHSFP3ZoZaTYs/81k0rhH1TeErK/b6gHZhU/dywK0MjMxFCEfMSfFj6+LUo3SH5yx4SmzRej2zT3wqcIMCjNcUkCrvgvt/msKOzEAqPImyWUl9vhx8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Sat, 17 Aug
 2024 00:53:18 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 00:53:18 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v3 1/5] udmabuf: cancel mmap page fault, direct map it
Thread-Topic: [PATCH v3 1/5] udmabuf: cancel mmap page fault, direct map it
Thread-Index: AQHa7WAKMLdz+piTj0mUvhvcMGEYvLIotGVg
Date: Sat, 17 Aug 2024 00:53:18 +0000
Message-ID: <IA0PR11MB718566320E42490E32C66C0CF8822@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813090518.3252469-1-link@vivo.com>
 <20240813090518.3252469-2-link@vivo.com>
In-Reply-To: <20240813090518.3252469-2-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH0PR11MB8141:EE_
x-ms-office365-filtering-correlation-id: f92433a9-badf-4ccf-383a-08dcbe56fbdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?U7kSP6bq62eI4e9Sb/yVdTBNYkEbV+XS5Oj63gJzFCs1dKEnTZjOYIGaOb?=
 =?iso-8859-1?Q?Sdv7csYY1kFX/qMA0pP0C3dIOrilw/kBd7ozCxyUpZCl8LedGhQmeAj9A2?=
 =?iso-8859-1?Q?FOoTvUPrPwaB4A1+XNtRXWUHHSeoKbp7EBOWvXCdYFmB2rbD5heP4Aez3j?=
 =?iso-8859-1?Q?G1XeVfZ5FKrxSQ/6i+sPD9x4Pih/Bm3swG1jGlb2iAxdIFot85NPb0Qcvv?=
 =?iso-8859-1?Q?sEBp0p7mMRYvFxehi+/du9cyYSd/lj/cg3AwTRGP+UHMozkvZSKmPvIvmV?=
 =?iso-8859-1?Q?WiYtgTJ+JdsrF+leoGtRSgbajDVfjIfbovaKoFDq/sAPBOFeCpupbq725f?=
 =?iso-8859-1?Q?sjzas1H5Ycn51CDvMv7C/VcbwYy1oglSR7OUAoALpVEti5j3pmdkM7jbqr?=
 =?iso-8859-1?Q?qVWJHCDm7U3L5bolaOG9unOc+y2PRWnkvsjxDCtnwjQacTUZqAoL1JRUIQ?=
 =?iso-8859-1?Q?PoW76SaHp2PrFCZMX1jGjjAsChgTpKXn97+rhvNnKM2qL3LQZd+pM7MTBW?=
 =?iso-8859-1?Q?mJyaEyqdSpCuNhItPlg7LBkxF/u/4zlkImoY0kQlTI+KTcX664ySqq6vYZ?=
 =?iso-8859-1?Q?0P6mPY4UmyvQEfCxRPJalV8YlMu05LjTSR0IkFdrxev61CoZ636T7X32j0?=
 =?iso-8859-1?Q?OiNJJjdoXGO0PzxIkfJVFfV5oG4kp55+O9D0qKj3Kfjx5ozlTMJo6L17ah?=
 =?iso-8859-1?Q?w7wx4fPEmfvi+3zXNGJ43arH6GuYJpsKtmD1/9GJGcIuECMfQKboo6z821?=
 =?iso-8859-1?Q?WBoMN/hG0kAkCDyXNS937GuqqNNHGPgyIN01d5n2YJIaluBSJ5ACAvCOvh?=
 =?iso-8859-1?Q?dPR6ExNKl/fjFqiqxXYjPFXjQq7ZpnNXWCyO1UvR6IafrTg16kd/cfAQuv?=
 =?iso-8859-1?Q?HQjpD2PoO5Wc/D19NbjngpXN0JgmMsN8J7FR3Swrl5Es2dt4xOHwdd6DJU?=
 =?iso-8859-1?Q?Zhm3qR0vV+CYKWjqb73CwCvhZf+KQOKAUpod4QYEqHhFlwUftR+Qtw9TlJ?=
 =?iso-8859-1?Q?on8lk/BVvkQ16lTvM013Kfv2o/YcDJmwpQxKJVqkW6Prky5JP4we3t5d//?=
 =?iso-8859-1?Q?7R43DvNs6Xbb8xC9u6XSBbLFwS9xcqruPHrH6wJPb0RItBgiIzAzkLELj2?=
 =?iso-8859-1?Q?+V89CNql2KCDFnDF1Fcs8RTeUCvVMOndPfi/f/U9oBM06IpBLQbBVtriBw?=
 =?iso-8859-1?Q?XlF6J/rwlcTgshno/m+AAYN10N0/clJXrRjFCb7iSepqouuQlXjdBb5Qkp?=
 =?iso-8859-1?Q?artufx28/qcEsJhrY7kQ46BF3dZLseTXaHU5XbrcWrsFAKtNJcB+nn0zMO?=
 =?iso-8859-1?Q?gxU5A/UAkMpQQ5eZ6VDLWO7O4XjKLgwYcoJpTz1KVl6jXQHWGqoVIboV7I?=
 =?iso-8859-1?Q?Sja2fLLUJKp3Nam7BWor4NrB3qjvDnKHzKmzH9W4y+1D6Ml3ZQeXTnWG9B?=
 =?iso-8859-1?Q?faACgm+paakWReiT8yOvMtrJinymE7Y41FZgNw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kwRKPybC1qeJroNiAmB7LP52ASeYB1vaP+c4J4jv/BzOKMNxMjyhc4WDkQ?=
 =?iso-8859-1?Q?KF5FOMBytotfPpexSF42DkdY0LPbWsqO+7R7fihqkCxb4xy4Fc4G37QWBR?=
 =?iso-8859-1?Q?lzVuL060JYKXhqFqf/0/P8GZ2ht2GAUVN4Jtq+tG5qTwhYuJmQvLj2ZPen?=
 =?iso-8859-1?Q?iUKlAwir1qiCLj3JoZWKnv59AB3JlYNZqVPMIn7+Db/jd8atj7PuLbkV0t?=
 =?iso-8859-1?Q?Ib5mDHvFUG0+s98UNuhiFkh5+GYroOZIXDd3Ptfcs1iHZgdvT5J9Hm0sCt?=
 =?iso-8859-1?Q?dh3kXMjcKJ5ZQu1QyVTh47gO0rSHQ34uGqmlqSRVKxSVwP4NrjKvujsSQg?=
 =?iso-8859-1?Q?4P+D+n9VGqr9tPrh+k+UPCg5IWAnGqH3FWw+JOnuithTiyRTBCj5iH5YZ4?=
 =?iso-8859-1?Q?4TDU82lXv9AXqm0v4ULF1vsyuvQslLItUzcp4GwwUtNVWg4ARg5uEMkscl?=
 =?iso-8859-1?Q?id7WmXLpAAzeWalohOXwHhbyyMGUQpy8sok8H+J/eSCtHSlLBS5jEXb4cQ?=
 =?iso-8859-1?Q?r2E9UD/O8F/++Gr4f1qDXXAZOP5Ss3k1ucnj9BLBk8TF5fmZlRnS1ARRe0?=
 =?iso-8859-1?Q?sskBdxZf2C6X2SYnL83ouveegA9Xqx5vewUbuid6Pfa4kwDlQlKiHrMtbK?=
 =?iso-8859-1?Q?kTfXRxV7OVTF4Ov9Ptquqnetrgm5toMSK6uYEjdq1JjiAbUiwRWsLVRp/0?=
 =?iso-8859-1?Q?wHlS0X3/UX2Untz5DjXQYg8hOq3DgIsfK09smiPY0Bdo3KzHx6Da4xsHeF?=
 =?iso-8859-1?Q?1K6l9TSRy9fQersW9aBOZYaMxTEqlr7z+ANRwGDV679183DzaOUpME3MZm?=
 =?iso-8859-1?Q?PNfoDGE2fGH3axtpZg1woXH1NPhyebAgH6BNvtctzBWAmQQAdol6ED8+fN?=
 =?iso-8859-1?Q?zP7nlj9zxk/t6woKQ7QgivtpEtBQsy0BAVBhecFkcnrhkhq4mlDU1TUx/J?=
 =?iso-8859-1?Q?ezJ1nHZi1KwC8hcAedNe2g9+sX7Y3fX44TmCFv0kyPNJEQv06cdfW0MmEX?=
 =?iso-8859-1?Q?wi2C64zVqLcX9WnwB8JxotFt00xr2IgeCESZaEIPzvAKCuCwiVVLrxOo9w?=
 =?iso-8859-1?Q?9tS1wVOaVnG2BblV//5CNZu1wovACwIxzWVWkBJju1PFp+C87UuQ5UivFe?=
 =?iso-8859-1?Q?8TV6LhzkDbuH1qH/xNnZD0OmpZfeXQlJELcNE6foKEQrMhjufiaH98RuEC?=
 =?iso-8859-1?Q?tDVMMGo5CNwwDWO/EicizdkjvC85xr0YjicxLxiZ12QCmTeBlSQQn6puAp?=
 =?iso-8859-1?Q?rl0zTED/4nL8tt53hqwJaWWuQRmjLXAGoe+RRASmY1NBe91FzhMU26/Phm?=
 =?iso-8859-1?Q?DuT6t1xSq7lUwgl5TxXQ3AOc/JlQxR/yMeB7TlQcC9ZTRHrvxYE5JRfTB5?=
 =?iso-8859-1?Q?mwEB0m6Ggl26JibR7NRBeH4wLQVYkFtCMWVBzAHHaYW9yLv/OV4L3XHDfj?=
 =?iso-8859-1?Q?5JIHlvZA2s1oglgVu3Ik0WBw7Svy77OBesixoKIQR7SN8nJM6fWwM/DwHr?=
 =?iso-8859-1?Q?DUbhJ3sokhCRsSlFRr8ZvpLlpM2tyrD8Qp+G7HBC6IdSNFOCNol/ZU4YYa?=
 =?iso-8859-1?Q?Wlk6/jodq7QFM2qn/mK4RhUtFxAGPG3gXsmnAdLX5qvBG52TbVXNqrdpel?=
 =?iso-8859-1?Q?2WqdunI2wmu+heJRL05g6cewkvKpDsGSHm?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f92433a9-badf-4ccf-383a-08dcbe56fbdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 00:53:18.1576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7JvewUGYPQqtAXPIFq0x1aTl3jLN1qjwfSG93yb+5gjr++1SDShGxonCWf5JV03itAuuLYQYhnf+VSw0JeVWBQZKbOHHgQKxr9aSIFoky7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
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

Hi Huan,

>=20
> The current udmabuf mmap uses a page fault to populate the vma.
>=20
> However, the current udmabuf has already obtained and pinned the folio
> upon completion of the creation.This means that the physical memory has
> already been acquired, rather than being accessed dynamically. The
> current page fault method only saves some page table memory.
>=20
> As a result, the page fault has lost its purpose as a demanding
> page. Due to the fact that page fault requires trapping into kernel mode
> and filling in when accessing the corresponding virtual address in mmap,
> when creating a large size udmabuf, this represents a considerable
> overhead.
>=20
> The current patch removes the page fault method of mmap and
> instead fills pfn directly when mmap is triggered.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/dma-buf/udmabuf.c | 37 +++++++++++++++----------------------
>  1 file changed, 15 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 047c3cd2ceff..d39f9e1cd532 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -38,36 +38,29 @@ struct udmabuf_folio {
>  	struct list_head list;
>  };
>=20
> -static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> -{
> -	struct vm_area_struct *vma =3D vmf->vma;
> -	struct udmabuf *ubuf =3D vma->vm_private_data;
> -	pgoff_t pgoff =3D vmf->pgoff;
> -	unsigned long pfn;
> -
> -	if (pgoff >=3D ubuf->pagecount)
> -		return VM_FAULT_SIGBUS;
> -
> -	pfn =3D folio_pfn(ubuf->folios[pgoff]);
> -	pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> -
> -	return vmf_insert_pfn(vma, vmf->address, pfn);
> -}
> -
> -static const struct vm_operations_struct udmabuf_vm_ops =3D {
> -	.fault =3D udmabuf_vm_fault,
> -};
So, what I was suggesting earlier is that it would be OK to populate the wh=
ole
vma after first fault because userspace can simply call mmap() but choose n=
ot
to use the returned pointer for various reasons. This is what Qemu's virtio=
-gpu
module does and in this case we'd be unnecessarily populating the vma.

Therefore, my request to you is to try to benchmark your userspace to see i=
f
there is a significant difference in performance when you populate the vma
during mmap() vs doing it after first fault (which means moving the for loo=
p
to udmabuf_vm_fault()).

> -
>  static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct
> *vma)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> +	unsigned long addr;
> +	unsigned long end;
> +	unsigned long pgoff;
> +	int ret;
Looks like ret's type needs to be vm_fault_t.

>=20
>  	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) =3D=3D 0)
>  		return -EINVAL;
>=20
> -	vma->vm_ops =3D &udmabuf_vm_ops;
> -	vma->vm_private_data =3D ubuf;
>  	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND |
> VM_DONTDUMP);
> +
> +	for (pgoff =3D vma->vm_pgoff, end =3D vma->vm_end, addr =3D vma-
I think initializing these variables above at the declaration time looks be=
tter
than initializing them in the for loop, IMO.

Thanks,
Vivek

> >vm_start;
> +	     addr < end; pgoff++, addr +=3D PAGE_SIZE) {
> +		unsigned long pfn =3D folio_pfn(ubuf->folios[pgoff]);
> +
> +		pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> +		ret =3D vmf_insert_pfn(vma, addr, pfn);
> +		if (ret & VM_FAULT_ERROR)
> +			return vm_fault_to_errno(ret, 0);
> +	}
> +
>  	return 0;
>  }
>=20
> --
> 2.45.2

