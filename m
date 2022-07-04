Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCE6565C0E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F15911221F;
	Mon,  4 Jul 2022 16:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365D110E0F7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 13:37:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKrPt6c9wQZSY27xQXzsKQmZjMJmsewrEVDHsIv7RniRgGbLAw3hP4QTcibXNbHlU48PbHMnKutLclm2T8jQU84nCl04EOTaADFj6O1WPNeO3W6IEs08x4dyWGCeBrkULmQD+ccbm7IKJrJFOd4CY+mweRdslB7NBCvVD2fKuZ+J8o13rh9zrRQq1Z0XBNcSuxSKrf63nzVyN4zUM8IDuwM7N+yy13ICy/WkCfCpEoLIjrncDnuG53EBXG/F2k77Xa4UHFih2TVP8KdKw46mUfW4bgS3M207cy6eJ4mq5wDku+1hwzQZj07ZhFnq3JrQXzVoVebdBoFpsc2idInqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeMIej36pD/CVBtWF2nEIm8ApADMuT43iaqfTDopw60=;
 b=gROHmi6WQRrEkKxJem+XhjZsdiCHrshrih+uXG3m0HmQ4Jm5PCEC3kUGkXBP3by1EqHzd61r25CwgZNDc1whpx2btU08peGhJGUsfpMgqREmiCPpys+qb3hLOpBhP0F9EeRLusxSvsYgR8dTBTR/LPl45o34aYuv0Pk8vCscocI9nP2AM8/nGtBCjYcTXHBWXyvKLO5lbgYS3yjNAGlQLkZ3y6Wg2x88b8OCZ58rBFuKzjfhbSVZmlYZX07KU+FkBIBYbioyYZfHojhU1O6RqQ+Fc7MMPHFEFECGHyqNBsBdl9nHxNjtXNfI4DHP8dyDb5JbXqo3tdgZ+kotSkumSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeMIej36pD/CVBtWF2nEIm8ApADMuT43iaqfTDopw60=;
 b=Spbxc2sydgQ36UpAx+D7ARYx5RFwUmrgvA967vrqRGctNLJ5k0oo5pjLndRx0RUvekEFrKsq8WdDQRv5MONtuiWsW/F857le5ea16TlBbjEId/X6KBcdhd52DJIxiK8Li46dZC8k2WimPl3WKpzavHxaJJtke+jV6cH0UPajBqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR1201MB0199.namprd12.prod.outlook.com (2603:10b6:910:1c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Mon, 4 Jul
 2022 13:37:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 13:37:47 +0000
Message-ID: <ac6e1937-4943-9bc1-8a85-74447e6c0447@amd.com>
Date: Mon, 4 Jul 2022 15:37:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <CAP+8YyEWE9KCmo2pGOHMyT3fSEXskTG-tfymwQmmy7d1c9CuRQ@mail.gmail.com>
 <3b6a7d56-6c65-046d-0a51-bbe167e04322@amd.com>
 <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
 <91e843ca-928a-7ab1-12e4-89fbba085403@amd.com>
 <CAP+8YyHqcoxVeropBpeuSRX4kNtVezi1-s3FKSic_Z_OQ8BcAg@mail.gmail.com>
 <1e04e766-4a5b-6825-6991-3bd542f562b5@amd.com>
 <CAP+8YyGEHUZhCCUa-3sSVmgGMrTkj=vQomPar=hTN=3-RCznOA@mail.gmail.com>
 <71cc9552-4bf6-4941-e903-2ea62a22a2e9@amd.com>
 <YrYfw6T4MGvifIco@phenom.ffwll.local>
 <785d01ba-7d4a-1b69-a97a-6144ce0f6772@amd.com>
 <YreQER+Szg5dxyNN@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YreQER+Szg5dxyNN@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f01a7df-835e-4d4f-ba80-08da5dc26219
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0199:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +84ILjIvExuLe/xuF/8jiS937CY+PNXTCutJ/w4+79K/IFK+WAwQK3wjnJ3SBhYhxhz4476/GtevnvV71/ETgW28oHQehh+DBDlZ0xDNRaZvFy827HtYs06fI6o3jxrRK6bN1PCST/UNPYncQPMdaJYOAxAxzBmQk/eqozu0es9By8vol3lxOxfChnSUdIOHJZjR5ufj3AfP5gmyu3KwXtaUnhn0Pk4W+vS2RHZBwK2hWkDuovaC1dOWZm7XbBTeLFq95V/0P3e6S68x6Mny08asdaPcNX3BG4qvplPnEikROV1Ju9SU2lQynLEPNekNb6ju9OLUZNjiNtt5r+nTGYL08iLfefe73wXr0Xx9BwiQCresnWH26P3c9l6gEIhpD3KnSY/xkVlpyXCjMw7BzWTv2KsywqqCQEaZ79QL2bZDr/W+KTb9iofQ+H4OHWZvEOWiaBGZnu3tlpAd6FoDJPqpZybkd4CHfNWvbG/m5HcCqV7IwinGF0rYGK9jH0Q2NJYx39qIR+DfJXmQc27nGVaNzXm4kgkScbzgHW5w1Y5BslRoKePqRbzTf5UUaHGP95fkfCKAGBUgUDlPj3aeShJHK2ebo9ZMzPWm5Tp4lyV8sfFq+WTi1JrhXujE/mswhCeflvyyPI10VZzC4zdp7mwIuMfIAOuqJmVsetOz2+cwrQT2DXVmuanaN0e0IFFWH1xUa40ZHI9/ja4mmWqEywm16muYr04zBNfFfjw2F1l5m1uzt1WOXYNN200nC99zk0cIRXwfhGJzYLqpw7VATm6unIrZlR+1z6+XHiYapQ1rElWqTAg5DszffpfyYKGTmTzi0iycRfv5YxNMkuMlaIDhIPDu6xFX7for7jqr2LBDNJk5CcjyfEEHoQm8d15N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(36756003)(31696002)(83380400001)(186003)(2906002)(2616005)(38100700002)(31686004)(8676002)(54906003)(41300700001)(6512007)(6666004)(5660300002)(45080400002)(316002)(8936002)(66946007)(66556008)(966005)(66476007)(6486002)(4326008)(6916009)(6506007)(478600001)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SytCQVVET0xDVThGMTl0NWYzcHZmVytHSHF4eUpuSEh2Q2JMcGNOWlJnNFFp?=
 =?utf-8?B?UzhKME9CTlBibGozMEZDYWs0QjgvbGxmUVRjNk9zOThkRXFuV3QyL0pjU2tS?=
 =?utf-8?B?dExETVFZcElXT2cvY1l6QndwaWF1QWRjZlJhZmpOK094YS9IVDZzQmlBZzAy?=
 =?utf-8?B?QVFuZmRLVG1kMVgyMVN6Y0ZSa2NyZjM5Y0ozcEloN0RKc2h6WWVXMXNyMzJQ?=
 =?utf-8?B?UXU4dms1T1NiNjcvRnhqcWE0bHZIZW5UZTJlWjU2MCtlVVR3UUxFSG5vS1ZU?=
 =?utf-8?B?eXNjWXJYcHV0cFNTNFZtdkNvTVUrNkl1UTBTbzBNbllrQnNFWlJLaStQVVJn?=
 =?utf-8?B?UFY1OVNyNGppUFN0VVNJZFpiTnU4TmdPTjZ3ckVwMW9wOFlwWW5DZ3dXNk1Y?=
 =?utf-8?B?am9Lb0RYYW9YaGJsMitMZjhuNlloUkRUdkdYaW1rUE1tUGtvbFhRZStOR0dF?=
 =?utf-8?B?VW54SmluQVg0azhmMjg2a09VTTN4dTh6SGFoQyt6aGd6Qk1lQklncHlxcng5?=
 =?utf-8?B?ZnR3ZVl6ODhPZkh2Z0hyN2VVZzBlVjZPQklPb216MWhlWE9CMlF0U3N3c0Ir?=
 =?utf-8?B?c29OUXZjZTVvd0V4ZDJ1T2JDSHgxL0MzYW5uYVRKVjNQNkRGVjQ4WUxNeXVi?=
 =?utf-8?B?bFVPelpxWmF6S21WWVdBam9rMFplSm1CTkRZQXFRVGlDdmFHcUZUNTVoeGIx?=
 =?utf-8?B?RFg4eWhvZkJrTUZGcWxhUlMwaStuSlRWSmRBZllDTlhNSldXYktJTkxPVWxJ?=
 =?utf-8?B?cmphcGxtbkx3WjE1aU1xWGN5Qm96eGZqdEcyYWsycVhEbjhsSmduSFErZDNw?=
 =?utf-8?B?Z3VGa3cvbFZTM0picTQvL3VUVmxVVkZNaWlSSnVITTBmaStUWURyeWhZS3gx?=
 =?utf-8?B?M1lqQU1XUnZJVDRmcUhxZ3AzQ0dpaVJVT0R4cXE0c1J5a1M1MFNpc3MramdD?=
 =?utf-8?B?d0Q4R2hWOXFIVXNvMGJ4WWNPbU9HcFhick9OQ2UyM1J1dHZPZldGTy9LemRr?=
 =?utf-8?B?MWk1NkNiRHhranJNVTdvL2I2NTdjbldFZWluNlFEWU9RNTArKzlCa1V3QXlE?=
 =?utf-8?B?WE1TMFdwczNDWVNmTmE5R3QxY2VWT3ptOEx4UW9CYzVTcVc4SEp2VzNIelRm?=
 =?utf-8?B?ekxGTXpYamVBc2ltVUtGa0hDNDMwdlJpL0RoNjRZTjQrTUFhOXA2Znp1U0RB?=
 =?utf-8?B?b3BjRTBEMkVCUGxZeG1LK1M0Y1J4LzEzMWJxMVB2Tk4wYlVZaHlVRHRUY05G?=
 =?utf-8?B?TURUMFN6a2VHdjZZbHNyb2REYStyUm91WFFvdmJ1aU9ONzkzTEhUTGNMcXF6?=
 =?utf-8?B?QmFCYlpWMjJDQkhBMzNQb2h6KzA1QWt5eE1QZ1VIUGNZeHFQemJFVW1BUitJ?=
 =?utf-8?B?dXB5b2RyZ1RkT21wOVpKZGRIeHFGNmlCTUN6bWxvUmtzL0dVWjRPRklLelFN?=
 =?utf-8?B?aHFHK1ZXenZUYUozSGtFd2dNVXdKNC9pK2xBOTZ1ZFRadTh2Y0plZmRTRDla?=
 =?utf-8?B?UEJPYVVIa2x6ZC9xcGFDTDdhcGtUb1ZocjZpSUhuai9pdFVUKzBGK0pGQzAr?=
 =?utf-8?B?TG5oOHo0a2NTcmcxMWVHeldEa3kzNUVGSmsramVRczVhWWkzVTVkY1l6eXdy?=
 =?utf-8?B?bUhmRHV6U2FhZTlYcWtHN0Judmx2cktTQTdhWGFML3VBZDBWODJpaTErZnVj?=
 =?utf-8?B?aFVnT0ZDL2VNd0lNcFJtRkQrZ1JxWElscDIwUmJRZmoyai92bXlyNzB2VmRV?=
 =?utf-8?B?NEdOVmtWZlpXdmxuZVVENmluN3lyVlNzTCtnd296Wis4cXBxYUR4WUlUQkpK?=
 =?utf-8?B?eE1ySzF5NmJBU0syVmJVbkJSci93bWJMaWhYbFZVRkYzRCtYL1U2RW1GRmx0?=
 =?utf-8?B?cnR6bEhpeWZkZFNhTWlqSjJVVXlQbjl2M21LUzdTY2RqdmJ1RXg0WEF1ZEV5?=
 =?utf-8?B?VGp3QjVxZGh5TjJEb1p3VlNlVldiVnRwWVloeHZBVXVFM3FPalBKbHNtTThY?=
 =?utf-8?B?NUhRS0IrTSsxRitPdldlZjd5Rm55NWNCc2gxZE1YWmsxa1ZCaERMd2xjUElI?=
 =?utf-8?B?VFJwNm4yS0Mxb1ZVRWpaRS9uNEZMaVliZkRSK1d0by96VGtuMzNCYkFxZ0Vy?=
 =?utf-8?B?QTBlWGh2RkFla1VTZUYwS2NDWXhQaTUvcVgwK3JEYjRRSysweWg1Rzl4eDZr?=
 =?utf-8?Q?KHvr/+HtuLl0D8+dufbRPaeGIZ7AaH1fqMksmJu4CCeA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f01a7df-835e-4d4f-ba80-08da5dc26219
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 13:37:47.8644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0hEaGwJgXnL5udBUlQp30t7DtHu5Yhx/DwESyjKZdaCGGVTAjp0jlPA45tszlhB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0199
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Daniel,

Am 26.06.22 um 00:45 schrieb Daniel Vetter:
> [SNIP]
> I think we should highlight a bit more that for explicitly synchronized
> userspace like vk OTHER is the normal case. So really not an exception.
> Ofc aside from amdkgf there's currently no driver doing this, but really
> we should have lots of them ...
>
> See https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2FYZ%2By%2BUwo809qtvs5%40phenom.ffwll.local%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C88037a566a8d4c8d4aca08da56fc6e3c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637917939428739923%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=6sYto7GCLw8i3pT9OCFN1l6dxeYYHPghzKDMYxqUw90%3D&amp;reserved=0
>
> I didn't find anything else. So not sure how we managed to create
> confusion here :-(

Well you said something like "Yeah, READ is supposed to be used for 
that...." and that created the impression that AMDGPU should start using 
that for Vulkan submissions and you are rejecting my idea of using 
BOOKKEEP for that.

>> I mean that still makes a lot of sense to me because if I'm not completely
>> mistaken we do have use cases which break, especially Vulkan+encoding.
> Yeah I think we only have some communication fumble here, nothing else :-)

Ok, well then @Bas: Sorry for all the noise, we are actually all on the 
same page :)

