Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A489864E2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 18:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B6910E109;
	Wed, 25 Sep 2024 16:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="av9RyXW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179CA10E102;
 Wed, 25 Sep 2024 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727282050; x=1758818050;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K8L1o/otHyUwyLY7YRyvzwAdGhK+MRt6rqLP5v+toVc=;
 b=av9RyXW5DX7OvrN4scAAZ71nEszJZPMIDRaQPFsaqqlobNHKOTpEi0qq
 t6xzt0oDjhb2Bvry3spxH6lhpFix6c3ir8Er8kOK6WQ+c6/0Sye3n/+ui
 DvPvik28Xa7TqEzLIC1S5U55vjz6R/U+y0eLMmrxJV/TbR4R7lORuNNx6
 KZsYLbgFalGeaoXjUgIioflvygRQZ80uiW2lajIIZx5EbcixxAsw7V3zq
 Q90FlEnK19lMr6cMbCJggqAL8gIsn67Nqo6kQO+9IuBvnSmBahFLioknA
 WtjhyLukACn4kYW0ojyHDRUoMMl/40VBXlkUuOKFE8ccv2wNjlecRw+Fz Q==;
X-CSE-ConnectionGUID: fiG0MeFES5q0mOc99MkrGA==
X-CSE-MsgGUID: 2cKti3F3Qv6BJexDO4nE1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="43863906"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="43863906"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 09:34:09 -0700
X-CSE-ConnectionGUID: ZO0RsMs+Q5q6zHY2j7057g==
X-CSE-MsgGUID: ylT7W4IoS1Srp3XxhCRaAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="102596273"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 09:34:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 09:34:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 09:34:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 09:34:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 09:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gL0GJNOb7+oT9OAT8NgNos3YJJfAgQG6B1d4jJiABxM3vboc9x/zoN66z9mdf1j3G77BaP6d6mxhMQoU1w/u/atN0Bkbie07dk/aml7x9Ki4XqChiY+PEGQUm3m8jEGSkOeWvUIQhZCM+ssrl7K31CEbII0IC1ru4V4yMWNbNwYaNZnKhPpFDRy9ZkxcOfOE+46J1kFjj6ubxLv00NgAy0Ri7idBp5ffA2XZkvswCduYqJQ7qXekMOwqK9gn2wvDla9yzTkRRt7cQnzKm0hB/wJdjYkDwjbXQAMSInt5EUGs+2lO6oOUx6CbxcfvCJ774496k+z3zeeOkIVnUb0DSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/q+Ety5JJdtengRTzuzGVO9ZtrqyuRygoMvEehjBm8=;
 b=l9F1j4ayDucMZvlycyGjmWBuiWqJl+yrEid9PYedrQd9cCevea7Vs164ABfNZuZW57T8doFlIguyvFkZRDGaRWT1habJb01ZR0x4D+ri3yKqOILZ8oBoHCrFjmLbiXoNoH8YeWuPnvOMJBtN+3Hy7WextY5WOUOuoNTEnsfDyhpFL4YHfdFzWzw8yedoPNnyWxRsoVq0QcwTyfzU0ZXkbj8jPZ8JYpC0XHRnjT6acrMLCbb4yLqdT0J2tmpK1E/L6qwFMd8Rv198K8rQUPz4EKawuDXBVVRcXyaNFkaMIqQQtMNDBUG6goyy1UDg9pmb2E5j/Ord+WjBiWvTS3knIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3159.namprd11.prod.outlook.com (2603:10b6:a03:78::31)
 by PH8PR11MB6951.namprd11.prod.outlook.com (2603:10b6:510:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Wed, 25 Sep
 2024 16:34:03 +0000
Received: from BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476]) by BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 16:34:02 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
Subject: RE: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Thread-Topic: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Thread-Index: AQHa+PTGWKHCCDXWdEmGFyWNqd8uqbJLGMLAgBu8pgCAAfA64A==
Date: Wed, 25 Sep 2024 16:34:02 +0000
Message-ID: <BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <BYAPR11MB315950BDB6EF8F125D6011C7929E2@BYAPR11MB3159.namprd11.prod.outlook.com>
 <ZvKFem5mITCNagGl@phenom.ffwll.local>
In-Reply-To: <ZvKFem5mITCNagGl@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3159:EE_|PH8PR11MB6951:EE_
x-ms-office365-filtering-correlation-id: 7577d70c-48e3-4741-4998-08dcdd7fdda1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?3VXWY8BWZG0O+RCDqGeYAwOxt1hshJrYlfo9+Fs2HKru79LRUFEh5LLOUq?=
 =?iso-8859-1?Q?LiU6v13gBlQ06Hp2ZhOnDSuxsBblPsyVqxcsuFtoGPcf4aZ6SWtFKBk5Pi?=
 =?iso-8859-1?Q?eQc3lKMnHrWHtwM2gtTLlVpnWm+J/84Y1JvD7Oe+HpyYfepTJdzJGhlQ2b?=
 =?iso-8859-1?Q?LIEkUqIbBGjOlxlbhIj9HvNUdDSvE+wY40e0K/FljOlU3P7tCD1z1kxf19?=
 =?iso-8859-1?Q?/ATk9umKT7GVU9mTf0W8NtlZ/dhSD7sEVp1xCM1gr89quwmIHVZzqBziM4?=
 =?iso-8859-1?Q?t7//iJQGIU/XMnAYVkeebxbUefRUPwjSp9lIrDamu227uZcDfc9BEb2SFE?=
 =?iso-8859-1?Q?UFtsywNioNmBrmGeAL68bG0XlMm+I5gUp7vqEiuHxjzHx8PCBJKZgrqIjA?=
 =?iso-8859-1?Q?TmAmWeOlczUYMYk3rrRrF6C6+k4itTyM9qk+YxClpJRa/vWtS8R0DbJZ88?=
 =?iso-8859-1?Q?7Ej6wB4aXAS1WuixahwSiWvC2yYVqFvefNtYdUri+q+Y6YiHqmf1vuRpxv?=
 =?iso-8859-1?Q?pvhKqfXN/k+M5G778W/lo0RI20cIs/XGVvjJzvCArsqW9nRB7iySX67G4q?=
 =?iso-8859-1?Q?gMvAJMPM1VgDicRHo7ro4xrEvdiwsBfaONE/ED+aY9lgZQYuiTdpJJ1rUI?=
 =?iso-8859-1?Q?OjJiElLnecgKcfzhmKJH+VsaVcqHh2uad47Xr2bl4pZWn/o7ozfDKZIuUH?=
 =?iso-8859-1?Q?DTtq+HkXKsGku+a4X7m4CNRPVRrfSYMGKKVWCSVAECZxl/KsT/Xr884Khb?=
 =?iso-8859-1?Q?2hrlpjyxNM06YVyzqeay3B2nroHFEqpMhcDGl4mtVUM1iWJiefeCCOiHw5?=
 =?iso-8859-1?Q?4rrrw+wHV9NtXxaydLFU+RiWKineMkcL3b2PyKNhpZsFZIU2wIbWUWWukT?=
 =?iso-8859-1?Q?lQxc7iAszLWMwzKQ8fP7HlVCDa9qWfazPVvjUnNN0TnWgllo/ScqHbj1IR?=
 =?iso-8859-1?Q?kwEnJwFaJiVaa8C4D7h8BdzAwkFuElqaZyhugUN9jUYyKC+viy/7X0qgsx?=
 =?iso-8859-1?Q?XBOG/8UtvjLVFQ/SafHBdeDHaZCcfPE0Cp69Hq3Jcltq+9IFmw1idyqal0?=
 =?iso-8859-1?Q?Sd8CVm+vQJ+KgWPhyflZjgZ2RjKl+KqwcF0fT/dAiiA2wQc9FsFXrxADV0?=
 =?iso-8859-1?Q?EYmNoayUXSswQUlYJz98kIDyrTgcBDEVaMIqbBw+O41wqZZDqAMr6XyWli?=
 =?iso-8859-1?Q?OTKllQ47kE6Un/YGdSdD4WHRf/tRyqq+zYMUqzymsgd5Bk2bXXis8/7mdi?=
 =?iso-8859-1?Q?GK0t8pd3fNrvnnbNCIyficjgL9Y55lx//kuXkWinRoUwP7x5LWqrjS7IVh?=
 =?iso-8859-1?Q?4Tc3H5/6V0eKYKKENAk1dckWTDd1mGCFC1tDTZV8oXZgWJA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3159.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XpdfTYIOKOAK1whs6rT19HZQLBksR1RuZUG5ITe0DclyYVj+Nd3ZEwjpId?=
 =?iso-8859-1?Q?0zhZuv2x0bHr1/qPSeJnzKSOy/vzPiCLtj2PP4d4RGeWRzsiRQf8XQaPg5?=
 =?iso-8859-1?Q?xcvIOqcivPYXi+w5O2UBu87+m+XkNq6YHvG0g+OqvlSsbP0jH4+DarsgTJ?=
 =?iso-8859-1?Q?luyBbwmzOKjHpXgLmIWtIQFHScszHUpx6ruPUriFBcMk3HJdPu6PDODx1G?=
 =?iso-8859-1?Q?hJjrDvg4C3QC6dqgujlpyhlps1pD+EYdtTc1JxQ32iNbeOObNVDI4JxWhD?=
 =?iso-8859-1?Q?d/BCoFMNodBLZeGpJ/D5GwZo6wCyqFX+jO9hLpYZds05UERI83s6GFFvya?=
 =?iso-8859-1?Q?fB/kBDHchx85ZSRQb6Gl8rmafSJqe86fibFLAgF9zofyUWa1MRDLGwWhRp?=
 =?iso-8859-1?Q?05/NQLHgepOLSn1VMlXbhcPeRfo6bG9wIEn1kZ5X1uYRoq6ojLm/U/HDA8?=
 =?iso-8859-1?Q?MvKfPZEccYKqjOUX4dzSmMGSZcCvprypFqSkGDfvW91iKmleS2B5hddTVU?=
 =?iso-8859-1?Q?IkD5o3OnGnoO6WimcaICenoN+6k6bQaRnaMkPIqgkm9pd+6UFqA6uvU5DH?=
 =?iso-8859-1?Q?jf1m7upp4Jj6An6KuLyHt75KZm0gHgmeVR7CTrOMhwQAcbGNYW/Kp03f38?=
 =?iso-8859-1?Q?zEFmry/a5fbRbDdGYElZt3mLkP9gaUgKp6i6RqNWEx3kH4B27moMZxVZFr?=
 =?iso-8859-1?Q?vJkv5dwK/EKbYv0Veo+F8YEKxispf4HEaiKej2v3PaPPczeeH7EDe9vpqA?=
 =?iso-8859-1?Q?1v1upCmSjVOzBZ+20ztnw0OXqh4o1rE2BKmVZ5oByg0enTA6NSsEHSHcrp?=
 =?iso-8859-1?Q?zW5hte8B1qKQPRmTb8h5AipROottCcYmZkfIZtBkARo/VSLCMGZPDzzbVF?=
 =?iso-8859-1?Q?3HQgW2kRQcyG454o6jIbek2bq2IyAIT+9mczPADL/25kbRsRFSTwyKWav9?=
 =?iso-8859-1?Q?JlYGtvmETM1luI+QUwJQKoXziwyZoh4RliOrI/ptJKfQ6YQL3AMomS7Arw?=
 =?iso-8859-1?Q?Y7KcX6p5jVD7a1ZiZ14uaESqPr1LAv9Us8Om/CZea9g+NdBhmgj7HgQi7Y?=
 =?iso-8859-1?Q?zp8eX/KfguZ+DOVdM+XY59UZjOaO6fsvsqp3fWJIj8kScMkPOCoIe1h5os?=
 =?iso-8859-1?Q?M1JSFSrsLWIIzKuS/yoddssxToXWB7NXM9xJJh59uacZFGJdBdyl68MDAO?=
 =?iso-8859-1?Q?m+XARypvOzDh5QFwooXtk5UnpN0FjbJwGs5ABQPTvJJBvjuYxe8/vkG9pK?=
 =?iso-8859-1?Q?6q/11WN+vFyREPSPHBva6BByHy3BILrO02Q/SESgZj92wyXswpmJKHEocV?=
 =?iso-8859-1?Q?rOjTEsucWxDPY/XFi4kdNROkyFYYJ57BCf5N8Yl4JpJVVyT2zFg5HbJjkB?=
 =?iso-8859-1?Q?q/qfgJzZCWqH5tWyUP1JwkCF5ND11mDaoaIJA3VLODm8ro8B9opYhrhS5j?=
 =?iso-8859-1?Q?rkXsc7FlmdSPJaIfzFIFZZ/WoteWRU9t7qQtnqBm+LnU2zO0YkGeHka29D?=
 =?iso-8859-1?Q?Go4uL/NdiYpsCrbboXIUwQr4gDTm9BEUAK/nqJrchn93B1NJpKMlpMuUVi?=
 =?iso-8859-1?Q?KUjp7Yk9cVoEVu72cOYAuIfjvnL+akkXURyMhqrcJ62w9WJDXeqYY/5WfH?=
 =?iso-8859-1?Q?z+LetnZrjI+Is=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3159.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7577d70c-48e3-4741-4998-08dcdd7fdda1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 16:34:02.8526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5aZFhGN5ddhqfVpBZxgiTdnZdRSjx2f973IoYMxQUvlMXQSqGaWalVIYlvVHPr03kxEnFpLBwIpTuHy8lliB4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6951
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

Hi Sima,

