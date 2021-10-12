Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 825E042AFF6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 01:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C93D89CB9;
	Tue, 12 Oct 2021 23:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2076.outbound.protection.outlook.com [40.107.102.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229FA89CB9;
 Tue, 12 Oct 2021 23:04:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xc1NVaNvr2QiwH4tzuwMq+5Ynj2VgQnxd3CstREUiQ5KyjmoJF4QGFq1k8JtRORFf/eMaBnWLjL2KZ7j2smVmjyeivg+JL7Vsi0ouM7F/khwvpG7K81U8fMkWYkBT/s+NHfgypzZGSuvqgdmxG3IOAPm1R/UKFZuEYcnck8lLfIMW+q8sOsT+ydNStrg4SCd5iiP4qvslfAfMYK2ILAbclzSJvcOrTq2dwQpejkyWzH7YcCiQDcprXlz2QFmgjkgzJZj4Vl4fTsH8Q6YD+OdIpU1rF/w/I+VARVYmQa+dtSC2jhw8SD1FNX3Btphu7suh2WBv3LrQ1dpuUARw0Wc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+4eskFRzXYKj1CJ9x35WC4o9tR3ShWi7z1+Csbu/4g=;
 b=amE+uTJK5WvrwE7T0JtjGKVI+vl65clAPQXJS6dOBUbR3ky+bdVidTZY2zbhDVQt2Tot/5PXvC7kADmlDOkcPxtm3/Ee1j+kvvnitRE3LqdpIPUNF7X1fEEeEdHPm4SR09yHY9FLkiiJzIW3KHN5EvODfYccXs2Epw5/0iPj7pFhWzqBzzlHZF5HN8trnDuO1uqwM2Gu8noUbXJkJkXe2absT8T3k04fvYOm2HKFxxSWM4WrCcZsqXUcpdx+9t1a8oUQuysBe1g23nSfb2brK7jCLZv9+P/lqwrF2i/DoNmQRy3g+cN59Db+Y04LcD7yCHlkVprOOuLX8T0O4Pdkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+4eskFRzXYKj1CJ9x35WC4o9tR3ShWi7z1+Csbu/4g=;
 b=yrblRghDguLckSHqm6IGI5S5jw+EOf8+36aXd8yEffZjewutpEe0ZAGNmJCRAsbmBrXDo22fQNKtToqMqgDkg+kdBZ5vMuW5RvuN7qv7C35IvuwuynSNZcewOjCpqXA2i1gsl5XfjnPCgU72ppB1ehuTcebxq8yCxs8VkSJY2t8=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23)
 by DM5PR12MB1659.namprd12.prod.outlook.com (2603:10b6:4:11::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 23:04:41 +0000
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29]) by DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 23:04:41 +0000
Subject: Re: [PATCH v1 00/12] MEMORY_DEVICE_COHERENT for CPU-accessible
 coherent device memory
To: Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Sierra <alex.sierra@amd.com>, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jglisse@redhat.com, apopple@nvidia.com
References: <20211012171247.2861-1-alex.sierra@amd.com>
 <20211012113957.53f05928dd60f3686331fede@linux-foundation.org>
 <20211012185629.GZ2744544@nvidia.com>
 <20211012120322.224d88dad0188160a40dd615@linux-foundation.org>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <17af2994-108e-e2ce-604b-84a85dd3505f@amd.com>
