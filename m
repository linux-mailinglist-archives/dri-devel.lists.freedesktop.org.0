Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59D4A71A1D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B363810E6F6;
	Wed, 26 Mar 2025 15:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxAUMu9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606810E6F6;
 Wed, 26 Mar 2025 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743002577; x=1774538577;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d2Lu8dMF2XAyh41YoyJLYdh8pJ1V+Vl5K7ImDVFk8aA=;
 b=WxAUMu9NKik/HrF+1+cGYwkCbMN67crF9BjmVIWLQuzp0eNzvkfwgrAY
 O0jphi3Ju1VPEnu9ys4SsBJD1rqGxuGR61fTuq6/jjnGLLrDsiUpu7aFu
 8APizhtKyd3ucwvh7lppbXUdsjyLwFAY1Ugd0Iorz9ktO/hgFKtw0lk48
 hia3RI1Md9pJGfZLe1l+jrZFhKuw6ZqEAMcnjCqavtpqcKGggLZzqbxu4
 6Zu9Ykljqlds3nj6wl3aMQ9aLRW5Rh1OF/vXab+Mf3NOn8PWKJjg1qD3s
 2DK7FcUJq/btQXO+THyAKAHLQ4s8ABW3vlF2ZdqP7jJrBhN0VgRWrYAWm g==;
