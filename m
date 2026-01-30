Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOhgJQwifGmgKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:14:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8373B6C1B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6844610E8E1;
	Fri, 30 Jan 2026 03:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUQiIXhT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE7010E8E1;
 Fri, 30 Jan 2026 03:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769742854; x=1801278854;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TbEIekzpM26ri4lPX6RBlScsMbG9LlHVyEcNQzsXCVk=;
 b=aUQiIXhTujWW7F4LS011eTT8eKZqUmr011K7ZoJRXBBv2ebU8dlhd+Vn
 gTtrkUSXSWcJzUGquLAQttTAem63i/DJHVs6BN8rHUl+tZJ+YcTMBXDtO
 85OXH4MoU4u9vsodg/sA+6r+r2cqBKyNUqOGT82PGj1mQ8RZKqGMsv/Dl
 P/Ba8s7+Ysgjx5hASE3KlLVpMqCcGLEly2YJ0J4Za/EpOkrrYyipsyg5t
 JhqHxA1shS74AewIzZFF2s8mbMBiEubH9g0T0WPE/r70j/RQ/fmqxvfFQ
 pDYkKtxfQ6iGlXNNRA6yE6hCI9IvmKar6oXwgF8GLjk5b/tlvvKNzUQk1 g==;
X-CSE-ConnectionGUID: y9SLwO6cQsabWxpWrEmT4A==
X-CSE-MsgGUID: lBKIPgmtTQaolP4cqlqOHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71082272"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="71082272"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 19:14:14 -0800
X-CSE-ConnectionGUID: mRNs+tLqQS6oov1U6OXlNQ==
X-CSE-MsgGUID: XRLtR41/SYqQ1Bmr4ARltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213650606"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 19:14:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 19:14:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 19:14:13 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 19:14:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWgZBh5n1g/B29MvG85CrV7lLJvNguHY64QClnoZMbljfg/fG3mSrBYhulQ2li5qE1FUUfnXB1QBTu1dccLjzwVRpEcGR3Mwj0bwrpYfVcvePaEb/3oFKF3HGLkTYI4d4FXGWP83d/zb+TUE6LKzu7jOfoxEgy0MBfGEHrPyHrd6Apj2aul8w84BcjLc7f3pQ0OeC/keK1kjhVi2J4ejgEDHhq+RxvFQEueXkfyyfrOVkW5U2V9AGVOWjSmIRgI51s0epNeOj2J+wR5JDs6OzglccjPTTyvjMQL8urOD5ni8xRzd/KAR375lGqWCz8n2L3n3o1Srftn2aKlB2jwebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbEIekzpM26ri4lPX6RBlScsMbG9LlHVyEcNQzsXCVk=;
 b=COZJV48fT4c1hEJowN2nxy7/YDKjMpts3saztMVQAaJ8HWRxzFxR+oa5rPnsoYdv++lSOLxh7OX1/8m1fkYWEh240UDPqUufFGc1f2k74z/t5xiBDbSSTtWhxlHUeMp7b4/he3xieFy/nu9kutvyl7TDYLiukYm2M23Hzh1Yu4EbuEXnI2oV1gNk8Xw4gIEw0np+ffytvecEZwtgAQ9FlAkuXT/aImYO+4MaTXDSvJ2cRX5vP5VaseSPYGPEV766Pz3gXmk5iNjbl+WUtmx93pGTv83oqgwx+2siXZn8XnvQz4iDVpYl1qGW7ndP+GyzTbKtkhFFvDtnNhSZSV3Zng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV2PR11MB9537.namprd11.prod.outlook.com (2603:10b6:408:378::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 03:14:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 03:14:11 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>, Ankit Agrawal
 <ankita@nvidia.com>, "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>
Subject: RE: [PATCH v5 7/8] vfio: Permit VFIO to work with pinned importers
Thread-Topic: [PATCH v5 7/8] vfio: Permit VFIO to work with pinned importers
Thread-Index: AQHcjWXEwWs3aaCWa0yqZQvYjL77jrVqEa1Q
Date: Fri, 30 Jan 2026 03:14:11 +0000
Message-ID: <BN9PR11MB527671BA155807D44E58CB608C9FA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-7-f98fca917e96@nvidia.com>
In-Reply-To: <20260124-dmabuf-revoke-v5-7-f98fca917e96@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV2PR11MB9537:EE_
x-ms-office365-filtering-correlation-id: c1d28405-5cd9-4cda-74af-08de5fada397
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?VHRKQVIwYVdDYnBWOElkNXY5Rk5XaVVReDBZUERYSVV5WXU4bStGQitxcVEr?=
 =?utf-8?B?bEZwcVdKb0lnRFBKR1NkMWUzWFArajNSQ3pBaVE5MndWTGVQZ0RsZXJzbWh5?=
 =?utf-8?B?c1JVYXdHeFB3NnRYQ3pya1RzMXFPdmNpSlEzaVp0NGgvL1AxSHFlVUhmd0lV?=
 =?utf-8?B?ajcva0QyRjArUTR6MDkrY0cwQzYyRG9WamJNeFpzQmpkN2ZYcHFvREJoQ1lH?=
 =?utf-8?B?ZjFRZ00vN1B0Q1RmTzhWNHVFT1FUbTZLckdIVjRCaC9hYlB3dmJHVUhvMTVC?=
 =?utf-8?B?WjRnRHNxbkgyWEZKTldoOFZPejN0QlcyZFVtUzg0K2IrWnhKbGdsRkhWc1Qr?=
 =?utf-8?B?TFFXZHgyUkNSSngvbC9keThWTDY1T2o0VTBBL3lwYWlKcFprWWEwWlU2bFMv?=
 =?utf-8?B?OFhzbkVEaDJ0MTI3NnpZMlBiSmVJZzJFS3VzaXczcExhOEdrNkpVa3ppMm1s?=
 =?utf-8?B?aVExd21ndGxKT2xpSDZ2VUFMeEYrMndyOFhHV2NzSERGUFlrajJ3VDR6c3Zy?=
 =?utf-8?B?Q3laN01zV0JmNktTRCtBRXZJd0JqZEZKNUN5ZklwaGNLSm5oa09wc1NWRHNl?=
 =?utf-8?B?WmEzMWVDRE42citTQXl3K3phTzU1VHduaVA1aU90d0NxaEI3Mno1WmFuNVJO?=
 =?utf-8?B?ZFhubjQyVEtnVE82Ym1lQjlSU1NjR3dZbytVdGk5ZEk4Yi95MEs2UGt6c3Ru?=
 =?utf-8?B?UG1vbVlSN2crRHVqMGppUG5EOGo1N3gvRlE5TnFoZHpCTTdBZ0lkZ2xZM1hB?=
 =?utf-8?B?d3JFTjA5RENqVnhwclR0QWFrcmYzVWRUMXVlWDRNVXZxL2NBS0d3UkIzNFJB?=
 =?utf-8?B?WTNmQU1QY1JRMXkzV3Yzc0dic2hXMjgyQTkxTXhhWHpKckM2MlpGQmtseUd0?=
 =?utf-8?B?eWY1enErYitSV2FLaklmQ0lxczZoblllZTZIbzhWUGNVa1VzNGZ6dUtGYWEv?=
 =?utf-8?B?aU0xOHR1eXU5MndjQnpZNlFwdTJ4NWFPM2k2UFhyRXZ2YU0wRndpRXg2TzJZ?=
 =?utf-8?B?bE9RMjNGdWZCRmp3ZzFKbU53a2oyWEJIa1cwY2pQS21rVzh3bFlsV1NobE9B?=
 =?utf-8?B?MjNjMUdUdDZIa0pzODl2VjN6a0RMZndnTXNsdGI3Z2JvVHovb3dLQ0U1Wlp3?=
 =?utf-8?B?RmpDQytVQkFWYXN0cVB6SXJwWTF0VnN0cXdmbk9mM3BzU3VMTStDbTZsWVly?=
 =?utf-8?B?RFRDNWRTNWQrQjZMWElwV2xkL0prNjZvS0grSmN5SjJUdVRncTZSMXRKQmtB?=
 =?utf-8?B?V1RPSTVKNmg4MGEvYXZuRlhsbTlIN2ZlMWRia0MwdGNkdDBhQlBqV0lHK3lr?=
 =?utf-8?B?YXlNQ1Z4UmlpbHlNa1ppaGlRZGp6czF4dG1YZXJKY3IwbUVxenZqcDJTRmpF?=
 =?utf-8?B?VWRmRS9LQzVCTnpXaGtUMEpqT3pYRUNiTEM1bWMrdXZxbk5SS1ptSGQ0TWo5?=
 =?utf-8?B?cjBxeVI4dVJSNm41Qm83ZWppUmk0eWl3MTRnS0psRWFqR1FaSy9LaTc4OWpB?=
 =?utf-8?B?TXoxU3R1L01sOTJqclBvdEtEYk5RY1JZRFZkeGNqbi85bDRmbGg3ck1IYzFz?=
 =?utf-8?B?R0ZYS0lkNmNmS2ViYU1SK3VWS1NWdnZlZDE1VkxnTUg2dGgyRzl0STA1MWVQ?=
 =?utf-8?B?bWZCWFFXUmdjd1BsbHorb3FnNDUybG8wcy9PQ3d6d1pBRGQrR1IwMjk5YXlq?=
 =?utf-8?B?Vjk5K3JGb1BmUlExVmxUcmV2ejdXampHZWZaYnA5NjJ5UEMxVFkxZmFQc3Fw?=
 =?utf-8?B?TWZHWlFaeTRMVW9INlRLV2J6Y1JlMFIvWjYwWThxQ1FEbjZ6bDFZVW1oVTJJ?=
 =?utf-8?B?UldnZXlWMFZIS3lqVHhSc2N6K3BWMGRxVmYwblZWSDU0T04raHd2VkkzM0ht?=
 =?utf-8?B?b2lwc01DU0thQ0s1MCtYTHZZYy9SbmxkZkJzVmhiV1dNV3d6eHFqUmU2ZU5w?=
 =?utf-8?B?ZGpEWi93ZHd1TzlpS1ZwV0h1VU9lZVZrbWwwVVhta2ZsRG5vN25rQS8zLzRP?=
 =?utf-8?B?Y1gwSXdsWnNPK1p0cVd0cDJvK2lweWNBVnljQjM5QnZOQnIrOGFYaFhMSVFx?=
 =?utf-8?B?bnBEb2RTMmJ6bHhYMUgvT3dRRDBtU0NVRDFOOGUrTDRJWFlOZ3k5aHJDemJa?=
 =?utf-8?B?S1lnRU9RQjcyUURGdktIL1BuM3ArVVZPVXhNSjNmc2FSTTdWejllVU5vY2N3?=
 =?utf-8?Q?RKuY4e/QdSnvaKg38CI34E8NtwGRcQ8AELg6XMokqRNL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0hiN2FMYTdqZTdMWS90VGlKR2c1Z0w4MlFrR1J6RktEd3IvNkx6bXJBM290?=
 =?utf-8?B?eWZpVTJQeitvanh0dmx5RWlvWDBCMUJJNVpicCt2a1lxc1h6SC9HZnFKWFU0?=
 =?utf-8?B?OEpJWkRsUXZHUTJnMVBRYnhrTFhEKzZTMDRmWXdVc2RqbnBFNDh4OEFSZWRk?=
 =?utf-8?B?UkRtMUt0OXhVN29mWnkvdGlSVHlHdFFrZUdYbDZsNEZkS2p4SjlLbUtHSzgr?=
 =?utf-8?B?RGdla0lETTdjelczVEU4T0YvZU82aXhtYXVTNTdtRnZydlRUS1JUYXJXTjdi?=
 =?utf-8?B?ZUxOYjcxdmVmdHd6K2pTeEMzdWVCWmNwMjZ6dzFyZ25MN2UyVVlGNTRJY2Ja?=
 =?utf-8?B?Q3h4R1pwMXJBRkJ6bXd6aUtUaUJKVmh0UlNUN3liYWhzbXRCSEMyeUdZQUly?=
 =?utf-8?B?SlBlc3ZmZmVvenZUSFJlYTlkWXgzbXJpc3lIS245QlNLTFB0b25oWkxIVE5K?=
 =?utf-8?B?V0lJaTQzS1ZmNkRmSC90YW9CdWZNUGk5Z2VnK2ZJbHVZMThsMnNaeDVkV2hz?=
 =?utf-8?B?SVBRRExENkd1U0kyOUkxcDdjTk14eEtBTEdhM3M2RnhVS28rOHhNdDdDeEJy?=
 =?utf-8?B?RU0xMjVkc1F6Uk10QkY1cHM2ejFwd1hmTUg5elVxeU5obkNTaFhGWVBTdElY?=
 =?utf-8?B?R3lUcEc3a1p5MXJUT0Q2cnJQbTQ4S3J0enp3TURHZTVtMjlVc1Q3T1Zobjh5?=
 =?utf-8?B?RkxMdjhvdXUzNzNLZUQzTmhnN00xU2xaTWdOcG1Fbm5yVUc2bHd4MXRKUVhC?=
 =?utf-8?B?UWNMV3cvamJQUHJPcHhCYjMwV0thSUt2SlJlckR1aDlvejJ6S0pERmdmU2hQ?=
 =?utf-8?B?YnNic0tOeXlFWThuUm5RSFVlL3hLRHU1bGJPRld4dHMrejdxTWwvUEpYVE0r?=
 =?utf-8?B?QlNnek1uTVZKRWhzRlF5cU1YZjAzenpuakVNckxuVXlHYVZSUjlNOFpXazBv?=
 =?utf-8?B?STNIZUtjVnFXVU8rMmdvL2cwVHVTV1l3T1hHTFg2eW9BSjJ6d3BuOHZ4SVVY?=
 =?utf-8?B?M20xY1F0czF2OHljcVFWUHhxMStBczRiU0FDdUZiN01WZVV4SE0yZjhvS0ZU?=
 =?utf-8?B?K3JGSUpzUXQ3M3VwN0RYbEFqMks2Y25FckJpTXRtOHVuSmdZRER1dTlBOVRN?=
 =?utf-8?B?emY3S1NOSk82YVd4bUJXNEE1V0RjNDJseGNkL3Fad3VpK3BPRDRXeDZqckVV?=
 =?utf-8?B?R2tJdlpLdnhKOTdNQ1RlTzJPeVlySld4RHNYNGhyL3Z5c00zejdDcWxRVFRZ?=
 =?utf-8?B?Y0t2UUZ4ZldXUHBBNFhKZkVKSExlVHhrb1RtNWRNNUFTTUI4aEVIUTBDdkEx?=
 =?utf-8?B?ZW5OMHRrRVJ2ZldmNmVjYTdxOEJpOUtYRDBhOFd3NmRPangyMjhlRVExNTVa?=
 =?utf-8?B?YmYxQzNKS1U1Q2FvRmo5czNyQlV5cVhyMDRwTzFiV3c0U1Y4V281UWhXWUdP?=
 =?utf-8?B?Qnlxc0pYSVhTNjZnY0NHQTU3a2IxT0hFRUdUVlYvLzNMcVkrbEx4cStSTmRr?=
 =?utf-8?B?Z2hDcE0vUUs5MS9DM1hwWVdMMFYrQmJNYTUzZkpjRnIwVXlRWXpyMVhYOUxp?=
 =?utf-8?B?WmU0RW9HY1VOUU8rd3NOdWp4UkJrZS81b2JEa0gxQWtHT052b0xSWVJPZ2hy?=
 =?utf-8?B?bDV1b3V0c0FYZ01vTWNZdmZNR09sdktsamFTaEViUnkwbGo0RkVlRHJ2VmI2?=
 =?utf-8?B?WnBNSmgxbnZYQWJaQStVSjUrbWVucW1CNndTSHFWY0x1TkREK2VoR1ZVTGlS?=
 =?utf-8?B?WEczQlAwcEVKaUJMS0ZZaWN1aUFZNjhpWHVJVzlMQU9oRmlBZnAwMENpUUtN?=
 =?utf-8?B?eG9Gckw2UEFmV254cWVvVkVkbVM4aENKTjVvOXdjWXBtZFo2ZlNYU3l6aFpa?=
 =?utf-8?B?dE5QZ1M1NzB0cG01dVVhaE5rVE05TnRQbkhYdUZZUHhnYWxyeXVkd0p4RUhE?=
 =?utf-8?B?N2xQTytDaFYrblFMMzRVeVNSQ1Q2cDdPMzJWV1FtdTh0NWNDWEVMc0JNb09G?=
 =?utf-8?B?VHdBSERWY081WUxTekNoM2U0dSt4bUN1SDRCcFMyREtrZUo5Qy9pTG1NZ09X?=
 =?utf-8?B?UU9mNUI2RHEvZVYycFdXUkptZ0grSmdCTXhJKy80NGtDLzRid0dxdDdXejM1?=
 =?utf-8?B?WHVkVGdLSHhEWFFYRzBxZ1Y1d2ZSSENQanZlUjhwYk9Tem81SzRqTUhsTEJk?=
 =?utf-8?B?d3V4WkpKS3NoYkRKKzVoUENUakF6MVV6VlhKRVhTMG8rcW9wczFlZXlwV1Vp?=
 =?utf-8?B?THdRZlJIRmw2SmQ0dnV4VnM3amFUYmFubWl5NG9PcTcyMmw0T1d1NXZVMjRa?=
 =?utf-8?B?cWxEMGU4RXNmUmlXTk40RlZqdEM0cHZEMitQSXdOVWx3NWE5bkR6Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d28405-5cd9-4cda-74af-08de5fada397
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 03:14:11.1409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dBt+OlWmtGXiK3wgNWNtQEgMfsaEKv4RJ7anvIUDdTgGlaq5F3arUxHxKcXWwpWZq4y5ujDYhyDeRbTtPGSEeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9537
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[BN9PR11MB5276.namprd11.prod.outlook.com:mid,intel.com:email,intel.com:dkim,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E8373B6C1B
X-Rspamd-Action: no action

PiBGcm9tOiBMZW9uIFJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz4NCj4gU2VudDogU3VuZGF5
LCBKYW51YXJ5IDI1LCAyMDI2IDM6MTQgQU0NCj4gDQo+IEZyb206IExlb24gUm9tYW5vdnNreSA8
bGVvbnJvQG52aWRpYS5jb20+DQo+IA0KPiBUaWxsIG5vdyBWRklPIGhhcyByZWplY3RlZCBwaW5u
ZWQgaW1wb3J0ZXJzLCBsYXJnZWx5IHRvIGF2b2lkIGJlaW5nIHVzZWQNCj4gd2l0aCB0aGUgUkRN
QSBwaW5uZWQgaW1wb3J0ZXIgdGhhdCBjYW5ub3QgaGFuZGxlIGEgbW92ZV9ub3RpZnkoKSB0bw0K
PiByZXZva2UNCj4gYWNjZXNzLg0KPiANCj4gVXNpbmcgZG1hX2J1Zl9hdHRhY2hfcmV2b2NhYmxl
KCkgaXQgY2FuIHRlbGwgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBwaW5uZWQNCj4gaW1wb3J0ZXJz
IHRoYXQgc3VwcG9ydCB0aGUgZmxvdyBkZXNjcmliZWQgaW4gZG1hX2J1Zl9pbnZhbGlkYXRlX21h
cHBpbmdzKCkNCj4gYW5kIHRob3NlIHRoYXQgZG9uJ3QuDQo+IA0KPiBUaHVzIHBlcm1pdCBjb21w
YXRpYmxlIHBpbm5lZCBpbXBvcnRlcnMuDQo+IA0KPiBUaGlzIGlzIG9uZSBvZiB0d28gaXRlbXMg
SU9NTVVGRCByZXF1aXJlcyB0byByZW1vdmUgaXRzIHByaXZhdGUgaW50ZXJmYWNlDQo+IHRvIFZG
SU8ncyBkbWEtYnVmLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGVvbiBSb21hbm92c2t5IDxsZW9u
cm9AbnZpZGlhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPg0K
