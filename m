Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BE3B51936
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 16:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A383C10E2F5;
	Wed, 10 Sep 2025 14:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jnKAQg2z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BE310E2ED;
 Wed, 10 Sep 2025 14:23:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNxjRZE7o6+0pBX3pvy5u9hFrjuG+HlcPUY7xINQoyrTgg59QZq0LVZ5c4oUa+Zh/XJ5V2MJzj3+z1/hfyJ/Zk4zJd6QaS9u5DwVUKBqhwkUdRwjW0gHKM2FYqmtdjctWhx6Y5sPfbAbG9nW8oEdopwC4lM6qTA8DVSGDW9tykbtrwpb9i/9NOzC6E2pXFCrygAPVreq/n/Mu6b1o297yF12lXSlCI2XmeHjZEKUXqC7jivsWP/moUCpF7C38YBU2mAybtYiR1giIXkvwDmAPHFhKeHr29dzVtbY8r46vSLIu3rLzZUhJ6N2mrb7EF0PjgtSbKOBcjG494vg/tm1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcLOTz+B0i1ZgMPIWCA802m4pfmTDxJz94NbNa3ofy0=;
 b=AMiRuh+J8VB6auMHujktvj8O4+3mhS+sH6Z33sXzzsrPNMLMTu2IPLlOwPz61cE4LKwbxVa3mOpIsCrGopfLC+1w7l0XwEWxAlN0USP6SlCdfE65FdGcplDbUxA8SHpjlzej3l2sEMhPXuI/kMgELGEgpSQXJiokztO0qMhzcTZ9KJl+DT9HEzDQzdzXB+YC20vZJUnxlzQG/rRIl9LMocOx+5iYPIzBcbRgSwzpbkXOmcnJaHvZY90pro47muKI4Sh2MpDJqIJqdqfxBoA/SyF5g5WxWfh6F9b5pmTwFskiWBveOiV9oVr8dbPqycik2mTErCnlz6v/ORO2wAtobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcLOTz+B0i1ZgMPIWCA802m4pfmTDxJz94NbNa3ofy0=;
 b=jnKAQg2zIQAQzYocmWGbYsDIVU5JXWkqdxtbTOPhy4ZDAdbyvOy0uputEYBC2p3mEfsobRkYNsuEEMbMEKyohymBtDBeeoxz2wOA5aS3pVFbSAyPvgadY+NH9cc/RFYuf/Es+usGSTDKcer0JhqUB0wpBzW79DZJn6xK3GIFY68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8316.namprd12.prod.outlook.com (2603:10b6:930:7a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:23:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:23:00 +0000
Message-ID: <12f56eda-a6a5-47bf-b89e-0cfa8443a439@amd.com>
Date: Wed, 10 Sep 2025 16:22:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/buddy: Optimize free block management with RB
 tree
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: matthew.auld@intel.com, jani.nikula@linux.intel.com,
 samuel.pitoiset@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, alexander.deucher@amd.com,
 stable@vger.kernel.org
References: <20250909095621.489833-1-Arunpravin.PaneerSelvam@amd.com>
 <6f6841a7-57bd-49de-9b55-b5b0514a2749@amd.com>
 <20250909140519.GK4067720@noisy.programming.kicks-ass.net>
 <106c1a36-c104-4eb8-b928-d11b8ca9b599@amd.com>
 <fcbf6ae8-f9ab-4723-8df4-16d2f0f62c3f@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <fcbf6ae8-f9ab-4723-8df4-16d2f0f62c3f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0313.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: caa399af-3c16-4d66-b599-08ddf0758b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTIwS1M1c2l5ZXlDZFlOTGdERlhhVUdmSmF5bW9URmJUZmQ4Qk5YTjN6K2lR?=
 =?utf-8?B?Z29SNkppSzNXTFdiZ1pOamVwUWZiYjUxUTE5R012YWdiTmxUZDRua1YrOGh3?=
 =?utf-8?B?VUQ3SGhyK01oU2V3NVN0RkJUNzY0c2dTWHpZS3JCT0hmMmkxTGY5MFVQTDJj?=
 =?utf-8?B?S3I5bzc5SHVZMkMya1N6YVg2UEI2NmJOWFBqeUpDTlNWRUZzNjZkay9aRlVi?=
 =?utf-8?B?a25YMFh6YlBOR2tFUUNzMm9BV2hZWVN6OHQxV3VIZTl0K3Z6OFZHeEV3S0E5?=
 =?utf-8?B?WFpGa2V0NXVKVHBYd0EzNGNXaEU0cisvSHlMT0xMY0wwRktRSUZjSFUrZVQ0?=
 =?utf-8?B?clIzSHV5eEpBeTZ6OWIrQVNMQkpzQnFVYnd6Rjd1Ukc3RkRXVEpIUllHazBZ?=
 =?utf-8?B?eU51bHhjMFpRb3Rucm9UUUNyT1BNMU1FWC9DalRIZXV4dFJaYzlrdFU1aWZV?=
 =?utf-8?B?aHovL2szTmY1NTc0b2VGODhVUEJuZlg2VS9GTEZoMFBFUG5aVk4yRWdEVTFT?=
 =?utf-8?B?bXNDLzMrT3NxeXZDMEF4T2pKbG51RkVnc3JKblg2QzJWVVRvT3Q1ejBvWXFj?=
 =?utf-8?B?bUhxS3U4VVMyWmZqcW1vZUpkdkJrR3FaSGZIdE9CK0VvSXpPVTJGVVBKd0JS?=
 =?utf-8?B?WTZsaDRDc0htVVF2YTZJUkRlTytzK0ZNMUFqWWVLQVA3L0RVaUlLMzEwRzdV?=
 =?utf-8?B?SFFnYjJHOGg3TlFWS2lsQk9RUTNmZE44cnp6N05LR2ZnUFYvWUNuKy9zOTAx?=
 =?utf-8?B?MlVmUVJtZGR3d3N3akx3QlZNWFhXZmJqVDhGMFkrbVptVEtSTlMwbDZIcFN6?=
 =?utf-8?B?NXpPcll4dUNDZWxzSisxb1IyQzlZK3hWdFhyNnR1emFkUzZWSFUvTzdlY1F3?=
 =?utf-8?B?eVRIeEliaWxwakV2WStGZ0xJZ1kvUXo2a0NZYzZPVmZwYlpoMi9oTEs3SVhx?=
 =?utf-8?B?L2dFRzU4bSs1SytlVE1PWFNISHVhNjdWQ1hsZTlMNUlQVXJlYkorL1VGNmV6?=
 =?utf-8?B?bXBveHBVM1duQU5KWFlZWXJXOGRmZkU4T3RTc2Y5ZDNQZXF0N3BZQzBMck93?=
 =?utf-8?B?c2ZyMTFTVVpneGovS1V1VXZwR21pa0tNR0N4UlJDTWdrSmtDQzhCZEc3S2JD?=
 =?utf-8?B?QS9MUkc0Zjd0VG1GdzNtRkxZL0FDZ3NndzNJcVJVaUpwdXUwZ0VTQW1TbSt2?=
 =?utf-8?B?a3FPNE1YU3lKVEY3SlNQTVYyK001SW1TYXRnVnphbmdPcHVPMWswL1RZZHcw?=
 =?utf-8?B?STRZdmhWbkJUUU1hQWZTYm03bHM5dHFxRUZicTdqcmE0TnVmNnViRjhUNWVZ?=
 =?utf-8?B?OGcwT01CckhraXcrWElYYWJoSnlXUE9UWUhUclRxWVdmdTNSRUo1dG8xdEpx?=
 =?utf-8?B?YUtLSUdpZi9NZFZvRlVJOEcyK0FqTkxkd2lCOWZoc2lwa1hIUlVTYVloVnZW?=
 =?utf-8?B?M0RUaUNXVm84WXJFbWVtTlc0T3RrOVpDeklTeU1vV2xXNjN6YlpMZkQ4WDN5?=
 =?utf-8?B?OTdEMUsyN3lGZWZPMWgwbFYrVVlnSU5HeDg4bDlmTis2bWZnN2xEUVBjbEZZ?=
 =?utf-8?B?b0RjSmxrd0lBK2dWUFRvR1JEbERIM0llb0RxK25kcmNvQ2pURFR3WEFRSEEv?=
 =?utf-8?B?SmJ0b05lVzQ5MGFhYTFzTUhnNEZIQkdpQzV5RVFhNS9aSVpUNSthdHMwREtz?=
 =?utf-8?B?SmNpeXJ0Q3E1NzRTUWR4ZmlpdjRPZTU3WWJ2Z2ROREZ2b1J6VVFEVUNPb25h?=
 =?utf-8?B?VlM1OEpRSjFWV1VPTCs1NUl0dUN3S1h4bTVGcXdjc1E1M2dXSzV3OHo4MmZO?=
 =?utf-8?B?emQzamZTZkgwdEpwaXBLcWt5T2NhalN3UDZCaTRpbjNnam5sRmNSUlNuMWZs?=
 =?utf-8?B?NVVWNmdDMzVwWE41aVE3RDhDVzRldStkRURDdWdQdFhFcW1hTWVsOUdJbUlq?=
 =?utf-8?Q?Cs4ktkfBBiQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkMvakM0UW1UaElFSE5nTlROemtJL2tZQzd6WFRxNHZhWkp6V0MySXVnZlpC?=
 =?utf-8?B?Ty9ML3ptMzQ0RTltdTBiWWVEM1E3cEhUWXlqb2piZ3o3L0VhdkExZXdPZjN3?=
 =?utf-8?B?eU84cDdBV0tRMnFlSmtKUzFUdmQ0REVKVEdzTE4xOFhBb1VKOTl0aytOWFR0?=
 =?utf-8?B?aEx2V0dlcytzVWltamdLS0YvQ2MvSlFlWmo2REhMd25SMGx6Z0wyOGp3TGNF?=
 =?utf-8?B?bmVjbVphaVl2cmdUam5PSWpnZUpNS2V2SExWQmZTcVdBaGdlVTZ1eTErY1dO?=
 =?utf-8?B?ZGRiUDkweitJQWMyNXNRRjFnTWtGMjk5ZkFPOHpTbkRja1ozVGZLOVdBOEtH?=
 =?utf-8?B?UTNjTmtzdXV4L2pFdm1sSWx3bUpYVFBKaEFBSko4djJJSmpaUGdieDlSY2Y2?=
 =?utf-8?B?TlVCQVJoUkxzRFFzaWFsN1ROeTI3Q1lBbHE5RTBadWtjS0RqTVFRdVJtdW5K?=
 =?utf-8?B?RlJQM2tOM0lvUHZKc3JvWDkvU1VhVjFPNjNuWnF1MS9GSVdOMU5WbmM0SnpQ?=
 =?utf-8?B?bFNGaHl3Q2lhVlF3NlQxTDNsakF4T0J2bnh1TnpwWnhiVHRqbjZPMFJlZ0Ix?=
 =?utf-8?B?VHpYeVdEeEtpNERsRUg4eHVwZExrMUM1dyszVUxoOW1QckZHOUg5TmlMb0xu?=
 =?utf-8?B?V2ZSK015UlArWmVUSXhaNjdaLzBjUVNVaGpoeTZHbHE1LzJCL05zQ3RrTzhT?=
 =?utf-8?B?RlZTZW1yVDlSNnIzdDNaNGdKV1lLc0pVWW1pOExYQ1VsV2tlK3J6VFQ5ZWg0?=
 =?utf-8?B?VWxNYkpDUSt1MlowNUhheEhReEFFejhOWCtYNDlOSTNERG9uNHdiNzNJOG9w?=
 =?utf-8?B?dEdkWFc1ZU9ERW1yNDMyY3BaRVVuallrV29CQlZSS2dBM2xnVnptWnRNSzRl?=
 =?utf-8?B?ZlY2ZWlYYjZBT0pndGJnOXdReUtmNUlHbXZvY3RzcGpZeCtEK2p2UEh6eVhB?=
 =?utf-8?B?RERsejVoYWtPc25nQzc4WWlqOXVNbXRYeUJiaHlRd3RqQi8rUGlGakZvbXFZ?=
 =?utf-8?B?NklDRWhhK2ZnNENNVno4d3lQa3Fza0MzS1Y3dGp1QUF5RlZEQnFhY3lRVXFu?=
 =?utf-8?B?Y3VaejNLSXVWbTc2a05EM3lZeGloUmpJMEt2emswSjFyMnovT1ZBTEdFblow?=
 =?utf-8?B?Um9ZQ2kwdWsrR2dhb0kwYmZjSTdLS052bkZFdnBXTVZYTEYwQndkcHlPOU9n?=
 =?utf-8?B?YXJjMXZtNGtPUi9rR1NZK3RFVHdxRzJIOHQ1SitZWko5MWZOV20xbmdKYjZ1?=
 =?utf-8?B?QldtOVE0R1hHSDFNQjlGK2xBTzd2VU0zUStYZ05idXdlY3pFdHN1blprcXlU?=
 =?utf-8?B?OEprdVNIV25DSktaa3dFS204MHF6eVZQV1VMOElNOEZMRjRpbnkyVm51UVpa?=
 =?utf-8?B?cGp2UzZ2NmlGVEdOeTNJOC9rZmMweEtGN0Q5ZTBsYldzVUhvODZyWlF3RjNB?=
 =?utf-8?B?amllRXVtQlBQWGNhbCtrMy9XMXFxbENxVDFVaFpsVkVqMW1GaHdoQzhlcHhZ?=
 =?utf-8?B?TmlmUzFtUUU1TnExanpVRFNkdjNKM0tzVzZldittcUVjRmFXTTlldWF6Q2l4?=
 =?utf-8?B?bFlkMFpkcjVzWHJhQU91SU9IWXVPOGlGY2NtdVZRU0k5cGpGbFUzSGdOZTVT?=
 =?utf-8?B?Q3dNSmpiR3dmOHZQd2RWMTZFQVVZSGhoK0JmT3hMY0hiMFVxamJpWm9SMjZj?=
 =?utf-8?B?VGo4aElsSDRFNXlJZTQ2QVZ3M0JCNnY1ZmdXU2ZBaEhqTkJiaWdVTTNEVHlD?=
 =?utf-8?B?VzZNZjF5VkQ5ZUl5NUxiYm5UdWlKN1IwcXppUFM3aXJtNlJOalJ4c0VrdVVV?=
 =?utf-8?B?aS9iNUtyVmgwTkd3RzBUR2poS2pGUjNBelNEV3R2TysvekhDc0hhMXNjeXR1?=
 =?utf-8?B?S015N3UzNGNBZ1pLOHBhVWEzRmNFQkNMaExKUVdQWEo2M1c1M1pjZkl2dTJt?=
 =?utf-8?B?elN6dnlTZHpsOW1JcUNGM3psQUYwNy9PSUZUdUhNUXZxUXFVbWhIeGdWckhW?=
 =?utf-8?B?Ly8wMEJDeWtmV0ptSzVzZysrSk5OV0tJaEEvUTB2N3ZVVTIwRzA5QUcwTnhv?=
 =?utf-8?B?T2E0aVVYYTVMQmYxYXJUVzJzbXBtN3VHeGE0aGVYUmNLMWYvbWtrYndFT3lm?=
 =?utf-8?Q?E80YOFW8t605WpcYnE0D4yn0B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa399af-3c16-4d66-b599-08ddf0758b53
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:22:59.9269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHJdRuQvnhLo0tTnQM7jhhzSDzDSJsM3BakVw3q3z3NBZj46Twl6b4Ii2WXC2Q8h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8316
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

On 10.09.25 14:37, Arunpravin Paneer Selvam wrote:
> Hi Christian,
> 
> On 9/9/2025 9:55 PM, Christian König wrote:
>> On 09.09.25 16:05, Peter Zijlstra wrote:
>>> On Tue, Sep 09, 2025 at 02:04:30PM +0200, Christian König wrote:
>>>> Hi Arun,
>>>>
>>>> On 09.09.25 11:56, Arunpravin Paneer Selvam wrote:
>>>> [SNIP]
>>>>
>>>>> +/**
>>>>> + * rbtree_for_each_entry_safe - iterate in-order over rb_root safe against removal
>>>>> + *
>>>>> + * @pos:    the 'type *' to use as a loop cursor
>>>>> + * @n:        another 'type *' to use as temporary storage
>>>>> + * @root:    'rb_root *' of the rbtree
>>>>> + * @member:    the name of the rb_node field within 'type'
>>>>> + */
>>>>> +#define rbtree_for_each_entry_safe(pos, n, root, member) \
>>>>> +    for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
>>>>> +         (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
>>>>> +         (pos); \
>>>>> +         (pos) = (n), \
>>>>> +         (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)
>>>> As far as I know exactly that operation does not work on an R/B tree.
>>>>
>>>> See the _safe() variants of the for_each_ macros are usually used to iterate over a container while being able to remove entries.
>>>>
>>>> But because of the potential re-balance storing just the next entry is not sufficient for an R/B tree to do that as far as I know.
>>>>
>>>> Please explain how exactly you want to use this macro.
> Thanks for the pointer, yes, this will not work on RB tree. We need a reverse safe variant for use in the force_merge() function similar to the
> list_for_each_entry_safe_reverse() macro in list.h. The reason is that in force_merge(), we remove the block from the free tree before invoking
> drm_buddy_free(), which merges and frees buddy blocks to form a larger block.
>>> So I don't much like these iterators; I've said so before. Either we
>>> should introduce a properly threaded rb-tree (where the NULL child
>>> pointers encode a linked list), or simply keep a list_head next to the
>>> rb_node and use that.
>> I agree, something is clearly fishy here.
>>
>>> The rb_{next,prev}() things are O(ln n), in the worst case they do a
>>> full traversal up the tree and a full traversal down the other branch.
>> Yeah from the logic that is exactly what is supposed to happen in the __force_merge() function.
>>
>> The question is rather why does that function exists in the first place? The operation doesn't look logical to me.
>>
>> For drm_buddy_reset_clear() and drm_buddy_fini() we should use rbtree_postorder_for_each_entry_safe() instead.
>>
>> And during normal allocation __force_merge() should never be used.
> In normal allocation, the force_merge() function is used when no free blocks of the requested order are available. In such cases,
> smaller blocks must be merged on demand to satisfy the allocation. Mainly, this does not involve traversing the entire tree to
> merge all blocks, but only merging as needed. For example, if the requested order is 6, and the minimum order is 5, drm_buddy_alloc_blocks()
> will first attempt to allocate an order-6 block. If none are available, it will try to allocate two order-5 blocks. If those are also unavailable, it will
> invoke force_merge() to merge lower order blocks (4, 3, 2, 1, 0) in order to coalesce into a higher-order block of order 5.

Yeah and exactly that is what should never be necessary in the first place.

The idea of a buddy allocator is that blocks are merged when they are freed and not on demand.

The only use case for the force_merge() I can see is when cleared blocks are merged with non-cleared ones, but that is orthogonal to the discussion here.

> 
> In drm_buddy_fini(), force_merge() is called to ensure all blocks are merged before tearing down the allocator. This guarantees that all
> mm->roots are freed and not held by the driver at shutdown. If any blocks remain allocated, drm_buddy_fini() will issue a warning.
> 
> In drm_buddy_reset_clear(), which is invoked at device suspend/resume, it is an ideal place to call force_merge(). This ensures that all
> possible blocks are merged before resetting the clear state, thereby reducing fragmentation and improving allocation efficiency after resume.

That's where rbtree_postorder_for_each_entry_safe() should be used.

> I tried using this rbtree_postorder_for_each_entry_safe() macro in the force_merge() and it works, but we also a need a reverse variant
> since in normal allocation we dont want to disturb the lower addresses.

I don't get what you mean here.

Regards,
Christian.

> 
> Thanks,
> Arun.
>>
>>> That said; given 'next' will remain an existing node, only the 'pos'
>>> node gets removed, rb_next() will still work correctly, even in the face
>>> of rebalance.
>> Good to know!
>>
>> Regards,
>> Christian.
> 

