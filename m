Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3457984B8E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 21:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B2310E736;
	Tue, 24 Sep 2024 19:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m6N/uYVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520FC10E143;
 Tue, 24 Sep 2024 19:29:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fh9txYOHMiMaWl4UbhfUHdqUmx58GLLLGlfb3xgwU8t1f2XDluus1sXTXAwCZKu2Wnkt1KwRtfDFBP7tAezOO5+IDmlCBOghEPj61LvCO5X5afkv30f9czkI/8D9QwgvY6Q0BFx+C9zaHj5AlNAT6Y4zFX1u5Ux56/4snf7YH9iNlARtI2UQDmK/B0qBg9hc9rNCBp2NShquHKOwQirKpg+VggagGpuSTStvy3wcj09ptXLCld/qzqyKDW28waMkOmDaKzVHKr8/mIvg+XhgtcTFPP7gMdenkpeuVHKISnXBJIUJGVcWuT9sx/PGc4PPXz4cFu7OmjqvOAKhrKxFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBsOyY8IsKj+CzcjRbc4FOOHbAXO5CRPbrhnG3ux2EM=;
 b=vZf/oCCIaB7VMGJcRg49xsgLEtAFbc3Zf99ECgJfBewL6UYhODaxwkiScygkN69cLb1jDbANotyKJpeM4O5K9Ti8B98gnM7lqVFZ5U1fM+7+3U5FAOiqaVOcsQO6Y47rKVKjspozVtGrpL6RZiZad2aMEcAqAoDNWyXi14Y9CyM4SMhKEpnWLF7mkKe/wVh1+BywOlBSZBe4fVkDJA+j+sNFRMn0Zf733jwPUc3UzFHxmK8hPN8hXD3xebTylUHDP0RgD2X/muiQgX/jOaQoUbIU6PcltVwXe1+CFrofh0JqIOgtZ0NiwcWV+uKmzWsKbI/qLQcoHgh0EOIsXZbOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBsOyY8IsKj+CzcjRbc4FOOHbAXO5CRPbrhnG3ux2EM=;
 b=m6N/uYVcQWtMEsbT6KgEBp5MGghxAN8+NRzz4GPgBJqp239TuJfFVx5TgyJuQRL4NBCdlKA8FMDj5OsVe/Puw/mQufCWloYlQ26Ko+tB74gxGIJrPfjdwIeycgvK9DT6bhrGVt16eSM/r8pmMdkAKCKuCQJf1Wu+tGJwCYFH8Aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA1PR12MB8986.namprd12.prod.outlook.com (2603:10b6:806:375::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 19:29:01 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%2]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 19:29:01 +0000
Message-ID: <a04fbec0-650a-40a5-86b4-a1b9170baf87@amd.com>
Date: Tue, 24 Sep 2024 15:28:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
To: Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Alistair Popple <apopple@nvidia.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Philip.Yang@amd.com,
 akpm@linux-foundation.org, christian.koenig@amd.com