X-CSE-ConnectionGUID: ZHeGJy7mR9u8wKlp+5sOJg==
X-CSE-MsgGUID: WZcFzek8R0eEA6zeG0kvMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55296826"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="55296826"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 08:22:40 -0700
X-CSE-ConnectionGUID: T1FRASn7R0GlSBlOixl/7Q==
X-CSE-MsgGUID: cPZXxwWVSlW/MleA363ZxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="155712074"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2025 08:22:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 08:22:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 08:22:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 08:22:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obIqrFe2nuPmpY3W8JtZ8Uny7gS3h1mg+FUrdWbBf6epmLMwPdyLXSa9fAGBglHtZtReZhxnZOJXNqSZAYvbUcdUmt9TiA02e5hoUwIwvqJPuIqnpaLweF/qgC1tJ6LV6etu5EPNbA6Cujd+Rtc5Ztx7hnyvyU7Qa52mqvKmbAgdRZt0m1XJgu0jmOk1rz3iBJZDyIzNrvJQzzz51x0a/AcgJhH+jfZLkoz4AROl4kKo3Wtq/3D9ZLkYRfgQ+AIi5NL8Lj8IZFMD+Km2KWjnr4I3M0rAXnNQvDTE9yY9EzLVswL2l8VZZUcFxIZLQ3EZK6pY8Yk2uculRvo/9yYnnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2Lu8dMF2XAyh41YoyJLYdh8pJ1V+Vl5K7ImDVFk8aA=;
 b=daq64Zd7DlfE6wmLZsjlCAE9VXcrCo7DeV9DWLcJa4AQQAbCa+S6mCk7YcrQQk8jLcTe5Q3GdSEcx7qn314oqXCkXeL6nEyjkgZ3Fy5pAe9lMfGOeCfzO6X6E1QOk+ZFjW4sEhMXtvQGKfgmf1VLC92EHnfy5J/T/4MtxBAFsoOkKAGPof30Nn3anGRPBdVcSRDTOIT6VXrXr9eJAGUBmpRDGxUT89RVlR8m2fng0Zs5ww+AK8lCI/fLNVWnlzr+BJ9/h++y+rc1nw2W81Efsa4ZF3DSpxN7avnbDQoSNAX0tDNqMA91Ttct8hsixd8mhm9s/L+flvz+W7ZGkoGu6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ5PPF1FF629472.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::818) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 15:22:37 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 15:22:37 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, 
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 00/11] mtd: add driver for Intel discrete graphics
Thread-Topic: [PATCH v6 00/11] mtd: add driver for Intel discrete graphics
Thread-Index: AQHbi35IQi39kKi940mYFiM9rsv6CLN5J3IjgAyGYXA=
Date: Wed, 26 Mar 2025 15:22:37 +0000
Message-ID: <CY5PR11MB63667AD68B469B7EC4A12581EDA62@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <87frja72ee.fsf@bootlin.com>
In-Reply-To: <87frja72ee.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ5PPF1FF629472:EE_
x-ms-office365-filtering-correlation-id: d8b3db72-362d-458e-f410-08dd6c7a0a5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UndJUUliWWR0ZVc2UytvcW5mU05LMm1Gc3NiZnVwVm5HQTc2dndQeGJRb1JX?=
 =?utf-8?B?aVpTSVZvNmQ2RnVxMDZvcEhnRlFJb3hjcE5PV3NlWFl2LzY0emtEU2NRT3da?=
 =?utf-8?B?bmJ1U3QxMytibFc2ZGl1bFJLeUhOaUp6bkV2M2JLb1M5UVpOam0zNGo0MUIv?=
 =?utf-8?B?Ukx1eExSNWhWN1l2T21iTnROdTlJby9UTXQySi9JMyttanJuNWZhSmJoOE80?=
 =?utf-8?B?S01UV3Vmcm40azRPU2lRN2d1YzBhYTJvanpOTFpCb2ZZVWRtMUxmUVk1ajlW?=
 =?utf-8?B?ejhORmtvdEpHMnZXK2JEYXUwTU9GelNxUDkxYkZpVVZMdTJUZi9GcHltZHc2?=
 =?utf-8?B?QzJOK2ZDdXJHS081cFRRUEM0TTFScVhKV0FHMGxnK3JiY1FXZ0RVMlphdmhM?=
 =?utf-8?B?VE9QR1FCbElaTWN3ampzSnR2bkdiL2FJMnhDNnZSejd0RWxRQ3NQdWRRS3NH?=
 =?utf-8?B?a1VKVDhYZXc1TlhvOGEyNmlPV0JSdUZ2OGtRYlg1OXZ4Y1M2N2diRjVDM1gv?=
 =?utf-8?B?L0tjbG14T01GdHZKVWRQTU1qcUI1b0xhTk5hWmZMN0V5Yk9SdTkzR0VDUGV1?=
 =?utf-8?B?LzZyWDBCQkJSb1JBRzQxZTB0aG9PemdiOUc5NlVha0ZGUTJFTmhXeThLckNy?=
 =?utf-8?B?ck9YUDl1TVZ5R0k4bHZsUHZMb1RDZVhKSHZxdzhVeFdXbVNJa1UzYXp4Rklh?=
 =?utf-8?B?aUgzZFZhZDRWbm14L0tYOXl3WHROcCtyMGxZbE82amcvaHQ3TWJNMWZ1c2VE?=
 =?utf-8?B?ZlpOUEJoYkZLem5uenpMSVNUbWpPSUM1MTZqaVVzVGtScnhWWDBIYW9zS0hN?=
 =?utf-8?B?d1lEdUJ2eWxvZmJOVU56MHpOcWRZRFBLamhDZWIvUGhLb1Btb0I2N2lMRE9R?=
 =?utf-8?B?bnY4WlE5YjZKb3lVdjJZR3drcy9FRzNGc1dHQmZCOTltNFlEamEzc083Qzd4?=
 =?utf-8?B?SGhoVkJsd0VDUVFSSzNYV0dMRnU3WmxQZkhuR0FRaE4wRkdzR24rMGJBWVpI?=
 =?utf-8?B?S1BPWWp0MjEyNmlNWVZ0MGRRT1VuREVlNTU2L1RqdkowNGwxa2JMZXFJeWtG?=
 =?utf-8?B?SlM1UEp3MWtqQ1U2NXBsY0tOV0dvVy9rK1NIL3lPZGlJczUyN1ZtWVp2OVVC?=
 =?utf-8?B?Z3FsTGFwQWdNZi93Wms4Y01Hem1yU3Z6ZE95bDhaUU02QzNGOVJKSGtZWXlr?=
 =?utf-8?B?V0tIcHQ5a2Y3bHhvV2J5VGdCaGpXSnE2L1VFSThrS2JkUC9TaDR2MndIUkpu?=
 =?utf-8?B?enJ1Nmo0enp0SndzRWIvTUFxRStYTUk4TGRyMDRtSTdvWWlPNnBqODRnRWhX?=
 =?utf-8?B?MlBscUhGa1ZqUHcrVm8vUFlSc1hJMXdBSlltSkhTaHhpaWc0UEhOeS9lc2ky?=
 =?utf-8?B?dG9UaDZ5ZzNtWFFha1NjZ0lXOC9NN0pwSTM3L2czckJqUjhqT1JRV3pSMEU0?=
 =?utf-8?B?MUtnMmViY3hsK3dFY2N3SDdwYlNSSlFlQzFHeUtRT050QXZJaXRBN3hHcWsx?=
 =?utf-8?B?N0o4MzU5UEo4UzRzblZRTHRlbUZBNDEwU09vMnRGVy9sWW9mSnAvS0ljc1RD?=
 =?utf-8?B?SWtlaUlxa2EwdnNVR2VPRlUxSkpVck9lTkh5MWFyQlFwSllMUWFISG9lYTRJ?=
 =?utf-8?B?emJzVmRnelpIZDZER1Jpam9OcWFmR3hYYVRaZ0RJc0VKeGw4UHhYVUtwSzEv?=
 =?utf-8?B?amZvSUhmeXJTUXlhZDdTcS9qZzFacUpFOHhocXJObnBwUFhqaSszVkxSby9R?=
 =?utf-8?B?NzNhN3Z2RjVDMVJ6dGdNdUFPY3hsRWpWZ0tmVWdDOVFxSHE2QXduQWd2OFJs?=
 =?utf-8?B?TWo5dzFYSVNQcFR4TjZkeVZBVnNyNmV3dzlPb2JPS3BJOE1adUMycXl5YnFj?=
 =?utf-8?B?bCtEazd6ZVBOdDh6cWtXc2VleFR4Mlp5OTV4WGowMWNCRTF1Q080Z0FsSmFi?=
 =?utf-8?B?MmVpWG5TSFd0emY2dTRCaTVEU2pMTmZlS1hCVDJuNk54WGxYbWxZYmR4VFp6?=
 =?utf-8?Q?Q3SnNGFlqbCfNMakNmi3sTNFaEXWC4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWl5QVZBS1lHZENORzZZQzZHVXVvbEYySEcvYkYySjRBczFORzZJWFBha202?=
 =?utf-8?B?SFV2cHVqallSdmorQnJDU2hFNWs3SWduNnlhUG5wMjdvOGI1MzhxMmxKYTgz?=
 =?utf-8?B?SS8xay80TENpK2tib3hnSW5rZHlZOGNmVmJDSER5aTR1NUdDMkxZWTN5cWQ0?=
 =?utf-8?B?bEY4MlBNZjdyRHFWWFIxUTU5SlVJc2lKKzRoSWJ5cGpSdHdHaU9zRHdjYXhM?=
 =?utf-8?B?SkNydjhJL0dicjJhRTdJZjRha0E4N2tQQXhFUGJKTUxUZU5mMUZuRDBUdEFY?=
 =?utf-8?B?aEZBbWdadm1tWnQzVFpmMitvNW9qSHhVcGwrQ3ZFV1NuMVRRQTdsVTg1cXhY?=
 =?utf-8?B?T3BVQ0pFWG9aaFBlREdiYXZ3dk95WmVmOTlZRnNlZ1JmbWdLR0RPbzNUTTJH?=
 =?utf-8?B?OTd3dVBpMXdtQk53cXlEZzM5bktBaVoxaDBVMitaN0JkS0JRNEs0TEJ6SjRN?=
 =?utf-8?B?TmdNdGpxY3RxSlJXcmw5bVU0TlRlVVlYSG1EbExlY3prNHV5ODBmODQ3TFk0?=
 =?utf-8?B?TVpUcnYyTnoyZjhBdG9hNXV4OHA2VVhhUUtlTXBwbHNnckIwY3NZanZhYjd2?=
 =?utf-8?B?MVhsdDBYZjZvVjhPRXNJYysvSDFXblhKcUdnNjJmS3lvU3lWcG5wWGY2b2NU?=
 =?utf-8?B?REVoZzRFNUR0R1pwcWlsb0RjdDV4RnpnUkM5SEtjZFZ6cVI3R1hQQnh6WjIy?=
 =?utf-8?B?VnV0U2pNSkJHYWlqU2FFdFZXNWFXaTZwRHEwUjJtTVhzZ0x0eDI1QndsQlNU?=
 =?utf-8?B?S3d3cCtrcmpzQ2s5MDhNRFlmVllZNEZHL3ZBeWpQTVBwY05semxhalB6MURh?=
 =?utf-8?B?VDF4TkFVUVNKSDV4b2xvNDFKNE96U3VSMHhCYlJwVGpTSHlTd3NnSUIzYlVQ?=
 =?utf-8?B?MzQyZGZuU0dkWSs2WEJ0ZXNxWkl2VmRyek5FK0thUE9aNGM2ak9RbWVIcTha?=
 =?utf-8?B?TjRsWU5NekxLaUNHUUt5Uk5aVW9SbG5oNUlrTEszNDNFVXdINDRUZ2J2S0lN?=
 =?utf-8?B?Q3hiN2NKZmxibTh4Y1lSY0NPR3QyNUZ1Q3R5bjJJYlBqY1lQTDdjTHFrQXZv?=
 =?utf-8?B?ZTFoS2dQaWFKaGZ2L3NoTjNVZkNPNHN5ZHhDVldXZXBwdjRnK1MwcFlNbUdN?=
 =?utf-8?B?REx4V1lScCtaWFJTUG1BRkVnTXZEMTRYbk5aNE9SdWpkR0MwdW1VbEY5UWhX?=
 =?utf-8?B?UGJYbGIxNnN2blBFSUtsYU9KVXBLaWt3cHUyUldzYXp3QmR3MUFyVE1KSUZ0?=
 =?utf-8?B?Vk1reHJvZHRZQmNrdnNrb3NFaUxzOTRUL3NrR2FPSStqM2tzaVlROVpvT1hQ?=
 =?utf-8?B?Qk1jdktVamlWNVhkL0NLYldraEZQV2dvNHp2Z0hYcVQ2YzJRMnE0dGlTVUZm?=
 =?utf-8?B?SnVZM2hDNHRoaWx4aE9FSUt3VFlsQVhFSjB4VVRMNkhEWnRzQ2xxejEyZWs1?=
 =?utf-8?B?S2xlVHJOZHJJTGpXUm13OW5Bd1hzOUxaQXRqMCtXVjVZTjdKakp5dURqMWFk?=
 =?utf-8?B?REJLaXo3enRiSVIzWDZwcFhUSlpsSmNZc0dJMXllOCswS3pBVmhlRHROdWlT?=
 =?utf-8?B?Q3JWR3JKa0dHL2ZBYlI1VHkzejFMcnZXUUp6MWVDOGgvQkZhMjhZWHBDSHZl?=
 =?utf-8?B?N3ZlU09ScURkc0N1cWZLZlY2TGZ3TWc3dHlzS2hicUl3WXZLOE90Tk1QWUFo?=
 =?utf-8?B?VWpZTDlKcGZ3ZVlrSVVkdVFQUkNiemFXenJlMVhiU3pjVS9kU3VGc3NJYVZC?=
 =?utf-8?B?bXYzMDBTRWRJVUhYUEVXVU9nQUl2cXlmb0JpOVExVmxnR2dDejk2djJialVn?=
 =?utf-8?B?R2tVSUxnNXBpZ0ZzQXp1cDVzWGx0Q1hJcWtiU2FUQUlLckdwT0xBR1BVc2JN?=
 =?utf-8?B?T2lESi9KNGhvb2ZnRUZodjYzYlVHZHh5UFY0Z25JZjVDN0ZFWHEvR0lVaWF5?=
 =?utf-8?B?MkQyV3M2SmpwWmxlRXRiaFEvenQ2WFN0TUdody9hOGlaTjFDMDFjU3p0U3hL?=
 =?utf-8?B?dzN6OFlaR2NuZkZmV0d2NnMxSmtGUnpwWHFIUXpiQWp5THNsK2gydXNFUHRm?=
 =?utf-8?B?bVZqcmRDRjUzRjdwQjFxUGc2L01WMFRsemxkbnN5R1AxQTRvWmJRcTFjMG1U?=
 =?utf-8?Q?B5iBChNIonDIjfX16kGsk9n2N?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b3db72-362d-458e-f410-08dd6c7a0a5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 15:22:37.1561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UO2mpMYl+8+fny9Q96erjDOD1wacYefLmjlYZdixTbn446BZdEJtrdTUcQiuYJWGoyZmsSQAiIdUYoj1vRWG+ybgutwvlhSty4iMAVfSJDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1FF629472
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

