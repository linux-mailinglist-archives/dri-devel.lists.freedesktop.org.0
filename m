Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3130FB3F62C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 09:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3308810E152;
	Tue,  2 Sep 2025 07:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qtzZq2Ov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349D110E152
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 07:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iaQsC8qr3/ZA4FU7r4C2wUzJOfbuW6IXjnK01iZMm37eoq9atUYb+kui+ZguUPIldIRkEYScPtWRpJloVhFxxdAgd0sGVYofckeqM3umXswY57T3tRVeowqF/iB7K9M6ouBUNAikJ3dMhdvC1cCSnBu59D8ijTucMjIVqioIUSXgB2h/K2Im5w2K4BCgnVf4qV/cnssRGjIr8HqW5rsOK+dUPrlXQ23njdkmcEihlf4Lamj0YK5RdtaJUOEPEoaVx5HAGewPZctplsZqggzcMj0bKbi9IZyPcqGVshn9XAUrxOMCL7+ZUKRnrB2ZHuSW8csogp/74dLCUoRUWTp1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVFEOkWjHPiKE0SdechPCupHDQxPjWp5kQ1LfH5yAEo=;
 b=cR0k86GFEw5n/98sKfclVwI70iCQx0DasHEhKEZuB4z185596RikFs+kCpivoY4Ql3x+MLV0+qS3rkg2eBhjJV8tUBZci9xxF2O5fxmGIOe6deY6l7s/1cbdc747mlcyZRLPJyw2LOe0Wkfk+N8Jk89HRFjX9QsjjTZ8QwaNG04+gwDevxsGCM2mWGJPTkUTLQx3XbTRzMcOrgtdxl+JM2QWyHLjQmAaq08o1pvWU60554T6dE8vPcPlQD23kmRZyorQ+ONy12eB+1fF1YCeRxXjGBCx456wtEW43ELj1EoIwaUofYc3/Ktk1UOKbH0bNQs1GkL+w58P3iLPRbb8eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVFEOkWjHPiKE0SdechPCupHDQxPjWp5kQ1LfH5yAEo=;
 b=qtzZq2OvvTdCVnnIZesgb2F2/XZG9SuhDHfCCIPF8G/pArm0Ki8m93nXEv0FVj+mOd70Y2abPBE7dvcWF/+4tKcsFxu/x/MOoMN/xaT4IzENndWYz4FQKgj3pVYyqHsBNgKTMXh/hZvmKTb/Xu1848r+3oe/CSFf3aCDCZLuSoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 2 Sep
 2025 07:03:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9073.021; Tue, 2 Sep 2025
 07:03:16 +0000