> -----Original Message-----
> From: Simona Vetter <simona.vetter@ffwll.ch>
> Sent: Tuesday, September 24, 2024 5:25 AM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: Brost, Matthew <matthew.brost@intel.com>; intel-
> xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> thomas.hellstrom@linux.intel.com; Auld, Matthew
> <matthew.auld@intel.com>; daniel@ffwll.ch; airlied@gmail.com;
> christian.koenig@amd.com
> Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU
> Shared Virtual Memory
>=20
> On Fri, Sep 06, 2024 at 06:41:18PM +0000, Zeng, Oak wrote:
> > There are fundamental design conflicts with what we have aligned,
> see inline.
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On
> Behalf
> > > Of Matthew Brost
> > > Sent: Tuesday, August 27, 2024 10:49 PM
> > > To: intel-xe@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> > > Cc: airlied@gmail.com; christian.koenig@amd.com;
> > > thomas.hellstrom@linux.intel.com; Auld, Matthew
> > > <matthew.auld@intel.com>; daniel@ffwll.ch
> > > Subject: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU
> > > Shared Virtual Memory
> > >
> > > This patch introduces support for GPU Shared Virtual Memory
> (SVM)
> > > in the
> > > Direct Rendering Manager (DRM) subsystem. SVM allows for
> > > seamless
> > > sharing of memory between the CPU and GPU, enhancing
> > > performance and
> > > flexibility in GPU computing tasks.
> > >
> > > The patch adds the necessary infrastructure for SVM, including
> data
> > > structures and functions for managing SVM ranges and notifiers. It
> > > also
> > > provides mechanisms for allocating, deallocating, and migrating
> > > memory
> > > regions between system RAM and GPU VRAM.
> > >
> > > This mid-layer is largely inspired by GPUVM.
> > >
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Makefile     |    3 +-
> > >  drivers/gpu/drm/xe/drm_gpusvm.c | 2174
> > > +++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/drm_gpusvm.h |  415 ++++++
> > >  3 files changed, 2591 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.c
> > >  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.h
> > >
> > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > b/drivers/gpu/drm/xe/Makefile
> > > index b9670ae09a9e..b8fc2ee58f1a 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -25,7 +25,8 @@ $(obj)/generated/%_wa_oob.c
> > > $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> > >
> > >  # core driver code
> > >
> > > -xe-y +=3D xe_bb.o \
> > > +xe-y +=3D drm_gpusvm.o \
> > > +	xe_bb.o \
> > >  	xe_bo.o \
> > >  	xe_bo_evict.o \
> > >  	xe_devcoredump.o \
> > > diff --git a/drivers/gpu/drm/xe/drm_gpusvm.c
> > > b/drivers/gpu/drm/xe/drm_gpusvm.c
> > > new file mode 100644
> > > index 000000000000..fc1e44e6ae72
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/drm_gpusvm.c
> > > @@ -0,0 +1,2174 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright =A9 2024 Intel Corporation
> > > + *
> > > + * Authors:
> > > + *     Matthew Brost <matthew.brost@intel.com>
> > > + */
> > > +
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/interval_tree_generic.h>
> > > +#include <linux/hmm.h>
> > > +#include <linux/memremap.h>
> > > +#include <linux/migrate.h>
> > > +#include <linux/mm_types.h>
> > > +#include <linux/pagemap.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include <drm/drm_device.h>
> > > +#include "drm_gpusvm.h"
> > > +
> > > +/**
> > > + * DOC: Overview
> > > + *
> > > + * GPU Shared Virtual Memory (GPU SVM) layer for the Direct
> > > Rendering Manager (DRM)
> > > + *
> > > + * The GPU SVM layer is a component of the DRM framework
> > > designed to manage shared
> > > + * virtual memory between the CPU and GPU. It enables
> efficient
> > > data exchange and
> > > + * processing for GPU-accelerated applications by allowing
> memory
> > > sharing and
> > > + * synchronization between the CPU's and GPU's virtual address
> > > spaces.
> > > + *
> > > + * Key GPU SVM Components:
> > > + * - Notifiers: Notifiers: Used for tracking memory intervals and
> > > notifying the
> > > + *		GPU of changes, notifiers are sized based on a GPU
> > > SVM
> > > + *		initialization parameter, with a recommendation of
> > > 512M or
> > > + *		larger. They maintain a Red-BlacK tree and a list of
> > > ranges that
> > > + *		fall within the notifier interval. Notifiers are tracked
> > > within
> > > + *		a GPU SVM Red-BlacK tree and list and are
> > > dynamically inserted
> > > + *		or removed as ranges within the interval are created
> > > or
> > > + *		destroyed.
> > > + * - Ranges: Represent memory ranges mapped in a DRM device
> and
> > > managed
> > > + *	     by GPU SVM.
> >
> >
> > This svm_range concept has introduced a lot of code duplications in
> xekmd,
> > Indicating that this is a wrong design. I think one of the design
> principle is to
> > Reuse, not to duplicate.
> >
> > Look at patch 9, 11, bunch of duplicated codes to page table update,
> invalidate,
> > And page fault handler.
> >
> > I had this range concept in v1 [1], but after we agreed to unify svm
> and userptr
> > Codes during review, I dropped this concept, and the xe_svm
> concept, which ends
> > Up much less duplicated codes in v2[2]. I will say more below why I
> thought the svm
> > Concept can also be removed.
> >
> > Conceptually vma represent a range. Why duplicate?
>=20
> Because we cannot rely on mmap_read/write locks or
> vma_read/write locks
> without causing headaches. They are core mm datastructures that the
> gpu
> driver does not own, so for better or worse we have to do a bit of
> duplication.

Seems there is a misunderstanding here. By vma I meant a data structure
In driver representing a range, such as xe_vma, not the core mm vma (
Struct vm_area_struct). Sorry I should be more clear.

The point I tried to make was, svm_range concept is pretty much a duplicati=
on
Of the xe_vma concept. If you look at the definition of those two data stru=
cture,
They are very similar. This further ends up with codes duplication in page =
table
Update codes:

- xe_pt_zap_ptes_range, duplicate xe_pt_zap_ptes
- xe_svm_invalidate, duplicate xe_userptr_invalidate
- xe_vm_range_rebind/unbind and many other functions are all duplicated.
- the rb-tree in drm_gpusvm duplicate the rb-tree in drm_gpuvm


>=20
> Duplication for no reaons is bad, but trying to avoid necessary
> duplication that's inherit to the design challenge we face is much
> worse.

I agree some duplication is necessary. But let's discuss whether we can avo=
id
Duplication in this design, whether it is reasonable.

In some PoC codes, I was able to avoid duplication w/o breaking the design.
The idea is to unify userptr codes and svm codes:

So userptr (xe_userptr_vma in xekmd) is a sub-class of xe-vma which is a su=
bclass of drm_gpuva.
We just move the userptr concept up to drm layer and renamed it to hmmptr.

This way we can reuse most of the xekmd userptr codes, and reuse the drm_gp=
uvm rb-tree.

Also there is no need of the drm_gpusvm concept, similar to the core mm des=
ign: there is only
Mm_struct but there isn't any shared mm concept.

To mark a drm_gpuvm participate a svm, we only need to introduce a *mm memb=
er to point to
The core mm_struct that this gpuvm participate.

As said, those idea wasn't originated from me. In my v1, it was also xe_svm=
/svm_range. I learned
Those idea during review. Even today, I still think this is a reasonable de=
sign. The key reason is, the svm
Design is nothing more than a userptr with the capability of migration to v=
ram. We already have a
Working userptr build on top of drm_gpuvm, drm_gpuva and xe_vma, why should=
 we re-invent all
Those concepts?=20

More details: https://gitlab.freedesktop.org/oak/xe-kernel-driver-svm/-/com=
mits/drm-tip-svm-drm-generic-page-centric-Sep05

Btw, in above codes, it not only support page-centric migration to sram (su=
ch as partially migrate a range to sram, worse case one page),
It does the same thing for migration to vram. The key idea is, it introduce=
d a migration vector concept: migration vector collects
All the migratable pages (through migrate_vma_setup), and aggregate those p=
ages into a migration job, regardless it is all pages in
A range or only a subset of pages. The lock design there is also "coinciden=
tally" aligned with what you outlined in your previous email,
See the "Doc: lock design" section of https://gitlab.freedesktop.org/oak/xe=
-kernel-driver-svm/-/commit/10d1576533f549b0d521dfa997b7087d1926e6ed


Oak

>=20
>=20
> > [1]
> https://patchwork.freedesktop.org/patch/574898/?series=3D128910&r
> ev=3D1
> > [2] https://patchwork.freedesktop.org/series/132229/
> >
> >
> > They are sized based on an array of chunk
> > > sizes, which
> > > + *	     is a GPU SVM initialization parameter, and the CPU address
> > > space.
> > > + *	     Upon GPU fault, the largest aligned chunk that fits within
> > > the
> > > + *	     faulting CPU address space is chosen for the range size.
> > > Ranges are
> > > + *	     expected to be dynamically allocated on GPU fault and
> > > removed on an
> > > + *	     MMU notifier UNMAP event. As mentioned above, ranges
> > > are tracked in
> > > + *	     a notifier's Red-Black tree.
> > > + * - Operations: Define the interface for driver-specific SVM
> > > operations such as
> > > + *		 allocation, page collection, migration, invalidations,
> > > and VRAM
> > > + *		 release.
> > > + *
> > > + * This layer provides interfaces for allocating, mapping, migrating=
,
> > > and
> > > + * releasing memory ranges between the CPU and GPU. It
> handles
> > > all core memory
> > > + * management interactions (DMA mapping, HMM, and
> migration)
> > > and provides
> > > + * driver-specific virtual functions (vfuncs). This infrastructure i=
s
> > > sufficient
> > > + * to build the expected driver components for an SVM
> > > implementation as detailed
> > > + * below.
> > > + *
> > > + * Expected Driver Components:
> > > + * - GPU page fault handler: Used to create ranges and notifiers
> > > based on the
> > > + *			     fault address, optionally migrate the range
> > > to
> > > + *			     VRAM, and create GPU bindings.
> > > + * - Garbage collector: Used to destroy GPU bindings for ranges.
> > > Ranges are
> > > + *			expected to be added to the garbage collector
> > > upon
> > > + *			MMU_NOTIFY_UNMAP event.
> > > + */
> > > +
> > > +/**
> > > + * DOC: Locking
> > > + *
> > > + * GPU SVM handles locking for core MM interactions, i.e., it
> > > locks/unlocks the
> > > + * mmap lock as needed. Alternatively, if the driver prefers to
> > > handle the mmap
> > > + * lock itself, a 'locked' argument is provided to the functions tha=
t
> > > require
> > > + * the mmap lock. This option may be useful for drivers that need
> to
> > > call into
> > > + * GPU SVM while also holding a dma-resv lock, thus preventing
> > > locking
> > > + * inversions between the mmap and dma-resv locks.
> > > + *
> > > + * GPU SVM introduces a global notifier lock, which safeguards
> the
> > > notifier's
> > > + * range RB tree and list, as well as the range's DMA mappings
> and
> > > sequence
> > > + * number. GPU SVM manages all necessary locking and
> unlocking
> > > operations,
> > > + * except for the recheck of the range's sequence number
> > > + * (mmu_interval_read_retry) when the driver is committing
> GPU
> > > bindings. This
> > > + * lock corresponds to the 'driver->update' lock mentioned in the
> > > HMM
> > > + * documentation (TODO: Link). Future revisions may transition
> from
> > > a GPU SVM
> > > + * global lock to a per-notifier lock if finer-grained locking is
> deemed
> > > + * necessary.
> > > + *
> > > + * In addition to the locking mentioned above, the driver should
> > > implement a
> > > + * lock to safeguard core GPU SVM function calls that modify
> state,
> > > such as
> > > + * drm_gpusvm_range_find_or_insert and
> > > drm_gpusvm_range_remove. Alternatively,
> > > + * these core functions can be called within a single kernel thread,
> > > for
> > > + * instance, using an ordered work queue. This lock is denoted as
> > > + * 'driver_svm_lock' in code examples.
> > > + */
> > > +
> > > +/**
> > > + * DOC: Migrataion
> > > + *
> > > + * The migration support is quite simple, allowing migration
> between
> > > SRAM and
> > > + * VRAM at the range granularity. For example, GPU SVM
> currently
> > > does not
> > > + * support mixing SRAM and VRAM pages within a range. This
> means
> > > that upon GPU
> > > + * fault, the entire range can be migrated to VRAM, and upon
> CPU
> > > fault, the
> > > + * entire range is migrated to SRAM.
> > > + *
> > > + * The reasoning for only supporting range granularity is as
> follows: it
> > > + * simplifies the implementation, and range sizes are driver-
> defined
> > > and should
> > > + * be relatively small.
> >
> > Migration at range granularity just couples the physical world with
> virtual world,
> > Which is against the fundamental page-centric design we aligned
> before.
> >
> > Looking at core mm behavior, the shrinking/swapping doesn't
> operate at vma or any
> > Virtual range granularity. This way we swap out the less frequently
> used pages and
> > Keep the more frequently used pages in ram.
> >
> > Similar thing should be done to vram migration to sram.
> >
> > > + */
> > > +
> > > +/**
> > > + * DOC: Partial Unmapping of Ranges
> > > + *
> > > + * Partial unmapping of ranges (e.g., 1M out of 2M is unmapped
> by
> > > CPU resulting
> > > + * in MMU_NOTIFY_UNMAP event) presents several challenges,
> >
> > As said above, the challenge is coming from a design choice. In a
> > Page centric design, the challenges don't exist at all.
>=20
> See my other reply, as long as migrate_to_ram is entirely page centric
> we're fine. And I think Matt fixed that now.
>=20
> The other aspect of being page centric is gpu pagetable locking, and
> there
> I also gained a lot of clarity on what exactly matters, and what doesn't.
> The mmu_notifer -> range -> page design wouldn't be my personal
> first
> choice, but it is a perfectly ok one I think. As long as we follow all th=
e
> other rules we need to follow about page-centric
> locking/refcounting/pte
> invaliation that migrate_to_ram requires.
>=20
> Cheers, Sima
>=20
>=20
> > > with the main one
> > > + * being that a subset of the range still has CPU and GPU
> mappings.
> > > If the
> > > + * backing store for the range is in VRAM, a subset of the backing
> > > store has
> > > + * references. One option would be to split the range and VRAM
> > > backing store,
> > > + * but the implementation for this would be quite complicated.
> > > Given that
> > > + * partial unmappings are rare and driver-defined range sizes are
> > > relatively
> > > + * small, GPU SVM does not support splitting of ranges.
> > > + *
> > > + * With no support for range splitting, upon partial unmapping of
> a
> > > range, the
> > > + * driver is expected to invalidate and destroy the entire range. If
> > > the range
> > > + * has VRAM as its backing, the driver is also expected to migrate
> any
> > > remaining
> > > + * pages back to SRAM.
> > > + */
> > > +
> > > +/**
> > > + * DOC: Examples
> > > + *
> > > + * This section provides two examples of how to build the
> expected
> > > driver
> > > + * components: the GPU page fault handler and the garbage
> > > collector. A third
> > > + * example demonstrates a sample invalidation driver vfunc.
> > > + *
> > > + * The generic code provided does not include logic for complex
> > > migration
> > > + * policies, optimized invalidations, or other potentially required
> > > driver
> > > + * locking (e.g., DMA-resv locks).
> > > + *
> > > + * 1) GPU page fault handler
> > > + *
> > > + *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct
> > > drm_gpusvm_range *range)
> > > + *	{
> > > + *		int err =3D 0;
> > > + *
> > > + *		driver_alloc_and_setup_memory_for_bind(gpusvm,
> > > range);
> > > + *
> > > + *		drm_gpusvm_notifier_lock(gpusvm);
> > > + *		if (drm_gpusvm_range_pages_valid(range))
> > > + *			driver_commit_bind(gpusvm, range);
> > > + *		else
> > > + *			err =3D -EAGAIN;
> > > + *		drm_gpusvm_notifier_unlock(gpusvm);
> > > + *
> > > + *		return err;
> > > + *	}
> > > + *
> > > + *	int driver_gpu_fault(struct drm_gpusvm *gpusvm, u64
> > > fault_addr,
> > > + *			     u64 gpuva_start, u64 gpuva_end)
> > > + *	{
> > > + *		struct drm_gpusvm_ctx ctx =3D {};
> > > + *		int err;
> > > + *
> > > + *		driver_svm_lock();
> > > + *	retry:
> > > + *		// Always process UNMAPs first so view of GPU SVM
> > > ranges is current
> > > + *		driver_garbage_collector(gpusvm);
> > > + *
> > > + *		range =3D drm_gpusvm_range_find_or_insert(gpusvm,
> > > fault_addr,
> > > + *							gpuva_start,
> > > gpuva_end,
> > > + *						        &ctx);
> > > + *		if (IS_ERR(range)) {
> > > + *			err =3D PTR_ERR(range);
> > > + *			goto unlock;
> > > + *		}
> > > + *
> > > + *		if (driver_migration_policy(range)) {
> > > + *			bo =3D driver_alloc_bo();
> > > + *			err =3D drm_gpusvm_migrate_to_vram(gpusvm,
> > > range, bo, &ctx);
> > > + *			if (err)	// CPU mappings may have changed
> > > + *				goto retry;
> > > + *		}
> > > + *
> > > + *		err =3D drm_gpusvm_range_get_pages(gpusvm, range,
> > > &ctx);
> > > + *		if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	// CPU
> > > mappings changed
> > > + *			goto retry;
> > > + *		else if (err)
> > > + *			goto unlock;
> > > + *
> > > + *		err =3D driver_bind_range(gpusvm, range);
> > > + *		if (err =3D=3D -EAGAIN)	// CPU mappings changed
> > > + *			goto retry
> > > + *
> > > + *	unlock:
> > > + *		driver_svm_unlock();
> > > + *		return err;
> > > + *	}
> > > + *
> > > + * 2) Garbage Collector.
> > > + *
> > > + *	void __driver_garbage_collector(struct drm_gpusvm
> > > *gpusvm,
> > > + *					struct drm_gpusvm_range
> > > *range)
> > > + *	{
> > > + *		struct drm_gpusvm_ctx ctx =3D {};
> > > + *
> > > + *		assert_driver_svm_locked(gpusvm);
> > > + *
> > > + *		// Partial unmap, migrate any remaining VRAM pages
> > > back to SRAM
> > > + *		if (range->flags.partial_unmap)
> > > + *			drm_gpusvm_migrate_to_sram(gpusvm,
> > > range, &ctx);
> > > + *
> > > + *		driver_unbind_range(range);
> > > + *		drm_gpusvm_range_remove(gpusvm, range);
> > > + *	}
> > > + *
> > > + *	void driver_garbage_collector(struct drm_gpusvm *gpusvm)
> > > + *	{
> > > + *		assert_driver_svm_locked(gpusvm);
> > > + *
> > > + *		for_each_range_in_garbage_collector(gpusvm, range)
> > > + *			__driver_garbage_collector(gpusvm, range);
> > > + *	}
> > > + *
> > > + * 3) Invalidation driver vfunc.
> > > + *
> > > + *	void driver_invalidation(struct drm_gpusvm *gpusvm,
> > > + *				 struct drm_gpusvm_notifier *notifier,
> > > + *				 const struct mmu_notifier_range
> > > *mmu_range)
> > > + *	{
> > > + *		struct drm_gpusvm_ctx ctx =3D { .in_notifier =3D true, };
> > > + *		struct drm_gpusvm_range *range =3D NULL;
> > > + *
> > > + *		driver_invalidate_device_tlb(gpusvm, mmu_range-
> > > >start, mmu_range->end);
> > > + *
> > > + *		drm_gpusvm_for_each_range(range, notifier,
> > > mmu_range->start,
> > > + *					  mmu_range->end) {
> > > + *			drm_gpusvm_range_unmap_pages(gpusvm,
> > > range, &ctx);
> > > + *
> > > + *			if (mmu_range->event !=3D
> > > MMU_NOTIFY_UNMAP)
> > > + *				continue;
> > > + *
> > > + *			drm_gpusvm_range_set_unmapped(range,
> > > mmu_range);
> > > + *			driver_garbage_collector_add(gpusvm,
> > > range);
> > > + *		}
> > > + *	}
> > > + */
> > > +
> > > +#define DRM_GPUSVM_RANGE_START(_range)	((_range)-
> > > >va.start)
> > > +#define DRM_GPUSVM_RANGE_END(_range)	((_range)-
> > > >va.end - 1)
> > > +INTERVAL_TREE_DEFINE(struct drm_gpusvm_range, rb.node,
> u64,
> > > rb.__subtree_last,
> > > +		     DRM_GPUSVM_RANGE_START,
> > > DRM_GPUSVM_RANGE_END,
> > > +		     static __maybe_unused, range);
> > > +
> > > +#define DRM_GPUSVM_NOTIFIER_START(_notifier)
> 	((_notifier)-
> > > >interval.start)
> > > +#define DRM_GPUSVM_NOTIFIER_END(_notifier)
> 	((_notifier)-
> > > >interval.end - 1)
> > > +INTERVAL_TREE_DEFINE(struct drm_gpusvm_notifier, rb.node,
> u64,
> > > +		     rb.__subtree_last,
> > > DRM_GPUSVM_NOTIFIER_START,
> > > +		     DRM_GPUSVM_NOTIFIER_END, static
> > > __maybe_unused, notifier);
> > > +
> > > +/**
> > > + * npages_in_range() - Calculate the number of pages in a given
> > > range
> > > + * @start__: The start address of the range
> > > + * @end__: The end address of the range
> > > + *
> > > + * This macro calculates the number of pages in a given memory
> > > range,
> > > + * specified by the start and end addresses. It divides the
> difference
> > > + * between the end and start addresses by the page size
> > > (PAGE_SIZE) to
> > > + * determine the number of pages in the range.
> > > + *
> > > + * Return: The number of pages in the specified range.
> > > + */
> > > +#define npages_in_range(start__, end__)	\
> > > +	(((end__) - (start__)) >> PAGE_SHIFT)
> > > +
> > > +/**
> > > + * struct drm_gpusvm_zdd - GPU SVM zone device data
> > > + *
> > > + * @refcount: Reference count for the zdd
> > > + * @destroy_work: Work structure for asynchronous zdd
> > > destruction
> > > + * @range: Pointer to the GPU SVM range
> > > + * @vram_allocation: Driver-private pointer to the VRAM
> allocation
> > > + *
> > > + * This structure serves as a generic wrapper installed in
> > > + * page->zone_device_data. It provides infrastructure for
> looking up
> > > a range
> > > + * upon CPU page fault and asynchronously releasing VRAM once
> > > the CPU has no
> > > + * page references. Asynchronous release is useful because CPU
> > > page references
> > > + * can be dropped in IRQ contexts, while releasing VRAM likely
> > > requires sleeping
> > > + * locks.
> > > + */
> > > +struct drm_gpusvm_zdd {
> > > +	struct kref refcount;
> > > +	struct work_struct destroy_work;
> > > +	struct drm_gpusvm_range *range;
> > > +	void *vram_allocation;
> > > +};
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_destroy_work_func - Work function for
> > > destroying a zdd
> > > + * @w: Pointer to the work_struct
> > > + *
> > > + * This function releases VRAM, puts GPU SVM range, and frees
> zdd.
> > > + */
> > > +static void drm_gpusvm_zdd_destroy_work_func(struct
> > > work_struct *w)
> > > +{
> > > +	struct drm_gpusvm_zdd *zdd =3D
> > > +		container_of(w, struct drm_gpusvm_zdd,
> > > destroy_work);
> > > +	struct drm_gpusvm_range *range =3D zdd->range;
> > > +	struct drm_gpusvm *gpusvm =3D range->gpusvm;
> > > +
> > > +	if (gpusvm->ops->vram_release && zdd->vram_allocation)
> > > +		gpusvm->ops->vram_release(zdd->vram_allocation);
> > > +	drm_gpusvm_range_put(range);
> > > +	kfree(zdd);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_alloc - Allocate a zdd structure.
> > > + * @range: Pointer to the GPU SVM range.
> > > + *
> > > + * This function allocates and initializes a new zdd structure. It
> sets
> > > up the
> > > + * reference count, initializes the destroy work, and links the
> > > provided GPU SVM
> > > + * range.
> > > + *
> > > + * Returns:
> > > + * Pointer to the allocated zdd on success, ERR_PTR() on failure.
> > > + */
> > > +static struct drm_gpusvm_zdd *
> > > +drm_gpusvm_zdd_alloc(struct drm_gpusvm_range *range)
> > > +{
> > > +	struct drm_gpusvm_zdd *zdd;
> > > +
> > > +	zdd =3D kmalloc(sizeof(*zdd), GFP_KERNEL);
> > > +	if (!zdd)
> > > +		return NULL;
> > > +
> > > +	kref_init(&zdd->refcount);
> > > +	INIT_WORK(&zdd->destroy_work,
> > > drm_gpusvm_zdd_destroy_work_func);
> > > +	zdd->range =3D drm_gpusvm_range_get(range);
> > > +	zdd->vram_allocation =3D NULL;
> > > +
> > > +	return zdd;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_get - Get a reference to a zdd structure.
> > > + * @zdd: Pointer to the zdd structure.
> > > + *
> > > + * This function increments the reference count of the provided
> zdd
> > > structure.
> > > + *
> > > + * Returns: Pointer to the zdd structure.
> > > + */
> > > +static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct
> > > drm_gpusvm_zdd *zdd)
> > > +{
> > > +	kref_get(&zdd->refcount);
> > > +	return zdd;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_destroy - Destroy a zdd structure.
> > > + * @ref: Pointer to the reference count structure.
> > > + *
> > > + * This function queues the destroy_work of the zdd for
> > > asynchronous destruction.
> > > + */
> > > +static void drm_gpusvm_zdd_destroy(struct kref *ref)
> > > +{
> > > +	struct drm_gpusvm_zdd *zdd =3D
> > > +		container_of(ref, struct drm_gpusvm_zdd, refcount);
> > > +	struct drm_gpusvm *gpusvm =3D zdd->range->gpusvm;
> > > +
> > > +	queue_work(gpusvm->zdd_wq, &zdd->destroy_work);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_zdd_put - Put a zdd reference.
> > > + * @zdd: Pointer to the zdd structure.
> > > + *
> > > + * This function decrements the reference count of the provided
> zdd
> > > structure
> > > + * and schedules its destruction if the count drops to zero.
> > > + */
> > > +static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
> > > +{
> > > +	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_find - Find GPU SVM range from GPU
> SVM
> > > notifier
> > > + * @notifier: Pointer to the GPU SVM notifier structure.
> > > + * @start: Start address of the range
> > > + * @end: End address of the range
> > > + *
> > > + * Return: A pointer to the drm_gpusvm_range if found or NULL
> > > + */
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier,
> u64
> > > start, u64 end)
> > > +{
> > > +	return range_iter_first(&notifier->root, start, end - 1);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_for_each_range_safe - Safely iterate over GPU
> > > SVM ranges in a notifier
> > > + * @range__: Iterator variable for the ranges
> > > + * @next__: Iterator variable for the ranges temporay storage
> > > + * @notifier__: Pointer to the GPU SVM notifier
> > > + * @start__: Start address of the range
> > > + * @end__: End address of the range
> > > + *
> > > + * This macro is used to iterate over GPU SVM ranges in a notifier
> > > while
> > > + * removing ranges from it.
> > > + */
> > > +#define drm_gpusvm_for_each_range_safe(range__, next__,
> > > notifier__, start__, end__)	\
> > > +	for ((range__) =3D drm_gpusvm_range_find((notifier__),
> > > (start__), (end__)),	\
> > > +	     (next__) =3D __drm_gpusvm_range_next(range__);
> > > 			\
> > > +	     (range__) && (range__->va.start < (end__));
> > > 			\
> > > +	     (range__) =3D (next__), (next__) =3D
> > > __drm_gpusvm_range_next(range__))
> > > +
> > > +/**
> > > + * __drm_gpusvm_notifier_next - get the next
> > > drm_gpusvm_notifier in the list
> > > + * @notifier: a pointer to the current drm_gpusvm_notifier
> > > + *
> > > + * Return: A pointer to the next drm_gpusvm_notifier if available,
> or
> > > NULL if
> > > + *         the current notifier is the last one or if the input noti=
fier is
> > > + *         NULL.
> > > + */
> > > +static struct drm_gpusvm_notifier *
> > > +__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier
> > > *notifier)
> > > +{
> > > +	if (notifier && !list_is_last(&notifier->rb.entry,
> > > +				      &notifier->gpusvm->notifier_list))
> > > +		return list_next_entry(notifier, rb.entry);
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_for_each_notifier - Iterate over GPU SVM
> notifiers
> > > in a gpusvm
> > > + * @notifier__: Iterator variable for the notifiers
> > > + * @notifier__: Pointer to the GPU SVM notifier
> > > + * @start__: Start address of the notifier
> > > + * @end__: End address of the notifier
> > > + *
> > > + * This macro is used to iterate over GPU SVM notifiers in a
> gpusvm.
> > > + */
> > > +#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__,
> > > start__, end__)		\
> > > +	for ((notifier__) =3D notifier_iter_first(&(gpusvm__)->root,
> > > (start__), (end__) - 1);	\
> > > +	     (notifier__) && (notifier__->interval.start < (end__));
> > > 			\
> > > +	     (notifier__) =3D __drm_gpusvm_notifier_next(notifier__))
> > > +
> > > +/**
> > > + * drm_gpusvm_for_each_notifier_safe - Safely iterate over
> GPU
> > > SVM notifiers in a gpusvm
> > > + * @notifier__: Iterator variable for the notifiers
> > > + * @next__: Iterator variable for the notifiers temporay storage
> > > + * @notifier__: Pointer to the GPU SVM notifier
> > > + * @start__: Start address of the notifier
> > > + * @end__: End address of the notifier
> > > + *
> > > + * This macro is used to iterate over GPU SVM notifiers in a
> gpusvm
> > > while
> > > + * removing notifiers from it.
> > > + */
> > > +#define drm_gpusvm_for_each_notifier_safe(notifier__,
> next__,
> > > gpusvm__, start__, end__)	\
> > > +	for ((notifier__) =3D notifier_iter_first(&(gpusvm__)->root,
> > > (start__), (end__) - 1),	\
> > > +	     (next__) =3D __drm_gpusvm_notifier_next(notifier__);
> > > 				\
> > > +	     (notifier__) && (notifier__->interval.start < (end__));
> > > 			\
> > > +	     (notifier__) =3D (next__), (next__) =3D
> > > __drm_gpusvm_notifier_next(notifier__))
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_invalidate - Invalidate a GPU SVM
> notifier.
> > > + * @mni: Pointer to the mmu_interval_notifier structure.
> > > + * @mmu_range: Pointer to the mmu_notifier_range structure.
> > > + * @cur_seq: Current sequence number.
> > > + *
> > > + * This function serves as a generic MMU notifier for GPU SVM. It
> > > sets the MMU
> > > + * notifier sequence number and calls the driver invalidate vfunc
> > > under
> > > + * gpusvm->notifier_lock.
> > > + *
> > > + * Returns:
> > > + * true if the operation succeeds, false otherwise.
> > > + */
> > > +static bool
> > > +drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier
> *mni,
> > > +			       const struct mmu_notifier_range
> > > *mmu_range,
> > > +			       unsigned long cur_seq)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier =3D
> > > +		container_of(mni, typeof(*notifier), notifier);
> > > +	struct drm_gpusvm *gpusvm =3D notifier->gpusvm;
> > > +
> > > +	if (!mmu_notifier_range_blockable(mmu_range))
> > > +		return false;
> > > +
> > > +	down_write(&gpusvm->notifier_lock);
> > > +	mmu_interval_set_seq(mni, cur_seq);
> > > +	gpusvm->ops->invalidate(gpusvm, notifier, mmu_range);
> > > +	up_write(&gpusvm->notifier_lock);
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_ops - MMU interval notifier operations
> for
> > > GPU SVM
> > > + */
> > > +static const struct mmu_interval_notifier_ops
> > > drm_gpusvm_notifier_ops =3D {
> > > +	.invalidate =3D drm_gpusvm_notifier_invalidate,
> > > +};
> > > +
> > > +/**
> > > + * drm_gpusvm_init - Initialize the GPU SVM.
> > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > + * @name: Name of the GPU SVM.
> > > + * @drm: Pointer to the DRM device structure.
> > > + * @mm: Pointer to the mm_struct for the address space.
> > > + * @device_private_page_owner: Device private pages owner.
> > > + * @mm_start: Start address of GPU SVM.
> > > + * @mm_range: Range of the GPU SVM.
> > > + * @notifier_size: Size of individual notifiers.
> > > + * @ops: Pointer to the operations structure for GPU SVM.
> > > + * @chunk_sizes: Pointer to the array of chunk sizes used in
> range
> > > allocation.
> > > + *               Entries should be powers of 2 in descending order w=
ith
> last
> > > + *               entry being SZ_4K.
> > > + * @num_chunks: Number of chunks.
> > > + *
> > > + * This function initializes the GPU SVM.
> > > + *
> > > + * Returns:
> > > + * 0 on success, a negative error code on failure.
> > > + */
> > > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > > +		    const char *name, struct drm_device *drm,
> > > +		    struct mm_struct *mm, void
> > > *device_private_page_owner,
> > > +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> > > +		    const struct drm_gpusvm_ops *ops,
> > > +		    const u64 *chunk_sizes, int num_chunks)
> > > +{
> > > +	if (!ops->invalidate || !num_chunks)
> > > +		return -EINVAL;
> > > +
> > > +	gpusvm->name =3D name;
> > > +	gpusvm->drm =3D drm;
> > > +	gpusvm->mm =3D mm;
> > > +	gpusvm->device_private_page_owner =3D
> > > device_private_page_owner;
> > > +	gpusvm->mm_start =3D mm_start;
> > > +	gpusvm->mm_range =3D mm_range;
> > > +	gpusvm->notifier_size =3D notifier_size;
> > > +	gpusvm->ops =3D ops;
> > > +	gpusvm->chunk_sizes =3D chunk_sizes;
> > > +	gpusvm->num_chunks =3D num_chunks;
> > > +	gpusvm->zdd_wq =3D system_wq;
> > > +
> > > +	mmgrab(mm);
> > > +	gpusvm->root =3D RB_ROOT_CACHED;
> > > +	INIT_LIST_HEAD(&gpusvm->notifier_list);
> > > +
> > > +	init_rwsem(&gpusvm->notifier_lock);
> > > +
> > > +	fs_reclaim_acquire(GFP_KERNEL);
> > > +	might_lock(&gpusvm->notifier_lock);
> > > +	fs_reclaim_release(GFP_KERNEL);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_find - Find GPU SVM notifier
> > > + * @gpusvm__: Pointer to the GPU SVM structure
> > > + * @fault_addr__: Fault address
> > > + *
> > > + * This macro finds the GPU SVM notifier associated with the
> fault
> > > address.
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM notifier on success, NULL otherwise.
> > > + */
> > > +#define drm_gpusvm_notifier_find(gpusvm__, fault_addr__)
> > > 	\
> > > +	notifier_iter_first(&(gpusvm__)->root, (fault_addr__),
> > > 	\
> > > +			    (fault_addr__ + 1))
> > > +
> > > +/**
> > > + * to_drm_gpusvm_notifier - retrieve the container struct for a
> > > given rbtree node
> > > + * @node__: a pointer to the rbtree node embedded within a
> > > drm_gpusvm_notifier struct
> > > + *
> > > + * Return: A pointer to the containing drm_gpusvm_notifier
> > > structure.
> > > + */
> > > +#define to_drm_gpusvm_notifier(__node)
> > > 	\
> > > +	container_of((__node), struct drm_gpusvm_notifier, rb.node)
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_insert - Insert GPU SVM notifier
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + *
> > > + * This function inserts the GPU SVM notifier into the GPU SVM
> RB
> > > tree and list.
> > > + */
> > > +static void drm_gpusvm_notifier_insert(struct drm_gpusvm
> > > *gpusvm,
> > > +				       struct drm_gpusvm_notifier
> > > *notifier)
> > > +{
> > > +	struct rb_node *node;
> > > +	struct list_head *head;
> > > +
> > > +	notifier_insert(notifier, &gpusvm->root);
> > > +
> > > +	node =3D rb_prev(&notifier->rb.node);
> > > +	if (node)
> > > +		head =3D &(to_drm_gpusvm_notifier(node))->rb.entry;
> > > +	else
> > > +		head =3D &gpusvm->notifier_list;
> > > +
> > > +	list_add(&notifier->rb.entry, head);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_remove - Remove GPU SVM notifier
> > > + * @gpusvm__: Pointer to the GPU SVM tructure
> > > + * @notifier__: Pointer to the GPU SVM notifier structure
> > > + *
> > > + * This macro removes the GPU SVM notifier from the GPU SVM
> RB
> > > tree and list.
> > > + */
> > > +#define drm_gpusvm_notifier_remove(gpusvm__, notifier__)
> > > 	\
> > > +	notifier_remove((notifier__), &(gpusvm__)->root);	\
> > > +	list_del(&(notifier__)->rb.entry)
> > > +
> > > +/**
> > > + * drm_gpusvm_fini - Finalize the GPU SVM.
> > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > + *
> > > + * This function finalizes the GPU SVM by cleaning up any
> remaining
> > > ranges and
> > > + * notifiers, and dropping a reference to struct MM.
> > > + */
> > > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier, *next;
> > > +
> > > +	drm_gpusvm_for_each_notifier_safe(notifier, next, gpusvm,
> > > 0, LONG_MAX) {
> > > +		struct drm_gpusvm_range *range, *__next;
> > > +
> > > +		/*
> > > +		 * Remove notifier first to avoid racing with any
> > > invalidation
> > > +		 */
> > > +		mmu_interval_notifier_remove(&notifier->notifier);
> > > +		notifier->flags.removed =3D true;
> > > +
> > > +		drm_gpusvm_for_each_range_safe(range, __next,
> > > notifier, 0,
> > > +					       LONG_MAX)
> > > +			drm_gpusvm_range_remove(gpusvm, range);
> > > +	}
> > > +
> > > +	mmdrop(gpusvm->mm);
> > > +	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_alloc - Allocate GPU SVM notifier
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @fault_addr: Fault address
> > > + *
> > > + * This function allocates and initializes the GPU SVM notifier
> > > structure.
> > > + *
> > > + * Returns:
> > > + * Pointer to the allocated GPU SVM notifier on success,
> ERR_PTR()
> > > on failure.
> > > + */
> > > +static struct drm_gpusvm_notifier *
> > > +drm_gpusvm_notifier_alloc(struct drm_gpusvm *gpusvm, u64
> > > fault_addr)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +
> > > +	if (gpusvm->ops->notifier_alloc)
> > > +		notifier =3D gpusvm->ops->notifier_alloc();
> > > +	else
> > > +		notifier =3D kzalloc(sizeof(*notifier), GFP_KERNEL);
> > > +
> > > +	if (!notifier)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	notifier->gpusvm =3D gpusvm;
> > > +	notifier->interval.start =3D ALIGN_DOWN(fault_addr, gpusvm-
> > > >notifier_size);
> > > +	notifier->interval.end =3D ALIGN(fault_addr + 1, gpusvm-
> > > >notifier_size);
> > > +	INIT_LIST_HEAD(&notifier->rb.entry);
> > > +	notifier->root =3D RB_ROOT_CACHED;
> > > +	INIT_LIST_HEAD(&notifier->range_list);
> > > +
> > > +	return notifier;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_free - Free GPU SVM notifier
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + *
> > > + * This function frees the GPU SVM notifier structure.
> > > + */
> > > +static void drm_gpusvm_notifier_free(struct drm_gpusvm
> *gpusvm,
> > > +				     struct drm_gpusvm_notifier
> > > *notifier)
> > > +{
> > > +	WARN_ON(!RB_EMPTY_ROOT(&notifier->root.rb_root));
> > > +
> > > +	if (gpusvm->ops->notifier_free)
> > > +		gpusvm->ops->notifier_free(notifier);
> > > +	else
> > > +		kfree(notifier);
> > > +}
> > > +
> > > +/**
> > > + * to_drm_gpusvm_range - retrieve the container struct for a
> given
> > > rbtree node
> > > + * @node__: a pointer to the rbtree node embedded within a
> > > drm_gpusvm_range struct
> > > + *
> > > + * Return: A pointer to the containing drm_gpusvm_range
> structure.
> > > + */
> > > +#define to_drm_gpusvm_range(node__)	\
> > > +	container_of((node__), struct drm_gpusvm_range, rb.node)
> > > +
> > > +/**
> > > + * drm_gpusvm_range_insert - Insert GPU SVM range
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function inserts the GPU SVM range into the notifier RB
> tree
> > > and list.
> > > + */
> > > +static void drm_gpusvm_range_insert(struct
> drm_gpusvm_notifier
> > > *notifier,
> > > +				    struct drm_gpusvm_range *range)
> > > +{
> > > +	struct rb_node *node;
> > > +	struct list_head *head;
> > > +
> > > +	drm_gpusvm_notifier_lock(notifier->gpusvm);
> > > +	range_insert(range, &notifier->root);
> > > +
> > > +	node =3D rb_prev(&range->rb.node);
> > > +	if (node)
> > > +		head =3D &(to_drm_gpusvm_range(node))->rb.entry;
> > > +	else
> > > +		head =3D &notifier->range_list;
> > > +
> > > +	list_add(&range->rb.entry, head);
> > > +	drm_gpusvm_notifier_unlock(notifier->gpusvm);
> > > +}
> > > +
> > > +/**
> > > + * __drm_gpusvm_range_remove - Remove GPU SVM range
> > > + * @notifier__: Pointer to the GPU SVM notifier structure
> > > + * @range__: Pointer to the GPU SVM range structure
> > > + *
> > > + * This macro removes the GPU SVM range from the notifier RB
> tree
> > > and list.
> > > + */
> > > +#define __drm_gpusvm_range_remove(notifier__, range__)
> > > 		\
> > > +	range_remove((range__), &(notifier__)->root);
> > > 	\
> > > +	list_del(&(range__)->rb.entry)
> > > +
> > > +/**
> > > + * drm_gpusvm_range_alloc - Allocate GPU SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @fault_addr: Fault address
> > > + * @chunk_size: Chunk size
> > > + * @migrate_vram: Flag indicating whether to migrate VRAM
> > > + *
> > > + * This function allocates and initializes the GPU SVM range
> structure.
> > > + *
> > > + * Returns:
> > > + * Pointer to the allocated GPU SVM range on success, ERR_PTR()
> on
> > > failure.
> > > + */
> > > +static struct drm_gpusvm_range *
> > > +drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
> > > +		       struct drm_gpusvm_notifier *notifier,
> > > +		       u64 fault_addr, u64 chunk_size, bool
> > > migrate_vram)
> > > +{
> > > +	struct drm_gpusvm_range *range;
> > > +
> > > +	if (gpusvm->ops->range_alloc)
> > > +		range =3D gpusvm->ops->range_alloc(gpusvm);
> > > +	else
> > > +		range =3D kzalloc(sizeof(*range), GFP_KERNEL);
> > > +
> > > +	if (!range)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	kref_init(&range->refcount);
> > > +	range->gpusvm =3D gpusvm;
> > > +	range->notifier =3D notifier;
> > > +	range->va.start =3D ALIGN_DOWN(fault_addr, chunk_size);
> > > +	range->va.end =3D ALIGN(fault_addr + 1, chunk_size);
> > > +	INIT_LIST_HEAD(&range->rb.entry);
> > > +	range->notifier_seq =3D LONG_MAX;
> > > +	range->flags.migrate_vram =3D migrate_vram ? 1 : 0;
> > > +
> > > +	return range;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_check_pages - Check pages
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @start: Start address
> > > + * @end: End address
> > > + *
> > > + * Check if pages between start and end have been faulted in on
> the
> > > CPU. Use to
> > > + * prevent migration of pages without CPU backing store.
> > > + *
> > > + * Returns:
> > > + * True if pages have been faulted into CPU, False otherwise
> > > + */
> > > +static bool drm_gpusvm_check_pages(struct drm_gpusvm
> *gpusvm,
> > > +				   struct drm_gpusvm_notifier
> > > *notifier,
> > > +				   u64 start, u64 end)
> > > +{
> > > +	struct hmm_range hmm_range =3D {
> > > +		.default_flags =3D 0,
> > > +		.notifier =3D &notifier->notifier,
> > > +		.start =3D start,
> > > +		.end =3D end,
> > > +		.dev_private_owner =3D gpusvm-
> > > >device_private_page_owner,
> > > +	};
> > > +	unsigned long timeout =3D
> > > +		jiffies +
> > > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > +	unsigned long *pfns;
> > > +	unsigned long npages =3D npages_in_range(start, end);
> > > +	int err, i;
> > > +
> > > +	mmap_assert_locked(gpusvm->mm);
> > > +
> > > +	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > > +	if (!pfns)
> > > +		return false;
> > > +
> > > +	hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(&notifier->notifier);
> > > +	hmm_range.hmm_pfns =3D pfns;
> > > +
> > > +	while (true) {
> > > +		err =3D hmm_range_fault(&hmm_range);
> > > +		if (err =3D=3D -EBUSY) {
> > > +			if (time_after(jiffies, timeout))
> > > +				break;
> > > +
> > > +			hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(&notifier->notifier);
> > > +			continue;
> > > +		}
> > > +		break;
> > > +	}
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		if (!(pfns[i] & HMM_PFN_VALID)) {
> > > +			err =3D -EFAULT;
> > > +			goto err_free;
> > > +		}
> > > +	}
> > > +
> > > +err_free:
> > > +	kvfree(pfns);
> > > +	return err ? false : true;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_chunk_size - Determine chunk size for
> GPU
> > > SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier structure
> > > + * @vas: Pointer to the virtual memory area structure
> > > + * @fault_addr: Fault address
> > > + * @gpuva_start: Start address of GPUVA which mirrors CPU
> > > + * @gpuva_end: End address of GPUVA which mirrors CPU
> > > + * @check_pages: Flag indicating whether to check pages
> > > + *
> > > + * This function determines the chunk size for the GPU SVM
> range
> > > based on the
> > > + * fault address, GPU SVM chunk sizes, existing GPU SVM ranges,
> > > and the virtual
> > > + * memory area boundaries.
> > > + *
> > > + * Returns:
> > > + * Chunk size on success, LONG_MAX on failure.
> > > + */
> > > +static u64 drm_gpusvm_range_chunk_size(struct drm_gpusvm
> > > *gpusvm,
> > > +				       struct drm_gpusvm_notifier
> > > *notifier,
> > > +				       struct vm_area_struct *vas,
> > > +				       u64 fault_addr, u64 gpuva_start,
> > > +				       u64 gpuva_end, bool check_pages)
> > > +{
> > > +	u64 start, end;
> > > +	int i =3D 0;
> > > +
> > > +retry:
> > > +	for (; i < gpusvm->num_chunks; ++i) {
> > > +		start =3D ALIGN_DOWN(fault_addr, gpusvm-
> > > >chunk_sizes[i]);
> > > +		end =3D ALIGN(fault_addr + 1, gpusvm->chunk_sizes[i]);
> > > +
> > > +		if (start >=3D vas->vm_start && end <=3D vas->vm_end
> > > &&
> > > +		    start >=3D notifier->interval.start &&
> > > +		    end <=3D notifier->interval.end &&
> > > +		    start >=3D gpuva_start && end <=3D gpuva_end)
> > > +			break;
> > > +	}
> > > +
> > > +	if (i =3D=3D gpusvm->num_chunks)
> > > +		return LONG_MAX;
> > > +
> > > +	/*
> > > +	 * If allocation more than page, ensure not to overlap with
> > > existing
> > > +	 * ranges.
> > > +	 */
> > > +	if (end - start !=3D SZ_4K) {
> > > +		struct drm_gpusvm_range *range;
> > > +
> > > +		range =3D drm_gpusvm_range_find(notifier, start, end);
> > > +		if (range) {
> > > +			++i;
> > > +			goto retry;
> > > +		}
> > > +
> > > +		/*
> > > +		 * XXX: Only create range on pages CPU has faulted in.
> > > Without
> > > +		 * this check, or prefault, on BMG
> > > 'xe_exec_system_allocator --r
> > > +		 * process-many-malloc' fails. In the failure case, each
> > > process
> > > +		 * mallocs 16k but the CPU VMA is ~128k which results
> > > in 64k SVM
> > > +		 * ranges. When migrating the SVM ranges, some
> > > processes fail in
> > > +		 * drm_gpusvm_migrate_to_vram with
> > > 'migrate.cpages !=3D npages'
> > > +		 * and then upon drm_gpusvm_range_get_pages
> > > device pages from
> > > +		 * other processes are collected + faulted in which
> > > creates all
> > > +		 * sorts of problems. Unsure exactly how this
> > > happening, also
> > > +		 * problem goes away if 'xe_exec_system_allocator --
> > > r
> > > +		 * process-many-malloc' mallocs at least 64k at a time.
> > > +		 */
> > > +		if (check_pages &&
> > > +		    !drm_gpusvm_check_pages(gpusvm, notifier, start,
> > > end)) {
> > > +			++i;
> > > +			goto retry;
> > > +		}
> > > +	}
> > > +
> > > +	return end - start;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_find_or_insert - Find or insert GPU SVM
> > > range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @fault_addr: Fault address
> > > + * @gpuva_start: Start address of GPUVA which mirrors CPU
> > > + * @gpuva_end: End address of GPUVA which mirrors CPU
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function finds or inserts a newly allocated a GPU SVM
> range
> > > based on the
> > > + * fault address. Caller must hold a lock to protect range lookup
> and
> > > insertion.
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM range on success, ERR_PTR() on
> failure.
> > > + */
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm
> *gpusvm,
> > > u64 fault_addr,
> > > +				u64 gpuva_start, u64 gpuva_end,
> > > +				const struct drm_gpusvm_ctx *ctx)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +	struct drm_gpusvm_range *range;
> > > +	struct mm_struct *mm =3D gpusvm->mm;
> > > +	struct vm_area_struct *vas;
> > > +	bool notifier_alloc =3D false;
> > > +	u64 chunk_size;
> > > +	int err;
> > > +	bool migrate_vram;
> > > +
> > > +	if (fault_addr < gpusvm->mm_start ||
> > > +	    fault_addr > gpusvm->mm_start + gpusvm->mm_range) {
> > > +		err =3D -EINVAL;
> > > +		goto err_out;
> > > +	}
> > > +
> > > +	if (!ctx->mmap_locked) {
> > > +		if (!mmget_not_zero(mm)) {
> > > +			err =3D -EFAULT;
> > > +			goto err_out;
> > > +		}
> > > +		mmap_write_lock(mm);
> > > +	}
> > > +
> > > +	mmap_assert_write_locked(mm);
> > > +
> > > +	notifier =3D drm_gpusvm_notifier_find(gpusvm, fault_addr);
> > > +	if (!notifier) {
> > > +		notifier =3D drm_gpusvm_notifier_alloc(gpusvm,
> > > fault_addr);
> > > +		if (IS_ERR(notifier)) {
> > > +			err =3D PTR_ERR(notifier);
> > > +			goto err_mmunlock;
> > > +		}
> > > +		notifier_alloc =3D true;
> > > +		err =3D mmu_interval_notifier_insert_locked(&notifier-
> > > >notifier,
> > > +							  mm, notifier-
> > > >interval.start,
> > > +							  notifier-
> > > >interval.end -
> > > +							  notifier-
> > > >interval.start,
> > > +
> > > &drm_gpusvm_notifier_ops);
> > > +		if (err)
> > > +			goto err_notifier;
> > > +	}
> > > +
> > > +	vas =3D vma_lookup(mm, fault_addr);
> > > +	if (!vas) {
> > > +		err =3D -ENOENT;
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	if (!ctx->read_only && !(vas->vm_flags & VM_WRITE)) {
> > > +		err =3D -EPERM;
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	range =3D drm_gpusvm_range_find(notifier, fault_addr,
> > > fault_addr + 1);
> > > +	if (range)
> > > +		goto out_mmunlock;
> > > +	/*
> > > +	 * XXX: Short-circuiting migration based on migrate_vma_*
> > > current
> > > +	 * limitations. If/when migrate_vma_* add more support, this
> > > logic will
> > > +	 * have to change.
> > > +	 */
> > > +	migrate_vram =3D ctx->vram_possible &&
> > > +		vma_is_anonymous(vas)
> > > && !is_vm_hugetlb_page(vas);
> > > +
> > > +	chunk_size =3D drm_gpusvm_range_chunk_size(gpusvm,
> > > notifier, vas,
> > > +						 fault_addr,
> > > gpuva_start,
> > > +						 gpuva_end,
> > > migrate_vram &&
> > > +						 !ctx->prefault);
> > > +	if (chunk_size =3D=3D LONG_MAX) {
> > > +		err =3D -EINVAL;
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	range =3D drm_gpusvm_range_alloc(gpusvm, notifier,
> > > fault_addr, chunk_size,
> > > +				       migrate_vram);
> > > +	if (IS_ERR(range)) {
> > > +		err =3D PTR_ERR(range);
> > > +		goto err_notifier_remove;
> > > +	}
> > > +
> > > +	drm_gpusvm_range_insert(notifier, range);
> > > +	if (notifier_alloc)
> > > +		drm_gpusvm_notifier_insert(gpusvm, notifier);
> > > +
> > > +	if (ctx->prefault) {
> > > +		struct drm_gpusvm_ctx __ctx =3D *ctx;
> > > +
> > > +		__ctx.mmap_locked =3D true;
> > > +		err =3D drm_gpusvm_range_get_pages(gpusvm, range,
> > > &__ctx);
> > > +		if (err)
> > > +			goto err_range_remove;
> > > +	}
> > > +
> > > +out_mmunlock:
> > > +	if (!ctx->mmap_locked) {
> > > +		mmap_write_unlock(mm);
> > > +		mmput(mm);
> > > +	}
> > > +
> > > +	return range;
> > > +
> > > +err_range_remove:
> > > +	__drm_gpusvm_range_remove(notifier, range);
> > > +err_notifier_remove:
> > > +	if (notifier_alloc)
> > > +		mmu_interval_notifier_remove(&notifier->notifier);
> > > +err_notifier:
> > > +	if (notifier_alloc)
> > > +		drm_gpusvm_notifier_free(gpusvm, notifier);
> > > +err_mmunlock:
> > > +	if (!ctx->mmap_locked) {
> > > +		mmap_write_unlock(mm);
> > > +		mmput(mm);
> > > +	}
> > > +err_out:
> > > +	return ERR_PTR(err);
> > > +}
> > > +
> > > +/**
> > > + * for_each_dma_page - iterate over pages in a DMA regio`n
> > > + * @i__: the current page index in the iteration
> > > + * @j__: the current page index, log order, in the iteration
> > > + * @npages__: the total number of pages in the DMA region
> > > + * @order__: the order of the pages in the DMA region
> > > + *
> > > + * This macro iterates over each page in a DMA region. The DMA
> > > region
> > > + * is assumed to be composed of 2^@order__ pages, and the
> macro
> > > will
> > > + * step through the region one block of 2^@order__ pages at a
> time.
> > > + */
> > > +#define for_each_dma_page(i__, j__, npages__, order__)
> 	\
> > > +	for ((i__) =3D 0, (j__) =3D 0; (i__) < (npages__);	\
> > > +	     (j__)++, (i__) +=3D 0x1 << (order__))
> > > +
> > > +/**
> > > + * __drm_gpusvm_range_unmap_pages - Unmap pages
> associated
> > > with a GPU SVM range (internal)
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function unmap pages associated with a GPU SVM range.
> > > Assumes and
> > > + * asserts correct locking is in place when called.
> > > + */
> > > +static void __drm_gpusvm_range_unmap_pages(struct
> > > drm_gpusvm *gpusvm,
> > > +					   struct drm_gpusvm_range
> > > *range)
> > > +{
> > > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > > +
> > > +	if (range->pages) {
> > > +		unsigned long i, j, npages =3D npages_in_range(range-
> > > >va.start,
> > > +							     range-
> > > >va.end);
> > > +
> > > +		if (range->flags.has_dma_mapping) {
> > > +			for_each_dma_page(i, j, npages, range-
> > > >order)
> > > +				dma_unmap_page(gpusvm->drm-
> > > >dev,
> > > +					       range->dma_addr[j],
> > > +					       PAGE_SIZE << range-
> > > >order,
> > > +					       DMA_BIDIRECTIONAL);
> > > +		}
> > > +
> > > +		range->flags.has_vram_pages =3D false;
> > > +		range->flags.has_dma_mapping =3D false;
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_free_pages - Free pages associated with
> a
> > > GPU SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function free pages associated with a GPU SVM range.
> > > + */
> > > +static void drm_gpusvm_range_free_pages(struct drm_gpusvm
> > > *gpusvm,
> > > +					struct drm_gpusvm_range
> > > *range)
> > > +{
> > > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > > +
> > > +	if (range->pages) {
> > > +		if (range->flags.kfree_mapping) {
> > > +			kfree(range->dma_addr);
> > > +			range->flags.kfree_mapping =3D false;
> > > +			range->pages =3D NULL;
> > > +		} else {
> > > +			kvfree(range->pages);
> > > +			range->pages =3D NULL;
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_remove - Remove GPU SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range to be removed
> > > + *
> > > + * This function removes the specified GPU SVM range and also
> > > removes the parent
> > > + * GPU SVM notifier if no more ranges remain in the notifier. The
> > > caller must
> > > + * hold a lock to protect range and notifier removal.
> > > + */
> > > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > > +			     struct drm_gpusvm_range *range)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +
> > > +	notifier =3D drm_gpusvm_notifier_find(gpusvm, range-
> > > >va.start);
> > > +	if (WARN_ON_ONCE(!notifier))
> > > +		return;
> > > +
> > > +	drm_gpusvm_notifier_lock(gpusvm);
> > > +	__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > +	drm_gpusvm_range_free_pages(gpusvm, range);
> > > +	__drm_gpusvm_range_remove(notifier, range);
> > > +	drm_gpusvm_notifier_unlock(gpusvm);
> > > +
> > > +	drm_gpusvm_range_put(range);
> > > +
> > > +	if (RB_EMPTY_ROOT(&notifier->root.rb_root)) {
> > > +		if (!notifier->flags.removed)
> > > +			mmu_interval_notifier_remove(&notifier-
> > > >notifier);
> > > +		drm_gpusvm_notifier_remove(gpusvm, notifier);
> > > +		drm_gpusvm_notifier_free(gpusvm, notifier);
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_get - Get a reference to GPU SVM range
> > > + * @range: Pointer to the GPU SVM range
> > > + *
> > > + * This function increments the reference count of the specified
> > > GPU SVM range.
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM range.
> > > + */
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_get(struct drm_gpusvm_range *range)
> > > +{
> > > +	kref_get(&range->refcount);
> > > +
> > > +	return range;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_destroy - Destroy GPU SVM range
> > > + * @refcount: Pointer to the reference counter embedded in the
> > > GPU SVM range
> > > + *
> > > + * This function destroys the specified GPU SVM range when its
> > > reference count
> > > + * reaches zero. If a custom range-free function is provided, it is
> > > invoked to
> > > + * free the range; otherwise, the range is deallocated using
> kfree().
> > > + */
> > > +static void drm_gpusvm_range_destroy(struct kref *refcount)
> > > +{
> > > +	struct drm_gpusvm_range *range =3D
> > > +		container_of(refcount, struct drm_gpusvm_range,
> > > refcount);
> > > +	struct drm_gpusvm *gpusvm =3D range->gpusvm;
> > > +
> > > +	if (gpusvm->ops->range_free)
> > > +		gpusvm->ops->range_free(range);
> > > +	else
> > > +		kfree(range);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_put - Put a reference to GPU SVM range
> > > + * @range: Pointer to the GPU SVM range
> > > + *
> > > + * This function decrements the reference count of the specified
> > > GPU SVM range
> > > + * and frees it when the count reaches zero.
> > > + */
> > > +void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
> > > +{
> > > +	kref_put(&range->refcount, drm_gpusvm_range_destroy);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_pages_valid - GPU SVM range pages
> valid
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function determines if a GPU SVM range pages are valid.
> > > Expected be
> > > + * called holding gpusvm->notifier_lock and as the last step
> before
> > > commiting a
> > > + * GPU binding.
> > > + *
> > > + * Returns:
> > > + * True if GPU SVM range has valid pages, False otherwise
> > > + */
> > > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm
> *gpusvm,
> > > +				  struct drm_gpusvm_range *range)
> > > +{
> > > +	lockdep_assert_held(&gpusvm->notifier_lock);
> > > +
> > > +	return range->flags.has_vram_pages || range-
> > > >flags.has_dma_mapping;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_pages_valid_unlocked - GPU SVM range
> > > pages valid unlocked
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * This function determines if a GPU SVM range pages are valid.
> > > Expected be
> > > + * called without holding gpusvm->notifier_lock.
> > > + *
> > > + * Returns:
> > > + * True if GPU SVM range has valid pages, False otherwise
> > > + */
> > > +static bool
> > > +drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm
> > > *gpusvm,
> > > +				      struct drm_gpusvm_range *range)
> > > +{
> > > +	bool pages_valid;
> > > +
> > > +	if (!range->pages)
> > > +		return false;
> > > +
> > > +	drm_gpusvm_notifier_lock(gpusvm);
> > > +	pages_valid =3D drm_gpusvm_range_pages_valid(gpusvm,
> > > range);
> > > +	if (!pages_valid && range->flags.kfree_mapping) {
> > > +		kfree(range->dma_addr);
> > > +		range->flags.kfree_mapping =3D false;
> > > +		range->pages =3D NULL;
> > > +	}
> > > +	drm_gpusvm_notifier_unlock(gpusvm);
> > > +
> > > +	return pages_valid;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_get_pages - Get pages for a GPU SVM
> range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function gets pages for a GPU SVM range and ensures
> they
> > > are mapped for
> > > + * DMA access.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +int drm_gpusvm_range_get_pages(struct drm_gpusvm
> *gpusvm,
> > > +			       struct drm_gpusvm_range *range,
> > > +			       const struct drm_gpusvm_ctx *ctx)
> > > +{
> > > +	struct mmu_interval_notifier *notifier =3D &range->notifier-
> > > >notifier;
> > > +	struct hmm_range hmm_range =3D {
> > > +		.default_flags =3D HMM_PFN_REQ_FAULT | (ctx-
> > > >read_only ? 0 :
> > > +			HMM_PFN_REQ_WRITE),
> > > +		.notifier =3D notifier,
> > > +		.start =3D range->va.start,
> > > +		.end =3D range->va.end,
> > > +		.dev_private_owner =3D gpusvm-
> > > >device_private_page_owner,
> > > +	};
> > > +	struct mm_struct *mm =3D gpusvm->mm;
> > > +	unsigned long timeout =3D
> > > +		jiffies +
> > > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > +	unsigned long i, j;
> > > +	unsigned long npages =3D npages_in_range(range->va.start,
> > > range->va.end);
> > > +	unsigned int order =3D 0;
> > > +	unsigned long *pfns;
> > > +	struct page **pages;
> > > +	int err =3D 0;
> > > +	bool vram_pages =3D !!range->flags.migrate_vram;
> > > +	bool alloc_pfns =3D false, kfree_mapping;
> > > +
> > > +retry:
> > > +	kfree_mapping =3D false;
> > > +	hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(notifier);
> > > +	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm,
> > > range))
> > > +		return 0;
> > > +
> > > +	if (range->notifier_seq =3D=3D hmm_range.notifier_seq &&
> > > range->pages) {
> > > +		if (ctx->prefault)
> > > +			return 0;
> > > +
> > > +		pfns =3D (unsigned long *)range->pages;
> > > +		pages =3D range->pages;
> > > +		goto map_pages;
> > > +	}
> > > +
> > > +	if (!range->pages) {
> > > +		pfns =3D kvmalloc_array(npages, sizeof(*pfns),
> > > GFP_KERNEL);
> > > +		if (!pfns)
> > > +			return -ENOMEM;
> > > +		alloc_pfns =3D true;
> > > +	} else {
> > > +		pfns =3D (unsigned long *)range->pages;
> > > +	}
> > > +
> > > +	if (!ctx->mmap_locked) {
> > > +		if (!mmget_not_zero(mm)) {
> > > +			err =3D -EFAULT;
> > > +			goto err_out;
> > > +		}
> > > +	}
> > > +
> > > +	hmm_range.hmm_pfns =3D pfns;
> > > +	while (true) {
> > > +		/* Must be checked after mmu_interval_read_begin
> > > */
> > > +		if (range->flags.unmapped) {
> > > +			err =3D -EFAULT;
> > > +			break;
> > > +		}
> > > +
> > > +		if (!ctx->mmap_locked) {
> > > +			/*
> > > +			 * XXX: HMM locking document indicates only
> > > a read-lock
> > > +			 * is required but there apears to be a window
> > > between
> > > +			 * the MMU_NOTIFY_MIGRATE event
> > > triggered in a CPU fault
> > > +			 * via migrate_vma_setup and the pages
> > > actually moving
> > > +			 * in migrate_vma_finalize in which this code
> > > can grab
> > > +			 * garbage pages. Grabbing the write-lock if
> > > the range
> > > +			 * is attached to vram appears to protect
> > > against this
> > > +			 * race.
> > > +			 */
> > > +			if (vram_pages)
> > > +				mmap_write_lock(mm);
> > > +			else
> > > +				mmap_read_lock(mm);
> > > +		}
> > > +		err =3D hmm_range_fault(&hmm_range);
> > > +		if (!ctx->mmap_locked) {
> > > +			if (vram_pages)
> > > +				mmap_write_unlock(mm);
> > > +			else
> > > +				mmap_read_unlock(mm);
> > > +		}
> > > +
> > > +		if (err =3D=3D -EBUSY) {
> > > +			if (time_after(jiffies, timeout))
> > > +				break;
> > > +
> > > +			hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(notifier);
> > > +			continue;
> > > +		}
> > > +		break;
> > > +	}
> > > +	if (!ctx->mmap_locked)
> > > +		mmput(mm);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	pages =3D (struct page **)pfns;
> > > +
> > > +	if (ctx->prefault) {
> > > +		range->pages =3D pages;
> > > +		goto set_seqno;
> > > +	}
> > > +
> > > +map_pages:
> > > +	if (is_device_private_page(hmm_pfn_to_page(pfns[0]))) {
> > > +		WARN_ON_ONCE(!range->vram_allocation);
> > > +
> > > +		for (i =3D 0; i < npages; ++i) {
> > > +			pages[i] =3D hmm_pfn_to_page(pfns[i]);
> > > +
> > > +			if
> > > (WARN_ON_ONCE(!is_device_private_page(pages[i]))) {
> > > +				err =3D -EOPNOTSUPP;
> > > +				goto err_free;
> > > +			}
> > > +		}
> > > +
> > > +		/* Do not race with notifier unmapping pages */
> > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > +		range->flags.has_vram_pages =3D true;
> > > +		range->pages =3D pages;
> > > +		if (mmu_interval_read_retry(notifier,
> > > hmm_range.notifier_seq)) {
> > > +			err =3D -EAGAIN;
> > > +
> > > 	__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > +		}
> > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > +	} else {
> > > +		dma_addr_t *dma_addr =3D (dma_addr_t *)pfns;
> > > +
> > > +		for_each_dma_page(i, j, npages, order) {
> > > +			if (WARN_ON_ONCE(i && order !=3D
> > > +
> > > hmm_pfn_to_map_order(pfns[i]))) {
> > > +				err =3D -EOPNOTSUPP;
> > > +				npages =3D i;
> > > +				goto err_unmap;
> > > +			}
> > > +			order =3D hmm_pfn_to_map_order(pfns[i]);
> > > +
> > > +			pages[j] =3D hmm_pfn_to_page(pfns[i]);
> > > +			if
> > > (WARN_ON_ONCE(is_zone_device_page(pages[j]))) {
> > > +				err =3D -EOPNOTSUPP;
> > > +				npages =3D i;
> > > +				goto err_unmap;
> > > +			}
> > > +
> > > +			set_page_dirty_lock(pages[j]);
> > > +			mark_page_accessed(pages[j]);
> > > +
> > > +			dma_addr[j] =3D dma_map_page(gpusvm-
> > > >drm->dev,
> > > +						   pages[j], 0,
> > > +						   PAGE_SIZE << order,
> > > +
> > > DMA_BIDIRECTIONAL);
> > > +			if (dma_mapping_error(gpusvm->drm->dev,
> > > dma_addr[j])) {
> > > +				err =3D -EFAULT;
> > > +				npages =3D i;
> > > +				goto err_unmap;
> > > +			}
> > > +		}
> > > +
> > > +		/* Huge pages, reduce memory footprint */
> > > +		if (order) {
> > > +			dma_addr =3D kmalloc_array(j,
> > > sizeof(*dma_addr),
> > > +						 GFP_KERNEL);
> > > +			if (dma_addr) {
> > > +				for (i =3D 0; i < j; ++i)
> > > +					dma_addr[i] =3D
> > > (dma_addr_t)pfns[i];
> > > +				kvfree(pfns);
> > > +				kfree_mapping =3D true;
> > > +			} else {
> > > +				dma_addr =3D (dma_addr_t *)pfns;
> > > +			}
> > > +		}
> > > +
> > > +		/* Do not race with notifier unmapping pages */
> > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > +		range->order =3D order;
> > > +		range->flags.kfree_mapping =3D kfree_mapping;
> > > +		range->flags.has_dma_mapping =3D true;
> > > +		range->dma_addr =3D dma_addr;
> > > +		range->vram_allocation =3D NULL;
> > > +		if (mmu_interval_read_retry(notifier,
> > > hmm_range.notifier_seq)) {
> > > +			err =3D -EAGAIN;
> > > +
> > > 	__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > +		}
> > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > +	}
> > > +
> > > +	if (err =3D=3D -EAGAIN)
> > > +		goto retry;
> > > +set_seqno:
> > > +	range->notifier_seq =3D hmm_range.notifier_seq;
> > > +
> > > +	return 0;
> > > +
> > > +err_unmap:
> > > +	for_each_dma_page(i, j, npages, order)
> > > +		dma_unmap_page(gpusvm->drm->dev,
> > > +			       (dma_addr_t)pfns[j],
> > > +			       PAGE_SIZE << order,
> > > DMA_BIDIRECTIONAL);
> > > +err_free:
> > > +	if (alloc_pfns)
> > > +		kvfree(pfns);
> > > +err_out:
> > > +	return err;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_range_unmap_pages - Unmap pages associated
> > > with a GPU SVM range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function unmaps pages associated with a GPU SVM range.
> If
> > > @in_notifier
> > > + * is set, it is assumed that gpusvm->notifier_lock is held in write
> > > mode; if it
> > > + * is clear, it acquires gpusvm->notifier_lock in read mode. Must
> be
> > > called on
> > > + * each GPU SVM range attached to notifier in gpusvm->ops-
> > > >invalidate for IOMMU
> > > + * security model.
> > > + */
> > > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm
> > > *gpusvm,
> > > +				  struct drm_gpusvm_range *range,
> > > +				  const struct drm_gpusvm_ctx *ctx)
> > > +{
> > > +	if (ctx->in_notifier)
> > > +		lockdep_assert_held_write(&gpusvm->notifier_lock);
> > > +	else
> > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > +
> > > +	__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > +
> > > +	if (!ctx->in_notifier)
> > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migration_put_page - Put a migration page
> > > + * @page: Pointer to the page to put
> > > + *
> > > + * This function unlocks and puts a page.
> > > + */
> > > +static void drm_gpusvm_migration_put_page(struct page *page)
> > > +{
> > > +	unlock_page(page);
> > > +	put_page(page);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migration_put_pages - Put migration pages
> > > + * @npages: Number of pages
> > > + * @migrate_pfn: Array of migrate page frame numbers
> > > + *
> > > + * This function puts an array of pages.
> > > + */
> > > +static void drm_gpusvm_migration_put_pages(unsigned long
> > > npages,
> > > +					   unsigned long *migrate_pfn)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		if (!migrate_pfn[i])
> > > +			continue;
> > > +
> > > +
> > > 	drm_gpusvm_migration_put_page(migrate_pfn_to_page(mi
> > > grate_pfn[i]));
> > > +		migrate_pfn[i] =3D 0;
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_get_vram_page - Get a reference to a VRAM
> page
> > > + * @page: Pointer to the page
> > > + * @zdd: Pointer to the GPU SVM zone device data
> > > + *
> > > + * This function associates the given page with the specified GPU
> > > SVM zone
> > > + * device data and initializes it for zone device usage.
> > > + */
> > > +static void drm_gpusvm_get_vram_page(struct page *page,
> > > +				     struct drm_gpusvm_zdd *zdd)
> > > +{
> > > +	page->zone_device_data =3D drm_gpusvm_zdd_get(zdd);
> > > +	zone_device_page_init(page);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_map_pages() - Map migration pages
> for
> > > GPU SVM migration
> > > + * @dev: The device for which the pages are being mapped
> > > + * @dma_addr: Array to store DMA addresses corresponding to
> > > mapped pages
> > > + * @migrate_pfn: Array of migrate page frame numbers to map
> > > + * @npages: Number of pages to map
> > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > + *
> > > + * This function maps pages of memory for migration usage in
> GPU
> > > SVM. It
> > > + * iterates over each page frame number provided in
> @migrate_pfn,
> > > maps the
> > > + * corresponding page, and stores the DMA address in the
> provided
> > > @dma_addr
> > > + * array.
> > > + *
> > > + * Return: 0 on success, -EFAULT if an error occurs during
> mapping.
> > > + */
> > > +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> > > +					dma_addr_t *dma_addr,
> > > +					long unsigned int
> > > *migrate_pfn,
> > > +					unsigned long npages,
> > > +					enum dma_data_direction dir)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page =3D
> > > migrate_pfn_to_page(migrate_pfn[i]);
> > > +
> > > +		if (!page)
> > > +			continue;
> > > +
> > > +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > > +			return -EFAULT;
> > > +
> > > +		dma_addr[i] =3D dma_map_page(dev, page, 0,
> > > PAGE_SIZE, dir);
> > > +		if (dma_mapping_error(dev, dma_addr[i]))
> > > +			return -EFAULT;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_unmap_pages() - Unmap pages
> previously
> > > mapped for GPU SVM migration
> > > + * @dev: The device for which the pages were mapped
> > > + * @dma_addr: Array of DMA addresses corresponding to
> mapped
> > > pages
> > > + * @npages: Number of pages to unmap
> > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > + *
> > > + * This function unmaps previously mapped pages of memory for
> > > GPU Shared Virtual
> > > + * Memory (SVM). It iterates over each DMA address provided in
> > > @dma_addr, checks
> > > + * if it's valid and not already unmapped, and unmaps the
> > > corresponding page.
> > > + */
> > > +static void drm_gpusvm_migrate_unmap_pages(struct device
> *dev,
> > > +					   dma_addr_t *dma_addr,
> > > +					   unsigned long npages,
> > > +					   enum dma_data_direction
> > > dir)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		if (!dma_addr[i] || dma_mapping_error(dev,
> > > dma_addr[i]))
> > > +			continue;
> > > +
> > > +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_to_vram - Migrate GPU SVM range to
> > > VRAM
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *                   failure of this function.
> > > + * @vram_allocation: Driver-private pointer to the VRAM
> allocation.
> > > The caller
> > > + *                   should hold a reference to the VRAM allocation,
> which
> > > + *                   should be dropped via ops->vram_allocation or u=
pon
> the
> > > + *                   failure of this function.
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function migrates the specified GPU SVM range to VRAM.
> It
> > > performs the
> > > + * necessary setup and invokes the driver-specific operations for
> > > migration to
> > > + * VRAM. Upon successful return, @vram_allocation can safely
> > > reference @range
> > > + * until ops->vram_release is called which only upon successful
> > > return.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm
> *gpusvm,
> > > +			       struct drm_gpusvm_range *range,
> > > +			       void *vram_allocation,
> > > +			       const struct drm_gpusvm_ctx *ctx)
> > > +{
> > > +	u64 start =3D range->va.start, end =3D range->va.end;
> > > +	struct migrate_vma migrate =3D {
> > > +		.start		=3D start,
> > > +		.end		=3D end,
> > > +		.pgmap_owner	=3D gpusvm-
> > > >device_private_page_owner,
> > > +		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM,
> > > +	};
> > > +	struct mm_struct *mm =3D gpusvm->mm;
> > > +	unsigned long i, npages =3D npages_in_range(start, end);
> > > +	struct vm_area_struct *vas;
> > > +	struct drm_gpusvm_zdd *zdd =3D NULL;
> > > +	struct page **pages;
> > > +	dma_addr_t *dma_addr;
> > > +	void *buf;
> > > +	int err;
> > > +
> > > +	if (!range->flags.migrate_vram)
> > > +		return -EINVAL;
> > > +
> > > +	if (!gpusvm->ops->populate_vram_pfn || !gpusvm->ops-
> > > >copy_to_vram ||
> > > +	    !gpusvm->ops->copy_to_sram)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	if (!ctx->mmap_locked) {
> > > +		if (!mmget_not_zero(mm)) {
> > > +			err =3D -EFAULT;
> > > +			goto err_out;
> > > +		}
> > > +		mmap_write_lock(mm);
> > > +	}
> > > +
> > > +	mmap_assert_locked(mm);
> > > +
> > > +	vas =3D vma_lookup(mm, start);
> > > +	if (!vas) {
> > > +		err =3D -ENOENT;
> > > +		goto err_mmunlock;
> > > +	}
> > > +
> > > +	if (end > vas->vm_end || start < vas->vm_start) {
> > > +		err =3D -EINVAL;
> > > +		goto err_mmunlock;
> > > +	}
> > > +
> > > +	if (!vma_is_anonymous(vas)) {
> > > +		err =3D -EBUSY;
> > > +		goto err_mmunlock;
> > > +	}
> > > +
> > > +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr) +
> > > +		       sizeof(*pages), GFP_KERNEL);
> > > +	if (!buf) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_mmunlock;
> > > +	}
> > > +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > > +	pages =3D buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr))
> > > * npages;
> > > +
> > > +	zdd =3D drm_gpusvm_zdd_alloc(range);
> > > +	if (!zdd) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_free;
> > > +	}
> > > +
> > > +	migrate.vma =3D vas;
> > > +	migrate.src =3D buf;
> > > +	migrate.dst =3D migrate.src + npages;
> > > +
> > > +	err =3D migrate_vma_setup(&migrate);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	/*
> > > +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages !=3D
> > > npages, not
> > > +	 * always an error. Need to revisit possible cases and how to
> > > handle. We
> > > +	 * could prefault on migrate.cpages !=3D npages via
> > > hmm_range_fault.
> > > +	 */
> > > +
> > > +	if (!migrate.cpages) {
> > > +		err =3D -EFAULT;
> > > +		goto err_free;
> > > +	}
> > > +
> > > +	if (migrate.cpages !=3D npages) {
> > > +		err =3D -EBUSY;
> > > +		goto err_finalize;
> > > +	}
> > > +
> > > +	err =3D gpusvm->ops->populate_vram_pfn(gpusvm,
> > > vram_allocation, npages,
> > > +					     migrate.dst);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	err =3D drm_gpusvm_migrate_map_pages(gpusvm->drm->dev,
> > > dma_addr,
> > > +					   migrate.src, npages,
> > > DMA_TO_DEVICE);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page =3D pfn_to_page(migrate.dst[i]);
> > > +
> > > +		pages[i] =3D page;
> > > +		migrate.dst[i] =3D migrate_pfn(migrate.dst[i]);
> > > +		drm_gpusvm_get_vram_page(page, zdd);
> > > +	}
> > > +
> > > +	err =3D gpusvm->ops->copy_to_vram(gpusvm, pages,
> > > dma_addr, npages);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	/* Upon success bind vram allocation to range and zdd */
> > > +	range->vram_allocation =3D vram_allocation;
> > > +	WRITE_ONCE(zdd->vram_allocation, vram_allocation);	/*
> > > Owns ref */
> > > +
> > > +err_finalize:
> > > +	if (err)
> > > +		drm_gpusvm_migration_put_pages(npages,
> > > migrate.dst);
> > > +	migrate_vma_pages(&migrate);
> > > +	migrate_vma_finalize(&migrate);
> > > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev,
> > > dma_addr, npages,
> > > +				       DMA_TO_DEVICE);
> > > +err_free:
> > > +	if (zdd)
> > > +		drm_gpusvm_zdd_put(zdd);
> > > +	kvfree(buf);
> > > +err_mmunlock:
> > > +	if (!ctx->mmap_locked) {
> > > +		mmap_write_unlock(mm);
> > > +		mmput(mm);
> > > +	}
> > > +err_out:
> > > +	return err;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_populate_sram_pfn - Populate SRAM
> > > PFNs for a VM area
> > > + * @vas: Pointer to the VM area structure, can be NULL
> > > + * @npages: Number of pages to populate
> > > + * @src_mpfn: Source array of migrate PFNs
> > > + * @mpfn: Array of migrate PFNs to populate
> > > + * @addr: Start address for PFN allocation
> > > + *
> > > + * This function populates the SRAM migrate page frame
> numbers
> > > (PFNs) for the
> > > + * specified VM area structure. It allocates and locks pages in the
> VM
> > > area for
> > > + * SRAM usage. If vas is non-NULL use alloc_page_vma for
> allocation,
> > > if NULL use
> > > + * alloc_page for allocation.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +static int drm_gpusvm_migrate_populate_sram_pfn(struct
> > > vm_area_struct *vas,
> > > +						unsigned long npages,
> > > +						unsigned long
> > > *src_mpfn,
> > > +						unsigned long *mpfn,
> > > u64 addr)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i, addr +=3D PAGE_SIZE) {
> > > +		struct page *page;
> > > +
> > > +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > > +			continue;
> > > +
> > > +		if (vas)
> > > +			page =3D alloc_page_vma(GFP_HIGHUSER, vas,
> > > addr);
> > > +		else
> > > +			page =3D alloc_page(GFP_HIGHUSER);
> > > +
> > > +		if (!page)
> > > +			return -ENOMEM;
> > > +
> > > +		lock_page(page);
> > > +		mpfn[i] =3D migrate_pfn(page_to_pfn(page));
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_evict_to_sram - Evict GPU SVM range to SRAM
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + *
> > > + * Similar to __drm_gpusvm_migrate_to_sram but does not
> require
> > > mmap lock and
> > > + * migration done via migrate_device_* functions. Fallback path
> as it
> > > is
> > > + * preferred to issue migrations with mmap lock.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +static int drm_gpusvm_evict_to_sram(struct drm_gpusvm
> *gpusvm,
> > > +				    struct drm_gpusvm_range *range)
> > > +{
> > > +	unsigned long npages;
> > > +	struct page **pages;
> > > +	unsigned long *src, *dst;
> > > +	dma_addr_t *dma_addr;
> > > +	void *buf;
> > > +	int i, err =3D 0;
> > > +
> > > +	npages =3D npages_in_range(range->va.start, range->va.end);
> > > +
> > > +	buf =3D kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> > > +		       sizeof(*pages), GFP_KERNEL);
> > > +	if (!buf) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_out;
> > > +	}
> > > +	src =3D buf;
> > > +	dst =3D buf + (sizeof(*src) * npages);
> > > +	dma_addr =3D buf + (2 * sizeof(*src) * npages);
> > > +	pages =3D buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> > > +
> > > +	err =3D gpusvm->ops->populate_vram_pfn(gpusvm, range-
> > > >vram_allocation,
> > > +					     npages, src);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	err =3D migrate_device_vma_range(gpusvm->mm,
> > > +				       gpusvm-
> > > >device_private_page_owner, src,
> > > +				       npages, range->va.start);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	err =3D drm_gpusvm_migrate_populate_sram_pfn(NULL,
> > > npages, src, dst, 0);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	err =3D drm_gpusvm_migrate_map_pages(gpusvm->drm->dev,
> > > dma_addr,
> > > +					   dst, npages,
> > > DMA_BIDIRECTIONAL);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	for (i =3D 0; i < npages; ++i)
> > > +		pages[i] =3D migrate_pfn_to_page(src[i]);
> > > +
> > > +	err =3D gpusvm->ops->copy_to_sram(gpusvm, pages,
> > > dma_addr, npages);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +err_finalize:
> > > +	if (err)
> > > +		drm_gpusvm_migration_put_pages(npages, dst);
> > > +	migrate_device_pages(src, dst, npages);
> > > +	migrate_device_finalize(src, dst, npages);
> > > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev,
> > > dma_addr, npages,
> > > +				       DMA_BIDIRECTIONAL);
> > > +err_free:
> > > +	kvfree(buf);
> > > +err_out:
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +/**
> > > + * __drm_gpusvm_migrate_to_sram - Migrate GPU SVM range
> to
> > > SRAM (internal)
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @vas: Pointer to the VM area structure
> > > + * @page: Pointer to the page for fault handling (can be NULL)
> > > + * @start: Start address of the migration range
> > > + * @end: End address of the migration range
> > > + *
> > > + * This internal function performs the migration of the specified
> GPU
> > > SVM range
> > > + * to SRAM. It sets up the migration, populates + dma maps
> SRAM
> > > PFNs, and
> > > + * invokes the driver-specific operations for migration to SRAM.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm
> > > *gpusvm,
> > > +					struct vm_area_struct *vas,
> > > +					struct page *page,
> > > +					u64 start, u64 end)
> > > +{
> > > +	struct migrate_vma migrate =3D {
> > > +		.vma		=3D vas,
> > > +		.pgmap_owner	=3D gpusvm-
> > > >device_private_page_owner,
> > > +		.flags		=3D
> > > MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > > +		.fault_page	=3D page,
> > > +	};
> > > +	unsigned long npages;
> > > +	struct page **pages;
> > > +	dma_addr_t *dma_addr;
> > > +	void *buf;
> > > +	int i, err =3D 0;
> > > +
> > > +	mmap_assert_locked(gpusvm->mm);
> > > +
> > > +	/* Corner where VMA area struct has been partially
> > > unmapped */
> > > +	if (start < vas->vm_start)
> > > +		start =3D vas->vm_start;
> > > +	if (end > vas->vm_end)
> > > +		end =3D vas->vm_end;
> > > +
> > > +	migrate.start =3D start;
> > > +	migrate.end =3D end;
> > > +	npages =3D npages_in_range(start, end);
> > > +
> > > +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr) +
> > > +		       sizeof(*pages), GFP_KERNEL);
> > > +	if (!buf) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_out;
> > > +	}
> > > +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > > +	pages =3D buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr))
> > > * npages;
> > > +
> > > +	migrate.vma =3D vas;
> > > +	migrate.src =3D buf;
> > > +	migrate.dst =3D migrate.src + npages;
> > > +
> > > +	err =3D migrate_vma_setup(&migrate);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	/* Raced with another CPU fault, nothing to do */
> > > +	if (!migrate.cpages)
> > > +		goto err_free;
> > > +
> > > +	err =3D drm_gpusvm_migrate_populate_sram_pfn(vas, npages,
> > > +						   migrate.src,
> > > migrate.dst,
> > > +						   start);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	err =3D drm_gpusvm_migrate_map_pages(gpusvm->drm->dev,
> > > dma_addr,
> > > +					   migrate.dst, npages,
> > > +					   DMA_BIDIRECTIONAL);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	for (i =3D 0; i < npages; ++i)
> > > +		pages[i] =3D migrate_pfn_to_page(migrate.src[i]);
> > > +
> > > +	err =3D gpusvm->ops->copy_to_sram(gpusvm, pages,
> > > dma_addr, npages);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +err_finalize:
> > > +	if (err)
> > > +		drm_gpusvm_migration_put_pages(npages,
> > > migrate.dst);
> > > +	migrate_vma_pages(&migrate);
> > > +	migrate_vma_finalize(&migrate);
> > > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev,
> > > dma_addr, npages,
> > > +				       DMA_BIDIRECTIONAL);
> > > +err_free:
> > > +	kvfree(buf);
> > > +err_out:
> > > +	mmap_assert_locked(gpusvm->mm);
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_to_sram - Migrate (evict) GPU SVM
> range
> > > to SRAM
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @range: Pointer to the GPU SVM range structure
> > > + * @ctx: GPU SVM context
> > > + *
> > > + * This function initiates the migration of the specified GPU SVM
> > > range to
> > > + * SRAM. It performs necessary checks and invokes the internal
> > > migration
> > > + * function for actual migration.
> > > + *
> > > + * Returns:
> > > + * 0 on success, negative error code on failure.
> > > + */
> > > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm
> *gpusvm,
> > > +			       struct drm_gpusvm_range *range,
> > > +			       const struct drm_gpusvm_ctx *ctx)
> > > +{
> > > +	u64 start =3D range->va.start, end =3D range->va.end;
> > > +	struct mm_struct *mm =3D gpusvm->mm;
> > > +	struct vm_area_struct *vas;
> > > +	int err;
> > > +	bool retry =3D false;
> > > +
> > > +	if (!ctx->mmap_locked) {
> > > +		if (!mmget_not_zero(mm)) {
> > > +			err =3D -EFAULT;
> > > +			goto err_out;
> > > +		}
> > > +		if (ctx->trylock_mmap) {
> > > +			if (!mmap_read_trylock(mm))  {
> > > +				err =3D
> > > drm_gpusvm_evict_to_sram(gpusvm, range);
> > > +				goto err_mmput;
> > > +			}
> > > +		} else {
> > > +			mmap_read_lock(mm);
> > > +		}
> > > +	}
> > > +
> > > +	mmap_assert_locked(mm);
> > > +
> > > +	/*
> > > +	 * Loop required to find all VMA area structs for the corner
> > > case when
> > > +	 * VRAM backing has been partially unmapped from MM's
> > > address space.
> > > +	 */
> > > +again:
> > > +	vas =3D find_vma(mm, start);
> > > +	if (!vas) {
> > > +		if (!retry)
> > > +			err =3D -ENOENT;
> > > +		goto err_mmunlock;
> > > +	}
> > > +
> > > +	if (end <=3D vas->vm_start || start >=3D vas->vm_end) {
> > > +		if (!retry)
> > > +			err =3D -EINVAL;
> > > +		goto err_mmunlock;
> > > +	}
> > > +
> > > +	err =3D __drm_gpusvm_migrate_to_sram(gpusvm, vas, NULL,
> > > start, end);
> > > +	if (err)
> > > +		goto err_mmunlock;
> > > +
> > > +	if (vas->vm_end < end) {
> > > +		retry =3D true;
> > > +		start =3D vas->vm_end;
> > > +		goto again;
> > > +	}
> > > +
> > > +	if (!ctx->mmap_locked) {
> > > +		mmap_read_unlock(mm);
> > > +		/*
> > > +		 * Using mmput_async as this function can be called
> > > while
> > > +		 * holding a dma-resv lock, and a final put can grab the
> > > mmap
> > > +		 * lock, causing a lock inversion.
> > > +		 */
> > > +		mmput_async(mm);
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +err_mmunlock:
> > > +	if (!ctx->mmap_locked)
> > > +		mmap_read_unlock(mm);
> > > +err_mmput:
> > > +	if (!ctx->mmap_locked)
> > > +		mmput_async(mm);
> > > +err_out:
> > > +	return err;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_page_free - Put GPU SVM zone device data
> > > associated with a page
> > > + * @page: Pointer to the page
> > > + *
> > > + * This function is a callback used to put the GPU SVM zone
> device
> > > data
> > > + * associated with a page when it is being released.
> > > + */
> > > +static void drm_gpusvm_page_free(struct page *page)
> > > +{
> > > +	drm_gpusvm_zdd_put(page->zone_device_data);
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to
> RAM
> > > (page fault handler)
> > > + * @vmf: Pointer to the fault information structure
> > > + *
> > > + * This function is a page fault handler used to migrate a GPU
> SVM
> > > range to RAM.
> > > + * It retrieves the GPU SVM range information from the faulting
> > > page and invokes
> > > + * the internal migration function to migrate the range back to
> RAM.
> > > + *
> > > + * Returns:
> > > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > > + */
> > > +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault
> > > *vmf)
> > > +{
> > > +	struct drm_gpusvm_zdd *zdd =3D vmf->page-
> > > >zone_device_data;
> > > +	int err;
> > > +
> > > +	err =3D __drm_gpusvm_migrate_to_sram(zdd->range-
> > > >gpusvm,
> > > +					   vmf->vma, vmf->page,
> > > +					   zdd->range->va.start,
> > > +					   zdd->range->va.end);
> > > +
> > > +	return err ? VM_FAULT_SIGBUS : 0;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_pagemap_ops - Device page map operations for
> > > GPU SVM
> > > + */
> > > +static const struct dev_pagemap_ops
> drm_gpusvm_pagemap_ops =3D
> > > {
> > > +	.page_free =3D drm_gpusvm_page_free,
> > > +	.migrate_to_ram =3D drm_gpusvm_migrate_to_ram,
> > > +};
> > > +
> > > +/**
> > > + * drm_gpusvm_pagemap_ops_get - Retrieve GPU SVM device
> > > page map operations
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM device page map operations structure.
> > > + */
> > > +const struct dev_pagemap_ops
> > > *drm_gpusvm_pagemap_ops_get(void)
> > > +{
> > > +	return &drm_gpusvm_pagemap_ops;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_has_mapping - Check if GPU SVM has mapping
> for
> > > the given address range
> > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > + * @start: Start address
> > > + * @end: End address
> > > + *
> > > + * Returns:
> > > + * True if GPU SVM has mapping, False otherwise
> > > + */
> > > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm,
> u64
> > > start, u64 end)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +
> > > +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end)
> > > {
> > > +		struct drm_gpusvm_range *range =3D NULL;
> > > +
> > > +		drm_gpusvm_for_each_range(range, notifier, start,
> > > end)
> > > +			return true;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/drm_gpusvm.h
> > > b/drivers/gpu/drm/xe/drm_gpusvm.h
> > > new file mode 100644
> > > index 000000000000..0ea70f8534a8
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/drm_gpusvm.h
> > > @@ -0,0 +1,415 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright =A9 2024 Intel Corporation
> > > + */
> > > +
> > > +#ifndef __DRM_GPUSVM_H__
> > > +#define __DRM_GPUSVM_H__
> > > +
> > > +#include <linux/kref.h>
> > > +#include <linux/mmu_notifier.h>
> > > +#include <linux/workqueue.h>
> > > +
> > > +struct dev_pagemap_ops;
> > > +struct drm_device;
> > > +struct drm_gpusvm;
> > > +struct drm_gpusvm_notifier;
> > > +struct drm_gpusvm_ops;
> > > +struct drm_gpusvm_range;
> > > +
> > > +/**
> > > + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> > > + *
> > > + * This structure defines the operations for GPU Shared Virtual
> > > Memory (SVM).
> > > + * These operations are provided by the GPU driver to manage
> SVM
> > > ranges and
> > > + * perform operations such as migration between VRAM and
> system
> > > RAM.
> > > + */
> > > +struct drm_gpusvm_ops {
> > > +	/**
> > > +	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
> > > +	 *
> > > +	 * This function shall allocate a GPU SVM notifier.
> > > +	 *
> > > +	 * Returns:
> > > +	 * Pointer to the allocated GPU SVM notifier on success, NULL
> > > on failure.
> > > +	 */
> > > +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> > > +
> > > +	/**
> > > +	 * @notifier_free: Free a GPU SVM notifier (optional)
> > > +	 * @notifier: Pointer to the GPU SVM notifier to be freed
> > > +	 *
> > > +	 * This function shall free a GPU SVM notifier.
> > > +	 */
> > > +	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
> > > +
> > > +	/**
> > > +	 * @range_alloc: Allocate a GPU SVM range (optional)
> > > +	 * @gpusvm: Pointer to the GPU SVM
> > > +	 *
> > > +	 * This function shall allocate a GPU SVM range.
> > > +	 *
> > > +	 * Returns:
> > > +	 * Pointer to the allocated GPU SVM range on success, NULL
> > > on failure.
> > > +	 */
> > > +	struct drm_gpusvm_range *(*range_alloc)(struct
> > > drm_gpusvm *gpusvm);
> > > +
> > > +	/**
> > > +	 * @range_free: Free a GPU SVM range (optional)
> > > +	 * @range: Pointer to the GPU SVM range to be freed
> > > +	 *
> > > +	 * This function shall free a GPU SVM range.
> > > +	 */
> > > +	void (*range_free)(struct drm_gpusvm_range *range);
> > > +
> > > +	/**
> > > +	 * @vram_release: Release VRAM allocation (optional)
> > > +	 * @vram_allocation: Driver-private pointer to the VRAM
> > > allocation
> > > +	 *
> > > +	 * This function shall release VRAM allocation and expects to
> > > drop a
> > > +	 * reference to VRAM allocation.
> > > +	 */
> > > +	void (*vram_release)(void *vram_allocation);
> > > +
> > > +	/**
> > > +	 * @populate_vram_pfn: Populate VRAM PFN (required for
> > > migration)
> > > +	 * @gpusvm: Pointer to the GPU SVM
> > > +	 * @vram_allocation: Driver-private pointer to the VRAM
> > > allocation
> > > +	 * @npages: Number of pages to populate
> > > +	 * @pfn: Array of page frame numbers to populate
> > > +	 *
> > > +	 * This function shall populate VRAM page frame numbers
> > > (PFN).
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code on failure.
> > > +	 */
> > > +	int (*populate_vram_pfn)(struct drm_gpusvm *gpusvm,
> > > +				 void *vram_allocation,
> > > +				 unsigned long npages,
> > > +				 unsigned long *pfn);
> > > +
> > > +	/**
> > > +	 * @copy_to_vram: Copy to VRAM (required for migration)
> > > +	 * @gpusvm: Pointer to the GPU SVM
> > > +	 * @pages: Pointer to array of VRAM pages (destination)
> > > +	 * @dma_addr: Pointer to array of DMA addresses (source)
> > > +	 * @npages: Number of pages to copy
> > > +	 *
> > > +	 * This function shall copy pages to VRAM.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code on failure.
> > > +	 */
> > > +	int (*copy_to_vram)(struct drm_gpusvm *gpusvm,
> > > +			    struct page **pages,
> > > +			    dma_addr_t *dma_addr,
> > > +			    unsigned long npages);
> > > +
> > > +	/**
> > > +	 * @copy_to_sram: Copy to system RAM (required for
> > > migration)
> > > +	 * @gpusvm: Pointer to the GPU SVM
> > > +	 * @pages: Pointer to array of VRAM pages (source)
> > > +	 * @dma_addr: Pointer to array of DMA addresses
> > > (destination)
> > > +	 * @npages: Number of pages to copy
> > > +	 *
> > > +	 * This function shall copy pages to system RAM.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code on failure.
> > > +	 */
> > > +	int (*copy_to_sram)(struct drm_gpusvm *gpusvm,
> > > +			    struct page **pages,
> > > +			    dma_addr_t *dma_addr,
> > > +			    unsigned long npages);
> > > +
> > > +	/**
> > > +	 * @invalidate: Invalidate GPU SVM notifier (required)
> > > +	 * @gpusvm: Pointer to the GPU SVM
> > > +	 * @notifier: Pointer to the GPU SVM notifier
> > > +	 * @mmu_range: Pointer to the mmu_notifier_range
> > > structure
> > > +	 *
> > > +	 * This function shall invalidate the GPU page tables. It can
> > > safely
> > > +	 * walk the notifier range RB tree/list in this function. Called
> > > while
> > > +	 * holding the notifier lock.
> > > +	 */
> > > +	void (*invalidate)(struct drm_gpusvm *gpusvm,
> > > +			   struct drm_gpusvm_notifier *notifier,
> > > +			   const struct mmu_notifier_range
> > > *mmu_range);
> > > +};
> > > +
> > > +/**
> > > + * struct drm_gpusvm_notifier - Structure representing a GPU
> SVM
> > > notifier
> > > + *
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: MMU interval notifier
> > > + * @interval: Interval for the notifier
> > > + * @rb: Red-black tree node for the parent GPU SVM structure
> > > notifier tree
> > > + * @root: Cached root node of the RB tree containing ranges
> > > + * @range_list: List head containing of ranges in the same order
> they
> > > appear in
> > > + *              interval tree. This is useful to keep iterating rang=
es while
> > > + *              doing modifications to RB tree.
> > > + * @flags.removed: Flag indicating whether the MMU interval
> > > notifier has been
> > > + *                 removed
> > > + *
> > > + * This structure represents a GPU SVM notifier.
> > > + */
> > > +struct drm_gpusvm_notifier {
> > > +	struct drm_gpusvm *gpusvm;
> > > +	struct mmu_interval_notifier notifier;
> > > +	struct {
> > > +		u64 start;
> > > +		u64 end;
> > > +	} interval;
> > > +	struct {
> > > +		struct rb_node node;
> > > +		struct list_head entry;
> > > +		u64 __subtree_last;
> > > +	} rb;
> > > +	struct rb_root_cached root;
> > > +	struct list_head range_list;
> > > +	struct {
> > > +		u32 removed : 1;
> > > +	} flags;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_gpusvm_range - Structure representing a GPU
> SVM
> > > range
> > > + *
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @notifier: Pointer to the GPU SVM notifier
> > > + * @refcount: Reference count for the range
> > > + * @rb: Red-black tree node for the parent GPU SVM notifier
> > > structure range tree
> > > + * @va: Virtual address range
> > > + * @notifier_seq: Notifier sequence number of the range's
> pages
> > > + * @pages: Pointer to the array of pages (if backing store is in
> VRAM)
> > > + * @dma_addr: DMA address array (if backing store is SRAM and
> > > DMA mapped)
> > > + * @vram_allocation: Driver-private pointer to the VRAM
> allocation
> > > + * @order: Order of dma mapping. i.e. PAGE_SIZE << order is
> > > mapping size
> > > + * @flags.migrate_vram: Flag indicating whether the range can
> be
> > > migrated to VRAM
> > > + * @flags.unmapped: Flag indicating if the range has been
> > > unmapped
> > > + * @flags.partial_unmap: Flag indicating if the range has been
> > > partially unmapped
> > > + * @flags.has_vram_pages: Flag indicating if the range has vram
> > > pages
> > > + * @flags.has_dma_mapping: Flag indicating if the range has a
> DMA
> > > mapping
> > > + * @flags.kfree_mapping: Flag indicating @dma_addr is a
> compact
> > > allocation based
> > > + *                       on @order which releases via kfree
> > > + *
> > > + * This structure represents a GPU SVM range used for tracking
> > > memory ranges
> > > + * mapped in a DRM device.
> > > + */
> > > +struct drm_gpusvm_range {
> > > +	struct drm_gpusvm *gpusvm;
> > > +	struct drm_gpusvm_notifier *notifier;
> > > +	struct kref refcount;
> > > +	struct {
> > > +		struct rb_node node;
> > > +		struct list_head entry;
> > > +		u64 __subtree_last;
> > > +	} rb;
> > > +	struct {
> > > +		u64 start;
> > > +		u64 end;
> > > +	} va;
> > > +	unsigned long notifier_seq;
> > > +	union {
> > > +		struct page **pages;
> > > +		dma_addr_t *dma_addr;
> > > +	};
> > > +	void *vram_allocation;
> > > +	u16 order;
> > > +	struct {
> > > +		/* All flags below must be set upon creation */
> > > +		u16 migrate_vram : 1;
> > > +		/* All flags below must be set / cleared under notifier
> > > lock */
> > > +		u16 unmapped : 1;
> > > +		u16 partial_unmap : 1;
> > > +		u16 has_vram_pages : 1;
> > > +		u16 has_dma_mapping : 1;
> > > +		u16 kfree_mapping : 1;
> > > +	} flags;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_gpusvm - GPU SVM structure
> > > + *
> > > + * @name: Name of the GPU SVM
> > > + * @drm: Pointer to the DRM device structure
> > > + * @mm: Pointer to the mm_struct for the address space
> > > + * @device_private_page_owner: Device private pages owner
> > > + * @mm_start: Start address of GPU SVM
> > > + * @mm_range: Range of the GPU SVM
> > > + * @notifier_size: Size of individual notifiers
> > > + * @ops: Pointer to the operations structure for GPU SVM
> > > + * @chunk_sizes: Pointer to the array of chunk sizes used in
> range
> > > allocation.
> > > + *               Entries should be powers of 2 in descending order.
> > > + * @num_chunks: Number of chunks
> > > + * @notifier_lock: Read-write semaphore for protecting notifier
> > > operations
> > > + * @zdd_wq: Workqueue for deferred work on zdd destruction
> > > + * @root: Cached root node of the Red-Black tree containing
> GPU
> > > SVM notifiers
> > > + * @notifier_list: list head containing of notifiers in the same
> order
> > > they
> > > + *                 appear in interval tree. This is useful to keep i=
terating
> > > + *                 notifiers while doing modifications to RB tree.
> > > + *
> > > + * This structure represents a GPU SVM (Shared Virtual Memory)
> > > used for tracking
> > > + * memory ranges mapped in a DRM (Direct Rendering Manager)
> > > device.
> > > + *
> > > + * No reference counting is provided, as this is expected to be
> > > embedded in the
> > > + * driver VM structure along with the struct drm_gpuvm, which
> > > handles reference
> > > + * counting.
> > > + */
> > > +struct drm_gpusvm {
> > > +	const char *name;
> > > +	struct drm_device *drm;
> > > +	struct mm_struct *mm;
> > > +	void *device_private_page_owner;
> > > +	u64 mm_start;
> > > +	u64 mm_range;
> > > +	u64 notifier_size;
> > > +	const struct drm_gpusvm_ops *ops;
> > > +	const u64 *chunk_sizes;
> > > +	int num_chunks;
> > > +	struct rw_semaphore notifier_lock;
> > > +	struct workqueue_struct *zdd_wq;
> > > +	struct rb_root_cached root;
> > > +	struct list_head notifier_list;
> > > +};
> >
> > I also think the gpusvm concept is a duplication of the drm_gpuvm.
> > Look at the members here, mm_start, mm_range, rb_tree...
> >
> > Maintaining a list of notifier at this layer is odd. Everybody else
> seems
> > Embed the notifier in a range...
> >
> > Mm field is essential for svm though. I think what we can do is,
> introduce a
> > *mm field in drm_gpuvm and introduce uAPI to allow user to say
> one gpuvm
> > Participate svm. If one gpuvm participate svm, we set the mm field
> for this
> > Gpuvm.
> >
> > Another benefit of the proposed way is, multiple gpuvms can share
> address space
> > With single cpu mm process.
> >
> >
> > Oak
> >
> >
> > > +
> > > +/**
> > > + * struct drm_gpusvm_ctx - DRM GPU SVM context
> > > + *
> > > + * @mmap_locked: mmap lock is locked
> > > + * @trylock_mmap: trylock mmap lock, used to avoid locking
> > > inversions
> > > + *                (e.g.dma-revs -> mmap lock)
> > > + * @in_notifier: entering from a MMU notifier
> > > + * @read_only: operating on read-only memory
> > > + * @vram_possible: possible to use VRAM
> > > + * @prefault: prefault pages
> > > + *
> > > + * Context that is DRM GPUSVM is operating in (i.e. user
> arguments).
> > > + */
> > > +struct drm_gpusvm_ctx {
> > > +	u32 mmap_locked :1;
> > > +	u32 trylock_mmap :1;
> > > +	u32 in_notifier :1;
> > > +	u32 read_only :1;
> > > +	u32 vram_possible :1;
> > > +	u32 prefault :1;
> > > +};
> > > +
> > > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > > +		    const char *name, struct drm_device *drm,
> > > +		    struct mm_struct *mm, void
> > > *device_private_page_owner,
> > > +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> > > +		    const struct drm_gpusvm_ops *ops,
> > > +		    const u64 *chunk_sizes, int num_chunks);
> > > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> > > +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> > > +
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm
> *gpusvm,
> > > u64 fault_addr,
> > > +				u64 gpuva_start, u64 gpuva_end,
> > > +				const struct drm_gpusvm_ctx *ctx);
> > > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > > +			     struct drm_gpusvm_range *range);
> > > +
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> > > +void drm_gpusvm_range_put(struct drm_gpusvm_range
> *range);
> > > +
> > > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm
> *gpusvm,
> > > +				  struct drm_gpusvm_range *range);
> > > +
> > > +int drm_gpusvm_range_get_pages(struct drm_gpusvm
> *gpusvm,
> > > +			       struct drm_gpusvm_range *range,
> > > +			       const struct drm_gpusvm_ctx *ctx);
> > > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm
> > > *gpusvm,
> > > +				  struct drm_gpusvm_range *range,
> > > +				  const struct drm_gpusvm_ctx *ctx);
> > > +
> > > +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm
> *gpusvm,
> > > +			       struct drm_gpusvm_range *range,
> > > +			       void *vram_allocation,
> > > +			       const struct drm_gpusvm_ctx *ctx);
> > > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm
> *gpusvm,
> > > +			       struct drm_gpusvm_range *range,
> > > +			       const struct drm_gpusvm_ctx *ctx);
> > > +
> > > +const struct dev_pagemap_ops
> > > *drm_gpusvm_pagemap_ops_get(void);
> > > +
> > > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm,
> u64
> > > start, u64 end);
> > > +
> > > +struct drm_gpusvm_range *
> > > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier,
> u64
> > > start, u64 end);
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_lock - Lock GPU SVM notifier
> > > + * @gpusvm__: Pointer to the GPU SVM structure.
> > > + *
> > > + * Abstract client usage GPU SVM notifier lock, take lock
> > > + */
> > > +#define drm_gpusvm_notifier_lock(gpusvm__)	\
> > > +	down_read(&(gpusvm__)->notifier_lock)
> > > +
> > > +/**
> > > + * drm_gpusvm_notifier_unlock - Unlock GPU SVM notifier
> > > + * @gpusvm__: Pointer to the GPU SVM structure.
> > > + *
> > > + * Abstract client usage GPU SVM notifier lock, drop lock
> > > + */
> > > +#define drm_gpusvm_notifier_unlock(gpusvm__)	\
> > > +	up_read(&(gpusvm__)->notifier_lock)
> > > +
> > > +/**
> > > + * __drm_gpusvm_range_next - Get the next GPU SVM range in
> the
> > > list
> > > + * @range: a pointer to the current GPU SVM range
> > > + *
> > > + * Return: A pointer to the next drm_gpusvm_range if available,
> or
> > > NULL if the
> > > + *         current range is the last one or if the input range is NU=
LL.
> > > + */
> > > +static inline struct drm_gpusvm_range *
> > > +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
> > > +{
> > > +	if (range && !list_is_last(&range->rb.entry,
> > > +				   &range->notifier->range_list))
> > > +		return list_next_entry(range, rb.entry);
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +/**
> > > + * drm_gpusvm_for_each_range - Iterate over GPU SVM ranges
> in a
> > > notifier
> > > + * @range__: Iterator variable for the ranges. If set, it indicates
> the
> > > start of
> > > + *	     the iterator. If NULL, call drm_gpusvm_range_find() to get
> > > the range.
> > > + * @notifier__: Pointer to the GPU SVM notifier
> > > + * @start__: Start address of the range
> > > + * @end__: End address of the range
> > > + *
> > > + * This macro is used to iterate over GPU SVM ranges in a notifier.
> It
> > > is safe
> > > + * to use while holding the driver SVM lock or the notifier lock.
> > > + */
> > > +#define drm_gpusvm_for_each_range(range__, notifier__,
> start__,
> > > end__)	\
> > > +	for ((range__) =3D (range__) ?:
> > > 	\
> > > +	     drm_gpusvm_range_find((notifier__), (start__), (end__));
> > > 	\
> > > +	     (range__) && (range__->va.start < (end__));
> > > 	\
> > > +	     (range__) =3D __drm_gpusvm_range_next(range__))
> > > +
> > > +/**
> > > + * drm_gpusvm_range_set_unmapped - Mark a GPU SVM range
> as
> > > unmapped
> > > + * @range: Pointer to the GPU SVM range structure.
> > > + * @mmu_range: Pointer to the MMU notifier range structure.
> > > + *
> > > + * This function marks a GPU SVM range as unmapped and sets
> the
> > > partial_unmap flag
> > > + * if the range partially falls within the provided MMU notifier
> range.
> > > + */
> > > +static inline void
> > > +drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range
> > > *range,
> > > +			      const struct mmu_notifier_range
> > > *mmu_range)
> > > +{
> > > +	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> > > +
> > > +	range->flags.unmapped =3D true;
> > > +	if (range->va.start < mmu_range->start ||
> > > +	    range->va.end > mmu_range->end)
> > > +		range->flags.partial_unmap =3D true;
> > > +}
> > > +
> > > +#endif /* __DRM_GPUSVM_H__ */
> > > --
> > > 2.34.1
> >
>=20
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
