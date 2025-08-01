Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993BEB17C4B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 07:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D3F10E3AB;
	Fri,  1 Aug 2025 05:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYsDLruk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18FF10E3A9;
 Fri,  1 Aug 2025 05:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754024999; x=1785560999;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bwCeN+nRfixeX3eeg1OGjws+v+y/YbKuxK6H84oviNg=;
 b=bYsDLruk0exbZt5A5KuCd6YttIXweEq1S9lvxyCmamhIQv8Kv+f4NBmL
 vQG5G6e8CbALBFnjWpxzMxdxipKgij9UenlhR7nxeUZtC5Ni/jD3NI+6T
 h2oEHIuhGoevVGhokkYyBCmnVvvDSCUhVlWDXgtphKt+Goa+LISVWME7V
 JNLiaghW8x0GAPCi9Ka5rmsRGkNsKyTRI1pU9D13Wy58SJeMHJOOlDc6E
 2+WVGgSXEFVKRpzmyJfzquaJEm4+QKk7Vj9aqZb5sjgbaIEZ3IpKIKC0e
 KBsLQtHuZsmQig4YbLVkCkW8UfSRnja1myfxkoxtVgGsVDBhO/o0IvDjW w==;
X-CSE-ConnectionGUID: y9zsfeLrQySBEoK3UyZOAA==
X-CSE-MsgGUID: wZWWfxlQRKiYpZjs49WU3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67728627"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67728627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 22:09:59 -0700
X-CSE-ConnectionGUID: NJ4WswXrRT6lpnYRs2LvUw==
X-CSE-MsgGUID: RHBdjP2MRqW7OVZfuaXEDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163804687"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 22:09:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 22:09:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 22:09:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 31 Jul 2025 22:09:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cvp0vJtq/wDNMMX8CHq2wIv8wvtssM51c1WBZXlq3SAPp8zgm+QXVXyP96tYo6Fs2aS7Q52CU2r0qV3h+DvAg8kwiKM2nK+0POp22WwIUjQ0Q8Fy4dspI5AW2MgpiWg2X58xWbL+u1chbsJQseaTswgquVRvZs5vWDa6yKw6zr28LNr75igW5tnJC5dkqhY6wEqQoP2mcy0+U09CxlcbxQ53sLPnNitufyRiwJr3YvB7SqA1X4Y58fbiau2gIE5GapJpcBSJN0j8w6IqTAwTO9/OipB6joWp0tM39NQokqsyj515Kxq+JcKrK1C+Y8KpjTd4ZIFZ0+o+7qvnj+Mu0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8u8r75ec6VKniSA48/QWOXyg5xOiwcq2JiZNrE+jH4=;
 b=VdsB83QDsRuHp/2wEPwzH6ZC93OhSeXOoC36x8Z20tJwc8W0BvwXcmvZWgI1x7lOIG/oMPaTRvA5yrkacCV6K5sCCkpY7KLwNly/Qog5u8Ir800YW+88YQtJn1VxLTHbfOnqwhNiuVQu0itxUh9mKBtstL8d6/eKsl84o0UObHlfk62BUKVnOUxlTEOClzFGmZqs0aD2mAkGW36exh5zZllhw3umNm+B/lNubaofAcZu9LaMuD0D4IdOJkIjeVV7RJI885Nqg+UMtNivSUPIIl/l7FNq9cWWGWivtmQnkwg+ntAAiImBPgR6Ii4BBYYIolTjtcfnwhwZFj3/qavrww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 05:09:50 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d%5]) with mapi id 15.20.8964.026; Fri, 1 Aug 2025
 05:09:50 +0000
Message-ID: <e5e0c109-f206-47c6-b17c-661d0ea0e700@intel.com>
Date: Fri, 1 Aug 2025 10:39:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: don't run atomic_async_check for disabled planes
To: Xaver Hugl <xaver.hugl@kde.org>, <dri-devel@lists.freedesktop.org>
CC: <andrealmeid@igalia.com>, <chris@kode54.net>, <naveen1.kumar@intel.com>,
 <ville.syrjala@linux.intel.com>, <mdaenzer@redhat.com>,
 <intel-gfx@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <alexdeucher@gmail.com>
