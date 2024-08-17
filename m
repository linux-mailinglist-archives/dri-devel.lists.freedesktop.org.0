Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F3695547A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 03:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A93B10E042;
	Sat, 17 Aug 2024 01:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKl49jrT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B65910E042
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 01:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723856733; x=1755392733;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yv+WmNudnM8988vt+e43w0bN27RCjOwmAkR6WXUuhjA=;
 b=QKl49jrTMGEPxIzosnwd2jcJhUteEfN1dt16YJt3LxR1a8nGWkfNo6+Z
 Zm/TsCFDVIyJMdmdxwuzKrFn2CwYKYVKSqFF3fMEDT1gTp94TffVA1W9S
 oxIHTzW85CXdczLV4hvq8rfdRqD5AFaP3hWG+Aen5rRmXrMnIh5GtClIW
 9Manl0WX5r4LOsg606BEkFHqyStsDzbvIgvMPwi/M6+jTvw/0TdPsdiVK
 OHGZS9uwnLVjYsTMcALNtNC0FVM8pn4ccJ1wUiEPWcaL05Z4Fi/eMcVi2
 f177ZLHx0SlsavRZcQ+aVsqBwOQnKwv/cIQNBT6kfSVQckDvx7i/DrK/c g==;
X-CSE-ConnectionGUID: uFDu6PIISwyy5sY1vHiFSA==
X-CSE-MsgGUID: 0WdRJhjGRva50Evh2A1D/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22043971"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="22043971"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 18:05:33 -0700
X-CSE-ConnectionGUID: pOgwm2ZARCaY1283hixphw==
X-CSE-MsgGUID: AuXiRz7bRBiWSsvKIX7SgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="60606537"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 18:05:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 18:05:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 18:05:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 18:05:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 18:05:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+qn4Hq8LyR1fda3f2EMcjN933eQOHkmQIZSjTNwkhxlD+Hve/hoIoFy1BQASXYUjvM9mOsKG9xgAKS9q46oLzKkbNdI2BTbGjwj8SKF+KwMNLGmxApS6z9NZuOFk4D+zhCEM2caG/Ic/xWquTnxQ3lNjyyO9ty8z+tiLzoTc6Cs3a9eMGByuHQcLPMus9sCYN/oCVRiE+ybhAvaTwZFzjNguoeusJXST9AiVMOe6p1XmzoOzPAZ/k2X+1vaIBm6Y4d3BD6Yc/7K0zxwtzd7mZQssL08NHXOgqMIInZaHA7EGn8MCEdpuNdjAw5tsjUIop1wnI5MpsZpFHC8DG5rrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHCwqlaV/IKl1svffcLQ4gka1hKB/63O0BEkgAS669Q=;
 b=gcI4gDDlHyr7D8oSuXLe59oQruH+oQHRSARBkIgGKnh41s8pZhES5sE8Fd1oJTvixSi/E1xzoT8tl9YJU5cYEVG7NGvSAgSiSw9/p7Pxc0SP7xkcu40jSAioZwzP1fypHpaaJiJCrh1YLNHDIrSuecInpFRZCz9K/C66HIyc+jQrqTGDjzzw2w7Lj0tI5sqpUgdPkCTxSIsQLfb/4vx7NVjYvGzl4SRsjIMm2mIaWnZtgTlzB5Dcgp/xooYCDEPuS2BmfoivbdWAhVh484BOXKgwsUS43ss89HlfxaAouJqT8WsVXC9CbKJOj+Ga0hACQ0lOHyIbYeXZ7k8uqO+ebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA0PR11MB7403.namprd11.prod.outlook.com (2603:10b6:208:431::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Sat, 17 Aug
 2024 01:05:29 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 01:05:29 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v3 5/5] udmabuf: remove udmabuf_folio
Thread-Topic: [PATCH v3 5/5] udmabuf: remove udmabuf_folio
Thread-Index: AQHa7WAVlW5V0jmvPUOO8FKdSnTWCbIotMqg
Date: Sat, 17 Aug 2024 01:05:29 +0000
Message-ID: <IA0PR11MB71858D28621C745C1663B593F8822@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813090518.3252469-1-link@vivo.com>
 <20240813090518.3252469-6-link@vivo.com>
