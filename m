Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E621A71189
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 08:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABB210E29A;
	Wed, 26 Mar 2025 07:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a9/5a9N/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BA410E29A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 07:41:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OC2YfaNZXEhLsnlZ/IhWj1YTkpkJ+WzOwEvylBcz7ZNiZIR5Eb9KpuFvV+VGtDdrtYgcTlsascKnZ03+GF/iGyKOZ29udoEo22Vm9K8+fcIXfwVJAfCvyGoqKKJSDfwbybJfm9H6GqMokXWiEE8OBV7f68nL0Cc9SsHoIpJZB6n6VIMjmay7UhOQ36rijY9zqh7cMhWAkpF9w1dXUqfeVF7W+f4luFlkCl/eBmKhoB/c5UuHoyWNLgQkHxUKYdpHvHfNNLvE5a+4E2uxd1GK7ZC18onCqxfUxsumPp0Q1flyaID4D3dbrG7A3eK8DYxk5ZKzHqgs39j8yxEXe5zDUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzlnwZI3uF+kJk3AMVJPsJif5BmqhopC1bZS4M6v1Pg=;
 b=LzOOz07JEcV+zpWtgekZgtNXHQuavsf/HMrOyCzEQ30A7ganQ3052LUlOLdvTvD6Jsj4A5t9sHgnefo6l9Oijn9tBQkoPL0Nl4SZAG7lmKJZmvDw4Z1rqYsDg41YqfDeDqMXXegRmm/fq2E1Es2JrQXN+aWLVdGpYxSw9YM3R2DDCZ1Eakqta54XzPsvSLJ2a15ZInD8CfF66m+Wah8u0X/zNILasxSsYX3DeSF9/bxhSXt4i4w6DAvodIGD0fvc0O1gFhJUlj1TmjoJpFDktkUe67kw3qyLFvG2RDxiBBFCfmVXpC3gAEcgMAtV7DorSbEpIl/saQIMffYJRHMVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzlnwZI3uF+kJk3AMVJPsJif5BmqhopC1bZS4M6v1Pg=;
 b=a9/5a9N/UU1Gc2sp6KXzX1p/HDsAbpP3X06TkeQXINV155pqqmFRW9ttHg/006QXmFIWr65/CwtOd1Wykr4gjxgrhDbMKv8X4kU9339YJyrOAUd1pcetYoARWAGbxQRYK342qlJQXvr8pBJ73e0IU3SrlFPoiRun9yBX7yQJPOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA5PPF5D41D38AD.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8cb) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 07:41:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 26 Mar 2025
 07:41:29 +0000
