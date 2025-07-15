Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E89B05830
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 12:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C38910E206;
	Tue, 15 Jul 2025 10:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eyrApNu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ED210E206
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 10:52:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqXC6u4TrZYQv/kVDtD/S6V4qst1O5nScM+luObWXTIcn38EmX4nv2lBVB9btas7hH75zGaEynzJiLNSNz5ztMopYlrwWTKwf446sZATTjAEk8F1ULBhJ/bqWG6EqFn55haMy4Arij15ra1eb1F71p+WRu7YUHebG5P3bypaQz/EXOO2XwUMsxMDdOKMJ+O4ROvvNAqQVKmFqFLH+Gu2fnkw3RdHWLvIqGUxNi1GOxMC6w+PzshTWus5ndMzMxiuqt5DNRLEUnq/Cr19DqFJ+QxKMc53/Z0Inf58QaSP1F6hbG0n1KCEXZzeX7vyWfrxry9jevzsWLQl7JjzBo4ctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHkgc3118a9gfsXwsSy9iW5l1N0TPal5ICAlhPMt8f8=;
 b=OJxl+FSESyaKAZc8CBtYUS5ipkLMCqsYEQnd/DRidp8xpH9BNEqS49vKx7P14pavkgDU0JfIsMkh0sWAj7NfEXvXXk4AxFkK5oEpBJiix23ACEiDroqACKLqrNhZ/GBNMQj1I4E/MMYHjqbbW6cgMkgas5rFrsXMS8LywesuHYYxosGiFC4R7WJBZtrOk+qktU+rSsX0nUsHkJ9c0756SRitvMxHAGPDHwVbgE8aaTcLd5bqeIhVCJw3803slFeOvcryphBqGhs4uJ1eV478XEuOi3lVRTz8ATJ89Y6nn1q8E8QwCSKF9xYS6ZhedahgH6nN8e4xpau0WQxG4G+Miw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHkgc3118a9gfsXwsSy9iW5l1N0TPal5ICAlhPMt8f8=;
 b=eyrApNu8RFOEUB7puVaboa+OvIAtv+vuYjCHnPdKBIgEUYXQKuJsC50g3t99bObTMBUAu1Faw6zNIGf16abucyl6xauTrZIER3ImdAFq9sW4U7d75ZDjyyKxp6ip0SsvZiSwBPlRJ2ij5koajiRI4c13Zm08F9sS0k+0VOo9Eik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 15 Jul
 2025 10:52:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 10:52:50 +0000
