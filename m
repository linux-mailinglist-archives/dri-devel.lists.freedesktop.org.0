Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JwWHHUwe2n2CAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:03:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22256AE5E7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E469110E325;
	Thu, 29 Jan 2026 10:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YivpEV1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013001.outbound.protection.outlook.com
 [40.93.201.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6D410E127;
 Thu, 29 Jan 2026 10:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SY6FVJg/NLpHz455Va+tLjLobgRI+UzArKBGKtmcHd6WK3lWbDgiql1/XT1H2wDUMt243Q1Mk4sbztqI8fLOeZ0E6Xt68kyWkmllX75Fxq3WGlrkNywIRPkMjxGejkOYwvLFcHutMOw/OaR5csgFlPybfluPuyNaUL4x1qw23QiyRiR7qBt+4ep7n6FWujofwlr5o5pgWTCdWqBzdq7oDfXVR+35QAiOKUClaj42pd63vReKQNX16iNbtq84ohJWMfa4BIkSZBQwN3rTE4LoN6nwIiGx9fI+NoejmPT8RARpHnfW1G2gUkRf5uJkA6l3qrGhkDgzGXzQEMgPJH9d0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFr4wSePKfqAg91cwo0fkb2HOejOin1IvmA83or2MNk=;
 b=qwih5ZsyQhCBJOqu3TkUrrzE00RMlapddz8qpRLSK4Z0pBus7xDIOFx3VI/0lscpf5+21dv/ti7jIaUzNVIQNyNy7jWcNU4iZJJ/XSsDaeP5lFEoYCHFvXhk3Owzxmxu3kiIuQPoE+TYglBgwnqoJu8f9s1Fx9hu+UnZvrfH9UIQuc/l9fXrFmy+ehjne3NypuBIeoIo09rfDxEd2roK0ZxzHtvmPG8iMcBpyU8GqhsIxaajuVOyD0Gg5yDUuwT8cCtese4mt1ot3N/tT+OlCGDauPWJu2hoSHVEQ9LCj0ULCV086CxS0iXe2cfsk+JNKi4a6lFr/dGectzXNd4nlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFr4wSePKfqAg91cwo0fkb2HOejOin1IvmA83or2MNk=;
 b=YivpEV1ERO4zo8VNFr78/8lVyGyZjSllfEoQ/pVt3Bhy/H5tt84tLh6ucptdAJMwVafYfTjEqahmtv72U5KPZVybNnQmNset03SZ0J4qamNpeLiTRN2UNgJPDlFdcINXng3Cq6X7i8wstUENbWlUtlcIUf+rWADy8yXhmmgZ8U8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by MW4PR12MB6974.namprd12.prod.outlook.com (2603:10b6:303:207::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 10:03:25 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 10:03:25 +0000
Message-ID: <b814cdb3-ce83-4db1-b512-c69cc54bda4c@amd.com>
Date: Thu, 29 Jan 2026 15:33:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Use kvfree instead of kfree in
 amdgpu_gmc_get_nps_memranges()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Zilin Guan <zilin@seu.edu.cn>, alexander.deucher@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, Hawking.Zhang@amd.com,
 Prike.Liang@amd.com, le.ma@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn
References: <20260129090542.907623-1-zilin@seu.edu.cn>
 <031ae8a1-5608-4993-91c2-c5945bd6f7ad@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <031ae8a1-5608-4993-91c2-c5945bd6f7ad@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0084.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::17) To SA0PR12MB7091.namprd12.prod.outlook.com
 (2603:10b6:806:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|MW4PR12MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 0079f275-6f74-4ddd-2839-08de5f1da47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlFRVXJqcStCM0VSU3JTSGZGWTExQXVBQlV0MW1BUUJBRHM5dmNqcTh4WlZa?=
 =?utf-8?B?b3VCWmZWWkNZV3BDRGR4TTFBOWtnazdjUVF5bHN2Y2dmZXVQWkZVUTlKYjVi?=
 =?utf-8?B?NWN5Ymg3am9kc1ZVeDFHRTBnTkdRYlJNZzNvcy9nTEJnLzlvcXVJZ2pyQlI2?=
 =?utf-8?B?YURDeEUzRDRxelJBRDVTZGJ2R2tYYklIT2poMlJnSXlmVmgzNWI2czd1eXV6?=
 =?utf-8?B?VGxQSmZrRm9HWW1pbU1pbWw1MkhvNVgxOEQxNWNQdWQrS0o2blVvV29JdTM0?=
 =?utf-8?B?aDNPRGRZODhMUS96RDJ3d0FhVmxhMXdDSnVIUUkwR0Q3dm9DckEzb1dnUFl0?=
 =?utf-8?B?VENJc2NFYnJHemtBRm1reGFxU3E0eW02ejdNUEdtNTNmcXhFVnNTZUdKbmVP?=
 =?utf-8?B?cVk2aUVSRFpsWkJHbER4TENISlhLa2Z6TVpzYndYZlEzQjQyN1pnQ0xVekZV?=
 =?utf-8?B?VXdzSkRteFhZbFBUc2hXT0pBMVQxS1htSUJwRisydWZqRGpQTGdNZnhEVU5k?=
 =?utf-8?B?UVlENVRkV215RE9wZlU1WDFWczNzRUNTN3Y4S0djVHRNcnFJQysxQVJQRXdI?=
 =?utf-8?B?QlpSR1RPV1JFdDdtSkZES242eHJuLzJ2RGJTcUJ6ZnZjYkVibTVnOEFEalM1?=
 =?utf-8?B?YVJVRThkZ2cyTmt5S01aOFN6VTNicW1wQUV3WG9YTEszUG01Tkk2UXJWQm8z?=
 =?utf-8?B?OVZrdXdITlpzTHBwdzZQZHZhOFhYTmJkNThud1Y3RE9wY1l5ZElyUXRna1hV?=
 =?utf-8?B?YisvSUdGdHdpYTRzNkx5MUh1cVdYQ2tsM2FQMitEdG90YjVraDJ1M3REcFo1?=
 =?utf-8?B?NmhMTi9aOW5pemI0NU0vYi92bFNGbUlGUVJlZXBCbmVteTBNUGdOVFRxeHJN?=
 =?utf-8?B?akh2TkhtSXQ0SnpuVUdLTnFKcThxQkowNUp4aXFMMVJIME1EQXVKNHNDbjVE?=
 =?utf-8?B?aEJRcXQ3UWVxVnFHUW9yY1VWcFY3RnYxa2NuUGpqUGwrSW11c2Y3b01XV3Vz?=
 =?utf-8?B?ZC9RYWpvZi9JYmg2eldLOUpoK1psZEJlWTlmTHk3eFNDbmQ4Nkh0eUJUaWJu?=
 =?utf-8?B?RG04M2JLYURSd2VmdnFXWGhZQVRjSlFxQ0U2NlVpanVlNmw5Y0hTc0szRnNB?=
 =?utf-8?B?SjV6YzdUYmFrdXBtTFNZYVIyL2E0VlVod0xMbWJiTndDMjBNNk9qV05Ga1lm?=
 =?utf-8?B?OW85QkFWeW1XZzZzS1FmV0hMdGtXQ3Z0THJkNnJBSTZjOFNqYnBVU0k1RG9o?=
 =?utf-8?B?MjRMQU5GWmxvZnI4SWZnVU1hSEd6Zmg3aXJGeURhQWZWQS9Ec21XcmhqTjkv?=
 =?utf-8?B?Zk4rNm1DbmF0b1BybVdTL2dKSkJ0bGVobE4wQktZcnFoUmprQ2IxT3lKRzJ2?=
 =?utf-8?B?R2VzTDU1LzV6UGxMd2FKbGEzRUtxZDd1emY4YVZ0QUVta28xV0pyZ2hzR0ZO?=
 =?utf-8?B?MUFERWhBYkoyU2VSNThhY1RIUm04TGMrc3lKOUJFNGxubTFlSGdLa25sdGpI?=
 =?utf-8?B?TEg1QTZyWWlOa01XUlVKbjAxTVBnUmsxUGRUNG1XWitSRkg0bzFkSUIrc3kx?=
 =?utf-8?B?NllFSVNZd3h3SWVBTTB5Z1JQRFQxaW1yN3BBSU0rTTNBc3hGbmJTbWU4dTZI?=
 =?utf-8?B?cUgyOVB5dU5kYzJKYkhBdGgzMTRiNnJIRTFPSUl3b04ralRwcU1pM1QvWXBX?=
 =?utf-8?B?MFBCdVJIZHlRY1R5dzJXOEIyTzdYbHNyczRPRklVc0g5c2p0ZzVzckh6Tk9S?=
 =?utf-8?B?aFp3WVlnd0FtZi9WTDM5T1hZN1E0bmpEZThvMFZ0WVdKeUhjNDZyc1g4RXZO?=
 =?utf-8?B?aFdWQndrbWk0dDV2YUk5ZmpydlRYdmhtTFh5TEFLMjNsY3NnNzBaSTl5RFht?=
 =?utf-8?B?RFRlWWVJN09hTU9mN0dzdzVpL1dVVWFKMmN4NFNBb0R2K1RoenJhelAzenR0?=
 =?utf-8?B?ZEVFY0hDZUxzSUxMOElybGs3bHUveXBkU2MwUXJZNERBU01HTTJ6KzFMUkNv?=
 =?utf-8?B?Zjd1ZWdPNklQTU9sVjAyWUphbUxxZUcrcmhHUlhBL3ozU0YxeEM2Y1JOZitT?=
 =?utf-8?B?ZlBrUXVlQWg0aGN3b3A2a3VFMXpBdi9LcHgyZVpEclFKL1RQdG1lS20wK2ZB?=
 =?utf-8?Q?9V08=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0pKZ01DaVhsU3hhd1BDb2xacENBM0hCbHA5WU1Ta0tUN2RlS3RLWkM5RWZM?=
 =?utf-8?B?akZzeVlGSVg0UmU2MTVybjl2Y3VEUnl0QWZEM1dKdzM1MWlpTVhmVFlES2M4?=
 =?utf-8?B?Ykk3cXZRZW9pU2xQTlFtUDRieE15RitWek5kSlJGckZFbHdyQUdacE1GMTNV?=
 =?utf-8?B?bS82ZEpmZmFQbXZjL05lei9kdzN2TW5mZFhBOHFISFdmZmFvT1d2eEpxYmlp?=
 =?utf-8?B?bGp3b3Nha0Voa0haT1hRUExYUW5ZVllicEtlSDJ6cWhpZzBXWlNITDQyaWp2?=
 =?utf-8?B?NnhWcnNwdEhFQjZibG5RbDZKQjVZaGZ0cFFNUVhIcGdMalFRTnh0clc2VEln?=
 =?utf-8?B?TzVFWWlJNW1YRTkreEZJK092VTZkRWFYR3hBRENER0hWdm5iWDRQb3RtRkl1?=
 =?utf-8?B?bFMzKzkzRnBnVlFSSnBXRDk1U2o0WCtiZEtramI2R2FMTURscHZmTXdzdkVl?=
 =?utf-8?B?N0VheHFnM0Vnc2h1Qmt5SStaSkFVUDJaYWVUTWU4OGFTYWxIb2ZTVFBNNGh1?=
 =?utf-8?B?ZlplQVJ0R2xJQ09hWlBxZENVRWxUK1h6Um1qczFmY2txcXI0M0dnUnpPWU02?=
 =?utf-8?B?bTR1UExnZUpaWkk4aFhsaVJwc2h4dXE2cUxuTTEwZXFSZ2JoQlYvY2NnQ2hx?=
 =?utf-8?B?TE9vSDM5R2lMZ0gxSXZvTHlubExqWld0dmtFcFVhU2kydmIwdlI1MXpncVBU?=
 =?utf-8?B?ZHE4NGJZSFQzOURUclIrS2tKRW4rRjFoa1kyWk1EeGh5am1EWEdIWXNVZEZ5?=
 =?utf-8?B?SFF2Uk40NUhTK3FSVk5HOU4raDV3RFpKMW1qZzd1UG8xWkNKR29jeGFpUFZj?=
 =?utf-8?B?cXZqYmFSbDE2RnVjbjVLZmVqdk8rQ2YyclptSWEyOVRSZUdJVlgyVFlUazFF?=
 =?utf-8?B?RTVONWxiNy84MWdyN2NZM2NXOENhbjhtZkJ6UnBtbGlQNFpQSHBMbHVjeFZD?=
 =?utf-8?B?dENJbUsxYXRyVE5TSHpuRCtDQXowV3RrbXJKbVU4Z1k5ZW9xejRJRUNzT28z?=
 =?utf-8?B?VlQ5MHJmRklWcDFjaUdweEtCdm80VllHQXZiOThDRzc5ajlzdXE4dXY3Mm41?=
 =?utf-8?B?bDMxaFZZL0lmOXpNcTFUZkp3MC85U2RjNkJBRWNPVzltWGpKOGJrUmM4cGc4?=
 =?utf-8?B?c01nbDVwQURKOFU0NE9XWlYxRUVRMHJmZWpiRVB4cEJxaEJhb3FXT3RNMEtP?=
 =?utf-8?B?bWZZYTFzWEZUTUh1N01DS3ZDK2hva2JoT1JaOFJnTHJXd0lwU2hRVWN2RDFV?=
 =?utf-8?B?REZON0ladjU4WmpQZFd3VDQ2TVA5OUc4NnUzUFJGU2E3RnlXQ3FXa1NBemNQ?=
 =?utf-8?B?NWV0WGFBTmpXQUpiZ0V4d2FEaElYOEQ0OHVMTjZwNDBjNG5hT0cyelFBUXNs?=
 =?utf-8?B?aE5UdENHWXdSeE1qYmZqUGhNSlpMVTRSWjZjVEk4RmEyY1V2M1dXNlRFWjVC?=
 =?utf-8?B?REJIV0l1TFFxNmFDQWJldGtOUm5xZnlnR0o1a1ZyREFiUFQ4VlNsVUFZMy9X?=
 =?utf-8?B?WERSdDZsdnF0WFVGRFI3Y1gvTGgvQU9xazdpSmRaMTc4R2JLU1ozNmVwVytM?=
 =?utf-8?B?cVpNZnRWekRkWTNZTGoxL0M1UngxOUtFa0FiNm5Pdi9XVXM5Mzdyd2d3ZEF1?=
 =?utf-8?B?WUU1b0p6SkovbDc5WXJPN1lXNG1mcmFCUnppV1FITXcwYWlsbWN4U2Fva2xV?=
 =?utf-8?B?V0FsOStNOEhlcUtPUUFxRTRLWEtNMlBrNHc1ZWtCd25YcmdmRmVFQ0NNZWJU?=
 =?utf-8?B?QjJLd2JyRzNaTG42RnJ1RFBSVjBnK3BxZEVWOTMzVHJuQTd3aEJkand0Y1Bt?=
 =?utf-8?B?a1JBUlo3S3pmNU81dkMzU1FNdk9XR1g4OXFNRW9idnhBNmpCODhOcHl2UUFu?=
 =?utf-8?B?Vlh6Q3ZUWFc5VkhnQmR3ZlkybWVIMm1xdUhEZzNOM0RiM2N0Sm5Fam8zdGR0?=
 =?utf-8?B?WEJrb1dRQnRYbGN0dHE4QStkME1GUDVFZllUU1R6NXYwQUJRUytFSUhtVW13?=
 =?utf-8?B?dTV5aGM0QWViR3dJV2RhbEJFbWZuZG1pdXh3Uk52WFVFbWw3Ukp6Wll0cWF5?=
 =?utf-8?B?Y00rRUlWM0EwcG5nNCtOczBybTN3SmRkZjE5bDdYdTZyRjZOeFlrNmcyTGQ1?=
 =?utf-8?B?dGwvVEZCcktPRVlSZGlYY2E1QVJzTFF1MVZqUVA5ZklnM2k2eGN5eFhvdit0?=
 =?utf-8?B?dU5Td1ZFZHp5TWZTWGF2dmtjb2J1MGZ0WklnZitWTlR6MjhDY3o4OTFOV1cz?=
 =?utf-8?B?N1M4YllDNXZ1MldQOEVvRVI4QjAwZnllM0VVWHlyK0poOCtrS1g0YWFybXJQ?=
 =?utf-8?B?bXF4N2ZKUnBuejJSZFUxakZhaUdDVnEyWlVEeVdHbmljT2NYcngzdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0079f275-6f74-4ddd-2839-08de5f1da47b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB7091.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:03:25.5971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgYw9wacFNKhLBItZs0GO9TMB/agFGX+weALsVNjKIVv6XYzjYmBc6oB3kznbILo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6974
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,amd.com,lists.freedesktop.org,vger.kernel.org,seu.edu.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[lijo.lazar@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:email,amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 22256AE5E7
X-Rspamd-Action: no action



On 29-Jan-26 3:00 PM, Christian König wrote:
> On 1/29/26 10:05, Zilin Guan wrote:
>> amdgpu_discovery_get_nps_info() internally allocates memory for ranges
>> using kvcalloc(), which may use vmalloc() for large allocation. Using
>> kfree() to release vmalloc memory will lead to a memory corruption.
>>
>> Use kvfree() to safely handle both kmalloc and vmalloc allocations.
>>
>> Compile tested only. Issue found using a prototype static analysis tool
>> and code review.
>>
>> Fixes: b194d21b9bcc ("drm/amdgpu: Use NPS ranges from discovery table")
>> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> 
> Good catch!
> 
> But i think we rather need to question why amdgpu_discovery_get_nps_info() is using kvcalloc()? I have strong doubts that we need vmalloc() here.
> 

Yes, vmalloc is enough. That change can be made separately or modified 
along with this.

As for this as a standalone change -
	Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo


> Regards,
> Christian.
> 
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> index 7e623f91f2d7..cb0d1ac148e9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> @@ -1382,7 +1382,7 @@ int amdgpu_gmc_get_nps_memranges(struct amdgpu_device *adev,
>>   	if (!*exp_ranges)
>>   		*exp_ranges = range_cnt;
>>   err:
>> -	kfree(ranges);
>> +	kvfree(ranges);
>>   
>>   	return ret;
>>   }
> 

