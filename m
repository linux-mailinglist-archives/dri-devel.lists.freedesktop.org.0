Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB1CF6A36
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 05:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B00D10E471;
	Tue,  6 Jan 2026 04:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLx4oJqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC6610E46B;
 Tue,  6 Jan 2026 04:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767672278; x=1799208278;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hgCWh577v6+L6NfPNGafhzCLKbtR1GhsgVy9bTt97K4=;
 b=dLx4oJqytbVfFoOrGWnlzq8flVcBVtb7/MFFwxV2pX7IHbPm+xiGCKYO
 S1mIiyQZgjoO0ejBYKC1+yQ/x23Jsc5BLSAkFYnBcenRHay9Z23KJSCk0
 x8i3Zw99V+w3C4Bi6XO5OOCFTbRq/Bwm2f3CDfWl0wxsIfZZ6iNlE4Hq3
 WgvUmdAYtYvMRqvCQ/yymS1jgGNa+5gW5Qjre8RqP2sYPT9OAqKGLibeh
 oAG8qcBb0rKVfsOKIsipcWNKW2/xpm9V4tRPUaqT3ObSPEbh+8lv3vrPD
 Ut/v0oELPPL/qtxyGBG9Um5KWTrJBxcFEzoQQZQiDU7qjQfYCqmi6vvEc A==;
X-CSE-ConnectionGUID: 5nKnyzZPTNKcVFnj5tUdJA==
X-CSE-MsgGUID: qYY2lZRcT9WNFyWBWbCEzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68779906"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68779906"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 20:04:38 -0800
X-CSE-ConnectionGUID: nf0SNUPBQkmd6W7+3UfUsg==
X-CSE-MsgGUID: W9Zs3egWQqaJtd8Sll1s3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202324849"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 20:04:38 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 20:04:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 20:04:21 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 20:03:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sdq/W0lymUKERDpwcemOpNUc0SAi+pRnGUyJLa/GKTOoyvp4Y2WeO+/me6FVjCq1p9ua85j3ro9HjLGtA3I/rWb8Le4+3+yuAG1rHTWRtcXl9A2Z7c4gagWtd+u+KjVBMBAvhnGXg08Alv8VgZbIUQAJ43R+YEavkLCmw0bdsUdCv8FhvNQXBFXNY8fI1eeGrkPqo9S4e8NcAtvQHvNLOvIP5fbNS0dMtdW37mm/6/iIOYBO0YkBur+snnzxYOZtLuXkuzx8dYm5GWA+wp3Bofjh0yI5iEHylpmiNPGKNPoJR/fKcv32fscR2B4itXnJaTvQhmAeT5ApCQbTPd+Cvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3H5lZe1JLeoL7GHpDHSIT8xyy/YLsZKTLHPnssFzvE=;
 b=lVR/BIc2CXebv6z/xr5x5psXmd3rrtnIAUZyPMTnGNG2jzXxPDZd/N06ThaTa46QFaUthaXdA7blSkto9l4uDdU+X248Y59IbwtsR5m+4Wg7gKOcFLpeJEcBwLrPt13taIrC9b+03IrRa+lMd1xTxVg46dY01sHwrgapcpcrvcMmI9HNFZ1Or57ubMEccdhY4MRxUK5u+s2BnUuxfqXkxt30t16M52glgHbOhsG+qrTItJi2lk8WbNHWk1RIpk5qc8fKBIiohD+olo/hCSgu8uK9ls2Uw+dVlLDexb9PAHbwKouBZHUlLqJhNKd8JCQjymYTJPsrR7AKni8ukc2hhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 04:03:15 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 04:03:15 +0000
