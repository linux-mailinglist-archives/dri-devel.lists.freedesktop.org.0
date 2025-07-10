Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76877B005CE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 16:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A5B10E8F7;
	Thu, 10 Jul 2025 14:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D3vWWYYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2070.outbound.protection.outlook.com [40.107.102.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C9210E8EA;
 Thu, 10 Jul 2025 14:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzH4Us125wzGQdXewuyCLkF5OIZU9UqW91v2UWi+ib/2yyiqzaceDyU/o9fnPr6FbZGfrLo5+F2lQ0znZhHQNAN5UEYkqOVRUyKb7MYaeDXdkiHk+XALkxzeZuL/YyxydXcC50wX+Lhe4+RdxOHXPKf2j2OCqyeXZ7FPFzZNj7SFYdvC1+4kmsFy5gNGuW8ELRy9E1ksE+Y5h3/hE+dSgBA8QnIe8pSFbFUHoc/VMi10SlELWbIaD1BBmuk2+drm0WKV3kXzzvg2w+/8devZ25QauK/NxaMspjz/Gpi2kOE2CB+yH9MPDzsKMr61Joq59Iak7JmfhmZkVQhfMSidEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEGdMZ6nAATS8CbZutXlHSAaWxPD4ndKXziSAzb7lSo=;
 b=n5CjzKvVyYZepcrI6XTXuQby10l0TNwcPkXxPYhOtRHKG7Wn++iMVoj0+5VWphj6VRvGJiVeDx+MQl715tD7RXpu7U0AziT+s96PTAwYOud3ttF/yWiLeDXS8wtEgLpP9SFEJgszG0IrulOUbDT4r/a1LzXKilkI2tLl3ehuofyynsGBOf6Rp6V6ZRQFWNWBAEy2pe8HNeLWcgt5QohK9LIDlZg0xy4fZyY1nLAmvaxuZ12dYYJan8HH+2gK2TanlEAi4pn0lYW/06U8gGI/IArkImAFI91LsdZuK/FG0pxL/eII7KVI7qIyCXuQZnfAIPG+oDMDOBwTwX+ea2Sg2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEGdMZ6nAATS8CbZutXlHSAaWxPD4ndKXziSAzb7lSo=;
 b=D3vWWYYxhKG0o45A8OATuaCbXZKP2sXxgJ5aTwZLQAfd4WPctT2M/I6ZwuUFCS3BGWO0ffohWq5pRqkkekOYJUQqL/eBThHV5Gvt+mxwf6dk1vCj0Qjx+sCmk4D5kF/7HFALsLZVT06xP0BQ8eB40rQbq0xNHnIXGrmjAxl0IoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by DS4PR12MB9610.namprd12.prod.outlook.com (2603:10b6:8:277::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 14:54:25 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%4]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:54:25 +0000
Message-ID: <a01890f1-8db9-4477-b879-cce70bc468ed@amd.com>
Date: Thu, 10 Jul 2025 20:24:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250708065404.4185-1-Arunpravin.PaneerSelvam@amd.com>
 <20250708065404.4185-2-Arunpravin.PaneerSelvam@amd.com>
 <f5386d20-326f-40ba-834f-953a0d7d18e1@intel.com>
 <16d56381-fec5-4cd8-a84c-4ce969786d9d@amd.com>
 <83353f59-fdae-432c-9071-7a05acd8a2bc@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <83353f59-fdae-432c-9071-7a05acd8a2bc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1P15301CA0027.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::15) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|DS4PR12MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: 28de0b51-ebee-4738-9b7b-08ddbfc1a976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWkxV3BOcDBkdTJ0UDBVQWpYUGFqVXJhK1pRWnhnZlJvQVJOaVE2Q0o4ZGlv?=
 =?utf-8?B?MG9ZSC9zSFBCV2QxS0VHS1VkOFhKbEFUenB2SVJjNjdReFYvbzJNUEhzMVZG?=
 =?utf-8?B?dHEwdVFoNTFMc1VuOFpRY3RZTUd6M2YyUmpEc0pGNjZ0VERqSVRQWStLSFVk?=
 =?utf-8?B?NnhJa0tMa1pYU1F5L0hDWjJTSmozc29IRHhMRjRncGgwVXEzNllrRWFvNlgr?=
 =?utf-8?B?eE1NS0prblpGOVI0L3dkQzV4aXAwVmFpb3dpSnQxMWNuZkcwckpGdUQ0ZUhq?=
 =?utf-8?B?cXJpdnlkMTNKSHJZYU0rQU5lZlg3M1BZdmFtdVZJZDA1ZGtkT0RIcENDdEY5?=
 =?utf-8?B?WFpzR3I4aGRkbDJBd1Z5eU5mV2pmeTh0Z0FSNmFXMUI4eGtCeUZ2M1JORndp?=
 =?utf-8?B?OTVPRnRFYVZrc2drYjl0RkxQN01QYjV4dUFZT29oT2NHcGM4MGRrY0RFWjJY?=
 =?utf-8?B?azRGdlZCYmQ5QS9XZEt3RVNqU2VFWi9UNEh6cytsTDFKL0ZieVpndjNTc0Z5?=
 =?utf-8?B?aW9JTDFRaWIwaDFvazF0dS9lV0JFZGxnaVpCSm1PQWdhdncrOTdhS3licUxV?=
 =?utf-8?B?b0JOZ0tha2x1TzRqdlhta3lsYkc4VldOZ2xHZk01QmZQVStyYmJZTlp5dlpl?=
 =?utf-8?B?ZmhJYXBHczVCbHUyV2FvNFpGVUxpcEpxMDVLMUhaMGtkMWQwTGtkUE9iTXlD?=
 =?utf-8?B?NTYzdDlKU1FVZTdkOVF2aXRTUHY5TjFCNTNKQXdmSXJvTmZuUXpkdVAzRm9u?=
 =?utf-8?B?K3YzTitsQlo5WjZRZFVMeGk4Rzk5eWdGajhYUDdLSE5sMG95YXgvTU9LeEhD?=
 =?utf-8?B?Q1lvdjExZ3ZiWGVTRjNNMVdTclY1YmZSUm9zUENiYVU0RWFCYStkWXR3czZF?=
 =?utf-8?B?Ulc2UFFvY1NqQzJPb1pCQitxMi9xUUpsMVpsaTRnbFkvb2UybkprNTZscWRC?=
 =?utf-8?B?TkRzeWxORFZnWGFNMkN0V3dCdWpyRU5EV1piQk5JVzlJOG5OcHFob0MrNytp?=
 =?utf-8?B?bmVJa2FJb05SVEN0THRkeE5lelZqQ2QyNmZIdHRKT3ljcDZJc0FqeWhiOXph?=
 =?utf-8?B?Z3h5bGVKdHd4NWpxL3BxYkltVkVPRndyOTR3Z1crZlhVcFBqZkRsSkh1cFFt?=
 =?utf-8?B?OEFNbm83QlVBeGVOcWZjejcwUVZES3diM1RKNVZRNU0zNnZnVDdTZWpvZEM3?=
 =?utf-8?B?TjVSNHhaa3FXYTZXSit5aEZMVU1Rcm93RFR0czViSmtJM0E3cU93MW9BVkJw?=
 =?utf-8?B?VGlNdmY3L2lmN0JzSlZMbUhsL3ZhOUZQVnRWMU5JRHpMRWxISURNbXFuYkVF?=
 =?utf-8?B?WktMME43UUlHWHVpRVNaUkxZVEJ2YlZtcDduQjNFdW8xcFVuSTRqTEFYR2hr?=
 =?utf-8?B?bnB3ZU00WmtGenEveUV1c0FENjFnR1V5SmRCZEJMMUhRZ1NFQ2pYQkhpZXJi?=
 =?utf-8?B?U0RxMlU0OHF1Q1Q3OE5BTVVxd09UZFBxWURRckpFY01qbWJ4YXBEZ3h1WnRD?=
 =?utf-8?B?MjlTUFRRc0pxUms4Y0RaNkUyMTArYS8rdzBiYXZVN0N6NXN5ZHBnMDVEbTd5?=
 =?utf-8?B?U2dZK0RkKzVLQm4wOS9FY0YrbEJzWkRhTFpzODNIN0JyeERVbThwZDNFdkx3?=
 =?utf-8?B?WHZNN1FCeEV6dnRTNnMxNUgrQVl0ekgzMjc0UkdVWGVvOTduVTdxT0JVOTFF?=
 =?utf-8?B?VXFjQ0JoMGw0cno1RjFhVStOWm9MbTduQzhnZks3TVArYXdObHR0RHZvUFFj?=
 =?utf-8?B?NSsyMllFUy80WlJVYnNEMW9pZGxxUmRZZTBYM3VQRGxzeDJXcUIxOEcwN293?=
 =?utf-8?Q?uYgmX+4QkAvf+cJu3LnrYdZizi6LTdwFcyCFg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHFiMUhGSlNBWnFQWDBkcUh6aG13Y1hqQXl2d1dSQ1VNdHBTSVIwbnh2QUx2?=
 =?utf-8?B?Q2plb1ozTTRta2F4cDBXd0ZnVGxXSWZrN05lUzNiT1ZOY2JxQUZjdk1uNnQ1?=
 =?utf-8?B?eVAvV1hINWhpZ0QwUGwreUZ1ZGJSQ3hBU2o0NjcvODlLbndZcmtvOCtvQ0F3?=
 =?utf-8?B?emU2cGpleWxhdkJlNmRjaEdtYUl4dzEyV2RXaTdaajN3aFM3U2g2eFRCVEw4?=
 =?utf-8?B?YzMydWVIellBYi85QnpsZW4zbUk0UlZjTW9zV2VvSy9HQnhBNVNrR1dpdmxv?=
 =?utf-8?B?dW92RWgvVDkyRjRYcGRiTmcwTVlSd1VrbUJJVE1FUGdSd295QUZhOXBCbE1I?=
 =?utf-8?B?NHQ2WWR4RWwvWjlFZEhta2Y1VXhaNEJGVEplSWZNWWt1aFExSFNRbE16V1lt?=
 =?utf-8?B?dXg4aGdmUzVyYnN6bkhMMGtwRWhlN1U5c3UrOW1FNjdCdFV0M2JBbUhzcDVJ?=
 =?utf-8?B?d0k4TWozVDdxelU2L1FFbXQ4QnFJR0VydXEySVQySStta2t6bEJkYXM4U2tU?=
 =?utf-8?B?bXBSZVIxRnZobGRia29OWlJSWGM3MjlJTUNDUFFPaWJTSUNSN3pXMThqb1FV?=
 =?utf-8?B?dG00Q1JHdUVkMEtGVHBZcE1QMFp2Q2xsbU9sTG1lRmZaZGNuM1dGNzdIN1hO?=
 =?utf-8?B?Vm5yZ25GaklheW1rZHkxcUp0L2czbEFNeUhvSXE2SzJOdUlDb3pseFBsNlFX?=
 =?utf-8?B?akdlUzNuOTBmOW9Bam9BREgwMmpIVTJ4a2p4OG90dUJsZGlseDNqODM5Mi9v?=
 =?utf-8?B?VUI4MEgwSDltZVJnT2xZZEtoRFViL0pndE55ZTZEblpzdXpqcEdOb3VGSThW?=
 =?utf-8?B?c3FhVTNCbWo0akQxaHBKbTNkbFVuc3hRZ1lvQWV4YXEzbW1xNDhvUnB0L2hE?=
 =?utf-8?B?V2txVU8wK0tNaXYyLzZpdjB0VFFOVmFDUzhVN2ZsdjhGcklrWkRNU2w4cFpR?=
 =?utf-8?B?QkdqUDQ3bHYyanc5NkpObFM4THJlNkZQQWF1VE1xc0FPb0EyUEQzK1l6M09J?=
 =?utf-8?B?WncrVEZ3N0hKYkhiM25BV1oxdmJPcjducEdHWEZjM29TVjFUaWoxdEVjNVYr?=
 =?utf-8?B?YXNTZXcyYkd1YUViRXJNRDI0Rjc2Mk5iTXdsZEh3aG56Yng0bjRGQlprR2Ez?=
 =?utf-8?B?cUdubURzSnR3anhxREFEZnhhR2Uvc1BmUlJraHFibjRpTmdEK2gxOFcrY25x?=
 =?utf-8?B?TldDYlpKWmRmYzFYWE1DVnFrTGMwYXZjamRGV01zVkNPdXpvblV3Sm5EbnlC?=
 =?utf-8?B?TWdSM3RlTDlUQVdQVGVGcGtmRE8zOTBBcUdVZEYyeDBFZSs4V0Q3aHltTWRG?=
 =?utf-8?B?cUVDQ1BaZUV1OVRIWkl2RFk0a0M5MzUvaUJjbXpiU1FWbnliMUFnZjNxazRK?=
 =?utf-8?B?a3NaUjlyNGxBdzZiSzNFSm01WmM5Q2FON1hnc3BKckd1UTF5dWducC9qYkdu?=
 =?utf-8?B?TkRZTEhuUk4vZ2tlUjlmc2NWRTRhRnFJazhlSzBpclNMTzBER3ZTeXJtdU9C?=
 =?utf-8?B?eGJxMkZvWHNWUTN1RkN3L2k2eThzQy9oTUFuQXZMdEp6UHp6MFcyQzhSSUZs?=
 =?utf-8?B?a2RpMGhhVnVtOWdiQk5UV09IeXIwRHNSMFgzOHAydDJjdThpdEgrUUl2dWMz?=
 =?utf-8?B?K3hwWlNHcHZxNzZ4SzFjMWtadzJkRmVwZ1M2ekVSNmFqMVVjeDRiUDlOcGc2?=
 =?utf-8?B?YTFhRGpsV1ZhR1NyV09NTmg5a2tJUGZ2TWRDOGJMeCtmdFFzakNiQkNPSXBl?=
 =?utf-8?B?UzhDbmdxdzQveWttVzNaWlRybnF6dDRob1ZpQm94dEhWcjNLbkM5c0hJTENy?=
 =?utf-8?B?VDRjVUdhNFRoM0dpOTMydnBTa3pDcFV2WSt1clNQOE1RN0RmbTBlRlpSQVJr?=
 =?utf-8?B?Mk9GWTZYbUxETXA3enQ3dzl6WFBRQkNhMUFlRktXeUVCUE5aM1VyNG9XdTJD?=
 =?utf-8?B?aFZUaUxKRXZ2b3dFV3N3TjZHMzdDZVBLWFJiTWJOR05VcDFRQ0xMd2dUMEdt?=
 =?utf-8?B?RmQ4b3BvNjh3d0pVak81TEhrNHF5Tk5FQVJCTGRLSW9jRCs3cG1tckt2UnZU?=
 =?utf-8?B?WDhrS0VtUk9oaHV0cW96QVZ5dHRUVmI3clZocStGZ0ZRZXhsMHdnd1RieXVh?=
 =?utf-8?Q?aLTfa2lfC9pWe5GvqtuLnoxSr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28de0b51-ebee-4738-9b7b-08ddbfc1a976
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:54:25.2269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYu5q0Qa+jLq9WZoK4cqQD33ysS7Ab0ql8HLyVoKt8rV+XNcCMgGWJ4QZS7ID/gpUNmKdyOJiueIU0P7ykD2tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9610
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