References: <20240911030337.870160-1-matthew.brost@intel.com>
 <20240911030337.870160-2-matthew.brost@intel.com>
 <87mskehjtc.fsf@nvdebian.thelocal>
 <ZuS/NH/P8Fl+qptx@DUT025-TGLU.fm.intel.com>
 <87msk5our1.fsf@nvdebian.thelocal>
 <ece41917-2ea7-4571-83a5-a50c776c6587@amd.com>
 <Zu3n3MmtdlEDaXnF@DUT025-TGLU.fm.intel.com>
 <9a3e62e0-cb62-4d73-9694-7be8893f7206@amd.com>
 <Zu3wV9FJSTs1E5Vx@DUT025-TGLU.fm.intel.com>
 <ZvKnDT_bdx_PhAcG@phenom.ffwll.local>
 <ZvLr66F3VqpMyLlS@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <ZvLr66F3VqpMyLlS@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0449.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::21) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA1PR12MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: d902fc13-8b74-42e9-7f98-08dcdccf24bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEVNTFExbXViRW5TRXlEbDRrN1pES1praVdMdnpKV25MM2gzU3EvZG95ZGdV?=
 =?utf-8?B?dHQzNUVwY3M2dS9sSWRScEdPWkY5L2ZqK1lkeE5rWXovb3ZQQ0Nwd1NkZjlL?=
 =?utf-8?B?d0xYUU9zWDBqb2ZMeDRXOHpCZnlxNUZEeVdtUnZtanZxVHpsQnFwMG5QYUI4?=
 =?utf-8?B?ZHlTc3lJb3VIZjgyMVJKWlNLcytVemRNS0pWQi9ETWVscXpoMmI2TVFHTkFO?=
 =?utf-8?B?eEo0Vlo1Q2VmV0ZoOHFOQjBIT2xGVFdtbGJqQXM1L3ZWN0t0V29jZ2k0Z3dN?=
 =?utf-8?B?K2xIMldpWkI2bytTSzd6eFo4Sm9kdFlqS1d1RVI1d3NjamN3RTBOa25mOHBm?=
 =?utf-8?B?SXo5REdNRVhmTFlmYVFaNi9DdmhJcll4c2tCWkJVU1hrcXA3byt6OTdvWVdw?=
 =?utf-8?B?cFQzZUNSMHB5VXF2YkNpMmFwWExEYUgvVER4blVQL3FBRzNmVG9DTk9NNlV0?=
 =?utf-8?B?VUpnU1lXWDBYaXlBbE9RRnNGb1ZyS0g2QlRQOWQ2enpGY3hIc2I3cXF1OEE1?=
 =?utf-8?B?SmErMDJNcGc4aUZnalIwcWF3bmtHV09CQVdwdmFId2dVRzVscllmUVFmWjRo?=
 =?utf-8?B?N0UwZmZvcExKdkZOOTQ5NDcyUCtvZUtGSDhmRklkN0hycVBkd3YwbTFZZWNH?=
 =?utf-8?B?N0VtZkthRzFUajhXekRvTmN1R3pLaklMamd6cWhXWTJ2QVYyTGdHb0RaWThG?=
 =?utf-8?B?em1aK1JuLzIySzZQTEN6SHpDbDg2Vy9TQXdWanVpVm1FZ2pVeVBIK2crc2g0?=
 =?utf-8?B?RWZsbkhEMlNaOUR0U1F2NkdxODFyeTV1d0hqeGwzNnNBcGJ2bWdDWHM2WGVH?=
 =?utf-8?B?MmNzWHluTVluTEw5em9JeWNKc2c1cjV2UlpmT2txUkpnS3hIcTdjVW1aUXdV?=
 =?utf-8?B?ZmxwZ09YMzhOa3o0R2RRV3pqQnhJeWIxZ2ZTK0hVWk5mZTFMOHJkQVA5OUVI?=
 =?utf-8?B?dEp5SHRRQkJEVmVLbG40L0QrN0IyWHpsbFp2TzZjT3FrbldKTVA3WlM3aU5i?=
 =?utf-8?B?bCtCTGFHT3lFeWw0YmtockFyb0MvWVJpWEFuU2Zjb004ZDgySzBETlpaY1E5?=
 =?utf-8?B?UHRHZlMwNGxkaU9KckZKTHRlTThwRytNZkxMRnhFZTJQL04xeUFpZ3FSOFBm?=
 =?utf-8?B?SXpMZkI3Vk9SNXpNZ3gxQldvVGhUZkdiSG5IWTgzNEg2d3ZIRlpadWh0UWRL?=
 =?utf-8?B?ejcrZnVjNDB0TzRqcldLOEN1djFQOXBVM29DdVBocDRzZlN6am93VytuaGFW?=
 =?utf-8?B?UFI5VVZlQzhPWld4azRndWhkZDEzQTdBcDRKVlRKdU13K3MyUTV4ZWV6UkNk?=
 =?utf-8?B?QnJhRUNZRHhkZ2drQUoyQWNsUTJSQ1Y3SWJnTjVMQ1VYSVE1ekpqaUpxQ1Zu?=
 =?utf-8?B?YnpjQ21MVGtXMGRuSTdqVFF6VFF6RitUYlVucDl0TU9UMDl4RDVJVHVzQWE4?=
 =?utf-8?B?cHBiRUdqdWZJMCtqT0s4T3Z0bFN6UG42NjFNM0dPV2xnenZ3QkpWNGRkVFdu?=
 =?utf-8?B?dldzQnVHWG14Znd5d3M0UVY3eExFaGR2V3hMQ2dBaGNSMXdiOVZ6VC9sMjRw?=
 =?utf-8?B?M0Y3Q0xjVkZIT2p2a3hZLzI1dUw3dkdoWTQzUS83ZHN2TXBtZFRvNWVMOGVG?=
 =?utf-8?B?bWN5ZEdsM25QWjQ0ZlZ1ZU00QzFxdE1UdU8vQUc0emZhNkdKdFI3K0RSbzRQ?=
 =?utf-8?B?Q3o5NENlaEtsd3pmYnJKbFNLczh5OFFaa29rZFpjQWVMdkR1R0ptQ0d6NXZz?=
 =?utf-8?Q?Aozl6qm6bQYhXOvysU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEZKcTI4akdJdlA4RTd3WFlVTWthY2NUamkwN2RkQ2ZxVFRZRDVFbWY4eGlP?=
 =?utf-8?B?MVJRZHdLdk14SDFpL2wvUEtUUDZMb1lEbC9XdjVlV0tZV3dEaVAyTHFXU0hY?=
 =?utf-8?B?eTZwSnduYTBuTXY3R3UyS1lZS0NqUHdqQVhCb3FTUjRGQVRKNmhUQWNkWlZI?=
 =?utf-8?B?cklXeFFTR2Q3SngzdGNaVWhPbGJYUUE0QmdYakJnNHdZRHUwSnBYZml2YnFl?=
 =?utf-8?B?dVNrV1c0cHJVNDZZWUZtSUswRHJGMEN5a3F4ZHdYdW8xM3JGVUVzQVBOYU51?=
 =?utf-8?B?UGxQMmFEL2RTVW1RbzFvSUhBa0FXcXU0akJjVVVuZHgxSy9PQlMwdWFOTG1q?=
 =?utf-8?B?cS95eW9vT0w0dHVuMDhpbUZFZ3ZtRFRGU2NIK05kTGt4elNmMGQrRDFNNCtn?=
 =?utf-8?B?UHRId0pHWlQ0dnRjdHA4dG1pNHZmWE4ybzNzSDVaaDNSWTR6SHZlcys4NEtD?=
 =?utf-8?B?MFI4U1RURTNITXc1Snl0THo4dDlqTGpsVk50UER3WlFnTnp6L05uME5odnBD?=
 =?utf-8?B?ZDVCZmdXL0F4MGJNWlk1Z0NqbmgyWEdzZnlZTmNhaXNQMWc0ajBxNkd0QmxQ?=
 =?utf-8?B?bGZvVVRycGkxYUNMcE1SWm44TVdma09ZU0RuRlJkdHAwdHlCMkYvUWZVZ3pr?=
 =?utf-8?B?bFExSGpldGNDL3MvMzJEbkZUYlJLeGtHVTluaDZjZ3hJQ2hnbEprMzdiWU0v?=
 =?utf-8?B?allPTUJXdGhuK2VjQ2NSRkFVTGg0c2VKSXF5YzhsdmU2bm15dWMwY29FYk5E?=
 =?utf-8?B?dXVZU0pZS08vYm5WRUdrNUEzSVBxenprYXd5cG1lSjQ1MlV1STBCbE83VlI4?=
 =?utf-8?B?WnVkUGdTR1pINlh4Y21RSEtLaVFuUXB5NnZTbVVXa2k3czhNVDQ0ZlNrS0dH?=
 =?utf-8?B?di82SThLbW8xN0o0SjQvbWtrd056YitlZWhhVGZKS01VNlNOK2ptd2hYZU5L?=
 =?utf-8?B?c3NIRUQ1TnVkUW9LZHBTZHJVS2J0bTZucktXOS9UVUZndmdlOFc2ZmZQcjF0?=
 =?utf-8?B?SUNaNmdhbW0wV3NnOWtDUlVLa1ZzNWxXNzZ5c1d3Q1NtQ25UMXlNbDc2VkZJ?=
 =?utf-8?B?Sm1GbDhGRTY3bXZTT2lDSWIvY2FuNElNTnlZRzdCMy9QczViZUprVEZzdzRT?=
 =?utf-8?B?cXJIMTBsNDBvOXlnUXFsYTdFTGpDTEFYK1BRVm10ZFgrQ1RLSnhCN3J3NHJP?=
 =?utf-8?B?TFRtMGQ4OXFPWmNUeGZCRjk5Y2tXOElLbGJYYmplVTlVZ0JrU2xmSTBtUDBt?=
 =?utf-8?B?OW5qTjFYVWZlSC9WVUxkbjZlVDBwWnFLT3lmZEF0TXRWU0E4aElnNnJGeU5N?=
 =?utf-8?B?dHk5cTJkYnNnOWR2aVhrQmNqTGEzdzFIWjNoZmRDdmgrRzJwci9QVGNWb3hN?=
 =?utf-8?B?Ri9mSVd0VXNOa2hMa2pOTW96K21td21jKzZZM2xUVGFzYzFhS1ZEN2kvb3Y0?=
 =?utf-8?B?YmE5YitzWVNHNmRQUENueVdhWS9YTDl6WXVqUHJGbmhQaExGTVN2U09Qek4x?=
 =?utf-8?B?cGx2VmNTVm5lK2NnaTBVbjd5TlZLeW83SkNNMVA3YmgyVnc3LzNIMUVIbkRu?=
 =?utf-8?B?RFpYYStDeVB4bU9ocFo3djFhcWZkQy9XdGd4eVJzQjJEUU5SZ1ZsOTBPWk5O?=
 =?utf-8?B?bFY2VFNrdFBEb24rbTh6YXg0NVo4TkFQRnA5emRPcXRqYXJTdE40ZHpCNUhw?=
 =?utf-8?B?UVFlaFIyeEVtSWFvNFpZY1F2N2dLZkNmZEZyRzF2ME9lMFVMMS80YXdzbGdI?=
 =?utf-8?B?cXMwUmpYdDlxSmMySmtpejdJNjVDeEVTcE56ZjAyQUEzMlVMWWRhN2pmbDZh?=
 =?utf-8?B?eEo2ejg2bjNKSXltTmlENVBocjZFQVRKVHQvUkkwdzloY09LQmd6NUhFcmQ3?=
 =?utf-8?B?alhVVDJoZURjQVBrVXZubDZTVzh4R3JQSm9GdEtibzdlWExJUHp4cjNGMFZt?=
 =?utf-8?B?aHFWL2VrMXdZeTR3dHpucWVoWlJCR000U01RcHcwcEMyK3YwK2tKMGZ1U2Uw?=
 =?utf-8?B?azFHbjQ0UmxUSi9TU2IyaG9lcHZlb056enBKQmUvQzJ0YlZlVCtMUGllMjFy?=
 =?utf-8?B?cDBYZkFGTDVZaG9lb05Ra0hnRTN6dVdHQ29TMVJQOUl4OU1vVHhqMzB1Qzcv?=
 =?utf-8?Q?mBnlGfjVbH22l5fyU/YKts/Ku?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d902fc13-8b74-42e9-7f98-08dcdccf24bd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 19:29:01.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ansfXOtV1w/IvesHG+qo6Rgva3s7agbkCBLT0fsYLRf+FKXXSPjZGkmXFWFDAPbJblWMhpDQnTohK1p6lfvNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8986
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


