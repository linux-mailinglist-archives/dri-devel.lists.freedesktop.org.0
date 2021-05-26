Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59E43917B3
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 14:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C77A6E4AA;
	Wed, 26 May 2021 12:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ECC6E4A5;
 Wed, 26 May 2021 12:46:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACi2zDyekZcFlFgnaF8+pSaA+s2gJRzhtYCz5j8qcf0ZNwIuTH/Bkxa2bMADLNAXPdeSYQLYhgg0sm6MzlQOr9bN2bIkABuaUYSU9M4sQne+Na5MBDcwJtl9Khqhme7gcod4IaGilRJymI6fBiZcfPwAIPk86deSMt1EiOphFk+vbntErlmGdYUnk4r8hKju46oritWkuC/x+v36eqKPWP9F/6P1kpute5IZlnDYnBoX2QFxLrenoQgdXrsyGXb3htFYyYxPYNt2mWl/92/mZo37p33urU2ylQXujhZEf8nVSiciECe0UNQkHRDZcoUJGXns0ihC0Baa0dtUPDzH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mux0nJy+OqrP0cvQnYjX/xNwKdb0MGltShkkELedHg8=;
 b=RVPhO5j1kqEk1PHSU64bV3fR7w51juekclC3W63xuudfP2TQxSNcS8KYovXe3lBMygY7Hbi1ql5Zj6+hY9Mol1TUlyUw5d0RrBtc5ikfNp6PT9vc0mjF6J54Vhr2bEjH+nFsPmDxjT0/9THOZkOBsbGVX8u6dnZbcjZmyH13ckiazJkqG7jwCCmFXlVDWNP6u2cd6sDomGj8LqYshavhsk15IUOHzRfwkwLap0gaPtnHgJLCWt/TP6e5QK+rtJPpSmogx805TWIXB74DmUJGspdjywmOE1JJs1YSXyF93gNs6POPwGmUoLRymonrxs8dMQP7K+UON69T761pKbxTSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mux0nJy+OqrP0cvQnYjX/xNwKdb0MGltShkkELedHg8=;
 b=izqw/kBmw1cqzVcxzqwbDcGhsgtJ9XfPoF0Zhf9PK8ZQL1f4Sr+1MHaXk6lZOZ2wU7hUPD2EfE+mf0wdpHzdZeFAEBDI7DyaqoMJQvZH96YTfYy2xAlJjAj5yYUgGsD7ylXY+pYXpsxKEeUqLAKCLWwFPjbTfv/eUa7Pb5ULUhY=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 12:46:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 12:46:23 +0000
Subject: Re: [Intel-gfx] [PATCH 5/7] dma-buf: Add an API for exporting sync
 files (v11)
To: Daniel Stone <daniel@fooishbar.org>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-6-jason@jlekstrand.net>
 <acc1737c-261d-9da5-7ea7-759063136c56@amd.com>
 <CAPj87rN_7vmmWcL1vqhvM=etaTjwts_L0vYbsgvYF0_qZw83gw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <770eb698-1dde-9e46-da83-44911d96abec@amd.com>