References: <20250731151732.9295-1-xaver.hugl@kde.org>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250731151732.9295-1-xaver.hugl@kde.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::7) To CH3PR11MB7300.namprd11.prod.outlook.com
 (2603:10b6:610:150::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7300:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: e7aaaf34-1f9f-445e-4d31-08ddd0b9a453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1pBelEvMTdtanpzbUhlZ25aUCtCTDYrZmdmS0h1QW9jYnNlK2NlcnhHcnhZ?=
 =?utf-8?B?YjhZUXhZUENTV0g3R3NoM3lDUXpNWmJBc3FrcEllaEptQkRIakxNOU15TDR2?=
 =?utf-8?B?VFNhRXcxNEQ1ZS9xNDFCT0d4czAxMHRkV2dEZFJybVZlWXpsV0U2RFhTc3Ez?=
 =?utf-8?B?N3RWUlYxY1NZS25TOGhsTTlQMlMxd3lDK0h6dnFteGJBTFRJSlZxMkUwMlJ6?=
 =?utf-8?B?VG1YL0s1SW5lRDl6TjNhWFdCaUdCRGI5NDk2NTMybGQ1cEtsci9YSHJPbUFx?=
 =?utf-8?B?SnlXRnYyVklzQ1VGczhJUHErRVhnMmNDZnA1eG5RMmVuODdYcURHYnRidGtm?=
 =?utf-8?B?NzBxN3UraWR3VGVkWHRRQkxXYVorM0txa1VPK2RWWnR1d2dSM2ZaclNvQWpa?=
 =?utf-8?B?TngwOC9TNXcxYzMrVkdCUnNxWVZjd1dBaEp2N3RrM0xXZnNodHdGVlp2MHhO?=
 =?utf-8?B?RlZyMWI5aHJBVUgxRW1HWkd0VkxxSUg4WjVpNUJ1UC8zN0NhTkdQVjVNaHJF?=
 =?utf-8?B?TC93aGV4NEFCRHhPbGYzSlpzOC9BMXZjOW5RVzdxY1JoOHQ1UEhLV0tmc2Q2?=
 =?utf-8?B?RU9Da005UCtXRGJQVDlHM1R0c0NHMnE5UHhMWUQ2QXo5NTAvcEpSaVMyRVFM?=
 =?utf-8?B?aHM0UVBjWXJOcm4rSGZwWW16cVR1bTFNVUJxck5zQjNKVldlcm0wc3Y0aHMx?=
 =?utf-8?B?NTBNQUhIaVR0L09lU0tTbnc2L0dwam9xM1VrNE83RTJ6MFpVeEg2TXNxalFQ?=
 =?utf-8?B?THRESWJ6VW1JK1lWMFRVdi9xRE9zZUZLbzBxZzIwKzdVSWtqSThwb3lBaGFJ?=
 =?utf-8?B?TEgyL2diWmE2SjA5c0Y3WjRSUWRhdGpvV084Q1F0UmhCR29rd2xZb09kY0lE?=
 =?utf-8?B?czNTZFM2UmxwQ0NoR2pmRDRlUHlRYzR6eHBoVmtNeEJjWDdVS2RDcDRueENZ?=
 =?utf-8?B?SjdYQ1JKSWxkSW1udFBVRWhCcGZIQXdOYnpWM1NITmFMNkxjL0FmMUpDc2V6?=
 =?utf-8?B?c01YVDdpbUN6dDk2cmxKK3U0WEMxdG5lejBBM1N3ZHFIUWllVktuWGhTc0Rx?=
 =?utf-8?B?VzBVQy9yZm85dWUrc1VPRysrTklZM3VTRWMxV3JjK3cva1BrTXd6MVgvM1FM?=
 =?utf-8?B?VFpwTUFCa21ydE1JQkRQb1dHZy9JYkJtMEw2a0JQdUlzL1pJWnBLczFVd3cx?=
 =?utf-8?B?TlJyTTI3ZU5MWDZoblBXcUxNdDR3c1U2R1MxM0ZuckhLNTFZbVV0WWlzTHZs?=
 =?utf-8?B?eHNhUVN1Zjd1ZlBiNDVYTGRSSTZ5WEZvTnYxSm5JRXB4M2FnM251dGk0czVt?=
 =?utf-8?B?SUZta0ZTYUhZbUNBeTdRWXg0Y3RtVlBrbzNzMjUxa3R5d1pPRk10d3QrR3RT?=
 =?utf-8?B?b1IwZ213Z2xyZWpjcjk4Y1NYRGtHQXc2ejNoTHlkenRkemVxY0ZZUlZHUitj?=
 =?utf-8?B?T2NZR0xLRUpOT2hlYVVxeDdnMWR6OGJnTHMyZXRSelJQb0U1NHRzWWRKSHM3?=
 =?utf-8?B?WVh6VksrWXN4dmVUeE5ONjYrSCtKZDk3dE9GYjd2NmtodTQ3bWlyM1JtNGhI?=
 =?utf-8?B?YUlmdWdETit2UnUrZXhIMFFOekpFbnEvZExnaTBxUjhBRTJ5L1JnSnFLNSsy?=
 =?utf-8?B?YlZFNEd5bnNvL1kwTFNJYWxRQjlPY1kwaGl6b3VFZU53emg1VVpoVHBnOFdu?=
 =?utf-8?B?WThJRzNxb0dFMVF4d2p1blRjMDN4bDNzT3B2RlNEejJ3VFJ0RlVnVStLdHpL?=
 =?utf-8?B?REdBNVJFM3hWazFGRlExWTJXdUlRdjNDS0RlZnRUSVE3ZGx1TkYyTmJkeUQ1?=
 =?utf-8?Q?QCS0f9L7rFCiBXOmRY0aZSNVzvKlNBzoxpL9s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmE0SUdOVHlzVGNtcE8rbFpQWEpHMmdkeUMzd1Z4U2FHWDd1bXVndnhDU0tp?=
 =?utf-8?B?bi93Q2x2ZXRRZWFKQlF5cVZSNmY1OWU3bnpDQWMxR08ra2FGQTFrOXNEQjFV?=
 =?utf-8?B?aGtpVHU2NXpnRFZCdzAvL1FFTkdYYkh0cHN6OG53SnNhZjJrT24zNHp2U1JV?=
 =?utf-8?B?ZlFETnRkZW1YZHBhUS9UNGhuRjFpV0VlaXY1YmwzeDNmT2cxODhHcEJOQVZX?=
 =?utf-8?B?VWpLZklKZkp0N3l3TVRqS0ZPcHR4OHNJTlhOWDRKc0ZGeWJwZ3hvS21TaDhC?=
 =?utf-8?B?V0t3eVBPcFhzM2lRRnVMN0lZS3Foa0g3c25WMG1JNDcxcy9qbTFwZGhNZElO?=
 =?utf-8?B?UjV1Q0FWZGRZeU9BNmR3b3Q5c2VSdDE0cUJVSXhDNFNrenF3N2lYL3QzcERi?=
 =?utf-8?B?OXptS3UyY0tITHZ0Z2tiS2hYczVETms5cjhFNGxOK0htb2RYcStWd1RiYzls?=
 =?utf-8?B?eWNzQU10K0Zha3diN0tIRm5uUGdQTHhnVmpYVytjYU5zQU4wQWk0SFBEUEND?=
 =?utf-8?B?Z0J3dnNkZHdmb2ovMWloWHU2enpzdnRrWm44K0ZtcUFCb2J5V0g5b0tHYitm?=
 =?utf-8?B?ZXdtZnVuOGtHa0NCck13Mkp5R2kzeGNjZW1waHl0RDlyWG9tN3BCQnNQMGpF?=
 =?utf-8?B?Z0NyajRlZUR5MjBHVjhYem9ERy9zZDV2OVJOL1dtRXhLNG1HMU12UUZzSXpT?=
 =?utf-8?B?RjZJaTI5bC9kcU9DVGRiMFEva1ZWQkNEZGR2QWZOSjNyc1cxZDd6WWQyQk1l?=
 =?utf-8?B?V1ZDTEZ3dVdlY0VJeWZpaVpsaHRMbkcyVldEMThoV0NLZng2YzdqQ1hKRUNB?=
 =?utf-8?B?WVpoZjlndTF0LzY5dy83TE1TSHptMEpVekdpV0JIOXNEekVPZ1l4TUQyS0dO?=
 =?utf-8?B?Vm9sV0FWR3RKZVl6Kzc5TzJ0eVp5Q3lDMHdJa1dvRkNuNk9lZ2JaYmx3dUwx?=
 =?utf-8?B?VjllTHFHb0Nqemc0aHBmWnFnT2REUEVUNlFxV2hhWDM5VHBSNERseitaK1Jq?=
 =?utf-8?B?WlhIS1N1VXV1andwRTNxeEMvMGM5V285eXlkUkdEOTRxa25YN25hUFEyTXFh?=
 =?utf-8?B?dU5lbWhVQVM3L2RsaXRXUzdvSmxWVmhmbG5hYjVubzFGOUJ4TkVIbXVjVUxK?=
 =?utf-8?B?NmJnNk82NzU2dnRid2VTN3lxSEJPaU9ibU50NUJvZityejczUmx3M1FYZDF2?=
 =?utf-8?B?LzM5aWR0ajFCNmtUUUNTNUY2MlhCYWJUbFZMRXpQSFV2ZERHNjZxSjUzN2Mv?=
 =?utf-8?B?TDAzSkREUnhCVEdSdytJY0w5OU1mNERDc3FNQ2hnVzkwLzhZdmhEdUpqS1Qz?=
 =?utf-8?B?ZXZXSTdKWnpHaE9PZlZxVUw4ZVN0a08vdDF4WnBhN2psL1BVSnVPVFRjczFp?=
 =?utf-8?B?RXBlUnA4cTZzaXcxd2RUbng5R21ucHU2emtWd0dZMDF6ZHZWYWt6NEVpRHd3?=
 =?utf-8?B?NkFGQzVMaFQzUHhxaEVaa3c1aGloWDdjZTNpbDN5S294d3J4bGgzYUZycWxF?=
 =?utf-8?B?ODZNRXZTanRUWVdES3MwU1dPNEZLaWxaMmhubWtsSzZoUFBpcThPWndLd3p1?=
 =?utf-8?B?Ty9VallBUlRZczFJWDhyaHFvWlhLcDJDSkJTdXRIcUM3ZnJtUTBZTHM4cnd5?=
 =?utf-8?B?N25DbTRFOE5CM20wZTZsdWQrbjd0cFAwbWY3V0h5eEwvcFF3UU9tR0lVd1la?=
 =?utf-8?B?MFQ1RWZ3UDRpZTVjU0Nza0c4WGlGN1QySGY1M0pYemNsNERnWnJzZFNicko3?=
 =?utf-8?B?dncrQ1pIZEZpSWVmVHNmcnZCbVZJeWNWZk5wTkdPUTlNN2FsNWh6M3dUVWRa?=
 =?utf-8?B?UElQQkwxNE8wbWpnWmZEVk5KTmlXbWFJSjhZZHdzYW5yZ3dLMm81cUxyNmcv?=
 =?utf-8?B?T2piQTVTYkpXd1VySkJ0Vm9FVVNvTnkvY0lseWIwVXBHZXVYL0ZMMWxNNFhU?=
 =?utf-8?B?THNoZFVOMjVnczRlSGEybm9qUVllSnh5dlM2Vm02RkFFRkt6NlluQ2cxVEhZ?=
 =?utf-8?B?QzJtK1FEeUZicE5kazAxMXE2dCtnVUNDeXQ4bUVZZ0gvZDZmYmlvRUVsVjJS?=
 =?utf-8?B?TjUrWmN0bHdrUWlNVUd2RERjMGpqeGo5NHRSK09xWGNkdnhzMjlCamFUS1Az?=
 =?utf-8?B?TXIxZEtCaEtDVUx6L3g1ZS9qbnNSc3VGTWo3STlZMEU3TGJLT21RZU5SN1NE?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7aaaf34-1f9f-445e-4d31-08ddd0b9a453
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 05:09:50.4592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GZ1i1MCQHgoGbPcI4RN1kw14N+vNyb9JXokoBaH4LPuwDHWX4rz3ybFrOUsulksXMBuCGPkd7vXVAdiokobYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
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

On 31-07-2025 20:47, Xaver Hugl wrote:
> It's entirely valid and correct for compositors to include disabled
> planes in the atomic commit, and doing that should not prevent async
> flips from working. To fix that, this commit moves the plane check
> to after all the properties of the object have been set, and skips
> the async checks if the plane was and still is not visible.
>
> Fixes: fd40a63c drm/atomic (Let drivers decide which planes to async flip)
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4263
>
> Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c   | 51 +++++++++++++++++++----------
>   drivers/gpu/drm/drm_crtc_internal.h |  3 +-
>   drivers/gpu/drm/drm_mode_object.c   |  3 +-
>   3 files changed, 38 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index c2726af6698e..df298ac49dcd 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1011,7 +1011,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   			    struct drm_mode_object *obj,
>   			    struct drm_property *prop,
>   			    u64 prop_value,
> -			    bool async_flip)
> +			    bool async_flip,
> +			    bool *needs_async_plane_check)
>   {
>   	struct drm_mode_object *ref;
>   	u64 old_val;
> @@ -1068,7 +1069,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   		struct drm_plane *plane = obj_to_plane(obj);
>   		struct drm_plane_state *plane_state;
>   		struct drm_mode_config *config = &plane->dev->mode_config;
> -		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
>   
>   		plane_state = drm_atomic_get_plane_state(state, plane);
>   		if (IS_ERR(plane_state)) {
> @@ -1084,22 +1084,14 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   				ret = drm_atomic_plane_get_property(plane, plane_state,
>   								    prop, &old_val);
>   				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
> +				if (ret)
> +				    break;
>   			}
>   
> -			/* ask the driver if this non-primary plane is supported */
> -			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> -				ret = -EINVAL;
> -
> -				if (plane_funcs && plane_funcs->atomic_async_check)
> -					ret = plane_funcs->atomic_async_check(plane, state, true);
> -
> -				if (ret) {
> -					drm_dbg_atomic(prop->dev,
> -						       "[PLANE:%d:%s] does not support async flips\n",
> -						       obj->id, plane->name);
> -					break;
> -				}
> -			}
> +			/* Need to ask the driver if this non-primary plane is supported.
> +			 * Note that this can't happen here, as the full state of the plane
> +			 * is not known yet */

