Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC08B490C6B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 17:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0D710EE75;
	Mon, 17 Jan 2022 16:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CEB10EE73;
 Mon, 17 Jan 2022 16:23:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/PBojwCh2WaGLJJ7sVU6BaAgrK3VNnbZ/V+1oKaaJho1MmshQ7v/y/UL2LA2mXF7NBX+Gb6mMb4mwhTMfPuvgvbrJZoxZVg8BSnxg4+tWfCvlKL3Us1kpPs2LWOKhGrKnszxiXWm9yWRHmDltmvAmjexGmHslJrl02/OMAMA3z1ejB1pxk2cz1zovNjlRQaTRzrv4NK3ofAP7PfelwbE3rmweGHwaXClzYbnVIUL3Pmm+QegHH8Bcmu36M8DsQJ4jv7hpdtuzyse1aCcD8SE7o1fV2vB9+P3H9kqYuFVOJCBt4vhOp5bHbFC/+98xrUCZhZUBSuKe2drJ7EOjSsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3WTjfi4o9uxwAExdQDvVmGPNzeWvmqUkVywP7NgSg4=;
 b=d/kGkK80WzUGlmB0YFKOTibZl1CcJ9x485hz0xwiDXOwQNnkHYWEkmF5p9UDp6B31rYAkb6XYMwM0JrfO2nfUB1LfU5JFuh4HBWPOhlejn/SH/6Am7eKYA60FdfM+udSh/Oi7xGzm0V7kcPONGEx70c4iOa81qdARkbiJzbgA9hFLXFYkO4zreQlS36B1bZWBTvjdeCvl8tyQi1kODqJWvrhzEDbIR/KkX0IHzvtQGUUmIJ9Rl4fCUOaKxJVxNO63pcTxWTTs3XaITw866WqYRQZZKKlV1U4MF6uVdcZN8p2QbTwsVwdPmk7tdEaKnuoYqJhzVVxCDUMXUAWnnfggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3WTjfi4o9uxwAExdQDvVmGPNzeWvmqUkVywP7NgSg4=;
 b=iz2pNTBeBJfGQ+LivVIJLocO3HgKa5wss00Md16+ysJwV3X9BkPGqYNc3RS2aYhr5bzPINjs9D/atEUJghZQbavhOxOWb4pvs87jGM8ushu6wDUNZvn8CLtH1I76CaYdRB8vdj+NwQwRUskBfnG0TJ8EGPcY1+Lm1D99cOw1kmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by DM6PR12MB3771.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 16:23:44 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 16:23:44 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>
References: <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
 <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
 <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
 <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
 <af705589-a601-9774-ec55-d1c244f756a9@amd.com>
 <386142cc-1df5-228c-af24-2187998d9307@amd.com>
 <b80efca2-4a51-7ac9-cc9e-e497ac7c9c7c@amd.com>
 <YeGoVhLgMDOJS15K@phenom.ffwll.local>
 <92f1cc2b-d4db-6c50-d8a3-cdcd31127d15@amd.com>
 <63c48a97-aa76-0a3c-0c68-97de628b864c@amd.com>
 <387a53c6-8ec0-ff6b-aaa2-34398f36a369@gmail.com>
 <0210e651-cc71-c1d2-5166-7473f664f405@amd.com>
 <d0e694a7-4a16-7e9f-7058-beec32ab1717@amd.com>
 <3028607c-59be-6c23-73e2-0136f5d01ce4@amd.com>
 <CAAxE2A5XrPUJD2QJHBcF1Gd5cw6T=EmEEuVvNT3SjasSy9E8yg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b36002e9-a5b6-4ec3-9058-2b1c366ed809@amd.com>