On 7/10/2025 7:50 PM, Matthew Auld wrote:
> On 10/07/2025 08:14, Arunpravin Paneer Selvam wrote:
>>
>> On 7/8/2025 2:30 PM, Matthew Auld wrote:
>>> On 08/07/2025 07:54, Arunpravin Paneer Selvam wrote:
>>>> - Added a handler in DRM buddy manager to reset the cleared
>>>>    flag for the blocks in the freelist.
>>>>
>>>> - This is necessary because, upon resuming, the VRAM becomes
>>>>    cluttered with BIOS data, yet the VRAM backend manager
>>>>    believes that everything has been cleared.
>>>>
>>>> v2:
>>>>    - Add lock before accessing 
>>>> drm_buddy_clear_reset_blocks()(Matthew Auld)
>>>>    - Force merge the two dirty blocks.(Matthew Auld)
>>>>    - Add a new unit test case for this issue.(Matthew Auld)
>>>>    - Having this function being able to flip the state either way 
>>>> would be
>>>>      good. (Matthew Brost)
>>>>
>>>> v3(Matthew Auld):
>>>>    - Do merge step first to avoid the use of extra reset flag.
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
>>>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
>> Is this RB also for the unit test case (patch 3).
>
> Feel free to apply my r-b there also.
Thanks!
>
>>
>> Thanks,
>>
>> Arun.
>>
>>>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
>>>>   drivers/gpu/drm/drm_buddy.c                  | 43 
>>>> ++++++++++++++++++++
>>>>   include/drm/drm_buddy.h                      |  2 +
>>>>   5 files changed, 65 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/ 
>>>> gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index a59f194e3360..b89e46f29b51 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -5193,6 +5193,8 @@ int amdgpu_device_resume(struct drm_device 
>>>> *dev, bool notify_clients)
>>>>           dev->dev->power.disable_depth--;
>>>>   #endif
>>>>       }
>>>> +
>>>> +    amdgpu_vram_mgr_clear_reset_blocks(adev);
>>>>       adev->in_suspend = false;
>>>>         if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/ 
>>>> drm/amd/amdgpu/amdgpu_ttm.h
>>>> index 208b7d1d8a27..450e4bf093b7 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> @@ -154,6 +154,7 @@ int amdgpu_vram_mgr_reserve_range(struct 
>>>> amdgpu_vram_mgr *mgr,
>>>>                     uint64_t start, uint64_t size);
>>>>   int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>>>>                         uint64_t start);
>>>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>>>>     bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>>>>                   struct ttm_resource *res);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>>>> b/drivers/ gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> index abdc52b0895a..07c936e90d8e 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct 
>>>> amdgpu_vram_mgr *mgr)
>>>>       return atomic64_read(&mgr->vis_usage);
>>>>   }
>>>>   +/**
>>>> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
>>>> + *
>>>> + * @adev: amdgpu device pointer
>>>> + *
>>>> + * Reset the cleared drm buddy blocks.
>>>> + */
>>>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
>>>> +{
>>>> +    struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>>>> +    struct drm_buddy *mm = &mgr->mm;
>>>> +
>>>> +    mutex_lock(&mgr->lock);
>>>> +    drm_buddy_reset_clear(mm, false);
>>>> +    mutex_unlock(&mgr->lock);
>>>> +}
>>>> +
>>>>   /**
>>>>    * amdgpu_vram_mgr_intersects - test each drm buddy block for 
>>>> intersection
>>>>    *
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index a1e652b7631d..a94061f373de 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
>>>>   }
>>>>   EXPORT_SYMBOL(drm_get_buddy);
>>>>   +/**
>>>> + * drm_buddy_reset_clear - reset blocks clear state
>>>> + *
>>>> + * @mm: DRM buddy manager
>>>> + * @is_clear: blocks clear state
>>>> + *
>>>> + * Reset the clear state based on @is_clear value for each block
>>>> + * in the freelist.
>>>> + */
>>>> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>>>> +{
>>>> +    u64 root_size, size, start;
>>>> +    unsigned int order;
>>>> +    int i;
>>>> +
>>>> +    size = mm->size;
>>>> +    for (i = 0; i < mm->n_roots; ++i) {
>>>> +        order = ilog2(size) - ilog2(mm->chunk_size);
>>>> +        start = drm_buddy_block_offset(mm->roots[i]);
>>>> +        __force_merge(mm, start, start + size, order);
>>>> +
>>>> +        root_size = mm->chunk_size << order;
>>>> +        size -= root_size;
>>>> +    }
>>>> +
>>>> +    for (i = 0; i <= mm->max_order; ++i) {
>>>> +        struct drm_buddy_block *block;
>>>> +
>>>> +        list_for_each_entry_reverse(block, &mm->free_list[i], link) {
>>>> +            if (is_clear != drm_buddy_block_is_clear(block)) {
>>>> +                if (is_clear) {
>>>> +                    mark_cleared(block);
>>>> +                    mm->clear_avail += drm_buddy_block_size(mm, 
>>>> block);
>>>> +                } else {
>>>> +                    clear_reset(block);
>>>> +                    mm->clear_avail -= drm_buddy_block_size(mm, 
>>>> block);
>>>> +                }
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +}
>>>> +EXPORT_SYMBOL(drm_buddy_reset_clear);
>>>> +
>>>>   /**
>>>>    * drm_buddy_free_block - free a block
>>>>    *
>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>> index 9689a7c5dd36..513837632b7d 100644
>>>> --- a/include/drm/drm_buddy.h
>>>> +++ b/include/drm/drm_buddy.h
>>>> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>                u64 new_size,
>>>>                struct list_head *blocks);
>>>>   +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
>>>> +
>>>>   void drm_buddy_free_block(struct drm_buddy *mm, struct 
>>>> drm_buddy_block *block);
>>>>     void drm_buddy_free_list(struct drm_buddy *mm,
>>>
>
