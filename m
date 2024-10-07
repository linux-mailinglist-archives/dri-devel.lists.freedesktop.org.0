Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E08F992798
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 10:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989FC10E327;
	Mon,  7 Oct 2024 08:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rrV3gdnp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C544110E327;
 Mon,  7 Oct 2024 08:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wv/FqC0SlvTLSfwMiWrg/XENPsOiRWZ2d69OFAiTGyep8LHrGnJqwg/aV9Q3vBuYFFe5lgY8OeEFAjXUaH+25t9vr9Qj0ZI+nwGUhKnNgjitzzi3w3/8hgDQ+0xSDw3DxvFtL17TbFpXs3w+VeF7LM6jt4rLDO+aMwQVsY7JCY5OVqJMM+aPL8igkrcN8K+mWr4XnyWFS7/v9DL7DUtEoIwSkKIm19aTt/htIZS9UkWemppA7vSbuI5+2iJW6Sk07V2SXFq044ePazAA6VjZOxqD1lqmOONzTb+4F4dyIl3MasIZ5ZvCo86fNc/rOJ0vsQJEprrC1iNuLHPoubjcWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fdVTLtl3aNCpcHAmAYjYUf9GJlspFCCL47VYOpPSuc=;
 b=F3RGbB8e/DyEcW5BuS5bt37U8rgVD7IBdS+4YtF5TDX42oHYUsCKyi3kP7BEfqyj6ZxbqahINFaSdCDqhZtAxHpsoGyNn3sSYDVI214VVutrPr9FdldQ01RblgVt/LwbqUTuNTTE0TxukBy058lto3S9+pt/58PH038F95+u8iN08mQ/yPB9M3YXUqd2tcKBMjMnMf9oBE9HCuqmCCPJJ0/p1GF10bGpYKN0WpPd0EZYHGb9agee80gW7G/6Z+J/dIsWwgHzFQL4XJ9iLxw8QUkRlo6sfnCmrbeZ0fEQTT9hXE1isNs9KXfjh2osvpwPAJ+gqGzdIyM+fRxbIucgOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fdVTLtl3aNCpcHAmAYjYUf9GJlspFCCL47VYOpPSuc=;
 b=rrV3gdnpIJ3TkGIRQQFl+YT/yCAoBdhj6z3MeS8WTyJuy21HSChmSzvWeDsje+07JnCpI8o5qyNQ/vo3RISEZy13Jk4uXQZNOOlqf8JqOiT1Rtru2BFFgGnEcGVyCe6TmG2LsXBprLQeCw/9iduh5ckUUcaKCkikrVddYa41PFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8821.namprd12.prod.outlook.com (2603:10b6:510:28d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Mon, 7 Oct
 2024 08:54:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 08:54:20 +0000
Message-ID: <298da56b-7a16-404f-bbe8-c67a8653e178@amd.com>
Date: Mon, 7 Oct 2024 10:54:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: RESEND Re: [PATCH v4 1/2] drm/ttm: Move swapped objects off the
 manager's LRU list
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240904070808.95126-1-thomas.hellstrom@linux.intel.com>
 <20240904070808.95126-2-thomas.hellstrom@linux.intel.com>
 <91936a3d-b8c1-41f6-95e0-870fc1c2d007@amd.com>
 <e3c6ba4eb2349cb160996a913132e022af63abd8.camel@linux.intel.com>
 <78c687b5-2dd1-4d6f-a6c3-22769d75bbb6@amd.com>
 <954958e10350b5e1cd0a4197a4a0ea68f74b6470.camel@linux.intel.com>
 <a8d52d3f734f059c7a53461f3dfeccfac923d40c.camel@linux.intel.com>
 <d3dfe63c651b481ef2d56913660bdd2bd76123ff.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d3dfe63c651b481ef2d56913660bdd2bd76123ff.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b11fe0a-fc08-44fc-3063-08dce6ada184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3FuektKSTZYdTFrRjVaTVhlQWdROUUzb0d4MlNCcjRvUnFPT3JjazJZdFBY?=
 =?utf-8?B?SlVBVVBXYmZjdElkQUgrK21UTjFsZytCYVpLcFVGNnlvWDJENENtL0FDemlt?=
 =?utf-8?B?eVdQNFBPOVVIWFVDK1Y2dlBMY0NVUmI0dWpsL0hRNjA0aXRLcThwcDB1L2Vh?=
 =?utf-8?B?NVFnNWVaRE9LY2tmRHI1aldRUTdnS3FFMnRMRzVsRmdKbmZtUFFNQThXQU5n?=
 =?utf-8?B?UVVZY0o3TVoxUkNZT21RVUhvVGxacERpOVd0SzJNSGREYU9XVit2L0VzZHIz?=
 =?utf-8?B?bGliVkRMM0V3NEJTak83a2Z1R1lRaU1lVjh4N3JkTVNXZW5TZDQ4NWVGR1B3?=
 =?utf-8?B?aGlJSi9GQ2cvQ0U0eVNBelNuM3JFN20rMW5VZHlnNE1kVHVESDhibWJVaDZT?=
 =?utf-8?B?S0lCOTNVeC9PTUJ3OVlOc0lxSG1POVVwUlRxNXVsdGQyVUMweWg4Q0tjV01X?=
 =?utf-8?B?TXNkanYzNjR2WUowRFdyaVdUTUtmU0tsS214R2JENWVrQkVqODVwZHZ0VnND?=
 =?utf-8?B?UFl5cFlPK0VYWEFoSGM2bTVqdzcvZUJpRStjakI4NmVrbkJ0Zk13MGVDRWky?=
 =?utf-8?B?bEhVT0s1MjJHTDdLZEhiOHp0SVROaXhZc3EzL2RxUWJSRUNLRDNPQXlPOVdv?=
 =?utf-8?B?UldyT1dhL3NLN1NzMndEVkpHSk5wT0pGMkJNYkNUdTlZZVVYem9mUXJDdWIv?=
 =?utf-8?B?c1pKZDNpTWN2UjhQWWx1aWhxamk4aVJQWXR6aTIzbXJjMzc0bHVIMnZxU2ZD?=
 =?utf-8?B?bzVONjZuVnNOaDhRbkdvNVBmRXBjMGY2MmE5LzRUaTZ1K1VUN2JpK21DYmxh?=
 =?utf-8?B?akZTUm5jQ3V5WldiV0Zybm5PcUxwd2J5OHZodTNCblZTTGhwK1JUVlhwTGFB?=
 =?utf-8?B?VXhNaWpacVpQZkVQL2RrVWg0b0tCeFlPMTBUbklEN2Q5VThjamJ4NXYzaTVB?=
 =?utf-8?B?dW0rb1I5dUxuL0poYlA4cjlnSVB0Y29XMmtrOEZNdWpmZkY4eUxRK3d4QmIz?=
 =?utf-8?B?aWpMS25kaTN5ZSswWG9aZzY4NGtBYXBuUzZxZE9pRHNmSzhmeDdMR292UE4x?=
 =?utf-8?B?K2UrblpkdVQzK2JzOC9BOHg2YTc0czNEcDUvZnhLUisyK2hzbEZTMkYwM0JV?=
 =?utf-8?B?UG1LcDJtQ3BXOXBVdWNmaDlMZXc1RHI3VzFtMGJqbXFLdDZ3MTR5WHVicFJw?=
 =?utf-8?B?ejE3M1ZIYlI2TUg4TDBuRk9qVWhJTnEvY2tQUWk5SnZqYlozZjRYTXRDTmpJ?=
 =?utf-8?B?cmxDek9HTnltUENtelV6bmZuaU9pT1VOSWxMQmtYdytqOTlWeUhPSGV5TE00?=
 =?utf-8?B?YStDbjNwaVRtSDhHMDBURmJteWU4MHo5ajNJaFhmZk1kc1pmS3E3eHhBZnVI?=
 =?utf-8?B?S3prQVl2N0pmT2JkMHVWa0t6aFRMYUdhTVV0SXRaQmtRdEYwdHh0anRNWW5G?=
 =?utf-8?B?YlcvbEdJWWZMdnc3Y3oySGRjS25UTVRydlg3TWVFSTFoQktJYWF0WDRMekpE?=
 =?utf-8?B?bVlFMlRmd2RGUDNLdGRKVHBEOVg3U2MrSURRUDBWTm1UVDFremRhek9aaEJv?=
 =?utf-8?B?UjlQQ29QdWZVNzdwUFNEcmdQSmhuTzZpUGE0OTNJdVJkS1VBNE50NENSZkdt?=
 =?utf-8?B?SXNUcllRMmRaK0xjTHRQWkJmbURsOTUxcXJDVlQvUTM4NG9TL2h5clRGOG43?=
 =?utf-8?B?N25GMDNydWF6N1kzVUxoTW5mdW9DY1RHZW9vMFlzVkpFWURweUM0RHR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE9PS3dQU2J1T3p2THo3akU2Y3pueDIwRWFncmZCc3hHQ1pGaEY5QjhMTktp?=
 =?utf-8?B?N3QxTmh0ZG85aE9WWWIrVXFJSEVIUDBPSXZMR1Zuc0R5SFVBakVUSGFNQ0Nx?=
 =?utf-8?B?cGZFZTJmSnZYc2tjbytZNWlIV1kvUzZVSnFvSmg1ZEtweUJWM2JwaFNrMzVj?=
 =?utf-8?B?NXRtMGRjT3htbXFqbXkvUHpIVUlZR1BPQVovN09HMUNJM1dLYi83QzNjNkl0?=
 =?utf-8?B?NThSYnlBbW5UaDNPQ3YrQnJKWGpoalBQa3c5WFhxNk1MYzFEMWc3YU96TGhF?=
 =?utf-8?B?bG8rNm4yWTVOMzZHaE83bUJNVzM4WWU5ZEY1cTVPY2xLTnpBZ0NlQ21ZMEFh?=
 =?utf-8?B?ZVJodW03Y1U0aUlPZlZQaXBHZ1VKb2R0aUsvSytTaW5qUnRRNW9tOFNOUzdO?=
 =?utf-8?B?QnFvTG1abDVRWHIzc29ISThpbG9RWjJCOFladFdNbEp4YVVodS8veXBOMVVS?=
 =?utf-8?B?Y2xHUklHYUZRelVLby9QU1VCejFLQWlXRXZoQUZCMVpsTElhVWk4REQ1SWtT?=
 =?utf-8?B?MFMxNlZlUWpnanpmK3dRZzluMk9jNU1IK1RPQ1dibENQVnhxTllhcUROSDJB?=
 =?utf-8?B?ZWpzYXFKbFZMYkx1MWw0ZE5mNXFpSGJXSDZCMXl4M0VlZUphRng4Nm9ibEZk?=
 =?utf-8?B?RUZjWm5mNVpHNUk3WElrN1VieDkwZTR0UTNLemd3blpVc1cvNkJ5ZElPcnlP?=
 =?utf-8?B?NGFMOHYyclNwV2lOOGRxK1pkeWo0YUM2V08rK2hIaWtOK2dKY2xzQkN2cWx1?=
 =?utf-8?B?Vll2cHVlNjhRUThLMzhVdlVWRTNKTlJiVzcrR2R6ajdSUlZDNm1DalJIclFz?=
 =?utf-8?B?TjEvMzFqWXc5NjE4cWFtS3lMQk9oRG5ESVlnVUVDVlJjZStkWVdnQ01DSEVR?=
 =?utf-8?B?RFk4ZkNkOFJuVFVrSVlQZi9lK1ppUmlYeFdkS0U5RnNYVDY2Nk5KYUIrWEhi?=
 =?utf-8?B?VjlKT2JpOUNaTVA5TVUrVldQOTd2ZzJGank2aVVZb2RKcm1vTnhRVGQyc3lN?=
 =?utf-8?B?OHBUY0I1ZXlIdngwZnJ0cWU4clc5Y3NXS0gvcXB2SzY4N0wwdEcxQ243QlZy?=
 =?utf-8?B?K1VCMzlBY1lGbWluWHBrdlJackVsY0xnWjF1dVhvbDVKNHFJOW9TL21QNmdN?=
 =?utf-8?B?SzQzNUxJdDhMRWNIU3Q3dkZuejBtN21ZMExvQS9oZ3R0S0NpSjdVZm8vWm1O?=
 =?utf-8?B?MXRBc2tNcHBlWG1ja1FlWGkvRVl0MWQ2YVNKR1AyWnZLenhIMmFJY2JYaUFS?=
 =?utf-8?B?UTg3Rk1MQ0VpS0lNRmVydWcyQk5JbFVVbUlobzd2MlQvbjJ0SlZUTXdMQmti?=
 =?utf-8?B?YjVhMGJuVVphN0hvQmxFeitUNlJxWi81cFlMOWdtVG5maHFWK0dPL1h4SlNB?=
 =?utf-8?B?V2ZhRjNwRE9WMXdnZ29tck53TUk4aHJmNUw5M01raGZ2cEdwcThuMzY4eUpk?=
 =?utf-8?B?SjV3RVJvM1NXWVdZbkZYcmlLM1BLZFBESVcvSVl6dVRISEZWNklIdm1kWWRz?=
 =?utf-8?B?ZkZVNHdiRkdGNHlrQ2F3bG1wRElrdXIxQzRTNy8vM1B0d21XbEFvM0szN2Rl?=
 =?utf-8?B?aFRKQlJkQW94dG4wY3ZFTnExVDVnQ1dadmx4VmJEYjUxN09BVkpJeTRYcXEz?=
 =?utf-8?B?a1EvSE4yc3FmQnJjNE1Kbm5rSW9oUkRQajhxUnhUTy9BbnBpTm53Rkk3b0I5?=
 =?utf-8?B?QXlOSGNkK0ZIUG4xNnMydCtVTmx0MDJqYWNPY1NYNWNaeHk2ZFNiM1JXd2Zw?=
 =?utf-8?B?TzNQOTdFVks5Q1hZZUtaOE04UmUraktTak9hNVRkS2szNGJhb0hYaVNQNElP?=
 =?utf-8?B?TytTWldBbzl3WFR3amlzUTJIazlod0daQlF4YmJBWERxcjNnem13V1grNE5o?=
 =?utf-8?B?NXNxcC9QYWw4a3FxaFowWE5PTzlwREMyc1ZPVzJHYWFYVHZTdmxSWDJLNlFz?=
 =?utf-8?B?ZnNjMFdqWFZXNXYvcHBxdVBCbjVSOGt2cFVxNGd3dEQ3OUhGQkJYZHkzRnlz?=
 =?utf-8?B?SGZaUGM3NGNTcXhSUXBJeHREZkU4ZGdrdTRBSzVwcTYyd0dpdTU4aU9qMWpa?=
 =?utf-8?B?KzRoeDEwSTNjZGFYMmJLbVZVcHh4KzBtNDRtWmgwOGZpcHA1M0lLZzMwK2hO?=
 =?utf-8?Q?uGQ4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b11fe0a-fc08-44fc-3063-08dce6ada184
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 08:54:20.0643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSG+3fZp1RZU6+fqgf0ihiDQVJncbw8s7I/IUz2bj9vdI4+gqjf0F+9ORe+0Cs6B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8821
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

My r-b still hold for this series. Please merge it through whatever 
branch you are comfortable with.

And sorry for the delay, I'm still on sick leave (dentist problems).

Regards,
Christian.

Am 02.10.24 um 13:44 schrieb Thomas Hellström:
> Hi, Christian,
>
> Gentle ping on this one as well.
> Thanks,
> Thomas
>
>
> On Thu, 2024-09-19 at 17:24 +0200, Thomas Hellström wrote:
>> Hi Christian,
>>
>> Ping?
>>
>> /Thomas
>>
>>
>> On Thu, 2024-09-12 at 15:40 +0200, Thomas Hellström wrote:
>>> Hi, Christian,
>>>
>>> On Wed, 2024-09-04 at 12:47 +0200, Christian König wrote:
>>>> Am 04.09.24 um 10:54 schrieb Thomas Hellström:
>>>>> On Wed, 2024-09-04 at 10:50 +0200, Christian König wrote:
>>>>>> Am 04.09.24 um 09:08 schrieb Thomas Hellström:
>>>>>>> Resources of swapped objects remains on the TTM_PL_SYSTEM
>>>>>>> manager's
>>>>>>> LRU list, which is bad for the LRU walk efficiency.
>>>>>>>
>>>>>>> Rename the device-wide "pinned" list to "unevictable" and
>>>>>>> move
>>>>>>> also resources of swapped-out objects to that list.
>>>>>>>
>>>>>>> An alternative would be to create an "UNEVICTABLE" priority
>>>>>>> to
>>>>>>> be able to keep the pinned- and swapped objects on their
>>>>>>> respective manager's LRU without affecting the LRU walk
>>>>>>> efficiency.
>>>>>>>
>>>>>>> v2:
>>>>>>> - Remove a bogus WARN_ON (Christian König)
>>>>>>> - Update ttm_resource_[add|del] bulk move (Christian König)
>>>>>>> - Fix TTM KUNIT tests (Intel CI)
>>>>>>> v3:
>>>>>>> - Check for non-NULL bo->resource in ttm_bo_populate().
>>>>>>> v4:
>>>>>>> - Don't move to LRU tail during swapout until the resource
>>>>>>>      is properly swapped or there was a swapout failure.
>>>>>>>      (Intel Ci)
>>>>>>> - Add a newline after checkpatch check.
>>>>>>>
>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>> Cc: <dri-devel@lists.freedesktop.org>
>>>>>>> Signed-off-by: Thomas Hellström
>>>>>>> <thomas.hellstrom@linux.intel.com>
>>>>>> I really wonder if having a SWAPPED wouldn't be cleaner in
>>>>>> the
>>>>>> long
>>>>>> run.
>>>>>>
>>>>>> Anyway, that seems to work for now. So patch is Reviewed-by:
>>>>>> Christian
>>>>>> König <christian.koenig@amd.com>.
>>>>> Thanks. Are you ok with the changes to the pinning patch that
>>>>> happened
>>>>> after yoour R-B as well?
>>>> I was already wondering why the increment used to be separate
>>>> while
>>>> reviewing the initial version. So yes that looks better now.
>>>>
>>>>> Ack to merge through drm-misc-next once CI is clean?
>>>> Yeah, works for me.
>>>>
>>>> Christian.
>>> i915 & xe CI is clean now for this series but I had to change patch
>>> 1
>>> slightly to avoid putting *all* resources that were created for a
>>> swapped bo on the unevictable list (Typically VRAM resources that
>>> were
>>> created for validation back to VRAM).
>>>
>>> So question is if your R-B still holds. Series is now at version 6.
>>>
>>> Thanks,
>>> Thomas
>>>
>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
>>>>>>>     drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  2 +-
>>>>>>>     drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    |  4 +-
>>>>>>>     drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  4 +-
>>>>>>>     drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  6 +-
>>>>>>>     drivers/gpu/drm/ttm/ttm_bo.c                  | 59
>>>>>>> ++++++++++++++++++-
>>>>>>>     drivers/gpu/drm/ttm/ttm_bo_util.c             |  6 +-
>>>>>>>     drivers/gpu/drm/ttm/ttm_bo_vm.c               |  2 +-
>>>>>>>     drivers/gpu/drm/ttm/ttm_device.c              |  4 +-
>>>>>>>     drivers/gpu/drm/ttm/ttm_resource.c            | 15 +++--
>>>>>>>     drivers/gpu/drm/ttm/ttm_tt.c                  |  3 +
>>>>>>>     drivers/gpu/drm/xe/xe_bo.c                    |  4 +-
>>>>>>>     include/drm/ttm/ttm_bo.h                      |  2 +
>>>>>>>     include/drm/ttm/ttm_device.h                  |  5 +-
>>>>>>>     include/drm/ttm/ttm_tt.h                      |  5 ++
>>>>>>>     15 files changed, 96 insertions(+), 27 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>>> index 5c72462d1f57..7de284766f82 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>>> @@ -808,7 +808,7 @@ static int __i915_ttm_get_pages(struct
>>>>>>> drm_i915_gem_object *obj,
>>>>>>>     	}
>>>>>>>     
>>>>>>>     	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
>>>>>>> -		ret = ttm_tt_populate(bo->bdev, bo->ttm,
>>>>>>> &ctx);
>>>>>>> +		ret = ttm_bo_populate(bo, &ctx);
>>>>>>>     		if (ret)
>>>>>>>     			return ret;
>>>>>>>     
>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>> index 03b00a03a634..041dab543b78 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>> @@ -624,7 +624,7 @@ int i915_ttm_move(struct
>>>>>>> ttm_buffer_object
>>>>>>> *bo,
>>>>>>> bool evict,
>>>>>>>     
>>>>>>>     	/* Populate ttm with pages if needed. Typically
>>>>>>> system
>>>>>>> memory. */
>>>>>>>     	if (ttm && (dst_man->use_tt || (ttm->page_flags &
>>>>>>> TTM_TT_FLAG_SWAPPED))) {
>>>>>>> -		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
>>>>>>> +		ret = ttm_bo_populate(bo, ctx);
>>>>>>>     		if (ret)
>>>>>>>     			return ret;
>>>>>>>     	}
>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>>>>>>> index ad649523d5e0..61596cecce4d 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>>>>>>> @@ -90,7 +90,7 @@ static int i915_ttm_backup(struct
>>>>>>> i915_gem_apply_to_region *apply,
>>>>>>>     		goto out_no_lock;
>>>>>>>     
>>>>>>>     	backup_bo = i915_gem_to_ttm(backup);
>>>>>>> -	err = ttm_tt_populate(backup_bo->bdev, backup_bo-
>>>>>>>> ttm,
>>>>>>> &ctx);
>>>>>>> +	err = ttm_bo_populate(backup_bo, &ctx);
>>>>>>>     	if (err)
>>>>>>>     		goto out_no_populate;
>>>>>>>     
>>>>>>> @@ -189,7 +189,7 @@ static int i915_ttm_restore(struct
>>>>>>> i915_gem_apply_to_region *apply,
>>>>>>>     	if (!backup_bo->resource)
>>>>>>>     		err = ttm_bo_validate(backup_bo,
>>>>>>> i915_ttm_sys_placement(), &ctx);
>>>>>>>     	if (!err)
>>>>>>> -		err = ttm_tt_populate(backup_bo->bdev,
>>>>>>> backup_bo-
>>>>>>>> ttm, &ctx);
>>>>>>> +		err = ttm_bo_populate(backup_bo, &ctx);
>>>>>>>     	if (!err) {
>>>>>>>     		err = i915_gem_obj_copy_ttm(obj, backup,
>>>>>>> pm_apply-
>>>>>>>> allow_gpu,
>>>>>>>     					    false);
>>>>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>>>>> b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>>>>> index f0a7eb62116c..3139fd9128d8 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>>>>> @@ -308,11 +308,11 @@ static void
>>>>>>> ttm_bo_unreserve_pinned(struct
>>>>>>> kunit *test)
>>>>>>>     	err = ttm_resource_alloc(bo, place, &res2);
>>>>>>>     	KUNIT_ASSERT_EQ(test, err, 0);
>>>>>>>     	KUNIT_ASSERT_EQ(test,
>>>>>>> -			list_is_last(&res2->lru.link,
>>>>>>> &priv-
>>>>>>>> ttm_dev->pinned), 1);
>>>>>>> +			list_is_last(&res2->lru.link,
>>>>>>> &priv-
>>>>>>>> ttm_dev->unevictable), 1);
>>>>>>>     
>>>>>>>     	ttm_bo_unreserve(bo);
>>>>>>>     	KUNIT_ASSERT_EQ(test,
>>>>>>> -			list_is_last(&res1->lru.link,
>>>>>>> &priv-
>>>>>>>> ttm_dev->pinned), 1);
>>>>>>> +			list_is_last(&res1->lru.link,
>>>>>>> &priv-
>>>>>>>> ttm_dev->unevictable), 1);
>>>>>>>     
>>>>>>>     	ttm_resource_free(bo, &res1);
>>>>>>>     	ttm_resource_free(bo, &res2);
>>>>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>>>>> b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>>>>> index 22260e7aea58..a9f4b81921c3 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>>>>> @@ -164,18 +164,18 @@ static void
>>>>>>> ttm_resource_init_pinned(struct
>>>>>>> kunit *test)
>>>>>>>     
>>>>>>>     	res = kunit_kzalloc(test, sizeof(*res),
>>>>>>> GFP_KERNEL);
>>>>>>>     	KUNIT_ASSERT_NOT_NULL(test, res);
>>>>>>> -	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev-
>>>>>>>> pinned));
>>>>>>> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev-
>>>>>>>> unevictable));
>>>>>>>     
>>>>>>>     	dma_resv_lock(bo->base.resv, NULL);
>>>>>>>     	ttm_bo_pin(bo);
>>>>>>>     	ttm_resource_init(bo, place, res);
>>>>>>> -	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo-
>>>>>>>> bdev-
>>>>>>>> pinned));
>>>>>>> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo-
>>>>>>>> bdev-
>>>>>>>> unevictable));
>>>>>>>     
>>>>>>>     	ttm_bo_unpin(bo);
>>>>>>>     	ttm_resource_fini(man, res);
>>>>>>>     	dma_resv_unlock(bo->base.resv);
>>>>>>>     
>>>>>>> -	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev-
>>>>>>>> pinned));
>>>>>>> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev-
>>>>>>>> unevictable));
>>>>>>>     }
>>>>>>>     
>>>>>>>     static void ttm_resource_fini_basic(struct kunit *test)
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> index 320592435252..875b024913a0 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> @@ -139,7 +139,7 @@ static int
>>>>>>> ttm_bo_handle_move_mem(struct
>>>>>>> ttm_buffer_object *bo,
>>>>>>>     			goto out_err;
>>>>>>>     
>>>>>>>     		if (mem->mem_type != TTM_PL_SYSTEM) {
>>>>>>> -			ret = ttm_tt_populate(bo->bdev,
>>>>>>> bo-
>>>>>>>> ttm,
>>>>>>> ctx);
>>>>>>> +			ret = ttm_bo_populate(bo, ctx);
>>>>>>>     			if (ret)
>>>>>>>     				goto out_err;
>>>>>>>     		}
>>>>>>> @@ -1128,9 +1128,20 @@ ttm_bo_swapout_cb(struct
>>>>>>> ttm_lru_walk
>>>>>>> *walk,
>>>>>>> struct ttm_buffer_object *bo)
>>>>>>>     	if (bo->bdev->funcs->swap_notify)
>>>>>>>     		bo->bdev->funcs->swap_notify(bo);
>>>>>>>     
>>>>>>> -	if (ttm_tt_is_populated(bo->ttm))
>>>>>>> +	if (ttm_tt_is_populated(bo->ttm)) {
>>>>>>> +		spin_lock(&bo->bdev->lru_lock);
>>>>>>> +		ttm_resource_del_bulk_move(bo->resource,
>>>>>>> bo);
>>>>>>> +		spin_unlock(&bo->bdev->lru_lock);
>>>>>>> +
>>>>>>>     		ret = ttm_tt_swapout(bo->bdev, bo->ttm,
>>>>>>> swapout_walk->gfp_flags);
>>>>>>>     
>>>>>>> +		spin_lock(&bo->bdev->lru_lock);
>>>>>>> +		if (ret)
>>>>>>> +			ttm_resource_add_bulk_move(bo-
>>>>>>>> resource,
>>>>>>> bo);
>>>>>>> +		ttm_resource_move_to_lru_tail(bo-
>>>>>>>> resource);
>>>>>>> +		spin_unlock(&bo->bdev->lru_lock);
>>>>>>> +	}
>>>>>>> +
>>>>>>>     out:
>>>>>>>     	/* Consider -ENOMEM and -ENOSPC non-fatal. */
>>>>>>>     	if (ret == -ENOMEM || ret == -ENOSPC)
>>>>>>> @@ -1180,3 +1191,47 @@ void ttm_bo_tt_destroy(struct
>>>>>>> ttm_buffer_object *bo)
>>>>>>>     	ttm_tt_destroy(bo->bdev, bo->ttm);
>>>>>>>     	bo->ttm = NULL;
>>>>>>>     }
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * ttm_bo_populate() - Ensure that a buffer object has
>>>>>>> backing
>>>>>>> pages
>>>>>>> + * @bo: The buffer object
>>>>>>> + * @ctx: The ttm_operation_ctx governing the operation.
>>>>>>> + *
>>>>>>> + * For buffer objects in a memory type whose manager uses
>>>>>>> + * struct ttm_tt for backing pages, ensure those backing
>>>>>>> pages
>>>>>>> + * are present and with valid content. The bo's resource
>>>>>>> is
>>>>>>> also
>>>>>>> + * placed on the correct LRU list if it was previously
>>>>>>> swapped
>>>>>>> + * out.
>>>>>>> + *
>>>>>>> + * Return: 0 if successful, negative error code on
>>>>>>> failure.
>>>>>>> + * Note: May return -EINTR or -ERESTARTSYS if
>>>>>>> @ctx::interruptible
>>>>>>> + * is set to true.
>>>>>>> + */
>>>>>>> +int ttm_bo_populate(struct ttm_buffer_object *bo,
>>>>>>> +		    struct ttm_operation_ctx *ctx)
>>>>>>> +{
>>>>>>> +	struct ttm_tt *tt = bo->ttm;
>>>>>>> +	bool swapped;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	dma_resv_assert_held(bo->base.resv);
>>>>>>> +
>>>>>>> +	if (!tt)
>>>>>>> +		return 0;
>>>>>>> +
>>>>>>> +	swapped = ttm_tt_is_swapped(tt);
>>>>>>> +	ret = ttm_tt_populate(bo->bdev, tt, ctx);
>>>>>>> +	if (ret)
>>>>>>> +		return ret;
>>>>>>> +
>>>>>>> +	if (swapped && !ttm_tt_is_swapped(tt) && !bo-
>>>>>>>> pin_count &&
>>>>>>> +	    bo->resource) {
>>>>>>> +		spin_lock(&bo->bdev->lru_lock);
>>>>>>> +		ttm_resource_add_bulk_move(bo->resource,
>>>>>>> bo);
>>>>>>> +		ttm_resource_move_to_lru_tail(bo-
>>>>>>>> resource);
>>>>>>> +		spin_unlock(&bo->bdev->lru_lock);
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL(ttm_bo_populate);
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>>>> index 3c07f4712d5c..d939925efa81 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>>>> @@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct
>>>>>>> ttm_buffer_object
>>>>>>> *bo,
>>>>>>>     	src_man = ttm_manager_type(bdev, src_mem-
>>>>>>>> mem_type);
>>>>>>>     	if (ttm && ((ttm->page_flags &
>>>>>>> TTM_TT_FLAG_SWAPPED)
>>>>>>>     		    dst_man->use_tt)) {
>>>>>>> -		ret = ttm_tt_populate(bdev, ttm, ctx);
>>>>>>> +		ret = ttm_bo_populate(bo, ctx);
>>>>>>>     		if (ret)
>>>>>>>     			return ret;
>>>>>>>     	}
>>>>>>> @@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct
>>>>>>> ttm_buffer_object *bo,
>>>>>>>     
>>>>>>>     	BUG_ON(!ttm);
>>>>>>>     
>>>>>>> -	ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
>>>>>>> +	ret = ttm_bo_populate(bo, &ctx);
>>>>>>>     	if (ret)
>>>>>>>     		return ret;
>>>>>>>     
>>>>>>> @@ -507,7 +507,7 @@ int ttm_bo_vmap(struct
>>>>>>> ttm_buffer_object
>>>>>>> *bo,
>>>>>>> struct iosys_map *map)
>>>>>>>     		pgprot_t prot;
>>>>>>>     		void *vaddr;
>>>>>>>     
>>>>>>> -		ret = ttm_tt_populate(bo->bdev, ttm,
>>>>>>> &ctx);
>>>>>>> +		ret = ttm_bo_populate(bo, &ctx);
>>>>>>>     		if (ret)
>>>>>>>     			return ret;
>>>>>>>     
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> index 4212b8c91dd4..2c699ed1963a 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> @@ -224,7 +224,7 @@ vm_fault_t
>>>>>>> ttm_bo_vm_fault_reserved(struct
>>>>>>> vm_fault *vmf,
>>>>>>>     		};
>>>>>>>     
>>>>>>>     		ttm = bo->ttm;
>>>>>>> -		err = ttm_tt_populate(bdev, bo->ttm,
>>>>>>> &ctx);
>>>>>>> +		err = ttm_bo_populate(bo, &ctx);
>>>>>>>     		if (err) {
>>>>>>>     			if (err == -EINTR || err == -
>>>>>>> ERESTARTSYS
>>>>>>>     			    err == -EAGAIN)
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
>>>>>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>>>>>> index e7cc4954c1bc..02e797fd1891 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>>>>>> @@ -216,7 +216,7 @@ int ttm_device_init(struct ttm_device
>>>>>>> *bdev,
>>>>>>> const struct ttm_device_funcs *func
>>>>>>>     
>>>>>>>     	bdev->vma_manager = vma_manager;
>>>>>>>     	spin_lock_init(&bdev->lru_lock);
>>>>>>> -	INIT_LIST_HEAD(&bdev->pinned);
>>>>>>> +	INIT_LIST_HEAD(&bdev->unevictable);
>>>>>>>     	bdev->dev_mapping = mapping;
>>>>>>>     	mutex_lock(&ttm_global_mutex);
>>>>>>>     	list_add_tail(&bdev->device_list, &glob-
>>>>>>>> device_list);
>>>>>>> @@ -283,7 +283,7 @@ void
>>>>>>> ttm_device_clear_dma_mappings(struct
>>>>>>> ttm_device *bdev)
>>>>>>>     	struct ttm_resource_manager *man;
>>>>>>>     	unsigned int i, j;
>>>>>>>     
>>>>>>> -	ttm_device_clear_lru_dma_mappings(bdev, &bdev-
>>>>>>>> pinned);
>>>>>>> +	ttm_device_clear_lru_dma_mappings(bdev, &bdev-
>>>>>>>> unevictable);
>>>>>>>     
>>>>>>>     	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES;
>>>>>>> ++i)
>>>>>>> {
>>>>>>>     		man = ttm_manager_type(bdev, i);
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>>>>>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>>>>>> index 6d764ba88aab..93b44043b428 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>>>>> @@ -30,6 +30,7 @@
>>>>>>>     #include <drm/ttm/ttm_bo.h>
>>>>>>>     #include <drm/ttm/ttm_placement.h>
>>>>>>>     #include <drm/ttm/ttm_resource.h>
>>>>>>> +#include <drm/ttm/ttm_tt.h>
>>>>>>>     
>>>>>>>     #include <drm/drm_util.h>
>>>>>>>     
>>>>>>> @@ -239,7 +240,8 @@ static void
>>>>>>> ttm_lru_bulk_move_del(struct
>>>>>>> ttm_lru_bulk_move *bulk,
>>>>>>>     void ttm_resource_add_bulk_move(struct ttm_resource
>>>>>>> *res,
>>>>>>>     				struct ttm_buffer_object
>>>>>>> *bo)
>>>>>>>     {
>>>>>>> -	if (bo->bulk_move && !bo->pin_count)
>>>>>>> +	if (bo->bulk_move && !bo->pin_count &&
>>>>>>> +	    (!bo->ttm || !ttm_tt_is_swapped(bo->ttm)))
>>>>>>>     		ttm_lru_bulk_move_add(bo->bulk_move, res);
>>>>>>>     }
>>>>>>>     
>>>>>>> @@ -247,7 +249,8 @@ void ttm_resource_add_bulk_move(struct
>>>>>>> ttm_resource *res,
>>>>>>>     void ttm_resource_del_bulk_move(struct ttm_resource
>>>>>>> *res,
>>>>>>>     				struct ttm_buffer_object
>>>>>>> *bo)
>>>>>>>     {
>>>>>>> -	if (bo->bulk_move && !bo->pin_count)
>>>>>>> +	if (bo->bulk_move && !bo->pin_count &&
>>>>>>> +	    (!bo->ttm || !ttm_tt_is_swapped(bo->ttm)))
>>>>>>>     		ttm_lru_bulk_move_del(bo->bulk_move, res);
>>>>>>>     }
>>>>>>>     
>>>>>>> @@ -259,8 +262,8 @@ void
>>>>>>> ttm_resource_move_to_lru_tail(struct
>>>>>>> ttm_resource *res)
>>>>>>>     
>>>>>>>     	lockdep_assert_held(&bo->bdev->lru_lock);
>>>>>>>     
>>>>>>> -	if (bo->pin_count) {
>>>>>>> -		list_move_tail(&res->lru.link, &bdev-
>>>>>>>> pinned);
>>>>>>> +	if (bo->pin_count || (bo->ttm &&
>>>>>>> ttm_tt_is_swapped(bo-
>>>>>>>> ttm))) {
>>>>>>> +		list_move_tail(&res->lru.link, &bdev-
>>>>>>>> unevictable);
>>>>>>>     
>>>>>>>     	} else	if (bo->bulk_move) {
>>>>>>>     		struct ttm_lru_bulk_move_pos *pos =
>>>>>>> @@ -301,8 +304,8 @@ void ttm_resource_init(struct
>>>>>>> ttm_buffer_object
>>>>>>> *bo,
>>>>>>>     
>>>>>>>     	man = ttm_manager_type(bo->bdev, place->mem_type);
>>>>>>>     	spin_lock(&bo->bdev->lru_lock);
>>>>>>> -	if (bo->pin_count)
>>>>>>> -		list_add_tail(&res->lru.link, &bo->bdev-
>>>>>>>> pinned);
>>>>>>> +	if (bo->pin_count || (bo->ttm &&
>>>>>>> ttm_tt_is_swapped(bo-
>>>>>>>> ttm)))
>>>>>>> +		list_add_tail(&res->lru.link, &bo->bdev-
>>>>>>>> unevictable);
>>>>>>>     	else
>>>>>>>     		list_add_tail(&res->lru.link, &man-
>>>>>>>> lru[bo-
>>>>>>>> priority]);
>>>>>>>     	man->usage += res->size;
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>>> index 4b51b9023126..3baf215eca23 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>>> @@ -367,7 +367,10 @@ int ttm_tt_populate(struct ttm_device
>>>>>>> *bdev,
>>>>>>>     	}
>>>>>>>     	return ret;
>>>>>>>     }
>>>>>>> +
>>>>>>> +#if IS_ENABLED(CONFIG_DRM_TTM_KUNIT_TEST)
>>>>>>>     EXPORT_SYMBOL(ttm_tt_populate);
>>>>>>> +#endif
>>>>>>>     
>>>>>>>     void ttm_tt_unpopulate(struct ttm_device *bdev, struct
>>>>>>> ttm_tt
>>>>>>> *ttm)
>>>>>>>     {
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>>>>>> b/drivers/gpu/drm/xe/xe_bo.c
>>>>>>> index a8e4d46d9123..f34daae2cf2b 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>>>> @@ -892,7 +892,7 @@ int xe_bo_evict_pinned(struct xe_bo
>>>>>>> *bo)
>>>>>>>     		}
>>>>>>>     	}
>>>>>>>     
>>>>>>> -	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm,
>>>>>>> &ctx);
>>>>>>> +	ret = ttm_bo_populate(&bo->ttm, &ctx);
>>>>>>>     	if (ret)
>>>>>>>     		goto err_res_free;
>>>>>>>     
>>>>>>> @@ -945,7 +945,7 @@ int xe_bo_restore_pinned(struct xe_bo
>>>>>>> *bo)
>>>>>>>     	if (ret)
>>>>>>>     		return ret;
>>>>>>>     
>>>>>>> -	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm,
>>>>>>> &ctx);
>>>>>>> +	ret = ttm_bo_populate(&bo->ttm, &ctx);
>>>>>>>     	if (ret)
>>>>>>>     		goto err_res_free;
>>>>>>>     
>>>>>>> diff --git a/include/drm/ttm/ttm_bo.h
>>>>>>> b/include/drm/ttm/ttm_bo.h
>>>>>>> index 7b56d1ca36d7..5804408815be 100644
>>>>>>> --- a/include/drm/ttm/ttm_bo.h
>>>>>>> +++ b/include/drm/ttm/ttm_bo.h
>>>>>>> @@ -462,5 +462,7 @@ int ttm_bo_pipeline_gutting(struct
>>>>>>> ttm_buffer_object *bo);
>>>>>>>     pgprot_t ttm_io_prot(struct ttm_buffer_object *bo,
>>>>>>> struct
>>>>>>> ttm_resource *res,
>>>>>>>     		     pgprot_t tmp);
>>>>>>>     void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>>>>>>> +int ttm_bo_populate(struct ttm_buffer_object *bo,
>>>>>>> +		    struct ttm_operation_ctx *ctx);
>>>>>>>     
>>>>>>>     #endif
>>>>>>> diff --git a/include/drm/ttm/ttm_device.h
>>>>>>> b/include/drm/ttm/ttm_device.h
>>>>>>> index c22f30535c84..438358f72716 100644
>>>>>>> --- a/include/drm/ttm/ttm_device.h
>>>>>>> +++ b/include/drm/ttm/ttm_device.h
>>>>>>> @@ -252,9 +252,10 @@ struct ttm_device {
>>>>>>>     	spinlock_t lru_lock;
>>>>>>>     
>>>>>>>     	/**
>>>>>>> -	 * @pinned: Buffer objects which are pinned and so
>>>>>>> not
>>>>>>> on
>>>>>>> any LRU list.
>>>>>>> +	 * @unevictable Buffer objects which are pinned or
>>>>>>> swapped
>>>>>>> and as such
>>>>>>> +	 * not on an LRU list.
>>>>>>>     	 */
>>>>>>> -	struct list_head pinned;
>>>>>>> +	struct list_head unevictable;
>>>>>>>     
>>>>>>>     	/**
>>>>>>>     	 * @dev_mapping: A pointer to the struct
>>>>>>> address_space
>>>>>>> for
>>>>>>> invalidating
>>>>>>> diff --git a/include/drm/ttm/ttm_tt.h
>>>>>>> b/include/drm/ttm/ttm_tt.h
>>>>>>> index 2b9d856ff388..991edafdb2dd 100644
>>>>>>> --- a/include/drm/ttm/ttm_tt.h
>>>>>>> +++ b/include/drm/ttm/ttm_tt.h
>>>>>>> @@ -129,6 +129,11 @@ static inline bool
>>>>>>> ttm_tt_is_populated(struct
>>>>>>> ttm_tt *tt)
>>>>>>>     	return tt->page_flags &
>>>>>>> TTM_TT_FLAG_PRIV_POPULATED;
>>>>>>>     }
>>>>>>>     
>>>>>>> +static inline bool ttm_tt_is_swapped(const struct ttm_tt
>>>>>>> *tt)
>>>>>>> +{
>>>>>>> +	return tt->page_flags & TTM_TT_FLAG_SWAPPED;
>>>>>>> +}
>>>>>>> +
>>>>>>>     /**
>>>>>>>      * ttm_tt_create
>>>>>>>      *

