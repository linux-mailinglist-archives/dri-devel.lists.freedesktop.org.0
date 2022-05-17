Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF552A425
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 16:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0297989DFC;
	Tue, 17 May 2022 14:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF2110E08B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 14:03:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsDJiFDoSLFKqJqiLSWWtOBKxj8/TbkhIo3ibs+ML3K1OWpVdQgum1h6EH8E7frPtZnpf4DJZXp109G9L4Q0HAdRqw6jMDf8O0auHWU7wXjXBXKcYiJVBZakoCDUQvzmb8s/0XjEM8+4etikwxKhtpKLfsVFDEx8H+8jczuY9eqRmOqepwY98DPvtT0DWVwsRL0w7ld6yuohZlD4m8P3DraVBVi4DFq3NKECig923OrjX/YFJ6WS6kN+BMb4bUbti1pGAsIqvws29W53G82ODKktcpD9tz8WvYcWPOilHUByG9RZym2Sk48Tm7sT1QjZyX3mnrEdzsdReiBFcUDbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nquBEbOEyj7Th+D5qXPFuZQ+1TA544c2XS/wat/lA00=;
 b=hN3Wo3g54IZW90PN4XCQBI4Y29meN6DCIjKZ/Y3T9Pgdyn0Gh8zsxbgcsjIt12RtZWbfwJ+0M+AQbtnoYEuKv1R5yimpJltipFronlRFGkkrBGY0zwxme0KggVZhcOememd2Yoqgis+auhYEJrND+z6IjAVl+IMqyzNnvSOnglGYkQrT2yaK8limoWRd22ztlbNj/rWm0uTH2wwWtXjDwrs70eovWwdAMFV5Pcdv2h3sM5SlVK2AHkO3Lnz9tT/HMec5H+nzKYiLpe854ZhlbeQvb3Xb5n5/V8T4najmxcV0mfRtao/SYpzWk4E815UIATh9WWc84zAo8lUyCmsm5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nquBEbOEyj7Th+D5qXPFuZQ+1TA544c2XS/wat/lA00=;
 b=X8YFyz3mJn2C/BHmZ8Jgyy7ZoLxyPrmgjHnH9gH26AEX9xAbVLJ0AxlT8Tz98O3kKp9MYwfOOMASlMC2M+YIV30gDMB3lV1CakVAx0XMu5vphZSqs5MlcFKkzg0H/rJAERlOoyRBD01nGySbLUrOIRDsaQk7AbRXyqsu6j+BHDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 17 May
 2022 14:03:18 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9d18:7a38:7c5d:4a40]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9d18:7a38:7c5d:4a40%10]) with mapi id 15.20.5250.018; Tue, 17 May
 2022 14:03:17 +0000
Message-ID: <573fae0d-c9ab-98b0-c6f1-5b0d4e52dd01@amd.com>
Date: Tue, 17 May 2022 10:03:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Erico Nunes <nunes.erico@gmail.com>, Steven Price <steven.price@arm.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
 <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
 <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::20) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69ca42f7-7fff-43a1-e603-08da380dfe18
