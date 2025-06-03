Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3328ACC880
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E68910E209;
	Tue,  3 Jun 2025 13:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PgCXfQ9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1440910E148;
 Tue,  3 Jun 2025 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748958795; x=1780494795;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=rWcKUo5a1NM64RigB3GsPPt1Ng7I3B2a4DqbTMkWgPc=;
 b=PgCXfQ9ebDHDiEmoNTRPjAbmRxjsA8+MkJFEfPZOESIdU3HbssrnrJE5
 6oUe2FTZaxMDbqROXlhlzbgvHROdRVZLd7xcJZKhXNE+WLlP3TNcitL7D
 zl6nUTeRtqjjKSkuMqEV+zrgORKs6D/Tk0Auh3nM1akC6kuDb6odcB5rV
 7ckTIcbdWeAYY1X+Jl8XmM0JbUB5xDy3sK+zM/q3YY4qT4YsjECqc5qLQ
 AIO7J1NbX1wDnynYCiHZmzYjBgO/8hx/l9qcCvulKUuyQ411fXijTpF66
 hAtC+bmhidj0c5uvAfssUsRNX5fVY1BWOnMSPEU85NM225PS51evGtXu0 g==;
X-CSE-ConnectionGUID: ZtYdCUptRNSIgL4knnLpkQ==
X-CSE-MsgGUID: xNT1zKymTZ2k7dU1vq+6OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54804357"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208,217";a="54804357"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 06:53:15 -0700
X-CSE-ConnectionGUID: c8UQSmO5QO2gqtGeeb4spQ==
X-CSE-MsgGUID: nvCJLtajTqya/geap5PWKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
 d="scan'208,217";a="145485820"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 06:53:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 06:53:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 06:53:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.74) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 06:53:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZXtnUtA/MfPtoBcggX6NbTKwQ/Kx18wlaveh8Ru2DzCO+x8uadG2O83JBcZ6szVPsuI5ziRHOmMO9JGglyAcCbUFhVGiT/SQvqsxEqodnu8Dlfeh2vcBSE4c4MiRGOmQ3vjyLsJzWerBhvmn/KNKy5oBwJqGfBEFzZuQixV7c5BMCLqQbh5HonB5K6IfSJESL6j0tF1/zsKYkoimLJ8VGfHA77w5EyoYjmCC+0rih93JEbEyAQUI62/j3D6MBUaHDu/kUleypVf76eVWsCjfQcIAi91ixpLjHWgoNhdHlLLIhSH2Ap9H0qsUh+CPZSejG4YL+ztUJ9Hx4eyBOlGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHqrmtfROuEDfKaROQ3/WX5ObD7X4PoEeFuVBx2q4iw=;
 b=qE17p4YVngydDBGrdSPQfsMGhFP2T2FqUXcaDz77n2hF7K9vtm5BuSrJFJFyl+0e1y1QG1Ki9aRkL0/reK/Ag7CaodzcezOkkdOv9JzU2BJ4VQuEA5pPyu9NgVRXNiN9qgai1QGWPHE/GdmmtcaieXf5n6cf7H3SFAaj0wnIEZ6jNtcNUw1nnY50Pt5g3zQmpAzNhMmC4ey1Pbs4T52+dCEBuobP7ZOxqIBlvgmFqoRRSIe5d/rGclw3tKNO+5Iv1WmJoFwkrklElOw4NaDfMcn433S4DwaKUBxXDeCyAqjikj+B6K/zgL/QCtVGoMsghIWToocuEVGFuRtIQLh06w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 13:52:44 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 13:52:43 +0000
Content-Type: multipart/alternative;
 boundary="------------dX2vv1UKU0u5xF4a0aMn5xOB"
Message-ID: <ddbf1e4b-cbd6-4ec8-96ff-30ba41fee5bd@intel.com>
Date: Tue, 3 Jun 2025 19:22:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/9] drm/xe/late_bind_fw: Introducing late_bind_fw
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-4-badal.nilawar@intel.com>
 <8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com>