PiA+IEFkZCBkcml2ZXIgZm9yIGFjY2VzcyB0byBJbnRlbCBkaXNjcmV0ZSBncmFwaGljcyBjYXJk
DQo+ID4gaW50ZXJuYWwgTlZNIGRldmljZS4NCj4gPiBFeHBvc2UgZGV2aWNlIG9uIGF1eGlsaWFy
eSBidXMgYnkgaTkxNSBhbmQgWGUgZHJpdmVycyBhbmQNCj4gPiBwcm92aWRlIG10ZCBkcml2ZXIg
dG8gcmVnaXN0ZXIgdGhpcyBkZXZpY2Ugd2l0aCBNVEQgZnJhbWV3b3JrLg0KPiA+DQo+ID4gVGhp
cyBpcyBhIHJld3JpdGUgb2YgImRybS9pOTE1L3NwaTogc3BpIGFjY2VzcyBmb3IgZGlzY3JldGUg
Z3JhcGhpY3MiDQo+ID4gYW5kICJzcGk6IGFkZCBkcml2ZXIgZm9yIEludGVsIGRpc2NyZXRlIGdy
YXBoaWNzIg0KPiA+IHNlcmllcyB3aXRoIGNvbm5lY3Rpb24gdG8gdGhlIFhlIGRyaXZlciBhbmQg
c3BsaXR0aW5nDQo+ID4gdGhlIHNwaSBkcml2ZXIgcGFydCB0byBzZXBhcmF0ZSBtb2R1bGUgaW4g
bXRkIHN1YnN5c3RlbS4NCj4gPg0KPiA+IFRoaXMgc2VyaWVzIGludGVuZGVkIHRvIGJlIHB1c2hl
ZCB0aHJvdWdoIGRybS14ZS1uZXh0Lg0KPiANCj4gSSBuZWVkIHRvIHRlc3QgcGF0Y2ggMSwgc29y
cnkgZm9yIHRoZSBkZWxheSwgSSB3aWxsIGRvIHRoYXQgYW5kIGlmIEknbQ0KPiBoYXBweSB3aXRo
IHRoZSByZXN1bHQgSSdsbCBhcHBseSB0aGlzIHBhdGNoIHRvIG10ZC9uZXh0IGF0IC1yYzEgKGJl
dHRlcg0KPiBoYXZpbmcgdGhpcyBraW5kIG9mIGNoYW5nZSBlYXJseSBpbiB0aGUgY3ljbGUpLg0K
PiANCj4gVGhlIG90aGVyIHBhdGNoZXMgY2FuIGdvIHRocm91Z2ggZHJtIEkgZ3Vlc3MsIHJlZ2Fy
ZGxlc3Mgb2YgdGhlIHByZXNlbmNlDQo+IG9mIHBhdGNoIDEuIEknbGwgc2VuZCBteSBhY2tzIGFm
dGVyIHRlc3RpbmcuDQo+IA0KDQpUaGFua3MgZm9yIHRlc3RpbmchDQpTdWJzZXF1ZW50IHBhdGNo
ZXMgYXJlIGRlcGVuZGluZyBvbiBwYXRjaCAxIChhdCBsZWFzdCBwb3dlciBtYW5hZ2VtZW50IG9u
ZSkuDQpTbywgSSdsbCBzeW5jIHRoZW0gd2l0aCB5b3VyIHByb2dyZXNzLg0KDQpJJ2xsIHB1c2gg
YW5vdGhlciBzZXJpZXMgcmV2aXNpb24gYW55d2F5IHRvIGFkZCBmaXggZm9yIGVyYXNlIGZsb3cu
DQpUaGUgbmV3IHBhdGNoIHNob3VsZCBiZSByZXZpZXdlZC4NCk5vIGNoYW5nZXMgaW4gb3RoZXIg
cGF0Y2hlcy4NCg0KPiBUaGFua3MsDQo+IE1pcXXDqGwNCg0KDQotIC0gDQpUaGFua3MsDQpTYXNo
YQ0KDQoNCg==