Message-ID: <ba4770ce-f70b-4825-aba4-34e13c9b910f@amd.com>
Date: Tue, 15 Jul 2025 12:52:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
To: phasta@kernel.org, "cao, lin" <lin.cao@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>
References: <20250714062349.588235-1-lincao12@amd.com>
 <87d61f5b7809828a55caf779b10a90be802fe83a.camel@mailbox.org>
 <a8e473bd-6ea8-41e0-b5b2-10c420e5a935@amd.com>
 <70d9c6a43846c3a3c266d4a7a431c1c4b3fcd05f.camel@mailbox.org>
 <164c69fe-9ab1-4e04-8103-b25e4804e74d@amd.com>
 <PH0PR12MB549781447809324DF9A7E0D6F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
 <8dc0a31c06d33f45bbcb32d8805579015db91b21.camel@mailbox.org>
 <PH0PR12MB54974724ECC2262A6F00AE18F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
 <44bdc3fd5628a7db07c64331007509aa39a13df4.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <44bdc3fd5628a7db07c64331007509aa39a13df4.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7abcff-411c-46cd-0441-08ddc38dbe1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTNoZnFOeHEvR3dBOG01Z09pdjh3M2tNVzNRdk0zOEx0OWgvcnpjam8vc3RQ?=
 =?utf-8?B?UWx1MmNjMXZYbjc1M2dTN09aN2hEUzJITlBwWjc2WHNwNlZUekJ2Wmo2Y0c2?=
 =?utf-8?B?YUIzN3d4Z0FsMzREOFZnY0xQcUYwZ3ZOdWsxSXZyZHVDd1lJQ0JVbnBqL1dx?=
 =?utf-8?B?aVRlNWdRMzZ5c0x3dllITHZXZ2JBeW4yVDhLcTkwc1RPUUd0alRUczZLSmg3?=
 =?utf-8?B?RVNsNzUycnh2eS94dktheTJTcmFWVStxNW9QUFZxTUhpWnovMUJ6NWlNSlhl?=
 =?utf-8?B?cGdZWTB6VVBHRUVOWllrb3p0bTlVeXBwNExRMml6eVFEVUZiZC8xYlZVQXZa?=
 =?utf-8?B?Z1lrOWlrRENid1V3Yk5LY3ZEL2l5VW9JNGlGZDUxRm9lV3k0WlZIYkJjNFov?=
 =?utf-8?B?aUFjRGhlR1A1UnlYQzlOa2tra0s1b21UeGxNSWlYM1RaUElwOW9PUzNodUw0?=
 =?utf-8?B?RVVMZ1Q5RXBjOXhRYjFEdThDYmdhM3JtV2ZsQ1VoYnIxWmQ0M0tqM0JmMjVx?=
 =?utf-8?B?MWxUcnQyUzZpQjNTaXpKajBHcCtDTDBCa1F2eWNCVDY3QnQ0VzJHY09HWUdp?=
 =?utf-8?B?WjBXQkxnSmJ6bUk3NCtkMUxWbGtHM2ljamxaWU16OXUvcmk2b3hwbVd2R2Mz?=
 =?utf-8?B?YWxKYUtnUDZvTE5QSC92dGRNL2xKR0ltNkRjMUZIUWxiRTdqTktzcDlJbWVX?=
 =?utf-8?B?OVBmU20rSXZPNG9hS2poTTBFTXZSQVZmRXA1cWNlRjlBMGRZZ09HY3Z4bTN0?=
 =?utf-8?B?STFMZ1dkbmNaa1lqYkJoOTJKY0g4QjhWS3RGY3R4QmdxQjFBcjBRMGc4OHZw?=
 =?utf-8?B?QlYxd1U4bHBjeC9lYmtyMkZXU0huWjBaR3NkdEJHMzR2Q0UycUNhLzdFRmx4?=
 =?utf-8?B?UENiQ2NoOVhudUFPQzkxMkY1bUxOVzJURkQ2RkI1MlFKOUY5TUdkVzhTVW5O?=
 =?utf-8?B?cnYyNjNXMkxlTStlQnNlN2RoUVhobXdyV2c5YkVic1JwNHViWUZZcXp0NUp6?=
 =?utf-8?B?Ukd1algxZnB5UENCVmtJUjAwTlF6NGtra0F6MUdoS1JxRXlrY1lvUVVQZ21m?=
 =?utf-8?B?M0M2aFdqNExuNXBseS9RMWMrYVFxaVZKVEFzYnRJQUd3Y1F3OG9tMkk0OHFk?=
 =?utf-8?B?aWRLRkY5ZVpKSFMrT1dkWHBlbDNzeHZLN21MdWRPTXd4S2RUeDcwU0FZMnJB?=
 =?utf-8?B?OE10RWduVXIwWXRKMWxZemJaSER1Sm1MVG9IMmtma1diQW1UWGpPMzFzSFpC?=
 =?utf-8?B?emgvVDFyOVRFNjYxQlBZOHhvZml4V3lmY0JGM0R2dm5RcU93Y0VVek1PZktp?=
 =?utf-8?B?Y3pvTEJKVG1KcmJsdWJoQnU1ZFc2YTMvRXhUcUlJMUtneVVoZnd0aWJic1pI?=
 =?utf-8?B?b1B5eG5rTGdCSitnUlV6VXgzMFhJbFoxQ21yN2NsSkoxK3JBKzR6RE1HRitP?=
 =?utf-8?B?S0xLNHVsUmQ5TlN0ZG15c3pBZDl6THNPZlNqTnZRd1FlalZCMFp5bTBKT3lB?=
 =?utf-8?B?R2lhSnZtYnpCbXd3TXVjZXBvakZZNjNzMFB1c01lck8yWnk3M3hTeGVFUVpR?=
 =?utf-8?B?ZmYySE1KUzViMHZERXJyR01IODU3Qm1TM2RGV1QvaEpVQTV1Q2IvKzRFNW5M?=
 =?utf-8?B?dUNTYmdqdm5idnRCSFUxb2llKy9pT1VsVlhCWFVsVWlhQ25IbjY5dWlCS1Rl?=
 =?utf-8?B?SUpTc3V4ek1uOWhNSGEvS05rc2RCZENzbzRrOFkreXpZMExtUS9ReUVUMDRw?=
 =?utf-8?B?NjVmaU9yd201YmY3UHo5WEtHSnpxeHlDVXdDWThSSmxLeWR3NW5UVUxHTUpR?=
 =?utf-8?B?aVp6SEdXLzZrd2w1UHZOMEZZcm45WGNxMmtYS2gyNHhpOFBBR2FoR0NNUm5Q?=
 =?utf-8?B?VlUrNmpLcTBtaldtano3cGFKMmVubXdLZmJPbklnakxYTTRpSDA0VDVZZk9P?=
 =?utf-8?Q?4Ejw781Dm4o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkJuTkxPQ3VxR29kU1NTN2drUmdta3ZzSitvMjFjSkVXeUlNT0x6OEpMYjFC?=
 =?utf-8?B?UUVVMWZFZXliMURob3IzQm5RazlmbUdLRFI3RldDdks2WDlrU1RmYXZTV1hU?=
 =?utf-8?B?eWM0Vis1eUpIZ1F2cEFwQ0FaaE1lTk5kSTlZWUZUdkpIaGJPOEJqaG9rY0xu?=
 =?utf-8?B?V1lRdlBLa1hhd1N6OTgrMlRQUlFOeDhWTExtT2RKR25xTWdZMHo4ZnlERWVX?=
 =?utf-8?B?czJ3WGFEYVlUZjBLWDl1Q0d5S3FHVDMvRkpjL241eWhGNkhySisyZElmQWpp?=
 =?utf-8?B?ckZ4LzdwU2RHMGRZV2FSTGN6cXRGeEdFNnpQTEpXOE04REtXcW1ReFVZWlhy?=
 =?utf-8?B?c3JyWHlwcDU4ZXlKT0ppRTdTNWJpZVNpd0dMTFJDQXpLNW1FTjIxUnFhU1Bm?=
 =?utf-8?B?M2dTbDZPb3ZYdmN4cjd6aEorWWY4NTdveUZ2NUpRQUZ0QmZoUjE1amxnZmpG?=
 =?utf-8?B?SzExVmxzelRFQkJnSEZQQlczQ2xCU0dmWkRwZUFsdTAyMm1NYzZtN2Fad3Bk?=
 =?utf-8?B?dG1GcW5xNUJYUmp5Ny9qdG5hck15Y2NEN0E5MmVQcE9aTGM3dldOdjBOTWt6?=
 =?utf-8?B?VXN0TXdDTnBMQkhkTG9uVG90TmhXM2tDSWU2eG9hSnJ1c3ZlUmgwZW9ickFq?=
 =?utf-8?B?ZkZyOWFVMjdvdGZ0UzZCN201eE9hcSthSGV0dEMza1FNT2Myc2czOHNyU2w4?=
 =?utf-8?B?RytBMUVQRVJ3c1NvRGc1WXBTNlBXTEZiSUpFYTZLb0FoemIveTI4WXpybnh2?=
 =?utf-8?B?TlJCVDJyb29oSU1TdCsyRVBzVGJFaU5EYnM2NGgxdldPdGZURU1wVTBHdlUr?=
 =?utf-8?B?eGVjWWZEMnE4bDJmdjdUMm9IZTRpS1ljMks4bzJ6WFRoZmNGTDgrcnlmbUtD?=
 =?utf-8?B?cEF0Y2RwMzBnZE1FMG5OcXRPQ3l0NTNxOVRFNWMxbE5kZTQyTmxYRVY0Wkp3?=
 =?utf-8?B?VzZNVnFJZHE3ZkZSUmdUWGhyTDQyUjkzTUNOMjNxS0dFSDZnZVlxK1hUUmtO?=
 =?utf-8?B?Um96Yis5T1AxNWpWNzRZNHpxazM3RnJXTmNaVHJUVmRGQWRkdUNDeGdFNENx?=
 =?utf-8?B?SVFJS2xUR3p6VVA1ckk5OEREMEowQ2ZVZnNBWnhXcFM4Tjc0TGk1aUhqRFBH?=
 =?utf-8?B?dWlMUXBEUHhPUXgxL0ZUcUE1Ty9zbndWZmdZeCs1d3psM2VtZ1BLeVVLVzhu?=
 =?utf-8?B?L2RSTG1iTjJ0NUhvaTE0RWFYbUFxbDdaMitiRjdlRTFwTTgvT2xuQ01GZlRC?=
 =?utf-8?B?Y3RIVStZdTg1bmRuRGZDdHJjVmpWREVZb3pqYjBHdUxtaTNTeEdrdExwSnd5?=
 =?utf-8?B?OWp4LytJYlFEVVJoUHgxN1EvNVlQSmhuRllTT0RYOFNEbmNZN3pKbEsxSWJ2?=
 =?utf-8?B?alVITnNpYzdyZVdrZzQyREptV3hnSmluUDZWRENxbGpRWXBSMVhRQzI0UDRl?=
 =?utf-8?B?cFNZNWx2VDBvb0VRNHlXREpYaHAxQUtjbXNTVXJNR3JEbXhwWkZwUi9GUUo2?=
 =?utf-8?B?U251aThISmszSEtVU2VmMjZLTW0zM0JCUmpibm8yR0N0ZVRuUGlidWxxOS94?=
 =?utf-8?B?R0gzMnJubXlkK1JqOE5lcllBejlzN1d2VmlxRjdWaUpuUHZOektsRmxHZDFL?=
 =?utf-8?B?eWZ6UjRORUc3TGtTbGxzRm5QRjNnemZaWUc3VEVWYVlQMUtKbDFrZTdDTklR?=
 =?utf-8?B?YXZidmhEaUxpMEhVdVdKMlB1aFlldDJsRnpqTS9hM3hzQk5EMlVmaVdYbENZ?=
 =?utf-8?B?TUN4dnpIcmJvZitweE85RnExOGxDSCtCUkNrNUkvd0FiNnRaa3RZOC85UmRl?=
 =?utf-8?B?WFlFbFNZaDJWQ1c2UDg3YVZvK1pCeTYwOU83b0R3MTRSL013TUNkTUIyalBO?=
 =?utf-8?B?dzJEQmx2SDJPbFJ2SEN5OFVyc1FqWkdxOHltRkttU3ZVZUVBNEVKb3h2Tm5Q?=
 =?utf-8?B?OENBZkZucCtHRmpqbWxocGxacW9vWkQwVDBtNmF3MWxLeUdBNEtzblhRcWEy?=
 =?utf-8?B?WlNtMmFRRjB0QnZ5cEVqQXhXajFPbmR3VkRzQUZQbUtZbDBLaU04K29QVHZo?=
 =?utf-8?B?MVl5eEZMQVA4SmQ2VDQ4T0V1TmdBSG0zY0M1V1NIbFk0UkFGbDQ2Q1VOU1dH?=
 =?utf-8?Q?yme9LrXsvyCkCgovsxO8n8uyx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7abcff-411c-46cd-0441-08ddc38dbe1f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 10:52:50.6728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27UVuJZEVf7imAbVqa8D1jOKnXjZZ97KTnlPIJMm9B28Ae52UGRFIlwWwXn4gSjF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244
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