X-ClientProxiedBy: MA0PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::9) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7f39f8-5a8c-4e1d-995d-08dda2a5e9e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGNPa1A3U2o0ZEgxQnlHODNHbFM2YURRajZjd1hyQnh3WUxiZUxuZzJlY3Vz?=
 =?utf-8?B?QkZPdzF2bW5od2lPNUpjTjZnRzlaS0NZb28rZWl2NEhpTUxQZlRrR1laQVRF?=
 =?utf-8?B?c05odjA3bmdkR2Z1akZJR0FnbW9xQWVUYm5wOXhSajFuKy9tWGtxUmRGbDUr?=
 =?utf-8?B?TDZZT0tnWktmTVIvaG03dk8zU0tXR01FMDNtRVRJakpSbENuR0dwbDNsbGY0?=
 =?utf-8?B?S1ZQMTE1VGtoaTN6QjZ0ckhiSGF0Z0h3OG4rbHFWSGVXU29kWS8rL3hpQk5u?=
 =?utf-8?B?dS9sYlhOMXlzZTY1aFltczF3SXVIZHNVbGtyU1VmcTFWbGU4NlNSamNmVXJB?=
 =?utf-8?B?K2hzRStIOWVqTUJxNUkrRE5oR2xCUlA5c2hEWUNlVzZhMSttNDFjMlVic1p5?=
 =?utf-8?B?bk1CajJhMlpjUjlMT1FMWVp2dEw5ODg0MEtHVmRscnUwZ0NwNkR2eFhVZWhB?=
 =?utf-8?B?VnA5Uys2amJDR1FRUmI0M1hEdm1zRlRFMTk4ekhheWZiYXNTeXlpZ1ZaeTNL?=
 =?utf-8?B?VDVML3lCWDJUMlFzK0N3MWRLZGdPMGsvbkJqb1hpSUpHTDNQcGtsN1VuMTEw?=
 =?utf-8?B?c2krQVdQWlluT2tWMGVCU3hWdVlpRHpTK3FRblJKR3pmUi9Gc29lMHRFWTZI?=
 =?utf-8?B?TnUrQm5vVU1xdnRYRXp1NG04VDc2Z3hKdVVLWUVwZGJQSXdvWHRiUENuckVO?=
 =?utf-8?B?OVJxUVRwWERNR2FlWk9NQU92QzJFQmVHZVd1ZmNScmhGOVhGVXJsTnNYTE1r?=
 =?utf-8?B?WlhDRld6NmJGWmxydUZqSVFCWElEaDg0Z0hLR0E3VjBEeDZtM0Nab1lNcTNR?=
 =?utf-8?B?TlZnYXppanUwSSs0S2c1aEJTTHVPQTZ2bUk5QUUzTmE5cTVjU3prRXdQcGtU?=
 =?utf-8?B?QW1TT3BYSkZFSkhpWlJWVWJVV2VJWi9pdEYveFJqcWNHYUtoY3VTMklmNVlM?=
 =?utf-8?B?VVFLSlFEZktob2xaWWxPcnZzVFhZZ0xIdjZNZ1BYU25XcXZXc3dUb0tqQ0pm?=
 =?utf-8?B?bEM3NGw1UW5wbnZreitiL2JML3VWTlJBelpJQTBwNDlUU3lQem9ZZGRSNi9w?=
 =?utf-8?B?K2JsZTZwbFhrWGNIZ2VRVFBvejNKMnFqVXJ2UDNOYWN4MGVlTGRIck9rZUZt?=
 =?utf-8?B?YlppN2ZiL29aNWJXMlU3QzBlNy9ZbENqY3NHYUpjeWNhTHJ6OVgyNmNwTkRT?=
 =?utf-8?B?Sm8zQkN6OTVoMXlSckdTSU5XbUVtaWJmSWxyS2tsdlF1UjJYMmdFelJmd2VK?=
 =?utf-8?B?Z3FKcHN4cU05WWdwclVVUzJDbVZNQ1Q2bzVXQ2VmZmZLeFkvZ0tGZTBPWlA3?=
 =?utf-8?B?cmp5WTVxeUpGMHBwNCs1NDZoWncyWjlpaUlKaGhDMVJEakR3M2dxWXJSZ1dl?=
 =?utf-8?B?U2lya2FxRkVNcmk5bmllOGtvYkk4elVSMjlJQjk0WWRtenJYbHp0WmltaE96?=
 =?utf-8?B?VlkrUWZXZmJsZUFGeEdNUzJVZVlLSitLSkdKSkhEWURRN1RONFEwSXl1d3hZ?=
 =?utf-8?B?dC9zQjZ2VVNaTkdxcWRPa1lxMkxqYjloUldrOFEyakgzQlZ2RGpQeFI0bFUw?=
 =?utf-8?B?bWZQdmhrRW5GY0g1SWlPZDhSUFNTM09IbnI4Wng3U05sVUtwQ3g5K2YrWU9W?=
 =?utf-8?B?R3F5eDVnWWRQU0J0U1VUTlM1RW50RWVuRXhMOTU4WkZEWXdKRkNUbFJRNE1j?=
 =?utf-8?B?NTl1YjB0RjdDN1RQSS9HUDNsR2pGZ2RBUjhlR0h4MFZJR1o1RmNaa2Fjek1i?=
 =?utf-8?B?OU42NTVpcWZSRkNwWWEwb2tlNlFKaUdpUGNmSVJZY1J2cTBjai9MVUFwNGFH?=
 =?utf-8?B?dVBLb09BN2hBK2xuWjZXRjVza3dDZmZRbm4wN3ptSEtEMXlTRFdwa1hMdm5p?=
 =?utf-8?B?bUV3c1hwNVY5Sk9SVW52dlVWVFNDbUY3OXZxZlJ4N1d3YUVGZmJOdWZIcUVh?=
 =?utf-8?Q?xL8ivaE7nMo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWdWMW1LOUxRN1YrUWg3VWM5N0szN1RtR1ZSdzZRWjEyLzBSQ3I0amlLZUh0?=
 =?utf-8?B?cFRZKzZ1N2cwZldOaFJKK3ZDV3lxU2NwUXdjMXVBSFNEM0JTbGMvUjNWS0VH?=
 =?utf-8?B?a21wRkJXQnE1aG1YR1M4R1NERkYrMlFBak1VSEVibHdHTVpEMk82bldSSkV4?=
 =?utf-8?B?VDlxUEJVVzBIK2FJcEhhYUZYdmN3SVpQQVJrV1VZZVZJSm9WeCtXVXZpZGgw?=
 =?utf-8?B?RkZGb0lnMjFHb0xkQXJPOXRTQ3lVekdtUy9veFNwU1paUzRGOURpVzlJKzBR?=
 =?utf-8?B?UE9icFIzYjZYWFZjSkN3T2pRcFR4a2t4d2dreEh1ZGJyVGV2RlVKbWpZM0lx?=
 =?utf-8?B?dVdzRkpnR3YzQ2Fla3EzUDZ6ZERkTjhPSmFlNjRzTVE2am9EMU9tbFpsMVY3?=
 =?utf-8?B?VGU1dVh3TmRqQWNON21KYkR6eDlnNHc2blY1WldUYVMxNWZoNlpIRGxXSUtm?=
 =?utf-8?B?TWpobm5vbHJIeVYvODJxbCt5RkVIalp1dnZwV2FlQjY4blB4RGlFYm9SN1hY?=
 =?utf-8?B?d3VlckNSTWZSYWY5SWRkUlYvVFc2c2pPclJxeUhXV0ZFdUovNXZiakhSVTNu?=
 =?utf-8?B?WUl3eE1FZEtmNGtwRWFUVXMwc3F6c3RDT3ZEVGE0NDJONGgrRHdSRlNQQmcr?=
 =?utf-8?B?dXFWc1cwYXVJOGtuY2RKOEp4YWZ0TEJiM2NRMUlSSmNtQlNER1pJNEdTbnVL?=
 =?utf-8?B?aUFYSHhjWGpPSlN3OUlBK1Mwa3ZIK25ZWjFKOHdjK3kzOHlqM1RuUWd6VWgr?=
 =?utf-8?B?eTczbEdGcjFJRmRpQlI1bjZuS0xiSUJBNTVscGxCcEh6cUt4ZEVMNnVQaU1r?=
 =?utf-8?B?cWpqbHZ4cGNwajBHYTBWK2x4U2hQL0RlZkxuSWJtSmVQbndGb3RPcU1vaTdq?=
 =?utf-8?B?eFQwMWN0MmlxWDdXbTBaNm1oNjFabGVVVW9IV2pMeW9xSVFYSEJKS3dRNWNk?=
 =?utf-8?B?b0NuSDB4YjFqYVJKN1ZhOHRLUkJ5bktFVDgwbmpURWlYd2ZxNGFhczJyNm1l?=
 =?utf-8?B?b3owMVJ6V2FpTWZzTE9paHMzck10NjFWb3E1eTdram1SR1ViRWRsMXBpU3Iv?=
 =?utf-8?B?dXovWm9wY1FjMkRDaFdBY0sxZ2k4MTA0UXlNVmNjNGVmcmZLM2E1dUhjU3dU?=
 =?utf-8?B?V0sybDZHV3pLUnZUbDRERDY1dnhUMmN1ck55bEZyQWFCRHZlQSszdmRvME5B?=
 =?utf-8?B?YnljK0VLWnJtZEh2aGlPMlpiMVlIci84K2VBeUY5bVl3c2dDNERFbVlRVFNQ?=
 =?utf-8?B?YnVZRHJFMHNBMHNDd0N2eGJoMkVwYndCaFQzWVZzNVNNTnM0S0wrV2NBVGJm?=
 =?utf-8?B?WHhoQU9DNENJaVpBbXA5dTI2YW40L1daZ1RZVmxZZE1lTXEva1MybWVtM0ZV?=
 =?utf-8?B?Sm05ZDZ0MXZ0YVhBVGlEY1VVNlRZejk5WmFFdTRlZnVrVVBSTUNjMVZ6Rmlj?=
 =?utf-8?B?djdYa0U0alJtbUhtUHBoUVBnTnBjRHlhbDdCdndhY00ydmdrY2JSK0pOSG02?=
 =?utf-8?B?cjFwd3c3VnhSU2xSd1dtNlFGOFJka1ZnM2pYZWpWSFB5elB2NVBrN0piZDRU?=
 =?utf-8?B?LzBYb016RFdQZE5QR09DNUNNS1F6Nk00akRIV2YrV3RwUDhWQ2cxZkg5d0xa?=
 =?utf-8?B?ZFVlVVRhOVlJVTZBRjRlY2xsLy9vQmN0N3ptVE83UkdUYks5NHE1TlM0NGZ6?=
 =?utf-8?B?aDVzMnR5bXhNQmJ5T0F5WHZadUxkSFA1Y1dJcEY2dC9uUUxNWmw0Nk15M2Nj?=
 =?utf-8?B?VmQ0WHhIbDN5OFNIdVY0R2IzRlo5QmxvWkZOS2RzaGFBS1Y0cmZqQ21lWUF4?=
 =?utf-8?B?N2dqa2NzWHV1bXZ4RktZWDBZY1NPcHA1NmdxK1BUWW95cnlKcEptcWJZRjZ2?=
 =?utf-8?B?ZHcvODRqS1lVemlzQm5vdnBiUTZ1R0JPSkxGMks1ellvQUp3WGtoK3R1SHB0?=
 =?utf-8?B?VENwNTBLOU55OXBmTHVVREJGeFpFWnBtNEVFMG1rQWZTS0hPMUFQMjAwUjFF?=
 =?utf-8?B?QU55YzZZL3BrYURxQkdWam93S1lKMnZBa0xFa2FoelB3RS9zNTJGSk1Ucy9G?=
 =?utf-8?B?a1ZkK2xKbkNqU0RNcUtJZ0txdjlLVG9iSEdqRHJObmpIcGFoeG5taEFhL1JT?=
 =?utf-8?B?L0Y1NENGYjZQREZlQm5BYTNZNHg5SGtTelhjakZCQVYzazlzc2lmZUdWOWty?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7f39f8-5a8c-4e1d-995d-08dda2a5e9e5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 13:52:43.7992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: edxnXf62XB5w21EN5GmDBdmNN0tqCLejMk/qDT3CSjeQOTXm/zFU67LnC88tzv201pDpsW5SZcaLkvoUc5ZANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7264
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

