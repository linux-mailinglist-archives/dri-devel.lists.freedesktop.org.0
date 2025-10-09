Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E15BC756B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 06:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FB910E90D;
	Thu,  9 Oct 2025 04:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDxzYKqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09A710E1C0;
 Thu,  9 Oct 2025 04:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759982432; x=1791518432;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uzsvPrvFWxgVFCTV+lPJhHJpMH71CRZrEmZOpbFTGu0=;
 b=WDxzYKqdnYT/BHnapZLmvl2aaKk+R5Zl9b5SCblSJyb5BR98tOtFCVKJ
 8hCfKEYSmHywoRURe9Nl+MBz9KW1UtYzc7oYsQKX7zkr6c5DZQuVZWcFg
 XkdwVUzU1KWAA1I4BXxr0BhG7+t2qMNNe2HQoXrQxk6fxYot5Md5/+JgC
 MJEyqOVf9ptmt1SmdYoqTKOqonOpYlkYo22KTrKf2sSFuv4R9zR1Us0g+
 LTNbhnw3TkRhfRuiOAPLSKSmtAlQ6AsmjMQ0JztPb50CDqLtbqA8hnVS+
 HzKAPo23T9Eeg1ldrG/JeCl7kBQzyrCyMuvpAqGK8xv/Zr7vhUNIy3bL/ w==;
X-CSE-ConnectionGUID: UplUHYGqT0WrTV+5R2/4wg==
X-CSE-MsgGUID: orv1whdgTCy+2G0asalLug==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73290770"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="73290770"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 21:00:32 -0700
X-CSE-ConnectionGUID: wCk/euFpRsOGgW0llmSLmQ==
X-CSE-MsgGUID: Sg+8AIZTT8SA83W5NRYGwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="181018818"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 21:00:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 21:00:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 21:00:31 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 21:00:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euMlA9S7UJrnKrfPMG44oKhF7YoUOXH8i8550apHuKsCqdRKfjYKkWx05RrSdYOwMnnzHGN5p36/CRUBxpmG2leDh6mcNAjPGn2xmVd5PXQ8RQjIIEUeRN4s1IXNswB+oLS0Mtur2d9Nnb//iuDu96N56UdvF+pnv8SmREm/jHLF99GrVUF+DP5g9RXZOhFWK+yh/QTGNnT9h8Hs5/rHR6oVkPcrEWw8p79rXvUuO/RX4VfqFsuoBQ8VcPjh5ovVR1TpxIMu1WgFhXnru3ujVcq/Jf6aCS3woZCc/UFYhXjr5j/WTcO2xJRpgaYsA4F5S2MeZNGJbJNPVCQlJwMHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kd4S3box9U3K7Ql/ABEGIbzNyJXD3wWngZtqRNvb7Ss=;
 b=uslk1Ya89Na755jzt90BUGNCneid9Ve5Uc/o1ZSoZtnuz5tH/qopSjQQA9A1aVCiVqoJyNY46KbDSvpQEDjQkaBzQA5ajHhvAyCEx29M5DkAUT7YdzmXXJQrpPQzfxRcgm8mdt7ldvxD/xWMspScqPanldD7tyY1ScsgaRIVn9Ek+hAA+ltefUVsgANQfzDmWmcinW77xvUZrILA7Mjwz69aDtz1e6Jmvea7SpErawOXFhN+EZHgK2UPMFKlU74VZsU57Xca5u+EY3tjYaPfzavUtZJP/CcD3Fs/Y6G965tRYMdb3KQCdWvfFzdd/lEUFD0X7QA42eIJD5e5wJo3uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 04:00:29 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 04:00:28 +0000
Message-ID: <b3849b27-a93e-4821-8b0e-2a32bbdcbde7@intel.com>
Date: Thu, 9 Oct 2025 09:30:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/atomic: Return user readable error in
 atomic_ioctl
