Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1EAABEB0A
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CCE10E5A4;
	Wed, 21 May 2025 04:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjp2MaZF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0188310E0D3;
 Wed, 21 May 2025 04:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747802972; x=1779338972;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MAziNQnNeIb475uwLFAubOKZjWNFPWiPL+vBWpD24mQ=;
 b=kjp2MaZFi96QCMf6JOl9L4+vGp8YZj1n3L4Rjl9fGiNt5p/u4c7NF/zS
 YleRPNpi4EgcXM/PbvdDGs3yF95y1YNRR4U6EI4SvoAV3pGdD4V0LIZOT
 bObC9dI9lOOhouX/fJ0oGd07Yo6PvpQ8i7cFqP7UtYOwyBHFAQ2AuvDwD
 xO7c67mrAt3nnsSAnX9y5E3GHS6bGB2MQoNOQ3bTrXRubwsn5v3T6b7LC
 maZ8b501cTdglUIrd3/eLeDxD0ldgEDYs75fwUVvgqbXNtf9ZqtbcAuh/
 smH5ujjD0psuDvppRrqOIZ6jcla1LcbwKK+KbhWTGCrJ9Pqb7z+2TdzYf A==;
X-CSE-ConnectionGUID: UxiUXHE9SEOG8EXKGB+LcA==
X-CSE-MsgGUID: +3Zyut6kSyu88V3uUsdBLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48881675"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="48881675"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 21:49:31 -0700
X-CSE-ConnectionGUID: 9e1nQGPGSoeIKZKqjdRa3g==
X-CSE-MsgGUID: Mt4povJGSiyQzNHQDw/Aag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139745281"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 21:49:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 21:49:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 21:49:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 21:49:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYuMs3waPbU+bZPXmAUSjd06mzzvRS8fM4Kx1ZEkYNe74bp2iMuhrEM1SWOjSlchMeCaC+pK30uatQIErb43bPwV/RNH1oJ3Bv0jPmE+cbxHuRP02kw+QrXq/RX0Y/0wxXCkXOE4q4HF6tIsLmZCX9KGd5KVLC6O83hdL0DcZNibDENoIzkeQrh25uTafEr/Qq60Vd8+tboJ95GgxvALpQ71FCjOjg3nDWhBh2gEBmRl2ibSsidhI9ZpIByNCkVy8xxm2bZjl0Tf30ahVhTtotXLpD+G4+5aHni5yeVKCFQ7xjyEUu2ajsiEJ99+gxq/MjJkZfoYoYADMcrL1IjlOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpLQSMOnYXVKsOPQPNYPpEZMMIAXLbKWqrjJWlFDvWQ=;
 b=pdDYTZ2Sxl2cOxk+bParxBEaiy9LaIFPTMzNSXNhdFerNnpfmerwjgczCe5yLRpDGJihoGkFUgigVb9gf9uSa4PBQyVh8Jm6TpaPo7+HSgPCUds9vvXvkL0zS+MPO6pFUg0eUxRd8NCGn/AJMFlYQjK7sOAWmexnOvsL8GvzFc7D8la+eRzsWJz+Dbs9+9xVoi0qG5uNTCKZZTCV4D8tgSYo8M2uXm8OS4/pY0qjE8DPkF3O0BgksosRN2JxSyqqFqh1EHfXt2eEbtJdW2XJCo2JY9SsOuVRyiXhLw0wp3uXXkv3cKM8XDo85adGMHOFh/nVqDhTFdBy2NMPxO7mFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 04:49:28 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 04:49:28 +0000
