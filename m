Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA708A89DFB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C384610E76D;
	Tue, 15 Apr 2025 12:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KxWbmgzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455D910E76C;
 Tue, 15 Apr 2025 12:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDnGby5MKbQhTE6dXW2razbmRXH81uNxuiW2hGGA6OKTgZvBzIDY4YWq5iPWWQ1u8U5IOec2fFXhkNovLhB9u76reYotOIqt7GuKDzHBeSFJFEzrg+ft/ftCEPgOe6sT7wYP99j7yGB2gJApZYAQZ3iAwetFJ+cr9hjGdY24bs802dtjr6oJWFYWzJrXl8ItLglYAkCwlaKA8jlOe3lpwWZI7LOipTL17M2LK4tQE5ByIJh29c4o8ty1QLfMeHSN3fvC6AeZxPl78tIkK/WEl+3TQTHBFXKTCUn2sAj/z55u+KrU9E4tdu+q0kL5jFMBELGwG8I64ze1G2N06PBGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhEYmCUj71azmqVx7xoB6RitQd3BKWHZ+4paRCO0O+k=;
 b=HxBcaQAfn5c2rkSb4MXBtDQ80pA+ieIWl1egdQk9K9g5PGU/7H++nwYawM/Fe/1WwMJITtptD5Rar2Ah8I7ZfWQqPTVxsYLEvI6gGQqk0631L9NOXKQ78qZOL/jZmWUL3iDzOrkzFrsqZUaLenSb6vtR3ZpPXVV6bbohOsssUrr00jgE7HJ5JoyCkl0Wve5tyU5x0DdxREDHFYTHe+zv3JZKjaWq+/YYmz8jX0W8n0Vf1Rj+hG6sLXlhfALEfYDJI8e7vJS9JKaHohakp0bpzqWthhhyiK7dJFpeVyHgdekcw6Y38nUqil9UGfHHOy/p399VufdaO9UX4HnKI6bc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhEYmCUj71azmqVx7xoB6RitQd3BKWHZ+4paRCO0O+k=;
 b=KxWbmgzfKTVLvgINsww7dbiFzC62l+w1SfQMnB6c2uZdigZpH9v1bLKVc03su1W7WBzxNg+3FGSItCbV5wnifvHyihJh0+tIGgx/2j26Nba7ZHHeL/O9mYA43zFDDON+EzZev/KKwiN84HzNIetGx1qruGy7W/bYMWIryrgQk+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB9056.namprd12.prod.outlook.com (2603:10b6:930:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 12:27:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 12:27:05 +0000
Message-ID: <281f49fd-b5de-4346-bac8-861d3e3d8828@amd.com>
Date: Tue, 15 Apr 2025 14:27:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm: function to get process name and pid
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415112550.297292-1-sunil.khatri@amd.com>
 <c7bb4a85-dce7-410a-a2f0-16fe7b5c0c3a@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c7bb4a85-dce7-410a-a2f0-16fe7b5c0c3a@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: 45492155-a05c-472c-ebf5-08dd7c18d521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUo2TWI4c2duZ09tMHA3Q2plN3hMaVh1T2xtdXNMdlhiTUc0OGxKYjk2YW1o?=
 =?utf-8?B?a3d3SW95Nm9rYXRLSGJTS1ovQkMzTlZ3ODJJRlRzMjlvcmhGVmg2bUxzUkVi?=
 =?utf-8?B?VnhTb2o3eXZiNWxoU1hENEJDbHZ6c2pUWEsxL0JXNE9JNmNoVHdnSWpkVmJu?=
 =?utf-8?B?amFzOFVwNlY5YWNCdG9CK1BBTmNNRlRzY3JzK0ZQSjZBWG1SNVpOM3pQZjAx?=
 =?utf-8?B?S3c1VzFuUGxmaktsdkRtZHBkQ0VKQXBwVk1rMGdZVTVia0FQU3Vjc3pHS3VF?=
 =?utf-8?B?eGFvZHdhM01FMnJZSHJwRFY0WE1JOG8rMDI2UGdLdjhNaWRUcDBoMzFSSGFJ?=
 =?utf-8?B?anZtRjBmNDFyUTVqblphNWxZampvdlRkWExFam5FOTYycGU5UjZjQUd6Q2xN?=
 =?utf-8?B?Q29uZmJGbmh0OSszdnhldWZjZDM1ZEYzNEdTV1F3NitIU3RpeUFUZVlLYmt1?=
 =?utf-8?B?SklwU29Sd3NZeEFKQmhoem9tdGFvMGg4ZDhpaU0rN0JKQ0JvQlk5WHc3ellI?=
 =?utf-8?B?L01HaE12V2NtVzhBc2haSzU0cE1NK1p4d3prUGFhbEN0NVV5aEttbzY4UlZB?=
 =?utf-8?B?eGQwaGx2dHkzaUdQV0dBQVpNcUtRT2xCTEV2WFVhdlFFMG5QMmZMaGlKSVJY?=
 =?utf-8?B?UnI2bHByRTdYbHd1VkVBZk5oUW1HVjBQeUxJUHZyZ3Z5czVYczhsQ01Ud0sw?=
 =?utf-8?B?YlBBS0xXOUhkTlVzRm0xWTFwaURFSWhYa29MeS9pYmp2YURJdUZOQzJTSTdk?=
 =?utf-8?B?WmdhSG5OY0J3ZzhpVzQ3MDBNUUh5cklCQ0ZwczRodWlIbVBNVUJOclpqYnJK?=
 =?utf-8?B?QlBneFNKOXJRS2VaOHpXazhiWVVPVlVOak9Za0FLaVpHMFF4VUtQNTJxMnBq?=
 =?utf-8?B?dE53eER1NGpjdjNMYXJuZUtkMFUzTXVzQTBRZTBXVHYxcGd4MFlIWFVUK1JV?=
 =?utf-8?B?RnVSZXN0Q1puVTdYRTlGS2dEK2NJcW1HQmpYTmZqQ2ZkbWxHUmxsYXNnRnEx?=
 =?utf-8?B?US8yWlVleVhqTUZ3RVJpM2lXV0d0QjdEQnZDNWo4c050Z0RrYnMrbWZFbFFs?=
 =?utf-8?B?MXhvMjNGWEJPOWFyS3Nmclhhd1FWWDdpOUE5T0ZHYjUrVlVlaXpCMU44aHkw?=
 =?utf-8?B?YzgvSVVPRUd1TzArSUNzYWxWTDdXWDZnR0RTTy96bUM5bW9WVlBRSDZ0cjEr?=
 =?utf-8?B?QkJ4ZEFTT3U2ckJIa3NSRlhmS1FhUTJVOU1IS013M2JzQlRnU2YwNHRrb2ls?=
 =?utf-8?B?MGZHVzhBUDREWktmazVXNXRNcG0zMjlnZmkzK0dkY2cyRS8xQ2Nwamd6d09S?=
 =?utf-8?B?RG16RmgyUENqRzFIWEpyN2RQamVlTFAwYTdBemlzRHk0TnJQN1NUdGlDWW0w?=
 =?utf-8?B?WHZvci8zcnM4K0JTU0VJV3gzUkUzYjRPd3lJOHJEZENwSEhvS3ZIS2gyMCt1?=
 =?utf-8?B?U28xNWxaaUhHUkdqMUx2dHpMVEZMNXJ3Yys3eDJWTzFyb2YvajVJMVVjaGFF?=
 =?utf-8?B?TjhpMkdtV0lVaGRhSmcrZnBzdVY5L2V4Sml0ZEtPT2ZzRGo2Q2NYYTM5L0U4?=
 =?utf-8?B?ZW9VTk9LRUhtNDAyRkY4bFk2NERSM2RXaHdLemF6VzJhYU5BT3h4Q0hCL0Vx?=
 =?utf-8?B?QXNMbzB5T3J5c2t0NExPZDkvZlFQVlY4VmZZdS9zYUhEcmpKRG1lMUxCM3FR?=
 =?utf-8?B?ODhIMldTUFVZblFxSWtsL2k4a3BMM1lzMFpSQUg0UW5TeGkyc0IvTnphaXNX?=
 =?utf-8?B?QUdhWTZMKzZzTldOMFB1ZFoxUk1pdzRmZHRwSmhZZWI3VU5hcXpNVEs1RUpz?=
 =?utf-8?B?dG1sM0wvMUlONkxTbDJkL3EzSDJzQS9QMnJpL1RzWjUwS3NyK3czdHpFaW1s?=
 =?utf-8?B?YVJaQzJKU2pkRWpQSGtSRG9kSS9QMTgxaXpNbHhuZlg1UnBIOE54V0Qvc2tR?=
 =?utf-8?Q?jHWY5VNBswM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1RibklPWm1FS3UvT2lYY2Z3TWNOb05ZcmsvQVkwQ0J5Skp3NjJrZXhLR1ZS?=
 =?utf-8?B?aXJhNzYxZDE3cjg1c3o4MC9YRE40V1l4U3Z1Y0hSOWwyelROY0NxTmZJOEhE?=
 =?utf-8?B?NE9LT25VZkI1T0ZFQzJrZ3BuVmxJNmRzb2tuYTQzcUZhUDVPV1BCV3BrWm5M?=
 =?utf-8?B?OW5ERm5tNjZybzFqQkJxZjdnNmQ3TmJlcWFGNmhLeWlnVnNFSEIzdVRmUDU5?=
 =?utf-8?B?NWg5U3pKeFk2bENWdVg0ZWFEcTFHZ3hjT0lSVmdaRHZPVEV2eEZOVjNKSHhC?=
 =?utf-8?B?QTNBb2U3UTRrblpFRDNybTR6REM3QnU1N0hoVGN1clhERHcvRGU4dUExaVJN?=
 =?utf-8?B?bnhPNHR3Y2dJZGJIRzBRUmVleWpjQ3NZVmNNZlliTnY2OStaOXZaNVcrMk9i?=
 =?utf-8?B?bkdwNDJoRXExa0lqbTVOd09KZWI1bWNZbDlnVWdPaGYwSXRKdWJ5MDdoQ0J6?=
 =?utf-8?B?QVEwKzJka1A5R28wOEFuenhCR3kwK3hRZTUrQ3ZsK3I1TC8rSWsxb1AwdUQw?=
 =?utf-8?B?Q3NtcEJwVXF3SkR5RmVITWNrc3dwa0NIZzN0VkhqTVFIK0dNWFVNMWYyOC9K?=
 =?utf-8?B?T3hHTERZUTFTSXplWWJZelFkNGMrcW14TnlQc0orWERZSEVMR3NyK2FldjBO?=
 =?utf-8?B?OGtzNEZpRjBnL21pbHhtTXZ3RFdmU2tQU0ZnNUJMQWhHaFJGczd0MVlveGtn?=
 =?utf-8?B?WWtteitkaFVtY1BKMlBhaXB1SThWOC9IMC9NZkc5cmhkeC9Tdm9pSXJIc1ZR?=
 =?utf-8?B?Y2c2STlwWVJZZ1REQjltUEVqaS9RRXlpTUNTUFdIeTdybjQvdklzZnJRWXAy?=
 =?utf-8?B?Z1VqTkM4anVEVStWdHU5bElqbE5lanNqTXZuMllkQURnM3VoL25lYUhOeGhl?=
 =?utf-8?B?MVJKeG5wVGJmaTU1RnE1WE9ndUVaTGVOWHRCZXJLRlN6amZFa0NTVlFNZ0w5?=
 =?utf-8?B?cDZMRzZrK1I4d2cxaVhQZEFUazQ4L0lJd05hY3JwQmREZWZ1d3F2MHlaOEFs?=
 =?utf-8?B?bTJCYUIyWnQxeUwrUjIrcnFlTTFybFBBcHYwZnFma0RSL0lzNGpzd1IwYkFH?=
 =?utf-8?B?M2orZ2gxbWNWM1RhSnBKVyt4eGJxeEpOWTFPbTFjOXhtQ1EvczhWcXRhZ2ts?=
 =?utf-8?B?dUhvSmNKTDNMUkZBdnhPSi90T0lUdkpjNkN4cVBiNUFLcXE2VHh6eFBPMG9Q?=
 =?utf-8?B?Y0c2UG55VDlWT0t4elVHVUFUOVltOTNjQ0Vyak4xZWZVSWN2ZDFyZytIMVAy?=
 =?utf-8?B?R2Mxb3VDKzJhQUxkVEVod0dFR29hREVNeW9uWWpzS2FGMkw5Z1JuRDJMTnln?=
 =?utf-8?B?M0NtNSs0czJiMk9iUU9kWEZGNzFLbE1NcENhYlNEdmNqeExza2UzYnUxeHcw?=
 =?utf-8?B?dGNZNDlCUk41Z0RuNjdOa0p3Ym5RZEtNM1lwUHd4NXUwYXIrNm9tanBkcm5E?=
 =?utf-8?B?bVMydExhMGxncHRvMlM2WWxmMDJuZ2pBMkRwSW52NU5ocytybXJVNUxCT081?=
 =?utf-8?B?Qmlmc1ROVmZNbzh3MnVqU0ZQQXlUL1A5aEUvSHQrdUI4TGNUWE9vSWR3bVA0?=
 =?utf-8?B?Ym9tTnJ4RVJHd1YzSkZpZzN6eHg0bk9Ib2FRMnd0NzFiSldHeTV2c3J3WFQ5?=
 =?utf-8?B?SHpTME9scnI1dG1ndDl1eFFKSmJZbjBNVkM1R0hKWjlPNHZ5V041RVM2WWph?=
 =?utf-8?B?R2NkMlRlV0t5dHBzZzlhYVp2NURYNk4rQjRoNmpWMnlUT3YrMm5BbnhUM3Vy?=
 =?utf-8?B?MThUSzIyalRzVnlUMjRvdFpXYmlCZ1N3RDJPazJDdUFZWUVxbGVZcTFPOUZj?=
 =?utf-8?B?eTZyOWRvT1RHNE5FdHBSTjhlVmFnb3BlVm1kTUY1dW1lKzJBd1ZHekR1amY3?=
 =?utf-8?B?aXJiV1VnQXU3SzFpU0RaMkxPc0dXdTZBNWRyOTd4NzJrajdBazZ1a3BhSEVW?=
 =?utf-8?B?K3NMbzdyV2xJRDhnVWJXWXk5SndjYmJtbFdoQmJkYzFJQmRkQW9jeHNrQTdz?=
 =?utf-8?B?RzJCL28ybGtGSjM3UkR0OXBxTWxlZ3RidFNFcCtSRmV1enVPZVpMYUNMM2Vh?=
 =?utf-8?B?TCtwamJjd2h0MkZmaFB3dHB3c0ozRXcwak5WaloyMVppRmprVkVybHdadWMw?=
 =?utf-8?Q?IeR31kYdtlN+fN7jqGThPIxXO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45492155-a05c-472c-ebf5-08dd7c18d521
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 12:27:05.4936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDIUpohbQl4GsvuJaM/UfhkB+4e0+RyTnlR6m6Al1pY8nsX6DJron83B4yCrx2HY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9056
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

Am 15.04.25 um 13:40 schrieb Tvrtko Ursulin:
>
> On 15/04/2025 12:25, Sunil Khatri wrote:
>> Add helper function which get the process information for
>> the drm_file and updates the user provided character buffer
>> with the information of process name and pid as a string.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
>>   include/drm/drm_file.h     |  1 +
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index c299cd94d3f7..728a60975f5e 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>   }
>>   EXPORT_SYMBOL(drm_show_fdinfo);
>>   +/**
>> + * drm_process_info - Fill info string with process name and pid
>> + * @file_priv: context of interest for process name and pid
>> + * @proc_info: user char ptr to write the string to
>> + * @buff_size: size of the buffer passed for the string
>> + *
>> + * This update the user provided buffer with process
>> + * name and pid information for @file_priv
>> + */
>> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size)
>> +{
>> +    struct task_struct *task;
>> +    struct pid *pid;
>> +    struct drm_device *dev = file_priv->minor->dev;
>> +
>> +    if (!proc_info) {
>> +        drm_WARN_ON_ONCE(dev, "Invalid user buffer\n");
>> +        return;
>> +    }
>
> I think this should be:
>
> if (drm_WARN_ON_ONCE(dev, !proc_info))
>     return;
>
>> +
>> +    mutex_lock(&file_priv->client_name_lock);
>> +    rcu_read_lock();
>> +    pid = rcu_dereference(file_priv->pid);
>> +    task = pid_task(pid, PIDTYPE_TGID);
>> +    if (task)
>> +        snprintf(proc_info, buff_size, "client_name:%s proc:%s pid:%d",
>> +             file_priv->client_name ? file_priv->client_name : "Unset",
>> +             task->comm, task->pid);
>
> Probably bad to return uninitialised string for the !task case.
>
> Also, now that you added client name the case to move towards the helper which does not need a temporary buffer, like I was suggesting drm_file_err(drm_file *, const char *, ...), is IMO even stronger. Consider if nothing else DRM_CLIENT_NAME_MAX_LEN plus the length of other fields you will be adding (the series as is can truncate). And it would be a bit unsightly to require relatively huge stack buffers in the later patches when it can all be easily avoided.

+1 for the drm_file_err() approach.

That is quite some nifty idea and could potentially be applied to quite some other cases as well.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> +
>> +    rcu_read_unlock();
>> +    mutex_unlock(&file_priv->client_name_lock);
>> +}
>> +EXPORT_SYMBOL(drm_process_info);
>> +
>>   /**
>>    * mock_drm_getfile - Create a new struct file for the drm device
>>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 94d365b22505..a972be73a615 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -507,6 +507,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>>     void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
>>   void drm_show_fdinfo(struct seq_file *m, struct file *f);
>> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size);
>>     struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
>>   
>