Date: Wed, 26 May 2021 14:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAPj87rN_7vmmWcL1vqhvM=etaTjwts_L0vYbsgvYF0_qZw83gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3ecd:562c:67c6:4afe]
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3ecd:562c:67c6:4afe]
 (2a02:908:1252:fb60:3ecd:562c:67c6:4afe) by
 FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Wed, 26 May 2021 12:46:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 839039a2-b418-4d57-03e8-08d92044445c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4112:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4112B926B94440563879770783249@MN2PR12MB4112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DxWzIQmJ94BZ7zbMJ68yDFvPOi9TDD31KSeTbFctYXAOdB/755x3F2kGEM8PTnAO9ZwIkdGaU0diAU2CzYBSXscfxWsGCqgSbJlQiDe46Z5zuWDIjgi4kBjzpjPF9qaETW+HIQ2Yx2dAfvrH61PMh3spWjrERpxSnPyqKnSvuAWji/ms5qcJeploT7ewuQtWu3CBJeWFrQhIJMdgPH0ce3bJ22EIXEwP2XePlKrqClk6kz8GrU4vuE39QYltht4eruhuJFAbyJmdnmOdzCeiPRQYwTIy6uClwZqXZDUmKJQ9OKWry01s6Hd3vasMXpIMS1ZMXZpXPCbQ25OEq2f0onOn0glivz/LIe6B4lG9XaMK5XRmk1KRlb5bgx0Is1+dxhWHNhuplyDkhsBAyN2I17KCZT0vrS0bdnkMT8DBqWxLOD78vNwvQh1dJMf+fQJNmGX0EE3tD5x7hBmc4jAVjn+QPC716brh/36Ts4GN5rbA2hOyXZVZZou66T1xk+USUwZGnIlHDWGEH9yNK8pd8KKoLBanx6/1Q8P5BAAKpxHOso7VdI9RvDv47NYIChkHjyxN7paRaynljCNFAqRUK+RQ87IAN5T2qQeOZp9W7jb0jsdct3Zfs41c327i1wPM/ZETGZR79uFaZGdGBrlXFB0fNYn5+gCJd7TGQbaZutxpHBnb8XryRMgnWOqopfbp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(478600001)(52116002)(4326008)(2906002)(16526019)(186003)(54906003)(2616005)(5660300002)(38100700002)(6666004)(66556008)(316002)(66574015)(66476007)(8676002)(6916009)(6486002)(86362001)(66946007)(31686004)(36756003)(83380400001)(31696002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q256QklFSVNuTUJHSU1BRElwYVJwcG1aL1IwNVZ2aTJPSVFLelg3cThpbnpF?=
 =?utf-8?B?YWtSK0tDS3pnUUxReGIrLzZReWd3VGJMRXBvVXdVcWJqR3g1eWJDSEdLOUdW?=
 =?utf-8?B?dHZReWlXLzVscitBZXpmc1NKeDJhSjB3a3E2d3E0TUJLNFJBZy8xamFlSEp4?=
 =?utf-8?B?bTFQQnU2b1NzcUp4NzcyLy9NQUpqUnRvSWtSK1ZrM20wK3NyQXNyNERHMitB?=
 =?utf-8?B?MU8zSWxBQVd6ZVhwOTJ3cFRmQU0yWVBtWEdEVnNVOWdFMEdPcEFBd3kvTjBh?=
 =?utf-8?B?M3Rkdm9WR2pTMThaWmc2WXlMYlNycU56ZG5oVG5jUTh2L2NVZENoYUJrM3BV?=
 =?utf-8?B?cVdxd1V5QmRoaHlxZ0cvdUdJempZVU1Fc0Q2QTk2UEtnalQ5YTI5VUZ3M3hi?=
 =?utf-8?B?M1d5RVFpbUx3WGhITEY1eTJJQWtuK1lOWjlQVDAvNzkzM2JaR2Q1dHkwVFhT?=
 =?utf-8?B?R1l5K3Zyc0lFQytta3hnc2pPZ3l5cjNBamV6V1UreU55MkpVZ0Y5T1FGUHUr?=
 =?utf-8?B?OHRvaW5iZExraWtZdWdnNGtkS3IzR0JudWtNNkVRcGpzbU1ETW5zQ1FtK0Z2?=
 =?utf-8?B?U2Vrdm1CYWFncVcxMFNKMmNHSFp5bGNnajdLTjhmRnYyc2JndHZrd3ZoNnR3?=
 =?utf-8?B?RnBBSWo2TDBoY0JnclJjdGJqNFZuT0NlY1krYmFHa3k5NmZPZG5DVjNMdk9u?=
 =?utf-8?B?MlNOd3lWZlBmQUV2aFRxUzV2RDB1S2ZBL2JObm5PZnFxWGVHMlZuTGRZVU16?=
 =?utf-8?B?NDJqWHdHcXJZUFpKVTY2bUVuUktvYm1GZTFMZnZLODU3NWtPcG5MSWxyWjNq?=
 =?utf-8?B?cGxGYTRYT2d0bHRHMW44NG9rQ3kweEtFZ0V1VWRnQ3JMYUF1cFVHTVdER2Nk?=
 =?utf-8?B?M3AyUkoyUXNIUkN6ZjNnN3N1WDk0ZkU0WXVKdGg0V3kvS05xaFJwUWtmKzBZ?=
 =?utf-8?B?c2xmU2VGRjlHNGMvbldvd2h3Y05KejUxWmpuMFgrQk9KYVQxV2k4YXdJd1Vz?=
 =?utf-8?B?bHYyNlZ4cnl1MmNaWjB4RWhVeUxHM05wQ3piRThuakc2QkJmWjFock5od1JD?=
 =?utf-8?B?Zmt1dEU1SUhuV0xyZ2kvbFR1cXZvaENRMGZrTU5oQjRBOUFZY2JZVVIrTk0x?=
 =?utf-8?B?THlhV1Fna20va1ZuWkdBSk52VEZsM3MxVmEzcXAzb2tlbGhCVHdYUlNoSE9R?=
 =?utf-8?B?aTNpeUlOTkF3d01VZEV1Wk1YeUJvTDZ3NDdUOTV5SHZrVkx6bGIzLzg4d1l2?=
 =?utf-8?B?RmV3NThtQW1tKzVYZ2piN1U3eUNKeG8wVjc4KzczL1E2eUg1TWNhUWNUc3BV?=
 =?utf-8?B?RkNOTTFKbTRTOTM1enZpSVlLUXdPZjNzNmZZTkVpOGlKQWt0b0V3NTZ3YmlY?=
 =?utf-8?B?dVRoWUNTRHNuK3VzanZXN1ROcFRFTUUwdE5NaWdpS1QwSU5SeUtPYjJya1Uv?=
 =?utf-8?B?aEVLODhxdUpwWjMrWVBHaU1XaHdKRTVoNC8zeFM5REJQVWxBdE9xVHFMdUVN?=
 =?utf-8?B?OE9nNmJQbTV3Z2d5QTJkRVExYitMckx5Y0VINVNsRDFpZU1TUlZPUDBBU1V1?=
 =?utf-8?B?dXhZbFRCd2o1WU5qVGhYWDFVbTlPdGFJNzlJeVZHMElIT04zWjBIekJrbGNz?=
 =?utf-8?B?bjNyRGtsU2dRaHR3ck9KMG90bzRRdnpkUURGMHdneis2dEZkbGQ5OS8ybWVj?=
 =?utf-8?B?TmEreXNmUVB2Q0dFUmdyWHRldG1WaXpCWjk2NHV2cXo2bDFyazA1WFBzUnFI?=
 =?utf-8?B?aVRRMWRSUE9Mb2N1dmJucURNQTY4UVBjVEFMQkhXbldVMHNGTURzVDB1SklY?=
 =?utf-8?B?QlBJUmhib3o5UkZSNFBEcDJHckM4NUxFQkcwVXM5MXBnZjN3M1E5NVRZbWph?=
 =?utf-8?Q?b1MbdHnP3EB7U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839039a2-b418-4d57-03e8-08d92044445c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 12:46:22.9480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+jr4OGf1BviGzicpsA6mH9FR7AeEdSQ1UCFn8FTCf6Ca9xDFtkRsFKR3MhgTTaF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4112
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 26.05.21 um 13:31 schrieb Daniel Stone:
> Hi Christian,
>
> On Wed, 26 May 2021 at 12:02, Christian König <christian.koenig@amd.com> wrote:
>> Am 25.05.21 um 23:17 schrieb Jason Ekstrand:
>>> This new IOCTL solves this problem by allowing us to get a snapshot of
>>> the implicit synchronization state of a given dma-buf in the form of a
>>> sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
>>> instead of CPU waiting directly, it encapsulates the wait operation, at
>>> the current moment in time, in a sync_file so we can check/wait on it
>>> later.  As long as the Vulkan driver does the sync_file export from the
>>> dma-buf before we re-introduce it for rendering, it will only contain
>>> fences from the compositor or display.  This allows to accurately turn
>>> it into a VkFence or VkSemaphore without any over- synchronization.
>> Regarding that, why do we actually use a syncfile and not a drm_syncobj
>> here?
>>
>> The later should be much closer to a Vulkan timeline semaphore.
> How would we insert a syncobj+val into a resv though? Like, if we pass
> an unmaterialised syncobj+val here to insert into the resv, then an
> implicit-only media user (or KMS) goes to sync against the resv, what
> happens?

Well this is for exporting, not importing. So we don't need to worry 
about that.

It's just my thinking because the drm_syncobj is the backing object on 
VkSemaphore implementations these days, isn't it?

Christian.

>
> Cheers,
> Daniel