Message-ID: <366587a4-9097-40d8-b21b-a2e82ae79476@amd.com>
Date: Wed, 26 Mar 2025 08:41:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] udmabuf: fix a buf size overflow issue during udmabuf
 creation
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "Xiaogang.Chen" <xiaogang.chen@amd.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
References: <20250321164126.329638-1-xiaogang.chen@amd.com>
 <555feb70-5d80-4a36-818f-f00fbc3dff23@amd.com>
 <IA0PR11MB718563F5C571E07F1314F152F8A72@IA0PR11MB7185.namprd11.prod.outlook.com>
 <099dbff3-42fb-4445-b5a0-1c4031bb9e7c@amd.com>
 <IA0PR11MB71859EE03E705A33BB5274F3F8A62@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA0PR11MB71859EE03E705A33BB5274F3F8A62@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA5PPF5D41D38AD:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a51fe0e-67a8-4497-249b-08dd6c399ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXFxelVodW9xb2FpOW45ZGF5NlJwVUNmYzduM1Y5Y0FyVEZMSWxrZTA5V1NE?=
 =?utf-8?B?ZVdRWnZnMjFUWEo4VXN1YTQzZVpOeFZoYWpVeXhXNkVoSUNURWJSSlZVWE14?=
 =?utf-8?B?NlArVDJZZmp1S005SkRlbStBaXZOdVdwQ0MrM2MwczcrN1FPdzJkazduQmJv?=
 =?utf-8?B?aWQ1VW10OWhVNXFNRDkrOG5uZmNBeWh5dU1GZUc0OVkzcVhJQmhXa0lvbTk2?=
 =?utf-8?B?RkRCQzVySXNnVUlEczArL1lIVFdhako1N3pIV2hBUW5neSsxWjJzM09KbjhP?=
 =?utf-8?B?ZWd0QmljWUE0ZzN6cDA1ekJGK29XaGtaV3dSbitrN2tsOWRyL21VcDlpK1Ni?=
 =?utf-8?B?UTBBYmQ5RVRDOGVGWWEzMWIyeHFkVDdZSUxLU2FXQjMzMmtzS2pCdmdDRTBI?=
 =?utf-8?B?OXRoRklwTUVVY2NpZng0L1RUSWV3K0ZpSm1MekorVUJIVjhTVU9NYVQ5Nkp2?=
 =?utf-8?B?S1k1eHAvSnd2UXlaVUM0Mld3STZ6SjgzYXBmL2Y1OUZsNEcxYk1rdTFmZVJ1?=
 =?utf-8?B?RStmMWZYNlJicmIzcDNpZVljNUhvQ1Z4ZndFWWdOczZqVVoyanZNYlh2Q1F1?=
 =?utf-8?B?ODNlZWlYNTFnZksvS3FKZnlSRjRjUkc2UVlFOXRnMEdnWHEzVkROMTFRcGtp?=
 =?utf-8?B?R1F6NGpvWjdFaW9IbTEwalhRcVBFUWxBRWZXdStDSTloQkRiTG9EUUlyRktD?=
 =?utf-8?B?eU1YWVY3QWtXZSt5K2IwMVlpaC9WWklHNTdVSG5oMXlvVkhDM3BlM25xWGs0?=
 =?utf-8?B?THlRWGNOSkpyZTNSRWNITzVuamRKTk9Wa3BUQ3N2YndwOXQzUVFLUU1KQXZ3?=
 =?utf-8?B?MHJPM2kxR2w4ZTRKOEtlZlJnNFJoTnZXMHFJL2ZDSGJORlNPL1dwdzFrUm9p?=
 =?utf-8?B?RHhiYnVJWm1PekVydVNXVVhoZmtEUkNUaDAzdlVPRy9xWnRHbTU2dUlta1Ux?=
 =?utf-8?B?ZXJlQWV4WWgrNnhHS3dXRU9iV3dXMGMwdkxJaEdGMkpvZ1E4Nmh4Smpjb2xN?=
 =?utf-8?B?TXdnL2tzOWtjQUpmNzZ2amVIdGpadFQ3OWhEVVJRUVdOaSsySzZnaFZwaEI5?=
 =?utf-8?B?OTY3YWxjcnJ5aUJMdU9DQWtEREd0MXI2Z0FJN2ttUTMwbGJ4NTMvWklNanhr?=
 =?utf-8?B?M0pFem9Id0xEbnd6TWFUdEJUb1NCMGZEU2NXb1pjU3J2RHRSbWY2VnoyQnBz?=
 =?utf-8?B?ZVN6L0hPQnNhWG96NExsa3duUFllUTk3WXJGTlJwSE5QSHFjeG1zaEJpVVZh?=
 =?utf-8?B?akdVREovcGptQWtoSk5kcTUwdWNvVVlRN00yVmdRdytMSjBwTTJ3WnNBbjNP?=
 =?utf-8?B?eWpWY2Z3SWdyMnZXUjRRQTlRTlJJYVV0NWRoc2Q3V1poUi9qRGNVblVUdWw1?=
 =?utf-8?B?U3lqaU82elF5eXVydWZtZXdndVRLMDFPbmdYU3JKUEF2dmh6emNaeGFTT253?=
 =?utf-8?B?VTdTbGZxZHpOTVVQRDZncE5WNFlFYVRwaThGbVVpK0g1eGZPUVdaZk9nNEVM?=
 =?utf-8?B?Q09xVzBUcEhrcVJFVUZXcWIxVVVZazVnSEFRYVlDQWR2aytRdEVHckdBTjNW?=
 =?utf-8?B?LzZOTW4rNE1ESFRYbjluTGNOTXdraUJPdk5QMUh4ZklPTExGOU1CRXd0MUxh?=
 =?utf-8?B?Rnk4djNRR1EzNytCdHlxUHM4aFAvaVYyeHBSZlZhUzdtcmNzamQvQjE0ZUp2?=
 =?utf-8?B?ZlJFc2xxYWR1TlU5VmRQQ2VHUE55LzM5T2dnT3VpbEVSSjBXSklWU3ZqRSti?=
 =?utf-8?B?eVF5UmRtQ2ZpTEplb3ZYZGpWOE1aUm10dkRUTDY4YkhqOVI2TFlwc3B2SjFp?=
 =?utf-8?B?RmRLQW55S3pXK1Y3UlZISEFhMkZqWVdXN3ovZndoZHhJQ3d0VGVLY0VYMUJQ?=
 =?utf-8?B?WTBhMGVDREZCUXBCZFFyUDlxV0JHUmJCTEZKa0Z2bzhlNFVwd1pWVkExU1lU?=
 =?utf-8?Q?xB2z/99QybA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUVKVnFrbWVvQm55MldUeng1QnJocC9uU2libTBhbnJiNEpGdE9IRzkzZmpD?=
 =?utf-8?B?RGkwMVBvMnRVNGs4Smd6dmNjT0plbmRoTTV1MFlOWHRCY3o2ZVhnY0t1T0lu?=
 =?utf-8?B?ZFBuMGhOdWdnL0s3Z2JBVzVGS0t3TUhqL3B2TWVvTm9XQ2pLOW1ITTlWWU5l?=
 =?utf-8?B?WTFVQldLMEJVdCtvcWNuMWU3TWFmUGxXR2lYVFlQSTRwQk51SXZ3WlZpNzQv?=
 =?utf-8?B?YXB1T2lFMWJHcTBUeDNoeTc3bTFGS2MzUXZ4bC9MOTdVV01OOW5ZV0NqWDY4?=
 =?utf-8?B?ankxWFRlcjF4bnNhc1NpSGZtR2UrVnpHNHNGRW96eEw4V3FWY1NQL0VwVGJh?=
 =?utf-8?B?QlN0YWFWYldYUDI0WWVsYnc4MDVCcmpzY0RpRG0xeFh4YllEUVNObDB6dGRQ?=
 =?utf-8?B?T2tJTEsvSXpxcDhFK3dBWlFsaXJSSTZseEN4eDU1dnd6YzJBSnM0RGdmMUxU?=
 =?utf-8?B?b3NpNnFWdVJZVkFYN25uV1Fwbm83ZlVIMW5kd3pSVGZoR2lnb3FrTEtTTkM1?=
 =?utf-8?B?U3d6QWV6UHoydWlVajRpazBDVHNSSGErOTBoRWsxWStaZFYrQzV5YVJ1UGlW?=
 =?utf-8?B?bFlHbGRadkN0VUZQUFh3QlhCMEExTC9NSFcxRUxHbGJZTk5RODZGUEw3Vitj?=
 =?utf-8?B?M1AzSmVCRjRBNTdwelhHQThiLzVMMXFoTzZ3SHRXaDV1YzU2SEh3YmRYRTZt?=
 =?utf-8?B?WVFmTEhOKzFqS25IczF4eGRqL0Z0SEw5VzJWdDh3bTlMTFlrbGphSzJ5L3FO?=
 =?utf-8?B?aTkwV1RTb1VlMHg1cHZ1Nzk3eVdOemluS1hkNkVobnFsL0VCRk5hcUtVWkRQ?=
 =?utf-8?B?RjdtWnNlRytVK05mUjFScG93aC8xdU9qdW9tTy9oTytEZGlRMnJPYnNoVXRW?=
 =?utf-8?B?WkdLTVlaZW1EOFpnVUZjd3dDaHV4L20rRDBhVFUyemphQnBGU1J5bXhLYUov?=
 =?utf-8?B?TWQya3l5WmhpZTJnNUo5dDdqQmdlcWxodjgvUURQdXhtUUpOVnE2SFBwdnN2?=
 =?utf-8?B?WC9rYmdhbGNtRHZ1ZXNTczMvU05DcFdUTVREWmV0eFFmb2pYQUdNa2h5ZW1k?=
 =?utf-8?B?VWlyZ1JOc3N5em4vU0lNb09qakFCWE5oWFFwckhvemgwWm5WTGNXdjJGNkhS?=
 =?utf-8?B?eTlVRDFEcitVRlhTWEt5L285Tml5SExRbGkwQWpWQVRoN0xiUzZhL1dUNzNi?=
 =?utf-8?B?Ym5kZk9mb1ZVc3lLTmZEdnYzbndNWDdxSnZSWUhpYUxIWWsrRCtESjlpYXpR?=
 =?utf-8?B?NG45YzhnSlRKcUE0dlhoREN0eTBHY0tBQlVOWnZYNFFhbGhKak1NdXdIOHhC?=
 =?utf-8?B?M096amlhV3lsZy9mamY0cHJ6bU1IWXRvYitSMUsrQTg3WVRWNmNldERFbnFP?=
 =?utf-8?B?REM2V0gyRVZPNUdoUlpDc1VtSFhFcFRuelJNTnFFR01oOXZINFRlRk5JNUZC?=
 =?utf-8?B?NnVQQWN0RW81a3h1aWx3OGxCSXk1RTZsdzdUWVRqelVVUTBReGQ1aU5BdlJr?=
 =?utf-8?B?TldhenNNSHBCMWx5dkdYVnY1c1I1cDdYejdKbUptcmMvclVTbTJpUnFJWDE4?=
 =?utf-8?B?NlpSYmFubE9JVlArQ3BwbEM5S20zSTUyNkgvcFlvUTUra1pwMjZhNTltdVlm?=
 =?utf-8?B?cHJ0Y0pQZEdycEZBQjhKK0VkK253OUhOT25qb0k5bU9PTFdLR0p2UEdteGhZ?=
 =?utf-8?B?eDdZQVorejJmVWRTNFVPdk5aT1YwSHowQTJPKzVpRys3eGJvQzhjcllONm5K?=
 =?utf-8?B?TW02YllBT1JjZXBFMzMycXVBY1hURkJzZ3lQQm5ueEp6YjNsQjBCMkRxeFZt?=
 =?utf-8?B?QjBLVnkxclFCNXg2NFdXYzYwYWpCa0owdnFYUlhaakIydG15cXQ5VTNvNXYy?=
 =?utf-8?B?TWxKa1E3R2JlemxkS1pMSjZFa1pQVldLL1Nla2dYVmJjTWVCZENjR0NRWjVD?=
 =?utf-8?B?eTFuUHJXWkI1WktubUVMd3F5NWFBWjJPWUlJdDN0RTFaeXBDTFlMa0RjK2Rs?=
 =?utf-8?B?RDlRdlFTcGQ2M3ZKWmkvdllDd1k0ejVPalA3MGgrMjBrWkJ1Yk5MZG1Sbnh5?=
 =?utf-8?B?WE5NdkczbXpIL2gyM1BWSWRpMjBiWDc5Y0h1enJUcENTM0tjYVI3VHZub3lJ?=
 =?utf-8?Q?F16hA6jkXbV3UaFHVZp0pXUVn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a51fe0e-67a8-4497-249b-08dd6c399ed4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 07:41:29.2676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abDZOfhC6RbyAizma2Tft+Vm2BdZJd2d8rz/3w9imKGaSIFYU0j//DjYN7Vep8A+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF5D41D38AD
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

