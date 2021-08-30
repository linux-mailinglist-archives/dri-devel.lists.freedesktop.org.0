Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BA3FBAC5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 19:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9F789E01;
	Mon, 30 Aug 2021 17:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68B489DFB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 17:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGFBerVA/d+mmlBClLmirMqfGa0M/xIhR7fGTLeB2JozBYXusbVolTFndvsNv1+rr5xbFDm4H/cMwHtctfj4QZsPnAVhUAXfEfjwjfHIjmR/IbkrR0OSKdF2h2NuIveRlcSbaayPIUxP9zdotjbB5oqSgc35YBb2JLofEgnreHm+rm3MR6N5VYVQuLkAVaaNtYaUWxT4uoAsSsCNwMUeoq0zaLx+gW93fvdJZkg18XjxXYUqMv3cfNSALWZtjTeJszJM09L3GjgRviBfZLaxNvhPFdxJ8sMFhSAPtgat3A1wj3ZorFQvDIB8IvsmXPi3swglY1ucvW+FCfiRPXbYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Tf3TFiBF8cW8Yq8rz/x47xf8yWdp+ZU3SLm1JOaKR8=;
 b=EEnjVS1f1QbeZUCZmPC9yARhODNmkTXAoqt4OC5LBaKZrKYXaEzhsAxOCyp5MpfWu+49wlG/x1dKKMv8GZ78ujSU41Md8AcRi54WZtKuXiU+qCMtfQIlkQZDpFnxipn3uTkXnkndv6v9jMD7QgfEqd/ldpTyrizFWL7EBSPVN7H0Zj0Dq4vm2Ixg1n/g9vZlJM29gzbr5jODtQfxU6JzscPf2wLWra3mYnm0V8iyUPIDrVZvHrtZrAs++RD2DBojdNuiQoAHPcjY7CIy8/u6KPRtsLsLwzrI08hZ8HDdG9UinLWcKJ/DIBWyHAwkZYxxZI0Us8jB2tngoaXgBQuH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Tf3TFiBF8cW8Yq8rz/x47xf8yWdp+ZU3SLm1JOaKR8=;
 b=T7FWXdjavInq2XI9vXk2CEkBI22JA36jNbiHlIgUzzO9TmCbY4mEIqCcoMrsL2PoFLkBL2h/7OM3nyqVGwZA8kQf70AP0PqfX5vQgvBiTXsMQV+9ZyAEZQFYMeC1pOFa3yT/wcN9qNm4+Ygk9r8oP/57LmgkuIuwbvZEijx9Na0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5292.namprd12.prod.outlook.com (2603:10b6:408:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 17:04:46 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 17:04:46 +0000
Subject: Re: [PATCH v1 03/14] mm: add iomem vma selection for memory migration
To: Christoph Hellwig <hch@lst.de>
Cc: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-4-alex.sierra@amd.com> <20210825074602.GA29620@lst.de>
 <c4241eb3-07d2-c85b-0f48-cce4b8369381@amd.com>
 <a9eb2c4a-d8cc-9553-57b7-fd1622679aaa@amd.com> <20210830082800.GA6836@lst.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <e40b3b79-f548-b87b-7a85-f654f25ed8dd@amd.com>
Date: Mon, 30 Aug 2021 13:04:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210830082800.GA6836@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YQBPR0101CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::25) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YQBPR0101CA0152.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21 via Frontend
 Transport; Mon, 30 Aug 2021 17:04:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f7b7b39-51ac-447a-f889-08d96bd844ca
