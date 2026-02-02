Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KClQMcIZgWm0EAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:40:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D556FD1B32
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5A810E3AE;
	Mon,  2 Feb 2026 21:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CUzmvxPh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5762310E3AE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 21:40:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0JNAT03tv7UEYd4hdd4cHJvuk2l3DJD8DKZShXDmUgqsgakW8ddwIm4TCk4QUTqBESSfL5SzTG96VfuLZvrydck7lBz5G9d+Z9UoTeNnlPJj3Rqaf+GbICP1NYyPOwt/9CCa5ChXz1Z4S89y+jakwbuqrTcoirOuFJXfMBBpbMbAyeFP8Euxm7ZBxaTgwjMQdrsC+racQ7GBhOZ0vKy/Blmpc/KzRHiDJzsD//mWoI+GEwmXM5XeOsgFqT65sqGb9FoCDowU1EMq/m0h0IMMd8Nj99HoNKSZ8bBZDD0BUu7Q5Ys3piatI6etCNjcqPePGWPvSHaCDGDFSEAN8Ql3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzE3+YDBRYMGuKhrPODAOe76O6As6SPvCFrVTu21iYM=;
 b=J7l3cL4q2rU/cy3DCwzBNfBQW15dizQ0PvfP3Ylf4V4eojjgLmmTMvQquk91VW5hY633g4xWTFOMsARTPh29WfRINd6N6Apemo0tlekqVHCwFGKAiHc20eFTthzQNH6LsjlbeF5AGs/GqlfxC7Mwpce1mzuGDNUAZ86X0fIeCS+BHguYSyTgGy/jMR3BEuAIcbIlL1Jirnj2Yj6Fz573iKUqB2WG3CVdKH4SHuBnEdyMg6eUUcQgLh2KiXYGl8hqyIEnWmk+rSvMdDhrxtlAhSDHUcdmeI/2tJtrBG86y7VPC01T8OkmmWma9nps7wN/BX+RRh4qYDZ+cAYzjqPBpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzE3+YDBRYMGuKhrPODAOe76O6As6SPvCFrVTu21iYM=;
 b=CUzmvxPh0yz783Sb30BEt05T/OtG8P4wBDLCbeBqYrYnFFI/ARFpWReU6PNhevbQXjWVaGz/yibw60lFHyN3lLbVqznN8yMZfQykX+ya8PNxU/roWsZIAGhTwRlsMcjaPZMAFDFO/cH3hKqGoIouCL/vMOWATwr3Iy16hQ+7/gM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 21:40:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 21:40:09 +0000