--------------dX2vv1UKU0u5xF4a0aMn5xOB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 08-05-2025 03:08, Daniele Ceraolo Spurio wrote:
>
>
> On 4/29/2025 9:09 AM, Badal Nilawar wrote:
>> Introducing late_bind_fw to enable firmware loading for the devices,
>> such as the fan controller and voltage regulator, during the driver 
>> probe.
>> Typically, firmware for these devices are part of IFWI flash image but
>> can be replaced at probe after OEM tuning.
>
> This description does not fully match what's happening in the patch, 
> as the main thing happening is the addition of the mei component.
Sure I will update the description.
>
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig                 |   1 +
>>   drivers/gpu/drm/xe/Makefile                |   1 +
>>   drivers/gpu/drm/xe/xe_device.c             |   3 +
>>   drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 104 +++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_late_bind_fw.h       |  16 ++++
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  95 +++++++++++++++++++
>>   7 files changed, 224 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 9bce047901b2..a8cc1876a24f 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -44,6 +44,7 @@ config DRM_XE
>>       select WANT_DEV_COREDUMP
>>       select AUXILIARY_BUS
>>       select HMM_MIRROR
>> +    select INTEL_MEI_LATE_BIND
>
> I'm not sure this is enough to guarantee that late bind will work. 
> This selects the component, but the MEI_GSC child driver also needs to 
> be built for the component to bind into it on dGPU. We can't select 
> INTEL_MEI_GSC from here because that depends on the graphics driver, 
> so we'd go circular. For other components (PXP, HDCP, SW proxy) what 
> we did was notify the distros that they needed to enable the new 
> config for the feature to work instead of selecting it from the Kconfig.
I will follow the approach used for other components. Is it ok to enable 
this feature for CI in a separate patch labeled "CI_only, do not review"?
>
>>       help
>>         Experimental driver for Intel Xe series GPUs
>>   diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index c5d6681645ed..6de291a21965 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -76,6 +76,7 @@ xe-y += xe_bb.o \
>>       xe_hw_fence.o \
>>       xe_irq.o \
>>       xe_lrc.o \
>> +    xe_late_bind_fw.o \
>>       xe_migrate.o \
>>       xe_mmio.o \
>>       xe_mocs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 75e753e0a682..86a7b7065122 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -42,6 +42,7 @@
>>   #include "xe_hw_engine_group.h"
>>   #include "xe_hwmon.h"
>>   #include "xe_irq.h"
>> +#include "xe_late_bind_fw.h"
>>   #include "xe_memirq.h"
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>> @@ -889,6 +890,8 @@ int xe_device_probe(struct xe_device *xe)
>>       if (err)
>>           return err;
>>   +    xe_late_bind_init(&xe->late_bind);
>> +
>>       err = xe_oa_init(xe);
>>       if (err)
>>           return err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 495bc00ebed4..57b63cc9b8ac 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -16,6 +16,7 @@
>>   #include "xe_devcoredump_types.h"
>>   #include "xe_heci_gsc.h"
>>   #include "xe_lmtt_types.h"
>> +#include "xe_late_bind_fw_types.h"
>>   #include "xe_memirq_types.h"
>>   #include "xe_oa_types.h"
>>   #include "xe_platform_types.h"
>> @@ -543,6 +544,9 @@ struct xe_device {
>>       /** @heci_gsc: graphics security controller */
>>       struct xe_heci_gsc heci_gsc;
>>   +    /** @late_bind: xe mei late bind interface */
>> +    struct xe_late_bind late_bind;
>> +
>>       /** @oa: oa observation subsystem */
>>       struct xe_oa oa;
>>   diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> new file mode 100644
>> index 000000000000..7981fc500a78
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -0,0 +1,104 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>
> 2025?
Ok
>
>> + */
>> +
>> +#include <linux/component.h>
>> +#include <linux/delay.h>
>> +
>> +#include <drm/drm_managed.h>
>> +#include <drm/intel/i915_component.h>
>> +#include <drm/intel/xe_late_bind_mei_interface.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_late_bind_fw.h"
>> +
>> +static struct xe_device *
>> +late_bind_to_xe(struct xe_late_bind *late_bind)
>> +{
>> +    return container_of(late_bind, struct xe_device, late_bind);
>> +}
>> +
>> +static int xe_late_bind_component_bind(struct device *xe_kdev,
>> +                       struct device *mei_kdev, void *data)
>> +{
>> +    struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>> +    struct xe_late_bind *late_bind = &xe->late_bind;
>> +    struct xe_late_bind_component *component;
>> +
>> +    component = drmm_kzalloc(&xe->drm, sizeof(*component), GFP_KERNEL);
>
> The component is unbound and re-bound on every suspend/resume, so if 
> you do allocs in the bind function without freeing them in the unbind 
> you'll keep the old allocations around. Why do you need this to be 
> dynamically allocated to begin with?
Dynamic allocation is not needed, I will drop the dynamic allocation and 
fix below comments.
>
>> +
>> +    mutex_lock(&late_bind->mutex);
>> +    component->mei_dev = mei_kdev;
>> +    component->ops = data;
>> +    mutex_unlock(&late_bind->mutex);
>
> This is a local variable right now, so locking around it doesn't do 
> anything.
>
>> +
>> +    late_bind->component = component;
>
> This assignment instead you might want to protect.
>
>> +
>> +    return 0;
>> +}
>> +
>> +static void xe_late_bind_component_unbind(struct device *xe_kdev,
>> +                      struct device *mei_kdev, void *data)
>> +{
>> +    struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>> +    struct xe_late_bind *late_bind = &xe->late_bind;
>> +
>> +    mutex_lock(&late_bind->mutex);
>> +    late_bind->component = NULL;
>> +    mutex_unlock(&late_bind->mutex);
>> +}
>> +
>> +static const struct component_ops xe_late_bind_component_ops = {
>> +    .bind   = xe_late_bind_component_bind,
>> +    .unbind = xe_late_bind_component_unbind,
>> +};
>> +
>> +/**
>> + * xe_late_bind_init() - add xe mei late binding component
>> + *
>> + * Return: 0 if the initialization was successful, a negative errno 
>> otherwise.
>> + */
>> +int xe_late_bind_init(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    int err;
>> +
>> +    if (xe->info.platform != XE_BATTLEMAGE)
>> +        return 0;
>> +
>> +    mutex_init(&late_bind->mutex);
>> +
>> +    if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND)) {
>
> also need INTEL_MEI_GSC for BMG as mentioned above
Ok.
>
>> +        drm_info(&xe->drm, "Can't init xe mei late bind missing mei 
>> component\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    err = component_add_typed(xe->drm.dev, &xe_late_bind_component_ops,
>> +                  I915_COMPONENT_LATE_BIND);
>> +    if (err < 0) {
>> +        drm_info(&xe->drm, "Failed to add mei late bind component 
>> (%pe)\n", ERR_PTR(err));
>> +        return err;
>> +    }
>> +
>> +    late_bind->component_added = true;
>> +
>> +    /* the component must be removed before unload, so can't use 
>> drmm for cleanup */
>
> this has now changed (see 8e1ddfada453 ("drivers: base: devres: Allow 
> to release group on device release") ), so you can use a devm action 
> here.
Ok.
>
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * xe_late_bind_remove() - remove the xe mei late binding component
>> + */
>> +void xe_late_bind_remove(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +
>> +    if (!late_bind->component_added)
>> +        return;
>> +
>> +    component_del(xe->drm.dev, &xe_late_bind_component_ops);
>> +    late_bind->component_added = false;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> new file mode 100644
>> index 000000000000..21299de54b47
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_LATE_BIND_FW_H_
>> +#define _XE_LATE_BIND_FW_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_late_bind;
>> +
>> +int xe_late_bind_init(struct xe_late_bind *late_bind);
>> +void xe_late_bind_remove(struct xe_late_bind *late_bind);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> new file mode 100644
>> index 000000000000..ea11061ce556
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -0,0 +1,95 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_MEI_LATE_BIND_TYPES_H_
>> +#define _XE_MEI_LATE_BIND_TYPES_H_
>> +
>> +#include <linux/iosys-map.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/types.h>
>> +#include <linux/workqueue.h>
>> +
>> +#define MAX_PAYLOAD_SIZE (1024 * 4)
>> +
>> +struct xe_bo;
>> +struct xe_late_bind_component;
>> +
>> +/**
>> + * xe_late_bind_fw_type - enum to determine late binding fw type
>> + */
>> +enum xe_late_bind_type {
>> +    CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1,
>> +    CSC_LATE_BINDING_TYPE_VOLTAGE_REGULATOR
>> +};
>> +
>> +/**
>> + * Late Binding flags
>> + */
>> +enum csc_late_binding_flags {
>> +    /** Persistent across warm reset */
>> +    CSC_LATE_BINDING_FLAGS_IS_PERSISTENT = 0x1
>> +};
>> +
>> +/**
>> + * xe_late_bind_fw_id - enum to determine late binding fw index
>> + */
>> +enum xe_late_bind_fw_id {
>> +    FAN_CONTROL_ID = 0,
>> +    VOLTAGE_REGULATOR_ID,
>> +    MAX_ID
>> +};
>> +
>> +/**
>> + * struct xe_late_bind_fw
>> + */
>> +struct xe_late_bind_fw {
>> +    /** @late_bind_fw.valid */
>> +    bool valid;
>> +
>> +    /** @late_bind_fw.id */
>> +    u32 id;
>> +
>> +    /** @late_bind_fw.blob_path: late binding fw blob path */
>> +    char blob_path[PATH_MAX];
>> +
>> +    /** @late_bind_fw.type */
>> +    u32  type;
>> +
>> +    /** @late_bind_fw.type */
>> +    u32  flags;
>> +
>> +    /** @late_bind_fw.payload: to store the late binding blob */
>> +    u8  payload[MAX_PAYLOAD_SIZE];
>> +
>> +    /** @late_bind_fw.payload_size: late binding blob payload_size */
>> +    size_t payload_size;
>> +
>> +    /** @late_bind_fw.work: worker to upload latebind blob */
>> +    struct work_struct work;
>> +};
>> +
>> +/**
>> + * struct xe_late_bind
>> + */
>> +struct xe_late_bind {
>> +    /** @late_bind.component: struct for communication with mei 
>> component */
>> +    struct xe_late_bind_component *component;
>> +
>> +    /** @late_bind.component_added: whether the component has been 
>> added */
>> +    bool component_added;
>> +
>> +    /** @late_bind.wq: workqueue to submit request to download late 
>> bind blob */
>> +    struct workqueue_struct *wq;
>> +
>> +    /** @late_bind.mutex: protects the component binding and usage */
>> +    struct mutex mutex;
>> +
>> +    /** @late_bind.late_bind_fw: late binding firmwares */
>> +    struct xe_late_bind_fw late_bind_fw[MAX_ID];
>> +
>> +};
>> +
>
> A lot of the variables/enums in this file are unused in this patch. 
> Can you move the additions to the patch in which they're actually used?

Sure, I will add variables/enums to this structure incrementally in 
subsequent patches.

Thanks,
Badal

>
> Daniele
>
>> +#endif
>
--------------dX2vv1UKU0u5xF4a0aMn5xOB
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-05-2025 03:08, Daniele Ceraolo
      Spurio wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com">
      <br>
      <br>
      On 4/29/2025 9:09 AM, Badal Nilawar wrote:
      <br>
      <blockquote type="cite">Introducing late_bind_fw to enable
        firmware loading for the devices,
        <br>
        such as the fan controller and voltage regulator, during the
        driver probe.
        <br>
        Typically, firmware for these devices are part of IFWI flash
        image but
        <br>
        can be replaced at probe after OEM tuning.
        <br>
      </blockquote>
      <br>
      This description does not fully match what's happening in the
      patch, as the main thing happening is the addition of the mei
      component.
      <br>
    </blockquote>
    Sure I will update the description.
    <blockquote type="cite" cite="mid:8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com">
      <br>
      <blockquote type="cite">
        <br>
        Signed-off-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/xe/Kconfig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +
        <br>
        &nbsp; drivers/gpu/drm/xe/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_device.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_device_types.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_late_bind_fw.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 104
        +++++++++++++++++++++
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_late_bind_fw.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 16 ++++
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_late_bind_fw_types.h |&nbsp; 95
        +++++++++++++++++++
        <br>
        &nbsp; 7 files changed, 224 insertions(+)
        <br>
        &nbsp; create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
        <br>
        &nbsp; create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
        <br>
        &nbsp; create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/Kconfig
        b/drivers/gpu/drm/xe/Kconfig
        <br>
        index 9bce047901b2..a8cc1876a24f 100644
        <br>
        --- a/drivers/gpu/drm/xe/Kconfig
        <br>
        +++ b/drivers/gpu/drm/xe/Kconfig
        <br>
        @@ -44,6 +44,7 @@ config DRM_XE
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select WANT_DEV_COREDUMP
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select AUXILIARY_BUS
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select HMM_MIRROR
        <br>
        +&nbsp;&nbsp;&nbsp; select INTEL_MEI_LATE_BIND
        <br>
      </blockquote>
      <br>
      I'm not sure this is enough to guarantee that late bind will work.
      This selects the component, but the MEI_GSC child driver also
      needs to be built for the component to bind into it on dGPU. We
      can't select INTEL_MEI_GSC from here because that depends on the
      graphics driver, so we'd go circular. For other components (PXP,
      HDCP, SW proxy) what we did was notify the distros that they
      needed to enable the new config for the feature to work instead of
      selecting it from the Kconfig.
      <br>
    </blockquote>
    <span style="color: rgb(0, 0, 0); font-family: IntelOneTextNormal, system-ui, &quot;Segoe UI&quot;, Helvetica, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">I
      will follow the approach used for other components. Is it ok to
      enable this feature for CI in a separate patch labeled &quot;CI_only,
      do not review&quot;?</span>
    <blockquote type="cite" cite="mid:8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com">
      <br>
      <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Experimental driver for Intel Xe series GPUs
        <br>
        &nbsp; diff --git a/drivers/gpu/drm/xe/Makefile
        b/drivers/gpu/drm/xe/Makefile
        <br>
        index c5d6681645ed..6de291a21965 100644
        <br>
        --- a/drivers/gpu/drm/xe/Makefile
        <br>
        +++ b/drivers/gpu/drm/xe/Makefile
        <br>
        @@ -76,6 +76,7 @@ xe-y += xe_bb.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_hw_fence.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_irq.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_lrc.o \
        <br>
        +&nbsp;&nbsp;&nbsp; xe_late_bind_fw.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_migrate.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_mmio.o \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_mocs.o \
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_device.c
        b/drivers/gpu/drm/xe/xe_device.c
        <br>
        index 75e753e0a682..86a7b7065122 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_device.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_device.c
        <br>
        @@ -42,6 +42,7 @@
        <br>
        &nbsp; #include &quot;xe_hw_engine_group.h&quot;
        <br>
        &nbsp; #include &quot;xe_hwmon.h&quot;
        <br>
        &nbsp; #include &quot;xe_irq.h&quot;
        <br>
        +#include &quot;xe_late_bind_fw.h&quot;
        <br>
        &nbsp; #include &quot;xe_memirq.h&quot;
        <br>
        &nbsp; #include &quot;xe_mmio.h&quot;
        <br>
        &nbsp; #include &quot;xe_module.h&quot;
        <br>
        @@ -889,6 +890,8 @@ int xe_device_probe(struct xe_device *xe)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; xe_late_bind_init(&amp;xe-&gt;late_bind);
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = xe_oa_init(xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_device_types.h
        b/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        index 495bc00ebed4..57b63cc9b8ac 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        @@ -16,6 +16,7 @@
        <br>
        &nbsp; #include &quot;xe_devcoredump_types.h&quot;
        <br>
        &nbsp; #include &quot;xe_heci_gsc.h&quot;
        <br>
        &nbsp; #include &quot;xe_lmtt_types.h&quot;
        <br>
        +#include &quot;xe_late_bind_fw_types.h&quot;
        <br>
        &nbsp; #include &quot;xe_memirq_types.h&quot;
        <br>
        &nbsp; #include &quot;xe_oa_types.h&quot;
        <br>
        &nbsp; #include &quot;xe_platform_types.h&quot;
        <br>
        @@ -543,6 +544,9 @@ struct xe_device {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @heci_gsc: graphics security controller */
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_heci_gsc heci_gsc;
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; /** @late_bind: xe mei late bind interface */
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_late_bind late_bind;
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @oa: oa observation subsystem */
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_oa oa;
        <br>
        &nbsp; diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c
        b/drivers/gpu/drm/xe/xe_late_bind_fw.c
        <br>
        new file mode 100644
        <br>
        index 000000000000..7981fc500a78
        <br>
        --- /dev/null
        <br>
        +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
        <br>
        @@ -0,0 +1,104 @@
        <br>
        +// SPDX-License-Identifier: MIT
        <br>
        +/*
        <br>
        + * Copyright © 2024 Intel Corporation
        <br>
      </blockquote>
      <br>
      2025?
      <br>
    </blockquote>
    Ok
    <blockquote type="cite" cite="mid:8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com">
      <br>
      <blockquote type="cite">+ */
        <br>
        +
        <br>
        +#include &lt;linux/component.h&gt;
        <br>
        +#include &lt;linux/delay.h&gt;
        <br>
        +
        <br>
        +#include &lt;drm/drm_managed.h&gt;
        <br>
        +#include &lt;drm/intel/i915_component.h&gt;
        <br>
        +#include &lt;drm/intel/xe_late_bind_mei_interface.h&gt;
        <br>
        +#include &lt;drm/drm_print.h&gt;
        <br>
        +
        <br>
        +#include &quot;xe_device.h&quot;
        <br>
        +#include &quot;xe_late_bind_fw.h&quot;
        <br>
        +
        <br>
        +static struct xe_device *
        <br>
        +late_bind_to_xe(struct xe_late_bind *late_bind)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; return container_of(late_bind, struct xe_device,
        late_bind);
        <br>
        +}
        <br>
        +
        <br>
        +static int xe_late_bind_component_bind(struct device *xe_kdev,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct device *mei_kdev, void *data)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_device *xe = kdev_to_xe_device(xe_kdev);
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_late_bind *late_bind = &amp;xe-&gt;late_bind;
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_late_bind_component *component;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; component = drmm_kzalloc(&amp;xe-&gt;drm,
        sizeof(*component), GFP_KERNEL);
        <br>
      </blockquote>
      <br>
      The component is unbound and re-bound on every suspend/resume, so
      if you do allocs in the bind function without freeing them in the
      unbind you'll keep the old allocations around. Why do you need
      this to be dynamically allocated to begin with?
      <br>
    </blockquote>
    Dynamic allocation is not needed, I will drop the dynamic allocation
    and fix below comments. <br>
    <blockquote type="cite" cite="mid:8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com">
      <br>
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; mutex_lock(&amp;late_bind-&gt;mutex);
        <br>
        +&nbsp;&nbsp;&nbsp; component-&gt;mei_dev = mei_kdev;
        <br>
        +&nbsp;&nbsp;&nbsp; component-&gt;ops = data;
        <br>
        +&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;late_bind-&gt;mutex);
        <br>
      </blockquote>
      <br>
      This is a local variable right now, so locking around it doesn't
      do anything.
      <br>
      <br>
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; late_bind-&gt;component = component;
        <br>
      </blockquote>
      <br>
      This assignment instead you might want to protect.
      <br>
    </blockquote>
    <blockquote type="cite" cite="mid:8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com">
      <br>
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +}
        <br>
        +
        <br>
        +static void xe_late_bind_component_unbind(struct device
        *xe_kdev,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct device *mei_kdev, void *data)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_device *xe = kdev_to_xe_device(xe_kdev);
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_late_bind *late_bind = &amp;xe-&gt;late_bind;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; mutex_lock(&amp;late_bind-&gt;mutex);
        <br>
        +&nbsp;&nbsp;&nbsp; late_bind-&gt;component = NULL;
        <br>
        +&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;late_bind-&gt;mutex);
        <br>
        +}
        <br>
        +
        <br>
        +static const struct component_ops xe_late_bind_component_ops =
        {
        <br>
        +&nbsp;&nbsp;&nbsp; .bind&nbsp;&nbsp; = xe_late_bind_component_bind,
        <br>
        +&nbsp;&nbsp;&nbsp; .unbind = xe_late_bind_component_unbind,
        <br>
        +};
        <br>
        +
        <br>
        +/**
        <br>
        + * xe_late_bind_init() - add xe mei late binding component
        <br>
        + *
        <br>
        + * Return: 0 if the initialization was successful, a negative
        errno otherwise.
        <br>
        + */
        <br>
        +int xe_late_bind_init(struct xe_late_bind *late_bind)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_device *xe = late_bind_to_xe(late_bind);
        <br>
        +&nbsp;&nbsp;&nbsp; int err;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (xe-&gt;info.platform != XE_BATTLEMAGE)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; mutex_init(&amp;late_bind-&gt;mutex);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND)) {
        <br>
      </blockquote>
      <br>
      also need INTEL_MEI_GSC for BMG as mentioned above
      <br>
    </blockquote>
    Ok.
    <blockquote type="cite" cite="mid:8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com">
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;xe-&gt;drm, &quot;Can't
        init xe mei late bind missing mei component\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENODEV;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; err = component_add_typed(xe-&gt;drm.dev,
        &amp;xe_late_bind_component_ops,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I915_COMPONENT_LATE_BIND);
        <br>
        +&nbsp;&nbsp;&nbsp; if (err &lt; 0) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;xe-&gt;drm, &quot;Failed to add mei late bind
        component (%pe)\n&quot;, ERR_PTR(err));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; late_bind-&gt;component_added = true;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* the component must be removed before unload, so can't
        use drmm for cleanup */
        <br>
      </blockquote>
      <br>
      this has now changed (see 8e1ddfada453 (&quot;drivers: base: devres:
      Allow to release group on device release&quot;) ), so you can use a
      devm action here.
      <br>
    </blockquote>
    Ok.
    <blockquote type="cite" cite="mid:8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com">
      <br>
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +}
        <br>
        +
        <br>
        +/**
        <br>
        + * xe_late_bind_remove() - remove the xe mei late binding
        component
        <br>
        + */
        <br>
        +void xe_late_bind_remove(struct xe_late_bind *late_bind)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_device *xe = late_bind_to_xe(late_bind);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!late_bind-&gt;component_added)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; component_del(xe-&gt;drm.dev,
        &amp;xe_late_bind_component_ops);
        <br>
        +&nbsp;&nbsp;&nbsp; late_bind-&gt;component_added = false;
        <br>
        +}
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h
        b/drivers/gpu/drm/xe/xe_late_bind_fw.h
        <br>
        new file mode 100644
        <br>
        index 000000000000..21299de54b47
        <br>
        --- /dev/null
        <br>
        +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
        <br>
        @@ -0,0 +1,16 @@
        <br>
        +/* SPDX-License-Identifier: MIT */
        <br>
        +/*
        <br>
        + * Copyright © 2025 Intel Corporation
        <br>
        + */
        <br>
        +
        <br>
        +#ifndef _XE_LATE_BIND_FW_H_
        <br>
        +#define _XE_LATE_BIND_FW_H_
        <br>
        +
        <br>
        +#include &lt;linux/types.h&gt;
        <br>
        +
        <br>
        +struct xe_late_bind;
        <br>
        +
        <br>
        +int xe_late_bind_init(struct xe_late_bind *late_bind);
        <br>
        +void xe_late_bind_remove(struct xe_late_bind *late_bind);
        <br>
        +
        <br>
        +#endif
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
        b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
        <br>
        new file mode 100644
        <br>
        index 000000000000..ea11061ce556
        <br>
        --- /dev/null
        <br>
        +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
        <br>
        @@ -0,0 +1,95 @@
        <br>
        +/* SPDX-License-Identifier: MIT */
        <br>
        +/*
        <br>
        + * Copyright © 2025 Intel Corporation
        <br>
        + */
        <br>
        +
        <br>
        +#ifndef _XE_MEI_LATE_BIND_TYPES_H_
        <br>
        +#define _XE_MEI_LATE_BIND_TYPES_H_
        <br>
        +
        <br>
        +#include &lt;linux/iosys-map.h&gt;
        <br>
        +#include &lt;linux/mutex.h&gt;
        <br>
        +#include &lt;linux/spinlock.h&gt;
        <br>
        +#include &lt;linux/types.h&gt;
        <br>
        +#include &lt;linux/workqueue.h&gt;
        <br>
        +
        <br>
        +#define MAX_PAYLOAD_SIZE (1024 * 4)
        <br>
        +
        <br>
        +struct xe_bo;
        <br>
        +struct xe_late_bind_component;
        <br>
        +
        <br>
        +/**
        <br>
        + * xe_late_bind_fw_type - enum to determine late binding fw
        type
        <br>
        + */
        <br>
        +enum xe_late_bind_type {
        <br>
        +&nbsp;&nbsp;&nbsp; CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1,
        <br>
        +&nbsp;&nbsp;&nbsp; CSC_LATE_BINDING_TYPE_VOLTAGE_REGULATOR
        <br>
        +};
        <br>
        +
        <br>
        +/**
        <br>
        + * Late Binding flags
        <br>
        + */
        <br>
        +enum csc_late_binding_flags {
        <br>
        +&nbsp;&nbsp;&nbsp; /** Persistent across warm reset */
        <br>
        +&nbsp;&nbsp;&nbsp; CSC_LATE_BINDING_FLAGS_IS_PERSISTENT = 0x1
        <br>
        +};
        <br>
        +
        <br>
        +/**
        <br>
        + * xe_late_bind_fw_id - enum to determine late binding fw index
        <br>
        + */
        <br>
        +enum xe_late_bind_fw_id {
        <br>
        +&nbsp;&nbsp;&nbsp; FAN_CONTROL_ID = 0,
        <br>
        +&nbsp;&nbsp;&nbsp; VOLTAGE_REGULATOR_ID,
        <br>
        +&nbsp;&nbsp;&nbsp; MAX_ID
        <br>
        +};
        <br>
        +
        <br>
        +/**
        <br>
        + * struct xe_late_bind_fw
        <br>
        + */
        <br>
        +struct xe_late_bind_fw {
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind_fw.valid */
        <br>
        +&nbsp;&nbsp;&nbsp; bool valid;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind_fw.id */
        <br>
        +&nbsp;&nbsp;&nbsp; u32 id;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind_fw.blob_path: late binding fw blob path */
        <br>
        +&nbsp;&nbsp;&nbsp; char blob_path[PATH_MAX];
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind_fw.type */
        <br>
        +&nbsp;&nbsp;&nbsp; u32&nbsp; type;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind_fw.type */
        <br>
        +&nbsp;&nbsp;&nbsp; u32&nbsp; flags;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind_fw.payload: to store the late binding blob
        */
        <br>
        +&nbsp;&nbsp;&nbsp; u8&nbsp; payload[MAX_PAYLOAD_SIZE];
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind_fw.payload_size: late binding blob
        payload_size */
        <br>
        +&nbsp;&nbsp;&nbsp; size_t payload_size;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind_fw.work: worker to upload latebind blob */
        <br>
        +&nbsp;&nbsp;&nbsp; struct work_struct work;
        <br>
        +};
        <br>
        +
        <br>
        +/**
        <br>
        + * struct xe_late_bind
        <br>
        + */
        <br>
        +struct xe_late_bind {
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind.component: struct for communication with mei
        component */
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_late_bind_component *component;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind.component_added: whether the component has
        been added */
        <br>
        +&nbsp;&nbsp;&nbsp; bool component_added;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind.wq: workqueue to submit request to download
        late bind blob */
        <br>
        +&nbsp;&nbsp;&nbsp; struct workqueue_struct *wq;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind.mutex: protects the component binding and
        usage */
        <br>
        +&nbsp;&nbsp;&nbsp; struct mutex mutex;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /** @late_bind.late_bind_fw: late binding firmwares */
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_late_bind_fw late_bind_fw[MAX_ID];
        <br>
        +
        <br>
        +};
        <br>
        +
        <br>
      </blockquote>
      <br>
      A lot of the variables/enums in this file are unused in this
      patch. Can you move the additions to the patch in which they're
      actually used?
      <br>
    </blockquote>
    <p>Sure, I will add variables/enums to this structure incrementally
      in subsequent patches.</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com">
      <br>
      Daniele
      <br>
      <br>
      <blockquote type="cite">+#endif
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------dX2vv1UKU0u5xF4a0aMn5xOB--