In-Reply-To: <20240813090518.3252469-6-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA0PR11MB7403:EE_
x-ms-office365-filtering-correlation-id: ef379459-dbdb-45ea-dfbf-08dcbe58afd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?zaZXb7NnQ+yiXlXAuT+rN5BwoSEmoYN2KlwhMKmx3ANRy8UuSt/J9iPhlh?=
 =?iso-8859-1?Q?QhM9YVwlujoe3hfwQvtJi6Nfp0XoN2tL0WZkrWClDbe3AaiiDj17yfQsbe?=
 =?iso-8859-1?Q?EvBM/srp8c8rQySwXPfvW4VpwUY1Yfj9UFlszLdzZnSDh3XHq+YXImvPjX?=
 =?iso-8859-1?Q?nD5lp0kvirJVEyO8/s3iOsMUrTTSWNqkuuR8oCOoe352LwwGjNLqgxmBXN?=
 =?iso-8859-1?Q?tOKY2xwsF180PYN+90cFGfqrGPDdh28UblLW2doVk8bgwCF5faGQwHC3Oo?=
 =?iso-8859-1?Q?wXxHnTaY8hCDkPtHa3dwdNjZlyJ29yCXmOvSHFKwmIQSuqotel7EJDa5/Y?=
 =?iso-8859-1?Q?Z02Ugzqf2tkUeT74FUe0FhwWa62dMGoygetNTRuXsbn3bPjg99OHoS1ZXf?=
 =?iso-8859-1?Q?o+GppvE4z5RX9enfLLS1mw/5bqpZ2vtCggJEWuopRiZT+IGx7QalqduYnD?=
 =?iso-8859-1?Q?vS0j+LWOPtevEmkMPBH/MKqq50FMlUy8c9hV0OgPCJdigfWktfLUuzJpbX?=
 =?iso-8859-1?Q?n4g5P2AQizR1AVQNtbhpcspgnuVNFNviqG5bte7VF6S5PS3q31CrtiIH7e?=
 =?iso-8859-1?Q?OjmpGREeZF5Sq6SvYvo0CKVReP2IDwZPz0xxY2DbqjcfEZZXn63m6Yhdgc?=
 =?iso-8859-1?Q?FOrCxYBJY1MrOOxxSMksnTyuAA7LV9bmMnE0WJ9GLMsNKx37dplEpN2tZJ?=
 =?iso-8859-1?Q?MKGfhZCZ9hA3WU/bWMP/Y8OCZeD2sV+NDQCsxFKTTetWDxBE+tao/WnYiy?=
 =?iso-8859-1?Q?GvC+aXPk42iJR6KvRVIGQHsaafmnVYWPFTB2hVwLR2pin9BIgPk4el2YW4?=
 =?iso-8859-1?Q?/TDtJauqgHW4awYAHgCJu2XFNVEo3U3AYJ6Z6qiOLx8EcajuKMKfKOEFTT?=
 =?iso-8859-1?Q?tgkslJBmkDtlPvbrkdhDzOabfOD2bJuHRdYxkIIp5xsccHGUkifjDHCozm?=
 =?iso-8859-1?Q?mxKI30ynMS5zlLgT6U/M7DJY8EMTYGtNw255VdrEEwvsqClNrLnrh3EUgU?=
 =?iso-8859-1?Q?hm2l+FzD3cBgaVzDzu+6kMleYIYWuBguTMT+i+9uXCvKa4aV/Qo+uDcSqY?=
 =?iso-8859-1?Q?itX47Bkw6Yj2/3r8kiwdXLrH5+BHSwCwqfKrccKtHPHhYV6ciX3waKzr5B?=
 =?iso-8859-1?Q?z071BWVt8Qh26SH4O7p30rq7Y3JNrq5ceTfsH+SbvrGbqeVKDbDtkSrjmV?=
 =?iso-8859-1?Q?SFr4lWobzCPldM/CKYqXLr+AXNKuLaEwb98MDJNei7KcHtxM12o1RKdPU0?=
 =?iso-8859-1?Q?lcwTfCXOE4xN8Z7V3lr6TcMxFzuasAolGV0tw1c/h19JFc0TnyOlHArD43?=
 =?iso-8859-1?Q?eb6dDohi7mDywOKhQWzhu6r8gwHGOxJxSbovvD74QGYCj0k5YFjczugabw?=
 =?iso-8859-1?Q?B3SPvMTMvy8+KiEnyk3EnAUwx6UTRKTTzNTAybCQHP74Dwsqrd3FGSsIj3?=
 =?iso-8859-1?Q?XjvsquMqUjVqmVg6MFZyxMYDjmohk9Ay+nxZTA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6XcTbVbgfGrIIJFe2IpG7FCEQUL9ws0QDRYUOlUHHnyd3bCF/haaGfI33f?=
 =?iso-8859-1?Q?dcHlVt9zO0+7IoUyRdhuU2Ip2/dMm2xpigNNJgWKPeI+XeROqivb7tC5vV?=
 =?iso-8859-1?Q?99wdsVZrWB4ugHR9ss579GRO29edMBC6fPAu/75wiqDJPy9iAR77PdR01U?=
 =?iso-8859-1?Q?mWQXLflV+yWycPzka9Vt015GivT+Nb97LYwn+mn2PgQfhC6+1K+NizFosQ?=
 =?iso-8859-1?Q?yYpqFydalYgE9hkJKvkqmipw2de/nnjnQ0u1Nld8gAZ5C/4cxxpxNEkRYH?=
 =?iso-8859-1?Q?XMefWRPXKNwHjeQdw15gLvLVYUOdo42ILvFUAPyHwJCAQx3X0rqx1V8ojd?=
 =?iso-8859-1?Q?YfZLGvaJzCmn1tVtRrjKPvBsvyBYki5/QUqkPAVQ0ltcMQXQUAxJVKcyi1?=
 =?iso-8859-1?Q?UZvul4XSEy8v/7L6UEZi7J39+ytc1JMb6yg3hxV7x0yExVOtsaF32SahjK?=
 =?iso-8859-1?Q?IieyEtFrFBGTDLb9Hd7akOg6LEcfc6c3zZLfkEuu7a9QeQbvnPYUvR8dOZ?=
 =?iso-8859-1?Q?7tiZOvm6s942mvMIl7GPi5GgitlXGJunvkZItDVbv+L8Ch+PZrujV1RxfH?=
 =?iso-8859-1?Q?0J+LI4FTP99HEhUmhINqpr6IaZryDKXGKd610m1uf0tX+53Qp3VtWAQS/v?=
 =?iso-8859-1?Q?0lBkSInMOVTMRYsN6l4SRCX1cSHRPC6zDwfltww7c7lFs2lrHJcxnTincF?=
 =?iso-8859-1?Q?09h2rVtDwbHExMvq6WOgI4zK8nkKCtRORGJMplsoZUKtHwO7QFrnDV9Bu9?=
 =?iso-8859-1?Q?f9WfM3PS+8MK+gImYlnnv6dfgcDUCGBB15wdt74zyF2gXjhbNIgTM9aygq?=
 =?iso-8859-1?Q?aUpY8EA9eXofKttnQqT/unfd1JWUOYnDQHZmUEhp9AetcChxYlZ/+SDXct?=
 =?iso-8859-1?Q?fOpV8SWW2aP1Iqlsb/qcFQcqfHpRqbv6iD6ypv+h8LpeTkGcSQy6pkWmcB?=
 =?iso-8859-1?Q?fntBUz/RkiaihZTLyJX+Mo6KKXD28ymvNwbGC4Y1zyVNqESqzU1AbYO8H8?=
 =?iso-8859-1?Q?EQRAKTh4ghPiwNnYAU2zcMuT7Ygd+5isWW8t+a3zoxSyaWt6OAlwZtxdKh?=
 =?iso-8859-1?Q?ty0mlGfEkfl2IFymn8bWe7AGBdp6lbCi8+uOGNk3WovzewJVO1Y8v6XJir?=
 =?iso-8859-1?Q?NcQzHK8l2xB/nehHRkXKPIJzDMgI9ns+Vjs66klj9z23KKGZeAq0lG4GIu?=
 =?iso-8859-1?Q?renyOr7kchzns94460m3EGvfBkC5ihp+IZ5bRgukXAdNtbfhAF5pX4ZTH6?=
 =?iso-8859-1?Q?KXoLf1R9gnWwenySgBZ1wEZOH0+MjgozlV25Il4cMs4N4RA8WAhgYUACf1?=
 =?iso-8859-1?Q?ce2ex4drVlh78yD4PzzaxHUF877fQgEutpPFEwcx1SNy1f5NMOQJRw6eHS?=
 =?iso-8859-1?Q?LYzpKCAdC3i9fVD5J/H56fASJDAGLTWcfYzxbD9ERMpkPx6+k4uXSNXt69?=
 =?iso-8859-1?Q?t5adkXFNrnWsitMZ5r1eypk/vEVNknUVuIJP++x0OCN9dAzL6Riv2DpmtB?=
 =?iso-8859-1?Q?75o95uvLlmXMDmrpNl/fUl/KpDlSLBj0GTxCU5+O9gZs1XoZXANBe9Z16a?=
 =?iso-8859-1?Q?Rw0mJTWhNQUm78OXsjMap6BAARp1/2mijh8LuxXDebk2hRi1thBgyGpZIc?=
 =?iso-8859-1?Q?GttpNwClKFOsusK1E5wckAsndQLSiOxp00?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef379459-dbdb-45ea-dfbf-08dcbe58afd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 01:05:29.5507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T5suLLjkNgCRiOXCgxqTetI7RY4UFvRHdIBXY/0sjJIvu7bewldMWv8jyVeCv3gt4HXQdNzJvSoncnNvGZe8V81241rDtWFNnusnUj1l178=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7403
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
> Currently, udmabuf handles folio by creating an unpin list to record
> each folio obtained from the list and unpinning them when released. To
> maintain this approach, many data structures have been established.
>=20
> However, maintaining this type of data structure requires a significant
> amount of memory and traversing the list is a substantial overhead,
> which is not friendly to the CPU cache.
>=20
> Considering that during creation, we arranged the folio array in the
> order of pin and set the offset according to pgcnt.
>=20
> We actually don't need to use unpin_list to unpin during release.
> Instead, we can iterate through the folios array during release and
> unpin any folio that is different from the ones previously accessed.
No, that won't work because iterating the folios array doesn't tell you
anything about how many times a folio was pinned (via memfd_pin_folios()),
as a folio could be part of multiple ranges.