Message-ID: <6d42171b-14a7-460f-9558-bf89af7941f2@intel.com>
Date: Wed, 21 May 2025 10:19:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] drm/dp: Add Panel Replay capability bits from
 DP2.1 specification
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
 <20250520165326.1631330-3-jouni.hogander@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250520165326.1631330-3-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: b27787a2-b135-4271-01fc-08dd9822dde5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2NzZCs2Z2xqczV3dkI1T0JsZnFKWFE3d3AyaVVtZjU5V2hYUTgvTmpqOFZt?=
 =?utf-8?B?T3BwYWVjZktZUi81N3NVS1VQVjFyalh4UTRIaXIxNUx3b2daa2pzcHdaN2VE?=
 =?utf-8?B?WUpzVGQreWFlMGwvQm9zUzQ1T0E3c0tsYUJZUXRuRVFhS3A4R3pqa0dOZ3My?=
 =?utf-8?B?YWFQWFM2ZSt3clhYVnFEbFMvdTlxL2tiYmF6UXI1TG9RdlF5c2U1UVhVZHAz?=
 =?utf-8?B?djhHRU80MG9IaEpGSU9ZSzhrcE1UNjlRdEI5RjNhWHROYzV0VTk0dmxNNEZ0?=
 =?utf-8?B?VmJFejIrSm1BOFlHUlNab1VQZzVxSTdKT1ZuUHBJN0o1QW5FcXM3NjYxQXRp?=
 =?utf-8?B?dk4wWDRBQTJUVnUzN2ZZcVB2aXdCYW1jMDVIdHJwRDh0Yi90VzlmV0F3dEpX?=
 =?utf-8?B?Z1RPOHgzWVhybHFSSFFSQ3l2UjdKR1ZXZ2s2ek1jU0llQW1rZUxXZCszWjE5?=
 =?utf-8?B?cFhOQ2c0by96NGpaMGw2YXhPWVZ0SXF1Y3gxMzEwVk1KTU1saDI3N1V4ZnJr?=
 =?utf-8?B?dkNkQUQwRzIxZWZ0eFVTSnRTL0tEcG1JL2F6S3lwT3hZTEt3c0RrTi9PbnU0?=
 =?utf-8?B?b05rTFEzRzJuOFZhYVBMQnZoMDJLeWNzR1VzRmlvdGsvb01DVEcyazlVMDNs?=
 =?utf-8?B?WlVxckRHVzh1c2t2QlJRVkZ0cXMwVWRXemRtaDZCVlYrcDJwUm5UeUZvUU5V?=
 =?utf-8?B?Z2dsdnFGZHlUOEhTaDcyenJkYnZ0Wk9aMlQwL1pma3BJZXFtSml6Y0lKY09m?=
 =?utf-8?B?Q1d5TTdXTjNFbjlzd0M0aVNQUHB6OUtMRWJ5RFdsYXFRMXFaOWhkN0xFWUZG?=
 =?utf-8?B?R2pvQm1IRDJmNDNnVDR3bnY2ZjUxMjFjOXN6S21pdUFMOUhVSTJ2WEtPUElh?=
 =?utf-8?B?bGZhK09YS0NBSWVockNwQWZXRU5DT0U5dGFMbVdnb29pSkM5NFRDRS9UekVX?=
 =?utf-8?B?Z0FDTzFqSnUwMFJ3dHE2Z2E1ZUZDK0JPSTY1S3JDeHV4d3FFdU1VQThkd0Zz?=
 =?utf-8?B?cjlNNjJvNlNpVEVLTURibjYvZktlanpzRWl5Rk9DcXZxc0d4NjE3SUlFK2Ft?=
 =?utf-8?B?Z3JYd1QraTBYdUR2Vm9vaGxKWWprVENpbzNVZy9XaERrcUNlSDBNeGZ6VTBX?=
 =?utf-8?B?L1phTmtYZnQyQUJwdFQ3aGdtb1U5ZWFEanprUy9aK29lNE5sbXY3MzVqR2M2?=
 =?utf-8?B?Qm44dVJ5U1NmTHptODgyRlVyWVZrOUM1YUROVWtjdlhyQXhhU2crU2NiVTZK?=
 =?utf-8?B?MzFMdktyUW1Wb0Jzd2M5UGFNd2E3NElPV3VOMzFuOHpnNzZMcmJxMHRqUldy?=
 =?utf-8?B?RWdEZkVYakJFNkRRaHpINzdzVkFWRDFiY0VMejd5THg2L3dkeC9tNFM5Tzh2?=
 =?utf-8?B?MkJnZC8zNzZKQnZuK041aE0wdERDWldXU0Mzc0ZCVThWL08zaGtVeXhWWTJh?=
 =?utf-8?B?NldVUUVQVHBrZVdpaHE5Y3VicE9OY1gyUVNLSlhnSWZiek9FZng3ZmcwZU55?=
 =?utf-8?B?d2xlSWhGTnJyV2k4S014djhGekZweHcxQThsOEdyMEcvcVU5SVVFaHQ2Uzhm?=
 =?utf-8?B?ai9mTGtqbE5Rclg5T01oMlllZnRGTlJvRmhlL1Qxa2VIQUtJenlMV0FSSTRI?=
 =?utf-8?B?VStQN1MvQTBSSUE0OGtHVXROSkhMVFczdzFQalNpVFQ1Mm01cmdaanpxbnl6?=
 =?utf-8?B?RWdSRXlYMHFFczA2TXYvZjBEUnlMRUI4dFpOVElKWVFGU3RMQlFqYzhmVDZt?=
 =?utf-8?B?OUp2MVVyUnFMN0JjYk1ncnBmeG1HQnM5Tnlza0FuQjN2QWlQWTlZZldKdUpl?=
 =?utf-8?B?N3hJcCtWS1dVS252MDY4QnJLeUorQk1WRC9uWVpIZ01Ldk14RUNYN2p0YTV5?=
 =?utf-8?B?UkV3S2FvMWxZU1MvYng2RUt2bFFET3FhK1g4T09IbklJWGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3FyQk9qdXVVc2p1MjF6clZOT3JtdGJMR3JsZUt1amYydFRlSjA0Y0h0dXFB?=
 =?utf-8?B?N2RFcEkyUnJBRGUvZzZPYjIyU0grUjU5NjV2ZVZuL1VpTGRPZDR3RWk2TC9U?=
 =?utf-8?B?emlWeUNTSy82WDZqWTdhS0RMT093R3NIbUFrMlV0ajNQeGFnTzhHQzRpSkp2?=
 =?utf-8?B?aC8zZVF0Mzl6STZPU2l4cHJKd2doY2plU2VPa2I0M0R3SlBQOU9tOC96dTM0?=
 =?utf-8?B?V1JYNXZhZmljOFV5ZzFBZllKMVJtZ3NaTHo3THZQcGJ4ZWNTYXFNL3hFdVJi?=
 =?utf-8?B?b1NOSVFqZDJkLzhpMVNsVE9ybFdsK3VQb1NURlE1aXpERFZORi9tVldFUUdm?=
 =?utf-8?B?eGVMZkVLcTNWbnZoaGNRN3ZNZ2VpRzQ5Wkk3cUFTK05qK21UZGwvQjBXOXZL?=
 =?utf-8?B?bEk3TTZVVXVkRzJCS3dia0diUEJRRytPYWtla2FjU3k4U3Rva1FUU0g4Njlj?=
 =?utf-8?B?dmJtSGFuMVFCcU9aaGwwL0p6aERVRFB0a1ZGcVRicUNiZkcyQXhGeTF1LzFV?=
 =?utf-8?B?cEJiYWpwSDNHNEZQTDA3YkN0aHJweGhKKzhyUVRtdFNpSXdEOGhPb2pzNE1T?=
 =?utf-8?B?V1hhV1I1QXpUbk1OZm53WUtmU3dNK3YyMFhTVnFwUG1NREczdjBlNTlGbk9i?=
 =?utf-8?B?dCttQnZkN1NVN0xpVDU5dDEwTEdIckxaenNEdWg2amdha3Z4WjJManlNdzZ6?=
 =?utf-8?B?cUFXME9GK1A5N0txZFNIcXh4UkxPR29aRlZJVEpZV25LYmFjc2w2V2hJOFZv?=
 =?utf-8?B?MzJIcmsvbVgzSDloQmNvVnY1VWtiQ3NFelV6cHQ2MHJmNXBqYk52WXNsSjc1?=
 =?utf-8?B?bHliblRaODlxaDd1R1YvSFlOWjg1SEJ1WDl2NGJkVytVRDIyQVBIbEYxVnl2?=
 =?utf-8?B?S2IyaW1sRk9SZnh5blhudHZTU1VIKzNZT3hxR2NwckZYTDZuT1BweFQvVDhh?=
 =?utf-8?B?NWk0by9aV3lwUG84dUp0cFVyRUhPeXVQaE5ZcmY2dkY3ZEZjNVB3cHhoMDMy?=
 =?utf-8?B?SDZJUlRkRmwrRXd3eDN5UGJwclpZblZ4M3RQU2UzUnJWYndXTVZxQXlzdThN?=
 =?utf-8?B?TEdvNEozdmhON21oeitHWnhGL2xUZHdGTGE4MEYra09zbVhHS2RncU9rRjFD?=
 =?utf-8?B?T2pySEt3eEdLNVlSQVcxd3FYWklFeXlPTUJvb1pQRkx0bE5iMjJqb0RrYk1W?=
 =?utf-8?B?aTA1LytPbXg0YXcwVlArWVlDaXdad2w1YU12T0ozdkFxRmpkOUlVN1VsRG4w?=
 =?utf-8?B?NTJ6QjBSSTNwWkJXb1hNRGhtNTJXbE5zMmQ3YzdRUTkyM1hGYVVwRmlPd1lQ?=
 =?utf-8?B?NlZ2V3BtUGNhdVlpSjFONFlZL3VrRi9kOUdqSWNvWmkvTzVXVmRyZWlnUkNw?=
 =?utf-8?B?ZEpLUWZZa2lhQ1dHMTBlc1EvbU9jTUJDdHJSbk1SN1c0d0VqTFJReCtSVmhz?=
 =?utf-8?B?dVRPRmo3QlU4NzdFRWtyTUJCL3VwNWRXdWRtOVp2VkhlNW1ZYU1uYXk0UFhj?=
 =?utf-8?B?N3JEaU1DL0JrVVJVaEhuYlFiUVZCbE1WL0JwQlAvbjBwWVhzWXlOMlgwSi8r?=
 =?utf-8?B?YmNmVW80OXJpYVJpaHRucTJuRGlBSGN0dDNEMGxtMVZpa21rTjdPYjNLRjFU?=
 =?utf-8?B?RWxxTXptUjRZeDdlUU5Kbm5IRlFiWkVPd2UzNklYNUlxcnZ5aTA2bkpZbW8x?=
 =?utf-8?B?N3AwcHpoRHBLYUR4S2xwT3FVd1dnWmVTdkxnd0JRODk0N0pxRVpYWnQwYW0v?=
 =?utf-8?B?Si9zcmlJT1NhQ0JrM3VpdUxVMjBjSFk5U1VaUy9odnRNbGFFeVlCdWFpeW9k?=
 =?utf-8?B?UldXck5nTG5MK2Uvd2I1RmNKQWhnNEVJRFN0SmQ0bVcyN0hORU1rVHJEMHgy?=
 =?utf-8?B?akZ4UWJ2VldINC9FWkwrMkhPNHViNW02YTZDNkJZbmxZcGZKMTh5Q01MMExV?=
 =?utf-8?B?c0JNM2JRczF4RlpxRUJpRURNMGxPMzVjVnVWR1BSSTlCMmJoMTR2VWVES1l6?=
 =?utf-8?B?eWVpVjlVS01zWHlUV2VDMVVvTWs2WTk4bXduL05nRzVBTS9sNWt1NUpTK0lY?=
 =?utf-8?B?MzFVc1RsZGtvQ0dqRFNDdkV0U0tWRDRNZnYxbkI3Y09zbWpkTG52NXQ3TkFV?=
 =?utf-8?B?dDV1SThhRXlQZFhVdFlvTXUySUJHWFpFbkpicFBSK05FS0VKL3g4OTlJbDdv?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b27787a2-b135-4271-01fc-08dd9822dde5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 04:49:27.9383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEq3Qf3Z26PN+T6s1kGQ0UN3CWy7EzTnPqkViCIs35KwMYP/5yjMrMrto6S2CROI8Ut7/xY/8ofdaDAjlSNKcuupY7Q9EAwFiXTt2MB6IV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7511
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