Message-ID: <9658f557-22ac-499c-9e2f-fdf1decaf771@amd.com>
Date: Tue, 2 Sep 2025 09:03:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu/ttm: make sure exported objects are populated
To: David Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250901045618.1853752-1-airlied@gmail.com>
 <700e88048fd7dc58c3d5a3d91f80595a2f8c3353.camel@linux.intel.com>
 <CAMwc25rLxWtz06SaGAfW5T1NPCwxmXSJEy-=MQ9JNwEfHRQaQQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMwc25rLxWtz06SaGAfW5T1NPCwxmXSJEy-=MQ9JNwEfHRQaQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5fef7c-d1c5-48fe-cbd6-08dde9eeca5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3dxeTQwaTRNVHBGSkRJekoxZDlzTFBrZFJqZlFaYzhvTEoxeG1FbzRxdE9q?=
 =?utf-8?B?d2lUbSswUnQ0SHJ3WEJkTk1GcGs5em9CK1pSRG5NUXNvSzN5OGpBbmdGOVVy?=
 =?utf-8?B?WkN4RUdEdkNOTTErUUlVQzVmZzd3ek5tck81QmV4UDk3NU5YSDBnd1ZMVjQw?=
 =?utf-8?B?VkhzbzFBQVM0WFR0TXkyQVJQYkN3SEdxQStkMThqNXBRQ01WbWZ4eldkMVFZ?=
 =?utf-8?B?eUo4QXM3cElQNjB1ZzBEVkwxdlZyand2TVE5eWRzaUR5TmdZTkFCeWd3dmhH?=
 =?utf-8?B?SWRaaVhid1YxdHJscnBGSFNCY2o1M0xRL2I5SVBEVWNmQnJsMjY0UTFhZHZP?=
 =?utf-8?B?VlJ2cmsxaURsSXhkOHhRejlNMmY4RTgrT0VOZ2FxUHpnazNzVHlxY0YxTS84?=
 =?utf-8?B?QXhWc3JFRmVaaVVhT0NoZE96bzFJK0l1WGNmTE9NZTA1NEhnSUIydUNqZHA1?=
 =?utf-8?B?RFUwQ0lhaDJlNWZhWFdVejBFTExpUW02amFpTHJNZXVVb0xTZ0NsQWZqS3Jh?=
 =?utf-8?B?dWpub3dKekxDTnFWUkRoY3k3M29MMUVlb3QxY25wRUdqd01xbG4rdEozbWxr?=
 =?utf-8?B?ZjEzSnRFam9maWRtZHIzVnFtRmE2N1pqK1g5dTZsZUFidkhacU9BTlRzTmE0?=
 =?utf-8?B?ZGRwNWFXYUsyWkt2VUxnaHpVb21GQmh6TE02SjZRR2g1bHdpcERJODgzZDNK?=
 =?utf-8?B?Zmc5bTlGblNxMWZURjF6OGNzUysxQnNYOTltK0tPaTEyNTBrNmQreFBVUGVJ?=
 =?utf-8?B?ckx4ZWM1S3VUK3FIT3FFZU92WkNvT1NkbTlKemZlNSt2YXBlbGdmVmUxcXFP?=
 =?utf-8?B?VEE3WjVlTHJoTHNTWk5LcFBPZ0ZLOGJwR3orMFZpNkxYZ2xhVjc4UEwyR29z?=
 =?utf-8?B?aDRzRUhPQ2RFRnZQZ0JTK0VIdC83UysrakNjdmdVbFNQOTZtVmdzeUlXRVV6?=
 =?utf-8?B?L2xaMStueGwyOVpBYWFJOTRGYlBRTVdUWWVYaHdSaGxzamd6dnBDU0Z5RGxD?=
 =?utf-8?B?YzAwTHNGQTFXK01oUVpqckJLMi9Eb0VKa3AvUE5wRGV0WlA4VVJaQTF4Ykov?=
 =?utf-8?B?Nk85R0lUZS9FUm52Ujc2UmptUGw0aStadnFGZHpJd0NhOEtEaGc2YU1lY3pW?=
 =?utf-8?B?aTVsOUZ3MllxSTZYUWdYcGVEZ1loTWNlY2swbklORVR5dS9HLzFUU3RlTFUy?=
 =?utf-8?B?TTZkaWw1YTNPZ21YSDV3bFltMHVMN3hxNWdWb29XRk4vc01JR2NCL0ZyWHZq?=
 =?utf-8?B?TXRETGNlNHE4N0l0SGVRQUsvUGk4R1VMWXNoazVHTVkvdVY1ZzNaakZ4bktu?=
 =?utf-8?B?UXNSUzB6dGRORmRObHltTithUjdjK1JlRjEzZDREMGVXY3Vka1VxMjZDdXpt?=
 =?utf-8?B?MlZTVmZnV0hlVDYwZG9pK2owUDJ0MVRkQWNRQzQ4cDMwZGNLNUd6U2ZVK0FE?=
 =?utf-8?B?MTcrNUxOT2tSOUFLQkJqdXB4MEdYVDMyK2pPLzAvWjc1dWVWZTNKemFPaE14?=
 =?utf-8?B?ald3cm14V0dTaWRueTlmVDZPYWpZZmRiN3VQQURvUE1TWVQ0WGxXMDJYdjR6?=
 =?utf-8?B?Q2UzV0hnMTNJMXY1WVMxbEozZ240ZDR6bjNaekwwdXJJam5rZXh3amcybXh4?=
 =?utf-8?B?a28rSVVvbEFRUktzcDMwL1E0K0J5Nm1rRlZienh1Y0J1TmtQQmxIV0Nvc20z?=
 =?utf-8?B?aVVQVWZOdEh1R0RSdjhqckFOYldGQTFkVittR3JxS3N4cjNvSFc1dW9YaExL?=
 =?utf-8?B?K2lySUl1TGhOUHRsb1FCZGxtS29aWGVuNndQZHpRbkwxZE1hOHorRVA5WHVX?=
 =?utf-8?B?SnZLUXBnUEFxcVNyV3BKS0dJanZKSmZSRjdRdGRlMnUwck1hRnR1akR6MjRp?=
 =?utf-8?B?alpWOVpUbjNibERSME1reGRQK2Vvd2RKZTJ3bFJWZE9aZzRCa0RFNmxqQkMx?=
 =?utf-8?Q?f23aKGiyF+o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHZWQlV5TkNsZFRYamxycDZWanJuSk51cE5PQWYxMUlJT0EycStQUlFrQUwx?=
 =?utf-8?B?ZmRpSzJBTUlueDN1K3NMR3gwRmgrU096V1U1Wlg4Z1NUQy9UNElxbVNuaVEr?=
 =?utf-8?B?dnZhZVk1U0VGb3lnMDQ4TW11WGY2OERFT2plSFVvV2VKVm5XNzJ4V3FMK2xs?=
 =?utf-8?B?ay9XYythOThPVmdwanBiU1pUTENsTmU0VUM2dkxFcERCWUF6UnIvcDl6VTU5?=
 =?utf-8?B?ZGxTK2NSSVYveS9xdWFvRWhobkZWVlFOc0g1Z0trdzU1UFFHcTJROVlpR1FF?=
 =?utf-8?B?bmhHNGNjb0RmVE1SS1FlcWtUbHVTamdybC9xaGs4eThySjdyOTBBZXlEWDNR?=
 =?utf-8?B?bzdxLzRwcU1TamN3TDlrdE44VU1FUzhSUVFsQUVEZThyZFRYSS9GU0NaNzZL?=
 =?utf-8?B?SGNuVHdsK05Uak4vOWJtQUNyd1JVWUlMMm5Qcm9zYVc0dW1NaTVTRTZ0ckFu?=
 =?utf-8?B?Sm0zQzVkU2paMTB2clp3US9HZlN5djJnUW1LSlVXOXo5R2ttZVNPSlNvSkN0?=
 =?utf-8?B?OEJFV3ZoZGY2N0FXTlBLNlkxT2wzRzROaW9mTDlKTS9PTUM4OVU2K3Z0Qklu?=
 =?utf-8?B?alFMRFp0blo0S0RYdTF4QVVyT2tISnNSaElFREY1b0pnZ2N4VnlPWmhMc1Ez?=
 =?utf-8?B?WmhQbVZUSVRMRzJkVFdTdExoM0hGUllRMXoyT3oxaUhMSkl2S2YxajlLNU41?=
 =?utf-8?B?V1Q0enk4bGt3dHVMS0Njay9UTHpOOXVFUm02ckJNMklzVXJwMlZVbUczalls?=
 =?utf-8?B?YTlJVDJyWHV3RTdpMUtRQWFEek5aUzZuLzF2Ums5VlBHK1ZoeFVQbHpoN3pw?=
 =?utf-8?B?QkppRVE3ZVNwSmZkWWNQQW80cGhHQmt3SC81UGFPRFVseTFoMVNpS3BtbW1u?=
 =?utf-8?B?WkRmZWVWZjFYZzg3TGpqVmhlM29zYmk0bzU5U2ZsZGluc1hYeldtOGVGT01O?=
 =?utf-8?B?bUxlQVBpTHJqNEo4ZUlZZkREd2VBOXlEczA2cEtMN1pKYTBmZUlVZUVUWlVY?=
 =?utf-8?B?ZjVsTGdHL1pXbU85MEZMYWsrenlMdXc5QmorOFc2a3pwL3J3VDZ0T25VaXdP?=
 =?utf-8?B?OXNrbnJSRTFNb2lrbGhPTDZVTGpDVGF1c1VIODdyM0pSbWxVbHVwRGRvZFVT?=
 =?utf-8?B?d3pvQzFnNy9Mc0FrR3BjQUJ6RTJuNzBxUE0rbFJkTXROKzh1ayt6T2k2aDZy?=
 =?utf-8?B?ZHROMm1Mb2pSL2x1SEJRMWpoaXFEWHNLMmZEV1JTSExZTHpNc0JzUThxNzRw?=
 =?utf-8?B?aFh6MXZVOXRObFd5NXJMR2IxT241cVdScHY1Yng1Sm1qRERrVkpaVnRpZy8r?=
 =?utf-8?B?RWdUTkhZRkJWUXhOSndCNVRvemkvUnBJNGVncFNiTHo5WkVlU2RBOGtKd3li?=
 =?utf-8?B?cXlIdGRtdTM2cmRHeXB1R1A5WjE5MFZWM0VQWmRlS0dKeVNER2V2bVNhSmdn?=
 =?utf-8?B?NFJNQ2NNeVN4TlFqUFkwV3ZYWnJoQjRJSU15TkU2YkJLODZ1R0xhdGJ2ZDJ1?=
 =?utf-8?B?YlJIV1VOaDk3ajJ5SHNuS2tnUkQxdVhtbDNWUnFKeVE0WVpDVjI3SnRXUW1n?=
 =?utf-8?B?NDNzSTJBUWlKUXpTZnBDMWhTbmVmdU1wTU95SGxKM29TNmV6cmZLMmVJZWd3?=
 =?utf-8?B?WDFRaW1Ocm9RakFMV2VtU1NoOXQ5NXFmVzdCMzUxYUdab28zTWVBZ3NoWUk0?=
 =?utf-8?B?WGZUVzduZUlVNGliVHZkRHpEdFQwdWJ2K21UZjg0L1N1TkVvUmZyVXpZaGZa?=
 =?utf-8?B?ZHhvajY5WWk1K3c1MlpCUy9aM09wK3dsdDEzMGRKblU3blVLS2dEMThXN0N6?=
 =?utf-8?B?VmV2VkJCdGNRb3VJMk85Yk9STjNUY2hqZlBVR20rU1Fnc01EMkJqZHdER1Bm?=
 =?utf-8?B?ZkxyZ0crT05tQW5RRm9mVDZ1YklJTG5jTTVBTEliUWpLR0lFU3JGSmVwbnlj?=
 =?utf-8?B?K0FIcjdWUjgwUGgrbmdseXlkUDhLelZjNEJXMCtmOHpxOUgwSDRTcjhqRDlm?=
 =?utf-8?B?ZEVMSld4ZzFFQVFJTmJuSUtubFlMZlNVRVBhR3JISmdNMjgyUHRKQVBEQkhS?=
 =?utf-8?B?Q1gvSDIyRnN2VGlxNDE5L2l1cUZ2MXJJdkFuajFOeFp2Y3dnZ2NSaXBpblFr?=
 =?utf-8?Q?ZVcC0EKEDwiGav3EW+5Z7YJyL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5fef7c-d1c5-48fe-cbd6-08dde9eeca5d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:03:16.5812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: riZGd6Ni527GNmjMfbAIyVi2aBKfX9usTVAgg3NsGxgl5n/fRS3fa0QjCLmKeTf5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175
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

