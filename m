Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCC0AF7FA0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 20:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F5D10E069;
	Thu,  3 Jul 2025 18:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Bypec2gh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F2810E069
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 18:15:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppjg6OlTzXRTwlFjJuBgtUA5TXNR6uCft4L2hZVqnkrpa28UgveOML86v6D22TpLVbiUsCiQuV8fdq5/f++lMpzmgjEJrnhaV1eCsQUEvMcSB3zYmGQ7XbWmbFM/E1a6sJwSsn+C4Yv090jhl5yiniH4G1doKW0UNNotCV8GFKlnTTDYwVX4xCQjGlrOqfuDREIBrcx7t9u3k7/z7CqcbD+5p2LHS/v18bGN5qhoq/37/0LyHMQscvUOxJwIs6oRsuit0Pvsus0m3Xza0YRuUiYTyV06wqX4SmT6KNHzKkcJ5IAHOTTyzCXUwfu7PGB+RaRCSlH4r0QdZjWfz6eLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=depYCmIIeEI6LdCF95DhYR96vKgDflftsgV8BwCvvmI=;
 b=wAXOrWw18fUmTMYoeqEoBIpObrgIYaj6G26OwZbZ9t5Us66TA+iOAnwiSsD9MvdwLOvCZSDhp38PqlBcp3J3OcHR4cgsgonpc9STCRn3s/rlek67GsrZq61kBgwEpni60oAeef+DFx/wRu6/Wb2ANNFCIq584bHoxnoQvJGRqv4F0izrzoR9iUBrD+HNL/qVSuhHpDICfYAWgsOiYuYDJa5uQtaGB1o9S/qDXwMlw+UuUSfW3AZ6nIFVKKw3qD3IrplWqZxI0d5OHdulQjSouBdoKBHRq78INPDZgF2hGvHPifS0lGyJD9jG2yTaVzjC8vrJjt2oYggbv8JECe1Npw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=depYCmIIeEI6LdCF95DhYR96vKgDflftsgV8BwCvvmI=;
 b=Bypec2ghI80gH3Sy9g1MFq4AjnhKn1dJGGnrmN3uT6yBUIcgSNpvX091kYlMK/EIWdMTMn07ryFinHfVzTFshhraPsawjlwfNfUHwL3ykaOuUu7TCuLAiekrF+RLlnvEpr7FVkeOM3MKqmnoMIpr9cuX4NpkAnjsJEPMfpHT4n8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 3 Jul
 2025 18:15:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 18:15:13 +0000
