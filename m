Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237933EA3C9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 13:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51E06E0D2;
	Thu, 12 Aug 2021 11:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8426E0D2;
 Thu, 12 Aug 2021 11:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiH6peKYb0wjwTf2A24ep4BVn+oeZxxo9tsYSDmJhE3zCURG/PvLEDYxfXp/nSDn+xtnKHEyR4Z+6EMQjHlWC96g5dakaaUTIvonPEO9v3IyfPIyLiTgj+XP6MwnXZTxjjSBwilzzwpyDgSj6HSd6u7Mcijrmh/+dE3JS+/c9pj3rnJNxktaI8GoGhitufiAZk4QugL8QHAglOHwm9y3DEP0XeOPFKV2CzaNiWLfljTtHXx6AQ2ExhphtEbqq3DbAS5aT11bthP0jL5AJr2ZzzYEAskBfIJh3GxcOfPD4VS8b/S8zRU+o/zWdMr1YhWa1tZVaUB85HHqv2o41rf72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTZwOCU65BHZCZyIQp4Ozo1JplIpNRnzQEu5moIc0so=;
 b=FDA6WB4kJUH5hyeyKYjzHmUXoCmL/5PhgMNL9oF1Hz9B8cyFKi+MKtWSmRFbWRrsHGHS9cuZbsBwlcetMSuaeCounTfUw1gxhsHSN0dmHGH3bZfyGsGtV0TUekAkmliGrr55XTiUyE/wVJHoa1aZwcvM/6kv24q52Re+65yMGZ+YWzpI11jRm2QfbuP5j/drAEUtk3tACHuDN9tBojeoUvpdE6ZSXdGps5Vv6I273+n7zJq1tgilLjzQJpCCwgQsyRq7iwTRsTyiB75XCFhjzKmjoO2Oz+k15RW9qGl+5rPKEfEgdlLC1mMXBvHL9LtxKFtFqvrDolVconb6yAivPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTZwOCU65BHZCZyIQp4Ozo1JplIpNRnzQEu5moIc0so=;
 b=AyM/3nEqHIE3XhIQnwylK6x+1SukH3zhP3xlmSof4j+u+M7TxIr3eLt42ToroAWZ5xRP0Vsh6sPXFSVwknJ3PWpwp2X3cA4AbBAU4e03O6RIzKxlVg87FjmBzrt6kSFZ2SyKkxZ2Reg2GRAq1q4GpS1dGM8agfl/X79+Mt6oBWc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5356.namprd12.prod.outlook.com (2603:10b6:408:105::23)
 by BN9PR12MB5260.namprd12.prod.outlook.com (2603:10b6:408:101::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Thu, 12 Aug
 2021 11:34:02 +0000
Received: from BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::4804:801b:71a:a8ed]) by BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::4804:801b:71a:a8ed%9]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 11:34:02 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210811165211.6811-2-michel@daenzer.net>
 <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>
 <DM6PR12MB26196DF7D33462060FC4F607E4F99@DM6PR12MB2619.namprd12.prod.outlook.com>
 <MN2PR12MB3775E6C1ECA915283108E6D783F99@MN2PR12MB3775.namprd12.prod.outlook.com>
 <aebae00c-4b7b-552f-accb-e51d151ecb43@daenzer.net>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <194e8a33-1705-d19c-add1-38941b6d9b5c@amd.com>