Am 26.03.25 um 03:59 schrieb Kasireddy, Vivek:
> Hi Christian,
>
>> Subject: Re: [PATCH] udmabuf: fix a buf size overflow issue during udmabuf
>> creation
>>
>> Am 25.03.25 um 07:23 schrieb Kasireddy, Vivek:
>>> Hi Christian,
>>>
>>>> Am 21.03.25 um 17:41 schrieb Xiaogang.Chen:
>>>>> From: Xiaogang Chen <xiaogang.chen@amd.com>
>>>>>
>>>>> by casting size_limit_mb to u64  when calculate pglimit.
>>>>>
>>>>> Signed-off-by: Xiaogang Chen<Xiaogang.Chen@amd.com>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>
>>>> If nobody objects I'm going to push that to drm-misc-fixes.
>>> No objection but I wish the author would have added more details in the
>> commit
>>> message particularly the value they have used to trigger the overflow. I
>> guess
>>> Xiaogang can still comment here and briefly describe the exact use-
>> case/test-case
>>> they are running where they encountered this issue.
>> Isn't that obvious? At least it was for me.
>>
>> As soon as you have a value larger than 4095 the 32bit multiplication
>> overflows, resulting in incorrectly limiting the buffer size.
> Right, that part makes sense. I was mostly curious about why or how they
> were using such a large buffer (use-case details).

Well I suggested that we use udmabuf to implement shareable dma-bufs which can be allocated from a specific NUMA node and are also accounted in memcg.

But to be honest I have absolutely no idea what's the use case for a buffer larger than 4GiB.

Regards,
Christian.

>  
>
> Thanks,
> Vivek
>
>> Regards,
>> Christian.
>>
>>> Thanks,
>>> Vivek
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> ---
>>>>>  drivers/dma-buf/udmabuf.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>>>>> index 8ce1f074c2d3..e99e3a65a470 100644
>>>>> --- a/drivers/dma-buf/udmabuf.c
>>>>> +++ b/drivers/dma-buf/udmabuf.c
>>>>> @@ -398,7 +398,7 @@ static long udmabuf_create(struct miscdevice
>>>> *device,
>>>>>  	if (!ubuf)
>>>>>  		return -ENOMEM;
>>>>>
>>>>> -	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>>>> +	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>>>>  	for (i = 0; i < head->count; i++) {
>>>>>  		pgoff_t subpgcnt;
>>>>>