Message-ID: <91aff155-7c12-444e-a876-e1b831e97a37@intel.com>
Date: Tue, 6 Jan 2026 09:33:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] drm/atomic: Return user readable error in
 atomic_ioctl
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, Maarten Lankhorst
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
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
 <20251009-atomic-v6-4-d209709cc3ba@intel.com>
 <DM3PPF208195D8D35B470FB27BB47AD262BE3FAA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <DM3PPF208195D8D35B470FB27BB47AD262BE3FAA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0253.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::7) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DM4PR11MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 67897b99-cb08-4b0f-b38f-08de4cd8847a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R01PcnY3ZllqV1d0Tll4WEtRTWxZWVAweFJHNjZzZ1laVWxoWFRLYmFSSDR6?=
 =?utf-8?B?MWdTa1pXVDh6SmFnRFNDaUUzVFZ4b0VnMGhBaXY2a2RrVHhBNGlwZnZiYU5H?=
 =?utf-8?B?WEQzZ1NwcUZYTnBpTDBleWkwS2FkZTQxUlBYaWl3WStIOW1WT0FhSnNSME93?=
 =?utf-8?B?Yys4bjJ0U2RjWjBYSUhWVkhvZlRUUUNvTlN4TkNaK1F3cy9GYVFWTHlLRUpi?=
 =?utf-8?B?NnpCKzAxc0pJQTdVS29ZbjVWY3VsVjYvRU90UzI5M25UTFhPWnFUbVBtbEhE?=
 =?utf-8?B?SExJTXpUOHBKR1Z5c1NsVzhBc1VlOTNyTTVXdDJRSE1nREJMaFRzaUpuQ3k3?=
 =?utf-8?B?YkR4blNsUFpUbFJQOVpvN0s2R0ZTUFIwcHJsT1BKYmFMajA2M29mWHYxUHZj?=
 =?utf-8?B?eERVSkE4cHY1VkM5TkZGdlpsTDgxb2cvbjBseitlSVVyUGdNc0Jrd1BPN3pl?=
 =?utf-8?B?eGtTNmpBeTdLSjJiMXcrbjQrbFQ1c0JEcTNpWmNHbmJmNXFyNjZDT2d1Ti9y?=
 =?utf-8?B?K3VFcVFMQ1k1ZlAzZDJrR2c5NzhBT0hCY2djM1VUZ2d2OTVmR2N1d1l3MHBa?=
 =?utf-8?B?VFhGNVRrMGtvc0NuaDZqbDNvbHNhMFpFRnNtMjVkRmZHRDBuYUpabUh3Si8z?=
 =?utf-8?B?K2d3bVEvTkh0ekQ0bnJnQUYxaVRzNklCMGtnU1RvWko4akczVDZ4N244S25w?=
 =?utf-8?B?Y2kxM1lNUG9ZSVBlUThrU1VqTzBlSFIrUWVKVU52OGZPai9ISmJNZWhFcEhN?=
 =?utf-8?B?SXZwVUd2RkZpN1kraEUrSXZLRnJZSUVadWpSWFBmSXVsc0l0cVFlendzR1FX?=
 =?utf-8?B?SExnQWtlOTN5RTlCZzQzTk54WWFxVTdWQVBmejMzcVAwUDRtaEZPb0dSK29v?=
 =?utf-8?B?U3B0dXdGZ0tMSS9CNUhUVWJEem5FUTZCRVVYOG83Vnc5RUNMMVJiOHkzZ1Bq?=
 =?utf-8?B?MnRrSTRwdmtROGpBd1hzSFpnL3YrMWlEYnJTUmdiWGVDMmxQZmVldW9TUmRG?=
 =?utf-8?B?RmZDQWFlaEgrVVlXR2tpNDdhd09XWmdNUTFGT0JFMlpTaVdhOXRhbWtIVzQ0?=
 =?utf-8?B?UkdIK0EzWC8zcHo4enpseS9MZUt1dUEySWNSYTN0M1NqVmhzZFpvenRja1VW?=
 =?utf-8?B?cGdKcWdVdk5EdW1pTEVDNDcvWTErTkpUVmp6eDNjQk45ZGsvWit3ZlY1dU5x?=
 =?utf-8?B?b1Joc1BEMWlFR2lwS1Q0NnR6R0dKVmROanc5QTZWeThKRUU4WXJRVHFJakkv?=
 =?utf-8?B?V1NnRlE5bFpDSWUvQWlTaXVOdllMYUJmWjJlVk5Ga0hOZDZUYk8zeTBlY0dy?=
 =?utf-8?B?TWdoRkJjeGw3TkdMYzdBR2p4bEh1Mm0vZnJlaW0zMm1QSGRCK0xyUVN6MEFk?=
 =?utf-8?B?UGROdUhYWThWNWlLak5UNUFGNUl0eS9jeXpRK2VhaWdaK2E4U0s5YUZTVXdp?=
 =?utf-8?B?aWV4T1BHUHpoNktZa3VaQTFwbjFzQ3JkQ0sySno1elY0VUVmSlRDVUxWYVpx?=
 =?utf-8?B?clU4OVVUN0ZZNzRjT1luT3hnYkFQSGhJWTZUd3lmRFlCNUhNNlNmRmYvZ2M0?=
 =?utf-8?B?UmF1WWJMVlg3WEo4MUdKWmhkZ0hjbTE4eWpuOWloN2N1UDdOSXh2cXBMTExY?=
 =?utf-8?B?algvRmVXSmJ3ZE11bWpFSjduOWpqazZIUHVDU1dIc0diZ005b3N4U0JnV0NG?=
 =?utf-8?B?bmt4dStDTGZkRnN2YWNDVjVwdWdFa3JPSkdTYjlKK0FlRkRJTWpUdmdpTGk5?=
 =?utf-8?B?UzB2NGNYUUg0RmZzcEM0WHJ6NUpSU20wUE9WRWxQWFFyV1EvTERFSlM2Wmh5?=
 =?utf-8?B?Ym9GeGxxZ01WZEZld1M2ako4RXV0ZHFlenFhKzF1d1VQbjdNMUpEdEhrUXFE?=
 =?utf-8?B?NitZTnFqTTVBVDRiZ3Nlenl5ajcyT0IyUXY3cGxmaDhTSHFCSEQrUDFHK2Vr?=
 =?utf-8?B?bnlxODA3SFNmOXorNWFVRU5tbExEaS9WSUNOTlpPTzhJR0NLYlgxNkJMaHhY?=
 =?utf-8?Q?1kQinQ4DtBJrNovCYrNY0qnwUDJaS8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDJveXFRelQ5ZlFmUVUxL3FFUkxJaFJscWlQUU55WFVWSEJBVnU4Y252d0kw?=
 =?utf-8?B?RHhFZlRiVStkUVVnRnZzWG5Kcmx5YWN2MGh1NzVEYlA0Rm5meWwxZFJUR3FX?=
 =?utf-8?B?L3I1alUvczltQm13a1FtQ1ovK0s0bUNoZEVBVEt6ejJzNnZLUFdhdVY2SjU2?=
 =?utf-8?B?RHhqQ1p3OEl4b0tGa2E2aytCcUw3aWtpNFFsSW9jaXlZMFJpcy9JRStsWEgx?=
 =?utf-8?B?TFpaODZnNGo1VENyYktQU1lVNkNjOE1BRTJZOGZKb1BOUktNbC83S2V3Q3d6?=
 =?utf-8?B?ODBGczhINkdtOWxFeUFCSEI3Rmt1eVBhVWFpVUdiY3hveUd2STZUSFFBU2M1?=
 =?utf-8?B?SnNwYWJncHpkc0NSNEZWYVZ6cFJiZGxKRUU4eTdwd2pNdEZ2VEVIUWlaK0dZ?=
 =?utf-8?B?QXIxSTUwZTVxbGovZGE1SDZsTWZFakZpcC9VUFhkUVZ2aE1SRHI4QkN3a05V?=
 =?utf-8?B?Skp1NW5OK0E0S3dBMGl1dmJCSUZPUG5SMUl6RDZZWWpmMkh3Y2FRaDRzQXYx?=
 =?utf-8?B?aHBJM0ZxeWh2NDd2dld0em9FRU5CbGU1cDNQR1BVdXpCN3laZnViK0NnMTQ2?=
 =?utf-8?B?d24vTjh1THF2bmVjMHlqMWJWdlF1MytHNkV3d01wQThkR3p5bnlrK2xvTFE4?=
 =?utf-8?B?Q2FPRHc4SVowTDZ4V09YbUtvc2Jwekh6VTZrVDdNbXF0cEJUZjRySjR4U3Vq?=
 =?utf-8?B?N2h2OTczb25hMnRqRzdCV2Q0d2FqRDROSFo3N2hCRWFseC9uL3gzaEcxSytL?=
 =?utf-8?B?Yy8vMnRJbEJicnVhMjFQVUh4MnNIL3NEU2NGRjBqdFFOa2V2b1A0ZGlaVmR6?=
 =?utf-8?B?QTUrWGVLTnZ1UFlocU1JMmdLT3J2NmFVM05GMlV5a2tyOEtCRm55OVNKVUJJ?=
 =?utf-8?B?K0hqalNJblZHUmlXQW5kN1ViUVdqaks4akpROWlOUjI0cTNRd1dzcHVGYjBN?=
 =?utf-8?B?YnBlSzFvT2FnbXRJM1lGZ0NjM2FsalNURU84UWcrSXFkaHlzcldianRvSkRF?=
 =?utf-8?B?Q2cyUkFUZGJJcWY4OVAyZjBiUWR0S1UwOUZEU3dWb2N3Ujh1ZkZQUTB4QlFF?=
 =?utf-8?B?M2ZVSjRXd3ZMZFVPR2hpTnVGczE1UW1mR3FYUW5nbEZ2NWFJb1UwQWxmaC9a?=
 =?utf-8?B?V3J0dmhtWGdSQk5qdFpaRWszRmNwZFRxWk12WURQUzBUcHhveFlHQ1A2OGRr?=
 =?utf-8?B?d1NMY1FFekppbkFhbTZqeUJrR0ZyNE5EbERtZUZCU3R6R2R5RHVIeFF2Mkh2?=
 =?utf-8?B?ZFJ1TjhGbVAzYTRVaWx2QW5Dd3hJc1NhRUZaR3cvYlR2UmlSQUJWMXBxbnlk?=
 =?utf-8?B?UGI1eUVMS3JuUkFTZnM2YlI0VVc5anZuUG8zTGlqVXI2N2hhNTVzUWxsaVJn?=
 =?utf-8?B?Z2dGZytuZjlFWXlEQU8zWG5KQnBueVdFdmlibk9TRGN3SERRRExCRHAxT1Q5?=
 =?utf-8?B?OTZYbFR0YW82T1BQVGMrWWJjSzUzRXcraDJwd2NCbVo3cGRHOUpCN0s2TTVQ?=
 =?utf-8?B?eTFJNlAyTHkxR1hhZWN5WGNScCtsRzZrdS94Zm5ZNE9ZY1czU1JOSVZFb2Fn?=
 =?utf-8?B?b2IxcHNSVDFVWFR2UXFXTUlIeCswSFcxNm5lckZ1Vjl1SHRmaUdUd1dXdGw1?=
 =?utf-8?B?QmdqNWRwRnJRcFJ2TWVTRWIrOHUxSm9keEdiTy83UkpDMUhoMFFxMGtRSnRK?=
 =?utf-8?B?RjhWTDVBVkpOZmk3eXRxUXgzYXFZdGowc1BIQ3VIK0JtY21sL1JEcU9yZmtr?=
 =?utf-8?B?L0Q4d20rNE5NeFNwaUs3SzRuSDkwZHUzK2hLNkhjUzJJVjdGbEVTZm0xQXdF?=
 =?utf-8?B?WGZ2MGNPWVRnT0hGUVVwWFdnWDRDTGtiWlNEN0pMRldjd0RIQS9kWUwvOFli?=
 =?utf-8?B?UHMvK1RVb2tJNjdJNUdSWVBySDhmWHorWVVsb3pUa0hGNHF6TkUrMDAvaUZh?=
 =?utf-8?B?b2toeTJSK1NFaVBYUnZySDJNYU9USHBWYlZvYmVDOENoR0ZveFQwd0hZSnla?=
 =?utf-8?B?SURETytwZ00yOUYzSTdmNk5zY3pxR2xNbHEvYlpUeDJUS3I4L2lOTEgyRUFu?=
 =?utf-8?B?QyszQ20xd01DcmxueGpPbW1wUHBIY1ZJeUdCcVpMK2dSU1VLMXlUNEg0UVhJ?=
 =?utf-8?B?R2kzSDhzRzRhRko4MTV4bG5NZFowVzF2cmVTOWNUUUtJc1UrQVRTRTJ3UkxC?=
 =?utf-8?B?SG0wQWxyd01oOHJQSGIzRXNSSHh2aEpUcDBFZk9GNldzd0VBNVErS0VHV2V1?=
 =?utf-8?B?cmkzakwxaUhGNy9BdDNieDFSdDBJc2J2NE9lY2lXRjUvejZSaHNtT1dlQTRt?=
 =?utf-8?B?SU1QZ2lYWjBvZUVDNVE4RkM3dVEraUZxQWZwWFJPcUlkL3ltQ05pQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67897b99-cb08-4b0f-b38f-08de4cd8847a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 04:03:15.5804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rje8aYLT+xWclNj958k2wy6QWcPmSisGCV+P2wdUQumfU9S3zErY4Hz5v1je5u03DKCyaZN8dvtrm/UQ4OPXOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6141
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