Multiple lines comment stye

/*
  * <text here>
  */

> +			*needs_async_plane_check |= plane->type != DRM_PLANE_TYPE_PRIMARY;
>   		}
>   
>   		ret = drm_atomic_plane_set_property(plane,
> @@ -1394,6 +1386,10 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	int ret = 0;
>   	unsigned int i, j, num_fences;
>   	bool async_flip = false;
> +	bool needs_async_plane_check = false;
> +	struct drm_plane *plane;
> +	struct drm_plane_state *old_plane_state;
> +	struct drm_plane_state *new_plane_state;
>   
>   	/* disallow for drivers not supporting atomic: */
>   	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
> @@ -1450,6 +1446,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	copied_props = 0;
>   	fence_state = NULL;
>   	num_fences = 0;
> +	needs_async_plane_check = false;
This is already set to false in the declaration.
>   	for (i = 0; i < arg->count_objs; i++) {
>   		uint32_t obj_id, count_props;
> @@ -1512,7 +1509,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   			}
>   
>   			ret = drm_atomic_set_property(state, file_priv, obj,
> -						      prop, prop_value, async_flip);
> +						      prop, prop_value, async_flip,
> +						      &needs_async_plane_check);
>   			if (ret) {
>   				drm_mode_object_put(obj);
>   				goto out;
> @@ -1521,6 +1519,25 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   			copied_props++;
>   		}
>   
> +		if (needs_async_plane_check) {
> +			plane = obj_to_plane(obj);
> +			old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +			new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +			/* only do the check if the plane was or is enabled */
> +			if (old_plane_state->visible || new_plane_state->visible)

As said in my earlier comment, this new_state->visible is not yet 
populated. It will be viable to have these after atomic_check where 
state->visible gets updated.
Instead fb can be checked to see if its changed to NULL then it means 
disable the plane and instead of rejecting the change, can proceed.

These kind of checks will be much easier with having the proposed change 
in RFC https://patchwork.freedesktop.org/series/150081/

Thanks and Regards,
Arun R Murthy
--------------------

> +			    ret = -EINVAL;
> +			if (ret &&
> +			    plane->helper_private &&
> +			    plane->helper_private->atomic_async_check) {
> +				ret = plane->helper_private->atomic_async_check(plane, state, true);
> +			}
> +			if (ret) {
> +				drm_dbg_atomic(dev, "[PLANE:%d:%s] does not support async flips\n",
> +						obj->id, plane->name);
> +				break;
> +			}
> +		}
> +
>   		drm_mode_object_put(obj);
>   	}
>   
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index 89706aa8232f..111907a55d9b 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -260,7 +260,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   			    struct drm_file *file_priv,
>   			    struct drm_mode_object *obj,
>   			    struct drm_property *prop,
> -			    u64 prop_value, bool async_flip);
> +			    u64 prop_value, bool async_flip,
> +			    bool *needs_async_plane_check);
>   int drm_atomic_get_property(struct drm_mode_object *obj,
>   			    struct drm_property *property, uint64_t *val);
>   
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> index e943205a2394..ec471536cfbc 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -540,7 +540,8 @@ static int set_property_atomic(struct drm_mode_object *obj,
>   						       obj_to_connector(obj),
>   						       prop_value);
>   	} else {
> -		ret = drm_atomic_set_property(state, file_priv, obj, prop, prop_value, false);
> +		ret = drm_atomic_set_property(state, file_priv, obj, prop, prop_value,
> +					      false, NULL);
>   		if (ret)
>   			goto out;
>   		ret = drm_atomic_commit(state);