On 2024-09-24 12:42, Matthew Brost wrote:
> On Tue, Sep 24, 2024 at 01:48:29PM +0200, Simona Vetter wrote:
>> On Fri, Sep 20, 2024 at 09:59:51PM +0000, Matthew Brost wrote:
>>> On Fri, Sep 20, 2024 at 05:50:10PM -0400, Felix Kuehling wrote:
>>>>
>>>> On 2024-09-20 17:23, Matthew Brost wrote:
>>>>> On Fri, Sep 20, 2024 at 04:26:50PM -0400, Felix Kuehling wrote:
>>>>>> On 2024-09-18 11:10, Alistair Popple wrote:
>>>>>>> Matthew Brost <matthew.brost@intel.com> writes:
>>>>>>>
>>>>>>>> On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Popple wrote:
>>>>>>>>> Matthew Brost <matthew.brost@intel.com> writes:
>>>>>>>>>
>>>>>>>>> I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)
>>>>>>>> Still a driver.
>>>>>>> Indeed, and I'm happy to answer any questions about our implementation.
>>>>>>>
>>>>>>>>> but theoretically it seems like it should be possible. However we
>>>>>>>>> serialize migrations of the same virtual address range to avoid these
>>>>>>>>> kind of issues as they can happen the other way too (ie. multiple
>>>>>>>>> threads trying to migrate to GPU).
>>>>>>>>>
>>>>>>>>> So I suspect what happens in UVM is that one thread wins and installs
>>>>>>>>> the migration entry while the others fail to get the driver migration
>>>>>>>>> lock and bail out sufficiently early in the fault path to avoid the
>>>>>>>>> live-lock.
>>>>>>>>>
>>>>>>>> I had to try hard to show this, doubt an actual user could trigger this.
>>>>>>>>
>>>>>>>> I wrote a test which kicked 8 threads, each thread did a pthread join,
>>>>>>>> and then tried to read the same page. This repeats in loop for like 512
>>>>>>>> pages or something. I needed an exclusive lock in migrate_to_ram vfunc
>>>>>>>> for it to livelock. Without an exclusive lock I think on average I saw
>>>>>>>> about 32k retries (i.e. migrate_to_ram calls on the same page) before a
>>>>>>>> thread won this race.
>>>>>>>>
>>>>>>>>   From reading UVM, pretty sure if you tried hard enough you could trigger
>>>>>>>> a livelock given it appears you take excluvise locks in migrate_to_ram.
>>>>>>> Yes, I suspect you're correct here and that we just haven't tried hard
>>>>>>> enough to trigger it.
>>>>>>>
>>>>>>>>>> Cc: Philip Yang <Philip.Yang@amd.com>
>>>>>>>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>>>>>> Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
>>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>    mm/memory.c         | 13 +++++++---
>>>>>>>>>>    mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
>>>>>>>>>>    2 files changed, 50 insertions(+), 23 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>>>>>>>> index 3c01d68065be..bbd97d16a96a 100644
>>>>>>>>>> --- a/mm/memory.c
>>>>>>>>>> +++ b/mm/memory.c
>>>>>>>>>> @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>>>>>>>>>>    			 * Get a page reference while we know the page can't be
>>>>>>>>>>    			 * freed.
>>>>>>>>>>    			 */
>>>>>>>>>> -			get_page(vmf->page);
>>>>>>>>>> -			pte_unmap_unlock(vmf->pte, vmf->ptl);
>>>>>>>>>> -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
>>>>>>>>>> -			put_page(vmf->page);
>>>>>>>>>> +			if (trylock_page(vmf->page)) {
>>>>>>>>>> +				get_page(vmf->page);
>>>>>>>>>> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>>>>>>>>> This is all beginning to look a lot like migrate_vma_collect_pmd(). So
>>>>>>>>> rather than do this and then have to pass all this context
>>>>>>>>> (ie. fault_page) down to the migrate_vma_* functions could we instead
>>>>>>>>> just do what migrate_vma_collect_pmd() does here? Ie. we already have
>>>>>>>>> the PTL and the page lock so there's no reason we couldn't just setup
>>>>>>>>> the migration entry prior to calling migrate_to_ram().
>>>>>>>>>
>>>>>>>>> Obviously calling migrate_vma_setup() would show the page as not
>>>>>>>>> migrating, but drivers could easily just fill in the src_pfn info after
>>>>>>>>> calling migrate_vma_setup().
>>>>>>>>>
>>>>>>>>> This would eliminate the whole fault_page ugliness.
>>>>>>>>>
>>>>>>>> This seems like it would work and agree it likely be cleaner. Let me
>>>>>>>> play around with this and see what I come up with. Multi-tasking a bit
>>>>>>>> so expect a bit of delay here.
>>>>>>>>
>>>>>>>> Thanks for the input,
>>>>>>>> Matt
>>>>>> Thanks! Sorry, I'm late catching up after a vacation. Please keep Philip,
>>>>>> Christian and myself in the loop with future patches in this area.
>>>>>>
>>>>> Will do. Already have another local patch set which helps drivers dma
>>>>> map 2M pages for migrations if SRAM is physically contiguous. Seems
>>>>> helpful for performance on Intel hardware. Probably post that soon for
>>>>> early feedack.
>>>>
>>>> OK.
>>>>
>>>>
>>>>>
>>>>> Longer term I thinking 2M migration entries, 2M device pages, and being
>>>>> able to install 2M THP on VRAM -> SRAM could be really helpful. I'm
>>>>> finding migrate_vma_* functions take up like 80-90% of the time in the
>>>>> CPU / GPU fault handlers on a fault (or prefetch) which doesn't seem
>>>>> ideal. Seems like 2M entries for everything would really help here. No
>>>>> idea how feasible this is as the core MM stuff gets confusing fast. Any
>>>>> input on this idea?
>>>>
>>>> I agree with your observations. We found that the migrate_vma_* code was the
>>>> bottle neck for migration performance as well, and not breaking 2M pages
>>>> could reduce that overhead a lot. I don't have any specific ideas. I'm not
>>>> familiar with the details of that code myself. Philip has looked at this
>>>> (and some old NVidia patches from a few years ago) in the past but never had
>>>> enough uninterrupted time to make it past prototyping.
>>>>
>>>
>>> Cool good to know this isn't some crazy idea. Doubt it happen anytime
>>> soon as I need to get a working baseline in before anything then start
>>> applying optimizations and help in get other features to get the design
>>> complete. But eventually will probably try to look at this. May ping
>>> Philip and Nvidia when I have time to dig in here.
>>
>> I think the big step will be moving hmm.c and migrate.c apis over from
>> struct page to folios. That should also give us some nice benefits on the
>> gpu side, since instead of 4k pages to track we could allocate 2m gpu
>> pages.
>>
> 
> I think was thinking just encode the order in the migration PFN like HMM
> does. Really only Nth order entry in the page array needs to be
> populated then - HMM populates every entry though which doesn't seem
> like that is required. Maybe having a folio API makes more sense?
> 
>> Once we have folios at the driver/core mm api level doing all the fancy
>> thp stuff should be at least a well-contained problem. But I might be
>> dellusionally optimistic here :-)
> 
> I think it contained in the sense is the DRM SVM layer just allocates a
> THP or large continous device memory and hands it off to migrate layer
> and that layer does the right thing. The 'right thing' here I believe is
> a decent amount of core MM work though.