On 15.07.25 12:27, Philipp Stanner wrote:
> On Tue, 2025-07-15 at 09:51 +0000, cao, lin wrote:
>>
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>>
>>
>> Hi Philipp,
>>
>>
>> Thanks for your review, let me try to clarify why I added drm_sched_wakeup() to drm_sched_entity_kill_jobs_work():
>>
>>
>> When application A submits jobs (a1, a2, a3) and application B submits job b1 with a dependency on a1's scheduled fence, the normal execution flow is (function drm_sched_run_job_work()):
>> 1. a1 gets popped from the entity by the scheduler
>> 2. run_job(a1) executes
>> 3. a1's scheduled fence gets signaled 
>> 4. drm_sched_run_job_work() calls drm_sched_run_job_queue() at the end
>> 5. The scheduler wakes up and re-selects entities to pop jobs
>> 6. Since b1's dependency is cleared, the scheduler can select b1 and continue the same flow
>>
>>
>> However, if application A is killed before a1 gets popped by the scheduler, then a1, a2, a3 are killed sequentially by drm_sched_entity_kill_jobs_cb(). During the kill process, their scheduled fences are still signaled, but the kill process itself lacks work_run_job. This means b1's dependency gets cleared, but there's no work_run_job to drive the scheduler to continue running, or we can saystep 4 in the normal flow is missing, and the scheduler enters sleep state, which causes application B to hang.
>> So if we add drm_sched_wakeup() in drm_sched_entity_kill_jobs_work() after drm_sched_fence_scheduled(), the scheduler can be woken up, and application B can continue running after a1's scheduled fence is force signaled.
> 
> Thanks for the detailed explanation. Makes sense.
> Maybe you can detail in v3 that this "optimization" consists of the
> work item not being scheduled.

