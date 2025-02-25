Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A86A438D5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 10:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6832C10E5D3;
	Tue, 25 Feb 2025 09:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrMydcTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9E910E5D4;
 Tue, 25 Feb 2025 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740474645; x=1772010645;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RQ0rCYfSYSidg6SQb0SqGyOp3SWsxtDR94p25TqwHRo=;
 b=GrMydcTu95rhlXbjGzllkekrCvdudMNIh7Aos88cGdPYvYduiM+opS7O
 QMJUb2yaS6YE9jKUeC2ME5fHPlQ2rwnoJw64sfwuU76kM4b/wYO7LWPx7
 tP0X78fIXn9BGy+MH1lDDR1KR7q3SKNoYSsoQ8oDHoDE3WddzZf7x95qE
 l7NhL1G+6PpMy4L0Ow6U7hRFSMcaEro1TdNNr/dVs4GUh/BFR6jW06Jdl
 YUrtPSV3LEagETisoc08LMbz4Vofx8BiScBqKtGIDaPCxtZ9thsNcM3bn
 8Tb928C7pAkEL7Z0DM7BmTJNC3WciIRzL82adSuKFTcgX+LiKTLeXqu0d g==;
X-CSE-ConnectionGUID: 36p/cME/SBa361AHLo68gA==
X-CSE-MsgGUID: dtEtlm1DSF6jnL/t86l0AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52695557"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52695557"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:10:45 -0800
X-CSE-ConnectionGUID: q725ov0iRx+d53AkcQ7WRQ==
X-CSE-MsgGUID: cUCxQibXQXG7oXJezwQRbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120433575"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:10:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 01:10:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 01:10:44 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 01:10:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obwVo+iHs2QoX61lA6GE4rxhT03mJrYplGg6mVhcUIBwo55jOtn9L0Mp+tHHM2wrwkBFW5Q4ebUYWHngJnKljVLvhdBisFYudCep/5/9HhhurAlBZ/TKt/+0aTJZs3SrFTnOwj7zwWpE6Q5llcSNBaxj3uN32u24+ADntIDHRLy1m183pwFJHwlfiqUOKchPYNXXlS7z/htaPR8hwv5NwzZUKB36UrwqsKDdwQqNH5Y/wbfxS/KJ3RQf6fV7Ac+TNMM7Bw5qK7zDg5DfqD9qVnT9zrzCWZbPUVNoJHXQlYVyQHHBky5K7eypnmUiy7KrvfnGcDznBep0I8zRMK6B1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRxj0qewHs/hHTRcN6v8Gd2Zzst5+J24kD2ZQ8J79w0=;
 b=ZiVa5uAVjJUXsktHLMIp6KznVB1h/kCQECSoU33Y+Kx5vymg82oDwC+38T2toZzmJy+G9VFKM5K2eXjprYMt+X6xu3bcNjfKKWdZn+IUlVGjcBlTKJUHr8yjxrvPF1x9JTG/UAPCGx1LDTwoDmH9EE61DoG9FjwQbBWqKLjxouP7Gpoc7OQL7O4OTBC8S+6clE+PwDIychLepd+En0TFUAucp7IhQ9QAhEN+7KccvAjF6eMIpe0U2LoLzeU494F6nQlhOHP0NYIupoHrIUKZvS//jQevhFZY00pMxcf8u2KbNP73ADUp4F8H4eVIb17PiX+FubEvSwWcPtABjKyFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA0PR11MB7209.namprd11.prod.outlook.com (2603:10b6:208:441::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 09:10:41 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 09:10:41 +0000
