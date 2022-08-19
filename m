Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989C159A413
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 20:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82E210E7F7;
	Fri, 19 Aug 2022 18:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6087F10E7C4;
 Fri, 19 Aug 2022 18:04:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDndBKJjKZ41P4Bq4fREUrPQomE5PMlRW5pDjUb6O1XlI4u7PgzS0uFuIV3HVMzhNOwU50o5t9ujwpihwh/oQ0NI3Y55yzhd0ckV7G+kzLOAH1tMR8fbEB3cc2BEWfu2P1QOCkoboHbieJ8FX09B0IyjM/SoXQe1yKxV2M5M6gl4R0hxmpW/YEFOuoe8re6ZDGd+6r+sBi+/dlGAUZBiTDMFrRr1bxFFfVu6/dmafl9JZhFnm/hhX6ikXDF/+43gg9yUkZKPCk6m+PXjsS3rsOg+jAeEp6BqZmQYed6QKIhTq00JcIcFc1JBGv5H4zFd7OI6o/L0yjqO4ZgesO62Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJXwSyFad+tbsnBRxF2tJgMn9TatYadIYFXvO04DJ6Y=;
 b=nVTCpVmFeZ3g2X/8FTztmqfImURbs9Jdi39O84k9vYx+R35ZnyIGeoLjewVhhQs6MWVyIk2pfJoootJz/b4t2WCMfKz3jUpvsAoTihKlcacdmlpXMWxkfFp4gsPjHi5ifLRWCNwvN/pUiHnWYEBIpXPFopfEb+hh9iUdb995yb5FnFkeZIkbKbVZ6QvkUjZKNYfj9gkFHaoRCyBzpkpsB7YyNcycspAaPAi65AS/pQtn7Afj+tpgueET2HvEFUeLZJx++hoRTk+A/LzEgd6sSvVy352T/mv8JHhZ18pqEwZlejuXbGwTSxe4nFPg7dow/u+Wh2S5f1Llg7FaA9bPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJXwSyFad+tbsnBRxF2tJgMn9TatYadIYFXvO04DJ6Y=;
 b=OfMxU6RVn3s/JXMWZgsitntm6oLTjFkqW3JZosDaJQaRky/mI873UfUEfyArUz6dUqMXfaGTN1+UBMZ0tKhz3FGJqYm6e3rcvmAoZ8AEx9MsH6kg46ra8mwjMeDD1wR13gfcFaVEXdztRR3qfO0p2JCJjzMA8W3VRxkD0lsC9h8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB6136.namprd12.prod.outlook.com (2603:10b6:8:a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 18:04:55 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115%5]) with mapi id 15.20.5525.019; Fri, 19 Aug 2022
 18:04:55 +0000
Message-ID: <b6d4ae2e-9cc0-a94c-f862-9b2698cf6640@amd.com>
Date: Fri, 19 Aug 2022 14:04:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: build failure of next-20220817 for amdgpu due to 7bc913085765
 ("drm/amdkfd: Try to schedule bottom half on same core")
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <Yv1lepjhg/6QKyQl@debian>
 <CADnq5_Od9W1iuzYpsmODOB=Xem97ogeH_t0JrjWC-S8h0XM9fA@mail.gmail.com>
 <5638aaf1-b808-bdc6-d84a-820f24facea6@infradead.org>
 <CADVatmNA6-qCJEHNn-gRO6Nx88SsTrPsJn_F5J0NiFhyvijNxA@mail.gmail.com>
 <c1869a4b-ead1-2ae5-c9ec-61834b578216@infradead.org>
 <CADVatmPCd5KQ0mAfQGHvqVGFJtK+fyQPB4XUktgfc3fzYJvyCg@mail.gmail.com>
 <df284479-9981-9983-7775-81d7d7875dac@infradead.org>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <df284479-9981-9983-7775-81d7d7875dac@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR20CA0010.namprd20.prod.outlook.com
 (2603:10b6:610:58::20) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7cd0d41-00df-49d5-b4e8-08da820d5223