On 02.09.25 03:22, David Airlie wrote:
> On Mon, Sep 1, 2025 at 6:02 PM Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>>
>> Hi Dave,
>>
>> On Mon, 2025-09-01 at 14:56 +1000, Dave Airlie wrote:
>>> From: Dave Airlie <airlied@redhat.com>
>>>
>>> While discussing cgroups we noticed a problem where you could export
>>> a BO to a dma-buf without having it ever being backed or accounted
>>> for.
>>>
>>> This meant in low memory situations or eventually with cgroups, a
>>> lower privledged process might cause the compositor to try and
>>> allocate
>>> a lot of memory on it's behalf and this could fail. At least make
>>> sure the exporter has managed to allocate the RAM at least once
>>> before exporting the object.
>>
>> With a shmem analogy, let's say process A creates a shmem object and
>> doesn't populate it. It's then shared with process B which faults in
>> the pages or otherwise causes it to be populated. Will this patch
>> ensure we behave the same WRT memory usage accounting?
>>
> 
> I wandered down a few holes, but with cgroup v2, owner pays seems to
> be how it works.

Which is pretty much the correct approach as far as I can see. The only problem is that the ENOMEM is delivered to the wrong process.

In other words the one using it for the first time gets the ENOMEM and not the owner.

This is usually solved by making the allocation or at least the reservation of resources happen when they transit a domain boundary, but Linux cgroups doesn't have any of those concepts.