Message-ID: <fc6e4b08-27c7-42f4-bb3d-731aad19987f@amd.com>
Date: Mon, 2 Feb 2026 15:40:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Replace platform name strings
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260202212529.2681307-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260202212529.2681307-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:806:21::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e72b5db-a288-4425-f240-08de62a3a35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUhMR1RWK2ZUUkhDaTNkbjRIWUl1d1lFMXgwZmt0ZWdtc1dQUm1FZ2N2NG9Y?=
 =?utf-8?B?OEtuQUdVdWZ2dHpVMENUYVN1M0xuTFRnWXh6RG0rOFY1YW1CenlMVEZnQTFS?=
 =?utf-8?B?UXlZQUQ3L1BUbng5YzlQMTQyVjlCSlNxZVBZWlVPLzMzTG0wM2VzWkRSZE9n?=
 =?utf-8?B?M3dDQ0JPblB3WFdtT0M2bnRsV1Z2KzFmQW5TWkZaWkZ2ZVhzbkYyMjVwci9E?=
 =?utf-8?B?eVVQbDAvTGM2UVA1RTF5bGlYWll2RGVxUjRvdzVlL0EwY3d3SkJhVER0OGpw?=
 =?utf-8?B?aDh3TzFMemtyc0ZWbWFjcXB4MHA4NUZwcERjcytLZlNKVnhzTDlMWWtIWmZ2?=
 =?utf-8?B?TGRVejVxeVB1cERHWFNPcllqV012d3dqVG9GeHBXL0ZGeXJKNkpKck9zU3Bz?=
 =?utf-8?B?ellrWGtPcXIvN256ZnJZZFpBNFVEUXN4MUJIUEExZ1BvRFZRV3oyVnYydTh4?=
 =?utf-8?B?cFRKVWhrS2pvbFVuVkh3OUxWTlJXdWlKTU9XeGlXM1RzRWV4T1BDa21zc3Q0?=
 =?utf-8?B?NXkxNDJGNTdwZlBRSEJQVEdpL1RwSEROOW9QSkpoZC9FRUVEdUp2ZGRFaTQ5?=
 =?utf-8?B?S2xuWStJWlJiQThWaGNrdDNqTmMxT3FuN0tyMjNuSytjaHErWXVqeDdpQi9F?=
 =?utf-8?B?NEpzbEVrZ25IQzJLL0M5NmdQaVBDalZHY3Z6RHprdXBhOUJUN2Z5QnN6ejZZ?=
 =?utf-8?B?bEN3TUQ1dkxFN2dES1ZNUERSWkVJZXhTcGFIMkV5OGN5K0VPaDZCQzVUTThQ?=
 =?utf-8?B?NnRNREczRElWTWdhN1NkY1lpeGVVeGtOR2N5T1A2VGMzRnJsYkJKbHJDdXhQ?=
 =?utf-8?B?b2o2OFpudTRoVkx1U0RSM2NxVWpSQm1qZGUycUF3VFdHaWdIK2Z6TlJYRklh?=
 =?utf-8?B?WkN0SWRjWEk0Z2pVWklqZ1h0M3plQzhnT3Fsam9ka3JDRDVkc2hiMUtaQmRM?=
 =?utf-8?B?VnBsY2xnWC9zcXFpMS9panc5YWtZNHhLRkNwZXhFL01wVnFGRkFkZzJ2WmRB?=
 =?utf-8?B?cnhOWlcrUG9vUHAzRUQzR0NSWFJXR0FlUHRJazF6bU1TTzdtUVoyME1aMUpi?=
 =?utf-8?B?azZwcUhCa3ZlSDlFdzEraWxyYzkwOTZNY3NBdFBPeU9qa3FOOHZTRFh5MVFy?=
 =?utf-8?B?VUNkMU0wcGx5TE5KaG0vWGU4RkFDNlNEcVRjOE9GNDVQejZIb01EMlRtcURC?=
 =?utf-8?B?MjBVSS9oSE9rSExJMkhLOUI4T0hDVCtuK1dDeGtqU3hpZ3RPWXJHWDIvSEs3?=
 =?utf-8?B?d25xTDBQZUp3SVdMek5XcHQvU3RTUUp0czFGd1JvQXlsaU91NXo3TlFaSSs5?=
 =?utf-8?B?aUgvYUpCM093amlKRzdJeHVGaWFRMnhqcUdKU0pCUVFZRVdDWHMvTmVlSXo5?=
 =?utf-8?B?QWdqclU3Zzh6WjlGUXU2YXVmQ1U4YVBIbHAzQ05ZTjRQajh0MWNYYlBvTEZU?=
 =?utf-8?B?dWtRLzhOb3dUMkUwK21BRE1SZEJ5RnBNT3JSTytDV2FvWjFiRm82cHBEeDdn?=
 =?utf-8?B?ZG9LTTRyYWVJaTQzY1lyT2ZiWTZaaGJRUkhJOW5KY3dMWFNjV0NQR1ZtdWpF?=
 =?utf-8?B?ME5vMDlzY0xGdkhnSFRLQ3Nxa1ZabGtJNXk3cUxTRG54cWF0ODgvb3c1cTNl?=
 =?utf-8?B?MjZWZDNiS3pkMk0zSmVtMkN6SElmWEJXc0oyaDNLK0oxT3Q0bmVkWHJadTB1?=
 =?utf-8?B?NFd0ZHA0Y3BVek1CRDZoN0ZZT09lMUViMkhQTnhDYmZaK2c1cm9VUTN3RTZn?=
 =?utf-8?B?NExXS3RmSXVHR3FSRTRKUnZ3akVUdjArbTlNaEN4K2VnTkkvbVBtYWYwRWE1?=
 =?utf-8?B?cFBxR2J2aVRvWHJzMzJoM1hDellCbG5CYnRUaVRVMTVrYUZBRVJVNDk4UjNF?=
 =?utf-8?B?WnZhaEVBbEhtbm4vbmdhS0dVdlJvRnk0UmxGWUhRaXp0NkZzZlh6cDhXNVBr?=
 =?utf-8?B?cEYwL1EvL0ZPd0VwYzJRblJvaU5rU2R4OHJ3YkJNaDF3U2NUWU1XUGp6cTlx?=
 =?utf-8?B?cWZMeVRudG5iS3NncjAvNkw5OVFtdzhlcjRJaGJVTU1yQWl3QktOdWhYbno1?=
 =?utf-8?B?dzNqSFVDOTh1WnJpc21yM01ZVURiYVdtL2FqVXMzRUNSdjVtNFphbUFncnEw?=
 =?utf-8?Q?e46M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEdUTDNLOTZBU3hzaytnTGE4c202Z2tYQVBSbldjYmU4QVk2cm5EdWZDQ0JI?=
 =?utf-8?B?dEtSWk9mOGd5bW1tTWZsZHptaEY2NG5mWDRzN3NQdVFqUkk3V1RhZDBFcjRK?=
 =?utf-8?B?b1NVK2QzajQ4cEJyeWRVT01zQjFVS0ozZXl0WGE5QklhdGtrNGttcUpIYVdG?=
 =?utf-8?B?ZHY2dTdJZ1FGV3F1U25FQnFpNlBuaEFGT3NLL2pJTU5ZTVNTTVZaRWlRRWZB?=
 =?utf-8?B?dGNtUW1VUVlZTkJFUGZraG8rWEJTb213bmJtNFdNVG5sUmxGbGhTbTNUZWgw?=
 =?utf-8?B?VUJaWlIwTFp1ak1Wb3UyYnY2YkU2S3FDU1RPQnk5bzR5QkUwSlR5dUl1Nlc4?=
 =?utf-8?B?MUlTMS9yWW1NaU9JMTRSdUhJMGRZd1ROdDNjSW8yTUUzZmxLdmVnMytlRTVk?=
 =?utf-8?B?dE4zZEtYTTNWTUl2bUlYbHE5YTFFVkZuZDVSMHlqNi8ycUYyNWxJNHg4eVR4?=
 =?utf-8?B?dXBaNCtoVXNKL1lBNlpkTzdMK0Q5M1ZKbEhUZ0FJQjFKSThqR1hMVWU0V3pG?=
 =?utf-8?B?TGxOcVdqZmpUc2pNa2tka3NKSkFhcVlPQi9rdEcybHdCcVQzb0c1TWllSEFE?=
 =?utf-8?B?V2ZERjh5dElPcy95SitGd2pVS1dWV2tBRDdUdWVKaklrOTNBRjNNWTdqamNj?=
 =?utf-8?B?aWllbFh1MVcySU90VWFkeXFNZE1uUnh5bHpLSE9TR3I2Y1VtRTBxZTdDWjhq?=
 =?utf-8?B?UlB5N2RWRlFhRWR6QXA0aExWQ3hUc1lBTUJlY0p4Yk9NRWRQWEhDcFFGdUl2?=
 =?utf-8?B?a1o4VG90c2hxM0hkZUNQLzRQd1hOeUIwK1JzWlpVYkgrNW1XMS9iNFQ4ZEtE?=
 =?utf-8?B?YXFiMGNYVTZqUmxLNVJ3MzBPWlFCWVVPVEo2YndKbHIrQXkrZW1YL0VOUUNk?=
 =?utf-8?B?ME1uSHJScXA1L1FCcHNGNnhRakZENk9LKzJWSU81Yis3M3hMM3A5TERXUFQ3?=
 =?utf-8?B?UmF5K2QxN0tieG1aUmhGZ0V0UWRwajdHRmZxaHJoTlJVR1NETERLYXRzQ1hk?=
 =?utf-8?B?WnZuU0dxcDYzUmZsUWc3SStuMFp1QS9oa21Ob3RNTm9QQzlPS0REdm1QVE1W?=
 =?utf-8?B?cys2YUNJNmhjckdQVjN4VjVKdm40OFgwRkFYU0lEY0JPYWxCQkUxYTAzK3RM?=
 =?utf-8?B?a01BSkRMblRadGI4L2ZlUlpSSmRPb3lmcVo1TjUzSXE2dTR5MURmSHdtQmFD?=
 =?utf-8?B?K3NmcXc3cDZKcldlR0lZcDJZaHpXTE84OFRaZ0U0bkpwNWt0WWhSYWVQM05U?=
 =?utf-8?B?MVVSV09oSlJqZWdlYS9uV0hwMXgyKzFrTThiM2xLOHY2cVJFbWovMTBJK1Bk?=
 =?utf-8?B?Zm5ad0hCM0ZuWEx1Y1VsODFDNkhSVndsUk9ZRFAyY3dOV2ZYL2N4TVpac1Ro?=
 =?utf-8?B?cUswaStrTzhhcyt2bXpRK2Y4R2JSK2FkSXZ0VGFHYmJ4T0VDLzhoZzFYeHZh?=
 =?utf-8?B?NkE4TWZGdEl3YXEvMzJJamFKZTZIUHVGNFdteWhubzVqakFxSWJuelZMekdJ?=
 =?utf-8?B?UjBlZEh6b0loWVpWY254SmFsOWhqRDdORm40QWlRc0x4d1hSNncveXRBRjl6?=
 =?utf-8?B?Rm9QbThXbzBrc1UyckdteTl1b1BOV00vSkd6aHVHayt4c2crcFdmRkVKTVdP?=
 =?utf-8?B?Y2xEWDUvMEJxYTRrTDRWY0RDOE5oWUZ2UHV1RkJFaFNJNit2RnhTZzlFdFpW?=
 =?utf-8?B?Z0lwOEN6OS84ZHVHMkxqT3g2MTBNNzBFOWZVVExOa3MrcHFRSXhidnFJa3dG?=
 =?utf-8?B?ZjR0aUJpaE9iWUZzY0syRUQ3dWhwU28zQUk0U1I2ckFGMlE2VTg2QUduS1hE?=
 =?utf-8?B?Nm0wYnc0SktYV2dBVUNjYWk1TmRMMFpIZmIweXI4Rm1TQWVnOTNpU0pjTnRZ?=
 =?utf-8?B?YXFSbmlJQXd6R3RxeVJYMDlCMkJueVp2eGc4OU93YUwwR09SaFN5V0E5eFhw?=
 =?utf-8?B?VFd6eW44aVBJSnQ0eDVRZ0dwUXJ1Y3QydU43MmRuUnNuVndOVXkwZmV1Tmxo?=
 =?utf-8?B?cXNieWZiOWpmLytvbWVqd1h5cVhjZkJIbEdiUzMxY1UxNFVTZTl6Nkhnemtm?=
 =?utf-8?B?MmZONTVUdlY5YkU2cTRXeHN5L2poR3B0dUVwUitFZFB5MFNrVkZpd0xyVTY4?=
 =?utf-8?B?RmR2L0kyZUsvanl2dlZUTGNOQVVIUllUQmRIWnJOZFM4YVRWZjFTOWpERUpv?=
 =?utf-8?B?NDdvS002cFcwNTZiT0V1b2JxV0lBQ1M1YS9ISmZ3MkZWUjdXN3RXSFpNdkRk?=
 =?utf-8?B?bXlFei9KUHpDVXQ4UXU3bVFyNGtPZ2pDYjBWVmZtYW0vZ3NpMDhmU0dGZjNz?=
 =?utf-8?Q?ANMw5Op5K59pjhJbbG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e72b5db-a288-4425-f240-08de62a3a35a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 21:40:09.7237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Luiq7EixMR1aZjYVHMaFxHF5Dqfyai+gWYFkq18H3hlxGmfBn5gthPpo/95xd3dU24xHi+cgyfVzVunErnNcOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8467
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: D556FD1B32
X-Rspamd-Action: no action

