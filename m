Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C97ABEBDCD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 23:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B3210E1B9;
	Fri, 17 Oct 2025 21:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j+1RPfgq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013042.outbound.protection.outlook.com
 [40.93.196.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EF410E1B9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 21:56:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQwua1gbI7Ci0/WEqD4o9vFGZpyAEeCdSRCrnrJKBPykPQ++Ejoh4ebBrUjXD/qvCbBqzSNpNj5Wo5uD+IZ1eWunmMElKIfOmH5imiSQWYygB77u9kxfj+bmZuyr7vsLxV5ExTZnRDFIEzZ6Am/VUBz17Mmrkqs64J5AlJnPBVcXUjj8DVr/Nz1Wc+Z8FIAorpfJtbvor0BzPeMlbrTfq/5Dv9hnd79daZbSHupeX7HAq5cucfJB7sE3QQC4QDzlE1oEIljW9yVHMbW1NLCi4wL2DoqieHWvWoaa4+gtBkPuTa+mKRGRO9fnnwDDCFZ2WmK2s/ebYRNYmT9Y+jOtAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNhOPatChHlzzo8evDgUJIM03G5OeXvAQfFMOXON6yY=;
 b=lwAPDH4PJvN8HSNpUjqJXFCMz6tDn81fgAsG6W4rHXBuXlpG7clj+O8OSrYVjMpd3JYnsIHavaOYoHTDCbTRqkt1KijIdV3gZ5FcYgqPz7MIl04zOBDtlBa8YJ/PHRGzUl6O0PXWS92s3UPZ3LKkYryiLJSYOMtkRhxOGfjEfQIuYSzESjm0QqcKE6fazU9RbjFKtAviE0shDIbGwJpQS6nLMg4y78rk7E5XqP2MeC8ZL3USx8egTydqOV+hr+tkq8hwxSG4/1A6W6PRpIame3I9AfqjQnOHX98IxTDSR54vCBXJSsCRptVX92zcYIirzmkOGLc20qwYc4qPWMasww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNhOPatChHlzzo8evDgUJIM03G5OeXvAQfFMOXON6yY=;
 b=j+1RPfgqRedPHbwuDsR1tZutsi+EhNiFvU+8hqfE89XiIT7nRwRD8hkytW4KX4o9Luz7q3y81Y7IO41Qeo5nNFzPQTNLmbj0lWGdmEOs44O+XHQi6lN9MtGKrh6ZnxAs+dsqtGexYPFUqWrXubK0n07UYfIXxCFe6dTYeL9eWbXfozN35o9QC+X4CZGV7MfoE57ab2WrsbpStWi87u39seBg2WjnZ/4S2EBjWirLOGd/ca79YQRLt/a24XOkCX/DmHiH1tJHitpvAIplsZQaZ8qbq1Zmv8GFo1QEkJTfdUm3iSKsd50ZgtUu0ITRWIr53nPoeQdEEuA23hUK9SfZnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Fri, 17 Oct
 2025 21:56:43 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 21:56:42 +0000
Message-ID: <c9f28d0c-6b06-47a2-884d-7533f7b49c45@nvidia.com>
Date: Sat, 18 Oct 2025 08:56:34 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: KVM/s390x regression
To: David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Liam.Howlett@oracle.com, airlied@gmail.com, akpm@linux-foundation.org,
 apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com,
 byungchul@sk.com, dakr@kernel.org, dev.jain@arm.com,
 dri-devel@lists.freedesktop.org, francois.dugast@intel.com,
 gourry@gourry.net, joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 matthew.brost@intel.com, mpenttil@redhat.com, npache@redhat.com,
 osalvador@suse.de, rakie.kim@sk.com, rcampbell@nvidia.com,
 ryan.roberts@arm.com, simona@ffwll.ch, ying.huang@linux.alibaba.com,
 ziy@nvidia.com, kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-next@vger.kernel.org
References: <20251001065707.920170-4-balbirs@nvidia.com>
 <20251017144924.10034-1-borntraeger@linux.ibm.com>
 <9beff9d6-47c7-4a65-b320-43efd1e12687@redhat.com>
 <c67386be-5278-411d-97e7-43fc34bf7c98@linux.ibm.com>
 <8c778cd0-5608-4852-9840-4d98828d7b33@redhat.com>
 <74272098-cfb7-424b-a55e-55e94f04524e@linux.ibm.com>
 <84349344-b127-41f6-99f1-10f907c2bd07@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <84349344-b127-41f6-99f1-10f907c2bd07@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0104.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::45) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA1PR12MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ffb006-65a9-455d-e737-08de0dc80eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ti9PYXA2V2NTUUg4aGdtQ3lsZUZodnhNSXZsQ2tUSWdtVU1QV3R2Tnc2MnNW?=
 =?utf-8?B?QmJZOEFsZzdhd21tcDJxdEtCNExtVzJ1eVNGWXArbFpDQytJSlQ1Qi95MXRo?=
 =?utf-8?B?U3FKTDFDKzA3b3F1cFZ2d0svMVhsdFRXeE9zeFFiYWVKRE1kYWNTbUNDN1Bq?=
 =?utf-8?B?SkVpdW52MFVWR0xvR2hzYWFVR3VVSEUvT1JWL0wxNi9GQUNKb1NPdGV5S3gr?=
 =?utf-8?B?WlExMGQrS2NVVkJvOXZzcnVyOXEzZUxZQU9RUnl1ejVwdnpoeFpLVG1sZjNh?=
 =?utf-8?B?SHh0ZFJEWStxKzJoK1QzVVZUVkNsNjdRdkswbmU1RUl4YVZ0ZkNhK25jR1Js?=
 =?utf-8?B?MXY2Mm96Q0pwQjFiVFZLTDJRWHVTaSs5dENXRlF2YnoreHNQcUU0T1VtaUN1?=
 =?utf-8?B?SFNGNTZ5K2NPa1RBdzdDcVd0dzN2ZEsxTlJPUytFaTBGY3c5a2Ztb0MrbmE5?=
 =?utf-8?B?S1lReWtnNG1yTm1OR0VrdWQxVzRQNW8yK0NkbGtTNDJOZXZTY2xVenhQWUNq?=
 =?utf-8?B?OG5BYWo3bWtXd1cvbVFjckU3YzZaWlljVG40RnZkbjBqRXU1dXh6ZkV2UWJC?=
 =?utf-8?B?QVA0SndJbk1SRmlHeXhsZ0ZtWW4rWjYzZmF5Q1hMb2NIV3RmOHQ2Um1zV0k2?=
 =?utf-8?B?em1TYXVZZXU3OWhVNVVWdllnbDFMd29sK1AxNFJyM2NBRElKeDNLTU4rSHM2?=
 =?utf-8?B?bWNGSGQvMFI1VHRGekdpbDhMV2lGVmM2NHQ3azlTZzErWjhaSjFCaXo5NG5u?=
 =?utf-8?B?ZWhDQWVmTVlLRklOaytJQXlHV3k1WHZJRWxaYUJXL0R1ZEMyclVzWmF0b1JQ?=
 =?utf-8?B?dEo2K1Q1OVV0cDUrcUdHYS81R3orTGJHNXpxdEtVK2pkSGVLVEJJMkg4SDB6?=
 =?utf-8?B?MVRzNVZQUExIcUgxcTZLV2Jzc0pabnlvVG53dkV3dVh0bDEvUlQrY3dNK25P?=
 =?utf-8?B?cUtzR0M3RE8rR21UQUQyNk90OWQwR0xGZDl6dVB6YXlZSTFURENzNnZLaTli?=
 =?utf-8?B?Y0dTeGxERDF3T1RIM2FYT3BFYkVTWjdSVFVsMXdkK2Y0c2pXZWoxTWFDRnR6?=
 =?utf-8?B?UEZ2Y3BIQ2R6aU9wdWJCbS9kd2dyZSt1VTVTdW1PdmVXeXg0dzBhd1lPdkE5?=
 =?utf-8?B?Z2YzRTZ0TThIY1VFNmY0YUw4Qmk1bnNvNVpTN0NDbm9hOW5HT0hmMm5IQysw?=
 =?utf-8?B?Q2pKdU5lK0ZiWkZZT05HTmlOQW0xWmhlSGtwOG12SkVya2VSQWs2MFdCUEVD?=
 =?utf-8?B?Q0RJaW13dkx1ZVhQVTcxV0RheVdhM3ZsNjkyYTc3c2tIKzk4MGRjUjJ2cGQ0?=
 =?utf-8?B?bHcxdExjNkMwOWdYbUpoU1lhM1RPakdIV05Tb3hReUhocHhuY2FodWd5L1pI?=
 =?utf-8?B?ako3aWM3RU9GN1Y3bm5oZ2NnWm1aTmVTSGN1cWdjbmE0Qk5Ha3dldGFWc2o1?=
 =?utf-8?B?dndRcFN0cE42WUt1M2ZqVE1ZUHB3dXgzZ21kRUtlSW9KVDZnYkdRbW82V0gv?=
 =?utf-8?B?ZUZ4VWRHVHI1VHlIUUE5SURCZXVjRjRaNFhiRDFMUXVRZDJ4cmpYUGhJYldS?=
 =?utf-8?B?bG9KYThmaXRqeTZCeGFXRTFCU2pZNGZzK0dBZS92eDZla0JCSzkrRmVpeGNJ?=
 =?utf-8?B?UlU3MjdUQXkwSStrMUxQNHllNTdhQkVwa2hyd2pjQTRScVU3VGlSbWlUbU45?=
 =?utf-8?B?V3RMa0JFaFBiQWtKRVdPY0JiU3JKcU9NaXdQbUEzdHQxeHFIU2Z5WTlpdENw?=
 =?utf-8?B?bjlEWVg3M04vSy9PY1A0ZDVORWtPd1pnMmFWeGxacDl2N3Vqd0lWcW9kN0Mv?=
 =?utf-8?B?a3RJaEV1TzR3V2tLdEQ3cFhVODNLaFViSzE1Q3lXcGRrYk1iK1UxRE4raHZt?=
 =?utf-8?B?TTl2QU8zaXRlaTYwZnIzSXF5Z1FxdS9TbWUxZGo1bjk0eGZLVld5YmVCd01Q?=
 =?utf-8?Q?zpdU9Wafzo6liVS1Q1qlr/i2D2rLIclX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXhlbWR0M3ZCbWVibFNyR3FLQXhUdkxRVUJVSXowTUd2R0QzdkR6Q3p6OW85?=
 =?utf-8?B?eWNhbWF6NU1ta1haQi8wWmw1V05icUhkUkxEVUZ4dmpoc2IxQmdXa1NBVk5w?=
 =?utf-8?B?RmZlOEdzRkllem9iam9hRFgxMFBOTmxxU1I0T3ZOamVid2MwbCtGanV3djFK?=
 =?utf-8?B?NmFEQm5zUzZqNFRFdzN0UDJWaXB2ODFWcm9xUkNCU044MjJSRWdsQzVBQnFh?=
 =?utf-8?B?UE1oTzlzclFvUVdzck9pbWNQYmdXcEQxSDM1YjM4SzY3TXVSVWgyaG5pa08z?=
 =?utf-8?B?TW5JVTNWZEROQ2Jtem4rMXFKS2Z5VU1vL1cwa2NCS2hDMS8zb0RQZ2pXUHU1?=
 =?utf-8?B?TGZLeERBb3c1TmtuTTRseXAwWFVBRGZ0cWd5OEM3S0w0dTgwMTRCcVdLNFVU?=
 =?utf-8?B?VVVUdmJhdzZpVkJyOGM3YzUzWHFTYmxQVzc4TS9DWk84MHo3c0FTS1N1Vm5t?=
 =?utf-8?B?bmhlTFp0OFM5VVNPR1dMODZtd2lmRW01VVNkL0kwd1pZaW5Td3IxK0U1VXdH?=
 =?utf-8?B?WW1RSUZHcXJHUGxnSk9CRnZ5VjhxZDFwNUIvTFVYNTljejV3Q3BrbklLZXZ6?=
 =?utf-8?B?QzgxUU9sYTF2TVFRKy9RT3pmVmFpdjVQV3RTZXhYQjYwT1h1czNzRjZnYkk2?=
 =?utf-8?B?SW8wZ05lY0FSNmtudlhTQXQ2SDJFRmcweW9iN2dSSUV6RzRQenhmUmx0K3ZO?=
 =?utf-8?B?UWhzbUxaelB6b1J4MS9adTN0SWJzMExEVXhrN0xlNS9wdXRsL2JBcVg4Vkl3?=
 =?utf-8?B?ZHlyR01KSFZnaWJPazIzbUpudTdWa3dXOXhYN3IwcnF2WUI2TUR4ZklhaTh5?=
 =?utf-8?B?SURsOENmNjR0d3ZFWWVjRjUzRTVqNnN2UmMvbDRmZVY0M1hFMHdXK3h5TUl3?=
 =?utf-8?B?SWxlRTRXTjVBWjBNQXMvdDBzelpyT2pJOHJOTWE2RURxN1dTVG1sNy9NMndp?=
 =?utf-8?B?OHorSm55VmdYUUpXN1htVVNDOFc5RFRRd29oT0xxczhUc2NGUXVtNkgrZG5K?=
 =?utf-8?B?L0IvQU5aQm9PcnI2VXJZa3RsSkhqMlRGcWJ2azU1Skg1d2JNTXN3VTUrQlNL?=
 =?utf-8?B?L2FVcGY1QWwrbXNjUFZIR3dkT25ScE95cVdJSk5rUUZTNUw3Wndha0ZtY1Nh?=
 =?utf-8?B?ampwS25oUXBIODBMdWNwUVlBWWtYVVJxMGM1OHBLN3dLYmpOQWNvOEhDNXdJ?=
 =?utf-8?B?aWJ3QkZMV2dOVGFiL0hNUmkxSHBUTUN2OVRPU2tYWjlwK3FhMFQ0S25USGJv?=
 =?utf-8?B?M1ZGODhETFN3VUdCSlgyOTVTSGxOQXF6RWx2dk5PWmEvK1VZT3VoUnlXVU1i?=
 =?utf-8?B?dkZuYkhQNHE2aFBaNU1qZ3pJMzZYL3B2MFRKRUVmdGdBZVBncEN3VnFLUXNC?=
 =?utf-8?B?c1liMjBjUmJCdXJDVlB3VGxid28rRStsQlNxS3padWhaalhXWm14ZjJ2a3Js?=
 =?utf-8?B?aG5pSFZNdXBoRkViM01uYXBKMURGck1qWnVsdGZJKzk1d2pvT25SUUhOMUlt?=
 =?utf-8?B?Z0ZlS3dOclV2WnhtdGhBSkQ4THlsZ0RicDVNZFNZbmVrakZZSkdwbkxic1Za?=
 =?utf-8?B?SUQyVzcwTUJXSU5FWFBaUTZsbTRhUi9Xby9SSUR5Rk4rU1QrQWJGMnRDK0t2?=
 =?utf-8?B?L0k4VnFMNk1FTVlQcjRKeWJkU0UvKzg4NnY0TEdLeGxGTEhIcjZqai9QSjU5?=
 =?utf-8?B?YWhkZTFtSUdETkVGZkN3NG5TMDRCZnNNWkFIN0t1QzBGM3FTbEFRUVZXdWlp?=
 =?utf-8?B?UFN4K3pmQm55MUVOTTJabFNUT1lIbFVxRGllRzR0NjBiNXJndXZwT0VHTFM5?=
 =?utf-8?B?alZXTkNwcEZSVnZaY2ZvQWhSN0o5MS9qY2tsU2gwTmEwZ0JxeU4rVjFQRHBu?=
 =?utf-8?B?dzc2RTBnR29EYnFaM0h4NnAyZElIdER2VTlJVUNINFpWUWNkQ3RjQTNWbGtr?=
 =?utf-8?B?TVdDZFk3Ym5hdWNxQnlFV1NIWUYxRTZOb0ZGNUNxSERPWnoxLzBENFVKL255?=
 =?utf-8?B?dWx0Q0Y2WldSeG1SYUZXc3BKMEtmMkw1M1VZWmJlODlhVzJSVURvTFFDcTBO?=
 =?utf-8?B?eThLcUdESG94WmZQamtVMnlQWVdsTzNDZkE1MVhYQkR1VU9aVDZxUXZNMFdv?=
 =?utf-8?B?Vk45d0NlaEZEWDZ3R25OTFJjNnFtVnBCQ3RLVVJMTG5KdTB2SXIrL3V1bTho?=
 =?utf-8?Q?q0NG4+2PA6C8JghmQ2f5ok+KK4q4Eex4mM5b9bjICPKS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ffb006-65a9-455d-e737-08de0dc80eb7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 21:56:42.6403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ad5Jm5E6ST1NRNPuPYWgsi6Ppwi7ZWTQRBaD+0NGvNYhVEfctxnT7UcpCdLRnGYJm0482g3mge3Eb3Zu/7u6sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8743
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