> They use the inode which records the cgroup owner who created it.
> 
> cgroups v1 did it the other way, but I think we should ignore that.

Yeah agree, cgroups v1 is not something we need to take into account.

Apart from that with the technical problems pointed out by Thomas fixed the general approach looks sane to me.

Regards,
Christian.

> 
> 
>> Also some concerns below.
>>
>> I think we'd want to have the caller (driver) provide the
>> ttm_operation_ctx. The driver may want to subclass or call
>> interruptible.
> 
> Indeed, might make more sense, though I think we should only be
> calling this after creating an object in most cases,
>>
>>
>>> +
>>> +     int ret;
>>> +
>>> +     if (!bo->ttm)
>>> +             return 0;
>>> +
>>> +     if (bo->ttm && ttm_tt_is_populated(bo->ttm))
>>> +             return 0;
>>> +
>>
>> bo->ttm is not safe to reference without the bo lock. Nor is the
>> ttm_tt_is_populated stable without the bo lock since you may race with
>> a swapout / shrink.
> 
> Indeed, I was probably being a bit hacky here, I'll always reserve first.
> 
> Dave.
>>
>> Thanks,
>> Thomas
>>
>>
>>> +     ret = ttm_bo_reserve(bo, false, false, NULL);
>>> +     if (ret != 0)
>>> +             return ret;
>>> +
>>> +     ret = ttm_bo_populate(bo, bo->resource->placement &
>>> TTM_PL_FLAG_MEMCG, &ctx);
>>> +     ttm_bo_unreserve(bo);
>>> +     return ret;
>>> +}
>>> +EXPORT_SYMBOL(ttm_bo_setup_export);
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>> index c33b3667ae76..5cdd89da9ef5 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -473,6 +473,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object
>>> *bo);
>>>  int ttm_bo_populate(struct ttm_buffer_object *bo,
>>>                   bool memcg_account,
>>>                   struct ttm_operation_ctx *ctx);
>>> +int ttm_bo_setup_export(struct ttm_buffer_object *bo);
>>>
>>>  /* Driver LRU walk helpers initially targeted for shrinking. */
>>>
>>
> 