> And yes libva doesn't have any support for vk's explicit sync model, so
> that will just fall flat on its face. Might motivate a few folks to fix
> libva :-)

Well that's not the problem. The problem is that we have a couple of use 
cases where libva is supposed to encode a Vulkan surface without letting 
Vulkan know about that.

In other words: Application shares DMA-buf between Vulkan and VA-API, 
renders with Vulkan and encodes with VA-API without any explicit 
synchronization between the two.

I know that this is absolutely against the Vulkan specification, but it 
just happened to work fine. And when you break something which used to 
work people start to complain...

> Note that on i915 side it's exactly the same, we've also been setting the
> READ fence thus far. Since the breakage will be introduced by upgrading
> mesa we'll at least avoid the kernel regression complaints, or at least I
> hope we can get away with that.

Yeah, the path to salvation start's with the words: It's not my f... 
problem :)

> Since really I don't have any idea how it could be fixed otherwise, except
> through some really, really terrible hacks. Maybe kernel module option or
> so.
>
> Anyway I think all we need is just a patch to the dma_resv docs to explain
> that USAGE_BOOKKEEPING is what vulkan userspace wants, and why. Bas,
> you're up to typing that?

I can do that. I'm just back from a week of vacation and still digging 
through my mails.

Cheers,
Christian.

>
> Cheers, Daniel

