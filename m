Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA45556EB3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 00:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D72011346F;
	Wed, 22 Jun 2022 22:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158D6113471;
 Wed, 22 Jun 2022 22:56:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcF8Zjo7dNmVPeYwVU7EFxaNhPJwydwl9aSWX5tLPzbl5uEY+hrSDx4vjoxh+I1OLphZCnrhJuQryv0Z23J4RaWWK6ZnxacxK96VdBb0tQdiGt0/iD80c3l/Y9EiEPAcqzTEngLyUGeZx3DyhI6K55+sNuWUeUBDcJtlpt30gpK45OXgg4bdNWon/sPoztAMHKxwBnJQB7pk1JRxzLzVZsHwvlYSo36Gr/0wAgnAR45lKNmLqzu72qViiANIihQruG5Jqou7mtCmphwe3JSIvqSDr9ThfUSLNLFnjOKhyWwSAgTD4Igjq+Y5CrQT5p7sASfaUlJpZWFvqiM+xWtZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rK/RqTN6ketK+Z9m4Xj3pVSYGZ6HN6zch7ONEIQ2iDk=;
 b=Z2gNHtV/oMJINqXWro9HpyoQVxj0OIZ46sZleM4X7U5d+KjA0bBnSQ/IEG5KHif0yaGG5BCFc1He59EhLR/YqNjASFwOB8sWxgo33wWxoXNLAQOCEXmdFSmJSrVdIlgxFFVeA9OYXUdUsCHKpWvNoyGbTYBZuB+6quJ8lyMAd0Exeq0BwUeedlRF6nHTvO7V9yHd3IFEDvmMy1rrgpao3voJ//uMbm5sJ6Pp1yJg/buMDjTF7J/SmOnrZpOlQoCk3xWOphPZG+suGwev17cep0jsotr5vYpRFY/wL9++9JgH/DThai3uOrK6ga/HNdkTnnTS+eQK6YdmodttKhtUYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK/RqTN6ketK+Z9m4Xj3pVSYGZ6HN6zch7ONEIQ2iDk=;
 b=HI+EP77NDDdLdowxKLeZbbwectuJ0KqsLUALRsnE/eLr+ZcjeIcnd964mCta4Hz1AoeU9si/azvSG1efKtx17qHB/sR7trpwltmPjkuObA0VYqF6GtNz/TLt1sQGcHhYRdyldr8877BaK3mdk5Q4Be53EbfI075dxJALCI3Kq/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BN8PR12MB3219.namprd12.prod.outlook.com (2603:10b6:408:9b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 22:55:59 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::85a:3075:1744:8317]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::85a:3075:1744:8317%7]) with mapi id 15.20.5353.020; Wed, 22 Jun 2022
 22:55:59 +0000
Message-ID: <4b49a331-06f7-e875-ed97-c6af7377e629@amd.com>
Date: Wed, 22 Jun 2022 18:55:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC 0/3] drm/amd/display: Introduce KUnit to Display Mode Library
Content-Language: en-US
To: David Gow <davidgow@google.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <maira.canal@usp.br>, Daniel Latypov <dlatypov@google.com>,
 tales.aparecida@gmail.com, andrealmeid@riseup.net, mwen@igalia.com,
 magalilemes00@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 Harry Wentland <harry.wentland@amd.com>
References: <20220608010709.272962-1-maira.canal@usp.br>
 <CABVgOSmesj5MGfQrtdWCgXzm1VXRoG0fAMCbkBCAvtqediqAjQ@mail.gmail.com>
 <8b040fb2-7edd-6fd1-864e-ee04115c5b1d@usp.br>
 <CABVgOSmyUC11fwpsH8Y6a_8hCKphyyZj2uYT+dhuRfHT2uonmA@mail.gmail.com>
 <44745ed7-18ad-ad7c-fef5-2f0f71d289d1@usp.br>
 <CABVgOSk8grWzD2AR3KLOK_CioDu=vy_gOgpofTvp+8PvZSaoRg@mail.gmail.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <CABVgOSk8grWzD2AR3KLOK_CioDu=vy_gOgpofTvp+8PvZSaoRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:610:75::15) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac3ef837-91db-4099-5108-08da54a25f4b