X-MS-TrafficTypeDiagnostic: DS0PR12MB6655:EE_
X-Microsoft-Antispam-PRVS: <DS0PR12MB6655290CB152941341BAF3CEEACE9@DS0PR12MB6655.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N577blC3Aq408J6OACs5G8eBHRrLgzGHLg4+zmSpS3cT8oGifV5JfHL4nSd+ul3xAiG2LLeJmh9MNogmMu3eDAW1+V+tkc7CtTt08tlAWGxsdAs/+GnOeyImGQKw8tQlXvIWdxJc8LY2mQI8wAlGGqaaGMnlxUZwv+hvlPehSGydc4hZuQ8uWq7uOO9Lq3kiu2r5PXrASugN3rwQcb7Q+EAjQkzOn/MB3soatE4aN8F+IUVsnmNBTzRr6EuBxVXtZYsfaNu+FTAHz7GHauPNhZ7ft37RrljtaRbgKmKwv7v7aNf0nSs/uAL9HiyVXBRJsyoU9/AswvS+RgLNrkwepGKW6AVrGLpDKaady0RDDmvtBmHu/aG2j1IxU4lwFa8GRIrdrV8Ynfz4CuOvrArUxn/ZBJR+tSpmqgn8KlIipBoB5rgNC0V9QHzSyQPiPFcm5DiOMgcRCSM3LI+rIepbyZvYaXofxcgZYinzLKVhLdY97g/FgJk/8SmifcvH03IT1ihnS6FX0ureTvWKUI1xEv/uftxG7Gb0lLRvR5WisQGfGsA4v3oZEP6G2nmCmaSim2LLfPSPe0hjrX/e/AxEC4pd4s7vRdKdpVI5jO4HJ/5Gk0s9tikoxB6Hyfd0JSugv7A3ajm3ADS246Fww0xyQZp3ZL/ZTElovH5R+tzTKGl9pOB2ooWaO1yM+QqOg32OXoxJcRlsQRyIqB5r7WvMdaCH2yPYm5mqJNWHFgmEJrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(110136005)(508600001)(66476007)(6506007)(6512007)(2616005)(316002)(38100700002)(44832011)(186003)(8936002)(7416002)(53546011)(4326008)(86362001)(31696002)(83380400001)(5660300002)(8676002)(36756003)(2906002)(31686004)(6486002)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTczTVNTaTFSelBYeFpEbWdwWTFkOHJ1eTZjU1VpM2d0aURmUkt5NGIyMGl2?=
 =?utf-8?B?ZE55YkhEbEdGcmRXZktCd1JMUWJLMXlNaGFITUp1Mm9mc2pabUdtV3dldEJN?=
 =?utf-8?B?NlorTWk1cjkvMm1pQVJyVGpVaUVEY0UxbHpvMW1jTEVaTlNoUzFLY2lGNUZG?=
 =?utf-8?B?S2VKZ0gwVCtGbW5raG1say9tdkpRVmFrM0NDMHpWbEY5K2NFVFVNbmgvT1Yr?=
 =?utf-8?B?aHJGVWM2djdmdW8wdUIrazM1cWdIbUllN2RWSHkvMWNHUytnNU1OTVZ0MkdT?=
 =?utf-8?B?Y3A3WEg0dzlBcSttWDZLNXhEanVrSkxLRHl0V0FTK0oxNU1QMDh6RlltR0NS?=
 =?utf-8?B?WkdIeVpMQThYbGlpWHdSWmMrZlFod3NhanRXbnoxdnRQZ1g3RHdaeTFCT1hi?=
 =?utf-8?B?MUw0VVpuSnN6ZWY1K3NubFhZcUg3ODNZWVo4RU5CMkxWaUFoelB1QzlYSjR1?=
 =?utf-8?B?b05kZjhISFlSZUlzS20yMlRlUm1nbStPSXFBcXFJWitiNERGenhhMDlEK0sw?=
 =?utf-8?B?L2N5bER2Qmsva0JSSkYrRWZqUXFVako2bUR6RHNhcUpESTlVdUxRbWxqUWZO?=
 =?utf-8?B?Nml1dUxmcHpHS3ljendIVGd2OVE0MDgxRkFGaHRaS3orK3pRT2pqeUE1UU1U?=
 =?utf-8?B?a24vMS85bTdXcGlFbnFYYXlSK0NOaUQzd05MU1I5R080WVdCK3hXZHlrdHhK?=
 =?utf-8?B?cG5sTmNUT1FCSlRrdjYycGZIeFdORVgxT3lzOXZXYlkxNWM4ME1sTG1EaHZa?=
 =?utf-8?B?cXZHZElQUGFvYVlQMkJ6ckVHcmdjYnYxa1pQTWRJTTAvMk9wZHlvbjRkdmNN?=
 =?utf-8?B?RVdrU2ZzazM5WU8zSi9udzJydFp5YmNuLzEyakZHTjB5Z2lqeGIwUWx6SUQx?=
 =?utf-8?B?dFhpUEF4YTlnNndqQVg4VVBXUTFVOVJyb3NxSzJuQnY3eU1tMUZLalBGa0Rq?=
 =?utf-8?B?RWJJTi9oZm05RmZwK09SNDVhQWlvY3pvOEhvLzNBNDg0bmowU2dIQmQvUDlZ?=
 =?utf-8?B?T3dObXZxQ1FTL0RWM3U3UHVpMXVCbmU1eWZFU1A2Yms5S09uSGh2emxoL0l5?=
 =?utf-8?B?ZGpPcGJwWDZqZlUxRkpjK2ZIUTNXZkFndlFKREZ6TEV4bitiOUpwNTJoM2E5?=
 =?utf-8?B?WnVmTGN5cU55UGRVcDI4S0cwYzJnaWxrcTdyYTlRSzBXa2dnOGhVNjFqRnJi?=
 =?utf-8?B?K1BoSExZSEFISDBDa1ZRaVZVZkJMYjFyS29iUm9sSVRZNzZWSmNLU29RMHJR?=
 =?utf-8?B?TVRRaWNFZkhDRTQ4Mmg5QkJsSmgxT2ZHMlo2dCtuYUNuVkFQRHE0MGZSNmMz?=
 =?utf-8?B?NWdkTCtRTGt2U1J4NmEwdENsTmRScFQxc3ZzY3NKTURiTDc1OFVSV2VCdTZX?=
 =?utf-8?B?VkhnL3ZyWGZVTFJGUVlCSmxiSitkTnJrRFZwd21Pc2FHL0NITkFKd1h3bzFB?=
 =?utf-8?B?MC9KQmRNY3RCYzRUSGMxTlV6bzhJekZVVUNrYXVmbitFNTZIbmkvMm9HQk9Z?=
 =?utf-8?B?c0VFWnNsSzE2WkVhVWVZTzJTTnhiSDl4VTUwbnZNWExVS01kZzB4Z3hCL2Ux?=
 =?utf-8?B?RG9NRWxvWVI0NGVlQ1ZtdHUyc0JzcFE5cGFjd0V1OWVSSlZGV1dPMTJHSkd5?=
 =?utf-8?B?eXZFTm4rOXhnMmR3UGx0L0JyWlNkUkp2MmpmTTZQOStjbTQ5bzhnSmVoQmMw?=
 =?utf-8?B?RldRczUweVJxb0M0ZkpIWFBrb245bjRFdTZKcWROMTdwcDNUaWZRdWpUVmRM?=
 =?utf-8?B?dE5JOHhqd1pFZzZnbkVBeTc0SzhMNW5kUHc2Vko4c0xZUFlDckRLdkNmc1FF?=
 =?utf-8?B?cFFGaUJFTGxpN3Y0aDNZY29UN3RFRS9SQmNHSEpqUGhPSGZDaEQ5dHdvMTVm?=
 =?utf-8?B?eWllV0pqWUxmSmlXVnBKYVMwWjZ1MzZicjJ2VmFTaStPV0tJZDh1ekN4dnEw?=
 =?utf-8?B?QUt4Q1Nhb3g0MlhBQktQTHl6eFBBclNIZ1dUTE50TG9ySmdDdzJEbXFKdkZr?=
 =?utf-8?B?cGgwa3hjanJHMXNwdDVhUWlKREdidlVkOUt1TDBSaEN4WmJaa2dwNGZ0WVZF?=
 =?utf-8?B?WkR0V2lVLzVBSHhyM1FxbzR5N1RPWkRiOHg4akhoWE9mWm90VnRkV3BqTE1X?=
 =?utf-8?B?UFlGTlA0dkhDN2d2ZW9xRTJLalZRalNlTVZsTGpDTThNWXlVNlFIcHZmN2Vn?=
 =?utf-8?B?dVluTURmeTQ1SmVvUVdXK0hGWVB1VmFEckRNOWgzQ3FmTUNtNytsV0dNWFA0?=
 =?utf-8?B?OHMwcFAzd25Vcy9yKys4NmdaVmtJU3lDa0VFNjZ1eGs4c3hUVVlsS1QvVUFH?=
 =?utf-8?B?Y1g1c2pYOXc0elV4d2xUY3VjUGdVRWZTMGxBYWx0Z2RXTk10WEUrcHlNODRI?=
 =?utf-8?Q?7MpUc8qkmEDkfMeVVFZEkwZ8yhd01+5QbGnoMlMrL3bPC?=
