Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566F6B20701
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 13:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DE310E0CC;
	Mon, 11 Aug 2025 11:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3Q365g1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8DA10E0CC;
 Mon, 11 Aug 2025 11:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754910775; x=1786446775;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MDFqSnNZRDeUcUiJi0M1WCb7Pv9Rur/a0+4EZEWqbMA=;
 b=F3Q365g1eZCiKo3Ut30eM0pU3aBdrwbwGVMEYrgGE69dKjtbcEfQU5al
 OXgGC/SMJpKCUF34FnSVp3T1X9wPU3FopFYLIDXs2vLLKwXzNjfz1USgK
 woRoV08CqwNkAV+Fnpt1RnKfNBcLt3S6KRnZUjJFpS08wvGlzV5fsDUo7
 cGOXLYyVWmg/Su79XXQjuE6pnZcTLajuCFap2MIDk6qOlt832TlahOWpq
 H/4xx0XfLJqbWoWq+aTpvCM3GX5VQOaFfKDD+qgzempSZ13TIheVlLJyd
 F2U2j7ikKVbClknLCiWxPFaahvScvz2xjIz2aAlqy0mwhQKyBGDT1L9cS A==;
X-CSE-ConnectionGUID: +w7vad5mTIuJxAm0YqO7SQ==
X-CSE-MsgGUID: tUCsY9QQSxeHiAkfYsiQDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56189591"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56189591"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:12:46 -0700
X-CSE-ConnectionGUID: ORdzrslcTl6cYpaWyVi2Ww==
X-CSE-MsgGUID: 9iL95uZPR/mI2XNe6rhCCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165532801"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:12:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 04:12:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 04:12:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.74)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 04:12:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vctoet2pxNqRvy+WjXqRqeHXiyYwx4EJlNWM1XnIdLopyCbntWYHzm9S9+Z6uy3gUrjUXipG4bq2iKJudZoZXbbaUjHpsyyTMX5ZzNqC8YGdhYZwD21GiqFHqlNIwXwgIm9nDZ4+6wHEswbf3sGeamhxRki1Jz876KRHP8bi+BaxGIT3TDyfyLt3XCzW89jWBc9APY2QbCbuJt0LpV1E+0GUG08Mogk2yxYrVh1eLYbHoxosCp4awM5t0GHUVdREbEd7tKwwAjdQnxJXGE0gQL5t1/GJBAwyjJ7TFmnlcXVExgscQpipAANQvf9rLtIgvOcqw/KFnzGlPG4aSjpTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDFqSnNZRDeUcUiJi0M1WCb7Pv9Rur/a0+4EZEWqbMA=;
 b=KeeizBBtNF0qbq7WlpYnikE9xrE+VL3hJq/qr0avQxttH3exi2mzWhDyYSF7t333n5SDNvHoumQ8ETLzSpmYUra1kEQlXLioId9tzVIYBNRLD8odSUoCRLnXIrcXoB4sKXSRU8dXg9K9lmTkzrnT8Y9QHpiW5G0ZFLdkGrHj7FOkWkFadQEH+yRgnqy3p/v7hM0TGr9QSAnWV6eFIr7vXfGxBpMCmh93OnzLXKJEBsgfknbZal2KM8nlaHhn6DPSUQmWFJtAToVTdAN/LoyrAwot/qzzJvrvxXXx4AKesZeS/twBr3fSQKORF6QQ4/6hG7zwa3z3Shh9bAewG7buqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ5PPFBD6B1667A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::84f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Mon, 11 Aug
 2025 11:12:39 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 11:12:39 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "siqueira@igalia.com" <siqueira@igalia.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "robin.clark@oss.qualcomm.com"
 <robin.clark@oss.qualcomm.com>, "abhinav.kumar@linux.dev"
 <abhinav.kumar@linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>, "marijn.suijten@somainline.org"
 <marijn.suijten@somainline.org>, "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>, "mcanal@igalia.com"
 <mcanal@igalia.com>, "dave.stevenson@raspberrypi.com"
 <dave.stevenson@raspberrypi.com>, "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Topic: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Index: AQHcCqI6AGKw1/GB0USjdMcIW4UewrRdO+wAgAAPiyA=