X-MS-TrafficTypeDiagnostic: BN8PR12MB3219:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB32195956764422826860022D98B29@BN8PR12MB3219.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPzpy9yBo2plBBoyYA/SIh5+T3eRrMc2oUyVwyp0UjXtygOCVv0i5Z53jCDOf73QyqIVIswptPbMuoDlEp8tBLpuzDbRyiM6jLdZym1fcancj+sebL+omrXXybujTW8Bf+wTAcX1hQgF3qZlt7i2+S1LFyiozTdgecyZxB437/2GB06g068T7FDm+Fe4qUtf0rRUo4uVfvpUVI0ugWXUcT5M1/nfyPsj+W33O0fgBvIhCWaDuAiTqsHqkwCt3Rymj/o1fYC3hXxBIymk/IcjUNTPjqjACr3K4/Go4i4zpQ9gRT9q5oAUEwomCrmKCg6MH5lmETXCYZiQ5piUR9vuLtzy8sFjEzBfb10z7gi4YHSELV4u6iFKp+N1+qOq0kAnj469pPelJanABWJDxipv1WnsFrc62Ofi600t8D3f+b8kwuO5D/8CqGQjPHXLqZlIKr34dkh7ZcvVYBE1fnYSQ2RPveovJ7OUJlNAr2d7x4g8OmyxsA69lH0vfsUyH1MswmFi43SXtSoArN7zr/svtqCIY4LPsZ9zuZEH/x7PigXosA8g3odaffpCqtB/7Obb0jbYoGs3ph0aENrb9ZFTM43gJd3HLi//1cwSWCkxZv/XBUn3rmzetGq4XBVBd6RRXv7zYdOkWLYQYMjeRZ1Rzu0xGYR01fshs3kBz/eFipkw2OUFAOAZGQ3pJeEvi2duwNnc9NgSRh8R4hP0V+p6SJ/MOfAjkNamPump/nIPw8tNggXKZmsr8jWYQl/GPDKW/encccvn/SRafxlcRaofD1m7wpein1VFXid/dz3BhETsdfVSiY5bNsrwOXq0bQjvX3M2xC2JhWzpUcZvfK88G1638Spe1BnS14BsPWsQjps=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(7416002)(66946007)(8936002)(66476007)(4326008)(2906002)(8676002)(6486002)(41300700001)(5660300002)(2616005)(6666004)(66556008)(36756003)(6636002)(110136005)(31686004)(6506007)(478600001)(316002)(26005)(53546011)(86362001)(6512007)(83380400001)(31696002)(38100700002)(186003)(66574015)(966005)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjIrSGQzQ1ZFOHpFVWoyTEhlUXJVNnllV1kzRGFiR2EzOFd6YVM5R2xrL213?=
 =?utf-8?B?VFkrQlE5T2s3OHYvTVpYdDNxOVdFc1ZUQVphOGVIM3UrWHVLMXBPdjhGaHVV?=
 =?utf-8?B?TU96dnBseTU5a05DeTNVZTNjblRjNU5hZnNPMFkxTmR0NEVUZnc4YjZpYVhi?=
 =?utf-8?B?Y21QUklMS0Jna01lNGluZWJ4SkVOTkNsakI2RjB2a3Q4cUVYNXM3RCtoTDdR?=
 =?utf-8?B?VlJXZzRnL1h5TTQ4UXcyZUYvMFBsUWFxdFdjSm10dGZPMldGamRZeHVJeG5w?=
 =?utf-8?B?ZSt4T0ZISm95eDRaRXJ0RWRrRXlyanlrSUFuVGZwVVRJbUwwS1RqNyt6L1Ur?=
 =?utf-8?B?N0lGZ1JRUFlHdWRXOEI5bFpWVzFITnlBcjNtN0lPb2JMRndqQXQwZ1AvR05E?=
 =?utf-8?B?S3g5em1TQmYrbkdaQ2tveHVZU1NUbUhJbVdsRnFQcThEODdrK3NwRldrVXZM?=
 =?utf-8?B?U2QxQ2I5aFdGQ3F0bzdqR2RGU0tZU3J6d2xxVWNWc3p0Sncvb3VZaW9ETUZx?=
 =?utf-8?B?akoyRFNrckkxbjNaelpLSDd0dW5uM1c2bXBLNWVLQitwVlJVTnM1Y1NlbzJk?=
 =?utf-8?B?NTVKaTc4UnBWaGJiaHliRU1vRVVtc2NXZ3o1a2JUcVVQTTI4Wlc0Ny8ya200?=
 =?utf-8?B?WDhlaHdGQnlWdWhDZm0vdWlGR1IrOVNqN2U4MWRMeEcwaGlhNHlqZ2hMNGI5?=
 =?utf-8?B?SXpFazREWStHK3NyMmZXTzFvWVdwbGwxdW1qUzZaR1JOOE4xeVpMYWg5bVNH?=
 =?utf-8?B?S3BxVzkzV3IwdHUvMXdjRTJaaHJPTXVyZHplc1pYZ2MvcElpR3ZSZUpVQ2Jh?=
 =?utf-8?B?N3NwTFY0UElwd3dkcHRGTUg0a29obTJ1MndKbDNvcGVoTERoallJaTQ4ZWhQ?=
 =?utf-8?B?Z2VpU3ZNZFE1ZzNhbnhCTGcvRkJVMTBrcjMvYldOR0JiaHNGNzk3WWphQ1BT?=
 =?utf-8?B?VjJqMlRra1B1V25DblJzS2hMZG9UTlB0T0Y2a0NvTmVqeWY4UStMRFZDTi9t?=
 =?utf-8?B?OXpxRkZvUGhTQlpNR0w0aU91ZDJMNnZLRk1XUW9wdlMrbW8wQnF4aTFJU1lU?=
 =?utf-8?B?NStSbHdWckxMdko2N2VWRWxnb29iMlp1b1ZLUWZZVHZ5VUtGWjcwOGh3bjFX?=
 =?utf-8?B?SDdMbEIwa3d3d2Y1Q3NrZTJQc2lpdVpRVmV2YVNwN3htak9NSTVlZG5CbFZQ?=
 =?utf-8?B?LzB1OWRFWCtkMFQrZVBMOVZoc3VZT1R1TXhWb2ZvU3Y1RHgyUXVWUWprdWFr?=
 =?utf-8?B?YUF1eDVqdTlQMGF1cmN5RlJWUkpjWm5TdktjbFdmQldHcW1leDhHWldCTk5D?=
 =?utf-8?B?UTZTVnJMdUorUFFrWGNIS3dSempwc0t2QVZEUzRXM1ptdE9lc2VRMkRLK2VY?=
 =?utf-8?B?Um1YTmtKMkI5Z3c0b1hzaXJFdDFTakVWckhNUlJDQm9xT0ZkRVZwVVBxMDhZ?=
 =?utf-8?B?UW00TStna1V5Q1FxZDQ2OHVsNVdqNUFRRzVTcGtJU2JSSTFWOUhnaEdVbTFX?=
 =?utf-8?B?WFRHWjNLZEdlSDFoZnp0VTUwd3pvOGhMc0wydEVITFdHL3h0enM0a1VLK0tQ?=
 =?utf-8?B?clNnM3FML0JHRlpCMnV0QXRkR0NXRXpUVWpxNFJRZ1F6K0Nxa0JXeDVVRzF0?=
 =?utf-8?B?QWR6R3pIT2lseWNUTUwxbEYvUWt4R1RpaHVxbFV6bVhNZ3lJMkdYU3VXempl?=
 =?utf-8?B?Mjh4NUFBS1VzekxRM3Jzc0RFK01IcTNQampJNjE3MWhQQ015SFlVRi94V05N?=
 =?utf-8?B?WEUvVE5PWEJjUGFKaWFLdDN0SGVMOURzMysrUTV4aVdlWEkyaXlLWGZ0R1E2?=
 =?utf-8?B?a1B6aVBYeWhxdUYvQzBVSVlUWkxlN05VZEI1MWpzc0s3U0owNWttcWFXRUsv?=
 =?utf-8?B?ZHMyTW01eXl2VUtEeFZjbjZJVTEyT2U5T1ZqaGhoMERITEhVbll2QmJjaHcx?=
 =?utf-8?B?VWx3U09RajBmdW1sV0d5UVAvQ3ZmUjJwVGhxQXBEOTM2MmZCdVpHNEJGUDdt?=
 =?utf-8?B?dFBXUHM3R1hhcXI4aCtuaTNROU5yRENPU005UC85QkkyWlJpQm90cnF6cERD?=
 =?utf-8?B?ZnFhNTFDUWw3dVdnMDFlbFMwNlpBYld1UXhpUVpjanVIaEdLeS9KK0tSQy9W?=
 =?utf-8?B?anI5NVNFeGRzWGZ0ZEVYeHV2SElEeGtFR2N4azR5Q1ZmV2VYY2dCUkVZZGNL?=
 =?utf-8?B?dWNwUXU0bXBkOGRMbE5FZE83T1UvdGc4UndOeFhvaFp3eXRleGRRelYrOGk0?=
 =?utf-8?B?OTlVRjhSOVdNZjdXTDhHM0Qyd29kZVdNZzVuY1RHdXpYRkUwbmxZeWFrMEtZ?=
 =?utf-8?B?bUV2UjlZd3ExdnNGNU9zR3QvcU85eHIrQVBwTm1TbDRkL3NZMFYvQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3ef837-91db-4099-5108-08da54a25f4b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 22:55:58.8271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDQiv87uxuu6XjetxUiFG5lx0UZF33gv7Dm/C7P2S0J3/PoIg195gSrYr5WuadjPPefUvrfVkMFeiOkPHNo0fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3219
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
Cc: Harrison Chiu <harrison.chiu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Jun Lei <jun.lei@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

