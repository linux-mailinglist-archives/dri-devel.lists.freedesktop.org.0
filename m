Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DFE9958D1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 22:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E0310E5C0;
	Tue,  8 Oct 2024 20:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mb+Ucf/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0F010E5BD;
 Tue,  8 Oct 2024 20:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728420923; x=1759956923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1+Uwh0cRkARIWOuVhj+wK2n/rxu4h5DnfnrxzWw2Xbo=;
 b=mb+Ucf/uvJwHgTVSbDHlyy3lwnV/Hry5kv4G1WXib2He3oRtSrPs18sK
 I38KBwoKDjojy/tVPpnijLlHvun/9FIyZEPUXHw/0rXvzdb3XGEdLYkpc
 ozxZbm7UAkFyv/zEfDrFJq865O446yUdaY6vW6O/cI67+RpJKsuvN7psV
 YtCOAhjRWMDQVMh5hi9zWE6HRuxlU8fl9eUs8Ie/FOITYmVjIu9y5zozM
 P6silpCap73nA4sQSTZMIPlLmjEVIWbAIGXhh2qF0lNP4BG3qmswS9E64
 uGlKfiZ0fyV57PwJzkcz0qGaSTvxv2wMc8/B5AspBPVxkCRs3vbPWC1Mh Q==;
X-CSE-ConnectionGUID: 8QnQMEOLShKDnyHEE85Hcw==
X-CSE-MsgGUID: tiOy+QFdScK+yJPpz1+v0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="30540622"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="30540622"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 13:55:22 -0700
X-CSE-ConnectionGUID: wDKOgLtqRXiufk3V+jppAw==
X-CSE-MsgGUID: 7yPteYL8S1KSsLFZrOqGMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="79961438"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 13:55:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 13:55:21 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 13:55:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 13:55:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 13:55:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eElkbvjbPKuPD6A3RKVyJQZbUt/tODjnnrr7frr8j27UOnxchJB5SNpFbbRruIW4K0lCiuGiZKB67wOHdKv7N1p/zBx939Fok3Y+KaUiVAos/xWWMz6NeoYVV/F1CLu6zO3u/MrF2Dgh1QRDVrksMw66oB94iunvTvbBjVlO3UxueKFfh5LeKJv9yvpb8mNGvrJjSQ9FbPbjzRGEg2Vg1WpMW9kpA/0fBi1l4Nr3m/+dAkInbmh0OMoZea+vIyKAuS6JEJ7H4UkORdhjBP3Do1jlagtIMl679/JecmEnkCBsDuhZ495K7AKenKN0E4QE01oKl31D+nWi8AoUjBlQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrzpoi1XyhTJge7hV9iv0SsFoxNo3Ax4K1fPDyZb7ow=;
 b=I9BCNAJ/v/ko8y/GIK0ENtfRmkuZXNlqj33U1w51kXhInKj7w0RoYqFQ8z6t6IJnUViNbNXmaE8e27puLVwlmz/qzqVYJKGdsQ9ynRS5gN/Zpk0u6tNOxNZRaDTzHSmE0i6xhxEvA27QSTrmefLqBWcM0X41fG5GFkRWP4aSUcPhnVmC/ZSQW9rPbwTOkN57yaKbh1FdWXnsBdJgrUlVrwzomlVxIZDsWvux01bQVrXit1xJFMkTjyVGJAu0ZDY9C0lIbrxd3lEho7pcEjhbAq4Xx/qjxKxR2uy7as6ghTvP7PT1jahBM54rK2OZea6YptpLT6Mz9CDGh+BKncASSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 20:55:11 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 20:55:09 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, lkp
 <lkp@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 03/12] drm/fbdev-dma: Select FB_DEFERRED_IO
