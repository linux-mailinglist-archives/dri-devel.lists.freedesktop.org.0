Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D1ABEDD7
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 10:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C3710E6B4;
	Wed, 21 May 2025 08:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AwqoNW54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C4F10E6BB;
 Wed, 21 May 2025 08:26:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVwgvlrO8gUVFzQwGAiCSAKw9Nub2XYjb1D5BUl9phsDwO5mP7DHL9wg8OOuqEsMZh67RmNOPTGd552poC+mbronIPjLVsXsQmkxwfB8c5LCIOh+FYNGSxSYDbITJgk0csESBkoEbZ1EbeOaOkdfLkGIqUyfc5cY2v2Cz/fao9F/V+OlC0BqNVFKHLcUuMlYelgBX5FVti4M0BnOJqaQGU7qQROe6bmFF3l00IBiwTwnQ4xXznosTmPVAuonaq6GEv3X22E84p/p8oVjQ8OOd1J+7OdKj69thzgZG1o5UZrTr48BWr3OYJwGyq6Q3hQaynp4/eacGVrmPjjKj4P9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxgTEzZVobsDtyE4rTDp795O1QMpnTpAsSCXliR7x2w=;
 b=SR8W5KzbffCem773oJA2HGsodAbZei+Wj5GDDDg+Fj5BLOT0s1Ax/UoqP1mgog41S05+BDq+Kn1E/Lms+Lsu6uL0NzdyR/sVu8XKFfnm3bASRZ7eA4xr5QRQrLeL95cjKoOXhZ42fENtj2Ii4eTKjTQomRkxKqS292mXAbTPktd7CXC3NkV8zfZ5Vu8awEbwiKsjCzvszpR2i/tgg5PyHzThtEeDfPImzsbFgflyhHPc6Iyr5ujFTuDYAdlfN2msKh2MJ3Y8JfOru/jk2oQ5f9AwE9dlbpZSsz1PiJl+J/YISqymUzDjtqitRExdPGkQVQMNXM4NIbd3DN2QAj06tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxgTEzZVobsDtyE4rTDp795O1QMpnTpAsSCXliR7x2w=;
 b=AwqoNW54G8oPcoTqUekJ8yqZvEQRme7jU3VPiowa6rbdnj5Qir6WLJInPWNojvOnxfRAvhL3t1zQAUGgNrnuF5Js6G5GcxmMoefxZ7vWemO1NW2kskNr4qcyW1Mh+lkL+F/+65++4oR2GWKJeg0tERJXpqOKcoe6Goj1g7ugq5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8192.namprd12.prod.outlook.com (2603:10b6:208:3f9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 08:26:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 08:26:00 +0000
Message-ID: <01ceeb6a-96f7-4716-a082-255867fbb96e@amd.com>
Date: Wed, 21 May 2025 10:25:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sched: add drm_sched_prealloc_dependency_slots v3
To: phasta@kernel.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250515150038.4615-1-christian.koenig@amd.com>
 <20250515150038.4615-2-christian.koenig@amd.com>
 <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
 <5c93f114a58e84796f239b9e0f4a13e9c223e45b.camel@mailbox.org>
 <6e5ab077-77ff-443b-b345-7d99fcd01a73@ursulin.net>
 <6a361f21-1ba2-4084-b85c-0db30c9b01cc@ursulin.net>
 <fc617b712c5937c02be89f7ba068ce0de1512027.camel@mailbox.org>
 <01cce810-7303-4c92-b138-d8a647f3dcee@ursulin.net>
 <a36fdcf31fa0ca7d9e1a24f60ba4c5bf78c7ae87.camel@mailbox.org>
 <da8cfddf-6cb9-4ddd-9345-16d065663d4b@ursulin.net>
 <25363de0e88f750fe70a7b7629113f93f12f47e7.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <25363de0e88f750fe70a7b7629113f93f12f47e7.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR14CA0013.namprd14.prod.outlook.com
 (2603:10b6:208:23e::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 667efe30-e0b3-4751-2976-08dd98411e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TENpUzVReDNDdEMwd25TYlhzZ0VBWUpUMm9HeWdqSHp3NWNvekswU3BDM2E4?=
 =?utf-8?B?VUNwTnJ0czAyT2VWUFR0eWpZR0E4UFVwaWJ4Y0RkMXU0cU5hQ2Z2VEkzKysw?=
 =?utf-8?B?ODh6WEZzM0dmTXJzaER6UTRRYVV6WnN5ZzlhZ1hLbHVlSTZRazFDZkdiVG56?=
 =?utf-8?B?aFUzdVFtaWxrMmtuRlNnckI3M0hDZFpPRElzMCswWVBpNmF0d0htQUVqSE4z?=
 =?utf-8?B?SXFMSW5GSGRaRmVvWVluL05IaG40TURtS2tpTHFGQkxYMHJUNzN0SXVYZWta?=
 =?utf-8?B?S0FianNKaktjQ2l5VmwxTEs1djVJeFUzVUpIOXdXVWxkZEdlYVVPT2hSRnZz?=
 =?utf-8?B?RERZYjMxKzlvdGNGTlRhUCswNW9JUW9RVWdhdklWcjJKZ24vSUxvMEo0eTZP?=
 =?utf-8?B?QW02eEs4b2tZeW1iWDVibUF5YWtnWWlDZ2dLak5DNUt1SzRROHRuczBTa0Zh?=
 =?utf-8?B?OERMNXNyOUhQdWg1cHYweWZzNWdlMmRIa1JYQXN3aTI2cEprTTFTeHNaNHFC?=
 =?utf-8?B?M2lCdW9WaitPTTI1elNFeFpLRCtTeHNsNERSeFoyWkFhYnB4ZEloaHJXTzV0?=
 =?utf-8?B?Nkd1QVdKVEovcHZsOFBHVDh4VkwyV3JtMlhQUE1Ebm9YTXRETzB5ai9MLzhq?=
 =?utf-8?B?U2lXOU1lSXZ0MmZQVVRHY3Q0U2dEQUt2Yk1JdEFNUFR2VlNia1JrRzJjN3pD?=
 =?utf-8?B?dEtoL0RDWnpZOC80bDZwald2aW5Ia0hML0h1R1EzWkplbGVnUkNUT012bHhY?=
 =?utf-8?B?M2pXdUx4c1pmb0d5c2JwcjFncVBsZHdrNk5Hb2RuK05BS2pzREtPQ1p5MSsy?=
 =?utf-8?B?Vk9CNERhNVd6dSs2L05ENnkrTUVwd3k0clBUMnFBNEZjWllFbEsxMkZqSVVR?=
 =?utf-8?B?dExTU29xMStOTmJGb2Y0aHF1WjNVWFFiYWJFdi9OcEhFZVc4YUE4RW5GSG9E?=
 =?utf-8?B?MDJGRFVkS0JXYXcrT2xZZm5PMlg0RnhKazRMM05NOE5qRDFKUnJPZXd6TFZy?=
 =?utf-8?B?NDIyUW1YdEFZSElDUnlWOC9nT3d6UnlYUjNscnRKbUx5alV2bXNqc2hubmhN?=
 =?utf-8?B?L2lwcmtrWjVHRzZnK3pmOEZUTlA3bXJ4V1Y4NVVvU2JHaXJlYWdadUlIbjJq?=
 =?utf-8?B?TkN2NTAxT296S3loRWQ3OC9wUmxZelFWejg0bnIvN1J1SVg3blFNajhTUE9O?=
 =?utf-8?B?M1BVZzFlcHd3cDZKN3RUS004NHZTYU4xTUl5eWptVExUMDRRcWp0OGxwdUxJ?=
 =?utf-8?B?L3ROQ3Q5V2RuSEFVb003bUJSdzdaYytuWUVLZXYweUtpMy9GL0ZJWTFPVFo5?=
 =?utf-8?B?N0JrUlFrd01ZTFlZSVl0NVVqWEdwZ0RaMUcwTzRsbHV1YkZrN1ZWRVY2Nm5i?=
 =?utf-8?B?R2l4Z3BaTGpDOE9Lclc1VGozUEtGbTNVUjE5b2w2REg3ZWVLUm5WNUVoWmQ5?=
 =?utf-8?B?bW1FRk91Vldhbks5aHdRNmh2MHZKUjRra3JHY01yOTVySFVyWTZhemJqc3BU?=
 =?utf-8?B?UGwxeTh2LzdoRXBmUXpwb010VXk5U2hKS3dFQnNnRFNRSnErSDJLY1kvbkZX?=
 =?utf-8?B?TVo0RDdsUWFpN2xNU2tQS3dJRFgzMTRia0xrVTJIYkY0MDNScUMyajRENTZX?=
 =?utf-8?B?eVJUeHB5cFZ3RUJ0U2M3UWdlT1BKcHhpYXdVbHBtZ25nVTcxNmgzQTVxdVk3?=
 =?utf-8?B?WXdRcXlPVktCYVFzdVhQVDBBeW9qdytnOUQ2Y00zYks3UitBajV5Rlk0L0pT?=
 =?utf-8?B?K2U4ekRjbEFIaCtNU0VPMTlsMnlJN3UzdEg2RDh3bWFTY3RsR1U2OWVGeXRB?=
 =?utf-8?B?a0xEeDhDUlBFOWsxUEN4RVUrU1NmaXJuc1NmVHc4a1JGdGVnSHZ3RzI4aWJy?=
 =?utf-8?Q?EiukSUCb8pa0Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3YzVE1iemxOaU5QNVd4aUE0WkR0ZjhVVWI5L1UxZHFYM3k3dkJmSEp1S3Zw?=
 =?utf-8?B?WkFsK3gwK092bWlkMkdyd0tmWGRWS0pFMUQ4TWUxRUxqU20wNnBnVXl5MWEr?=
 =?utf-8?B?eis1NlpKekhrd2J3dVc1MVZLcWszeWVidFhPVitJUmhjSkJqMTQ0amUwOURK?=
 =?utf-8?B?d0I4c0JOTEprd01hZ3pValltYjhSTXp1SjhLVjNxYW82aExLb1djaGZjVXRX?=
 =?utf-8?B?TTdNMzRRZGJjbWJndjRwaytxSjhTYmcxOG5xQWYyeDNkZU9qVnlmb3BzdFc3?=
 =?utf-8?B?M0k2N29iUzdFYUlxRHN2bjlEanF2NFBtUklwV2Z0ZFFsNGp0SFJhSFl5cXBM?=
 =?utf-8?B?V29ESnVhc3VvVkFIaVVMVC93bEFhWURPWUxWeGMraDlGMzgrQjJsU3hlZXlX?=
 =?utf-8?B?MEdHYVBFWUx4MklmT050Z0IwU2FuckJxcVNPMzV4bHUyS3RLdEN5empLR1Ex?=
 =?utf-8?B?bTVOSk1kL3hGaGF2L3hUSzVyeFlyOHh0TTMxRW9iakVYUHVhNThNYlhRaVg3?=
 =?utf-8?B?RkRZSmFHRDkwR2dqSlYvYnhrd0hHd21hcGxMQURlTDlNbWFEK3kxNHpBV0VJ?=
 =?utf-8?B?RS9oNUhpbk1wMXRVaXllaHY1dkpYeUlxOVdFcUxuVjNjTTVrSStaN1B4TWY4?=
 =?utf-8?B?N3Z6bkZNTHVsNFpSK3VGdm9VMWRJVjBUbGN3cm95UUYzVmVRTGZiOGRpMUdK?=
 =?utf-8?B?T1J2NVlxUERLMDZSVW9VbTFxUm5UWDk1VHZOeUZjUTlPVUFNdS9lUWF3WUVu?=
 =?utf-8?B?bHc5cnY3OXc5b1E1cVB0Q29sNzN4UU01eUFBaEtrQ0xLMVV2RlZ4bUFBemNt?=
 =?utf-8?B?OGhjUk9oT2dvcUZEU3ArRGtxQjFsbzdWRXFxOGdjbWpwYzJneTBJdEVtOXlF?=
 =?utf-8?B?U2dXcytKVnhvOXdLWitxdEx4YVZYNFQ2QzhwU3dUdkgyUHREVWlsbjdkSUhE?=
 =?utf-8?B?akk3VVA5amZGdml0VFVMNlNxcUtkUlh6clgwSy9xN21uQ29hTTlVNW5oM0dw?=
 =?utf-8?B?OVpJSHl0L2U0dVp1ZUNPZmQ4MTBLaHowWnhqU2J6QzNlMDZ3RSt1dzBueGh0?=
 =?utf-8?B?RUVic3EzM0JNUGJEb29xWFBSb1ZKZzBIVmQydi92VzJBb3QwTUt6ZE8wdkE5?=
 =?utf-8?B?UzJHeUtROTFXZTNLR0hTV3I1VXFSQVlNVm1Sb1Z2VjNsNWdWTHZnV05VMVNm?=
 =?utf-8?B?dm83bkF0V3hmSGVFYlJrS1k2NUp6anp4ajdrNGRIWHgzZ1Q4eTFXTmZkNkN5?=
 =?utf-8?B?OFMzc2VwWjJDRXVOMEtiV3VXckxYN3VxdkF5MC81MldLbnU4N1FWYWVtbDFm?=
 =?utf-8?B?MEM4WWhmZSs2c2YxcmFYRWVGM1VlZmQvTEpMbjlLbGRHby9yNE1OcWRPS3lZ?=
 =?utf-8?B?NHVPZXdlbjZkMXNocG1rUFZSVW1WZFYyaGNYOXpQdnFqVjB4aW1YeFlxSDZK?=
 =?utf-8?B?UGkzQldqUnVuRUo3Rno1a2c1MGo0VmRrVlJtOS9qdmJES2RFdmpIM2wzUk9I?=
 =?utf-8?B?M3VNRHlFYnUrMmhBRlZQY2VoSkh3SzNQaldEVS84ZCtzL1YvdVA1ZVJrdmFl?=
 =?utf-8?B?ZUVpcVZNelo4ZS9lUUdVM0RnUmQ0eVB1ODA3TDBWbnB2Y0U2ZjJtNXp6WVBD?=
 =?utf-8?B?ZTFVMzFQT09NUkttVlhCV0lOWEJJNkY0RU5PZGNIZXFJckF3bWl5aVdaWnJQ?=
 =?utf-8?B?ODVzdGN0ZUdLbkhsNGNWd3BBaThIS0Fucm5MYXUzZ3VGaG5HVThuZmI2Q294?=
 =?utf-8?B?eFhNZGNSTFptQTNsc3BJQlR0L2ROM1FxaHZVMmwyanNqTGNYMnpOTkx6a3Y1?=
 =?utf-8?B?bDlrZnhEYVNpQ0FuaU9yYzdMYjZJSE5BbjNEbUt4VFdPN3NVd3VScWxheU5q?=
 =?utf-8?B?Y2FZeExSTHJkUjZDcjlrdkVFcjR1N3lET29SWmJDamZuVXpsOFk4V1ZzTTBS?=
 =?utf-8?B?ZFBJN0k0cVBQc1VHL2svMU1mYUlsRWxtMzBrVEsxVVRaNVFwenZQYndMSlVY?=
 =?utf-8?B?RGV6ai96Lzh1K3NyNHdtRCtPMnd0V3ZvRTFvSUh4dEVIRkZEUzNUb0s5dytr?=
 =?utf-8?B?TTFaUjcxNGV1SGxES1ZtajNpMFRnTCsvYWJyVkMwMWpTNEpndW9aSXR6NzRv?=
 =?utf-8?Q?Yr49j/V/Gyow9zNU3JZitNrAc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667efe30-e0b3-4751-2976-08dd98411e5c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 08:26:00.8899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icaIcmPP27yPrJ57t1A0cDVmpIlTNWlLXvNPP1/xMNM0mVNuRxeXS6uQEq2Kogoy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8192
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

Sorry for the delayed reply.

On 5/19/25 11:04, Philipp Stanner wrote:
>>>>>>>
>>>>>>>>>
>>>>>>>>> Also, if someone preallocates and does not consume the
>>>>>>>>> slot
>>>>>>>>> will that
>>>>>>>>> confuse the iteration in drm_sched_job_dependency()?

No it doesn't. The xarray is filtering NULL and XA_ZERO_ENTRY values in the iterator.

As far as I know that is *not* documented anywhere and it took me quite some time to figure that out.

E.g. you can explicitly ask for a NULL/XA_ZERO_ENTRY entry with xa_load(), but you won't see it in xa_for_each().

>>>>>>>>
>>>>>>>> drm_sched_job_add_dependency() you mean.
>>>>>>>
>>>>>>> I was actually thinking of drm_sched_job_dependency()
>>>>>>> because
>>>>>>> that
>>>>>>> looked it would skip dependencies upon encountering an
>>>>>>> unconsumed
>>>>>>> preallocated slot, but yes, drm_sched_job_add_dependency()
>>>>>>> could
>>>>>>> explode
>>>>>>> even earlier if adding a normal dependency after
>>>>>>> preallocating
>>>>>>> a
>>>>>>> slot.
>>>>>>>
>>>>>>>> Yes, it would. All operations simply give you NULL for
>>>>>>>> those
>>>>>>>> slots. So
>>>>>>>> seems to me you have to check for NULL wherever a
>>>>>>>> preallocated
>>>>>>>> slot
>>>>>>>> might drop out. That would then be a bug.
>>>>>>>>
>>>>>>>> It's kind of tricky, all that. It's a pity that Wilcox
>>>>>>>> didn't
>>>>>>>> answer
>>>>>>>> our questions about the idiomatic way to do it.
>>>>>>>>
>>>>>>>> Maybe reserving slots with already signaled fences wasn't
>>>>>>>> such a
>>>>>>>> bad
>>>>>>>> idea after all?
>>>>>>>>
>>>>>>>> If we go for the NULL approach, it's probably the only
>>>>>>>> sane
>>>>>>>> way
>>>>>>>> to then
>>>>>>>> check for NULL wherever dependencies are accessed :(
>>>>>>>>
>>>>>>>> Opinions?
>>>>>>>
>>>>>>> Well if the xarray API returns the NULL consistently the
>>>>>>> approach
>>>>>>> from
>>>>>>> this patch is fine I think.
>>>>>>>
>>>>>>> We just need to add two more checks to the above mentioned
>>>>>>> functions,
>>>>>>
>>>>>> I need to correct myself, drm_sched_job_dependency() wouldn't
>>>>>> be
>>>>>> able
>>>>>> to
>>>>>> just skip NULLs since it relies on NULL for "no more
>>>>>> dependencies".
>>>>>> We
>>>>>> would need to track something like job->max_dependency and
>>>>>> terminate
>>>>>> on
>>>>>> job->last_dependency > job->max_dependency or so.
>>>>>
>>>>> Agreed, that would have to be fixed.
>>>>>
>>>>> I believe we should reconsider Christian's first idea [1].
>>>>>
>>>>> Thinking about it some more:
>>>>>    * With the NULL version, suddenly the xarray containing only
>>>>> valid
>>>>>      dependencies can sometimes contain NULL entries.
>>>>>    * If we could create our own tag, entries could be returned
>>>>> that
>>>>> were
>>>>>      neither NULL nor valid fences, also requiring checks
>>>>> 'everywhere'.
>>>>>    * Only the "signaled fence as prealloc reservation" approach
>>>>> is
>>>>> fully
>>>>>      backwards compatible and will never cause anyone to block
>>>>> after
>>>>>      later reworks.
>>>>>
>>>>> So maybe it's actually the best idea?
>>>>>
>>>>> Sorry for the zigg-zagg. No hard requirements intended from my
>>>>> side,
>>>>> I'm willing to go with what you guys think.
>>>>>
>>>>> Just saying, at least now I think that the already-signaled
>>>>> fence
>>>>> seems
>>>>> the most elegant solution. And since there's a function
>>>>> (dma_fence_get_stub()) for that, it seems to be in alignment
>>>>> with
>>>>> official dma_fence rules.
>>>>
>>>> Potential problem there was dma_fence_is_signaled() and fence
>>>> signaling
>>>> annotations. In case some driver is holding a lock over the
>>>> arm+push
>>>> pair. I wish we had a non-signaling is_signaled helper..
>>>>
>>>
>>> Yes! +1!
>>>
>>> But Christian doesn't like that direction:
>>>
>>> https://lore.kernel.org/all/20250409120640.106408-2-phasta@kernel.org/
>>
>> Thanks, I read this but ended up uncertain on the conclusion.
>>
>> For instance Christian at the end comments like this:
>>
>> """
>> You can test the flag if you know what the fence means to you, that
>> is 
>> not a problem at all.
>> """
>>
>> That was in the context of testing the signaled bit without 
>> opportunistic signaling.
>>
>> For me, from the scheduler dependencies side, that should exactly
>> apply. 
>> Scheduler knows it does not need to add a signaled fence to the dep 
>> array so AFAICS it is fine to skip it. And it may easily be 
>> opportunistic signaling ends up a problem for the scheduler.

Well that was not what I meant.

The code which issued the fence can test the fence flags directly.

But the scheduler is a consumer of fences somebody else issued.

In other words we could do something like dma_fence_is_stub() or similar, to have a clean interface. But please no testing of the fence flags in the scheduler directly.

Anyway, we don't need it. The general assumption that the xarray returns NULL for the iterator is incorrect. NULL entries are simply skipped over.

Regards,
Christian.

>>
>> So maybe such helper would be okay after all.
> 
> The thing is that, if I understand him correctly, Christian doesn't
> want a helper. He wants "us" to just use test_bit().
> 
> My point is just that dma_fence_is_signaled() is a horrible name.
> 
> The function pci_is_enabled() tells you whether the PCI device is
> enabled. What it doesn't do is
> 
> bool pci_is_enabled(pdev)
> {
>    if (crazy_callback_is_implemented()) {
>       pci_enable_device();
>       return true;
>    }
> 
>   ...
> }
> 
> It's not intuitive that a function called "{something}_is_signaled()"
> does signal that thing. Although I get that the syntactical idea
> probably is that from the GPUs POV the fence is already signaled when
> this or that seqno has been reached.
> 
> Anyways, judging aside, if a wrapper for test_bit(dma_fence) were
> acceptable, then it would need to steal dma_fence_is_signaled()'s name,
> and dma_fence_is_signaled() would have to get a new name. Which is
> precisely what was rejected, as I see it.
> 
> P.
> 
>>
>> Or if the concern is helper might encourage some potentially unsafe 
>> usage, in that case it should come with kerneldoc describing. It is
>> not 
>> like review is guaranteed to catch someone using test_bit directly 
>> anyway so for me, on balance, helper is always better.
>>
>> Regards,
>>
>> Tvrtko
>>
>>
>>
>>
>>>
>>> P.
>>>
>>>>
>>>>
>>>
>>>
>>>>
>>>>
>>>> Anyway, I think both options are passable. I even like the NULL
>>>> entry
>>>> slightly more since it is simpler in a way and I don't mind some
>>>> extra
>>>> checks completely hidden in scheduler internals.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>
>>>>>
>>>>> Philipp
>>>>>
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/all/20250318120313.19099-2-christian.koenig@amd.com
>>>>> /
>>>>>
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Tvrtko
>>>>>>
>>>>>>> some more unit tests probably to make sure, and that should
>>>>>>> be
>>>>>>> fine
>>>>>>> for
>>>>>>> now.
>>>>>>>
>>>>>>> On the bikeshedding front I would perhaps suggest:
>>>>>>>
>>>>>>>     - drm_sched_job_preallocate_dependency()
>>>>>>>     - drm_sched_job_replace_dependency()
>>>>>>>
>>>>>>> Reads a little bit more aligned with the rest of the API
>>>>>>> and a
>>>>>>> bit
>>>>>>> easier on the eyes, to my eyes at least.
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> Tvrtko
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