First of all, thanks a lot for exploring the introduction of kunit 
inside amdgpu.

See my inline comments

On 2022-06-18 05:08, David Gow wrote:
> On Sat, Jun 18, 2022 at 4:24 AM Maíra Canal <maira.canal@usp.br> wrote:
>>
>> On 6/17/22 04:55, David Gow wrote:
>>> On Fri, Jun 17, 2022 at 6:41 AM Maíra Canal <maira.canal@usp.br> wrote:
>>>>
>>>> Hi David,
>>>>
>>>> Thank you for your feedback!
>>>>
>>>> On 6/16/22 11:39, David Gow wrote:
>>>>> On Wed, Jun 8, 2022 at 9:08 AM Maíra Canal <maira.canal@usp.br> wrote:
>>>>
>>>>>>
>>>>>> As kunit_test_suites() defines itself as an init_module(), it conflicts with
>>>>>> the existing one at amdgpu_drv. So, if we use kunit_test_suites(), we won't
>>>>>> be able to compile the tests as modules and, therefore, won't be able to use
>>>>>> IGT to run the tests. This problem with kunit_test_suites() was already
>>>>>> discussed in the KUnit mailing list, as can be seen in [7].
>>>>>
>>>>> I'm not sure I fully understand why these tests need to be part of the
>>>>> amdgpu module, though admittedly I've not played with IGT much. Would
>>>>> it be possible to compile these tests as separate modules, which could
>>>>> depend on amdgpu (or maybe include the DML stuff directly), and
>>>>> therefore not have this conflict? I definitely was able to get these
>>>>> tests working under kunit_tool (albeit as built-ins) by using
>>>>> kunit_test_suites(). If each suite were built as a separate module (or
>>>>> indeed, even if all the tests were in one module, with one list of
>>>>> suites), then it should be possible to avoid the init_module()
>>>>> conflict. That'd also make it possible to run these tests without
>>>>> actually needing the driver to initialise, which seems like it might
>>>>> require actual hardware(?)