Date: Mon, 17 Jan 2022 17:23:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAAxE2A5XrPUJD2QJHBcF1Gd5cw6T=EmEEuVvNT3SjasSy9E8yg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------413360A7221C1ED43D1FB13A"
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df4c8347-0317-436e-c848-08d9d9d5bb3c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3771:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3771E653A79DD76DD6F59F9583579@DM6PR12MB3771.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: USBmCDmzG8lvgAKPxaubrUwHQ7jjbczlEcppETQ0hk8jBPN+Hf0CphtGuIWARAzoFtGLmiKrDQ9g1BZlHcmrv5BM5TXX11VTXqRshi/LFqILUoHkfVco0PLGHR0vKojA8evlWNuXzieSKTwkSuRiemb2gehEnokVCLIOqCZ3rKF1MkDnLUJOoQ58lTYnZoT4AHMurxVH5SdqWLYUlT9DdAVGeuJE+61GiRLIp+yaF2Ecuj7mh1KJt3oyEOuDbsDKIQWFZBUO2XBkkTAbbBHw+OYFojqbSDsGXwKR1Kt65GUq7LkZeIXDevq8eyyc/vQVatvhHiQ2XsfGGiWwRFC0ZuSLdgoLBp6W4D36KBbD+fUOvWFPpDYeKbXGJ309mGfT0zvWRGmpk4MOvtArMuduvOieMC5juQJANhC+rRvDLGvFx6OOFVQHO2DITJP8ViudCTAD8zYitBiV1cg4vGtk+VEbQOQCREiFLybLziLf+c5kPnmRkDfMuVXwFTntWLfOb7tCrffNUql57Jh8DeicP4XN/F67ItQoc3rzAaOhgDoZZWLc8N/F5hkzvmalNoXJOjRaRu6qA1/ph2V+oA0xPYy+t3RjwgEDn9Dwv3sOm/G0NhlIHnJEQJ81KeTS6PJcJ7jtczaW8+wxGPw6JoCfiIJNKxNc30huHJuxO9X1Iy4rso9tyaLyC4J6hZcHcXGd2eIq14v1x27/htMaxhCkjIZRhAQmBPx4pHxBpt9+fyYlXKkw9I1qpr1lH63HMlEBQf1UwyDE5xit9uS426BEQOMD87omUYqexpujDcj6DmNrDBPgKjfWn5yApfuW/VLw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(316002)(38100700002)(508600001)(2906002)(186003)(45080400002)(54906003)(6512007)(966005)(166002)(66574015)(6486002)(83380400001)(8936002)(6636002)(2616005)(31696002)(31686004)(33964004)(6666004)(5660300002)(66476007)(86362001)(66946007)(4326008)(30864003)(53546011)(66556008)(8676002)(6506007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW1LbERvRytsblBobjRMQm5DanBxZlJnUC95VE1tZHVoZ0R0Yld5YUUxTVJa?=
 =?utf-8?B?aEtTbzZJMm5PL1NzU2FoeTFrblNhS2ticTdGNm9oYkFISWlFYXlyOFVFZ2hj?=
 =?utf-8?B?cHhMNHVDZG81R0pYZWl3R0tvbEdOL29JdTV0SGV6VGw4ZjcxM2tJR0NNcmpG?=
 =?utf-8?B?VnNmYXd0bVl0RU5rL0swemlpb09LYnI2c2tYdythRnJ3THZ1bld3WjNyM3Zu?=
 =?utf-8?B?NDY5Ny9vS2ZjL2dFanpGeWZlaCs2Y1dlcEYyU3BaZzl4Z1NHMk1GbzliTXNH?=
 =?utf-8?B?NU0zd1E5Ky9UbnVBdEIrUU9kYTlHditVR045R203K3libmxwZGRwdEhQWVh3?=
 =?utf-8?B?d0tvS3Nodm9hdmZxenJuYy8wZWI0MXorS3dYRnRWN0VNOFlRSGdvakh3ZEhv?=
 =?utf-8?B?UFphMjVGRGlGMUNXT0hwMHlXY2FVVHEzS0cxM3YxN25mNTFVR05vV29YeHVk?=
 =?utf-8?B?YzRNZ2ZZZllVM3hrRTdCeHdrQmlKUDJKMkFKWFFGeUowNkdBSjFib2RJQ3lD?=
 =?utf-8?B?b0dSdGk3V2dFTWlPWGU0aGZqTXo5bUt0bmNSUXdiKzdwY3B1QS9iamNCak5z?=
 =?utf-8?B?NTlKZ0dya3czQnJhc1BZMFJTcFlpTzl3aWpYS3VCa05KckZPVU05UXdCSjQr?=
 =?utf-8?B?QVBUZituRjRHNmk0TFdoRFBDMFhldmxvRjFnWlIrNlNyNWhmRDkyc0x5S2RO?=
 =?utf-8?B?LzhmUkpDL1RKLzVoMmx4Q2tCSVBORGVWREdsdTdTaEJNU0dwc21yek9yOFhO?=
 =?utf-8?B?dXdpV3Buenp6Nkc2eVFzME02TVRtazdpS0hOblVzS1BXS1ViMmc4ODQrUXdQ?=
 =?utf-8?B?SG5iaGVHY0EvdWlaRFJPRS9vM1cyRXcwYjc4ak96bCtURkNoWEpNclNhWEc0?=
 =?utf-8?B?SXFMZUxzOEg5UU9obFZlcHRmVXMzYkxrNEZKbmR6QUs2czZ3dTFYREIzWmpD?=
 =?utf-8?B?bUdCdFByQ2Irbmd4MkNsSkJCaWptQUlldUV1ZTUrUllramh1d25hOUVOOFhl?=
 =?utf-8?B?YVc2b2xNMTJRVkxBWjFSZ2RQcVhIUmE0Z054cXBvT1FtbHR1UW9ZMG1jWnJX?=
 =?utf-8?B?MzFhRG5vVU1SS2ZuSjhwNW5OMUFFTE84Q3AwYWppKzdKZmpPNUhvQjVPWjZS?=
 =?utf-8?B?eTVZY0J1VUljYWZhUTh0aWxuT3QzMTJJd3o0ZDhXc3NEaFcvWWRVSHVndHpp?=
 =?utf-8?B?NXlEZ053ZGJqU0t1bGxzaVNjbFdDbEkvQTNKK2lCWFBKbmxzNGhRY3p3SlZO?=
 =?utf-8?B?MTVBWnhrTGFzcEhuVkh3WTFkQXVyQXo3K2dlMCtaWVU4Vm5HU0gwbzJ3bzgz?=
 =?utf-8?B?T3FrYlpENzFDQlI2TlY1N3psVDlzNlliSVFIQm45YXZwMDJxeERZaDdZNTVS?=
 =?utf-8?B?NzR5R2lTbnhEOVRaYzRPT1F0RHIwcjFDNXRUOUZMUzlnbEVQbTI2OS9IaWZx?=
 =?utf-8?B?ZGFaeG02SWowMjk0S1RoZ3ZIVy9CUHZQNkM2Rm1UTzR6NkljTmRtSDBvWnRN?=
 =?utf-8?B?Y3paVGJSVzViWU1KN0Y1RXhGWEkyVXBINEhsTkt1WmxTUlRBREp6Z1pBeUxV?=
 =?utf-8?B?RHRlcE1FOWxCejdMR3h6Nlh0Tlo1NHZDVVRBaC9JNGlwM0RCeUw3Z2xJZHBn?=
 =?utf-8?B?VFY4T2o5TXFOdFVZblcyb3FGOWVaTTlpYnBmbW5HMGxiQjloakNpejlFZGt5?=
 =?utf-8?B?TVcyQk5NTmxMU21vTXgzYjBNOTVpYStOWUN2Vmw1bkQ4azh4OGttT21KWFBT?=
 =?utf-8?B?T2FGMHBRUjJsQ1RMcUl1cmR4OWlnOFNOcVFZaXJUVmJ2aVhYSitNV24xYmRQ?=
 =?utf-8?B?VUNWMkpaSWhoY1BKTjBWTnlkYVl1OUtodmw3MURiNGp3VjRjZFdtcGdJcUU1?=
 =?utf-8?B?VjVqS0FIUmRGN0xGRkJoNGdwb2ZBeGhZR3oydHJ6NVpOblFka0poZ1RaMGpN?=
 =?utf-8?B?dk90ZjkxRHFhK203dk52bWdUeHFWM24zWVZKRnBUdmdOR1ZmVTNKZzlNL3lk?=
 =?utf-8?B?MjF1bnhvQWVCWkM3VEZ2dUxSVWoweituTzJhUXpLYnk1MmQ4bS96OHNlb3VR?=
 =?utf-8?B?RHVocVB1UnFoRDJtR2VSUG0xQUk2dTRtZVJ1WHBtdi9QZ2dZaHBySTNyV1BC?=
 =?utf-8?B?Y0RWN3phM1RWWEZmYkVvQ0VwTlJ2SkVyS0dKNlRyQVR1T3Q4MUtEbGhiU2R4?=
 =?utf-8?Q?JbtZSG9oVL/hLCCFWRS0OJQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4c8347-0317-436e-c848-08d9d9d5bb3c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 16:23:44.3938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Z9whucVmTDPONz8Ef3oQao0zBISaxOa9Ok+b9Q6h5GXjhGTFYS1CxApA7qZzw44
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3771
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David Yat Sin <david.yatsin@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Adrian Reber <adrian@lisas.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------413360A7221C1ED43D1FB13A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.01.22 um 15:50 schrieb Marek Olšák:
> I don't think fork() would work with userspace where all buffers are 
> shared. It certainly doesn't work now. The driver needs to be notified 
> that a buffer or texture is shared to ensure data coherency between 
> processes, and the driver must execute decompression and other render 
> passes when a buffer or texture is being shared for the first time. 
> Those aren't called when fork() is called.

Yeah, that's why you can install handlers which run before/after fork() 
is executed. But to summarize it is illegal for OpenGL, so we don't 
really need to worry about it.

For compute there are a couple of use cases though, but even those are 
not real world ones as far as I know.

But see below.

>
> Marek
>
> On Mon, Jan 17, 2022 at 9:34 AM Felix Kuehling <felix.kuehling@amd.com 
> <mailto:felix.kuehling@amd.com>> wrote:
>
>     Am 2022-01-17 um 9:21 a.m. schrieb Christian König:
>     > Am 17.01.22 um 15:17 schrieb Felix Kuehling:
>     >> Am 2022-01-17 um 6:44 a.m. schrieb Christian König:
>     >>> Am 14.01.22 um 18:40 schrieb Felix Kuehling:
>     >>>> Am 2022-01-14 um 12:26 p.m. schrieb Christian König:
>     >>>>> Am 14.01.22 um 17:44 schrieb Daniel Vetter:
>     >>>>>> Top post because I tried to catch up on the entire
>     discussion here.
>     >>>>>>
>     >>>>>> So fundamentally I'm not opposed to just close this fork() hole
>     >>>>>> once and
>     >>>>>> for all. The thing that worries me from a upstream/platform
>     pov is
>     >>>>>> really
>     >>>>>> only if we don't do it consistently across all drivers.
>     >>>>>>
>     >>>>>> So maybe as an idea:
>     >>>>>> - Do the original patch, but not just for ttm but all gem
>     rendernode
>     >>>>>>      drivers at least (or maybe even all gem drivers, no
>     idea), with
>     >>>>>> the
>     >>>>>>      below discussion cleaned up as justification.
>     >>>>> I know of at least one use case which this will break.
>     >>>>>
>     >>>>> A couple of years back we had a discussion on the Mesa
>     mailing list
>     >>>>> because (IIRC) Marek introduced a background thread to push
>     command
>     >>>>> submissions to the kernel.
>     >>>>>
>     >>>>> That broke because some compositor used to initialize OpenGL
>     and then
>     >>>>> do a fork(). This indeed worked previously (no GPUVM at that
>     time),
>     >>>>> but with the addition of the backround thread obviously broke.
>     >>>>>
>     >>>>> The conclusion back then was that the compositor is broken
>     and needs
>     >>>>> fixing, but it still essentially means that there could be
>     people out
>     >>>>> there with really old userspace where this setting would
>     just break
>     >>>>> the desktop.
>     >>>>>
>     >>>>> I'm not really against that change either, but at least in
>     theory we
>     >>>>> could make fork() work perfectly fine even with VMs and
>     background
>     >>>>> threads.
>     >>>> You may regret this if you ever try to build a shared virtual
>     address
>     >>>> space between GPU and CPU. Then you have two processes
>     (parent and
>     >>>> child) sharing the same render context and GPU VM address space.
>     >>>> But the
>     >>>> CPU address spaces are different. You can't maintain
>     consistent shared
>     >>>> virtual address spaces for both processes when the GPU address
>     >>>> space is
>     >>>> shared between them.
>     >>> That's actually not much of a problem.
>     >>>
>     >>> All you need to do is to use pthread_atfork() and do the
>     appropriate
>     >>> action in parent/child to clean up your context:
>     >>> https://man7.org/linux/man-pages/man3/pthread_atfork.3.html
>     <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fman7.org%2Flinux%2Fman-pages%2Fman3%2Fpthread_atfork.3.html&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd917b56904c64bcb501a08d9d9c8c05e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637780278519496422%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=4%2FEATucZoZnlP4t0FI6bYtCdThxC3HTOtkIcTU8G%2FqY%3D&reserved=0>
>     >> Thunk already does that. However, it's not foolproof.
>     pthread_atfork
>     >> hanlders aren't called when the process is forked with a clone
>     call.
>     >
>     > Yeah, but that's perfectly intentional. clone() is usually used to
>     > create threads.
>
>     Clone can be used to create new processes. Maybe not the common
>     use today.
>
>
>     >
>     >>> The rest is just to make sure that all shared and all private
>     data are
>     >>> kept separate all the time. Sharing virtual memory is already
>     done for
>     >>> decades this way, it's just that nobody ever did it with a
>     statefull
>     >>> device like GPUs.
>     >> My concern is not with sharing or not sharing data. It's with
>     sharing
>     >> the address space itself. If you share the render node, you
>     share GPU
>     >> virtual address space. However CPU address space is not shared
>     between
>     >> parent and child. That's a fundamental mismatch between the CPU
>     world
>     >> and current GPU driver implementation.
>     >
>     > Correct, but even that is easily solvable. As I said before you can
>     > hang this state on a VMA and let it be cloned together with the CPU
>     > address space.
>
>     I'm not following. The address space I'm talking about is struct
>     amdgpu_vm. It's associated with the render node file descriptor.
>     Inheriting and using that file descriptor in the child inherits the
>     amdgpu_vm. I don't see how you can hang that state on any one VMA.
>

But you don't really need that. You can bind the VM to your VMA mapping 
and clone that as necessary.

I'm not sure how else I should describe that, as far as I know the 
kernel that would be rather trivial to do.

Cloning all the userspace state like Marek described above is the much 
harder part.

Regards,
Christian.

>
>     To be consistent with the CPU, you'd need to clone the GPU address
>     space
>     (struct amdgpu_vm) in the child process. That means you need a new
>     render node file descriptor that imports all the BOs from the parent
>     address space. It's a bunch of extra work to fork a process, that
>     you're
>     proposing to immediately undo with an atfork handler. So I really
>     don't
>     see the point.
>
>     Regards,
>       Felix
>
>
>     >
>     > Since VMAs are informed about their cloning (in opposite to file
>     > descriptors) it's trivial to even just clone kernel data on
>     first access.
>     >
>     > Regards,
>     > Christian.
>     >
>     >>
>     >> Regards,
>     >>    Felix
>     >>
>     >>
>     >>> Regards,
>     >>> Christian.
>     >>>
>     >>>> Regards,
>     >>>>     Felix
>     >>>>
>     >
>


--------------413360A7221C1ED43D1FB13A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 17.01.22 um 15:50 schrieb Marek Olšák:<br>
    <blockquote type="cite" cite="mid:CAAxE2A5XrPUJD2QJHBcF1Gd5cw6T=EmEEuVvNT3SjasSy9E8yg@mail.gmail.com">
      
      <div dir="ltr">
        <div>I don't think fork() would work with userspace where all
          buffers are shared. It certainly doesn't work now. The driver
          needs to be notified that a buffer or texture is shared to
          ensure data coherency between processes, and the driver must
          execute decompression and other render passes when a buffer or
          texture is being shared for the first time. Those aren't
          called when fork() is called.</div>
      </div>
    </blockquote>
    <br>
    Yeah, that's why you can install handlers which run before/after
    fork() is executed. But to summarize it is illegal for OpenGL, so we
    don't really need to worry about it.<br>
    <br>
    For compute there are a couple of use cases though, but even those
    are not real world ones as far as I know.<br>
    <br>
    But see below.<br>
    <br>
    <blockquote type="cite" cite="mid:CAAxE2A5XrPUJD2QJHBcF1Gd5cw6T=EmEEuVvNT3SjasSy9E8yg@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Marek<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, Jan 17, 2022 at 9:34
          AM Felix Kuehling &lt;<a href="mailto:felix.kuehling@amd.com" moz-do-not-send="true">felix.kuehling@amd.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am
          2022-01-17 um 9:21 a.m. schrieb Christian König:<br>
          &gt; Am 17.01.22 um 15:17 schrieb Felix Kuehling:<br>
          &gt;&gt; Am 2022-01-17 um 6:44 a.m. schrieb Christian König:<br>
          &gt;&gt;&gt; Am 14.01.22 um 18:40 schrieb Felix Kuehling:<br>
          &gt;&gt;&gt;&gt; Am 2022-01-14 um 12:26 p.m. schrieb Christian
          König:<br>
          &gt;&gt;&gt;&gt;&gt; Am 14.01.22 um 17:44 schrieb Daniel
          Vetter:<br>
          &gt;&gt;&gt;&gt;&gt;&gt; Top post because I tried to catch up
          on the entire discussion here.<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; So fundamentally I'm not opposed to
          just close this fork() hole<br>
          &gt;&gt;&gt;&gt;&gt;&gt; once and<br>
          &gt;&gt;&gt;&gt;&gt;&gt; for all. The thing that worries me
          from a upstream/platform pov is<br>
          &gt;&gt;&gt;&gt;&gt;&gt; really<br>
          &gt;&gt;&gt;&gt;&gt;&gt; only if we don't do it consistently
          across all drivers.<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; So maybe as an idea:<br>
          &gt;&gt;&gt;&gt;&gt;&gt; - Do the original patch, but not just
          for ttm but all gem rendernode<br>
          &gt;&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; drivers at least (or maybe even
          all gem drivers, no idea), with<br>
          &gt;&gt;&gt;&gt;&gt;&gt; the<br>
          &gt;&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp; below discussion cleaned up as
          justification.<br>
          &gt;&gt;&gt;&gt;&gt; I know of at least one use case which
          this will break.<br>
          &gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt; A couple of years back we had a
          discussion on the Mesa mailing list<br>
          &gt;&gt;&gt;&gt;&gt; because (IIRC) Marek introduced a
          background thread to push command<br>
          &gt;&gt;&gt;&gt;&gt; submissions to the kernel.<br>
          &gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt; That broke because some compositor used
          to initialize OpenGL and then<br>
          &gt;&gt;&gt;&gt;&gt; do a fork(). This indeed worked
          previously (no GPUVM at that time),<br>
          &gt;&gt;&gt;&gt;&gt; but with the addition of the backround
          thread obviously broke.<br>
          &gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt; The conclusion back then was that the
          compositor is broken and needs<br>
          &gt;&gt;&gt;&gt;&gt; fixing, but it still essentially means
          that there could be people out<br>
          &gt;&gt;&gt;&gt;&gt; there with really old userspace where
          this setting would just break<br>
          &gt;&gt;&gt;&gt;&gt; the desktop.<br>
          &gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt; I'm not really against that change
          either, but at least in theory we<br>
          &gt;&gt;&gt;&gt;&gt; could make fork() work perfectly fine
          even with VMs and background<br>
          &gt;&gt;&gt;&gt;&gt; threads.<br>
          &gt;&gt;&gt;&gt; You may regret this if you ever try to build
          a shared virtual address<br>
          &gt;&gt;&gt;&gt; space between GPU and CPU. Then you have two
          processes (parent and<br>
          &gt;&gt;&gt;&gt; child) sharing the same render context and
          GPU VM address space.<br>
          &gt;&gt;&gt;&gt; But the<br>
          &gt;&gt;&gt;&gt; CPU address spaces are different. You can't
          maintain consistent shared<br>
          &gt;&gt;&gt;&gt; virtual address spaces for both processes
          when the GPU address<br>
          &gt;&gt;&gt;&gt; space is<br>
          &gt;&gt;&gt;&gt; shared between them.<br>
          &gt;&gt;&gt; That's actually not much of a problem.<br>
          &gt;&gt;&gt;<br>
          &gt;&gt;&gt; All you need to do is to use pthread_atfork() and
          do the appropriate<br>
          &gt;&gt;&gt; action in parent/child to clean up your context:<br>
          &gt;&gt;&gt; <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fman7.org%2Flinux%2Fman-pages%2Fman3%2Fpthread_atfork.3.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd917b56904c64bcb501a08d9d9c8c05e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637780278519496422%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=4%2FEATucZoZnlP4t0FI6bYtCdThxC3HTOtkIcTU8G%2FqY%3D&amp;reserved=0" originalsrc="https://man7.org/linux/man-pages/man3/pthread_atfork.3.html" shash="gvfF3OeQh16iGIjvFVC4ZAVhSf1F3gpDT27m7ux9O7pCKsFopM3cySI5ICyOdyFCFV9h1oAeHelitThv2EFXqMtGx0b1fBXcB4k/7E3YOMGF4HX0VI7qYeCs5zP2BJ5oLGiJUCA1vWaj+3XxBDH/vGWUXOWvijvEwDzcVmhCl0U=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://man7.org/linux/man-pages/man3/pthread_atfork.3.html</a><br>
          &gt;&gt; Thunk already does that. However, it's not foolproof.
          pthread_atfork<br>
          &gt;&gt; hanlders aren't called when the process is forked
          with a clone call.<br>
          &gt;<br>
          &gt; Yeah, but that's perfectly intentional. clone() is
          usually used to<br>
          &gt; create threads.<br>
          <br>
          Clone can be used to create new processes. Maybe not the
          common use today.<br>
          <br>
          <br>
          &gt;<br>
          &gt;&gt;&gt; The rest is just to make sure that all shared and
          all private data are<br>
          &gt;&gt;&gt; kept separate all the time. Sharing virtual
          memory is already done for<br>
          &gt;&gt;&gt; decades this way, it's just that nobody ever did
          it with a statefull<br>
          &gt;&gt;&gt; device like GPUs.<br>
          &gt;&gt; My concern is not with sharing or not sharing data.
          It's with sharing<br>
          &gt;&gt; the address space itself. If you share the render
          node, you share GPU<br>
          &gt;&gt; virtual address space. However CPU address space is
          not shared between<br>
          &gt;&gt; parent and child. That's a fundamental mismatch
          between the CPU world<br>
          &gt;&gt; and current GPU driver implementation.<br>
          &gt;<br>
          &gt; Correct, but even that is easily solvable. As I said
          before you can<br>
          &gt; hang this state on a VMA and let it be cloned together
          with the CPU<br>
          &gt; address space.<br>
          <br>
          I'm not following. The address space I'm talking about is
          struct<br>
          amdgpu_vm. It's associated with the render node file
          descriptor.<br>
          Inheriting and using that file descriptor in the child
          inherits the<br>
          amdgpu_vm. I don't see how you can hang that state on any one
          VMA.<br>
        </blockquote>
      </div>
    </blockquote>
    <br>
    But you don't really need that. You can bind the VM to your VMA
    mapping and clone that as necessary.<br>
    <br>
    I'm not sure how else I should describe that, as far as I know the
    kernel that would be rather trivial to do.<br>
    <br>
    Cloning all the userspace state like Marek described above is the
    much harder part.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAAxE2A5XrPUJD2QJHBcF1Gd5cw6T=EmEEuVvNT3SjasSy9E8yg@mail.gmail.com">
      <div class="gmail_quote">
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <br>
          To be consistent with the CPU, you'd need to clone the GPU
          address space<br>
          (struct amdgpu_vm) in the child process. That means you need a
          new<br>
          render node file descriptor that imports all the BOs from the
          parent<br>
          address space. It's a bunch of extra work to fork a process,
          that you're<br>
          proposing to immediately undo with an atfork handler. So I
          really don't<br>
          see the point.<br>
          <br>
          Regards,<br>
          &nbsp; Felix<br>
          <br>
          <br>
          &gt;<br>
          &gt; Since VMAs are informed about their cloning (in opposite
          to file<br>
          &gt; descriptors) it's trivial to even just clone kernel data
          on first access.<br>
          &gt;<br>
          &gt; Regards,<br>
          &gt; Christian.<br>
          &gt;<br>
          &gt;&gt;<br>
          &gt;&gt; Regards,<br>
          &gt;&gt; &nbsp;&nbsp; Felix<br>
          &gt;&gt;<br>
          &gt;&gt;<br>
          &gt;&gt;&gt; Regards,<br>
          &gt;&gt;&gt; Christian.<br>
          &gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt; Regards,<br>
          &gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; Felix<br>
          &gt;&gt;&gt;&gt;<br>
          &gt;<br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------413360A7221C1ED43D1FB13A--