To: Louis Chauvet <louis.chauvet@bootlin.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, <xaver.hugl@kde.org>, <harry.wentland@amd.com>,
 <uma.shankar@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20250916-atomic-v5-0-821525cfbf25@intel.com>
 <20250916-atomic-v5-4-821525cfbf25@intel.com>
 <75d34fe4-a820-4a2c-a73d-b4ce8e8e872f@bootlin.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <75d34fe4-a820-4a2c-a73d-b4ce8e8e872f@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::7) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DS7PR11MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 4353f95b-250f-4d5c-3086-08de06e86195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODhzUE1MdGRWVnZvUGEydmI5QTNZREdLbGtIVEQzcVU5Y0F6NS9rSmpIS2xx?=
 =?utf-8?B?Mm9kQmxFUktSWUhJSGJVR21peUlDRWVKZmplR2N3UjBpSTVzeW5qaEdqM200?=
 =?utf-8?B?UmYrMEN1Qlh4MzAyY0tNOHR1WkZEOE52aXVybkxoMVcwWmNvdldlUEEvdExp?=
 =?utf-8?B?Qyt6clNWVTEvK0U5SzFJMUZXR0lqbVJkcU16eFVXNEZDODQvZTlxZ3hOWW9K?=
 =?utf-8?B?SHkybTJBMSs0ZGF4Qmo1YU9XUjNLcEZXVXB2bTQ0WEYwWEgxOE5UWDlReGps?=
 =?utf-8?B?bHZjZDQyQzlTSkhOeTJpdjMvWnRMOVU5UlNjMnlVQklqWHo5L0hBVlEvMXlG?=
 =?utf-8?B?UkJPRWxvWC9CV1RtNE8xRG5nNUExbXJzZGE0amNHc0pZMGJHa2VnQTlvN2hl?=
 =?utf-8?B?YWpUQlBwc1k2T205NXRWSGI5UWUrMlNkNFk2V2NlaEJKaUk2VUZOa3hFbWlF?=
 =?utf-8?B?YjI1VzlvVGJaT1RjOTlJRlcxRG9IenpEWi9jLzY3K08xMFZPQ0cvd05tVXc2?=
 =?utf-8?B?TXo1cTZKVzdCQ3NjZ0ZvNjFoM2lFeTNlNStpM1BvOE55VHl4aGgzUWpFai91?=
 =?utf-8?B?NEV3a0VZcVlEdnlhUHFYd3BnZitwK3VKU3F3dFdHMDBRSStxWXNIOTg0clQ0?=
 =?utf-8?B?ZXdjV0FXeTJsTVJLZTVVY0liOGZrZXZEOW1pYkV3R3VZMTNmYk82YlBBdjhU?=
 =?utf-8?B?dG53QW5zVjEwSVNSOTgxdUw3N29wZ1haMWloQ0JRQTJoQnJ1eVhYeTgxMjYy?=
 =?utf-8?B?bitlWTRVcUVIT0JIVXppbGRZQ1c2S0JOU2VCQm4vdWZJUUtBOXBSWlhuTXFX?=
 =?utf-8?B?empCZmhyZFRTRUp2VlkreUp5cGc1RVlKVWxrTG5od0tZUzNtZWJRTVpyNDE3?=
 =?utf-8?B?ZGV4MEU2czBIL2VveEhYTFNMK01xK1dYRlZ6MkNxL0taSitSN2N0MXAxZUcx?=
 =?utf-8?B?eEpPcVp2SWlrNVNkSWMzbXI5QXppUk5qa1hFdENvSnBmQ1UvT1A4aTdnMS8x?=
 =?utf-8?B?eWhUVFJNTHhsekJDQlljQzBlYmUxRVAxK3FveWlLQkw4OWlNVXZNZlRPenRM?=
 =?utf-8?B?RjRaL1lGUHhzVmxnZlZaYkNHWG04QmZqR2dnNkxTMzlrRU5BVHJudVNJZzRu?=
 =?utf-8?B?ZkZwK3RkMkdTcUQxN3FtNjZ6RzBIaVd4YU55ZW1KTjQwMmxwMmtia0V6cmVh?=
 =?utf-8?B?bGh3dk9QeUJVLytXOWM3eE9BbVBReXpodDZsZVNoLy94TzlpRkVsNjNFNFFN?=
 =?utf-8?B?MXZLVDl5VzQxQWJuK2FCOTVqSlRvS0hSQUhVOVR1dzM5OTMyd2NjNWNzRmxG?=
 =?utf-8?B?cDVnSUpROEpOdUxJZHk0Zy9nZjZkZ0o1SkV6c1lJRmVXbnY2aDdJdWRsUVFR?=
 =?utf-8?B?RlpIY1owcndLSW1SYzVFcnBUOE82dnJEOCthdmt2SEdQRlp2djlWd2lmZEdD?=
 =?utf-8?B?T2hNRXRmNHVHeGc0N29QSitGM0V2NkFwdjVPbXA1Vm1aeDRjQ1hJQlE1TERu?=
 =?utf-8?B?TkFLZkE5MS95VnVlZU8vWjFVbTA0OEl1a0J5YW5CVHBOQ1dGUmVNWWlFU3pD?=
 =?utf-8?B?UkRNckIvSGg3THNKNUNlYzd3ZUZHRDRURzlqZDZXR2ZxNnVROEZCQ2Y4ci81?=
 =?utf-8?B?bzNXSlV6aklUVzM4MmczTEpiVFpCTWhHYmN2L0FaYTFjRndGRmI4R3lGM0xD?=
 =?utf-8?B?V1hLWFI1ODhaV0ZQUGYyVzRzd0RWUExlZitKcHBlV2RiVEFOZ1RkQ3hpUFFB?=
 =?utf-8?B?NXlFZVVHcmo3VjZ4bTdxT2YvQnpNWEVObjNGd3N6SytYT0M1emJ5K3NhVjdS?=
 =?utf-8?B?aGYrMzBhMWtWU2tLaUhnQjgyQ0dsbXhUcE1iSzBhcFduZmdxNHVUejRXVjZP?=
 =?utf-8?B?WkJCMFliUDBjUmMxNWVpVEFqWXF1cGYrRzVXOUM0WGo4UDhDWjZEaVptTkF3?=
 =?utf-8?B?NUMxZ2tMWWZuK284V084bFU0VnR1TGdnSTdJTjMwU2ZlcGV3eGFqaVlkbFBS?=
 =?utf-8?Q?nYQXMTXgnRMuLuR2hK7WCm0YCDgBrw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWwySVZ3NXhibWFUN2VaazNvYXBrUnpZMWRWQXFkN3pESFhlNlF1Mks5VC96?=
 =?utf-8?B?NjJlOHNnaWlqemwwMHgxb29VZ01zZWh6OW9VMkJmZzZsaUJQNFA1SEhNRnFV?=
 =?utf-8?B?Myt2VVhGbnlld0FvOGRTK3FISDVVVEo1RjlGM2NYbWVJSkhFaW55RUllVVVv?=
 =?utf-8?B?bmZEWXpkVXgvSHJ1U240ZkU4Vkw3YjJWdWdZMzhJbXNtV0s0TTBSYkhodC9I?=
 =?utf-8?B?MDYvVE1YS1Z4UFptNnE5ZStQVVo3c0xzTERqVkEzMUUwWWFvZXJIOXpJMjVH?=
 =?utf-8?B?SmQranpjd3VXU0E5UEQ0QUh2MElqKy8wU1oxYTZQTUZYaGNJQ2NPR1ZrRVRs?=
 =?utf-8?B?bFg5VEQ4NkMzQjR0OGVXRFhVL1lsZkY3VDR0UTRKTTZMQlpydFZpek5GYlZ2?=
 =?utf-8?B?ejRNNEhCb2xLNWw2MjFMdWFmeUFRMVkrUVBNSnFCK093enZQNXVIaGxyZkZT?=
 =?utf-8?B?aSt6OFBjMlVRbFk1Qyt2V0s5YTA4T0lYRUtPMGtyYVBZeWxTMUNDNnNQWXFq?=
 =?utf-8?B?UUZCdm1kWlZDV0p3QjRuQlM5NWt6OTV2K3lMTmpXdnVkTThwOXhRTnlhcWYy?=
 =?utf-8?B?WVZFc2lUMEhaVjd2Uk12VlVGajNFZzdrVGhWSVpJMG13UU9abGgzbmJ3TXMr?=
 =?utf-8?B?UUs2Znl4cVorWTFabW15UnJaK3RuTUZLNnNBeFZIM1B1WFppWlo1SWtCODc2?=
 =?utf-8?B?TjdDYVJLNUNwVkorY1lhR0h5MzJLYmpuYTVZcE5HdzhTYTlJYlZqY0JPUldr?=
 =?utf-8?B?THQwM3Nlbnhlc25YMEx4ZldQN1pBVEhSNnpQYzNhYVcwWFg1Q2gwZnpIMjk4?=
 =?utf-8?B?MzFsd2JIak1zZU1oS0VaUTBCNTFwbEI5dy9LUXAwaDBxQkZJRmtPL01TNnNk?=
 =?utf-8?B?ZGI4eFZWdEJJNXpBVUJsR3JycE1aNkEyY2dGdndyRTVETUhUeXBDNnhqWU0r?=
 =?utf-8?B?MGNKTVpmR2FWYk1OOXRXaldZbUVXK3JNZHljVFUxSFZrZFhxNWhNNzA2MU1h?=
 =?utf-8?B?ZmZWTmVLWjhKczl5WjBONHIrelNDRXZaNlhJejh5RjBhVXhoc0svWk9nK3pQ?=
 =?utf-8?B?TnhYMDhKaUI4NWVVeXhMSHVoOE9BUXc4Y04wOFBCNjVpWE1uVjRtSC90Z0hO?=
 =?utf-8?B?K1J0aExqeUIvbU5PQmEzM2VJNjQxdW5NbklIaFZDUXZHOGJjdS9oeHUva09n?=
 =?utf-8?B?bzNUWmdpWGs5enZ6RFZNM3h5L3ZMUDNRS1BnTTA4aWxBaWRuYmh5MVpLOE1v?=
 =?utf-8?B?VE1xK1lQaStieGRhZ2c3WnBsL25pZExNRG5JQnVKYmgrOTBIbUE3RW9weGxt?=
 =?utf-8?B?bGtrYmVWUEd6a1EveHVqMnVPai9mNTJ1S1I3T3E3Z2Q0RnNQc3BqSnB1N1BY?=
 =?utf-8?B?WXhGV1Fub2YweDJxcnl3UHRYQkhTOWdDNUFNY1RlbHpxQ0N2UU4vTERtbFlp?=
 =?utf-8?B?eTFPWHFZbVlFOFU5N0lmRUZ0MXN4S3hKbkhTWDRZSUFVM3c4VUpzOUFXeS9x?=
 =?utf-8?B?VWp2bDM3b2huK05NZGNUcXRDMTJGUUFMckVCMjNkbTZIWFFqZUZOYTBjanJU?=
 =?utf-8?B?VEJ6MmRVekJyR3pvb1hJRlVmdGduQjNObkhydEY4emJGZ1lFVTJMQXc5eUVp?=
 =?utf-8?B?UmRNQnRJN2VyRElhZ081RUVHY1gzMnFWWmZCZlg0Z25weStFUWN2M3AyUUM5?=
 =?utf-8?B?c2haZTU3R3NUb2JIb3RpSiszYVpmOEp2ZVFSK1Q4bEUwRXZhdjBORkZ4NVZa?=
 =?utf-8?B?Um8rSGhIcVRXVm0wdnpBT3dUUTRYbmJaUkJzbktFWnJCNmx2Y2ZNRlRDSnEw?=
 =?utf-8?B?eEgwVGJ3ZmYrRnZVcGZxUTJoeWlib0pPVnVhSVZueGlQQzZvVnhsSmE2WHkr?=
 =?utf-8?B?SzRVck1WQ0FTVzNGdHBEZWMxSWRsNi9vVWMrSmI4RTVzMXVnTTBjdTNMZEVn?=
 =?utf-8?B?cGduaitucHJ1VEUyYll6c1U0MEY5aXZBV1lCMkxlU05ydmZ6QnViLy82WTV0?=
 =?utf-8?B?SENpTTVQM1JMS0czVUo1ZUI2dDczTmI3NzhxWnZxV094NVdxTGIxMjc1enlM?=
 =?utf-8?B?VWJqMGdHc1hTVVJCem9tY2pqLzlENUJ6QUhLVllkdVorQloxbFp5SmJLRGpz?=
 =?utf-8?B?SkxpelB5b3k1SUlzYTRwWlF3dXVBWjFWMTBZOURwdFlRdVkvZXc0enRWYmN3?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4353f95b-250f-4d5c-3086-08de06e86195
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 04:00:27.9757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfSAjs4JKl8zT6SVfSDr8zQ4KO2crJ+VFWQnwcCzGtUnTeZIKDHxwHZR/PTJdhPk5lFgDeYW7qmTUBZMEDC19g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
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