On 5/20/2025 10:23 PM, Jouni Högander wrote:
> Add PANEL REPLAY CAPABILITY register (0xb1) bits.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   include/drm/display/drm_dp.h | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 3371e2edd9e9..91ee4c0ef0cd 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -554,8 +554,14 @@
>   
>   #define DP_PANEL_REPLAY_CAP_SIZE	7
>   
> -#define DP_PANEL_REPLAY_CAP_CAPABILITY			0xb1
> -# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
> +#define DP_PANEL_REPLAY_CAP_CAPABILITY					0xb1
> +# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT			1 /* DP 2.1 */
> +# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_MASK			(3 << 1)


This doesn't seem right. DSC Decode cap is only bit #2, as per DP 2.1.


Regards,

Ankit

> +# define DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR			(1 << 3)
> +# define DP_PANEL_REPLAY_DSC_CRC_OF_MULTIPLE_SUS_SUPPORTED			(1 << 4)
> +# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED				(1 << 5)
> +# define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_CAPABILITY_SUPPORTED		(1 << 6)
> +# define DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP	(1 << 7)
>   
>   #define DP_PANEL_REPLAY_CAP_X_GRANULARITY		0xb2
>   #define DP_PANEL_REPLAY_CAP_Y_GRANULARITY		0xb4