Yeah, removing this "optimization" would also be a valid solution to the problem.

Christian.

> I think that was the piece of the puzzle
> I was missing.
> 
> I / DRM tools will also include a link to this thread, so I think that
> will then be sufficient.
> 
> Thx
> P.
> 
>>
>> Thanks,
>> Lin
>>
>>
>>
>>
>>
>> From: Philipp Stanner <phasta@mailbox.org>
>> Sent: Tuesday, July 15, 2025 17:12
>> To: cao, lin <lin.cao@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; phasta@kernel.org <phasta@kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
>> Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily <Emily.Deng@amd.com>; dakr@kernel.org <dakr@kernel.org>; matthew.brost@intel.com <matthew.brost@intel.com>
>> Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with dependent jobs
>>
>>
>> On Tue, 2025-07-15 at 03:38 +0000, cao, lin wrote:
>>>
>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>
>>>
>>>
>>> Hi Christian, Philipp,
>>>
>>>
>>> I modified the commit msg, and I hope it makes more sense:
>>>
>>>
>>> drm/sched: wake up scheduler when killing jobs to prevent hang
>>
>> nit:
>> s/wake/Wake
>>
>>>
>>>
>>> When application A submits jobs (a1, a2, a3) and application B submits
>>> job b1 with a dependency on a2's scheduler fence, killing application A
>>> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force
>>> signal all jobs sequentially. However, the optimization in
>>> drm_sched_entity_add_dependency_cb() waits for the fence to be scheduled
>>> by adding a callback (drm_sched_entity_clear_dep) instead of immediately
>>> waking up the scheduler. When A is killed before its jobs can run, the
>>> callback gets triggered but drm_sched_entity_clear_dep() only clears the
>>> dependency without waking up the scheduler, causing the scheduler to enter
>>> sleep state and application B to hang.
>>
>> That now reads as if drm_sched_entity_clear_dep() is supposed to wake
>> up the scheduler. But you add the wakeup to a different function (the
>> work item).
>>
>> Also the code actually looks like that:
>>
>>
>>                 xa_erase(&job->dependencies, index);
>>                 if (f && !dma_fence_add_callback(f, &job->finish_cb,
>>                                                  drm_sched_entity_kill_jobs_cb))
>>                         return;
>>
>>                 dma_fence_put(f);
>>         }
>>
>>         INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
>>         schedule_work(&job->work);
>> }
>>
>> So if adding that callback succeeds we.. return immediately but we.. do
>> that for the first dependency, not for all of them?
>>
>> Oh boy. That code base. We(tm) should look into pimping that up. Also
>> lacks documentation everywhere.
>>
>>
>> Anyways. If this solves a bug for you the patch looks fine (i.e., not
>> potentially harmful) by me and if the tests succeed we can merge it.
>> However, I'd feel better if you could clarify more why that function is
>> the right place to solve the bug.
>>
>>
>> Thanks,
>> P.
>>
>>
>>>
>>>
>>> Add drm_sched_wakeup() in entity_kill_job_work() to prevent scheduler
>>> sleep and subsequent application hangs.
>>>
>>>
>>> v2:
>>> - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()
>>>
>>>
>>> Thanks,
>>> Lin
>>>
>>>
>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>> Sent: Monday, July 14, 2025 21:39
>>> To: phasta@kernel.org <phasta@kernel.org>; cao, lin <lin.cao@amd.com>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
>>> Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily <Emily.Deng@amd.com>; dakr@kernel.org <dakr@kernel.org>; matthew.brost@intel.com <matthew.brost@intel.com>
>>> Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with dependent jobs
>>>
>>>  
>>>
>>>
>>> On 14.07.25 15:27, Philipp Stanner wrote:
>>>> On Mon, 2025-07-14 at 15:08 +0200, Christian König wrote:
>>>>>
>>>>>
>>>>> On 14.07.25 14:46, Philipp Stanner wrote:
>>>>>> regarding the patch subject: the prefix we use for the scheduler
>>>>>> is:
>>>>>> drm/sched:
>>>>>>
>>>>>>
>>>>>> On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:
>>>>>>
>>>>>>> When Application A submits jobs (a1, a2, a3) and application B
>>>>>>> submits
>>>>>>
>>>>>> s/Application/application
>>>>>>
>>>>>>> job b1 with a dependency on a2's scheduler fence, killing
>>>>>>> application A
>>>>>>> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to
>>>>>>> force
>>>>>>> signal all jobs sequentially. However, due to missing
>>>>>>> work_run_job or
>>>>>>> work_free_job
>>>>>>>
>>>>>>
>>>>>> You probably mean "due to the work items work_run_job and
>>>>>> work_free_job
>>>>>> not being started […]".
>>>>>>
>>>>>> However, the call you add, drm_sched_wakeup(), immediately only
>>>>>> triggers work_run_job. It's not clear to me why you mention
>>>>>> work_free_job, because drm_sched_entity_kill_jobs_work() directly
>>>>>> invokes the free_job() callback.
>>>>>
>>>>> Yeah the description is rather confusing, took me more than one try
>>>>> to understand what's going on here as well. Let me try to explain it
>>>>> in my words:
>>>>>
>>>>> When an application A is killed the pending submissions from it are
>>>>> not executed, but rather torn down by
>>>>> drm_sched_entity_kill_jobs_work().
>>>>>
>>>>> If now a submission from application B depends on something
>>>>> application A wanted to do on the same scheduler instance the
>>>>> function drm_sched_entity_add_dependency_cb() would have optimized
>>>>> this dependency and assumed that the scheduler work would already run
>>>>> and try to pick a job.
>>>>>
>>>>> But that isn't the case when the submissions from application A are
>>>>> all killed. So make sure to start the scheduler work from
>>>>> drm_sched_entity_kill_jobs_work() to handle that case.
>>>>
>>>> Alright, so the bug then depends on B setting a dependency on A _after_
>>>> A was killed, doesn't it? Because the optimization in
>>>> _add_dependency_cb() can only have an effect after A's jobs have been
>>>> torn down.
>>>
>>> No, application A and application B submit right behind each other. Application A is then killed later on.
>>>
>>> The optimization in _add_dependency_cb() just waits for As submission to be handled by the scheduler, but that never happens because it was killed.
>>>
>>>> If there is such a timing order problem, the commit message should
>>>> mention it.
>>>>
>>>> The commit message definitely also needs to mention this optimization
>>>> in drm_sched_entity_add_dependency_cb() since it's essential for
>>>> understanding the bug.
>>>
>>> +1
>>>
>>> Christian.
>>>
>>>>
>>>>
>>>> Danke
>>>> P.
>>>>
>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>>>  in entity_kill_job_work(), the scheduler enters sleep
>>>>>>> state, causing application B hang.
>>>>>>
>>>>>> So the issue is that if a1 never ran, the scheduler will not
>>>>>> continue
>>>>>> with the jobs of application B, correct?
>>>>>>
>>>>>>>
>>>>>>> Add drm_sched_wakeup() when entity_kill_job_work() to preventing
>>>>>>
>>>>>> s/to preventing/to prevent
>>>>>>
>>>>>>> scheduler sleep and subsequent application hangs.
>>>>>>>
>>>>>>> v2:
>>>>>>> - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()
>>>>>>
>>>>>> Changelogs are cool and useful, but move them below the Signed-off
>>>>>> area
>>>>>> with another --- please, like so:
>>>>>>
>>>>>> Signed-off by: …
>>>>>> ---
>>>>>> v2:
>>>>>> …
>>>>>> ---
>>>>>> drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>>>>>>
>>>>>> This fixes a bug. Even a racy bug, it seems. So we need a Fixes tag
>>>>>> and
>>>>>> put the stable kernel in CC.
>>>>>>
>>>>>> Please figure out with git blame, git log and git tag --contains
>>>>>> which
>>>>>> commit your patch fixes and which is the oldest kernel that
>>>>>> contains
>>>>>> the bug. Then add a Fixes: tag and Cc: the stable kernel. You'll
>>>>>> find
>>>>>> lots of examples for that in git log.
>>>>>>
>>>>>>
>>>>>> Thx
>>>>>> P.
>>>>>>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> index e671aa241720..66f2a43c58fd 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> @@ -177,6 +177,7 @@ static void
>>>>>>> drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>>>>>>    struct drm_sched_job *job = container_of(wrk,
>>>>>>> typeof(*job), work);
>>>>>>>  
>>>>>>>    drm_sched_fence_scheduled(job->s_fence, NULL);
>>>>>>> +  drm_sched_wakeup(job->sched);
>>>>>>>    drm_sched_fence_finished(job->s_fence, -ESRCH);
>>>>>>>    WARN_ON(job->s_fence->parent);
>>>>>>>    job->sched->ops->free_job(job);
>>>>>>
>>>>>
>>>>
>>>
>>
> 