Date: Thu, 12 Aug 2021 17:03:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <aebae00c-4b7b-552f-accb-e51d151ecb43@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PR0101CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::31) To BN9PR12MB5356.namprd12.prod.outlook.com
 (2603:10b6:408:105::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN1PR0101CA0021.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend
 Transport; Thu, 12 Aug 2021 11:33:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c130917-3158-4d4f-02e3-08d95d851590
X-MS-TrafficTypeDiagnostic: BN9PR12MB5260:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5260F8E347463151855F135097F99@BN9PR12MB5260.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GOrOa/17/ajTUnZO+8igmESmPemCVcBZv9JIpNWSbfx6hRnmAwPEKIy6/fEb+qJTmdx6gR+B/zZzyw6borL7GP9XzRYuS+sOr7v3+Qp9EoHgxwiRLXgR/ky2w0kh6EPez8L5/KqCtH6wfg3/EhAS8WnL5HM8+IVPOFo2iga69+aVeSsgT3wMK4jnJCb+TibRSPGCNoWLMjd9XDw6AdHt39JrKo1920kDGATiX2VM77d7ksJhL6haasH5fq4VzFzMytfppcxBzQdVJrjzrbz00J4H11YqZwFdjI9igErW9RqxOzdRH/Djf3ssFy/V+PEz3VJpBKTs4NR4mkwgzISYv5yRo2y8xX0BonwYrb/rYwmnjTmogpxqkItmJMLJEmLVpWX3uF8WcR8snJ4Z5dJeimhRWR5Ab2PN2IdBW7+3KALBjDKRmXZDqkpyn/QOHlAQIlDvAYoKW/tD4K98lQ3FoYU0NMz4BvAYTaiBnztF4rwsXdHZtiMMUuhiDGjBI5jZW2QqVfc+n+va2bwZ5GHYlKVN155paxC1a/intxUwlSJXhg5osdIC4ssNs5m4iGuj5G6lR78igfnQARrumSpBEKJrUi4NmDacsVeupbWPr7L/EPPvYOZ7RT2ZH7MDhixmGJZC5UHy1HqKHWx2a6ejlm949U8ii73Nm01IS+mHnhNVLd9TTGeHmKjkCvlbqzZQP9PMUzHhApWBrdA8oflZL6XMZZ0ROPye605xD61Ctk3e0+dH317gwnvcl5vt/RRJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5356.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(66946007)(4326008)(86362001)(110136005)(54906003)(6666004)(53546011)(26005)(316002)(31696002)(8676002)(5660300002)(16576012)(31686004)(38100700002)(66574015)(66476007)(186003)(478600001)(6636002)(66556008)(83380400001)(8936002)(36756003)(2906002)(956004)(6486002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUdWbEp0aWNITjBINHNnWmJ3ZkZuU3R5UG9NeGhkdVR2TFMzcGpOam5kY0Vv?=
 =?utf-8?B?WXlJQmFQSFE3ZzUvY0tzMGYwOVg5Z0NUNFlDZmxDMms5NkhsZEtmNHdEeGNw?=
 =?utf-8?B?a2dKa1lwRWx0ek50NG9PM0xLc2FWeW9vdXFFSHhDblFrTHNBdURDdFh3SFZJ?=
 =?utf-8?B?Yzl1T1FDUFp0aDdwbU1lZzZTd3A2Z1U5N0lteFRZS1VDRjVScVdDMnMwVm1N?=
 =?utf-8?B?c1gwNzlsUWpnZXRvMEZUc3Bpa2x4VFhWNmUydWwxdjI3cm10L2tqTmRGbTcy?=
 =?utf-8?B?b1lKci9hQXU2Ky9wbmZjMkloQjZYWUFKQUVadlZndHkydmNXWDAvaGFRUVZT?=
 =?utf-8?B?Rm5Tbm9rMWh2Q3AyYWowZWwzNlovQjRlb1JhT3VPWEkzTTNwZjNtdHV1aTl2?=
 =?utf-8?B?bkc5MnMwK3FuYnArY0FzMHREd3NOeVVZY2FBU0lBd1NHMXI0aU11clF0OW0r?=
 =?utf-8?B?TkF6ellsVERKTkkrNUYzR2F6UUdQVXFwUlk4RDYwYmxMZHlRZ25FREdFSENI?=
 =?utf-8?B?WXJmKzdxSXRBMENBQ3pBYVh2RkNrK3pJS2psTG5hcGFvbGhFOCtYOElZOVli?=
 =?utf-8?B?SWZRa0RIbUsxS2VBQkpja1RzdFRobU5Qbmp0S0thb2NVOFNTb1ZHcU11UU5Z?=
 =?utf-8?B?Snp2YnpneGcxdTFtNEVzSmVBYU9CMXh5QlY5UEdOVGR5WldEMkltT3pJb3VO?=
 =?utf-8?B?eS9mbmJHZkdFMkEraEtsbEtYdDluZGJZbGVFY01BR2daUDNOVGlVck1mM3Fy?=
 =?utf-8?B?R2NMVEVpbmZIZE9pS1hGVGwvQjVSQ0JCeUI2M0FlVWVJdEk0ZXJVLzlCQVhM?=
 =?utf-8?B?d0J0djRnU0Jibk1aUzU4M04yZTRqM2VIVzdxYXNSL09GYUkxYlJ2NWx4emRI?=
 =?utf-8?B?N01qMHFHY0NKcWZXY3p4ak1HME1lU3R0WTQvcWF3NWVSWHNHb1hiTHVUR01H?=
 =?utf-8?B?bzB2UCtjQi9HSUpJVXFpSHZxQmRRNjRubEgrVEFsSEFreEljMThTZmM4b3hQ?=
 =?utf-8?B?eHFJbTY2a3NXSDBYQytyOTd0Q2dYNEdiY051RktMMlF3Y1RNTXVkb1RFaDBR?=
 =?utf-8?B?UURuOEU1akxncDBXTlhmR3hLS2ZoWHBqZjcwZnJFYjlvTDdNMlJ0MFBub3lJ?=
 =?utf-8?B?MnRKZys5eHVGb1BpVXFWWWM0bE92UWYyM2s3RkZVM2U1aFdsdHZnN0NuRDBz?=
 =?utf-8?B?M0lMZ3V5S2k2bm9XQkZoZUNLamZtdi9ZamFubFlkVmMyZWN4dHR0blRJU2Fv?=
 =?utf-8?B?enR3QzR4OGR1dUZVT3RxYlc2WEsxeGdxUEFTMTIrWUNJSzBndmRnaGRJQXVa?=
 =?utf-8?B?aCsxOExZOUJhZ3dIYkM1VnBEUDhUQXIybzlKOEJGNVRCWCtEeHFNcTV3U1FB?=
 =?utf-8?B?WG85bE9TbjhhK0J1eGZtV2JYK2tPUGh2RUtwY3VRWnFlMFBtQXN0MkdOZHVz?=
 =?utf-8?B?YTEwM0RpRGxPVFptaWFNblhJTVdGYnB6SWJwQWJ3MWtQU2U1ck1kZDhncTdw?=
 =?utf-8?B?NElUMDgxMHlwSnhHYVEvTGwreEhFVjVyTS83aU5WcmhHYTJBRUlBb0c4Rm9a?=
 =?utf-8?B?N3RKNERidlAwMksrcWNWOGxrd2Z5TlBCSDlMMXVmWHZQbkhwUU0xWjBCTUFT?=
 =?utf-8?B?NUtyVjdLaWZieDV6QXdBNm15T3hEYnFIc3pJNTVTOFh5OHFEOG41dFludXN4?=
 =?utf-8?B?R1JXMGU5NHpyRnU1RmtjV2RlOHdpMm01K1lJR2R5Ui9JNVhpS2ptbThyLzU2?=
 =?utf-8?Q?UUl4M8aEEaobtTHTF0aawCs/9YKvhF5mjfSWyVZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c130917-3158-4d4f-02e3-08d95d851590
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 11:34:02.5912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYdblibiNGS7/YzLXA/15nL81MXqVYjatfPKomrEoGbMfEd8HNIHHLeUh5id0AUa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5260
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



On 8/12/2021 1:41 PM, Michel Dänzer wrote:
> On 2021-08-12 7:55 a.m., Koenig, Christian wrote:
>> Hi James,
>>
>> Evan seems to have understood how this all works together.
>>
>> See while any begin/end use critical section is active the work should not be active.
>>
>> When you handle only one ring you can just call cancel in begin use and schedule in end use. But when you have more than one ring you need a lock or counter to prevent concurrent work items to be started.
>>
>> Michelle's idea to use mod_delayed_work is a bad one because it assumes that the delayed work is still running.
> 
> It merely assumes that the work may already have been scheduled before.
> 
> Admittedly, I missed the cancel_delayed_work_sync calls for patch 2. While I think it can still have some effect when there's a single work item for multiple rings, as described by James, it's probably negligible, since presumably the time intervals between ring_begin_use and ring_end_use are normally much shorter than a second.
> 
> So, while patch 2 is at worst a no-op (since mod_delayed_work is the same as schedule_delayed_work if the work hasn't been scheduled yet), I'm fine with dropping it.
> 
> 
>> Something similar applies to the first patch I think,
> 
> There are no cancel work calls in that case, so the commit log is accurate TTBOMK.

Curious -

For patch 1, does it make a difference if any delayed work scheduled is 
cancelled in the else part before proceeding?

} else if (!enable && adev->gfx.gfx_off_state) {
cancel_delayed_work();


Thanks,
Lijo

> 
> I noticed this because current mutter Git main wasn't able to sustain 60 fps on Navi 14 with a simple glxgears -fullscreen. mutter was dropping frames because its CPU work for a frame update occasionally took up to 3 ms, instead of the normal 2-300 microseconds. sysprof showed a lot of cycles spent in the functions which enable/disable GFXOFF in the HW.
> 
> 
>> so when this makes a difference it is actually a bug.
> 
> There was certainly a bug though, which patch 1 fixes. :)
> 
> 