Date: Mon, 11 Aug 2025 11:12:39 +0000
Message-ID: <DM3PPF208195D8DE87C7730243EFCCFD6EEE328A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <gvshpndrbnojzwewwa3icd5fjwecqj57jj6gfgoips5xq2oo3l@3dsebzcjwr7t>
In-Reply-To: <gvshpndrbnojzwewwa3icd5fjwecqj57jj6gfgoips5xq2oo3l@3dsebzcjwr7t>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ5PPFBD6B1667A:EE_
x-ms-office365-filtering-correlation-id: b68972e8-346e-4410-d96f-08ddd8c7fbf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?V1l1S08wQkdITFMvM2dmQjJTelYrVGs4N2p2L0Zud2R6Zk0yWEFzb3hJd3Qz?=
 =?utf-8?B?Ums2dERvVGR0R3MvM2ZBU3dGNkZFZU9UbkYrL0xRVjErT3d6b20zdkxnYmho?=
 =?utf-8?B?VGJPUXB3MFBWTGpnUlF3QXZZUTlPZG82VFhqQUMwUWVmSDBhN1NodG9wR0RR?=
 =?utf-8?B?VFdYN0VJRUlkcnlTMmpaQUdCYkdlaWR5aWR4WjY3NU9NRTB4SS9EZnZTY2pv?=
 =?utf-8?B?SHNFV0FZQm8xaDN0OGZqU0FKMU84cWkxWVB4d2RORk5RWllxNnNVNUpuNVF4?=
 =?utf-8?B?WUdzSTFMOG1MTTBud0F1WXNsN1VYNVVtRTZLeWtGOTdpUTlyOG10UzBkYWJx?=
 =?utf-8?B?aFJqMTRDL2J3MWEzdXI4WVo0enNQU0lLRDg0QnJYQ1grd2JVSEVIQURKUjdR?=
 =?utf-8?B?dlFlcjF1eWhNeGpqeGd6RFhXeiswT1Qwb2drdmRRRUUwNEZ3cjJsU012a1p4?=
 =?utf-8?B?TWpJc0V1dzNiK1M0ZjM2TlpBZytKL2pJVTh0bjRCVGE1VERBZ2RNRjQ0UDZV?=
 =?utf-8?B?REJLRWEySXZnNHBRK0FjV0t0MzNPTUUzMUVEOHhaWVpSZ2FQS1JCc2Q5VFdx?=
 =?utf-8?B?dW16L3VNM0RvMW0yQzVBOFgvS2htMnhReXE1c2NNK3dmOFM4YmtiTEYyUDcv?=
 =?utf-8?B?THNLK0w2cE1pMlhCdVpZVXVVaFlpQzBVV1lSTFd6NXgrbVk1QklMa0txZk9w?=
 =?utf-8?B?YTM4M2swTDZuVUdDWm1wbXBtVDRTV0k1SlQ3bWd6WVA4Vk1DZDNrTFpOYnZS?=
 =?utf-8?B?K08rTXlvb05hNFBuMkk1bCtLcytmbml6TVkxT2NrMUtCbEtlVUtmYlNTaUNh?=
 =?utf-8?B?bDR4MU1TTFJSbUYvNEZERkVobnJyMXZXNlk2anh4RjY5MS9KSVNOSDlrcGhi?=
 =?utf-8?B?aTdOZmZXSWcyeGd5ZkNtdndXUkowcE5WY3NYeDUwbi9NS3JZNm9PV1JKVUtY?=
 =?utf-8?B?TlFaSTB1WHFVN2hGVzZCL2EyZ1VRbHMxKy9WWHcxWEVjcXFRdldtSGlSeU9p?=
 =?utf-8?B?VG05b3pFcGlBc3ltRnNzclVvT24wQndIaGxXeExUUmVNOTFMdVFMOGFPU0pa?=
 =?utf-8?B?RzFIZ2Z6VXlpcW5GMUdnelFmT21jeDNsY2RwUE1aSCtmaWJ1ajFBakVOSWt1?=
 =?utf-8?B?TktTRkhmK3EycU9HZkZiRmF6K0dISWtEbTRORU11Vm5RQVRxS2JJY1RHMUZu?=
 =?utf-8?B?SStxTkhPWXZ4dXg5VlZ3UExITHlvTjJYWWx6MHR5SFUwVEY3aVRBbnE4L3BZ?=
 =?utf-8?B?TVNtcTczN0drczZGQmZyNUFDbkF6aEhXRTVmVUd1RnpSbkJYMVBLVi9nb0ZX?=
 =?utf-8?B?NTMwQ2ZXQTJIZG5MTDdycVQvUkN2QTZYZHEyS0VodW53ZDFnd2k2QVYxSGp5?=
 =?utf-8?B?Mzd0MUVpb21LSEhGaUlJUk85WE5JVzczS1RiWWdHbzBlSi9wUUtSYklVdEdp?=
 =?utf-8?B?U2dlOVpmdXNxeHVrNTdiT2ZoMlMwR1lEUXhQWHpPT0lRQVREOFo5cTRpYjY4?=
 =?utf-8?B?cDNDU3lFK2h1WVZjK002aG9LMEV2VkVYdHB2VU1pWnBmZ3Y0Z0o3L0FKSS9r?=
 =?utf-8?B?cUNWVmd2WDdWYVhMRkZhd3BDZVR3RUZXZ3RKY001Y2pLMjVTUU9xWTkxZEhj?=
 =?utf-8?B?YWliaXhUbDBrQmpGc1BqaUdDdC9HeXFvK1lLZWNkMU93VU1HOEIxelRnRGFB?=
 =?utf-8?B?L0V3czhtMVdEVTNtK3pxSXQ2cTVGRVkyK0JRZDZWeVBTRmVSdzQ5UkxHRVQ3?=
 =?utf-8?B?S3RmOXVwKzk1eWI2TFJuQmF6LzRqTmxYU0YzOTg3ZGpHeEg1ZnVDWDlBYXZG?=
 =?utf-8?B?OUF6b2w5a2ROR1BtME1hZXliRTg2UTRpb2tyT3RmeE00bEsrazBXeUxGSGpS?=
 =?utf-8?B?dFR2YkMxd3ZSZHppWVBnazRkb0VITll4Rkt2d3pmcXllaHZaSkV0ZHp0VFJU?=
 =?utf-8?B?YUFxbXdoNFd4bm9LSk1UNEtJanBIYWQvV1NnMnY5NG9TOVlWZDJVN2xWdXc0?=
 =?utf-8?B?S1FJZkoydDN3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sm9va21xc1lETFpEb1dpaUxPeHJYdFBFejJBWGNhK3F2SWV0QXZ5MWZML0x6?=
 =?utf-8?B?d0k1M2EyNit2RTQxUWl1NVZ0TE0ram9meUUxSXJLTHMzZ3EzWjdCeTRoQ3Bl?=
 =?utf-8?B?YWp0bFN6ejIrMHZ5T2hSNzJUTE1meXcwZnBlR2RHTVBIaDNLYkRrTWpLZ1k5?=
 =?utf-8?B?L05GT0g0aFpleVg2WDVSbTdJaUk5aVRyUW5FQWMwdEFkSlZTMjkzWE5COGJx?=
 =?utf-8?B?R05xTEhHMWtvdnAvNU5wYWYyUlk3QkcvM1lZVnk4UnJIbTFaM1IrODZWY0xi?=
 =?utf-8?B?V1N3Uk9BbE5KTFNKdzJ1RS94dnJMY05lL0VZUWovUG4rN0VGdnRPSHJWZ3VU?=
 =?utf-8?B?NHhJaVN6bldBai9LenhhN0E0QjRYQWZnbkcydnZ6L1JzeUE1Vm5NYTRST1pZ?=
 =?utf-8?B?clJWTUQ1blFqOTRZTDVhSGMzUFdmTjd3bDhscDZVR0hIMUs2NTIybnMyMEpO?=
 =?utf-8?B?dU4xOEE5QjU0dU9VZTRMYUtiYU1wcWhqd3FWSktSVXdnNlF5WUYxZ2p1cXps?=
 =?utf-8?B?SG42NHZsSGZoRUlKQ3JWMDVHVkZyK2R4ZVZSSm9JVnhGcFFOd0RKZkdDS0gx?=
 =?utf-8?B?V0JScHA4MENzQisvdzFpUy9yT2RRZG51NTE2TThHcnFUTUJuSTN4dDljQVlU?=
 =?utf-8?B?S0tDczlUejhMbWFSVHFaQ1VYMjNzem1KbE1jYlI0c0lCOXhIOTVRM1NmbmFy?=
 =?utf-8?B?VExlY1k3bWtjZUwyU3pFQXV3NVZQQXhvMW93YjEwVFp0b251SkY5cVFIRVc5?=
 =?utf-8?B?MXZOZnYxUG5TZGJBUWFQVWU0cnc5Rm1DcFVMbzk1VlhIM09rb1VFaFQ5T0RR?=
 =?utf-8?B?YkcxbVRNNURiT0h5WHlrUmhFR0lUbHZhS1hhbFJTOGFDdFdjN25FOW1JbkV1?=
 =?utf-8?B?eTlEdi9zcHpLOGpOUDJOVHpWOHUrTFZzWFJiS05NYnQxZkJpWXcrT1JMSUJZ?=
 =?utf-8?B?dkRMaVdoU0phalVFOVFFZVh3dnhvRllBWHZSM0JEam5maHNmTXdnWEpoWFl5?=
 =?utf-8?B?bkp4VlhBczZwMUZXRnBJdHd0RGNhMy9ZbXh2a1MzeHI5MkVUdm1xRWNybE9x?=
 =?utf-8?B?aGhjZDhPd3pRcE9LSEhTQ3VOODc3cE9pTUp5Yk5UY1RwZ3Z4Yy9WT21EVU5z?=
 =?utf-8?B?dUtwYXN6dU1zL0tzaldXdE5EQ2k4eGRPb3BIZ3R1UXNINUM2OXh3NXhRRnRM?=
 =?utf-8?B?enByWFZvRWJqZFM4NGt0QWlnQzloWjI0R1NOTHRpUmk4a2tEd3JwcHNIK1Bn?=
 =?utf-8?B?ZnFQWkFqSzRVWGhXN1p4empyN2F5dVdJbzBBR3RET285dlVqWDZacVpkdzA3?=
 =?utf-8?B?MDYxVElyOXNWbU1RZFBCNHNhSWtqQ0VBd1V6aHhOTncvSFdiUFVKNHc2aDVh?=
 =?utf-8?B?K1kyWm55bGQrYnUwa2JWcUZBRHZHL295V1pPQzJ2MkFhbFFJK1lORUlySk5a?=
 =?utf-8?B?RWJuOVJVM0dScWhFSFhhUXhaT1ZkOGFrYkJDQkhISkc1cFNaaWhQblU4N20z?=
 =?utf-8?B?UDhvMTYvUVF6M2hHMEhoMVVNL2ZiSTZJbGZrYXg2eDNYajQxRVdIdStuMUps?=
 =?utf-8?B?K0t5Q0NrR25LZVNJSzRkbVdjTkwxNFhEUVF2SFk4dVVDZFFhRGUxak5uMXBG?=
 =?utf-8?B?OWI5OEcvaWhzaTdHelIzVlNXZXV0cUE4SCtwNVlTTkFaMVozNThXVGVPQWI1?=
 =?utf-8?B?SnNoWlFXT2d2ZUF2alBWTDFHbTNuYyt4Z3Rob2FZQTBEVEd1WE1PVzNybjBa?=
 =?utf-8?B?RWFEVTh1dzN3UEQ5aXBRaDhKMFlCSU9ldHdaM1RuOWpxeG5LOVFYbHNpNHl5?=
 =?utf-8?B?UnA2N2lDN1l5Q2tZSDJJL0w5VFlGb1FjYlQwdSs1SnplbWQ3Uk9rSjZ3dm92?=
 =?utf-8?B?V2plVlIrbHE5cmN0TXhZeUpvc3NtY2hweisrakRWMzFFVVpIMXVmdWJQOG1w?=
 =?utf-8?B?MGRPVnh3cWZLUUNhaUliMnlKaWc1eGcyNkpycktqSDB6WkRuZWE1OFIvakRp?=
 =?utf-8?B?c2paWmlrVlBqQytOd3ZyOGhWZnNKMm4vZ3hTRDF2Z0FDenY3UFBkb2FEVmFJ?=
 =?utf-8?B?NVpZdFdkOE1uQUVVS0NObTNyNnNNMVZIbVhyTUFCVVR2OE5mcGw0Mm9jVGYz?=
 =?utf-8?Q?1YWxHJYY17AE/C+nye/FCqYE3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68972e8-346e-4410-d96f-08ddd8c7fbf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 11:12:39.3552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJK70ToFsX+dHeIjHSk0eQFYuUOJLQ7G2Fsq4fDqn34CWQXkwnBFvv+Wmso5o9hsD0UGvitYU7mBbL/vdMwLKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBD6B1667A
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

