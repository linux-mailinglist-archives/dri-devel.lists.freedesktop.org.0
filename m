Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37549568E6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 13:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B612E10E225;
	Mon, 19 Aug 2024 11:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gLnT968O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4CD10E225
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 11:03:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTUjX7UzVAHdu66EA3umLwDwphG2kAWrajOkpgE22B3rhZsW8EVilMPzUuCxGNBT616xPT/1EObpYVzabcQWVnkA8zloCEFzIY94QlCdawSkihQ5ykXYR4eCy8GQKoBEjFnvSHra20MHZ8xI//+U9YLuEVOsKpDaeintfdcKqIhXlVzzz6JHgXx798axN/K8NsNSL6bqYjkoc/M5da5PvUk0CJ7kGbsjIhBCjeyFJvGQaC/X4bYXS4/YWTARTzJuZwEzEI8AWom/OYPioIHfvcekm4Lj+jMnrKaHfWUQvBjgPFPkHPyLLOwlesbhdSAB0CX0e8MK//piO0cvy9QF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZcKJTNyYebomIyMI3RUFSoVyl7AMp8KSwFGjy4Bghw=;
 b=KaqExyCXmPFBw6B+zwNtohOPVEyB+rgaQMCo+zo0FSYgQvBj55HjNjDGyb7hSka+lACZ77YdQ2LwB4S2lpohOHQDTGtvpk30OzeFSLDf2C4fPPZe8JxmCi86B5XfBLFrH6gaLsz1QodF9MBxd7U20tYD6qn4TH0FsizCyIWYyM1GKyX5E7lLbE0/KS3jf9RKMRTgmP5nLQ1jHYmQAJkL3YEAn8b0/ZHPL9dBHov7h4KWPB5IzlyX9a4zMj7yoP0k1ZWIGmRBKl6Ap/+IRkCKSXVjf0WIwUgWcfKngs2h66g4aF6rEzFruDFmz1r64gZU7hYAMGjjKfxXpANiHAEexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZcKJTNyYebomIyMI3RUFSoVyl7AMp8KSwFGjy4Bghw=;
 b=gLnT968O1Uu05GOOBW7vMaK8KQdgQ/CjgAmahMKiWIMdXM+YKekofBVc4+M4aJpFgiGCmgsmlqwbVEJ75H/WmqTnH8oUKOLX7E5CxgD6RBMQtKEW82vuKCfjKH42kCCN/QT+IfWiLegKe6RsdBwvXuny9EnSsZXw+SeJPMujQEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8503.namprd12.prod.outlook.com (2603:10b6:8:15a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Mon, 19 Aug
 2024 11:03:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 11:03:53 +0000
Message-ID: <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
Date: Mon, 19 Aug 2024 13:03:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a33ce80-f5f0-418f-adf6-08dcc03e9ca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFpwTzRZUTdZb0w4S0ljSUxZZlF5TEt1WE4zemN1M3FqSzlEdTgwOWJicGZs?=
 =?utf-8?B?ZW1xVHNXNTZwNkROMlMxK0VyUjFLNTNYTGM4NFl3bWgrU1FrTjh3K0VCR3RK?=
 =?utf-8?B?c1I1c0lyemxnckMvVEFZTFZKNXROZmp5ZWtnTEU1cVZ4VlF5T2V2eEgvcGVJ?=
 =?utf-8?B?a1dBUEhMa2lBY0Znd2pZeVhQZFZ4K293WXVnN0VVQllnL21abmF3eUlIUmR5?=
 =?utf-8?B?bVRxQTVnUWlvbEZ5UC9yRUxzS3o1bHN0ZkhVRk16NmRpTlpBcldGdE5oSE4z?=
 =?utf-8?B?V3pVTnVJZ1FjTWIwVnQyUDVuWnlCY0djK29wbFdoaGdQTmVBQmtZS200WkFD?=
 =?utf-8?B?bVN3a0VzYTU5L213ZDZBZ0Rxc1pvUUVERVY3UXBwV1hacndyZFllZGNYTGtw?=
 =?utf-8?B?amtydldWUUVvcE0zSVdmZmYxb3dDSmh5OHFCSzBzUGJ1bktpdVRSc3Vlb1Jl?=
 =?utf-8?B?cU1BSSt5WVJjTTVoVGxQS1VKT3JYaU9HTmxmbmw3dVhHQnowY21FNjlzaGhB?=
 =?utf-8?B?NU8xNHdOSURmS0tmRlZkTG5uKzdFM0lVcmQxL2NiSEE2TWcyeU9aMlRqeGxv?=
 =?utf-8?B?by96Y1BVODd6ckdwVEpnd1U0ZnlvVkpzQk8wbUFQeUdzSXk5cHBrMG53OU1O?=
 =?utf-8?B?UVR6MHhTdmRoQW4xa2wzQ3Vna3NEM01kSTl4b0xjYzZodDZmNk1rRytUcnRU?=
 =?utf-8?B?dWhIbkZHNEhLKzJtWWF1RkI3MDVKTU9iOUNlZUdHamlob0xQUGpkZFJ0Q1Q1?=
 =?utf-8?B?ekQ5YkxlcS96Q2tyaTNIZzYwcWtZdy9HNDVjRXo1c1JGUkNNZi9wTTlrR2RR?=
 =?utf-8?B?Q2NTcDhWSlZaK29jYWUrWkJxOVFLRVhvNEdlZmtuQmZ4SmxYdlk0VGpKd0kv?=
 =?utf-8?B?Mkx1NEZtMWhUaTV5ekJLSFl4YUVkd3VvMGJsc0J0dWg5UDZBaTJRY0JkSEwy?=
 =?utf-8?B?Ty85Wlk0eGJzdXFYQjYxTTBZU3A3NDRsTEIvUmlBWDlKRDBpQmxHK1J5em9u?=
 =?utf-8?B?V3hKYjVGNVNXbDlpbi9zVGY3V21zWjVrZGdOTTRIb1ZTa1lxZ3JOYkFzSFMy?=
 =?utf-8?B?SmZXNy9FcVZMaHRTcGhQT0FlY2lyTU54MzByUEYxMW1KaUM0bU9XMDJuQUcw?=
 =?utf-8?B?Yy9BbFJuYXRGeDBZUjY3eWxjcUF5aVArNTNLTjY0bmI1UFhWQzR4QzEyU2Ra?=
 =?utf-8?B?QjdDK3NlQS9Jd1JtQ1lreTVmL0RjYmEyQXExdWtQRGJobEZSa1prUndpZjV5?=
 =?utf-8?B?cTVrVEhxMXpJSnhZYlpabXZKVFF3VWFNOCszNHkrUlpOQmtGeVE2Ly94bzU1?=
 =?utf-8?B?M3NZRFdNbzNSWnpuTHVSamp6ckNIenZ0d1RJd2htMEh5dUlUVVkyT01GTkxW?=
 =?utf-8?B?Z0thRmRoWHp3WjkvT1ZHZW9rd3FFUWJkVWF2SHVqbkVjSE44RVRqZTNCcU5F?=
 =?utf-8?B?OE5qOHk0V2xlalhjcHl4WFVnS0hsT2JKVlBRNUtaQ2hBekoyVXo2YkVmNXNn?=
 =?utf-8?B?ZFRiZ0tqc0laaHI3eXBWWktRQWxxbC9tb0xLNEZJYlJSbTZFczBLVjlzRTVu?=
 =?utf-8?B?dHQvMmdhaC9iRUh1ZjVkWXFyWU9ya3BvRmlncFV4cU9tM1pscWNwaytueFZC?=
 =?utf-8?B?MHQwam56dkdEQkw1aDFReWNDY1JKUTFoT1EvL1cranJONzE3N2Zpb0dwZnVw?=
 =?utf-8?B?aHU0aWFlZmdTcGRxTEVvUkVSNlJUMXVjT0JzYy9laEppb1g0c0c4TVZxRVZZ?=
 =?utf-8?Q?wL8KD9VdGvtTe6grI0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0ljTmpFbFhUeExTM3IrVktDR3V3cHMxbVVvVTZJZWtJS3oyZ2R3b0NSalI2?=
 =?utf-8?B?ZnVPd0FuMEN0RE5YOGhsbTlyUUZPOHRrQUYrOEQweFo5QnB2VDA0VnB1RHBv?=
 =?utf-8?B?aEhjL2RoeEVHa2NLV2tiUStYY0pOVThQcGE2Vkc0cXViNWRHMWFXVTF0SWFZ?=
 =?utf-8?B?dkw5MmFMTEJRWmN5VHJXUkcvcHNaOG1CUXhSTVVIb0YwMDZIaCt3a2tlTkxC?=
 =?utf-8?B?NzhpYkV4eXFYMXRYVStmd3h2Q0V2Um91UE9jVXQzTTZuZXhZSCs1ZGd2dWNk?=
 =?utf-8?B?Zyt2ZXE5cnB0WWl5NktrYVFnRTVaVmdxaG1IcUpYVnFxVUlDYm5HcUhOWWJL?=
 =?utf-8?B?VldWUjBYWEtQak5WSUF6aDhqTVAzU0VSbkxkQ3AreFBIZW1lRDRla0Jma2Ro?=
 =?utf-8?B?ais4WjAyREhvSllqMEx3WUQvWHo0cTM4MG53T2I4Wi9aZ2N0Y2pRdUZUYUhH?=
 =?utf-8?B?VElxaVhlV21VZVQ5OXBvaTg3NktjUmpxVFdGSmY3YjNjOUJ6eGZJY0sxa3N3?=
 =?utf-8?B?b1QzQm52MkI3aWhHM1dSSVlFbTR0Z1U1Q0ZNU3dEbmREQUJsZHlRSE5OWVlo?=
 =?utf-8?B?T0tYRy9WWHFNVE8vTkVEaGtmSUZRQ1JqU21lSURMQmc0S1VnZzk0UU5WazdB?=
 =?utf-8?B?MzlIbkpBVjFXWFZOSXhDemVPT2ZFR3VtVklYUVpYdUlrWTRuR1A1MGp3MVBP?=
 =?utf-8?B?ZFdkalo5VGpYcWtUUmptRk9PUjVwVEVKYlZGdEozVnNwVEhVc0pEc20yU2s3?=
 =?utf-8?B?ejI2T3J6ZUwwMnBCOWlyL2tzZy9DTzhOSHZVOEs3S2ZLTzc1dUxncnJUa2U1?=
 =?utf-8?B?KzVSUFYyZ2tXK003T0lieDRxRW9KV0ZhTkh0cnpYeitUREZIS1ZPYmw5MmVF?=
 =?utf-8?B?THJsU0tjWTRwR1ptTTlEc0srS2FwMnh5YmxaU0w4enhsZnlzQXcvdzVoUUsr?=
 =?utf-8?B?Umd0cld1dVV6MUdiM0ZvU3NGZlFPU1NEdEwvd1ZlajBMOWxQeXZJRlFGUGdN?=
 =?utf-8?B?ZVFJQTdwKytKQ2ZaQ3d5MnQ4djJEWkVPWUt5VGtBZzEzYzNMd1RSQW5IU0xv?=
 =?utf-8?B?SkE2UFg3QUlFbldUQXFYSklxZ0NSQThzM3Z1TThXZ0l2RjM3dmZ4UDVHbmRy?=
 =?utf-8?B?cUc2cFh6M2MvYXVrOE1YdTREVFJ0bHlvMFJaK0ZMWDlXZlU4R28wUERQV3F4?=
 =?utf-8?B?RiszejJML0E0T3hINW9Xb1BHU3g4eWd1eWVRZFNYaUsySXdPZm9CZFhoNkha?=
 =?utf-8?B?SjRkRnpPUEZaLzNmR25JY0V3VTNFM2gzdVQ4ZDlLTEEvcHRtK0QrNFhFZXdz?=
 =?utf-8?B?WW55TXdoNkh2dktsWGVkRi9WU0tWcFhNdXErV2hPOFFaeTFvTklrOHdqMUVz?=
 =?utf-8?B?ZXhYTElOMUdxVzVJLy9IS2FFc3BYMk11L3RkM05ET0drM2dSSTlvVUNIUlNK?=
 =?utf-8?B?aE1pNjZqUFhjQTZQZ0dyMTcwNFlJd0dwMnZMV0RxOEd0cXpwR01iT085c2Nx?=
 =?utf-8?B?NERFSFhyTi82MUxJUmVNQkovRWxCWlN0MVJTT1VXT1YwODB6TjJxcncwOXBS?=
 =?utf-8?B?SHRiMDhTYUhEcVhQYnlLTkNmYWFoZmtkK1ZyTFhjREUrYUEzZzg3UzloOEJS?=
 =?utf-8?B?U1lhTlNLVXR3WFJCc21WcDlrcVhFdjRYZkgzOG55YlF1YnBXUHlULzUwNDVO?=
 =?utf-8?B?QnZLRndzMGJpTndSUHhKL295NjF6L0NwV2ppOUZOTVpMWHdFVmIydm92ZEtp?=
 =?utf-8?B?cUpOVWdtVEIvSHdJMnVhNkdhb2xDTGJHaHp6bW1XbmNpeGRrMUdOeHZ5Sjls?=
 =?utf-8?B?TVl1M2I1Z1NtV3ZjYllCUlpLVlZ2ZkNIYmg1Ym8yL0MzTTBaa21EMXc3cnlJ?=
 =?utf-8?B?V1c4K1ZWZFhTdzI3M3BhZG1MKzU0VThzaTFFYk5wMnhLcklBdHhxZC9KYlJl?=
 =?utf-8?B?aVFIaElPamVXTVFPZkpvYkJQMFBhcDA1RUw4QndnVmE1S1paUSt4VW1QRS9Q?=
 =?utf-8?B?d2dKN2o5UTlKeEl2cGRTcHVFREdpU1QyMFJkNVlrNjAzaUtoVCt6ZWhjTDN2?=
 =?utf-8?B?M0ErbHNDVElHL3AxdnBzNXdMQTFZRUgydHNlUkxrK0IyU1c5MnJyV3pJZGlI?=
 =?utf-8?Q?wEJ0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a33ce80-f5f0-418f-adf6-08dcc03e9ca4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 11:03:52.9589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRyhVw/uI6/We6i1C91VvZSh1pJ0BMY9gx6nlNOPuaCBjUIeG+p6uxZAF2ZqH183
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8503
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

Am 06.08.24 um 10:29 schrieb Thomas Hellström:
> Hi, Christian.
>
> On Thu, 2024-07-11 at 14:01 +0200, Christian König wrote:
>> Am 10.07.24 um 20:19 schrieb Matthew Brost:
>>> On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian König wrote:
>>>> That is something drivers really shouldn't mess with.
>>>>
>>> Thomas uses this in Xe to implement a shrinker [1]. Seems to need
>>> to
>>> remain available for drivers.
>> No, that is exactly what I try to prevent with that.
>>
>> This is an internally thing of TTM and drivers should never use it
>> directly.
> That driver-facing LRU walker is a direct response/solution to this
> comment that you made in the first shrinker series:
>
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9

Ah, yeah that was about how we are should be avoiding middle layer design.

But a function which returns the next candidate for eviction and a 
function which calls a callback for eviction is exactly the opposite.

> That is also mentioned in the cover letter of the recent shrinker
> series, and this walker has been around in that shrinker series for
> more than half a year now so if you think it's not the correct driver
> facing API IMHO that should be addressed by a review comment in that
> series rather than in posting a conflicting patch?

I actually outlined that in the review comments for the patch series. 
E.g. a walker function with a callback is basically a middle layer.

What outlined in the link above is that a function which returns the 
next eviction candidate is a better approach than a callback.

> So assuming that we still want the driver to register the shrinker,
> IMO that helper abstracts away all the nasty locking and pitfalls for a
> driver-registered shrinker, and is similar in structure to for example
> the pagewalk helper in mm/pagewalk.c.
>
> An alternative that could be tried as a driver-facing API is to provide
> a for_each_bo_in_lru_lock() macro where the driver open-codes
> "process_bo()" inside the for loop but I tried this and found it quite
> fragile since the driver might exit the loop without performing the
> necessary cleanup.

The point is that the shrinker should *never* need to have context. E.g. 
a walker which allows going over multiple BOs for eviction is exactly 
the wrong approach for that.

The shrinker should evict always only exactly one BO and the next 
invocation of a shrinker should not depend on the result of the previous 
one.

Or am I missing something vital here?

Regards,
Christian.

>
> However with using scoped_guard() in linux/cleanup.h that could
> probably be mitigated to some exent, but I still think that a walker
> helper like this is the safer choice and given the complexity of a for_
> macro involving scoped_guard(), I think the walker helper is the
> easiest-to-maintain solution moving forward.
>
> But open to suggestions.
>
> Thanks
> Thomas
>
>
>> Regards,
>> Christian.
>>
>>> Matt
>>>
>>> [1]
>>> https://patchwork.freedesktop.org/patch/602165/?series=131815&rev=6
>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/ttm/ttm_bo.c      |  1 +
>>>>    drivers/gpu/drm/ttm/ttm_bo_util.c |  2 +
>>>>    drivers/gpu/drm/ttm/ttm_bo_util.h | 67
>>>> +++++++++++++++++++++++++++++++
>>>>    include/drm/ttm/ttm_bo.h          | 35 ----------------
>>>>    4 files changed, 70 insertions(+), 35 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/ttm/ttm_bo_util.h
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index 0131ec802066..41bee8696e69 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -45,6 +45,7 @@
>>>>    #include <linux/dma-resv.h>
>>>>    
>>>>    #include "ttm_module.h"
>>>> +#include "ttm_bo_util.h"
>>>>    
>>>>    static void ttm_bo_mem_space_debug(struct ttm_buffer_object
>>>> *bo,
>>>>    					struct ttm_placement
>>>> *placement)
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> index 3c07f4712d5c..03e28e3d0d03 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> @@ -37,6 +37,8 @@
>>>>    
>>>>    #include <drm/drm_cache.h>
>>>>    
>>>> +#include "ttm_bo_util.h"
>>>> +
>>>>    struct ttm_transfer_obj {
>>>>    	struct ttm_buffer_object base;
>>>>    	struct ttm_buffer_object *bo;
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.h
>>>> b/drivers/gpu/drm/ttm/ttm_bo_util.h
>>>> new file mode 100644
>>>> index 000000000000..c19b50809208
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.h
>>>> @@ -0,0 +1,67 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>>>> +/***************************************************************
>>>> ***********
>>>> + * Copyright 2024 Advanced Micro Devices, Inc.
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person
>>>> obtaining a
>>>> + * copy of this software and associated documentation files (the
>>>> "Software"),
>>>> + * to deal in the Software without restriction, including
>>>> without limitation
>>>> + * the rights to use, copy, modify, merge, publish, distribute,
>>>> sublicense,
>>>> + * and/or sell copies of the Software, and to permit persons to
>>>> whom the
>>>> + * Software is furnished to do so, subject to the following
>>>> conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall
>>>> be included in
>>>> + * all copies or substantial portions of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
>>>> KIND, EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>> MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
>>>> EVENT SHALL
>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
>>>> DAMAGES OR
>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>>> OTHERWISE,
>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
>>>> THE USE OR
>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>> + *
>>>> +
>>>> *****************************************************************
>>>> *********/
>>>> +#ifndef _TTM_BO_UTIL_H_
>>>> +#define _TTM_BO_UTIL_H_
>>>> +
>>>> +struct ww_acquire_ctx;
>>>> +
>>>> +struct ttm_buffer_object;
>>>> +struct ttm_operation_ctx;
>>>> +struct ttm_lru_walk;
>>>> +
>>>> +/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
>>>> +struct ttm_lru_walk_ops {
>>>> +	/**
>>>> +	 * process_bo - Process this bo.
>>>> +	 * @walk: struct ttm_lru_walk describing the walk.
>>>> +	 * @bo: A locked and referenced buffer object.
>>>> +	 *
>>>> +	 * Return: Negative error code on error, User-defined
>>>> positive value
>>>> +	 * (typically, but not always, size of the processed bo)
>>>> on success.
>>>> +	 * On success, the returned values are summed by the
>>>> walk and the
>>>> +	 * walk exits when its target is met.
>>>> +	 * 0 also indicates success, -EBUSY means this bo was
>>>> skipped.
>>>> +	 */
>>>> +	s64 (*process_bo)(struct ttm_lru_walk *walk,
>>>> +			  struct ttm_buffer_object *bo);
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct ttm_lru_walk - Structure describing a LRU walk.
>>>> + */
>>>> +struct ttm_lru_walk {
>>>> +	/** @ops: Pointer to the ops structure. */
>>>> +	const struct ttm_lru_walk_ops *ops;
>>>> +	/** @ctx: Pointer to the struct ttm_operation_ctx. */
>>>> +	struct ttm_operation_ctx *ctx;
>>>> +	/** @ticket: The struct ww_acquire_ctx if any. */
>>>> +	struct ww_acquire_ctx *ticket;
>>>> +	/** @tryock_only: Only use trylock for locking. */
>>>> +	bool trylock_only;
>>>> +};
>>>> +
>>>> +s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
>>>> ttm_device *bdev,
>>>> +			   struct ttm_resource_manager *man, s64
>>>> target);
>>>> +
>>>> +#endif
>>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>>> index d1a732d56259..5f7c967222a2 100644
>>>> --- a/include/drm/ttm/ttm_bo.h
>>>> +++ b/include/drm/ttm/ttm_bo.h
>>>> @@ -194,41 +194,6 @@ struct ttm_operation_ctx {
>>>>    	uint64_t bytes_moved;
>>>>    };
>>>>    
>>>> -struct ttm_lru_walk;
>>>> -
>>>> -/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
>>>> -struct ttm_lru_walk_ops {
>>>> -	/**
>>>> -	 * process_bo - Process this bo.
>>>> -	 * @walk: struct ttm_lru_walk describing the walk.
>>>> -	 * @bo: A locked and referenced buffer object.
>>>> -	 *
>>>> -	 * Return: Negative error code on error, User-defined
>>>> positive value
>>>> -	 * (typically, but not always, size of the processed bo)
>>>> on success.
>>>> -	 * On success, the returned values are summed by the
>>>> walk and the
>>>> -	 * walk exits when its target is met.
>>>> -	 * 0 also indicates success, -EBUSY means this bo was
>>>> skipped.
>>>> -	 */
>>>> -	s64 (*process_bo)(struct ttm_lru_walk *walk, struct
>>>> ttm_buffer_object *bo);
>>>> -};
>>>> -
>>>> -/**
>>>> - * struct ttm_lru_walk - Structure describing a LRU walk.
>>>> - */
>>>> -struct ttm_lru_walk {
>>>> -	/** @ops: Pointer to the ops structure. */
>>>> -	const struct ttm_lru_walk_ops *ops;
>>>> -	/** @ctx: Pointer to the struct ttm_operation_ctx. */
>>>> -	struct ttm_operation_ctx *ctx;
>>>> -	/** @ticket: The struct ww_acquire_ctx if any. */
>>>> -	struct ww_acquire_ctx *ticket;
>>>> -	/** @tryock_only: Only use trylock for locking. */
>>>> -	bool trylock_only;
>>>> -};
>>>> -
>>>> -s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
>>>> ttm_device *bdev,
>>>> -			   struct ttm_resource_manager *man, s64
>>>> target);
>>>> -
>>>>    /**
>>>>     * ttm_bo_get - reference a struct ttm_buffer_object
>>>>     *
>>>> -- 
>>>> 2.34.1
>>>>