In the Display code for amdgpu, we heavily rely on IGT for automated 
tests. We have some internal CI where we run a large set of IGT tests 
per patch, and I'm sure many other DRM developers also use IGT. In this 
sense, if we can have an interface inside IGT that can easily run those 
kunit tests, we can enable kunit tests in our CI pipeline almost for free :)

We already have a prototype for this sort of integration at:

https://patchwork.freedesktop.org/series/105294/

>>>> Initially, we tried the kunit_test_suites() approach. And it did work pretty well for the kunit_tool (although we didn't test any hardware-specific unit test). But when compiling the test as a module, we would get a linking error, pointing out multiple definitions of 'init_module'/'cleanup_module' at kunit_test_suites().
>>>>
>>>> At this point, we thought about a couple of options to resolve this problem:
>>>> - Add EXPORT_SYMBOL to the functions we would test. But, this doesn't scale pretty well, because it would pollute AMDGPU code as the tests expand.
>>>> - Take the Thunderbolt path and add the tests to the driver stack.
>>>>
>>>> We end up taking the Thunderbolt path as it would be more maintainable.
>>>>
>>>> Compiling the tests as a module is essential to make the tests run at IGT, as IGT essentially loads the module, runs it, and parses the output (a very very simplified explanation of what IGT does). IGT is a very known tool for DRI developers, so we believe that IGT support is crucial for this project.
>>>>
>>>> If you have any other options on how to make the module compilation viable without using the 'thunderbolt'-style, we would be glad to hear your suggestions.
>>>
>>> As you point out, there are really two separate problems with
>>> splitting the tests out totally:
>>> - It's ugly and pollutes the symbol namespace to have EXPORT_SYMBOL()
>>> everywhere.
>>> - It's impossible to have multiple init_module() "calls" in the same module.
>>>
>>> The first of these is, I think, the harder to solve generally. (There
>>> are some ways to mitigate the namespace pollution part of it by either
>>> hiding the EXPORT_SYMBOL() directives behind #ifdef CONFIG_KUNIT or
>>> similar, or by using symbol namespaces:
>>> https://www.kernel.org/doc/html/latest/core-api/symbol-namespaces.html
>>> -- or both -- but they don't solve the issue entirely.)
>>>
>>> That being said, it's as much a matter of taste as anything, so if
>>> keeping things in the amdgpu module works well, don't let me stop you.
>>> Either way should work, and have their own advantages and
>>> disadvantages.

I want to avoid making changes inside the dc code [1] (or keep it 
minimal) for enabling kunit. Aligned with the IGT comment, I'm more 
inclined to a solution where we treat the kunit tests for DML as a 
module. However, I'm not sure yet if it is possible to have something 
like that...

Does it make things easier if we have a single module that handles the 
dml-kunit interface, and we can control which test to invoke via kernel 
parameter?

1. 
https://gitlab.freedesktop.org/agd5f/linux/-/tree/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc

>>> The latter is just a quirk of the current KUnit implementation of
>>> kunit_test_suites(). This multiple-definition issue will go away in
>>> the not-too-distant future.
>>>
>>> So my suggestion here would be to make sure any changes you make to
>>> work around the issue with multiple init_module definitions are easy
>>> to remove. I suspect you could probably significantly simplify the
>>> whole dml_test.{c,h} bit to just directly export the kunit_suites and
>>> maybe throw them all in one array to pass to
>>> __kunit_test_suites_init(). Then, when the improved modules work
>>> lands, they could be deleted entirely and replaced with one or more
>>> calls to kunit_test_suite().
>>>
>>>>>
>>>>> There are two other reasons the 'thunderbolt'-style technique is one
>>>>> we want to avoid:
>>>>> 1. It makes it much more difficult to run tests using kunit_tool and
>>>>> KUnit-based CI tools: these tests would not run automatically, and if
>>>>> they were built-in as-is, they'd need to be
>>>>> 2. We're planning to improve module support to replace the
>>>>> init_module()-based implementation of kunit_test_suites() with one
>>>>> which won't have these conflicts, so the need for this should be
>>>>> short-lived.
>>>>>
>>>>> If you're curious, an early version of the improved module support can
>>>>> be found here, though it's out-of-date enough it won't apply or work
>>>>> as-is:
>>>>> https://lore.kernel.org/all/101d12fc9250b7a445ff50a9e7a25cd74d0e16eb.camel@codeconstruct.com.au/
>>>>>
>>>>> Now, that's unlikely to be ready very soon, but I'd be hesitant to
>>>>> implement too extensive a system for avoiding kunit_test_suites()
>>>>> given at some point it should work and we'll need to migrate back to
>>>>> it.
>>>>
>>>> We hope to see in the near future the improved module support from KUnit as it would make the addition of tests much more simple and clean.
>>>>
>>>> Could you explain more about what is missing to make this improved module support come upstream?
>>>>
>>>
>>> Mostly just time and some other priorities. We've taken another look
>>> at it over the last couple of days, and will try to accelerate getting
>>> it in within the next couple of kernel releases. (Hopefully sooner
>>> rather than later.)
>> Is there anything we can do to make this move faster? As it is our great
>> interest to make this work in KUnit, maybe I, Isabella, Tales, or Magali
>> can start work on this feature. We don´t have much knowledge of the
>> inner workings of KUnit, but if you point out a path, we can try to work
>> on this task.
>>
>> Maybe, could we work in the same way as Jeremy?
> 
> Daniel and I have quickly tidied up and finished the various
> in-progress bits of this and sent it out here:
> https://lore.kernel.org/linux-kselftest/20220618090310.1174932-1-davidgow@google.com/T/
> 
> You should be able to apply that series and then just use
> kunit_test_suites(), which will no-longer conflict with module_init
> functions.
> 
> The most useful thing you could do is to test and/or review it --
> there's almost certainly something I'll have missed.

Nice!

Maira/Magali/Isabela/Tales,

Maybe for the next version, we can use the above patches even if they 
are not in amd-staging-drm-next yet.

Thanks
Siqueira

> Cheers,
> -- David