For example, if userspace provides ranges 64..128 and 256..512 (assuming
these are 4k sized subpage offsets and we have a 2MB hugetlb folio), then
the same folio would cover both ranges and there would be 2 entries for
this folio in unpin_list. But, with your logic, we'd be erroneously unpinni=
ng
it only once.

Not sure if there are any great solutions available to address this situati=
on,
but one option I can think of is to convert unpin_list to unpin array (dyna=
mically
resized with krealloc?) and track its length separately. Or, as suggested e=
arlier,
another way is to not use unpin_list for memfds backed by shmem, but I susp=
ect
this may not work if THP is enabled.

Thanks,
Vivek

>=20
> By this, not only saves the overhead of the udmabuf_folio data structure
> but also makes array access more cache-friendly.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 68 +++++++++++++++++----------------------
>  1 file changed, 30 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 8f9cb0e2e71a..1e7f46c33d1a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -26,16 +26,19 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a
> dmabuf, in megabytes. Default is
>=20
>  struct udmabuf {
>  	pgoff_t pagecount;
> -	struct folio **folios;
>  	struct sg_table *sg;
>  	struct miscdevice *device;
> +	struct folio **folios;
> +	/**
> +	 * offset in folios array's folio, byte unit.
> +	 * udmabuf can use either shmem or hugetlb pages, an array based
> on
> +	 * pages may not be suitable.
> +	 * Especially when HVO is enabled, the tail page will be released,
> +	 * so our reference to the page will no longer be correct.
> +	 * Hence, it's necessary to record the offset in order to reference
> +	 * the correct PFN within the folio.
> +	 */
>  	pgoff_t *offsets;
> -	struct list_head unpin_list;
> -};
> -
> -struct udmabuf_folio {
> -	struct folio *folio;
> -	struct list_head list;
>  };
>=20
>  static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct
> *vma)
> @@ -160,32 +163,28 @@ static void unmap_udmabuf(struct
> dma_buf_attachment *at,
>  	return put_sg_table(at->dev, sg, direction);
>  }
>=20
> -static void unpin_all_folios(struct list_head *unpin_list)
> +/**
> + * unpin_all_folios:		unpin each folio we pinned in create
> + * The udmabuf set all folio in folios and pinned it, but for large foli=
o,
> + * We may have only used a small portion of the physical in the folio.
> + * we will repeatedly, sequentially set the folio into the array to ensu=
re
> + * that the offset can index the correct folio at the corresponding inde=
x.
> + * Hence, we only need to unpin the first iterred folio.
> + */
> +static void unpin_all_folios(struct udmabuf *ubuf)
>  {
> -	struct udmabuf_folio *ubuf_folio;
> -
> -	while (!list_empty(unpin_list)) {
> -		ubuf_folio =3D list_first_entry(unpin_list,
> -					      struct udmabuf_folio, list);
> -		unpin_folio(ubuf_folio->folio);
> -
> -		list_del(&ubuf_folio->list);
> -		kfree(ubuf_folio);
> -	}
> -}
> +	pgoff_t pg;
> +	struct folio *last =3D NULL;
>=20
> -static int add_to_unpin_list(struct list_head *unpin_list,
> -			     struct folio *folio)
> -{
> -	struct udmabuf_folio *ubuf_folio;
> +	for (pg =3D 0; pg < ubuf->pagecount; pg++) {
> +		struct folio *tmp =3D ubuf->folios[pg];
>=20
> -	ubuf_folio =3D kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
> -	if (!ubuf_folio)
> -		return -ENOMEM;
> +		if (tmp =3D=3D last)
> +			continue;
>=20
> -	ubuf_folio->folio =3D folio;
> -	list_add_tail(&ubuf_folio->list, unpin_list);
> -	return 0;
> +		last =3D tmp;
> +		unpin_folio(tmp);
> +	}
>  }
>=20
>  static void release_udmabuf(struct dma_buf *buf)
> @@ -196,7 +195,7 @@ static void release_udmabuf(struct dma_buf *buf)
>  	if (ubuf->sg)
>  		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>=20
> -	unpin_all_folios(&ubuf->unpin_list);
> +	unpin_all_folios(ubuf);
>  	kvfree(ubuf->offsets);
>  	kvfree(ubuf->folios);
>  	kfree(ubuf);
> @@ -308,7 +307,6 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	if (!ubuf)
>  		return -ENOMEM;
>=20
> -	INIT_LIST_HEAD(&ubuf->unpin_list);
>  	pglimit =3D (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>  	for (i =3D 0; i < head->count; i++) {
>  		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
> @@ -366,12 +364,6 @@ static long udmabuf_create(struct miscdevice
> *device,
>  			u32 k;
>  			long fsize =3D folio_size(folios[j]);
>=20
> -			ret =3D add_to_unpin_list(&ubuf->unpin_list, folios[j]);
> -			if (ret < 0) {
> -				kfree(folios);
> -				goto err;
> -			}
> -
>  			for (k =3D pgoff; k < fsize; k +=3D PAGE_SIZE) {
>  				ubuf->folios[pgbuf] =3D folios[j];
>  				ubuf->offsets[pgbuf] =3D k;
> @@ -399,7 +391,7 @@ static long udmabuf_create(struct miscdevice
> *device,
>  err:
>  	if (memfd)
>  		fput(memfd);
> -	unpin_all_folios(&ubuf->unpin_list);
> +	unpin_all_folios(ubuf);
>  	kvfree(ubuf->offsets);
>  	kvfree(ubuf->folios);
>  	kfree(ubuf);
> --
> 2.45.2