X-MS-Exchange-AntiSpam-MessageData-1: CVDXNtgCPjotlg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ca42f7-7fff-43a1-e603-08da380dfe18
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 14:03:17.7777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +36K3x3Oip/vHCuAh8fCByYD+WcPJwGzm7GRBFwqcIG4vBnh+QTsqFF+AiWwsfFtgPVEIiAdgpIp1R6UZXjemQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let me push it into drm-misc-next.

Andrey

On 2022-05-17 05:03, Dmitry Osipenko wrote:

> On 5/17/22 10:40, Erico Nunes wrote:
>> On Wed, Apr 13, 2022 at 12:05 PM Steven Price <steven.price@arm.com> wrote:
>>> On 11/04/2022 23:15, Dmitry Osipenko wrote:
>>>> Interrupt context can't sleep. Drivers like Panfrost and MSM are taking
>>>> mutex when job is released, and thus, that code can sleep. This results
>>>> into "BUG: scheduling while atomic" if locks are contented while job is
>>>> freed. There is no good reason for releasing scheduler's jobs in IRQ
>>>> context, hence use normal context to fix the trouble.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> Reviewed-by: Steven Price <steven.price@arm.com>
>> Is there something blocking this patch?
>> Mesa CI is still hitting the issue and I have been waiting for it to
>> be applied/backported to update CI with it.
>> Thanks
> If this patch won't be picked up anytime soon, then I'll include it into
> my "memory shrinker" patchset together with the rest of the fixes, so it
> won't get lost.
>