Message-ID: <00683c9d-4353-4667-b6e3-38c6b9aece96@intel.com>
Date: Tue, 25 Feb 2025 14:40:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] drm/i915/display: Add registers and compute the
 strength
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250219115359.2320992-1-nemesa.garg@intel.com>
 <20250219115359.2320992-6-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250219115359.2320992-6-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA0PR11MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f850a32-89a0-4c75-233f-08dd557c46ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnY4WUNMV1BKR1RWRFNhMWdBWU9jQnRWd0NpZWJ4TnZ5UFJNQk1OcHB2aXow?=
 =?utf-8?B?ZEdLUDc3UE8rWHhVUjJBSkVFcmEycUc1dTBldTNBYzJmeVdDYUFjc3hjZXhO?=
 =?utf-8?B?bjFTZS94M05Ec3I2Z2RSYlRZOS81NkczZDE5ci8yQVdzcjdkOEI1UGJpSS9q?=
 =?utf-8?B?K2NmTnFjZVN5T0thaFhGUFhza0taVDdFcDIzWk1HRXJUMmNLUjZuTStvYmVF?=
 =?utf-8?B?VkhaZHRSQ29hKytpTjBOT3JVbzdHK0V2Qy92Yk9iZHJFOC82OTlLeE5yUnNP?=
 =?utf-8?B?MUVhaThBNFBlQ0twSG1UZkxCMHM2YnZQei9pTEVwZzE4RFd3bmVNYlhLU0M3?=
 =?utf-8?B?WDBaYjRGd2xQZzJibVlUemVWTnhVclJxckNDdGxTNnAyV0FUZjUrdzJWSnNN?=
 =?utf-8?B?NUNaeDhkWVFUODdZdEtNcUljdnNBVERHdVg5Q1lPSDl3L1dPenlKSmxuWnlh?=
 =?utf-8?B?dWV6a0JYZHowRFcyc05LdTRFaE5sSzdkOTJDUHlCVTZhV0Y4Zkk1eWFqV0dB?=
 =?utf-8?B?K3AyZ3dHak53L0JVMnVodnRxZG9kajNLN1h6dmp2RXkyQU9IdGg2cm9LQXJ0?=
 =?utf-8?B?K3JTSFBDVFdiWSt2Y3Y5ellaUlphZ3N6TmRqTkt4YXFVOHpQeldUVVRuY1Zp?=
 =?utf-8?B?MkJtL0ZpR2NKM2pnYTBBbkdKREFUZDRobWRJWVZINFBLRCs1OFVIUUhOT2tn?=
 =?utf-8?B?TncwN29Yem9kcUsybWQ3RE1ib0c1dkhnbG0rR1daYjE0eHdMblViV2RwR3or?=
 =?utf-8?B?dUxSaVdSZjVSaEtlMXRWeU5zSXd3MTFpUUdTWU1GUlJUc21Xbjg3T3VpUi92?=
 =?utf-8?B?ZVd4ZnV6RDZCcFhpNHBiaUw1Z2g2ajZYLzN4V0tmTEliVEh3d3I4eGpML0dq?=
 =?utf-8?B?QmJ0YzhjRWlFUGU4cnJ1aU1PamZOTFhHWFFaRGNET3NTR2p1dGpRUTdXQ1or?=
 =?utf-8?B?VVV0MXlLaGFiNzRCY241RHUyODdncmNBdUJLc2VaeWV0VElpMG9QSUdoOTJP?=
 =?utf-8?B?dWxQUkhtU3hVS1BZOG1iRW5pNGZCOXJnMWFwU1pGd1luUElwbVgvWlYzakxH?=
 =?utf-8?B?RGQwcGRtbFNQM0x6L1ZIa1J1NlZUdGRYNGpCc3NXdDVRS3BiWDBLTWtoL2Rr?=
 =?utf-8?B?WXZ4Q2NBckt3UGNIUGkzcW5wOVhTTW1GSHNRY3l0U2dlMWRzWHB2d3NPUzFj?=
 =?utf-8?B?UFdTY2pKazJTbytmY3RHa0lOOEZNMlNXOUd1WXVqOG9xMEhTdzlETFRxSDE3?=
 =?utf-8?B?eHdKMm5sVE9uNndPc2xIR0pFZFVRTXdUWTJ1dDRpY0R0Z2gxN2ZPdW1BNXE4?=
 =?utf-8?B?RG5WTUZwRHc0dDU2ZUNodENTMlJRVGYwRytNaW0yMTYrSVhHY2VldlBZN00r?=
 =?utf-8?B?WGVybjNPd1dsaStiZ0FnbC9WRmlULytRc3U0WEZzSTBld0RTMnk2SkRoUUw4?=
 =?utf-8?B?ZXlEbjJhcXIzWGhHanJrdWN1enBDWTZNMm9BR3BWRVRYNkdBU3lMd2tEZysr?=
 =?utf-8?B?TkFEV2VHTDQrdWdwckZpK0IvalZucjQzYkd0YWc4UW9oeWoxeHZ6VG54R1k0?=
 =?utf-8?B?MmorSUQyY0pzOEVQUmFrUDViamdTWWtxemkwZkgvMHhqNWZLMFN4OFdtbnBB?=
 =?utf-8?B?bFkxemM1eTVLbGVudURTZytMdkZLQXpwVng1UStIOTduSVE1SEJ5MWFyMUZk?=
 =?utf-8?B?Q1BXUFFnbCs2UlR1NkFKUklnN3pyY25lWDk4aHFZSCtSRU1LREZDUmF0L04x?=
 =?utf-8?B?K1dHVHROU2IwZWRvOUhXWHhqaEU4WkRFdTNmWUw1bHA1VmM4U0p5dUVLanI3?=
 =?utf-8?B?T2ozYmoyd2lUTFNCYUphMFJybE1ULzNRTjBzdFlKdFpJdXI3WHJIRlNZWVV4?=
 =?utf-8?Q?phw61ZDWNddAl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlhFdXhWTXZ0SlFNK3Z0dkJDbUVsdlBHSEpUN2JaSjNyZy9VczRkdFhkdnV0?=
 =?utf-8?B?VURMWmFzd0grbzBock5UOGlKWjNwenRlYWNIMHV1Zlh0RENUeUd5a2E3QzBr?=
 =?utf-8?B?bjZIT2tYNE5ZaHIwZFlGMXppM0tIOEY0bVFoWm9UQmtkaTNLZXd4SjRGL1Ir?=
 =?utf-8?B?Q2dqTUd4SGlncDBZMkllMWkwQ3ZFRzR6d1EzdXV0YjlFd1lTdlNSMUxmVlZC?=
 =?utf-8?B?Z2RJWHJQaWJZS2d0OUtuL1ZSODcweThNd1AzT1hJUFMvY2hOenIxMEdYaU5z?=
 =?utf-8?B?YU41a21IK0MwMVZQakVFSlIvUWk1cEVuQzZRdFg4bTJLS1V5UHJRc05ZcStH?=
 =?utf-8?B?UmJDU21mNnoxdWFIYzI1ZGVucmdyWDJWS3BCZzBmdE9aZ1BYc09qRHV5eTJv?=
 =?utf-8?B?ZXRERDY3RGF4Z0Y0MyswRU9uK2FDMlkwdjlGL1IwNi9yTzJ1anZ5Yk55K25m?=
 =?utf-8?B?OTR6Y3RMM1VrZEsvZ0FyVFlQSGp0eUFRR2M3NHE3eTBTelFzQ3lYL2JDOGFZ?=
 =?utf-8?B?MXBkNDNpQWg1SERqTlNySVpyVmU4WGI5TUNGK1NheVgwa1hqSTFXcGpUVE1a?=
 =?utf-8?B?N2ZhNVJTdFkyWmxlWWZJeUx4VlBFR3F3QVJTS1M5Qk5kSVdiNjF1dDZJZTYz?=
 =?utf-8?B?ajdscExYNEdOaStDTkY2cjNiMnZlZGptOWovMEZOVzhGSjY0TFVWUjA1SFhT?=
 =?utf-8?B?aUpXOUIzTENra1RBcE5rNlBpRERlWjBlY2hNdCtIYzg0L20zSVUxNSs3SHUz?=
 =?utf-8?B?aXV4bm5oMGxEOXFLYjlFd0RqNWkyakpWQ2U2ODJKWHpNcGZXa3ZLcjlsVENM?=
 =?utf-8?B?bmpzUkd0blRSUlZoU2k2VEdoandodTh6K2dYWVdRNmpmekQ4bWF1YmVtWDhB?=
 =?utf-8?B?OWdCcWxLTkJ1RzNpL2J4emVlU3JoVW1lV1ZPZVRaMGRRclN2bmpSQ2hUQmFs?=
 =?utf-8?B?Mlh2YU9kdjluakdLdGZCK1dVdGdBSVBXc1crNEdIbnhXMWYxTDBRZzBFU0NN?=
 =?utf-8?B?QUttTkxBSnF1WFhHSC9lYWRhMW1XaVdEYkk5eDdCakp0WFJmM0k4aFlac24w?=
 =?utf-8?B?bG1XZ1NEa0VSaHRGYnJQdmNGczBqR1RyOVhFSEFRdmIwTU1RL2gxZHovTzZE?=
 =?utf-8?B?RWxmUFRLQ2IwT08zYkRKT2xTUmltdCtjcmFyb0NqZ1RHeFg3blhpMU5PWjkv?=
 =?utf-8?B?UmtQV3FFdDA1N2pES0tKOW5nYTEvbUc3UXoyZE00ZERRZlJ2MTZudllOWmdz?=
 =?utf-8?B?MnlaWXdWWXllU1dIV2UrQi83QTI4QW90RE5LTzI2VzlKbU9GSEI3V3o4NDFh?=
 =?utf-8?B?eTBpUFRxSFZEbTRYejdzbzk3UE5lYVdOUW90UXM0MXM4S1JGcGhaMnhKanov?=
 =?utf-8?B?Tkh1cnJuelJuNHNTTmxOb2NuNTZLV2lXb3FnR2Z3Q1hDSHJRKzVobW9GYlpr?=
 =?utf-8?B?OXdVYi9zUmFyN0pHSTIvWnpJUTllbnR0T2tRT3lQaG9UbkQ5NVlWQ2tqdjFM?=
 =?utf-8?B?cFJNbGt3cUxzRG80OURORFl4R0FSNG1EaTZ2cWZSS2p4cStPOGxwOUp3enhn?=
 =?utf-8?B?OUhsVUlqWG9rSittemZ4L3psblNpR1ZYVVk3YWE0azVsVVUvRWxNZFR4QUVK?=
 =?utf-8?B?cHNBZkJ1VENEOC9vM3BxM1ZHcGN2V3kzOUdBTGxwbk5PbDVVYUwxSUVQV3FF?=
 =?utf-8?B?cS9jMnB4MCsrME9EQjQxcnptQTZJR3JmSVI3aHN5aE5BOXNtRE5yMkJhMkJa?=
 =?utf-8?B?aWp6K3VDbmh5QUFlRnVISDQ5NWgwM0UwNEJKOG85eHdFbFF2SC9yVERXaC9M?=
 =?utf-8?B?ZTV3TEtJMDdHYkZGNzc5NWRKOGNnL2IrTW55OHlBRjBzL1JKV3dCMUhpZU1N?=
 =?utf-8?B?Ullma0o5VEdVRGxwSWNvZHBpeWwvalYyaUxVeWtJNlRGT29GMy9wNmdKQjU4?=
 =?utf-8?B?VVp0d2JMVkxXMnZQdkpzd2dkVXpiMS8wSVcyc1V5cWRSTVByb2hOYkRtanZh?=
 =?utf-8?B?QW02czhUV0JBOHVUOEI0dGhPM3huWDZWMVBlNmV3S0R3VERpM2x5bUZ0Ry8z?=
 =?utf-8?B?Rkk5ZXZrWGc3RWNmeXkyZ21jZk9PcXhkdjV1VjdzV1A2YkZSY0ZmaHdwaFpM?=
 =?utf-8?B?VDVxTG9aVmsxZEN2aGN5eW5iMXlXK0tPN29oV0lqbE5JQXZFQ1ZaaFE5Nktw?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f850a32-89a0-4c75-233f-08dd557c46ea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 09:10:41.1837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVwC1sQ7jdP1THxlSyKfrvOe21CcjPHEbd3PChlcQj8yF+qAeeBZgvREYrihd73c3Ur4VxijAikC3Wm26F/Cm1zxRhSHInnliUMgxEG2Rq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7209
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