On 2/2/26 3:25 PM, Lizhi Hou wrote:
> Update platform name strings to be more accurate and user-friendly.
> 
> Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engine")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

The same NPU is used in multiple products though isn't it?  So wouldn't 
this be confusing for example to show "Strix" NPU on a Gorgon product?

> ---
>   drivers/accel/amdxdna/npu1_regs.c | 2 +-
>   drivers/accel/amdxdna/npu4_regs.c | 2 +-
>   drivers/accel/amdxdna/npu5_regs.c | 2 +-
>   drivers/accel/amdxdna/npu6_regs.c | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index 6f36a27b5a02..cee42c49cbb6 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -117,7 +117,7 @@ const struct amdxdna_dev_info dev_npu1_info = {
>   	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
>   	.dev_mem_base      = AIE2_DEVM_BASE,
>   	.dev_mem_size      = AIE2_DEVM_SIZE,
> -	.vbnv              = "RyzenAI-npu1",
> +	.vbnv              = "NPU Phoenix",
>   	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
>   	.dev_priv          = &npu1_dev_priv,
>   	.ops               = &aie2_ops,
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index 3fc0420e8e3e..ed0382925b59 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -144,7 +144,7 @@ const struct amdxdna_dev_info dev_npu4_info = {
>   	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
>   	.dev_mem_base      = AIE2_DEVM_BASE,
>   	.dev_mem_size      = AIE2_DEVM_SIZE,
> -	.vbnv              = "RyzenAI-npu4",
> +	.vbnv              = "NPU Strix",
>   	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
>   	.dev_priv          = &npu4_dev_priv,
>   	.ops               = &aie2_ops, /* NPU4 can share NPU1's callback */
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index c0a35cfd886c..8427e9f2b4ec 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -108,7 +108,7 @@ const struct amdxdna_dev_info dev_npu5_info = {
>   	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
>   	.dev_mem_base      = AIE2_DEVM_BASE,
>   	.dev_mem_size      = AIE2_DEVM_SIZE,
> -	.vbnv              = "RyzenAI-npu5",
> +	.vbnv              = "NPU Strix Halo",
>   	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
>   	.dev_priv          = &npu5_dev_priv,
>   	.ops               = &aie2_ops,
> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
> index 1fb07df99186..a960149b5408 100644
> --- a/drivers/accel/amdxdna/npu6_regs.c
> +++ b/drivers/accel/amdxdna/npu6_regs.c
> @@ -109,7 +109,7 @@ const struct amdxdna_dev_info dev_npu6_info = {
>   	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
>   	.dev_mem_base      = AIE2_DEVM_BASE,
>   	.dev_mem_size      = AIE2_DEVM_SIZE,
> -	.vbnv              = "RyzenAI-npu6",
> +	.vbnv              = "NPU Krackan",
>   	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
>   	.dev_priv          = &npu6_dev_priv,
>   	.ops               = &aie2_ops,