X-MS-TrafficTypeDiagnostic: BN9PR12MB5292:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB52920A338B5E0C741EB77C7992CB9@BN9PR12MB5292.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9rScD7ZJqp4O7sotzfPJATG8iRgNFnadVgTRhfABBgYSYKO/D32TsFnctkp4ryFYAYgRJc8kw3Xh+u64AOc2CoGNjdztG79VfgnBeBZHZtnNjuJ4L4ajJjiwBt6pwOaH2PQEF95lrqyHC6TVOlVYVQerpzjaQN5l32I8XthlXsXII0NeR3p2k53c3oDvQLlItyXWc3KK+S6T/sw5my30C5ltaklJb/a6FhtpP4lwocWj+cV771inRngFAiCDGKZmdLtO/DXbYRi5A/D9GfPpY+woGQzXQKWnWHhsHUO7K0HY5jmWtFoV+fh/rXj1Zg6LuyVqJOU6hlg0B1M+6EgS0CnLJFfA7qLasUvOmaexI6NIa+FCtei3vqdUY34jHttO+MhOqRso+VLtPU0doYUQEb69ZQy8Sp1a/VYx95Xe2YYXukuwvRNCXAP6neT/gWOhfXFh6nPzNkAxF9BUcdWN6A01K1f0QY+wIaQVnSuDl7MoAt/3opUx5k9IYYWE+pCYBoy8svaVC2ryczpKl/GZGK80vAMyjnC8TSlqgryIA8oNalsfVHUYJ8E1usxiHH85rl8luFm2onw3EQHGK7MNODod6inyffDXL1y64/rEeeY4mrYcdDWZcs0xaBBfAw6AYWFkH/KNak56nwaxZocERtKYb/N79OnZyU8WTKZKmGIvkr2O+D3tKPmsx3x+69MCWQ2danOA83UQfahGP/v5yj31IGN3EQThqYSXn1yL5y4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(26005)(66476007)(66556008)(186003)(66946007)(5660300002)(83380400001)(31696002)(478600001)(31686004)(2616005)(8676002)(8936002)(16576012)(36756003)(2906002)(7416002)(316002)(6916009)(44832011)(6486002)(4326008)(86362001)(956004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3R4ZFlpdUh2clNVK3FIem93ZGg5V2FEaWdzYjlWRXdhais1R0NxZTNUdjhn?=
 =?utf-8?B?S0hnY3VrM1BRMVRFZXVtSFQrV1JNQVNwNFozdGQycmhsTThVdjhsZzlJaFA3?=
 =?utf-8?B?M3FVUjloMC9IZnBXWTdEaWxMOW1nTHBLM3hJek1wVm1idzlTVnlYbzlmS2Qr?=
 =?utf-8?B?MUNvc3ZuS2w0eUtLc0hCb2xsOEJCQ3c0dy83UU84a0JFTEQ5dmY0UkxqeEtW?=
 =?utf-8?B?SCtpNHk1T3pZc3FkNWVxY1c0aEx0MExJbnhLZHpPYkJEQnBqOG9iSFhPL0pO?=
 =?utf-8?B?SnBFWVZFVUw0czNzS1dUaklqM044VHFDNjVIdlVsZVFNMlVrMUQzMW1sbkFW?=
 =?utf-8?B?V0xRTi9qeit6a1R4OWUybjR1bEhZcS96aHdwNTRaRlJpcVpNaTJRS2I4YXpL?=
 =?utf-8?B?bXZnV284SjNaWTFkWldJUk1hdFh6eGtXSjZqeUFBYVl6cWlVcDdTNWh2aGln?=
 =?utf-8?B?SGxhUmZtRFNVNjFRK043ZTI4cERpMnhLeldScVZ3Z2toWm1tNlkxSlZOQnVs?=
 =?utf-8?B?ck04ZEEyUkdoVFBTMndLQWsydklldTBFc0p1UTMwaGxSYVlYMDNYM2NTdlY1?=
 =?utf-8?B?Zisrb1h1UUl6dnBiaUxaSW11dlZmSk54WGlGOFRqZGJEbm50dERRN1BvZ29w?=
 =?utf-8?B?am9GdEJXTTlZS2xaNkZuQkZ3MFdkTFU4NVYwQVovOWlvb0pWNGJON1h6NWUz?=
 =?utf-8?B?QVBHVkV1bVpPTGt1VXA3NmErUWRSK2pweXREZC9HbnRmTlFtQnBMSUN2SFdL?=
 =?utf-8?B?MU9GbXRnU2FsRjJVQ3RFWnJickVKaFc5UHMwL2hhamZBK3psRHNEayt0SDNn?=
 =?utf-8?B?NXlpMVJrWlRtWlgveXYwelZnL3ZVMk1Cc2VMaEhReWs2WHZlRXlBRk8wZEVv?=
 =?utf-8?B?Z2FKaFl6bHJKd3JsQld1Z2o2WmlEcUY5eFVKdFJKaGRwZkx5YjFVRXBIOE13?=
 =?utf-8?B?UnFhVldRQk96ZkJ6QWhUR2gyOWdSelVwMUhSNk9kdS9OUm1tRmJ4Vmw4VTI5?=
 =?utf-8?B?NCtua3VDUkE0ckt6b0lMeEE3bnd4OVM5UFM5Qld4OWw0QzZpNDFsL3oyM0Mw?=
 =?utf-8?B?VjdKaFZ0SjlnbFUzbGVMSlQ1cERJdTNaZlBoMXBCbEZPMTF6WVl1ZWtFNzlp?=
 =?utf-8?B?QVpya1hoeHRidWpoQU9HMzlqUTUyM2JrMWtsM0RYeE9MVHR1b3hHUnppdTdw?=
 =?utf-8?B?OHpUTnh5QUZwL0NzbkUvYWgwVGdDdjVOZUZxUG5JMXB0MTN3S0VGVTM3c3p4?=
 =?utf-8?B?WUNqQ0s4OEp3dHZNeGwrSVA0Q3VoblczaTRsMFFJU0tqT0hKOTRSZloxTVZ3?=
 =?utf-8?B?ditocGxTdlNybWFoV0hIUml5SWszU1RsdGlUSkkrRVV0dmZpbURCV0pOL1N0?=
 =?utf-8?B?ZzAzOGh6czV4U1NINUUrS0lOQ09ycElWejdTMXNmYlhXNThhaVpHdkU4SmJE?=
 =?utf-8?B?N2lzMmVIUjZTZ25CYUsrZDRGZHEvdDc4Tm1jTGhDekFZRUFqY0pHQm1WMm4y?=
 =?utf-8?B?ZFVWMkVxOE5kWTdlYlNpQTFyRkFOcTdhYlhvWXlWQzhmcnBHREI3dUVwbW95?=
 =?utf-8?B?TXozd0V2Zks0OThyNEJLOHBYVklBVnoxUUNab0JMcldzYjJiZGhWMUhIcWsv?=
 =?utf-8?B?VlVscnY2ZVkvNUJYYUlORDFPa1dLRVV1V1pSWkFiNlJYanlSbFVMVDdXdkFw?=
 =?utf-8?B?Wml0TEJQZGlEUFowZWpHVDBmTnhHYTl6Zk04aFZ6VlQ5VFJNck10MzE0aWVH?=
 =?utf-8?Q?S/uowfNUMC3wOBjMV2rEG+4m91Co1JI/GQsW67s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7b7b39-51ac-447a-f889-08d96bd844ca
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 17:04:46.4580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8qthcJsEPtf3a+G/X8B0TOnW7JLYHEoihfvatHcPqLAwADTGQT6FHlgELzjIFFIiVPAOU3FZD1nZTZp9kbG+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5292
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

Am 2021-08-30 um 4:28 a.m. schrieb Christoph Hellwig:
> On Thu, Aug 26, 2021 at 06:27:31PM -0400, Felix Kuehling wrote:
>> I think we're missing something here. As far as I can tell, all the work
>> we did first with DEVICE_GENERIC and now DEVICE_PUBLIC always used
>> normal pages. Are we missing something in our driver code that would
>> make these PTEs special? I don't understand how that can be, because
>> driver code is not really involved in updating the CPU mappings. Maybe
>> it's something we need to do in the migration helpers.
> It looks like I'm totally misunderstanding what you are adding here
> then.  Why do we need any special treatment at all for memory that
> has normal struct pages and is part of the direct kernel map?

The pages are like normal memory for purposes of mapping them in CPU
page tables and for coherent access from the CPU. From an application
perspective, we want file-backed and anonymous mappings to be able to
use DEVICE_PUBLIC pages with coherent CPU access. The goal is to
optimize performance for GPU heavy workloads while minimizing the need
to migrate data back-and-forth between system memory and device memory.

The pages are special in two ways:

 1. The memory is managed not by the Linux buddy allocator, but by the
    GPU driver's TTM memory manager
 2. We want to migrate data in response to GPU page faults and
    application hints using the migrate_vma helpers

It's the second part that we're really trying to address with this patch
series.

Regards,
  Felix