On 2/19/2025 5:23 PM, Nemesa Garg wrote:
> Add new registers and related bits. Compute the strength
> value and tap value based on display mode.
>
> v2: Replace i915/dev_priv with display[Jani]
> v3: Create separate file for defining register[Jani]
>      Add display->drm in debug prints[Jani]
> v4: Rebase
> v5: Fix build issue
> v6: Remove erraneous condition[Ankit]
> v7: Change the place of compute function
> v8: Add strength, size in crtc_state_dump.
>      Add bits for filter size. [Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c     | 96 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |  6 +-
>   .../gpu/drm/i915/display/intel_casf_regs.h    | 22 +++++
>   .../drm/i915/display/intel_crtc_state_dump.c  |  5 +
>   drivers/gpu/drm/i915/display/intel_display.c  |  4 +
>   5 files changed, 131 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index f3c5a3f11128..aa38921f27b0 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -17,6 +17,9 @@
>   #define FILTER_COEFF_0_0 0
>   #define SET_POSITIVE_SIGN(x) ((x) & (~SIGN))
>   
> +#define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
> +#define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
> +
>   /**
>    * DOC: Content Adaptive Sharpness Filter (CASF)
>    *
> @@ -64,6 +67,64 @@ static u16 casf_coeff(struct intel_crtc_state *crtc_state, int t)
>   	return coeff;
>   }
>   
> +/* Default LUT values to be loaded one time. */
> +static const u16 lut_data[] = {

lut_data can be sharpness_lut?

> +	4095, 2047, 1364, 1022, 816, 678, 579,
> +	504, 444, 397, 357, 323, 293, 268, 244, 224,
> +	204, 187, 170, 154, 139, 125, 111, 98, 85,
> +	73, 60, 48, 36, 24, 12, 0
> +};
> +
> +void intel_filter_lut_load(struct intel_crtc *crtc,
> +			   const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	int i;
> +
> +	intel_de_write(display, SHRPLUT_INDEX(crtc->pipe),
> +		       INDEX_AUTO_INCR | INDEX_VALUE(0));
> +
> +	for (i = 0; i < ARRAY_SIZE(lut_data); i++)
> +		intel_de_write(display, SHRPLUT_DATA(crtc->pipe),
> +			       lut_data[i]);
> +}
> +
> +static void intel_casf_size_compute(struct intel_crtc_state *crtc_state)

Perhaps rename to intel_casf_compute_win_size()?


> +{
> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
> +	u16 total_pixels = mode->hdisplay * mode->vdisplay;
> +
> +	if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = 0;
> +	else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = 1;
> +	else
> +		crtc_state->hw.casf_params.win_size = 2;

Just use SHARPNESS_FILTER_SIZE_*


> +}
> +
> +void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	u32 sharpness_ctl;
> +
> +	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);