On 10/18/25 04:07, David Hildenbrand wrote:
> On 17.10.25 17:20, Christian Borntraeger wrote:
>>
>>
>> Am 17.10.25 um 17:07 schrieb David Hildenbrand:
>>> On 17.10.25 17:01, Christian Borntraeger wrote:
>>>> Am 17.10.25 um 16:54 schrieb David Hildenbrand:
>>>>> On 17.10.25 16:49, Christian Borntraeger wrote:
>>>>>> This patch triggers a regression for s390x kvm as qemu guests can no longer start
>>>>>>
>>>>>> error: kvm run failed Cannot allocate memory
>>>>>> PSW=mask 0000000180000000 addr 000000007fd00600
>>>>>> R00=0000000000000000 R01=0000000000000000 R02=0000000000000000 R03=0000000000000000
>>>>>> R04=0000000000000000 R05=0000000000000000 R06=0000000000000000 R07=0000000000000000
>>>>>> R08=0000000000000000 R09=0000000000000000 R10=0000000000000000 R11=0000000000000000
>>>>>> R12=0000000000000000 R13=0000000000000000 R14=0000000000000000 R15=0000000000000000
>>>>>> C00=00000000000000e0 C01=0000000000000000 C02=0000000000000000 C03=0000000000000000
>>>>>> C04=0000000000000000 C05=0000000000000000 C06=0000000000000000 C07=0000000000000000
>>>>>> C08=0000000000000000 C09=0000000000000000 C10=0000000000000000 C11=0000000000000000
>>>>>> C12=0000000000000000 C13=0000000000000000 C14=00000000c2000000 C15=0000000000000000
>>>>>>
>>>>>> KVM on s390x does not use THP so far, will investigate. Does anyone have a quick idea?
>>>>>
>>>>> Only when running KVM guests and apart from that everything else seems to be fine?
>>>>
>>>> We have other weirdness in linux-next but in different areas. Could that somehow be
>>>> related to use disabling THP for the kvm address space?
>>>
>>> Not sure ... it's a bit weird. I mean, when KVM disables THPs we essentially just remap everything to be mapped by PTEs. So there shouldn't be any PMDs in that whole process.
>>>
>>> Remapping a file THP (shmem) implies zapping the THP completely.
>>>
>>>
>>> I assume in your kernel config has CONFIG_ZONE_DEVICE and CONFIG_ARCH_ENABLE_THP_MIGRATION set, right?
>>
>> yes.
>>
>>>
>>> I'd rule out copy_huge_pmd(), zap_huge_pmd() a well.
>>>
>>>
>>> What happens if you revert the change in mm/pgtable-generic.c?
>>
>> That partial revert seems to fix the issue
>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>> index 0c847cdf4fd3..567e2d084071 100644
>> --- a/mm/pgtable-generic.c
>> +++ b/mm/pgtable-generic.c
>> @@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>>              if (pmdvalp)
>>                   *pmdvalp = pmdval;
>> -       if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
>> +       if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
> 
> Okay, but that means that effectively we stumble over a PMD entry that is not a migration entry but still non-present.
> 
> And I would expect that it's a page table, because otherwise the change
> wouldn't make a difference.
> 
> And the weird thing is that this only triggers sometimes, because if
> it would always trigger nothing would ever work.
> 
> Is there some weird scenario where s390x might set a left page table mapped in a PMD to non-present?
> 

Good point

> Staring at the definition of pmd_present() on s390x it's really just
> 
>     return (pmd_val(pmd) & _SEGMENT_ENTRY_PRESENT) != 0;
> 
> 
> Maybe this is happening in the gmap code only and not actually in the core-mm code?
> 


I am not an s390 expert, but just looking at the code

So the check on s390 effectively

segment_entry/present = false or segment_entry_empty/invalid = true

Given that the revert works, the check changes to

segment_entry/present = false or pmd_migration_entry (PAGE_INVALID | PAGE_PROTECT)

So it isn't the first check of segment_entry/present = false

sounds like for s390 we would want __pte_offset_map to allow mappings with
segment_entry_empty/invalid entries?

Any chance we can get the stack trace and a dump of the PMD entry when the issue occurs?

In the meanwhile, does this fix/workaround work?

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 0c847cdf4fd3..31c1754d5bd4 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 
 	if (pmdvalp)
 		*pmdvalp = pmdval;
-	if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
+	if (unlikely(pmd_none(pmdval) || is_pmd_non_present_folio_entry(pmdval)))
 		goto nomap;
 	if (unlikely(pmd_trans_huge(pmdval)))
 		goto nomap;



Thanks David and Christian!

Balbir