Whether or not you allocate contiguous device memory doesn't need to depend on the page size in system memory. You can migrate 2MB of scattered system memory into a contiguous 2MB block of VRAM. The AMD driver does this already. The problem (as I see it) is all the extra book-keeping with 4KB granularity in the migrate_vma_* helpers when the source data is actually contiguous.

Regards,
  Felix

> 
> Matt
> 
>> -Sima
>>
>>>
>>> Matt
>>>
>>>> Regards,
>>>>   Felix
>>>>
>>>>
>>>>>
>>>>> Matt
>>>>>
>>>>>> Regards,
>>>>>>    Felix
>>>>>>
>>>>>>
>>>>>>>>>> +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
>>>>>>>>>> +				put_page(vmf->page);
>>>>>>>>>> +				unlock_page(vmf->page);
>>>>>>>>>> +			} else {
>>>>>>>>>> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>>>>>>>>>> +			}
>>>>>>>>>>    		} else if (is_hwpoison_entry(entry)) {
>>>>>>>>>>    			ret = VM_FAULT_HWPOISON;
>>>>>>>>>>    		} else if (is_pte_marker_entry(entry)) {
>>>>>>>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>>>>>>>> index 6d66dc1c6ffa..049893a5a179 100644
>>>>>>>>>> --- a/mm/migrate_device.c
>>>>>>>>>> +++ b/mm/migrate_device.c
>>>>>>>>>> @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>>>>>>>    				   struct mm_walk *walk)
>>>>>>>>>>    {
>>>>>>>>>>    	struct migrate_vma *migrate = walk->private;
>>>>>>>>>> +	struct folio *fault_folio = migrate->fault_page ?
>>>>>>>>>> +		page_folio(migrate->fault_page) : NULL;
>>>>>>>>>>    	struct vm_area_struct *vma = walk->vma;
>>>>>>>>>>    	struct mm_struct *mm = vma->vm_mm;
>>>>>>>>>>    	unsigned long addr = start, unmapped = 0;
>>>>>>>>>> @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>>>>>>>    			folio_get(folio);
>>>>>>>>>>    			spin_unlock(ptl);
>>>>>>>>>> -			if (unlikely(!folio_trylock(folio)))
>>>>>>>>>> +			if (unlikely(fault_folio != folio &&
>>>>>>>>>> +				     !folio_trylock(folio)))
>>>>>>>>>>    				return migrate_vma_collect_skip(start, end,
>>>>>>>>>>    								walk);
>>>>>>>>>>    			ret = split_folio(folio);
>>>>>>>>>> -			folio_unlock(folio);
>>>>>>>>>> +			if (fault_folio != folio)
>>>>>>>>>> +				folio_unlock(folio);
>>>>>>>>>>    			folio_put(folio);
>>>>>>>>>>    			if (ret)
>>>>>>>>>>    				return migrate_vma_collect_skip(start, end,
>>>>>>>>>> @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>>>>>>>    		 * optimisation to avoid walking the rmap later with
>>>>>>>>>>    		 * try_to_migrate().
>>>>>>>>>>    		 */
>>>>>>>>>> -		if (folio_trylock(folio)) {
>>>>>>>>>> +		if (fault_folio == folio || folio_trylock(folio)) {
>>>>>>>>>>    			bool anon_exclusive;
>>>>>>>>>>    			pte_t swp_pte;
>>>>>>>>>> @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>>>>>>>    				if (folio_try_share_anon_rmap_pte(folio, page)) {
>>>>>>>>>>    					set_pte_at(mm, addr, ptep, pte);
>>>>>>>>>> -					folio_unlock(folio);
>>>>>>>>>> +					if (fault_folio != folio)
>>>>>>>>>> +						folio_unlock(folio);
>>>>>>>>>>    					folio_put(folio);
>>>>>>>>>>    					mpfn = 0;
>>>>>>>>>>    					goto next;
>>>>>>>>>> @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
>>>>>>>>>>    					  unsigned long npages,
>>>>>>>>>>    					  struct page *fault_page)
>>>>>>>>>>    {
>>>>>>>>>> +	struct folio *fault_folio = fault_page ?
>>>>>>>>>> +		page_folio(fault_page) : NULL;
>>>>>>>>>>    	unsigned long i, restore = 0;
>>>>>>>>>>    	bool allow_drain = true;
>>>>>>>>>>    	unsigned long unmapped = 0;
>>>>>>>>>> @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
>>>>>>>>>>    		remove_migration_ptes(folio, folio, false);
>>>>>>>>>>    		src_pfns[i] = 0;
>>>>>>>>>> -		folio_unlock(folio);
>>>>>>>>>> +		if (fault_folio != folio)
>>>>>>>>>> +			folio_unlock(folio);
>>>>>>>>>>    		folio_put(folio);
>>>>>>>>>>    		restore--;
>>>>>>>>>>    	}
>>>>>>>>>> @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>>>>>>>>>>    		return -EINVAL;
>>>>>>>>>>    	if (args->fault_page && !is_device_private_page(args->fault_page))
>>>>>>>>>>    		return -EINVAL;
>>>>>>>>>> +	if (args->fault_page && !PageLocked(args->fault_page))
>>>>>>>>>> +		return -EINVAL;
>>>>>>>>>>    	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>>>>>>>>>>    	args->cpages = 0;
>>>>>>>>>> @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>>>>>>>>>>    }
>>>>>>>>>>    EXPORT_SYMBOL(migrate_vma_pages);
>>>>>>>>>> -/*
>>>>>>>>>> - * migrate_device_finalize() - complete page migration
>>>>>>>>>> - * @src_pfns: src_pfns returned from migrate_device_range()
>>>>>>>>>> - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
>>>>>>>>>> - * @npages: number of pages in the range
>>>>>>>>>> - *
>>>>>>>>>> - * Completes migration of the page by removing special migration entries.
>>>>>>>>>> - * Drivers must ensure copying of page data is complete and visible to the CPU
>>>>>>>>>> - * before calling this.
>>>>>>>>>> - */
>>>>>>>>>> -void migrate_device_finalize(unsigned long *src_pfns,
>>>>>>>>>> -			unsigned long *dst_pfns, unsigned long npages)
>>>>>>>>>> +static void __migrate_device_finalize(unsigned long *src_pfns,
>>>>>>>>>> +				      unsigned long *dst_pfns,
>>>>>>>>>> +				      unsigned long npages,
>>>>>>>>>> +				      struct page *fault_page)
>>>>>>>>>>    {
>>>>>>>>>> +	struct folio *fault_folio = fault_page ?
>>>>>>>>>> +		page_folio(fault_page) : NULL;
>>>>>>>>>>    	unsigned long i;
>>>>>>>>>>    	for (i = 0; i < npages; i++) {
>>>>>>>>>> @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
>>>>>>>>>>    		src = page_folio(page);
>>>>>>>>>>    		dst = page_folio(newpage);
>>>>>>>>>>    		remove_migration_ptes(src, dst, false);
>>>>>>>>>> -		folio_unlock(src);
>>>>>>>>>> +		if (fault_folio != src)
>>>>>>>>>> +			folio_unlock(src);
>>>>>>>>>>    		if (is_zone_device_page(page))
>>>>>>>>>>    			put_page(page);
>>>>>>>>>> @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
>>>>>>>>>>    		}
>>>>>>>>>>    	}
>>>>>>>>>>    }
>>>>>>>>>> +
>>>>>>>>>> +/*
>>>>>>>>>> + * migrate_device_finalize() - complete page migration
>>>>>>>>>> + * @src_pfns: src_pfns returned from migrate_device_range()
>>>>>>>>>> + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
>>>>>>>>>> + * @npages: number of pages in the range
>>>>>>>>>> + *
>>>>>>>>>> + * Completes migration of the page by removing special migration entries.
>>>>>>>>>> + * Drivers must ensure copying of page data is complete and visible to the CPU
>>>>>>>>>> + * before calling this.
>>>>>>>>>> + */
>>>>>>>>>> +void migrate_device_finalize(unsigned long *src_pfns,
>>>>>>>>>> +			unsigned long *dst_pfns, unsigned long npages)
>>>>>>>>>> +{
>>>>>>>>>> +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
>>>>>>>>>> +}
>>>>>>>>>>    EXPORT_SYMBOL(migrate_device_finalize);
>>>>>>>>>>    /**
>>>>>>>>>> @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
>>>>>>>>>>     */
>>>>>>>>>>    void migrate_vma_finalize(struct migrate_vma *migrate)
>>>>>>>>>>    {
>>>>>>>>>> -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
>>>>>>>>>> +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
>>>>>>>>>> +				  migrate->fault_page);
>>>>>>>>>>    }
>>>>>>>>>>    EXPORT_SYMBOL(migrate_vma_finalize);
>>
>> -- 
>> Simona Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