Message-ID: <0b887b01-6de3-4633-86f7-20f5b43eeb35@amd.com>
Date: Thu, 3 Jul 2025 20:15:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] amdgpu: add support for memory cgroups
To: Shakeel Butt <shakeel.butt@linux.dev>, David Airlie <airlied@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-18-airlied@gmail.com>
 <wejb2ykaltp5gtufrzz3mwp43hrxugzuubclt4amrpr4koznan@cb7dfmnvik6a>
 <CAMwc25rPTiTshBMvHeGr=8kwC+MJdSA=UdKucybTwSxbuWvk4A@mail.gmail.com>
 <3b5t4djauhnbvhqjwuktrcphlvahpdyi2b6j3ktoapakxcvpgz@zjpokeykiwy7>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3b5t4djauhnbvhqjwuktrcphlvahpdyi2b6j3ktoapakxcvpgz@zjpokeykiwy7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: c29bd85e-52e6-4a85-27bd-08ddba5d8e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXV2VFpWQkl4VHBQYm5ZYlpzVmJYYVpmUm9pZkN4WGRUK0lmMk0xcy9BR3A5?=
 =?utf-8?B?YWYwMHJPV0trMTVUSWpNclhLb2hZNUsrOGJyR0lhWnRCOWNLYk5CWWtYUVl4?=
 =?utf-8?B?YmlKdUJEN2o3cUFpYTg0TTcxTWFVd1JONzN6VWQrL29WRXUrbUJaOHkycXEw?=
 =?utf-8?B?d1VhTnZ0OHA4TzV1aU8xOVdGSDlCNHZ2VmFPT2FCY3pxdmZVTE51QTFYa0Nr?=
 =?utf-8?B?bmlMcWlmYkYzUks4TFc1R1VwQ0JVWllWaFdZbVV5cUR0Y1VDN0tiVWNVQ3lW?=
 =?utf-8?B?eWRrUGxHaXlPSkRPdmZGa1J3cHpzVkduZDZnRXdDUjg5Ykxoa1UrcGVLcVNI?=
 =?utf-8?B?V0NkUUhvclQ5UjgwU2NhczhxRFZPZ1Zic1VQd2tGM1Ewb1N2ZUFwWTJoVTFU?=
 =?utf-8?B?MlRsMHd0YnNLTlRSV0h5THpmRGJZN0JIR0NPQnlodGdIMmxZTFFIRWZnd2VE?=
 =?utf-8?B?dFRWQ2VnK051YXlKN0xUVGd3SmtkUURDdEdoWnp4WmtJUzlxOHNEdGxhbCtO?=
 =?utf-8?B?Y0pac1FkdFArZmpaNmlqUlVwejlWOXN5RFlhTnczZ0FDMDdJZ0VEVHprS0tT?=
 =?utf-8?B?OUZibHlVTXB2RXMxSnVKUnZObnhkYURZZytta1RlT1dRZzR0bkZ2SUFLT3dZ?=
 =?utf-8?B?cll4WW1Vc2gyOXNyVUFJb0VwV2ZvYUpMRnRlUko3VjVVaTNENkV3R2tEdHVy?=
 =?utf-8?B?RlF4NXNSTXRoZitFYkVCcnVIQmVERlAzcEFaUFpvaEwvSENuWk9yZHo5KzFB?=
 =?utf-8?B?NmhMWW9teWc3ZkwvT0Z4S2xyWkhyZXZ5TFdNOERBU0w3a0xiVTNLb0VDMVNQ?=
 =?utf-8?B?bkVYREdTUnpmdmVhMWFITGFuL1lIZkJWampnSzdNaElBSXJERjM4NnE0SUg4?=
 =?utf-8?B?U3RrM0JManY2aDdkSTJtVjFkVDJUb3hsY1B2S2xQMVJITUp5SVl5MDR6Zmhl?=
 =?utf-8?B?SEJoSk8rZUtqTVRyWUxHd3JvOFNKcmFCYlE1REZmQS81WE1KWkJJQ3JMdXlF?=
 =?utf-8?B?M0Y4NlgzUVFoMWVhaGZGWkkxQ09PY295aXFZRytNMDM0Qkg0VEx3Y21jVytE?=
 =?utf-8?B?UTNRK1JGVWZURytLemF1eWpDN3dTV2QrS1J6eU1SSThVYUlLeFI3V2RMRnYw?=
 =?utf-8?B?T3JhZ04vQWFySjZTTjA3Qnd5cDZiUWdlYzZXTm9lRTZCN00rejlkUnRQeDQ3?=
 =?utf-8?B?UWZFWE9ZUkhIL3ZFbjVVREJ3QWlTS1dqamJhT25CcnNMd2g4UHYvOXM2bmUw?=
 =?utf-8?B?dW5EVWxKMUJXS01TakxQbDVBV1BhRDRBOFJ4WEwzeWtta2krOUp3dnl6NkRl?=
 =?utf-8?B?d1ZOaUxycHFBMDEwUXJvUGxOc1Y1YW5MeFFUQzdwUDgxcFc1ZUljOS9Ndmpj?=
 =?utf-8?B?c1FFRndKbEhDSVVYbGM3Z3AxTVp6SFNoWmRVWnVlWG9vZmFiWCtFOGtDMEtk?=
 =?utf-8?B?a2M3SU1xbjA1cG5SWnI0dDNFbFpWQkFxaTRMTFk3Y1FEN1lDV1BnNUttT3pp?=
 =?utf-8?B?ZkRYMHlVMjNBY0FaTEF2SFRqUmIrTzdkcitHajhNNlo2TU5uMUFGcG55NmVU?=
 =?utf-8?B?d3BNT05FVW5FMm5ySmY4cmE1RG1HZmpCcktjNUhsUmwwYzNZYWViNHBScEth?=
 =?utf-8?B?R1oyTDNCYnBvdGo0azNUaXNRK1B2UFJXNk9abXZFYksvaS9qMG5HTW1zcFU4?=
 =?utf-8?B?bkRldzYyR3BrczAyOHZoWWtnZEFGc1R4Wm9KNGVsOUZtTHZMcTNwNThlT3U5?=
 =?utf-8?B?YngrWitZNlR3YnNkejh1eVBwbkFkeHJHclBRZzdjSVNBbktqOVJTMmhQRXFZ?=
 =?utf-8?B?WjRJL2F3NkFkb215Skx3bEdYZHBrWUU5a3lBaVE4Rm1JSGxTNTJ6U01jUXh0?=
 =?utf-8?B?YkhhOFlsbndvK1RHTk5CdlVjRHF6TURWbDRlbFRwdFVmNG8wcGxpZmlhR3Bm?=
 =?utf-8?Q?NCSFVhvJtUM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cy9GQnZianJuMXYxUlhYYXMwenMwRGtDalY5djVZNDl3TmM1Qk1vTGkzbWVI?=
 =?utf-8?B?MUhIVFBZTHl3R21TN29yYnlNMmtBSUVKZVgwRnluZkZrSzRDaExERlBRMDN1?=
 =?utf-8?B?Tng0dU83dTROdlFnRUVlNnJDMlpXWVJjbFk3TEdGT0dnYTBVUDRSSXptSWxQ?=
 =?utf-8?B?eVdkV0ZUODRiTXNzVGwzZzJSRTVjOWdJZnJjNHk4T0NkVFdSc3ozbVIyVmU3?=
 =?utf-8?B?T0tUUW1NUFlLM1IxWkk1RjNoeGVnbms4NGhrZDQ4V3I3MC9obHJvOUQzRVdD?=
 =?utf-8?B?T2lnNlg4SWtyYXYxd2xVVVVSWkVUTlR5a3lUaVVXNXArRXFnWk9lcWNpVWZD?=
 =?utf-8?B?czhJSjRDMDNMb2E0SzVlbGRtcktINE0velg3QXd1MzFLNnJGL094bkc1RzR3?=
 =?utf-8?B?cTdDY3NaM3ZlZDZWWVNXbUlsRUNySW1aTW5OWGRoc3RQOXM1a3dFeWtMSkly?=
 =?utf-8?B?clIzaDdoNFZVc0poSlB6QmFGRWdHU3Q0WEtpdVF0Mzk2ckRhRGZLNXZzVE44?=
 =?utf-8?B?Yk53dmFxWEFscVhCcUdCNUFtM0o0MTN4Q25IdFY5L0Rtc2QyQy8wOUdoc0Nx?=
 =?utf-8?B?ZkdRTkZCT20zZm83bnRIai9wakJ0ZnM0NTB4SHlSY2RuTTAvNzF5dTJDMVNL?=
 =?utf-8?B?Ti9Ga01KTjExNXMrKzNVQ0hZSmIzKzF0czNVUjltY21lYVVJSlB2T2R4SCs1?=
 =?utf-8?B?d0kwR1dnTGpTWWZFRFRxbmlXMXgzaFhhKzVZNkV4OU1iYXh1MjVQd0lxV3ZH?=
 =?utf-8?B?LzVXZVJJblBtVTE0RG9wdlJISHdUKzh1dGRuQU5ETGloZ1FIaGhqVmU5VzZt?=
 =?utf-8?B?T0tXWENMMUdaNmFMbFRRdWtjZ1ZFUk9xbVJ4TWtGUkNaOEVNMS81YVduQmRW?=
 =?utf-8?B?OE9tS3crbjdVd0Y3d1BYeHRZcnBETnEyc1owQUkrK09JZUZRdHRZcjF2dE10?=
 =?utf-8?B?OHN2M3FjbzhXTm1FbEF2ZEZLYlhSUzJZV21FdlR3Qno4YWE1NmEwdWwwOTdE?=
 =?utf-8?B?aXdTZUhMY3BuWEVaczJ2Z2t0M050S3UvWis4NWZ1THB5T3hxV3lwc2RYVzh3?=
 =?utf-8?B?eW9pL2V2V1RvMFNzUG45Y0VjYmJDWVRMSEZLK3BjMFA0dlJ5QmpubGNBV3R5?=
 =?utf-8?B?N3h2MXZEQmJDbXVxUTY0M1RpRlVYK0pZelFFQTFLaDFuK2tzaGp0L2dvWWtv?=
 =?utf-8?B?Mjlua25rTk1kMktwR3FCRythZUV4NWphMHZRcEk0MEZ0Nk1wSkZtWUtEd2J3?=
 =?utf-8?B?U2NiM3UwYlI1cFdZVmxtWjZIU3ZjSzBTYWJNdWI4am1zNFA2c09uWUJHSHE3?=
 =?utf-8?B?a2VJc1NSbEtmSzczMC83ekNBcEFaeGs0ek5TVkZFQTA3UlljTDhaT1RwQndv?=
 =?utf-8?B?NEszYjM5ai9ramh1YTZtNzFQUy9zeEJIVEl0eS9jQXBYdmdZZ3hxVlRoZUdI?=
 =?utf-8?B?bG9kUUJ5ejFKOWY2OHdTOHhSN1FEa0NFRU91ekVHYjE2WmVhd0x0SXRGZDVj?=
 =?utf-8?B?aGcrQTZMSktvZlNhTWxLeG5mMzBvNXJhWC9TN2h5V20yaUlDc0s5NGMwQXdk?=
 =?utf-8?B?aWtBSzhZaW9OVmJpWnR6dTMzWi9QaGYxR2VmdHZsZUNyWFZ1REp0UlJRNnpy?=
 =?utf-8?B?R2ZaaTBMNGJuaHFDRS9DSFFQa2VEUkVIaWkzbHBDc2pxdXdNRU8yWit6S2Vt?=
 =?utf-8?B?Q1BmSlJlZHo1Wm5hZ1NMZXJuLzlkcEFQakpqcitGcmV2V2xnVzExWVZZbW1J?=
 =?utf-8?B?SDQ0ZTJ0VjN4anZ2UTM3Q3lnaUlZUDB1eFJuZ3BUSDJCQW9uYlZCWmlHM1dS?=
 =?utf-8?B?aEpNTEwyMWxyU0lUeVFwMXB2ZnYvTEQrV2dkeURpelFYVmZURlg4MUljR214?=
 =?utf-8?B?OHhpSE1xazkxbzBVUVFzN05qdjZFenovTUdicVBRVXhzbS9MaWF6bnAvM01p?=
 =?utf-8?B?Vm8vcGRKak1HelpwZ2Z0cjNGTkdabmZkSmh6NHo1RTcxRGxCYlFtdG5WR1N5?=
 =?utf-8?B?R1FSVUQ0ZVEwQnQ2N3ZsV3F6dTYyRDBPSDRWbVZlQ3loS3pxRFJSQmdSNitj?=
 =?utf-8?B?MkV4VFdQV1RCMGtSYU1lWTNnRDZFT3N4NE42N1Y1NG1Xb0d4YlhzaWdNMjMr?=
 =?utf-8?Q?oZX4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c29bd85e-52e6-4a85-27bd-08ddba5d8e33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:15:13.8601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1Te/5cCK7iPJQtW3ijR0AgP91ZQMIkwmLhpgPp1KpnMrDi5jDhPEwd3a1a8rI78
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570
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

