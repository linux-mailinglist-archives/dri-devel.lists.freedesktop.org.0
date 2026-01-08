Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B308D013BC
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 07:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01A010E695;
	Thu,  8 Jan 2026 06:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTRHcHkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D6A10E236;
 Thu,  8 Jan 2026 06:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767853245; x=1799389245;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S4Z7Bq2YluL0/cuGy0tmVmqmj4esHQa/EGMKyCLkFcU=;
 b=ZTRHcHkXV3yCiE4R5BJLx8wQGUL6rNiBGzoCpp1theChnY2KcaC6BmqR
 30sO+e/vWhfxGWIUpWSTOImJTDWZPAi42qPg92tqQagtktIaUrcoGSH4X
 Kg2IE/elVEK0LHm0QN/nGrQaFqCJeuPjUaE6SAACNXLhyeXTe919dbVJ6
 D+r1pPNJVXV/7+BQmrt4bcQqqVPCmOhzasWhxTLkHWZwnN3eyWuj7wAFt
 dI8LQp406cWUhdxa+G1A6zj48GAgbgzCll+xcA+wz8O4YbbQDBYZbYuHQ
 3rFQPagkyeeM49hBpjUm6h3Hx5HTVIhCDtgScpiZBOYEm0rag3w5PZA91 w==;
X-CSE-ConnectionGUID: JeMob5AgQfaFZrqEOC9j6g==
X-CSE-MsgGUID: YhUebyluQIaZw1RZ8lhqjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69385764"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="69385764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:20:44 -0800
X-CSE-ConnectionGUID: gWwrvlPrRlWshNs5PsNXQw==
X-CSE-MsgGUID: j2+1+eSaSembJ0ElFKvGEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="203140720"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:20:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 22:20:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 22:20:43 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 22:20:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IP38p1dM/Dqe1T1KMFVzKuZxo0H8+N7tbObpnpXj0vGKCfOI006a3RuWMsrd3vyz+OEscASWfPJo/BDSKBHNsyWyXOgRBP9lWoB0jwSA4zo+m+TlvHlUvsxQRdGHVjtHKrGhqwqyeWse7PcPh1SP1LHmYe9Lc7VWCx+Bty/iNO1lj2YQk+q5YFbMVrR6Oh+YVR2q354rqxkCwhnu4kCcU644RDJeRf12JtJ9B7aX0iXeeg5BypYsD3vPsMdFcWnTd4DVLiWoblxnkfMEU6LZpM0exd5V8d8nDOepm4Yyom3e/0LVCou1fQW0qAWXDzA2Xa0eGxgP9YcLd4r6ojz2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4Z7Bq2YluL0/cuGy0tmVmqmj4esHQa/EGMKyCLkFcU=;
 b=GJpyu6/eyBRENqc9/+/N9UKXcuKjdMhDBHhTXG3eDy+hmMqgRQ+graoBnt+0n4ERJWV02KNY3XW8vluxQOipgUCY9LoClEQqnrpCFVExMhkJBV+lrZYNx6jm1PWjRtTR63Xe2y6uf3oBZlV0RrSBEshJo585QnWGzlFi2tktmCVzU9T1/+2PV7kyYJ+44D4lC0MQhde3l0Ca+hx1VOrcT6e7wAlLeuCTOh+0/ezwiw++BuG0cwrxyBus0rM21GFiR78zTuj5FJhTRR6q6gGg20SLHXr51P9la0Cee2xT7M8Ac3I6/HZ7JERluFo2zWfvDrtB7VvyHg2ldrw1P3VyqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB6041.namprd11.prod.outlook.com
 (2603:10b6:8:60::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 06:20:40 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 06:20:40 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v7 4/5] drm/atomic: Return user readable error in
 atomic_ioctl
Thread-Topic: [PATCH v7 4/5] drm/atomic: Return user readable error in
 atomic_ioctl