On 29-10-2025 13:45, Kandpal, Suraj wrote:
>> Subject: [PATCH v6 4/5] drm/atomic: Return user readable error in
>> atomic_ioctl
>>
>> Add user readable error codes for failure cases in drm_atomic_ioctl() so that
>> user can decode the error code and take corrective measurements.
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c | 71
>> ++++++++++++++++++++++++++++-----------
>>   1 file changed, 52 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
>> b/drivers/gpu/drm/drm_atomic_uapi.c
>> index
>> 3ef478e717bec917d1b8803c72bbcc8d6409d745..3d4e9709e8e289cf302413
>> e171b1336812d65c1c 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -1036,6 +1036,11 @@ int drm_atomic_set_property(struct
>> drm_atomic_state *state,
>>   			ret = drm_atomic_connector_get_property(connector,
>> connector_state,
>>   								prop,
>> &old_val);
>>   			ret = drm_atomic_check_prop_changes(ret, old_val,
>> prop_value, prop);
>> +			if (ret) {
>> +				drm_mode_atomic_add_error_msg(&state-
>>> error_code,
>> +
>> DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
>> +							      "property change
>> not allowed in async flip");
>> +			}
>>   			break;
>>   		}
>>
>> @@ -1058,6 +1063,11 @@ int drm_atomic_set_property(struct
>> drm_atomic_state *state,
>>   			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
>>   							   prop, &old_val);
>>   			ret = drm_atomic_check_prop_changes(ret, old_val,
>> prop_value, prop);
>> +			if (ret) {
>> +				drm_mode_atomic_add_error_msg(&state-
>>> error_code,
>> +
>> DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
>> +							      "property change
>> not allowed in async flip");
>> +			}
>>   			break;
>>   		}
>>
>> @@ -1096,9 +1106,10 @@ int drm_atomic_set_property(struct
>> drm_atomic_state *state,
>>   					ret = plane_funcs-
>>> atomic_async_check(plane, state, true);
>>   				if (ret) {
>> -					drm_dbg_atomic(prop->dev,
>> -						       "[PLANE:%d:%s] does not
>> support async flips\n",
>> -						       obj->id, plane->name);
>> +
>> 	drm_mode_atomic_add_error_msg(&state->error_code,
>> +
>> DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
>> +
>> "[PLANE:%d:%s] does not support async flip",
>> +								      obj->id,
>> plane->name);
>>   					break;
>>   				}
>>   			}
>> @@ -1393,6 +1404,7 @@ int drm_mode_atomic_ioctl(struct drm_device
>> *dev,
>>   	struct drm_atomic_state *state;
>>   	struct drm_modeset_acquire_ctx ctx;
>>   	struct drm_out_fence_state *fence_state;
>> +	struct drm_mode_atomic_err_code __user *error_code_ptr;
>>   	int ret = 0;
>>   	unsigned int i, j, num_fences = 0;
>>   	bool async_flip = false;
>> @@ -1401,6 +1413,14 @@ int drm_mode_atomic_ioctl(struct drm_device
>> *dev,
>>   	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>>   		return -EOPNOTSUPP;
>>
>> +	if (!arg->reserved)
>> +		drm_dbg_atomic(dev,
>> +			       "memory not allocated for drm_atomic error
>> reporting\n");
>> +	else
>> +		/* update the error code if any error to allow user handling it
>> */
> First letter in uppercase.

Done!

>> +		error_code_ptr = (struct drm_mode_atomic_err_code __user
>> *)
>> +				 (unsigned long)arg->reserved;
>> +
>>   	state = drm_atomic_state_alloc(dev);
>>   	if (!state)
>>   		return -ENOMEM;
>> @@ -1409,31 +1429,35 @@ int drm_mode_atomic_ioctl(struct drm_device
>> *dev,
>>   	state->acquire_ctx = &ctx;
>>   	state->allow_modeset = !!(arg->flags &
>> DRM_MODE_ATOMIC_ALLOW_MODESET);
>>
>> +	memset(&state->error_code, 0, sizeof(struct
>> +drm_mode_atomic_err_code));
> Isn't is better to have it as
> sizeof(*error_code_ptr)

Done!

>> +
>>   	/* disallow for userspace that has not enabled atomic cap (even
>>   	 * though this may be a bit overkill, since legacy userspace
>>   	 * wouldn't know how to call this ioctl)
>>   	 */
>>   	if (!file_priv->atomic) {
>> -		drm_dbg_atomic(dev,
>> -			       "commit failed: atomic cap not enabled\n");
>> -		return -EINVAL;
>> +		drm_mode_atomic_add_error_msg(&state->error_code,
>> +
>> DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +					      "DRM_ATOMIC capability not
>> enabled");
> I'd rather have it say drm atomic capability not enabled
Done!
>> +		ret = -EINVAL;
>> +		goto out;
>>   	}
>>
>>   	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
>> -		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
>> -		return -EINVAL;
>> -	}
>> -
>> -	if (arg->reserved) {
>> -		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
>> -		return -EINVAL;
>> +		drm_mode_atomic_add_error_msg(&state->error_code,
>> +
>> DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +					      "invalid flag");
>> +		ret = -EINVAL;
>> +		goto out;
>>   	}
>>
>>   	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
>>   		if (!dev->mode_config.async_page_flip) {
>> -			drm_dbg_atomic(dev,
>> -				       "commit failed:
>> DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
>> -			return -EINVAL;
>> +			drm_mode_atomic_add_error_msg(&state-
>>> error_code,
>> +
>> DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +
>> "DRM_MODE_PAGE_FLIP_ASYNC not supported with ATOMIC ioctl");
>> +			ret = -EINVAL;
>> +			goto out;
>>   		}
>>
>>   		async_flip = true;
>> @@ -1442,9 +1466,11 @@ int drm_mode_atomic_ioctl(struct drm_device
>> *dev,
>>   	/* can't test and expect an event at the same time. */
>>   	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
>>   			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
>> -		drm_dbg_atomic(dev,
>> -			       "commit failed: page-flip event requested with
>> test-only commit\n");
>> -		return -EINVAL;
>> +		drm_mode_atomic_add_error_msg(&state->error_code,
>> +
>> DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +					      "page-flip event requested with
>> test-only commit");
>> +		ret = -EINVAL;
>> +		goto out;
>>   	}
>>
>>   retry:
>> @@ -1543,6 +1569,13 @@ int drm_mode_atomic_ioctl(struct drm_device
>> *dev,
>>   	}
>>
>>   out:
>> +	/* update the error code if any error to allow user handling it */
> First letter in uppercase here

Done!

Thanks and Regards,
Arun R Murthy
-------------------

>
> Regards,
> Suraj Kandpal
>
>> +	if (ret < 0 && arg->reserved) {
>> +		if (copy_to_user(error_code_ptr, &state->error_code,
>> +				 sizeof(state->error_code)))
>> +			return -EFAULT;
>> +	}
>> +
>>   	if (num_fences)
>>   		complete_signaling(dev, state, fence_state, num_fences, !ret);
>>
>>
>> --
>> 2.25.1
