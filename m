Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3C859FDDD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AFC113FE0;
	Wed, 24 Aug 2022 15:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F6610F04B;
 Wed, 24 Aug 2022 15:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQd0dK2S7idbnyBOLx2qAKAVK9BHe3mhO59btncITaQ5NpLcp4SrEN8jUABm40a6SH9p7YvmOAanJJlJB5BN9rStmx3bfbwf6zMfeOmrplvCMkPN+vmz1hrKyv1Z53eFdvBWl47nLU4yz1MKpspwKccJKBy4XgfwiU8P1SUQpmFWzLNMJ7vUFLziHqIMBXExARpSHUXQr7dm2J4n/H1ZXK4kyGn+ELE3a0ILeJglnayYaSLYpMyEV7y7wdpqlqEhlLsnL8glHWkveWB9ehx65PE9VdpJfGQWaoJLujBIS3fPxKsWTTY9UdjnceSXL1mwy5KmsV2cwKSWU+YgMG7lNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2kthDdiQcaOIi8B/3YTXl80n3CuZtkFYM1Tnqc5lbY=;
 b=kyKra5MfC+I3bStafcyUb3hOnTiKbCeElShJBkE1uXqaEhDjDjNs2NGajkn55gjx/QV2dLjpGcBUlPKuT5uuQRh8gwzkexFL16O3EY+iPHcTtAiK+2z1ViW5MDe6tdberVDFOA3Lymt+0ZV0351uCMTZ4wfbsBW6kDBgcf/xDu7Ef64+jI9rXUOIFUqDFurq0DrZxE7NsJqTsisF618ONqSoW3o/0ubQtRsWCWi4fTQG0UpQT2Qs12KmOS0ZDnLCMgvglkP9j/5gIrlPiqep8fFkW6yI/QVYfysOgmxll68T/zPB7RwMoBqVcBYcCWNC+RirZIdHB3/YVLtveGGJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2kthDdiQcaOIi8B/3YTXl80n3CuZtkFYM1Tnqc5lbY=;
 b=nVJ84vnh8cU5Jes6iuSoBLJVvHRQTNUj7cKbwlBfTPND6kcbeyAQtsi0UYqCiGz2tJ7x3/Gm4I8xVaZlct36SZuDCkLZsPkeh8xCQMRNi5rZe5qIUDabNE6R6RyRAMO1HKSt7IVIOtQKLc5j6dKy+p5bm7WL0mGJ0/AgkwgT5Ok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BN6PR12MB1428.namprd12.prod.outlook.com (2603:10b6:404:21::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 15:06:48 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 15:06:47 +0000
Message-ID: <184567f8-0c75-b692-2348-0adf68247b77@amd.com>
Date: Wed, 24 Aug 2022 11:06:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
 <02f71087-6cdc-cd9a-940f-2e7084a41597@mailbox.org>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <02f71087-6cdc-cd9a-940f-2e7084a41597@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0413.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::28) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 164268ac-0c7d-44f8-f065-08da85e2440d