PiANCj4gVGhpcyBwYXRjaCBicmVha3MgYnVpbGRpbmcgb2YgZHJpdmVyczoNCj4gDQo+IGRyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfd2IuYzogSW4gZnVuY3Rp
b24NCj4g4oCYZHB1X2VuY29kZXJfcGh5c193Yl9wcmVwYXJlX2Zvcl9raWNrb2Zm4oCZOg0KPiBk
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX3diLmM6NDg3OjM2
OiBlcnJvcjoNCj4g4oCYc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9y4oCZIGhhcyBubyBt
ZW1iZXIgbmFtZWQg4oCYYmFzZeKAmQ0KPiAgIDQ4NyB8ICAgICAgICAgZHJtX2Nvbm4gPSAmd2Jf
ZW5jLT53Yl9jb25uLT5iYXNlOw0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXn4NCj4gDQo+IFBsZWFzZSBwZXJmb3JtIHN0ZXAtYnktc3RlcCBtb2RpZmljYXRp
b25zLCBtYWtpbmcgc3VyZSB0aGF0IG9uIGVhY2ggc3RlcCBhbGwNCj4gdGhlIGRyaXZlcnMgY2Fu
IGJlIGJ1aWx0IGFuZCBmdW5jdGlvbiBhcyBleHBlY3RlZC4NCg0KWWVzIEkgYW0gYXdhcmUgb2Yg
dGhhdCBjdXJyZW50bHkgc2VudCB0aGlzIHNlcmllcyBvdXQgbGlrZSB0aGlzIGZvciB0aGUgcmVh
c29uIHRoYXQgYWxsIGRyaXZlcnMNCmNhbiBzZWUgYWxsIHRoZSBjaGFuZ2VzIHRoYXQgY29tZSBp
biB0aGUgc2FtZSBwYXRjaCBhbmQgY29tbWVudCBpZiB0aGV5IHdhbnQgaXQgZG9uZSBhIHBhcnRp
Y3VsYXINCndheS4NCk90aGVyd2lzZSBJIGVuZCB1cCBoYXZpbmcgdG8gbWFrZSBwYXRjaGVzIHdp
dGggYWxsIHRoZSBkcml2ZXIgcGF0Y2hlcyBpbiB0aGUgc2FtZSBwYXRjaGVzLg0KQW55d2F5cyB3
aGVuIEkgc2VuZCBhIG1vcmUgZmluYWwgdmVyc2lvbiBvZiB0aGVzZSBwYXRjaGVzIEknbGwgaGF2
ZSBpdCBkb25lIHRoYXQgd2F5Lg0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+IA0KPiA+
DQo+ID4gQEAgLTIzMDUsNiArMjM2MCwxMSBAQCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciB7DQo+ID4g
IAkgKiBAY2VjOiBDRUMtcmVsYXRlZCBkYXRhLg0KPiA+ICAJICovDQo+ID4gIAlzdHJ1Y3QgZHJt
X2Nvbm5lY3Rvcl9jZWMgY2VjOw0KPiA+ICsNCj4gPiArCS8qKg0KPiA+ICsJICogQHdyaXRlYmFj
azogV3JpdGViYWNrIHJlbGF0ZWQgdmFscmlhYmxlcy4NCj4gPiArCSAqLw0KPiA+ICsJc3RydWN0
IGRybV93cml0ZWJhY2tfY29ubmVjdG9yIHdyaXRlYmFjazsNCj4gDQo+IEkgd2lsbCByZXNwb25k
IHRvIHRoaXMgaW4gYW5vdGhlciB0aHJlYWQuDQo+IA0KPiA+ICB9Ow0KPiA+DQo+ID4gICNkZWZp
bmUgb2JqX3RvX2Nvbm5lY3Rvcih4KSBjb250YWluZXJfb2YoeCwgc3RydWN0IGRybV9jb25uZWN0
b3IsDQo+ID4gYmFzZSkNCj4gDQo+IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQo=
