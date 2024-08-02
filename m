Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862D8946243
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 19:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034E810E1CF;
	Fri,  2 Aug 2024 17:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SE+xsowv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A13410E1BC;
 Fri,  2 Aug 2024 17:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722618550; x=1754154550;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cmv9Is6tEGoBwG3G2FXQtGHD4sqmS0ivtQ2+5tq61MU=;
 b=SE+xsowvEi1OJ341NcTKTh0AbQKe6vZqezj58V8Zh7vKodolR9GFdBvB
 Q70tGmfqVytfARc7CsYPPRQFKTWkPeF9bN9TxB53I5q3TCasJg52xUxpA
 ep1PpS24Sj1QfJuFpx/cWX9CSGm0YMEYN3KkP6Fbh26t1Lue6UyWCpsFh
 tEUowTkKLJPHJrqBeDCWxrLTjcwJ5NgFXTnudGrpsWZWUCT7tT/iUnRLo
 ehMW15yH5tEGnTIICKFpGIpY5QgxCAh7GrRGbJd13Dg8L8aB1L7G2n4p6
 CLMgr+U3UfGcZ2ARiQ8Y3SiGWN5nX0Az9e0mOkhwMFMp1jdEK/+NaFzKc A==;
X-CSE-ConnectionGUID: P3mo/IFCTn+exAlFY8ib0A==
X-CSE-MsgGUID: CiVMDEM1Rca8NVCzf9v+tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="24436449"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="24436449"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 10:09:10 -0700
X-CSE-ConnectionGUID: HkswOllyRv6x+emjCMrBEw==
X-CSE-MsgGUID: ad7ZbFL7Tw6OONIp4AjzCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="55386849"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 10:09:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 10:09:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 10:09:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 10:09:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2HcGO4tT2L96wsfQINPsR2gn5q2B3DOT+RWt+24lKNwgpf17xKwAYvNtnpulkNS8KQ6ke56+Opy1OfODSkJcN+0n0ZpNoxAGdDGw9dJKUnzQ82uhoc534YJG9bEUtFZkyiSvSdbZd5iee8xWZ8m03AMvCt+H4Ur3+XB//UBZSyEpX2oR+R3IrrhnPCNwjcBwj76WTR40bPQMkV25WwBhz8GE775kvEHT6u8px00q5YEPeRH2KoXu6Tq7grHK/4gKmTvx8EnJxMM6+IZAoKM159PwbvR6TJ2VH+fDgrFvxAUmWSPg3JXHC7W696UXXk68O5ZUq43fMKxncsVxrn5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhvU+2r/M5p0+ewCFy+oS47LewUHf3lsX7MhcnMVXLw=;
 b=PkOb16f7worvO7ythWbST5G3yKMJgNZalsWwSW+9s5kK7TipBdkcjubo9Ak1uS6/ADLvLcJdQttF33eu9U834rpLLSX1YycF/axDtyKY1YA0LIGyF63wY5ZDi/EyXUeAEoBMMY7sct+8Tysx8wbu2d+QCpjUaGYetsogDTJweNc2W0jcMOESXtDq4dcVx4cNBEFUb8eoobZTFOKuVL5Pe9l0s0TTPR/ucob8knNKoaxGvtz9EDu0sGI12SDW9ydtJyeutd/6MUf0Gao9r+t+vels+KLnCoGW9l9HZEqvd8V8uTRlOzGJtKDCSBPklt6m4PfX4J3C+8t1a6lsJ3xzpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB5187.namprd11.prod.outlook.com (2603:10b6:303:94::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 17:08:59 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 17:08:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Jann Horn <jannh@chromium.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Jann Horn
 <jannh@google.com>, Chris Wilson <chris.p.wilson@linux.intel.com>, "Niemiec,
 Krzysztof" <krzysztof.niemiec@intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
 "Auld, Matthew" <matthew.auld@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/i915/gem: Adjust vma offset for framebuffer mmap
 offset
Thread-Topic: [PATCH 1/2] drm/i915/gem: Adjust vma offset for framebuffer mmap
 offset
Thread-Index: AQHa5LeMeq23UnzCSkS5kFLsr2Dw57IUM5zg
Date: Fri, 2 Aug 2024 17:08:58 +0000
Message-ID: <CH0PR11MB5444C54BD51232A4E83FD4AFE5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240802083850.103694-1-andi.shyti@linux.intel.com>
 <20240802083850.103694-2-andi.shyti@linux.intel.com>
In-Reply-To: <20240802083850.103694-2-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB5187:EE_
x-ms-office365-filtering-correlation-id: b3875119-6c18-45e7-2723-08dcb315cc95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3AYOU1nX0W5aDs7JA9tMZqPLOMIUyyBFrTFm7fB6kRGOLxdgDTkhnHtFPIwW?=
 =?us-ascii?Q?77h4siUExKp1e9XzRSfEAZ3mwNVYmSmRmGSC3V19/kntEixotsHDiyRdAJMk?=
 =?us-ascii?Q?ElrSbCSUrHnd6R5rR4Z2RzHw0H55BG1W6FSad5D5WTlwLQZ9CsIKIgvV8MOv?=
 =?us-ascii?Q?yYek3/ka/QbIUiLG9/DpVYRRtrgzSE/hs7r9xTT+CNCykVctDKRPClg2/6C/?=
 =?us-ascii?Q?LXa/bluWzU7CzAuluQZHT590pRpPRr1e9p+p/cOKr6rmtXQjZmxANRczjbuU?=
 =?us-ascii?Q?bTp/41EAgFVv/khY87OfuaszGSTbnBjNR9M78zinGQfV+Vpq9BiUhyFbEl5A?=
 =?us-ascii?Q?PDiIyvLdtEm6eZtcChtYNH/xGU34mFhpp2Zzi+6RT8tqrQqN43qxlbH/Yn7G?=
 =?us-ascii?Q?MhzX/OePv6jGFaZtY92MBFLlBvKCnr7HFyL9kq0twU0ysbmMDPPgcVGhjXCy?=
 =?us-ascii?Q?SAsfoyUVmGYSqxJGNpMSoSd3cTllC6jLpxDjuWrgevFH+NSZb0Fj8ENftGmX?=
 =?us-ascii?Q?AEvFIOyrt6jBt/1H2Y5BZU66Lrc5iz2CYjB2lvJJV6HHxRSOrTYP8+PuyVCO?=
 =?us-ascii?Q?aedQFkQVk3t0kQ/kLj5SaLuAesPAjs+tYEI/VQng8oYUQ/bpCDCyLTg+6oVc?=
 =?us-ascii?Q?iruPguUwoFtV44/5wEHgvHkGUMJu2fqpXs6dPS09gqY9yFhGCxoN0Sw9GYK/?=
 =?us-ascii?Q?3XUyz0PZIGapSMro2Lfm/kr4R6Vxgr0gz1vUxLofh2IAthuCP+ojw+j0lFfp?=
 =?us-ascii?Q?RAehjNPV2fvxqZtwWeeC6KGad61BDVho29+YfLQ65RpXqvyxOqFyrxFYhHjk?=
 =?us-ascii?Q?snDoQONYnup17ADnqpeWT4mbzCxUvUDfDIJ2eJ0BxJgrr9UcKBp3tFfVFt2P?=
 =?us-ascii?Q?l+ONMZPMeWKpZfyWuHuM3R6cXgn4teRJrA9FVUgWOU0CcS4eRWrRNWvr42pB?=
 =?us-ascii?Q?Dai2J+2YEwib112V5A4sMMW9l2DmmTwHpoLZNs/jDAxwyDDgx/trFJAu/vFO?=
 =?us-ascii?Q?6H4zKe1iFEE8sBSE+DjkelBAXp2OwwY3aA4cHe2Hj699tKFRGd8RBGIzVqfj?=
 =?us-ascii?Q?SQIcSvIcGNfMCizV4CgoUp9yXFKtCkNEHMqOyVDWHsiCL8iy6vFcPGkyavjG?=
 =?us-ascii?Q?H4BYYoCHZvZYhNVBWwW9gzzYOG9cKLT9+JaGP9tiybfHcJ0G0VPhWEqfg7fN?=
 =?us-ascii?Q?bdi71Q4SFp8CaGX7E+1Ms7gj5hFoTDXZtUch0zsMRwOoQbaa6YPHlqF48TRJ?=
 =?us-ascii?Q?tmRK8xTQqjsMcp1ak33y1Kj5ey6yXQiYX3AX9NRmqOJkKrqIz0mGAwWWDUFZ?=
 =?us-ascii?Q?qQhTsCEGYHj4FBOk3UfTiIuNWygV7gK07J6ASSQA2jncsNt89yw3Z294E6O+?=
 =?us-ascii?Q?KOdyaSTT3KG0pz7KDS6rMqqJOiIdQYS0JLc8ZBMT/6C9az0LQA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ME4WD892GIhqKZcvldmDesvsXsrPJdtPWT5ytrFBSoRYFWFnCRn8QoKCuAeg?=
 =?us-ascii?Q?H0WLqfSFzNDGRxrSbD494dd3VvIlnvNcCeDRjqRPQSWJKMBVz1/yAvy36RtC?=
 =?us-ascii?Q?r/PNR06W0vSepZzsJnc/YXPp0+v/QP9rCzeIWX7DtP0n9E5gBcTnDc5TyWCk?=
 =?us-ascii?Q?CdSDRYSHfSO+9uYYJiZJdLMM7knsWsEz+X2krxMVk/nj6NKW8xhkjNlkij+m?=
 =?us-ascii?Q?xddu5JP+cpij9NqghsehkzeeoeoCkK+ErGqHe6GUSFiozFGjVtZn0ZzhyqoF?=
 =?us-ascii?Q?DwNKd2u6sAwYnYoGA4i0cIM+XuhdjumOCNyu4cRG6+Ug2ZmrKfdkg961wSo7?=
 =?us-ascii?Q?3d4tO/lzTwBmM6ktPXGCsLZVqg+wQo9QT54FSvQRnLTGBcRYUYe5sgUkDvQU?=
 =?us-ascii?Q?eZbfBnLUaLwUUEFdLrgis+T+yxTfjyy3q+AniFVUWhfb+9zYHYTygp31uFnM?=
 =?us-ascii?Q?wBbEZPw5OqKW0dPkMB2dZ3++mdI1qTwGxyNlJw52L0JEZqc/jQZxLKxKAO6p?=
 =?us-ascii?Q?ntx1ZSCiUVzE7NAtOW3O4MJa4QeEWszwlzAtUKumGCZfndRq38PaD0xW+5Pm?=
 =?us-ascii?Q?WTDeFLzbsMRWJ8u3tkcqcksqqtxYmruQfodxCOGJbucYg0eKm4ceFH/t3/Di?=
 =?us-ascii?Q?wkTHYcgqnO6fnz0n2lGqioCM2GT1ow3Mv7Ua48lr6+TY9FVzifOpqCThBCR0?=
 =?us-ascii?Q?s7JGfPsycwSsPoQkhfwgxhMtd466EY/QIEkWfkV+dGXdAs2ETBlEkWuNtqYW?=
 =?us-ascii?Q?FThfpazaiwdGbuDfUDXsei/IC8wKRZJwFLrnPrSbM7XzO4Fbus+/6U1wb121?=
 =?us-ascii?Q?TR+TtP/eywzqUkZFfFBc4IZtiNdJXspZYEMuyOQLOXhmRJAgT4I2LZhnT9iG?=
 =?us-ascii?Q?Box299zfxf6pb7xOH7robgZXb5AnPA99GjQ6iTi5nQK6OOC63F3rkxrRyx5K?=
 =?us-ascii?Q?8MqBm3d8B8B8IAZiMa5UygLZPaDGoorFp2mv/D1h2chbfkRTU/yABbL2uWwK?=
 =?us-ascii?Q?BxmgR3z7ojq+7y4qNHOG8BDf0JOhg+J3Yr3WT1SP7cX5fIg3IQXz6ThOvC1v?=
 =?us-ascii?Q?sbi0VpTLp8XhKrQ+UEVJc30V2VsnEDFJxbw0qiTSDkMkhsf361H3qxH4irnQ?=
 =?us-ascii?Q?mu59kd/3PUADosW5nzDzowvxQh6MwSEBYz9eQ1G/A2Q5/Khv6aZUceCXRJe7?=
 =?us-ascii?Q?zDboiT4ZQsuSmG5qTT/31/1MajaETnSK4MvL7gR9EyRpebtR4pOJGJzgdVIz?=
 =?us-ascii?Q?ydQi1gkaCbXiUx6lPaeOkswY9Q5VCrApqxiETWMMwOnObUnEgGOPXq4vDzi0?=
 =?us-ascii?Q?i87irSE/bUh0Gvmkse4mJ174IewmMQ1W1TUqAdVTL5RVY3RpNDDl3uS9SPoA?=
 =?us-ascii?Q?Q3QdKyAycbaAS3PxhofwjqW6GezeygYCeltnAJfZ29EekXzlPfa5SOG7O/EB?=
 =?us-ascii?Q?5zgkdXLdVNZWAGM7fQWuhajEpfxI9x5IqyAW40VMgGNBa0atjUlRr/UqHsCK?=
 =?us-ascii?Q?lRc4AXY2CaRS++RDF9k3kyJbJg2dRPYX4+6CsOuzehLEGtriBBR5mnmm8BRW?=
 =?us-ascii?Q?oCxSeoZXiUCHqMtWRcLwBRkKuHj672JNEblPbhcV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3875119-6c18-45e7-2723-08dcb315cc95
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 17:08:58.7414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WjbtqT29Qg0b30/AIwWYYNSYNfXj+R5lfMpYwAGqfO10o4fodDyxRH+YVdN2wPTgsrm7fUcP5FPIy9s1RTALaLHcuwaHJlk0tEdB+TFmWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5187
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
From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Andi=
 Shyti
Sent: Friday, August 2, 2024 1:39 AM
To: intel-gfx <intel-gfx@lists.freedesktop.org>; dri-devel <dri-devel@lists=
.freedesktop.org>
Cc: Jann Horn <jannh@chromium.org>; Jani Nikula <jani.nikula@linux.intel.co=
m>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodri=
go.vivi@intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>; Jann Horn <jannh=
@google.com>; Chris Wilson <chris.p.wilson@linux.intel.com>; Niemiec, Krzys=
ztof <krzysztof.niemiec@intel.com>; Andi Shyti <andi.shyti@kernel.org>; Aul=
d, Matthew <matthew.auld@intel.com>; Andi Shyti <andi.shyti@linux.intel.com=
>
Subject: [PATCH 1/2] drm/i915/gem: Adjust vma offset for framebuffer mmap o=
ffset
>=20
> When mapping a framebuffer object, the virtual memory area (VMA)
> offset ('vm_pgoff') should be adjusted by the start of the
> 'vma_node' associated with the object. This ensures that the VMA
> offset is correctly aligned with the corresponding offset within
> the GGTT aperture.
>=20
> Increment vm_pgoff by the start of the vma_node with the offset=3D
> provided by the user.
>=20
> Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i=
915/gem/i915_gem_mman.c
> index a2195e28b625..ce10dd259812 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -1084,6 +1084,8 @@ int i915_gem_fb_mmap(struct drm_i915_gem_object *ob=
j, struct vm_area_struct *vma
>  		mmo =3D mmap_offset_attach(obj, mmap_type, NULL);
>  		if (IS_ERR(mmo))
>  			return PTR_ERR(mmo);
> +
> +		vma->vm_pgoff +=3D drm_vma_node_start(&mmo->vma_node);
>  	}
> =20
>  	/*
> --=20
> 2.45.2
>=20
>=20
