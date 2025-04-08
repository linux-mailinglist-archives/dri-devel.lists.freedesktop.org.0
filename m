Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48CA8010B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 13:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4F810E669;
	Tue,  8 Apr 2025 11:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4VqMUEGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F9510E669;
 Tue,  8 Apr 2025 11:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUeGnlEWtam+JQNh8J0/nnHc4a0HEkN9XhvuttCcKM+pozU40DDWi9ylcS1/0eSVz96c0lpIpvTL6IOiTCNjGVolsKx0EoZK2Xpt/aeupfbKl7E1gfhvlqn0ApWxH4+Oz3GG9pU5AE9szJzkBjc4LPKgmHJH72ian1XRAw0BprTuyz7WO5ylcPXpTkpVDcnG8zv2iuCX4h+rsr2dlNTUj15nUoyLgD250jl6aI3QJ0x9wUn1rNgz1soNOOX2NJ04jRmN+MV1bCfy01TfBAkbssuHFdd5rBO0lsnzHU+1N/4L0dlj/1pQxq/O3Qw6p3yCh7xdNl+f27UfdrOnd/4Dmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SR5LUd9wmw9minZVXH7D3MxjwGyk+Xhr57j+7ZwOuY=;
 b=Z30hiu2msp6nnzLTA+ZQWTXYeTtfCPy3P9gkjmi8WEaAbOZgzrYj3RqbLJzktWJ/ydJN3WZp7mIuDO14dyRWJvomfh5pv2+n1PjJ3Rt9D0DOIkyAAdsO8hveD+PcHA7blxEyQMyyi0NadEqtXsyyh7DMNK9/pSFEqvgF3FFOQMmG8suNdsR1HUQSMrMjt65nLW1X5/Y8jR21h8sgFFHqZRIMLgT+a6vSKufpx60Yo0rG2DIv+SZ5dtpKeGWJo1r9LXeeXi2HR3P1Amv/Qu6m+Aq6L3XWCHxdvXyph8cKi0O8a7FJjnp6u/Rj9iKGrbVystMg3H8JYwQwbGhMw/8Pig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SR5LUd9wmw9minZVXH7D3MxjwGyk+Xhr57j+7ZwOuY=;
 b=4VqMUEGC0BUAN+tXtxz6hKdJTCqG0wEP5TQbX38YNw1CEWocec63XNQ0KEfhCWEuNhqkPWhwCTHyZAIAlDJnBzIUiK1n/QpdzWlTw4GHyYxVRk2s0MGBh11guAX7n8EkJe3080+Fo+ydHhh4W7s1DkmZxEk0GRM/iEYeeRtnyow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6074.namprd12.prod.outlook.com (2603:10b6:a03:45f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 11:37:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8583.045; Tue, 8 Apr 2025
 11:37:23 +0000
Message-ID: <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com>
Date: Tue, 8 Apr 2025 13:37:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number of
 BOs in list
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Denis Arefev <arefev@swemel.ru>, Alex Deucher
 <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, lvc-project@linuxtesting.org,
 Chunming Zhou <david1.zhou@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, David Airlie <airlied@gmail.com>
References: <20250408091755.10074-1-arefev@swemel.ru>
 <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: cabfcbfe-f86f-43e8-6e52-08dd7691ba7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDBsRlI5ZXcxSGNwR2F3V04zU3BYNHRENzZKV0hnb21hSzRHcWlEbUhUV1Bk?=
 =?utf-8?B?UlI1cWtlN2NpRnBKWWIzVjVvMjhJbHJYMlVNa1ROcklSSjhWSlFRdHJKbHc1?=
 =?utf-8?B?V2ZlbDB0YUxsMzVqektPb0NQZ3RxaDlRZHp1NkVLRzlXZk9jMWhTUlZNdmYz?=
 =?utf-8?B?d2FHTnN0bmk5d0FwdzV4YkhGTkVsUitJRmhOTUFoN244ak5rMllnUUx0MUxF?=
 =?utf-8?B?WWZlcDdvQy8yWnRZTUZtMGVkNmViVi9JQjBxTHdxM3VkL0xGNkxWd3ZDMkpk?=
 =?utf-8?B?RC9jUlZKaWJVVnNSU1owSU50c0J6aUhrbndOWVI4eCtCU1Z6UGgrMTREYjNp?=
 =?utf-8?B?Ui9QU1I2Q05MZXp1eWppbTRMMXFlR2VSY0lnRW5jL0VJUVovVVgvSmNIV3JX?=
 =?utf-8?B?QzZxOVFjN1RGQ0FrclNDQTJhK2d3dDN2SVNsNGlwWHB5WWpJVXF3aGR2dStI?=
 =?utf-8?B?UkVSYVRQZ1VLMGl5UFdySzlkUGc0WFRvdDdaMlFVd01qVGpXMWcrMElobVVM?=
 =?utf-8?B?NnNBd0VneDNpZGJ0QXYvSW1ueFg1NzdYd210STVPb0F0eHgxc0pxUXVyZk5a?=
 =?utf-8?B?ZGVGbExMZlpuZW1pUUJ2eVB0VFMrejlZM0JlV09FN2dhZ0ZVMnp1Q2lsTHZo?=
 =?utf-8?B?Tmo0dk1wbWhkTzhWUWYzYXc0aStKTXhSTm94MmgzOGYyZWtCT2k2NHpHMS9r?=
 =?utf-8?B?Mk42RDdBT2ZaejBpMUswNjlrVGkycStFcGR4WHBXMmJJZ09vamZBYmtKOGRH?=
 =?utf-8?B?dEpuZXpqMzhUUE1vemd1OHNFR2thU2V1VGFRV3JjWStJQmJqTEF1WFJlMVND?=
 =?utf-8?B?dXBwc3E4Ym03UEYyYjIwN1B4UzJPTjdDOTNLVUJPRTY1anBQU2R0eERFYUht?=
 =?utf-8?B?WjFYME1pMG1Tc3hTdEJ3L2t2dzhEWDE3RDF3ZkR1YVlKVThpQlRCbCtkWnFi?=
 =?utf-8?B?ckN2VTJJUmJZWjdDS1VoTzdhQjVQeUlWdG90SW1VTm54OVJpQWFuK1R1TkQv?=
 =?utf-8?B?ZkZKM25aOXdpZ01jTVc3YjJLL1QvREtoRXNPNHd5c0JJMEVMQUhpaXJZMXNL?=
 =?utf-8?B?VG1wM0w2WVE3NTIvRGJmVk5LdUdMU0x0emFRWEdBUGxEdzZNVDlBVisvbW43?=
 =?utf-8?B?eUhRWU0wNmYzaGhITERsL3N1YkZBYTFabzRVOWErYkJhSW9HcVBjdjBXTjJ2?=
 =?utf-8?B?R3JZSDRxWHluTGwvczM4VzN5a29ZUzNXTWk1SkJjS2lkcTQ5SXJlRHdkTkVI?=
 =?utf-8?B?dXl0RnBrREd6dC9Dem9ZQTFQd1FGVWwrS2V2STRhU3h2N3BqUFhEV2gwU1l6?=
 =?utf-8?B?K2w5UWx6UE9iQUFVQXlnWDIrVkR2azVKVXlkVTdlUlVzQVpPc0UydVdPL1Fp?=
 =?utf-8?B?dWtvQ2RqbzlxZFRkc3FOM0ZLaHhMV1FMdlFpZERHN05uR0J1TGtVT3FzQVVa?=
 =?utf-8?B?K00vMlpmdXFuazZ3MkMwclZGSnp3Sm4wVC9uQUlra2plVmNWMExIWU54ZjV0?=
 =?utf-8?B?SGNEcHhHVGtJRk1TWkJGdTlqcUNUaHpYSG05b3BqcHBqUndXQ1JFdm9CM1JO?=
 =?utf-8?B?dlo2Zldwenl6UUtVYjB4OGtBbXlPSC91OFhTMDJMZlJIdWU5VjRKNWZhTXNL?=
 =?utf-8?B?RlM0L1Z1U0doeFBuOWlJakg2Y3plRXlacGZqWktEelpkMXV0QklGb2ROQXRj?=
 =?utf-8?B?OFBsSms2ZXIvcDAyTk1hTFhmMC9lRUp6MlBPdzczS1VxNnQvQi81UGFOdlpO?=
 =?utf-8?B?TjF2VmlaVkFTVmFkNnRFUWZJc2diSTdDMnJDd1ZvOW5kTnN5TzhMWklKU1li?=
 =?utf-8?B?Tk9aZCtacWh2T09pRDVtNkRPRFR0R0RuMWxjSnpwblkvbHRoRjBSU3Y0eWhk?=
 =?utf-8?Q?n/td4oZir6bKq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck92U3hrUFBoQW9wNnZKSzFnTHVXNmRQU1JoMmlhVlRGR2k2LzVNSnBJUHRs?=
 =?utf-8?B?L1cxTmdINzNub2Myc3BCbm5UV0REaEs2S3V3R2RXRkRhMzhkclVISm85NmhF?=
 =?utf-8?B?aDJqUCt3WmdEK2N5SlcrWkkwTmdtUURGZEFtZ2kvWkNRU1JiZU9nM1k4eHla?=
 =?utf-8?B?R2tuMTNkQzcwZ0JkTm5ncHpQbjNZQ3Y5RzhNVGtmemt2ZkhodjlSQWlMQkJH?=
 =?utf-8?B?R2N5T1R4MVZ0YzhjVTJNWWo2Zkd6ZkU1bXRVSElXUUhHaVlOcHpsZEtlUkJV?=
 =?utf-8?B?azVxMjlzQjhkRHVuaW9hUjJpWTRKSXRza2FGdU42WnBxSXM4YmY3c2p0UEtO?=
 =?utf-8?B?dnRoaktCVHJuTHBTYWhpQ0tUS0VsT3RrY3ZpMmRpNnRpK3Fzam5hbml3M1cv?=
 =?utf-8?B?T1c3OWZXd0tkWTdaWldaeGEzWGZRL21aemc2dVBPVHpoaDZlZmphSElkVWJQ?=
 =?utf-8?B?bHZvaDMxcWJZK2ZwcjFvU0dpdXgxRDlHUHdIOVo1VWR1YTBlOFJWbjVqU3VI?=
 =?utf-8?B?aDJqTXEzMEhGbzdmRmU5TElvcVRKOFMxRmxIeW9CNHJDWEUyeERuY05IWmpX?=
 =?utf-8?B?dUpKS2lmM0xhOWZIeWVYWHR6cUFiT2NzVWdCWk9PVXVEWWlxekVwUnA0SGxt?=
 =?utf-8?B?cjczSllMb1p4SXVucFZyUnhXNkF5V3dmVXE3YWhJOEV0dlBOT2JjVTZyWm5U?=
 =?utf-8?B?eVpNZ2VPTGpIMDJBK0Rra1huZW51ZFRpMVRzT0RRb1kxZEZSZEdDdEhDT0Rk?=
 =?utf-8?B?U2dCOTZ6YUtGRHA5SS9hTmwwSDhpSW1IZUU1WkNTeUg5NlRsOWNNbklHZC9V?=
 =?utf-8?B?Wko5RExUeTRua0U2NExTdDFwUWcvd1ZieXVJZ3J4TjltR2l1VEdYZ09KK1RP?=
 =?utf-8?B?VXBLb0ZaZkJvaUFoWUtveEZHTkhaSTJ1UjBkSDZHRnNaWHZvVyt0SXdvNXdE?=
 =?utf-8?B?MkFBOUtCNkdFQnNpeC9VQlcwdnMxV1V0NWZaSlNiZmZ3NWRNYWRaNURSaUV1?=
 =?utf-8?B?UVdyZGV1VVVTNldJZHZ0VTdsMHhicm9TcXZ4VTRoWTRkNlNvT29Db1Q3SXNJ?=
 =?utf-8?B?UEpNL3djd2RjWDUwNTlqMCs0eDIwQXhKU2RtMjQ2S09aS1hkOEU1c2REWGZ6?=
 =?utf-8?B?VEtwZ0dOc3pVMzdWS05mNVl4eFZrSVcwTlhwTkUya2RqWTFpNzlyUlVmejVT?=
 =?utf-8?B?dzNQb05YdlBmOEtpMnFkM01NNldaemNCaGhsenF1M1UwVGFhT0c4blB3ZU1D?=
 =?utf-8?B?L1puajM5NEVoQnNjWnNQWnhORVJqODVkUFlYVytLM0NydGovK0JZSXJuQUQ5?=
 =?utf-8?B?VzYyM0Y4YmJHY1c0aEFaaFVHUlBpODFEVE8vOEw1V1gwaW52K2tTRWJFcEpW?=
 =?utf-8?B?elJWSWV2T0gycWxlcTJBU0Nld3B2cFc4TDhGa2lMZ09MU0dDZWNQLzduMkQx?=
 =?utf-8?B?S1FYSmxqVnI2ZHVHOHRvY3NJRkREZ2JSaW9OaTBiZHBCTUcrN0lud1U5bmxi?=
 =?utf-8?B?YkRDMnA0VjZnQXRJVGF4cFc5S3czczExMDFCOFljK29iMG5FZkVySnNnQXh6?=
 =?utf-8?B?YVBCQlRnRTE1UmJMand5QWZTL3ErcVhBWTFodkxsdFVaNFIwMEd3NjBEZzV6?=
 =?utf-8?B?RDVYaml0Zng0bCtaek10ZDJGeWpaQWFETEh4dTU3Y1M5NHFHSWppMDNJc1Ba?=
 =?utf-8?B?N2ZwYXRrY2t3dVpZM0wyL1ZyUDhUMTQ1MVRRd1Q5NFoyUGhhQU5Qa2ZFbmhQ?=
 =?utf-8?B?N0VXaDhkakpGU1lzUzdPQ0xWQnNkNEpvaW4ralNhdlZGVmNybVlNTU9BWVZn?=
 =?utf-8?B?ZEc3U3NlNFVXVDBLbHc2Zmk2SG1wSUdSWjVRN211dEltRVZ6NmtiWWY0bEMy?=
 =?utf-8?B?a1ZNd2xxZnVHeWoyTWlhTy9Ma3dPOVlYVlY0WWNHYUIyZjh5WEY2NWZwN0hw?=
 =?utf-8?B?dDRxS0h1Qm1xMjVNS2JrSDFhTUdpV1BJRDdNK2xNNml5eVpJWjd3ZHRURTdV?=
 =?utf-8?B?NGh4WTV2QkY0ZmYyYkhrcGhWME53dTA4amxPN05wQU9GOHQybmxZMXQrM0Iv?=
 =?utf-8?B?MFZ2ZWh0SFB4bHBRWFBLVVlQMCtTT1FWLzVBVjQvQnFMbWRjWXo5NS9JNnh3?=
 =?utf-8?Q?g4cDRBTuBeF4G8O88UAOf5pDg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cabfcbfe-f86f-43e8-6e52-08dd7691ba7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 11:37:23.0792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyDnuBSVs3beNWpOXtn3djvJj1XPxSG5uQ55mE3OR+JOFIKDeM/4tJSHZGaxujer
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6074
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

Am 08.04.25 um 11:39 schrieb Fedor Pchelkin:
> On Tue, 08. Apr 11:26, Christian König wrote:
>> Am 08.04.25 um 11:17 schrieb Denis Arefev:
>>> The user can set any value to the variable ‘bo_number’, via the ioctl
>>> command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the arithmetic
>>> expression ‘in->bo_number * in->bo_info_size’, which is prone to
>>> overflow. Add a valid value check.
>> As far as I can see that is already checked by kvmalloc_array().
>>
>> So adding this additional check manually is completely superfluous.
> Note that in->bo_number is of type 'u32' while kvmalloc_array() checks for
> an overflow in 'size_t', usually 64-bit.
>
> So it looks possible to pass some large 32-bit number, then multiply it by
> (comparatively small) in->bo_info_size and still remain in 64-bit bounds.
>
> And later that would likely result in a WARNING in
>
> void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
> {
> ...
> 	/* Don't even allow crazy sizes */
> 	if (unlikely(size > INT_MAX)) {
> 		WARN_ON_ONCE(!(flags & __GFP_NOWARN));
> 		return NULL;
> 	}
>
> But the commit description lacks such details, I admit.

Yeah, so what? I'm perfectly aware that this can result in a warning, but that is just not something worth fixing.

Christian.