Thread-Index: AQHcfsaWCjf2rBFH6E+81s4S2m9Y4rVHz6iA
Date: Thu, 8 Jan 2026 06:20:40 +0000
Message-ID: <DM3PPF208195D8D78D7580122772D9643F4E385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-4-d51d9a351684@intel.com>
In-Reply-To: <20260106-atomic-v7-4-d51d9a351684@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB6041:EE_
x-ms-office365-filtering-correlation-id: c5654328-e653-4add-5b2c-08de4e7e0c0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YklwSVUzUFFVQ2M5eERUUGNMTmRHeGYzdEg1Zm1MRkZFcVdOdGlsZVNSbnZI?=
 =?utf-8?B?QXBiUzhVa2JyeS9ENFRZc0VRV2s3MGZZeS9pU055OGR0S2NMV1JNRFk1N3FD?=
 =?utf-8?B?REE2MVl2VkNDVFdZdXpUOEpISWpZU3dZam01d1Z5Q1VvUGc2ZGxwNmFDRjZp?=
 =?utf-8?B?N1J0ZEtxOUlkeVkxdEM0VDEvejNRbXhWUlptNFBYeTdiMGlDNWNPTzd2RmlL?=
 =?utf-8?B?YWtmNVlFNTdjOFNUQmpLN015WU5HZDdhdFRvZWo0aWJOMHRPTzVTajk3QnBT?=
 =?utf-8?B?cytNRUk2dlJnUDhFb0I0Y2hwQUNreHBWMHpCUHVIQWU4R0IraSs3SU02Tis4?=
 =?utf-8?B?RW93VzRsREVhcUtlazNjNkVBVW9ZNHAxQ25WalVJNDVta2xYbWIzaVlwSDhU?=
 =?utf-8?B?Skl6VTlXTGw5NHJ0SkV0RHRhSlN1Zi9pS0V1eWYvUmxnZGhEdlltQTRvc2Q3?=
 =?utf-8?B?eUY3Q2NoU3VDZ1dKYTBYRlk0SThWdGhwNlZoUjhQRVd6MzJyWEt2UVNYNUow?=
 =?utf-8?B?Q3NjS01hVTJxeHY3eHc0TFIzQ0RqeVA1UWtNdG1XK0d5K09OT0lIRDViRXdL?=
 =?utf-8?B?UFB6a3ExYVR5eGxpK1pUUURXWkJ6TFNQeWhCUnJFK1JPWlhNVmphQnc0am1M?=
 =?utf-8?B?NUtUejg2QVB4dHI5dHl0ZE5DTkl5VUpsYlJUVmYwV1FoSnhjWTFNS3QvUHBI?=
 =?utf-8?B?bmVMVWdaYVVBaVJhbGpkU3NBRlQ2Y0J3dm5IeSthazluVmVmQlAwSmNCWU9Z?=
 =?utf-8?B?TXEydVhwWjBySUZGSzYyMTdoQzBLUE9jclMyRjVudFQwbGFzbW9ubE5ENzlk?=
 =?utf-8?B?cy9YK2NidTAySGk5OC9vdXFiWnoyVFoxbG9ONmg0elJ4a2owVXlXdVRtUVlx?=
 =?utf-8?B?czQzSGlSNkVncGI0TDhvQUpvZXBmUDdSWHJoUU9BRzFmcG9nK090eUFKREw3?=
 =?utf-8?B?aGhiZW02SUZ5UnFEcUNuMTJDRjQwaDZJa3pOVXNTNW11R09jZ1NyYVpoQU9B?=
 =?utf-8?B?S09jb2s0RDhrd3dzdEtSOUFwcS9JbVJVNHdoRkp2cS9PK0dSeXRTdVRHa01m?=
 =?utf-8?B?ZWU4WXgxSzY1VStlTzhzMG02cnVSY29LRUNHNTcyN1hXbmNuUlUrT1Foc3N3?=
 =?utf-8?B?MXhPTHJXWlQyTC8vem41dE5SaDkzYVNlUWgvbzFycWNhTTdKeG41YWtsQWVZ?=
 =?utf-8?B?Rkc3eXFSR2x5QVpjYklMQzk1S1hHbFBWU1lNbExORFZVamZpdXMvazRSV3RE?=
 =?utf-8?B?cVdzTXM3NTBVNDBmRjlCeklMa043ZEZ4bVZiN05FTFN6KzA4VTB1a292anIy?=
 =?utf-8?B?dVZWWVJmdWFjTGIxQ1ppNEZTeWdNVk5lRk9HMlErYUpaTkhFMlpsTWlxdFhM?=
 =?utf-8?B?YnFrbXQ2Tk1MWTNZRGtYSHNtMFhrcnZ5NSszVldmMy9kSWdIYzB5TTFUcU5N?=
 =?utf-8?B?ZHVRdHNZNURjVUhIc3RNMFRIbXhkUGt4NDZvTkhCcWF0TTdWVDFMZkxRdHRi?=
 =?utf-8?B?NEkvSExOL01HYTlLUnZSVWJSNFpLdkcyV2lIWjdRNU92eHVCU1VmVXhWMlBi?=
 =?utf-8?B?Y3N2aFpsVDJpZjZXeldwLytldEd2VUc1S2xHL2o3YTRaVXNQMm15b1NMcmVo?=
 =?utf-8?B?N2ZzLzFVZzhaTFRPQm91VmxpYVE4SUdpSjZMUTJrSFNNSmw0Uk1mMEJEWEZM?=
 =?utf-8?B?ejM2MktoV2FpNktzNUorcC9XOVJBek5uZEVRbkdiU2FFakxLSnRYK1RhYmR5?=
 =?utf-8?B?REJ2WGpxWVRiQTJIaXZHT2c3V3pUUGdaWGdIUVlEM08yb05vdGtWeGtOcjRY?=
 =?utf-8?B?eVdTYzFmZllBNXRSQk9qZVBpUkFSK3M4UW0vNExzUnlrNDNNYkp5Q3Z1bXV1?=
 =?utf-8?B?c3dIR0x1d1FYSkltODZwRWRDSTNHaCtsVWJzSUxlUTllQ0QzR3B0Z3U0SmdK?=
 =?utf-8?B?cVV3aEtYSGlIWnQzT3VZYlF4bjlDSVBGTjRXYkg1RTVjVkNuZnRabU0rVUxP?=
 =?utf-8?B?OVNteUloQ29CZk85S3E0WSs1ZDlUeXZYNmZIT0lhRXRtRTNNRlJYbzlFK0dw?=
 =?utf-8?B?OVZzaHVoc2tEajdZbWx0NFowa0I1MzU2N1prdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bElzc3BNWFpHL20zckJaaENyNDE2dVMxbDZUampRQ1pBcTRQUjRwS2Y2QXIr?=
 =?utf-8?B?aHlCeGFwV0lYSmZ6SVEwRTNoU1psSVo0V0hjWEwvRXhsWng5QlR1Uy9veXRW?=
 =?utf-8?B?c3pONXgxWStybkQyVHBybGp5ZU5SdW5qekUrcmdFZmV4K3pJWlpMTHVtaU8r?=
 =?utf-8?B?NUluVFlCVXdENlJFcVdiLzdIdVpSRzFLMUxXWk4wZTJQMVpDTzRGMDRwYjhF?=
 =?utf-8?B?VnlSdXpQNTlvVTdtbWxRaW11bXV4b3ptZEFOVXlRaGhCTk1Gb1ZXSmhUOWFF?=
 =?utf-8?B?bG9mMlc3eE9kVVNjdkdpTC9VdTNaaCtxUitFUTY0Y21saHMyQUNNR3lnY2Ir?=
 =?utf-8?B?c0RmOWRWMDJYaXdycmhkSWhkMUtIYmpkeEtrZjd5VWJFWm1VZnVtb25pNjEr?=
 =?utf-8?B?MGFpV3RqM2JuOXBybTV6SlhXdHV1Y2oxblNGNUZycE0yWFdFbUJqTWtSUVBi?=
 =?utf-8?B?MHAzNkxzOENlU1UyL3Z2Vm1DY2JFWExOWGdtdEpnTEhROXBvenpJQ2JwYThw?=
 =?utf-8?B?OGM0ZG1UN21Fa2dXTHZuTHZKTW9HV2N0Y1BTWTNGWU9lZlVFYklWYWxuRFhz?=
 =?utf-8?B?VzFDOUZvWWhRMlJkL1IrdTVubmY5L05aczFLY2Vpc1NqWm1MUmFmNU1wYXgx?=
 =?utf-8?B?S1RzVldEdkxKVkI3NVp3N0RTTWFaNFJWRXNTTjJuUjFrNStZZDV0NlFTUEI4?=
 =?utf-8?B?RHhKSTBoc0w5aWNuQkgvdVdkVmdOQUNocU5lVU04bG4wcUh6ZS9lcVBoV0R6?=
 =?utf-8?B?NzVneE0zTEt4c2hyL2hPZnpaN2YzUG5lNlZLdXlUa3ZISjU1ZG54U3RWelNM?=
 =?utf-8?B?TzFKVGZkYlloVi9Ba1U5SnpoT3NXZ01HMDZYQkc4NWRoaUJOaS81T3pZdjlL?=
 =?utf-8?B?SnlIWWhjTzZ6NXJmTytlWEVVeTVKUzhHNU4walNhUUEya1AvTi9GZkJtVkc5?=
 =?utf-8?B?VmhuaGlNK3kySXJqdGpHR0lrUzl1Vnlrak4rb2M3TkdGM3Q5bnJjM0dqM1BT?=
 =?utf-8?B?V0xQVGNjY0tTYi92QnVpUVpkdXVwMWxBWlZjcUY2MGRPbWV5TTY0YUl3L3VE?=
 =?utf-8?B?cXZ5QUNNVEdTMkZWR1dwNnlEZWs3d2FBNk1DamtBTmlYVllEZ08vTTlQaWRi?=
 =?utf-8?B?VmFKOENSMjd2YVVEeGV4M3UvWlBqTlZnTDBrKy9tRHB4Q2NjZzJyejZjTjEv?=
 =?utf-8?B?dEhhNWhsNDVnNi91dDlnRkhiSjFib0dEUWp4WWNuZUUzQVBDRTh4ODhxREJy?=
 =?utf-8?B?RG02aitYaUxKc2RBN3pyanpqMUQyQzNyYUJJdzltT1BDNVBFRlI2cWJhUXQz?=
 =?utf-8?B?Z3FiWFFOUnpyeVFVdlRST0dDSmNUaXdXSWdlSTZ2VHhvS28wYitjaFZYM2Ni?=
 =?utf-8?B?d2lrdmNiMkFMNnhmaHltN0t3aTBsa2NiMzRoSVB1UCtTcm41U1ZmekZzZE9C?=
 =?utf-8?B?Wkg1NWxSRGVObjN6a2l1S0wwcVFJNkxuNU5uS0hiR0psSW5PSmdvYjRRSUJn?=
 =?utf-8?B?KytHTnRlSk1Gb1lRd2E3NFhmTnlQNUFWVTNXY2NWcUFGeW9BS3ZIUS95cFlm?=
 =?utf-8?B?Q3czcndoM2sxQmM5d0tPa3Z4V3hsZy9peU5KenBKbEZqY3NtbVVic1MrR0lV?=
 =?utf-8?B?NHJSMm1neUlOWGVQcDVtT1dYczhsRkFWc3RDQnJ1RzQraG1oZi9sa3F0d1B3?=
 =?utf-8?B?VDFYOWNmTFhGcTlOWGhKaFkrdExFSEJoekNvMGdxaUNsZnU0MmVqZlFiQ3F4?=
 =?utf-8?B?MGllSmdOZ0FQMUEvaWZpb1hXaWNURXAvTFl4UnhRWDFSYkNCS2srUlNMTjZl?=
 =?utf-8?B?KzNOQ0hoZ1kzNHBiUjhGZDk2UEVEeFVsZW5scldiajdKcXJ3dGs2Wk5jYU5B?=
 =?utf-8?B?N0plTEFSajFQMUFiMk1oYTgwYVQ5UnVaYVNyTk5HclRVR2NSYi9uTGgvZWVm?=
 =?utf-8?B?d01RWTA0Q1FBUlZ2UTNTbHBsVGducCtjUDBJMGdxNUNRZjRER3JlalkxODJZ?=
 =?utf-8?B?L0I0U1ZmdXRXWXBoQUJKbzhuM0wra1JnRm1zMHdhUGUzQWFYKzUrc0k4WlVV?=
 =?utf-8?B?cm15M2VGa0J1c1Fvb1NHUHpVMkwvWEZka04vZTd2ekZPZktkc1B6NTlJR3Ra?=
 =?utf-8?B?UU9TOGtoRzJhdmh6VmxrYklJSFhSV2pCcFcra085SVR2UmxSaVovVFZnV0Nh?=
 =?utf-8?B?ZjZCUGNjOWgvQ3lOSENQK2ZGZ21GQXo3SjhNUzU4NmdCaGRQWm0vaXVHYXdh?=
 =?utf-8?B?R2IrNDlBRSsyUHBFV25XR3orb2Y1eFQ0bVE2T1ZiMk0zbkRPUGR3MmREeU9S?=
 =?utf-8?B?cURJa0NJM0ljc1ZKVnNNYWliQ2NqaHgxc1phNG9rWDRHRmIwZFI1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5654328-e653-4add-5b2c-08de4e7e0c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 06:20:40.7721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UVf96uzwlSO6mrw/O5qnonM6pioONon6TcIVSDNGeO0DDh1edh99Jw8PdnlgX2Dicv6D+PU85lqLjLp/ohTBXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6041
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjcgNC81XSBkcm0vYXRvbWljOiBSZXR1cm4gdXNlciByZWFkYWJs
ZSBlcnJvciBpbiBhdG9taWNfaW9jdGwNCj4gDQo+IEFkZCB1c2VyIHJlYWRhYmxlIGVycm9yIGNv
ZGVzIGZvciBmYWlsdXJlIGNhc2VzIGluIGRybV9hdG9taWNfaW9jdGwoKSBzbyB0aGF0DQo+IHVz
ZXIgY2FuIGRlY29kZSB0aGUgZXJyb3IgY29kZSBhbmQgdGFrZSBjb3JyZWN0aXZlIG1lYXN1cmVt
ZW50cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlA
aW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyB8
IDcxICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4gLS0tLS0tLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pY191YXBpLmMNCj4gaW5kZXgNCj4gMDIwMjliNWQ3ODMyZWVhZjRhMjI1
MDk2YTk0OTQ3MzQ0MDgzZmMwYi4uOTA5YzcxYmM4ODEyMmVlNTdjZjgyZWVmZTUNCj4gNTg4YzQy
YTVkNGEwMzcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGku
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMNCj4gQEAgLTExODAs
NiArMTE4MCwxMSBAQCBpbnQgZHJtX2F0b21pY19zZXRfcHJvcGVydHkoc3RydWN0DQo+IGRybV9h
dG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCQkJcmV0ID0gZHJtX2F0b21pY19jb25uZWN0b3JfZ2V0
X3Byb3BlcnR5KGNvbm5lY3RvciwNCj4gY29ubmVjdG9yX3N0YXRlLA0KPiAgCQkJCQkJCQlwcm9w
LA0KPiAmb2xkX3ZhbCk7DQo+ICAJCQlyZXQgPSBkcm1fYXRvbWljX2NoZWNrX3Byb3BfY2hhbmdl
cyhyZXQsIG9sZF92YWwsDQo+IHByb3BfdmFsdWUsIHByb3ApOw0KPiArCQkJaWYgKHJldCkgew0K
PiArCQkJCWRybV9tb2RlX2F0b21pY19hZGRfZXJyb3JfbXNnKCZzdGF0ZS0NCj4gPmVycm9yX2Nv
ZGUsDQo+ICsNCj4gRFJNX01PREVfQVRPTUlDX0FTWU5DX1BST1BfQ0hBTkdFRCwNCj4gKwkJCQkJ
CQkgICAgICAicHJvcGVydHkgY2hhbmdlDQo+IG5vdCBhbGxvd2VkIGluIGFzeW5jIGZsaXAiKTsN
Cj4gKwkJCX0NCj4gIAkJCWJyZWFrOw0KPiAgCQl9DQo+IA0KPiBAQCAtMTIwMiw2ICsxMjA3LDEx
IEBAIGludCBkcm1fYXRvbWljX3NldF9wcm9wZXJ0eShzdHJ1Y3QNCj4gZHJtX2F0b21pY19zdGF0
ZSAqc3RhdGUsDQo+ICAJCQlyZXQgPSBkcm1fYXRvbWljX2NydGNfZ2V0X3Byb3BlcnR5KGNydGMs
IGNydGNfc3RhdGUsDQo+ICAJCQkJCQkJICAgcHJvcCwgJm9sZF92YWwpOw0KPiAgCQkJcmV0ID0g
ZHJtX2F0b21pY19jaGVja19wcm9wX2NoYW5nZXMocmV0LCBvbGRfdmFsLA0KPiBwcm9wX3ZhbHVl
LCBwcm9wKTsNCj4gKwkJCWlmIChyZXQpIHsNCj4gKwkJCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vy
cm9yX21zZygmc3RhdGUtDQo+ID5lcnJvcl9jb2RlLA0KPiArDQo+IERSTV9NT0RFX0FUT01JQ19B
U1lOQ19QUk9QX0NIQU5HRUQsDQo+ICsJCQkJCQkJICAgICAgInByb3BlcnR5IGNoYW5nZQ0KPiBu
b3QgYWxsb3dlZCBpbiBhc3luYyBmbGlwIik7DQo+ICsJCQl9DQo+ICAJCQlicmVhazsNCj4gIAkJ
fQ0KPiANCj4gQEAgLTEyNDAsOSArMTI1MCwxMCBAQCBpbnQgZHJtX2F0b21pY19zZXRfcHJvcGVy
dHkoc3RydWN0DQo+IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCQkJCQlyZXQgPSBwbGFu
ZV9mdW5jcy0NCj4gPmF0b21pY19hc3luY19jaGVjayhwbGFuZSwgc3RhdGUsIHRydWUpOw0KPiAN
Cj4gIAkJCQlpZiAocmV0KSB7DQo+IC0JCQkJCWRybV9kYmdfYXRvbWljKHByb3AtPmRldiwNCj4g
LQkJCQkJCSAgICAgICAiW1BMQU5FOiVkOiVzXSBkb2VzIG5vdA0KPiBzdXBwb3J0IGFzeW5jIGZs
aXBzXG4iLA0KPiAtCQkJCQkJICAgICAgIG9iai0+aWQsIHBsYW5lLT5uYW1lKTsNCj4gKw0KPiAJ
ZHJtX21vZGVfYXRvbWljX2FkZF9lcnJvcl9tc2coJnN0YXRlLT5lcnJvcl9jb2RlLA0KPiArDQo+
IERSTV9NT0RFX0FUT01JQ19BU1lOQ19OT1RfU1VQUF9QTEFORSwNCj4gKw0KPiAiW1BMQU5FOiVk
OiVzXSBkb2VzIG5vdCBzdXBwb3J0IGFzeW5jIGZsaXAiLA0KPiArCQkJCQkJCQkgICAgICBvYmot
PmlkLA0KPiBwbGFuZS0+bmFtZSk7DQo+ICAJCQkJCWJyZWFrOw0KPiAgCQkJCX0NCj4gIAkJCX0N
Cj4gQEAgLTE1NTIsNiArMTU2Myw3IEBAIGludCBkcm1fbW9kZV9hdG9taWNfaW9jdGwoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwNCj4gIAlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGU7DQo+
ICAJc3RydWN0IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4IGN0eDsNCj4gIAlzdHJ1Y3QgZHJtX291
dF9mZW5jZV9zdGF0ZSAqZmVuY2Vfc3RhdGU7DQo+ICsJc3RydWN0IGRybV9tb2RlX2F0b21pY19l
cnJfY29kZSBfX3VzZXIgKmVycm9yX2NvZGVfcHRyOw0KPiAgCWludCByZXQgPSAwOw0KPiAgCXVu
c2lnbmVkIGludCBpLCBqLCBudW1fZmVuY2VzID0gMDsNCj4gIAlib29sIGFzeW5jX2ZsaXAgPSBm
YWxzZTsNCj4gQEAgLTE1NjAsNiArMTU3MiwxNCBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsDQo+ICAJaWYgKCFkcm1fY29yZV9jaGVja19mZWF0
dXJlKGRldiwgRFJJVkVSX0FUT01JQykpDQo+ICAJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gDQo+
ICsJaWYgKCFhcmctPnJlc2VydmVkKQ0KPiArCQlkcm1fZGJnX2F0b21pYyhkZXYsDQo+ICsJCQkg
ICAgICAgIm1lbW9yeSBub3QgYWxsb2NhdGVkIGZvciBkcm1fYXRvbWljIGVycm9yDQo+IHJlcG9y
dGluZ1xuIik7DQo+ICsJZWxzZQ0KPiArCQkvKiBVcGRhdGUgdGhlIGVycm9yIGNvZGUgaWYgYW55
IGVycm9yIHRvIGFsbG93IHVzZXIgaGFuZGxpbmcgaXQNCj4gKi8NCj4gKwkJZXJyb3JfY29kZV9w
dHIgPSAoc3RydWN0IGRybV9tb2RlX2F0b21pY19lcnJfY29kZSBfX3VzZXINCj4gKikNCj4gKwkJ
CQkgKHVuc2lnbmVkIGxvbmcpYXJnLT5yZXNlcnZlZDsNCj4gKw0KPiAgCXN0YXRlID0gZHJtX2F0
b21pY19zdGF0ZV9hbGxvYyhkZXYpOw0KPiAgCWlmICghc3RhdGUpDQo+ICAJCXJldHVybiAtRU5P
TUVNOw0KPiBAQCAtMTU2OCwzMSArMTU4OCwzNSBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsDQo+ICAJc3RhdGUtPmFjcXVpcmVfY3R4ID0gJmN0
eDsNCj4gIAlzdGF0ZS0+YWxsb3dfbW9kZXNldCA9ICEhKGFyZy0+ZmxhZ3MgJg0KPiBEUk1fTU9E
RV9BVE9NSUNfQUxMT1dfTU9ERVNFVCk7DQo+IA0KPiArCW1lbXNldCgmc3RhdGUtPmVycm9yX2Nv
ZGUsIDAsIHNpemVvZigqZXJyb3JfY29kZV9wdHIpKTsNCj4gKw0KPiAgCS8qIGRpc2FsbG93IGZv
ciB1c2Vyc3BhY2UgdGhhdCBoYXMgbm90IGVuYWJsZWQgYXRvbWljIGNhcCAoZXZlbg0KPiAgCSAq
IHRob3VnaCB0aGlzIG1heSBiZSBhIGJpdCBvdmVya2lsbCwgc2luY2UgbGVnYWN5IHVzZXJzcGFj
ZQ0KPiAgCSAqIHdvdWxkbid0IGtub3cgaG93IHRvIGNhbGwgdGhpcyBpb2N0bCkNCj4gIAkgKi8N
Cj4gIAlpZiAoIWZpbGVfcHJpdi0+YXRvbWljKSB7DQo+IC0JCWRybV9kYmdfYXRvbWljKGRldiwN
Cj4gLQkJCSAgICAgICAiY29tbWl0IGZhaWxlZDogYXRvbWljIGNhcCBub3QgZW5hYmxlZFxuIik7
DQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiArCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21z
Zygmc3RhdGUtPmVycm9yX2NvZGUsDQo+ICsNCj4gRFJNX01PREVfQVRPTUlDX0lOVkFMSURfQVBJ
X1VTQUdFLA0KPiArCQkJCQkgICAgICAiYXJtIGF0b21pYyBjYXBhYmlsaXR5IG5vdA0KPiBlbmFi
bGVkIik7DQoNCkRvIHlvdSBtZWFuIGRybSBhdG9taWMgY2FwYWJpbGl0eSANCg0KV2l0aCB0aGF0
IGZpeGVkIExHVE0sDQpSZXZpZXdlZC1ieTogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBp
bnRlbC5jb20+DQoNCj4gKwkJcmV0ID0gLUVJTlZBTDsNCj4gKwkJZ290byBvdXQ7DQo+ICAJfQ0K
PiANCj4gIAlpZiAoYXJnLT5mbGFncyAmIH5EUk1fTU9ERV9BVE9NSUNfRkxBR1MpIHsNCj4gLQkJ
ZHJtX2RiZ19hdG9taWMoZGV2LCAiY29tbWl0IGZhaWxlZDogaW52YWxpZCBmbGFnXG4iKTsNCj4g
LQkJcmV0dXJuIC1FSU5WQUw7DQo+IC0JfQ0KPiAtDQo+IC0JaWYgKGFyZy0+cmVzZXJ2ZWQpIHsN
Cj4gLQkJZHJtX2RiZ19hdG9taWMoZGV2LCAiY29tbWl0IGZhaWxlZDogcmVzZXJ2ZWQgZmllbGQg
c2V0XG4iKTsNCj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJCWRybV9tb2RlX2F0b21pY19hZGRf
ZXJyb3JfbXNnKCZzdGF0ZS0+ZXJyb3JfY29kZSwNCj4gKw0KPiBEUk1fTU9ERV9BVE9NSUNfSU5W
QUxJRF9BUElfVVNBR0UsDQo+ICsJCQkJCSAgICAgICJpbnZhbGlkIGZsYWciKTsNCj4gKwkJcmV0
ID0gLUVJTlZBTDsNCj4gKwkJZ290byBvdXQ7DQo+ICAJfQ0KPiANCj4gIAlpZiAoYXJnLT5mbGFn
cyAmIERSTV9NT0RFX1BBR0VfRkxJUF9BU1lOQykgew0KPiAgCQlpZiAoIWRldi0+bW9kZV9jb25m
aWcuYXN5bmNfcGFnZV9mbGlwKSB7DQo+IC0JCQlkcm1fZGJnX2F0b21pYyhkZXYsDQo+IC0JCQkJ
ICAgICAgICJjb21taXQgZmFpbGVkOg0KPiBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMgbm90IHN1
cHBvcnRlZFxuIik7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwkJCWRybV9tb2RlX2F0b21p
Y19hZGRfZXJyb3JfbXNnKCZzdGF0ZS0NCj4gPmVycm9yX2NvZGUsDQo+ICsNCj4gRFJNX01PREVf
QVRPTUlDX0lOVkFMSURfQVBJX1VTQUdFLA0KPiArDQo+ICJEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZ
TkMgbm90IHN1cHBvcnRlZCB3aXRoIEFUT01JQyBpb2N0bCIpOw0KPiArCQkJcmV0ID0gLUVJTlZB
TDsNCj4gKwkJCWdvdG8gb3V0Ow0KPiAgCQl9DQo+IA0KPiAgCQlhc3luY19mbGlwID0gdHJ1ZTsN
Cj4gQEAgLTE2MDEsOSArMTYyNSwxMSBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVj
dCBkcm1fZGV2aWNlDQo+ICpkZXYsDQo+ICAJLyogY2FuJ3QgdGVzdCBhbmQgZXhwZWN0IGFuIGV2
ZW50IGF0IHRoZSBzYW1lIHRpbWUuICovDQo+ICAJaWYgKChhcmctPmZsYWdzICYgRFJNX01PREVf
QVRPTUlDX1RFU1RfT05MWSkgJiYNCj4gIAkJCShhcmctPmZsYWdzICYgRFJNX01PREVfUEFHRV9G
TElQX0VWRU5UKSkgew0KPiAtCQlkcm1fZGJnX2F0b21pYyhkZXYsDQo+IC0JCQkgICAgICAgImNv
bW1pdCBmYWlsZWQ6IHBhZ2UtZmxpcCBldmVudCByZXF1ZXN0ZWQgd2l0aA0KPiB0ZXN0LW9ubHkg
Y29tbWl0XG4iKTsNCj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJCWRybV9tb2RlX2F0b21pY19h
ZGRfZXJyb3JfbXNnKCZzdGF0ZS0+ZXJyb3JfY29kZSwNCj4gKw0KPiBEUk1fTU9ERV9BVE9NSUNf
SU5WQUxJRF9BUElfVVNBR0UsDQo+ICsJCQkJCSAgICAgICJwYWdlLWZsaXAgZXZlbnQgcmVxdWVz
dGVkIHdpdGgNCj4gdGVzdC1vbmx5IGNvbW1pdCIpOw0KPiArCQlyZXQgPSAtRUlOVkFMOw0KPiAr
CQlnb3RvIG91dDsNCj4gIAl9DQo+IA0KPiAgCXN0YXRlLT5wbGFuZV9jb2xvcl9waXBlbGluZSA9
IGZpbGVfcHJpdi0+cGxhbmVfY29sb3JfcGlwZWxpbmU7IEBAIC0NCj4gMTcwNCw2ICsxNzMwLDEz
IEBAIGludCBkcm1fbW9kZV9hdG9taWNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4g
IAl9DQo+IA0KPiAgb3V0Og0KPiArCS8qIFVwZGF0ZSB0aGUgZXJyb3IgY29kZSBpZiBhbnkgZXJy
b3IgdG8gYWxsb3cgdXNlciBoYW5kbGluZyBpdCAqLw0KPiArCWlmIChyZXQgPCAwICYmIGFyZy0+
cmVzZXJ2ZWQpIHsNCj4gKwkJaWYgKGNvcHlfdG9fdXNlcihlcnJvcl9jb2RlX3B0ciwgJnN0YXRl
LT5lcnJvcl9jb2RlLA0KPiArCQkJCSBzaXplb2Yoc3RhdGUtPmVycm9yX2NvZGUpKSkNCj4gKwkJ
CXJldHVybiAtRUZBVUxUOw0KPiArCX0NCj4gKw0KPiAgCWlmIChudW1fZmVuY2VzKQ0KPiAgCQlj
b21wbGV0ZV9zaWduYWxpbmcoZGV2LCBzdGF0ZSwgZmVuY2Vfc3RhdGUsIG51bV9mZW5jZXMsICFy
ZXQpOw0KPiANCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