On 03.07.25 19:58, Shakeel Butt wrote:
> On Thu, Jul 03, 2025 at 12:53:44PM +1000, David Airlie wrote:
>> On Thu, Jul 3, 2025 at 2:03 AM Shakeel Butt <shakeel.butt@linux.dev> wrote:
>>>
>>> On Mon, Jun 30, 2025 at 02:49:36PM +1000, Dave Airlie wrote:
>>>> From: Dave Airlie <airlied@redhat.com>
>>>>
>>>> This adds support for adding a obj cgroup to a buffer object,
>>>> and passing in the placement flags to make sure it's accounted
>>>> properly.
>>>>
>>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>>> ---
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 ++
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 +++++++++----
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 +
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  2 ++
>>>>  4 files changed, 14 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> index e5e33a68d935..d250183bab03 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> @@ -198,6 +198,7 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>>>>       struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
>>>>
>>>>       amdgpu_hmm_unregister(aobj);
>>>> +     obj_cgroup_put(aobj->tbo.objcg);
>>>>       ttm_bo_put(&aobj->tbo);
>>>>  }
>>>>
>>>> @@ -225,6 +226,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>>>>       bp.domain = initial_domain;
>>>>       bp.bo_ptr_size = sizeof(struct amdgpu_bo);
>>>>       bp.xcp_id_plus1 = xcp_id_plus1;
>>>> +     bp.objcg = get_obj_cgroup_from_current();
>>>
>>> In what context this function is called? Is that the same for
>>> ttm_pool_alloc_page()? Is remote charging happening in
>>> ttm_pool_alloc_page()?
>>>
>>
>> No, this function is called from userspace ioctl paths that allocate
>> GPU objects (GEM objects).
>>
>> The objects are lazily allocated, so this might not trigger any pages
>> being bound to the object, until it is populated, either via mapping +
>> page faults or by being used in a GPU command submission, which is
>> when the ttm_pool_alloc_page happens.
>>
> 
> For the mapping + page fault or GPU command submission, can there be a
> case where 'current' is not in the same cgroup as the task which has
> called amdgpu_gem_object_create() through ioctl? Can the allocation
> happen in kthread or workqueue or irq?

Yes, in some use cases that is actually the most common way of ending up in the memory allocation.

Background is that the first one who touches it actually does the allocation.

BTW: It might be a good idea to not only limit the amount of memory you actually have allocated, but also how much you wanted to allocate.

Regards,
Christian.