X-MS-TrafficTypeDiagnostic: DM4PR12MB6136:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s1Tm+baAzzR7uaFS0tK86iGl+fagJFEIifR3ZO+fbGU0v76AMDvutybXMN+GZrCecSLyvduBPwOSsBL4mhOABqKDMbt2QI3cg60m34y3OFSWBg2by9xPmnghTI8bn8StUnsGlRzyu/C/MoSO2Oz8DZgXuMm2z8KjC6MOb+ErYzxkKkrk3YVZyigUpsz2IH9Ur0vhsCQhVj3IYyF2m06HnQnLYrl3T9yoM0ANhkNR4H1t5Wc1bubg7Nhz+k5/JaldBMMBIr21UTY/s/qBORa5OxhhxgbKuOWcMln5c5eQsA5VSVyKIlvxgj7lQ69kvW2k6qPXHn4vGfiT1wrgggk+MsMUPWOQ6edQlQB2F5bDO4i/XNvInVB4UhQnfjUeEkSiCcm+RUlp3qlyH09wOYEqUoBCzyvOgCrFG6e4FUCl/dGXNa9oz9au8nnlNVji5F82x6GoLfAt1OyAZSyM/Ex7Ul/fm8hvMAP1LivzQdAgjhWE5HDGPL3tbTUhhvBLA0S+v5gHBPffDCVUKhPL5hp12ExpmuxEHpUUToVoMeE1GA1sabSJZyWNQxYJa9pbrqS2i044cZYpN1cIwr9CTJi2v0OB/ndaMNSKCIFMOmKVzqjBvMSD78ZhJkC4SO1wyQq52fnbqELHAsXviAs7LppbC2IhEQBKH37uMiSpXxRJsM8hKPMd9xHRQ3vgf25AuH+8A+bVBmOWdQ0GNOwP7W3EKltsfuT9gElcxV9aq6QFBDvMViEzVii3/kOFp1Cg/RpNtGSwdUaWw1yhz13qY+DpRck91znVSR5SLB/SoeUxyQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(186003)(2616005)(38100700002)(5660300002)(8936002)(44832011)(4326008)(8676002)(66946007)(2906002)(86362001)(66556008)(478600001)(26005)(36916002)(6486002)(6506007)(6512007)(53546011)(41300700001)(54906003)(316002)(6636002)(66476007)(31686004)(31696002)(110136005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1RHbVY5bWdTV21zRTdtRGJnUDRKamp1RExiTS9oRnZISXFWSWhGamc1U3Ez?=
 =?utf-8?B?NnNvOFkyY2ljVDFUYXl3UFVzUUgxWVBUTVZDU0NCZGFnemVDczhmOThLYzh1?=
 =?utf-8?B?UGNuSVNiT0ZKZWhMeW5ScG5pSjdWdWRvU1FyUDU2VTdrcEM4UnFDTXh1dC92?=
 =?utf-8?B?WUU1dVkrK3FxZEhGeVNVZVBzTDYwcU9uNjY1d0RFVUU5eGVpMFNZZkNETmlq?=
 =?utf-8?B?YmIrb2FyVEwxSDIwTk1iK0JWNUQyQVF0MXFUeUhDQUJ0c0ErVEd2WDBUc2tH?=
 =?utf-8?B?TnJ6ODBCaFlxams5M0JhQUZTQTEzdE1wVEM3NU9lWE9NaFpMRmI0UjduMHkz?=
 =?utf-8?B?STRtcTAralF2ZDZBWDc1WGxWNWZPNm5iVVF2STZ4QUUxVjN3OUtWOHBhelNv?=
 =?utf-8?B?MWtmbFdzeFZsSkxqUmwvenE2MFg4QWI3TVlvaXVmekZKd0tMenlCeVQxcVZL?=
 =?utf-8?B?K29xaTdRR0diR09QclN0NGJQdEZPMlF4cnFUdDlOTy9CMGNpdXBya050SG9S?=
 =?utf-8?B?aXhJMjNDS3p0eU0rYlduUmZTcDU1aU5LN3BHeVVub0FPV3l1Z1hpSzZlS09z?=
 =?utf-8?B?OWNRMzVUM21PdG5GMW9kZnZtUVk0V0UwYXAvclNuWGsvTDE4aWJJaUlTN0tj?=
 =?utf-8?B?bExkSlkwTkFmTWFCa2dJczI4OVhBeXpRYndQSmljQnVGbFpscjJqY2NUMEJC?=
 =?utf-8?B?M1RRWUtuNXBHR3ZZQXcrNm1uVjZ3bndFK1hPZytOU3VOVVJmSXlPZWc4R0RW?=
 =?utf-8?B?QzMzTnp0a2p5WnpzYWlFKzlLUmlsczV4TFBDYmhsRDFyM0FxckNGckYyQlRQ?=
 =?utf-8?B?YlQySllvWnQvQWtTcVBMeFRyK29MZTJnaS9jRWE0bWo0RzNXRVVSR3NQQjYy?=
 =?utf-8?B?U3dIMmNpTEVHVzE0ZmR6NWJJdlovaEFlWmN2TnFSVWs4eDd2L1N4eUN1QWMy?=
 =?utf-8?B?SHRsbnJkZEFXcGh4czhYcmtzZEVWaHQxYStrdGwxMlJHcTB4YVBUbnpHTjJj?=
 =?utf-8?B?OE0waU5OWHRTSStwUmR2ejl4dUwzV2ZoN1JiTkpEREQxQUpMQkkyUWlIbjlJ?=
 =?utf-8?B?WURramRFMWVCRUJ3d1ZlWktoall3UDQrZEhQS1RZbTJ1U1JFWHJIL3NEL1ZK?=
 =?utf-8?B?UHo5aXV6eEZBeGtTclFnNlZsaGF5OCtieDlTT1JmOEJLR0Y5WDBKK0xnaXlC?=
 =?utf-8?B?bHU2R1ExeXV5dDEyWGtNQTZKZlVQdmVyRkJWVFdRclVEM1hsdmI2QmtFcDh0?=
 =?utf-8?B?c1kwRDA0NXUvYXExMzhVK1VoVEFTam9PRmFVc0NuVExyNEZudnI3SGpaMTV2?=
 =?utf-8?B?eHVWU0d2K1F2VTBvQ2VVWlZ5b2htREFxMU9QdEhDT3YrRmpIZmdRWW5JQTll?=
 =?utf-8?B?aWt5NGpmS1NHZEMyYWJxMzFUbXh0TlVSWitFR1NLU3QzQU03M2tjcDc5NXlS?=
 =?utf-8?B?aTM2T09jb0pHelo3MjMwVURjVUU5T3llc3gxcG1Ca1gyODNBVnRmdFhyTDVm?=
 =?utf-8?B?MzVIRjVFTDBrc2dBV3M5Y1ZlYmROR3ZSb3VVRk1xZWh0TE5VcjRYTy9RdUU1?=
 =?utf-8?B?cWlFV1I0TllGbzZEa1gvYjdUQVJkcWJFME9GZU9wNXJFb1FKUjFoYS9sbHZq?=
 =?utf-8?B?N2NrUU5xVzBscTlWODFHUG5wUzJKc05YaTlQYmtXaFBLR3N0SU4yaVBkbm51?=
 =?utf-8?B?UDdrdzJ1NmpCSWdMUithS3dySnpWakI2WnZvRGxkZER3RVk1cUtoOVRZa3ZP?=
 =?utf-8?B?SnNWb2F1WnZReWUvS3lvcnVDZ1lLa0hGeGR1bGFQWDRxY09nMXpLaTJTUFZw?=
 =?utf-8?B?UEZqZTViVk9zTmVtRzVPdmlZT1V0N3ZIdWdMOU11UmFOcVhZUkFvNlREQWVM?=
 =?utf-8?B?VUhJT0ZZMEJJcE1ZUHN6elMyNXo5UWxIcXo1RFcrWkwyUFZuY255OVRydzdv?=
 =?utf-8?B?NkpTTjdCUTEwZ2R2M3NMSi9UVkZnTlI1ZUNVQjdmSnJXYmtMS0l6eWZKSFFR?=
 =?utf-8?B?M2drVXJrakg1WXBaekNkZG9rb3h0VHNDOWI5MXRDOWV6aUVZWk5rSjZMM0dU?=
 =?utf-8?B?QnM2a09XUmNMUHJhSXVRTGJzYWRNamg3Tks4QnZJR2JJSkdVbUxnNGw5SnJT?=
 =?utf-8?Q?p0zOk7RxvzpFFUSGLKfsoC8GA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cd0d41-00df-49d5-b4e8-08da820d5223
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 18:04:55.2301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYvbcxaRI7j5uN9UdH1N6eGtnu+ahl2ZpxF8/OWKlSeoQuNOvEYOvLHfRy6VJBA+cFR6SEqB7YiGgaL0zRGPjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6136
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-next <linux-next@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-18 15:34, Randy Dunlap wrote:
> Hi--
>
> On 8/18/22 12:15, Sudip Mukherjee wrote:
>> On Thu, Aug 18, 2022 at 4:10 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> On 8/18/22 03:43, Sudip Mukherjee wrote:
>>>> On Thu, Aug 18, 2022 at 3:09 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>>
>>>>> On 8/17/22 19:01, Alex Deucher wrote:
>>>>>> On Wed, Aug 17, 2022 at 6:03 PM Sudip Mukherjee (Codethink)
>>>>>> <sudipm.mukherjee@gmail.com> wrote:
>>>>>>> Hi All,
>>>>>>>
>>>>>>> Not sure if it has been reported, build of next-20220817 fails with the
>>>>>>> error:
>>>>>>>
>>>>>>> ERROR: modpost: "cpu_smallcore_map" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>>>>>>
>>>>>>> Trying to do a git bisect to find out the offending commit.
>>>>>>>
>>>>>> Thanks.  I don't see that symbol in the driver at all.  Not sure where
>>>>>> it is coming from.
>>>>>>
>>>>> It's powerpc only.
>>>>>
>>>>> Sudip, is it non-CONFIG_SMP by any chance?
>>>> Ohhh.. really sorry for the incomplete report. I should not try to
>>>> mail while travelling.
>>>>
>>>> The error is seen with powerpc allmodconfig and it has CONFIG_SMP=y.
>>> OK, I see that also, but it doesn't make any sense (to me).
>>>
>>> I did 'objdump' on the code file (amdgpu.o) and it's listed as
>>> undefined but there are no code references to it.
>> cpu_smt_mask() is called by drivers/gpu/drm/amd/amdkfd/kfd_device.c.
>> and cpu_smt_mask() is an inline function in
>> arch/powerpc/include/asm/smp.h which is doing "return
>> per_cpu(cpu_smallcore_map, cpu);"
>>
>> So, the offending commit is 7bc913085765 ("drm/amdkfd: Try to schedule
>> bottom half on same core").
> Thanks for digging that up.
>
> It just needs to have that symbol exported I think.
> This builds cleanly now.
> I can submit it or one of the AMD gfx developers can do so.

I'm not sure where I would need to submit this. And I'm not familiar 
with Powerpc code at all. I'm OK if you submit this wherever it needs to go.

Thanks,
   Felix


>
>
> ---
>   arch/powerpc/kernel/smp.c |    1 +
>   1 file changed, 1 insertion(+)
>
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -86,6 +86,7 @@ DEFINE_PER_CPU(cpumask_var_t, cpu_core_m
>   static DEFINE_PER_CPU(cpumask_var_t, cpu_coregroup_map);
>   
>   EXPORT_PER_CPU_SYMBOL(cpu_sibling_map);
> +EXPORT_PER_CPU_SYMBOL(cpu_smallcore_map);
>   EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
>   EXPORT_PER_CPU_SYMBOL(cpu_core_map);
>   EXPORT_SYMBOL_GPL(has_big_cores);
>
>