Strength is introduced in last patch but used here.

In update sharpness the sharpness value will be updated based on user's 
sharpness requirement, so we should read the rmw only the sharpness in 
this function.



> +
> +	switch (crtc_state->hw.casf_params.win_size) {

Use crtc_state->hw.casf_params.win_size directly instead of the switch case.


> +	case 0:
> +		sharpness_ctl |= SHARPNESS_FILTER_SIZE_3X3;
> +		break;
> +	case 1:
> +		sharpness_ctl |= SHARPNESS_FILTER_SIZE_5X5;
> +		break;
> +	default:
> +		sharpness_ctl |= SHARPNESS_FILTER_SIZE_7X7;
> +		break;
> +	}
> +
> +	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), sharpness_ctl);
> +}
> +
>   /*
>    * 17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
>    * To enable casf:  program scaler coefficients with the coeffients
> @@ -108,6 +169,8 @@ static void intel_casf_write_coeff(struct intel_crtc_state *crtc_state)
>   
>   void intel_casf_enable(struct intel_crtc_state *crtc_state)
>   {
> +	intel_casf_update_strength(crtc_state);
> +
>   	intel_casf_write_coeff(crtc_state);


As per bspec we need to write_coeff first and the configure sharpness 
control.


>   
>   	skl_scaler_setup_casf(crtc_state);
> @@ -128,8 +191,33 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
>   	if (!HAS_CASF(display))
>   		return -EINVAL;
>   
> +	if (crtc_state->uapi.sharpness_strength == 0) {
> +		crtc_state->hw.casf_params.casf_enable = false;
> +		crtc_state->hw.casf_params.strength = 0;
> +		return 0;
> +	}
> +
> +	/* If panel fitting enabled casf cannot be enabled */
> +	if (crtc_state->pch_pfit.enabled)
> +		return -EINVAL;
> +
>   	crtc_state->hw.casf_params.casf_enable = true;
>   
> +	/*
> +	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
> +	 * Strength is from 0.0-14.9375 ie from 0-239.
> +	 * User can give value from 0-255 but is clamped to 239.
> +	 * Ex. User gives 85 which is 5.3125 and adding 1.0 gives 6.3125.
> +	 * 6.3125 in 4.4 format is b01100101 which is equal to 101.
> +	 * Also 85 + 16 = 101.
> +	 */
> +	crtc_state->hw.casf_params.strength =
> +		 min(crtc_state->uapi.sharpness_strength, 0xEF) + 0x10;
> +
> +	intel_casf_size_compute(crtc_state);
> +
> +	intel_casf_scaler_compute_config(crtc_state);
> +
>   	return 0;
>   }
>   
> @@ -174,3 +262,11 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
>   					      filter_coeff[i]);
>   	}
>   }
> +
> +void intel_casf_disable(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +
> +	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), 0);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 6ab30af9d959..26c7f31a8085 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -9,6 +9,8 @@
>   #include <linux/types.h>
>   
>   struct intel_crtc_state;
> +struct intel_atomic_state;
> +struct intel_crtc;
>   
>   void intel_casf_enable(struct intel_crtc_state *crtc_state);
>   void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
> @@ -16,7 +18,7 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
>   bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
>   void intel_filter_lut_load(struct intel_crtc *crtc,
>   			   const struct intel_crtc_state *crtc_state);
> -bool intel_casf_strength_changed(struct intel_crtc_state *new_crtc_state,
> -				 const struct intel_crtc_state *old_crtc_state);
> +void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
> +void intel_casf_disable(const struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> index 0b3fcdb22c0c..f02d01a7a9f1 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -15,5 +15,27 @@
>   #define MANTISSA_MASK			REG_GENMASK(11, 3)
>   #define MANTISSA(x)			REG_FIELD_PREP(MANTISSA_MASK, (x))
>   
> +#define _SHARPNESS_CTL_A		0x682B0
> +#define _SHARPNESS_CTL_B		0x68AB0
> +#define SHARPNESS_CTL(pipe)		_MMIO_PIPE(pipe, _SHARPNESS_CTL_A, _SHARPNESS_CTL_B)
> +#define   FILTER_EN			REG_BIT(31)
> +#define   FILTER_STRENGTH_MASK		REG_GENMASK(15, 8)
> +#define   FILTER_STRENGTH(x)		REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
> +#define   FILTER_SIZE_MASK		REG_GENMASK(1, 0)
> +#define   SHARPNESS_FILTER_SIZE_3X3	REG_FIELD_PREP(FILTER_SIZE_MASK, 0)
> +#define   SHARPNESS_FILTER_SIZE_5X5	REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
> +#define   SHARPNESS_FILTER_SIZE_7X7	REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
> +
> +#define _SHRPLUT_DATA_A			0x682B8
> +#define _SHRPLUT_DATA_B			0x68AB8
> +#define SHRPLUT_DATA(pipe)		_MMIO_PIPE(pipe, _SHRPLUT_DATA_A, _SHRPLUT_DATA_B)
> +
> +#define _SHRPLUT_INDEX_A		0x682B4
> +#define _SHRPLUT_INDEX_B		0x68AB4
> +#define SHRPLUT_INDEX(pipe)		_MMIO_PIPE(pipe, _SHRPLUT_INDEX_A, _SHRPLUT_INDEX_B)
> +#define   INDEX_AUTO_INCR		REG_BIT(10)
> +#define   INDEX_VALUE_MASK		REG_GENMASK(4, 0)
> +#define   INDEX_VALUE(x)		REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
> +
>   #endif /* __INTEL_CASF_REGS__ */
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 599ddce96371..99f0fbd14c4f 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -372,6 +372,11 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>   
>   	intel_vdsc_state_dump(&p, 0, pipe_config);
>   
> +	if (HAS_CASF(i915)) {
> +		drm_printf(&p, "sharpness strength : %d\n",  pipe_config->hw.casf_params.strength);
> +		drm_printf(&p, "sharpness tap size : %d\n",  pipe_config->hw.casf_params.win_size);

Add all these in one line and include the enable bit too. This should be 
a separate patch.


> +	}
> +
>   dump_planes:
>   	if (!state)
>   		return;
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 0fe710e13ac1..cf807e0931ea 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4405,6 +4405,10 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
>   		return ret;
>   	}
>   
> +	ret = intel_casf_compute_config(crtc_state);

Doesnt seem to be part of this patch.

This patch should be only about adding sharpness registers and bits and 
functions to set these.


Regards,

Ankit

> +	if (ret)
> +		return ret;
> +
>   	if (DISPLAY_VER(dev_priv) >= 9) {
>   		if (intel_crtc_needs_modeset(crtc_state) ||
>   		    intel_crtc_needs_fastset(crtc_state) ||