X-MS-TrafficTypeDiagnostic: BN6PR12MB1428:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjJtpfaCs0edpRYWmwHgbwF5bZg22pY+qGTZIQ2H3u+ySIrvuYX80U3R3Yx1amH04F78dnDr+bqz+Ma0RoTCI/sIt05YEE9NKRE6H+zFaH15hAc0ZJnF3DgCxjTbh7lpiNlbfBi/SYSArWQpbAtKAYQnSKrTWF6J1U90CfVqB+U+nG3a8kmMlLIHh6CiO1t5gyEUo4ot32onVsDRqrWMCHIWy3/rh7Qs1E14l+JtmoxMyPBHGv6ne518qnEiKzEkPxrbAnEubVLdP8KPGJOVGiCvI960hBpl1WxGtBaxw7yhxtJxxqcOsyiAHXBo3qO+5nbzWqgzVTrkNYQtPI1bM0uBMKV8oiEouI0VCoeJbak7rFZJM2u06gc5Ys+BF6QdUxuunAZBXjEHB5KjQFImnJl8G7mPFBxoVqpDznpIE4i5k5Q8gXuMVNKf9fxlBMS/riDcpNzmC5nQmdGEYpZLMr+yQ784MACHIc1ifGf1cT66M7uyT1pJKtvlHjHcTO0S4tSJR44ZAygItlAOBDZgWaLp6sLwJhk1xITbCPQQ/LGW7jg79Pqu5hpJfDoksW3zAhSCXGM54NsTQXqxr1L+qyyGjKUXVH+C9GJUVh4sCs956Y9fXsnanh+uQgQicqgBRzUEUWAYBVoIroJ9CYNwSB6X12vQvyHTLQbRILkvWw9se6s/CZVjvZwmiNaxLcBy3WiK0t9DSbqUb9ULAm7Xnz/lJROiwVlWBqZPDalHXXUhrixoB+x7WU68u8awu8r1iFmBYZXbBhFs/Es+UldUjxlM+UEk+O0bY/o7M8eEaDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(2616005)(186003)(38100700002)(86362001)(31696002)(66574015)(83380400001)(31686004)(5660300002)(8936002)(6486002)(66946007)(4326008)(36756003)(66476007)(2906002)(44832011)(41300700001)(53546011)(6512007)(26005)(478600001)(6506007)(66556008)(316002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3lsQUUyeFBVa1g0YXNTWEEyWnFSTnFGNk90Vlc4WjAvNVB0MFZGTkZWZFND?=
 =?utf-8?B?Y2x5M3ZIQmluQjlWY2pvejVyUGl3bG9xYUZOazNMdmdLYWtNZUZIZU80Y0RK?=
 =?utf-8?B?K3p0dGpuUlN5QTZXUFhuUnVldjFwcmVORkZTMExESHJ6N1l0TjZxS1ljUkY2?=
 =?utf-8?B?cXl4bXRQZGdCOFRMTGw4MmUyT0p1SjdmVnhWN2dUVHFCYzN3cTRjNUtIWDRy?=
 =?utf-8?B?aE93TElTNnRHU0U2VFZwMXVlSXFYYVJZTHZHK3VRN0s2RGJpa0RzbDI0dU5Z?=
 =?utf-8?B?UGwrTlpPemdGaXRXczRKRDBETDZCNGFCMFBlMlhMcU5BL0NqQzZLb1NrSHlN?=
 =?utf-8?B?T21lSGJuM0R0WWRWUWxDMHNUcWs0S1NjZERFTWcyR2xjV3BvcE12Wmg0WGk5?=
 =?utf-8?B?bmRZR3F1bEhWM2grSGxIODJpQVdkSkYzeHVVSVkvd0tDNk9hQ0ZHZE5aV1dX?=
 =?utf-8?B?ekpOZWc0dUhnWVpaaHUrMElZckYyVWgvcllOVDNuU2lGbTFDT2tYRXdmYnJk?=
 =?utf-8?B?UVgzQW1aUjJxeFJGZFhmNlVyVnhYckpvMU9VajFucjk4RzU5a1JpV3lnM1FY?=
 =?utf-8?B?YkxpM0hBcmhML2JINkJXU2FhSzIrU2kvams3YU9LMCtZeTNscDNXcDVzS2gv?=
 =?utf-8?B?aHlyYXVxUS9OOEZZWXlQbGE3NTVZWllNZVdpUytiTzNNQ2NibVVqbXN4SGhq?=
 =?utf-8?B?bUV4T0NGd0lmUWs5U05VQzZRNmhoQlpWSWEyMlhWYnpVUk03bXV1SS9adEdQ?=
 =?utf-8?B?ajdKU0VmeVhoTVA0aEJuYjl4RGs1VnozVFNqRXdpODZFR0dhYXFwSUJhV2FP?=
 =?utf-8?B?aXJaZ1RqUGZaemF0RzRhZXl4MlB4RExBaVVFYldIRzFITFdtc1lOMnh6anVo?=
 =?utf-8?B?UVJHQUdBdTdWODFsT1VrRE5TYW55VnFzRHdYZlFsY0NnVzhML0NBV0M1NVJz?=
 =?utf-8?B?d0V5L1N2ZmxSZ3VhWUZsTzdISHZYNldLbGs1OGpPZjdERjNqOHRESTQ3NS9x?=
 =?utf-8?B?dUhKVHQxdkdZaVF1dk1oUWNITytjL0M4czVDYkdDYjhUNlp0TnkvQklZcWtM?=
 =?utf-8?B?RjFzWEpCeVBabWpUelFNS0c3TUNrc0hnbGZkb3JmL0tDU3JBUTdST01qUWts?=
 =?utf-8?B?MU1USVo1aTYwL0xjZjl6dmpXWFpUTHBTTytOQnFYN3JBc0JUR2JpNEN0eWlD?=
 =?utf-8?B?S2w5dEo5a1Z6TGxUS3hiWisvMFY3eW1IZGo3Q1loYzBIcGxxNUpjbjZqcHFU?=
 =?utf-8?B?aG45TXM5cXlPZWRYZ2VpbVY2dXhHV3J0OTROZHhpMHpaNFRnV3NETEQrZTFa?=
 =?utf-8?B?NEI3czJYcUtRemIveGZGQkVIMVdWa3hyRExncmNpWWhWK1hWYzBrTS94eFQz?=
 =?utf-8?B?Q0FXbVFlUTRnRThYY1pFREFVRFhGZTNZeE1nT3RlczVmY2pWSG5HV210dTU3?=
 =?utf-8?B?Q1ZrcjY0S0xSOHN2b1lFbldDcDMxNFk0Y2FQWXpqWis1cWZiUVpaTFR4bTdF?=
 =?utf-8?B?SlB3QjFwa00vRlZkS2YyczJuVFIvMExuRkJFVnNLblJYcWJWK3ZJZG9uUjZz?=
 =?utf-8?B?WlNyZ21NUmhlUy9TUzRrZ3VVSlV2cndQbWNiNVBxN1JKSWhLN1hGMzdtSU1U?=
 =?utf-8?B?QUFWMlJoZ1laNEMrTmd4TWRGTzhZaVZwZWNRV3M5NSthbmVCdDEzb2hMVkNC?=
 =?utf-8?B?eEpER2Z0K2Z3VFZNUFU4OGQxRkJSdEFsaUJReWFrUXd4RTZOcUtQRGpGRlYy?=
 =?utf-8?B?bEp6QW5vOW5uZDR0ZmtvcHpNa0lzUm9GcCttV2UvN3dJMytpb3NjWlpvRXpY?=
 =?utf-8?B?SGJ2VlBOalZwMi9US0VKMDhiU2M4VDkyWDBPQU8rMTN6bHUrUS9INEc0NEFv?=
 =?utf-8?B?cXM5dHFZV2xneTFNVFZEZWtnUk1VL0tqM3pJZmtvM2RDQ3R3ZTduYmdLb2FJ?=
 =?utf-8?B?QXdQbzROclg5bkZrRzd6Mzh0MG44ZThmOXFZZHJ5cklsKzVmeFZWNjFrV1Jt?=
 =?utf-8?B?WE5iQzNzVzFMYW1KbENCSWVFNXJnNDlScGhJTlVQYUh0QnpndW4vR2tJTGN0?=
 =?utf-8?B?OWJiajNQVldiSnFUOUZPaXU3anI0T2VuNXNETFhtSzB0MlhBSTlXK2Y4eDI4?=
 =?utf-8?Q?uWgVVVFTriiHiBGuHIgN6Dv1J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 164268ac-0c7d-44f8-f065-08da85e2440d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 15:06:47.8776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +v5k/5TEWJcAPUHn+1KuQNVpIwRzc5PgwqqHpueLUSq31L+gBsKsHTZWHS3Qh6C+t0YEuI/JgZBZ0yJyrLAojQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1428
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
Cc: ckoenig.leichtzumerken@gmail.com, Li Yunxiang <Yunxiang.Li@amd.com>,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-24 04:29, Michel Dänzer wrote:

> On 2022-08-22 22:09, Andrey Grodzovsky wrote:
>> Poblem: Given many entities competing for same rq on
>> same scheduler an uncceptabliy long wait time for some
>> jobs waiting stuck in rq before being picked up are
>> observed (seen using  GPUVis).
>> The issue is due to Round Robin policy used by scheduler
>> to pick up the next entity for execution. Under stress
>> of many entities and long job queus within entity some
>> jobs could be stack for very long time in it's entity's
>> queue before being popped from the queue and executed
>> while for other entites with samller job queues a job
>> might execute ealier even though that job arrived later
>> then the job in the long queue.
>>
>> Fix:
>> Add FIFO selection policy to entites in RQ, chose next enitity
>> on rq in such order that if job on one entity arrived
>> ealrier then job on another entity the first job will start
>> executing ealier regardless of the length of the entity's job
>> queue.
> Instead of ordering based on when jobs are added, might it be possible to order them based on when they become ready to run?
>
> Otherwise it seems possible to e.g. submit a large number of inter-dependent jobs at once, and they would all run before any jobs from another queue get a chance.


While any of them is not ready (i.e. still having unfulfilled 
dependency) this job will not be chosen to run (see 
drm_sched_entity_is_ready). In this scenario if an earlier job
from entity E1 is not ready to run it will be skipped and a later job 
from entity E2 (which is ready) will be chosen to run  so E1 job is not 
blocking E2 job. The moment E1 job
does become ready it seems to me logical to let it run ASAP as it's by 
now it spent the most time of anyone waiting for execution, and I don't 
think it matters that part of this time
was because it waited for dependency job to complete it's run.

Andrey


>
>