Thread-Topic: [PATCH v3 03/12] drm/fbdev-dma: Select FB_DEFERRED_IO
Thread-Index: AQHbGXqpmFMvkE0CokOI0NXBNPm7fbJ9R7DQ
Date: Tue, 8 Oct 2024 20:55:09 +0000
Message-ID: <CH0PR11MB54444DAC524694F45BC68F7DE57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-4-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-4-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB7278:EE_
x-ms-office365-filtering-correlation-id: 000efd4e-2ce2-469c-cc16-08dce7db7eec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?INstQ7Ggfsq+SaCT8kw1u8wuOv9fa5AYIV0dxlSgCDKsQnMCePXgZFSO7zMk?=
 =?us-ascii?Q?WGU5Zb7BXVf+XJJ2M4Sx8zEg3mLNIqqfLP2qGz6gvlnh79S42r+h+G0RHsLK?=
 =?us-ascii?Q?rWCqRGy/er4IavNy8O8wzhaI1/wC3aJN/78EoOEyE+sUOHfqoJvNX2ntdVuc?=
 =?us-ascii?Q?glje5Hj1yBnPPoZOLjbstSMwe4bMI79lwCRQwEc9Deo6AJDjoiSRZ8iWxPJs?=
 =?us-ascii?Q?T5roRRR2SZTJblrmjNuohvopYXcvMVQrEPkSyhaF0zxU2jdCPPtNsnae5zeS?=
 =?us-ascii?Q?FqXTQ0Hv+uyzuSz8YaG0N/OdpwqbuUtBwi16sx9xhrS02c7joGeEMpkePApH?=
 =?us-ascii?Q?SnS+rPWiy5zPjLHtN2KuxhF8s6BKRLeKT4kpyDntu5COg2NFvv1tP1g3G1VR?=
 =?us-ascii?Q?5NY+fxMhNRLYhf3zS8POlH0pNCCjxvliJsuLsOwtfhzIlerA6KgL2honoNBV?=
 =?us-ascii?Q?7Na/xAr6wWZYXhHxZ1Wsimn0OedYejBTioYYLEicRUSgB8xizMfsFfAbZM8h?=
 =?us-ascii?Q?lDV8W3BFxLiSmM4am8RzGaTBTwOTgh+7VtffykUsGyWUuRY5bik8FVp9h3E0?=
 =?us-ascii?Q?RxwQ/ogUSbnr08/d3qV2jtOySjgjOFK9RGjZLWBSYCpuHpXCjI2YVIDhiWiN?=
 =?us-ascii?Q?gLN2HoNhVn1+evVNWYCPYL6h6FDK1c3HdW8MPKYtWlel7IODwjHpAn+Nhxql?=
 =?us-ascii?Q?8ZDtJtGmrs5lBQ5SLYY3XeGynhRBAFENE3nFb3sk0/bCEc06Ccyoi1/IwS8R?=
 =?us-ascii?Q?UqH7tkYs5jxe2xL64UK5w9pbObpDXcwR+44uLFmoeNhfbcp0IfSoQdO4JOhe?=
 =?us-ascii?Q?WR+K14RAw1TKzO+kifPLAIOiHDcznhCY1w6TYhWD6KxABFixOOf5aLrDqU4F?=
 =?us-ascii?Q?6EMcBU+Ps6bx0UqFni2RTwaghtjN5z1DEoX6d+FCxkYoaaX7PtMTnoRVB0Lr?=
 =?us-ascii?Q?Dbot09X6c/yodcbAFSKUTKcF9rsmu9mWrQqY5gA5fBui8BxRepojcLXIOhfm?=
 =?us-ascii?Q?Pbp9x+BpPSWinqzh7gRGJAuEg4mjjyMz91V1oDRVlr92ZprA/ixk3LcbjYPU?=
 =?us-ascii?Q?LM+YM22eOc1Rt2HdEN3otGA88zsh3IiF7q0P62n9mEh4IohlL4anmnJuM1th?=
 =?us-ascii?Q?XJNTEnuOfWKVrj/2vPB8a8v3h8AFmKWkfpY7zSFJhhClDtIxSQ+Ahh4CXEHC?=
 =?us-ascii?Q?qj0F1j0XmTaMwjVc7hdkz0BElN9GA0cVk8rZ8VstIfbaCnz2v8y8ZeKCARj6?=
 =?us-ascii?Q?EEMeyKnjVcUj0h/M25EOE1N6pNlYGK1FfWPPugxvlRkhY2AKCUVSUCk+K+gm?=
 =?us-ascii?Q?if0uPvktEjySXUf3DUcvfxyht1Q1Od5J8RoDXXA8+Jhvag=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kvEAS363Iq4c6wuRiu+WHWtJdnkhvLcFx8Yms5iJ+3lSyHktYMs1gnn7yL1e?=
 =?us-ascii?Q?yZL5Be9YxCiySJ0ibyE47k0Gbj+IH8s2yGLTYqZ3ZFsnmBFtywiBtsyg8/lz?=
 =?us-ascii?Q?zAjTcWxcml+nVpBiIg8JYHXfENaU35+vAeOFu8cbZBMAKL6uiTm0cr+T5CN8?=
 =?us-ascii?Q?mfCRLHaR4dOCMcyeNAVlNQkj4GJuX/mhYW5sBUz4MBkUgA0pd20KbVJxhTX3?=
 =?us-ascii?Q?Kd3tZUxJKi1cLYitKqSdgL6QlBgi0zXnuhN5LNHISU97+IjhozXIDyj0Vui0?=
 =?us-ascii?Q?Njaa3hoUh1ti01448oJCjTSu69hP39tg1QFwVz8pKWnSDpLqn6Joey1g6J1O?=
 =?us-ascii?Q?oAR6B18lJkpmKOIFeTp9yd6Z4CZ6EZjYVX9+EDlJaDpQmAUgbQl4SoAX7krG?=
 =?us-ascii?Q?dGpWv0yiDj48l9OU2mFzdYMTigHKV2wuYC/tRAxSlelCNkL9i2CT/R1QISwS?=
 =?us-ascii?Q?ulmAJckJhXX3I/gxuyDKe7hH5F0lTEEo/IeW3Tj66WR+nxTigjVrw7gCyvk3?=
 =?us-ascii?Q?imWeVRFH9d9T3gMTQFHP+FNcdV5d6CwX+J5/kNZXNkba3CvIl2zqNfBF4gpY?=
 =?us-ascii?Q?PcJDY/vam3FnS1L3TPOM8PhGoub/AJhQFDnMUL1Y0TcLoSDult12BYBjZrd8?=
 =?us-ascii?Q?QiquHPMO5vuDsRszUbC00oPOR9XkBsSDcB4OfsKDBJIutnZpKAQtbANFw6on?=
 =?us-ascii?Q?IetE+J3KaVf788yEnNqZbS54IW6uR+Ol97J7TG6BgFIHXXk99SsU0xhgzirg?=
 =?us-ascii?Q?PPhZ6oN+pSTsEH7V1TWG/vCtwGg0XAI1UJ2UOXOHboMQ0Wv+mZLCvyVjLqrq?=
 =?us-ascii?Q?oGbJEcPCrhraJ6XpZdv9KdI7sT43N9CceNuVeWcPrrW7np3DBxyrRuVXBi/s?=
 =?us-ascii?Q?i6X8mNdDNpCgNJncpOBFN4oZCpN230pMFZgE5CLD2lgcD+ko4hb1Id9T0qdF?=
 =?us-ascii?Q?ru6I9L6tot3eQvBn8Ru6CYxPCi9zTIZ6Bx4WWZoT5wgxmNGFlH6MwR7lxKdU?=
 =?us-ascii?Q?tLRhmlkuZOr5odCHatOdbeGTd3TnKIdnqqtyjKbbGHX1hZ5oUv+ywFEbK28N?=
 =?us-ascii?Q?/RgL2NLAj9whB+1M9mPbHfUX5SEEtGz0JnWoXd5qKFfx7v5HS0q2m7/HRNT6?=
 =?us-ascii?Q?ccQqOvRw99GiwLOzRzcra4CKYU9G81mTG+mC0cy3dk1atEZM53QpaB0L7neO?=
 =?us-ascii?Q?VuFydWZ9aMKPjMJ+P1A+4eELYxgXA3KHGVYOAGXnnPYW6tpSR9ixS1pxoQF/?=
 =?us-ascii?Q?MXqCiGCJxlhVp7Y40ub/G8VItqLi69p8oAj7FCrCuoOFJNGA0/TF/I7ZPpXN?=
 =?us-ascii?Q?PEjausawcZWpVusF1TkNjvAnfeg45QoAfOi1ic1q1l7gxOR9waiZQIWliqeh?=
 =?us-ascii?Q?n5qVp0p8U3DilYbAJgjt81PslFT/IoEskQbeGmzSmGhQatrUeN/4DKpnQxRy?=
 =?us-ascii?Q?LPbXYPMv+a1eYPzo40DouF25ySzzT/osjWAJuKrggojoJpeFgh5GLI3tqa+S?=
 =?us-ascii?Q?6Uq0G00k38VDONSJEDtrBjEhQIE2VTx8GjkJlIQoqleMWw/bOQqu7e9XOVBd?=
 =?us-ascii?Q?9EF+O+qPD/IqJlzUW7JAvyAexYr/U0toIexTB59Xe71YvcWcQm4zQ4MTBZIB?=
 =?us-ascii?Q?Dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000efd4e-2ce2-469c-cc16-08dce7db7eec
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 20:55:09.2641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vYfcp9X1eNwBXt3ySRcInaROJyRQlTomPSzC4rHcU/UqwmZ9zQuxsPwViF1+hEIzITBt/GQ5EM6MrFuzeaMsMOdM2x06U9QFVA4jTOACW+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
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
From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Thom=
as Zimmermann
Sent: Tuesday, October 8, 2024 4:59 AM
To: simona@ffwll.ch; airlied@gmail.com; javierm@redhat.com; jfalempe@redhat=
.com
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-g=
fx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmermann=
 <tzimmermann@suse.de>; lkp <lkp@intel.com>; Maarten Lankhorst <maarten.lan=
khorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; stable@vger.ke=
rnel.org
Subject: [PATCH v3 03/12] drm/fbdev-dma: Select FB_DEFERRED_IO
>=20
> Commit 808a40b69468 ("drm/fbdev-dma: Implement damage handling and
> deferred I/O") added deferred I/O for fbdev-dma. Also select the
> Kconfig symbol FB_DEFERRED_IO (via FB_DMAMEM_HELPERS_DEFERRED). Fixes
> build errors about missing fbdefio, such as
>=20
> drivers/gpu/drm/drm_fbdev_dma.c:218:26: error: 'struct drm_fb_helper' has=
 no member named 'fbdefio'
>   218 |                 fb_helper->fbdefio.delay =3D HZ / 20;
>       |                          ^~
> drivers/gpu/drm/drm_fbdev_dma.c:219:26: error: 'struct drm_fb_helper' has=
 no member named 'fbdefio'
>   219 |                 fb_helper->fbdefio.deferred_io =3D drm_fb_helper_=
deferred_io;
>       |                          ^~
> drivers/gpu/drm/drm_fbdev_dma.c:221:21: error: 'struct fb_info' has no me=
mber named 'fbdefio'
>   221 |                 info->fbdefio =3D &fb_helper->fbdefio;
>       |                     ^~
> drivers/gpu/drm/drm_fbdev_dma.c:221:43: error: 'struct drm_fb_helper' has=
 no member named 'fbdefio'
>   221 |                 info->fbdefio =3D &fb_helper->fbdefio;
>       |                                           ^~
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410050241.Mox9QRjP-lkp@i=
ntel.com/
> Fixes: 808a40b69468 ("drm/fbdev-dma: Implement damage handling and deferr=
ed I/O")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: <stable@vger.kernel.org> # v6.11+

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 1df4e627e3d3..db2e206a117c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -338,7 +338,7 @@ config DRM_TTM_HELPER
>  config DRM_GEM_DMA_HELPER
>  	tristate
>  	depends on DRM
> -	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
> +	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>  	help
>  	  Choose this if you need the GEM DMA helper functions
> =20
> --=20
> 2.46.0
>=20
>=20