On 01-10-2025 20:17, Louis Chauvet wrote:
>
>
> Le 16/09/2025 à 09:18, Arun R Murthy a écrit :
>> Add user readable error codes for failure cases in drm_atomic_ioctl() so
>> that user can decode the error code and take corrective measurements.
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c | 71 
>> ++++++++++++++++++++++++++++-----------
>>   1 file changed, 52 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
>> b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 
>> 3ef478e717bec917d1b8803c72bbcc8d6409d745..3d4e9709e8e289cf302413e171b1336812d65c1c 
>> 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -1036,6 +1036,11 @@ int drm_atomic_set_property(struct 
>> drm_atomic_state *state,
>>               ret = drm_atomic_connector_get_property(connector, 
>> connector_state,
>>                                   prop, &old_val);
>>               ret = drm_atomic_check_prop_changes(ret, old_val, 
>> prop_value, prop);
>> +            if (ret) {
>> + drm_mode_atomic_add_error_msg(&state->error_code,
>> + DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
>> +                                  "property change not allowed in 
>> async flip");
>> +            }
>>               break;
>>           }
>>   @@ -1058,6 +1063,11 @@ int drm_atomic_set_property(struct 
>> drm_atomic_state *state,
>>               ret = drm_atomic_crtc_get_property(crtc, crtc_state,
>>                                  prop, &old_val);
>>               ret = drm_atomic_check_prop_changes(ret, old_val, 
>> prop_value, prop);
>> +            if (ret) {
>> + drm_mode_atomic_add_error_msg(&state->error_code,
>> + DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
>> +                                  "property change not allowed in 
>> async flip");
>> +            }
>>               break;
>>           }
>>   @@ -1096,9 +1106,10 @@ int drm_atomic_set_property(struct 
>> drm_atomic_state *state,
>>                       ret = plane_funcs->atomic_async_check(plane, 
>> state, true);
>>                     if (ret) {
>> -                    drm_dbg_atomic(prop->dev,
>> -                               "[PLANE:%d:%s] does not support async 
>> flips\n",
>> -                               obj->id, plane->name);
>> + drm_mode_atomic_add_error_msg(&state->error_code,
>> + DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
>> +                                      "[PLANE:%d:%s] does not 
>> support async flip",
>> +                                      obj->id, plane->name);
>>                       break;
>
> Thanks for this series, it is a nice contribution!
>
> I am not sure about this change, drm_dbg will be in debug logs, but 
> drm_mode_atomic_add_error_msg do a drm_err, is it expected?
> This is also the case for other drm_mode_atomic_add_error_msg calls in 
> this patch and the next one.
>
Thanks for pointing out, this was a miss from my side.
Will get it changed to debug prints.

Thanks and Regards,
Arun R Murthy
-------------------

>>                   }
>>               }
>> @@ -1393,6 +1404,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>       struct drm_atomic_state *state;
>>       struct drm_modeset_acquire_ctx ctx;
>>       struct drm_out_fence_state *fence_state;
>> +    struct drm_mode_atomic_err_code __user *error_code_ptr;
>>       int ret = 0;
>>       unsigned int i, j, num_fences = 0;
>>       bool async_flip = false;
>> @@ -1401,6 +1413,14 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>       if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>>           return -EOPNOTSUPP;
>>   +    if (!arg->reserved)
>> +        drm_dbg_atomic(dev,
>> +                   "memory not allocated for drm_atomic error 
>> reporting\n");
>> +    else
>> +        /* update the error code if any error to allow user handling 
>> it */
>> +        error_code_ptr = (struct drm_mode_atomic_err_code __user *)
>> +                 (unsigned long)arg->reserved;
>> +
>>       state = drm_atomic_state_alloc(dev);
>>       if (!state)
>>           return -ENOMEM;
>> @@ -1409,31 +1429,35 @@ int drm_mode_atomic_ioctl(struct drm_device 
>> *dev,
>>       state->acquire_ctx = &ctx;
>>       state->allow_modeset = !!(arg->flags & 
>> DRM_MODE_ATOMIC_ALLOW_MODESET);
>>   +    memset(&state->error_code, 0, sizeof(struct 
>> drm_mode_atomic_err_code));
>> +
>>       /* disallow for userspace that has not enabled atomic cap (even
>>        * though this may be a bit overkill, since legacy userspace
>>        * wouldn't know how to call this ioctl)
>>        */
>>       if (!file_priv->atomic) {
>> -        drm_dbg_atomic(dev,
>> -                   "commit failed: atomic cap not enabled\n");
>> -        return -EINVAL;
>> + drm_mode_atomic_add_error_msg(&state->error_code,
>> +                          DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +                          "DRM_ATOMIC capability not enabled");
>> +        ret = -EINVAL;
>> +        goto out;
>>       }
>>         if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
>> -        drm_dbg_atomic(dev, "commit failed: invalid flag\n");
>> -        return -EINVAL;
>> -    }
>> -
>> -    if (arg->reserved) {
>> -        drm_dbg_atomic(dev, "commit failed: reserved field set\n");
>> -        return -EINVAL;
>> + drm_mode_atomic_add_error_msg(&state->error_code,
>> +                          DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +                          "invalid flag");
>> +        ret = -EINVAL;
>> +        goto out;
>>       }
>>         if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
>>           if (!dev->mode_config.async_page_flip) {
>> -            drm_dbg_atomic(dev,
>> -                       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not 
>> supported\n");
>> -            return -EINVAL;
>> + drm_mode_atomic_add_error_msg(&state->error_code,
>> + DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +                              "DRM_MODE_PAGE_FLIP_ASYNC not 
>> supported with ATOMIC ioctl");
>> +            ret = -EINVAL;
>> +            goto out;
>>           }
>>             async_flip = true;
>> @@ -1442,9 +1466,11 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>       /* can't test and expect an event at the same time. */
>>       if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
>>               (arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
>> -        drm_dbg_atomic(dev,
>> -                   "commit failed: page-flip event requested with 
>> test-only commit\n");
>> -        return -EINVAL;
>> + drm_mode_atomic_add_error_msg(&state->error_code,
>> +                          DRM_MODE_ATOMIC_INVALID_API_USAGE,
>> +                          "page-flip event requested with test-only 
>> commit");
>> +        ret = -EINVAL;
>> +        goto out;
>>       }
>>     retry:
>> @@ -1543,6 +1569,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>       }
>>     out:
>> +    /* update the error code if any error to allow user handling it */
>> +    if (ret < 0 && arg->reserved) {
>> +        if (copy_to_user(error_code_ptr, &state->error_code,
>> +                 sizeof(state->error_code)))
>> +            return -EFAULT;
>> +    }
>> +
>>       if (num_fences)
>>           complete_signaling(dev, state, fence_state, num_fences, !ret);
>>
>