Date: Tue, 12 Oct 2021 19:04:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211012120322.224d88dad0188160a40dd615@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::31) To DM5PR1201MB2491.namprd12.prod.outlook.com
 (2603:10b6:3:eb::23)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.118.126.231) by
 YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 23:04:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d662cee1-ceee-4dbd-8a82-08d98dd4ac2b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1659:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB16597F3D74A0AA405C859AB592B69@DM5PR12MB1659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KiEz+ARcQ1yYvXgZ+1/MrOHiIZgfbegVUdt8nc6/v/m6DLxLVDyAM0nGv/xZTDX7AlpeHjSEYUK95XB4qxFAgtsOOy0jHbN8ZCywod+c2sIBHgEDYV9/KFjUpq21ezRpPzId2JuMGvhdK50xoYnULdLT1Jb1ywNZpwGxRNnoQ9IcS7rYhZPNnWxr1dyqTGfSclD20PiDiL1AJDgZKeNdREdRVYR3pB7FWB2fDNq7gxHpN77gorqEOL3BrzffoI39yuhXj61JsHQjh/1aZtPdyI5KUO4RKtba+k/QxKPj0xKZqs5MnkivVdAEIA1WhYkk1n7Uch18e5jsOf9GiO3jLu390R7vFC25WCE08a2eZfiLwMAwAwkEFwzaPrLujR2PnDnLi1M4hwAq977Q8RdChiv1zW1boSfWIyYWMxjK8mhCnp193OjeflpPS3koYg9RrET57MXNLG2taWxb4O32/BhEnAAU7hGnMa2fV/Guhxy5U4TpXUDq6ewLQXtUuK7EppxC+3WKxivYnUNwCzs1sWgDgZVhLy1DjkBhsoAnYgJFheIBgYAhFH9pFVpaTXbLvoQN/SIB1DuNGgJV6Ss0vFmFH/VNUKprqMaQIbQ1G42mEzABcPXkTajMwB0ZWxBlYSgmzX/D0rj9/QnAAwN6c9VzQvfP+x1jg7WT0EIG3bo8DkkNa7c4os9Q7og++aS7PrDLudMo5iegPWHsy4YvUHwPIobEIBc332yXVTLsD6riT41hViUWe4bOYw/6f1h0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB2491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(6486002)(7416002)(4326008)(186003)(38100700002)(8676002)(110136005)(16576012)(316002)(508600001)(5660300002)(8936002)(4001150100001)(2906002)(26005)(86362001)(66946007)(2616005)(956004)(83380400001)(66556008)(66476007)(66574015)(31686004)(36756003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjFGZnkva2phL05TS1ZyTEYxS3FERXJiUDZHcE15M0lZT1QvYVZTU3FkN0dB?=
 =?utf-8?B?NTVsSWlRK2VIZ1JhV0NYNFQyS2FHaUlGYmV0Y3pJOFdDVTNSRnVUVG9rZ3Ev?=
 =?utf-8?B?YWxyY0N3M1JoQW5DbGxhd3czQ3l6NUFxUDcyMlNlQ2gzc3liN0E5ZkhMdlI0?=
 =?utf-8?B?UTBPbnFZS3RKd0lpNlJ5QnZLMEpwSHYxR1VWZXNMTmhnQjRKZ1czbFBsU0pX?=
 =?utf-8?B?U0pIa0hJMXlzbitRZU9KNFltUXJ6SHlEaTF2c3R1c2lXTDVsc1FFKzlIR0tM?=
 =?utf-8?B?WktRck9wUGQvY09UeGFnZjB5RkJkdGtqMlZQZ0IyTzkyT0NicTJlUmxWSFRU?=
 =?utf-8?B?Y2dxUWtxelR2RWF3R0pKY1dLanlEOWpJVEVJMmhjTVpFUTNjOGlMYWw1SmJK?=
 =?utf-8?B?alV2WUt0aEJ1TVk4dmUwSExVYzB3TmNpc0ptNDlsYkJqVGVNSFdSbzRtdHlC?=
 =?utf-8?B?eDA5c1ZDTDF5VnljaUl6cVVDNC9aa2xBOVVpTEdxWVo1bEt0NytFL3pmemQ2?=
 =?utf-8?B?emFQazVIMmhFbGExWWhta2J4aWtMRTdzYkVtdm9SWkJDZllSRlBMMkV2REUw?=
 =?utf-8?B?Y0hUNUZHd3FHbHllbXBBTjNmOGwyc2VXZ1oxci9UTjRnK0NuNU5MQitGMEhv?=
 =?utf-8?B?ODd5NFhRUTBjbmc5c3I5cHEwdnJpQVl0NmFPOWp0eUZ6Tk54SEtFZjdoSE9k?=
 =?utf-8?B?akpudFhaR1Q1WHZOaEl0S3NiK01NMmhJclk5TWlnOVJIU0k5dEViSHJ5Q0ZD?=
 =?utf-8?B?WFhOYmtVc1Vuc2pBNjRDWUZhR3dmancvSVJvdkxiNjlPVU1EN0NpM1MxK2dN?=
 =?utf-8?B?WGhETWpLUXY5Rld6MnNwVzVKQkdJSjNydzZhcFRhcm5GVVUvSmJsSnFPR21B?=
 =?utf-8?B?dFlMNkp0azhKeWxkajlFVkx1bE13TFk5dWg0S1diOExXN2RSa0ZLQTR4dG9s?=
 =?utf-8?B?akE3b1dvL21pb2x2MmxEM0trWFpLN3JWU1pHUU9ocWhzaGI0NGEzYzU0ZzR1?=
 =?utf-8?B?TWg3bzZ6R0h3WHlLZkUwNDJEVDNyUzFuRlFvQVJqd2JBTUtGQ0wrT3JKMDZB?=
 =?utf-8?B?NHJuS3hJVUZaRWpDa0w2NkUycUxaTERZVFJ2M1pDZlp4aHRyZUJ6MFFGMTMw?=
 =?utf-8?B?OGNZRmF4WWpDaHVHU0JLUkE3QlZCckdUUitCMXZ1NTJCaXFpa2x5MWVqdkZJ?=
 =?utf-8?B?RldYVGZTRFRDUlBoYndMRGZVSjJERC9SSkFtWVBKdWdEaXlSTjFrdUovSU51?=
 =?utf-8?B?U3MrVkwrT1lJTmJ2MGV4T2dXdlg2MG1FNDh2YURUcWtPNDNObkVLeElxR2V2?=
 =?utf-8?B?bVZha2phWnRrNGRQNG80eE5JMjJTdlZTRy9wRjFrQjBSMzFmdm5FbXUwYnha?=
 =?utf-8?B?THVYdFU2MDgxMVJ6czFsUXBEaENFdUNKRHdDN2RxTy9wa0k2TGxYU1lkZHU4?=
 =?utf-8?B?dFFXSnRoYUp4TndieXlBNE1KT2tGR0JqQUtsRzE3YkIxT3Z5S3VzQjVtTmdB?=
 =?utf-8?B?S1JjVWVPMHlKdFZWWEpzbTZqK0tZL29aOTQ3a2lTa24yUHM2WDVKMXgrUG0y?=
 =?utf-8?B?WUM1UEZMeVZSM2N1OE1vUmZBbGNRNm9pNE5sdzgrTnA1clZMSUZMaGM4Uzl0?=
 =?utf-8?B?VDU1QzN4bHhYM3NzbEdXczJ0R3oycUhoWUxPaE4rZjBQeWdRbU9rbVM5Y3U4?=
 =?utf-8?B?YllaNmRDUy8yZTRmUmxpa3ZsV1ZhWjNreFNjVDFSTlIzcnQ3UlY0NGk2d2VD?=
 =?utf-8?B?SkZTS2RNamdnNzNUQ2FsMjM0SC9oZkFHTVRnVFVZVVJDUm4vSWpPK0MvWWRK?=
 =?utf-8?B?V0dGQkRkOW5RQUtTOHV5dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d662cee1-ceee-4dbd-8a82-08d98dd4ac2b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB2491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 23:04:41.3542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAAiTVI1sBbYkLsAty5w3TQ/Fo7X6JKQ3MSxCebQGdlaTMluZlWfbCF2bfkuuNr/wpv51+tPjdGqxNfncVaRfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1659
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

Am 2021-10-12 um 3:03 p.m. schrieb Andrew Morton:
> On Tue, 12 Oct 2021 15:56:29 -0300 Jason Gunthorpe <jgg@nvidia.com> wrote:
>
>>> To what other uses will this infrastructure be put?
>>>
>>> Because I must ask: if this feature is for one single computer which
>>> presumably has a custom kernel, why add it to mainline Linux?
>> Well, it certainly isn't just "one single computer". Overall I know of
>> about, hmm, ~10 *datacenters* worth of installations that are using
>> similar technology underpinnings.
>>
>> "Frontier" is the code name for a specific installation but as the
>> technology is proven out there will be many copies made of that same
>> approach.
>>
>> The previous program "Summit" was done with NVIDIA GPUs and PowerPC
>> CPUs and also included a very similar capability. I think this is a
>> good sign that this coherently attached accelerator will continue to
>> be a theme in computing going foward. IIRC this was done using out of
>> tree kernel patches and NUMA localities.
>>
>> Specifically with CXL now being standardized and on a path to ubiquity
>> I think we will see an explosion in deployments of coherently attached
>> accelerator memory. This is the high end trickling down to wider
>> usage.
>>
>> I strongly think many CXL accelerators are going to want to manage
>> their on-accelerator memory in this way as it makes universal sense to
>> want to carefully manage memory access locality to optimize for
>> performance.
> Thanks.  Can we please get something like the above into the [0/n]
> changelog?  Along with any other high-level info which is relevant?
>
> It's rather important.  "why should I review this", "why should we
> merge this", etc.

Using Jason's input, I suggest adding this text for the next revision of
the cover letter:

DEVICE_PRIVATE memory emulates coherence between CPU and the device by
migrating data back and forth. An application that accesses the same
page (or huge page) from CPU and device concurrently can cause many
migrations, each involving device cache flushes, page table updates and
page faults on the CPU or device.

In contrast, DEVICE_COHERENT enables truly concurrent CPU and device
access to to ZONE_DEVICE pages by taking advantage of HW coherence
protocols.

As a historical reference point, the Summit supercomputer implemented
such a coherent memory architecture with NVidia GPUs and PowerPC CPUs.

The initial user for the DEVICE_COHERENT memory type will be the AMD GPU
driver on the Frontier supercomputer. CXL standardizes a coherent
peripheral interconnect, leading to more mainstream systems and devices
with that capability.

Best regards,
  Felix


