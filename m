Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 697DE4D5164
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 20:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F1310E228;
	Thu, 10 Mar 2022 19:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09BC10E274;
 Thu, 10 Mar 2022 19:14:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0bp1bvt2vjbFwXpLAxSQ0i8E+IVVgBAGYL7fR9E3Fze4y6I66u0T1Ql3RqDxM02C1giCUu0hNjHpO86uxe+UbGirQ+QtxJE7IWG35hViU4zRBsyq6U6bvuHHiDWDDO+1hDzIyEsN5++2asce8W+ZjYqCb1W43gr7AKfClxuu4JS5vwYdMPWDNJhYJwfRDlsPVAJw6ikR+FrOI23nTqr51NZXxlofTkdpRlkKfSoA27+N+y1Kv17STpQCf2ykPpngODatquaPEPhZrEihtL7NOcVgHUwxSCdWjl0NxBFDTUXu4Pdp5Wj1zIbsuXVwsLVmP0ATRrkRFBdlCQOOL8dWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMZRFyZzb79OQFEjZLOxpdV9Y36TJ9HrN20/IOaJ+Vc=;
 b=meke6EXpQOuuStcmxf7/wzeYAw+Bgu4zdkeoNmUi7G6pToZnHngSCDe0RyW1atBOdr5EMt3oGOtq88jc04oPdONuP2oBL2DdIUxT2HbzmcmnrqYpqNtqqWIZi/UCeGT/yU2zsNVJghSu2Ny3fkWAxc0P8/jdeesFQunX/0RSJbiGzInd/K4lRkwxDXsK3zoEMEgOzAn12BCVI9uw+iskhiBWAZwYiB3ck1LjqlcUdLsxfWn5qtY+KUpxip7aZJSzm9lmCp4fEemLMGZ+KFUfQWjHaDOUrv2fMRC0QuOi3wcf5yTNBgncoWoCbRYrSFdbbJeJ25yu7SdtYiMJc0bG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMZRFyZzb79OQFEjZLOxpdV9Y36TJ9HrN20/IOaJ+Vc=;
 b=SDMQwZXnY1icIlhtPkUs2HaiLYqB23YGVJylVQ2H/QFc7vLnwHPwYJr991n8qoFIMLO7Tk3iZWEZBal3YeBiiGF1KjFqVg8Q3hLofAjuRj/4906y+6Ke2mi9v+5WPZI/O/gn2rwb8yOEBRl5j8rXL8ffrSoKng+vpVmnlLyWytM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by LV2PR12MB5750.namprd12.prod.outlook.com (2603:10b6:408:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 19:14:14 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a%8]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 19:14:14 +0000
Message-ID: <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
Date: Thu, 10 Mar 2022 20:14:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0101CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::42) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86b19d11-f303-4c05-4c99-08da02ca2a06
X-MS-TrafficTypeDiagnostic: LV2PR12MB5750:EE_
X-Microsoft-Antispam-PRVS: <LV2PR12MB5750ED640DD909CC8815B325F20B9@LV2PR12MB5750.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NarZ1sEaA2BXHAg9+qszP1cULi0x7lbgyYiczEHFsXK7OUE6pekGlMIFzCKrDM2FcKvlGs2MAxASP52nttsDGVkEAfajRORKA24mKdDA52VOEqI+XFMLXMFNxpqGJKwG6mXMUfHA0vL/fQAkOgPWRvEifG9b3b1XYIDkMtXe6jZqsWQCgxzfF//623Ad5pU7W8yU+zDdmbM8K4MpftA+wUeMt8HCR90Yt4TlIqDn/cJuvW9+GbT9g5N2DWP+UXCn61xStr8UZqNzhnIAvf1XzbPRW1mV/Q0iBB0NAi3J1pJ6/ghMTDHk6c6dQpP9cztUdLB6qn5Vw4A+/DkdgOgpqSRTdU3QOEmSxcmI0hkQa641hs1EiWeNrQyvXjF0FuK9ookHMTQd1rPN4x8sIbu9+ts6iOrA34nq0HkweibKf+VS4EXNJEcpScimgfpT28zQnt4B/kdxbbPQWoiBhQ9cgN3nKaifqon0aEUKLbVBBUQ5e1Fd1Cyit8FL6CnmJBLw15BHOjTT1tRfShVs18zIvim8TnRjtC3HzSnhnq0UC9fGRGWZsuIBYsHXUykpYrJXAQuhPqfdinzqK9sGdO4KEADKEkdZ7Fkzb4zWDn37toUx194jE9GI+PcOnxnvQPQAO2fd653/j5PdXLdDNIDc811PmL+8ua1Nt4gCuzgeyos67/d2XD1fEqtjQgtFJCzpObexSt4qvPW7VUzopbtFfyDS91a3MHaNxcVs1O0TRRurc3OGjwRx3Y9AoYBjdNSyxk95aJJaEb48aK/ndo3r6l1LYa2Gc/R9/ds3fx8f/zZlEdfFbt2VIRU4g0OAitFM6xC+GCZWth3Lozm5cJZjuFAwS8Fbuh4KmTEjUozkGsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5040.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(38100700002)(966005)(6486002)(66574015)(2906002)(4326008)(86362001)(66946007)(66556008)(66476007)(36756003)(8676002)(83380400001)(31686004)(45080400002)(8936002)(54906003)(5660300002)(53546011)(508600001)(31696002)(6512007)(6506007)(6666004)(316002)(110136005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE9sdG1mSndyTkRVZnA4MEliWC80MXlUcHZsMXc1UHdxQUUvMDVMOXd0dWVI?=
 =?utf-8?B?Y0lzSDRiNHN3TzhiQzJoTmk0QjdNVGdVUGVNKzFQWTE1Y25Mc1MxeDUzU3F6?=
 =?utf-8?B?RHNVem5QY3V6dC84NllkNGx6MjcrSXdpQnJzbThHM0RNRnV0ZlNNN002UHAw?=
 =?utf-8?B?U1hxamI5eFV4UWN1MHIxTUtWejVwYUMwR2c1WGVkWlphNFljL040NndvTWl3?=
 =?utf-8?B?Ym5LMTVZYXN4VWE3R0RFSURxWWIreGlPMTI0b2I5UDJCU0tNSldIZDZ4Q0hJ?=
 =?utf-8?B?Rmw1N0pEUmN1Y0FXbFg0MG12S0dlRFkvczd4Q0g3WmsxZmdpK0UvUUI0R25I?=
 =?utf-8?B?V2tJQ1N6eWZoYUloc2JpL2ttY2EwNXE3NVRPR0JHWFJWc2phMEt6NCtVZ25N?=
 =?utf-8?B?Z0RRUEpYTGFPN2xjZ2VoM2Q0cnNMMW01dmgwdVI0UlNaY1Z3WS9LTXE3aUw0?=
 =?utf-8?B?SERqMU5YY3pHYTNUbFlKajJDV0RSaVh6RHdINW5PdkZncjlSNk4zRlNQbmN3?=
 =?utf-8?B?T1hNUUJwM1VVNjgxUDV2N1IvMmRVaDEyOWxTSFBoZm5BaW5sT1k0bGNJSmlL?=
 =?utf-8?B?alBvR2libG1vaXk5Q2pFTjdtcXBwRU5RSUxUa05RUUtrZ0J6WWFiaWpIcmJQ?=
 =?utf-8?B?Q2lLNk45ZWJQNkZVUnZCVUZvUFF0am8yYzRqUE9jQ3F4ekZWTmNGd2JxR3FP?=
 =?utf-8?B?Tk41bnc4dnE5L045OVhHNnFrLzJ6SExQeE1EdjZVcnRqR1hBT2U1SmRKSkxU?=
 =?utf-8?B?U3hFTTFKKzlWeUthSk5kSTZKT2dtM2g1WE81MDdCVU9qMXZxSUZCZkRPN1cy?=
 =?utf-8?B?Z2srekNoS0dmbExINWI1b3ZvOWpoaG9ZS0s3Z1JDMFJydjdDK21RME50cDFO?=
 =?utf-8?B?OVQ1U0ZVeGpxdElxMURUUTl1b0I0ajJpVmdIdWJ4bzBqMHB2UDBIS2k1NEtQ?=
 =?utf-8?B?Ti9ibWZWTWNLdW9sNUZUU1k3S3RCV0lkVkNZRGZYQzYvbDlTVXpXTm1EWks4?=
 =?utf-8?B?bTBicjlBNTZza2JtSTIyYW9RWFJMcVI4c0EyTzZyN3BONWxBN1VSQW1MUmh0?=
 =?utf-8?B?S24zZFhsK2cxM2JEc3d5RGMwTEdsNmEwUlRqNU9rL2NmYVNDYWRLZ0hleGgy?=
 =?utf-8?B?ZkhKdDhjVnNxN0krQTJOUnlTL3N3ZmxYY2NMdTZXaUkwM1E1QkpMU1RkV1B6?=
 =?utf-8?B?ZkNuSFBuRHkxSjJGNGJWRzBVSFJZZHg5QmczSm94VnVOTzBGME5vRGxsR3ds?=
 =?utf-8?B?Y0s3UjA5RXFvWmttREJZOW9XcUZGVVV6SDJ1Q0h6STRERndrSlMraGNuRWR6?=
 =?utf-8?B?M1U2NWZHRGM0OEQ0MnhrSWVNTTFwR2dneE44bmlCelkrOUhFWWkvUGd3MzZu?=
 =?utf-8?B?ejlObzFWWFB5bm5ZUm5Zbm1tYTJUbGF0VWdSRXZYZTlKaGlRZEo5ZmVTOTdh?=
 =?utf-8?B?bkp5T244UDlmMW9SREY5Mmt2aWZDSXpHNWxCMGV6L0tUSE9XRWlmVFV0Umpm?=
 =?utf-8?B?NGFuYTlWbG5FdkdzaFJZTStCaVBPSUNZcm5jYzQ1V0ZPMEVQQ0NnUkFoaXIv?=
 =?utf-8?B?SFFmbzJidDcvajA4RWl3Z2hvMlhJUkdKelFsRThNWDU2MWJXTVluSHh4TTZJ?=
 =?utf-8?B?YzVLd2NoKzg3dG5BeERuM2wwK2ZBR1dLNnlnc2FFOERlQ1k1RllvbjZhMW5n?=
 =?utf-8?B?azJxSHQ0V3Nod3MrVkY3WEd4eWtSMGdZUjMvU09tSk5DL2U0aGlucTIxcmFh?=
 =?utf-8?B?VldqN0tZN09CcUxhejBxL3ByaVZEcktxRDRvY1VRdVRVSzNYdlo1em5Ud3BH?=
 =?utf-8?B?RHB4ckRaRXRycDErbnZFcTRhaVcxaXkzaVh2TE9kMG5ac3hURnovclV0Y0pC?=
 =?utf-8?B?TTFTa1RNNmdhNDBvSmphQXFrcFBONUdQT2ZaNEpOWlZoTzNVU0NScDlkcm02?=
 =?utf-8?Q?6l8GjTPtLGP9rZ2+IJIZKLQbbMX+D/vf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b19d11-f303-4c05-4c99-08da02ca2a06
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 19:14:14.1970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yglQOIOuwmiPPpklgY7XbHkdSUQA38+USCkRMKaZGCxBSTRJ+/6kJ19H1P55eJBz31qN3bw+tAaECyj0idc6Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5750
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/10/2022 7:33 PM, Abhinav Kumar wrote:
> 
> 
> On 3/10/2022 9:40 AM, Rob Clark wrote:
>> On Thu, Mar 10, 2022 at 9:19 AM Sharma, Shashank
>> <shashank.sharma@amd.com> wrote:
>>>
>>>
>>>
>>> On 3/10/2022 6:10 PM, Rob Clark wrote:
>>>> On Thu, Mar 10, 2022 at 8:21 AM Sharma, Shashank
>>>> <shashank.sharma@amd.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 3/10/2022 4:24 PM, Rob Clark wrote:
>>>>>> On Thu, Mar 10, 2022 at 1:55 AM Christian König
>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Am 09.03.22 um 19:12 schrieb Rob Clark:
>>>>>>>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
>>>>>>>> <contactshashanksharma@gmail.com> wrote:
>>>>>>>>> From: Shashank Sharma <shashank.sharma@amd.com>
>>>>>>>>>
>>>>>>>>> This patch adds a new sysfs event, which will indicate
>>>>>>>>> the userland about a GPU reset, and can also provide
>>>>>>>>> some information like:
>>>>>>>>> - process ID of the process involved with the GPU reset
>>>>>>>>> - process name of the involved process
>>>>>>>>> - the GPU status info (using flags)
>>>>>>>>>
>>>>>>>>> This patch also introduces the first flag of the flags
>>>>>>>>> bitmap, which can be appended as and when required.
>>>>>>>> Why invent something new, rather than using the already existing 
>>>>>>>> devcoredump?
>>>>>>>
>>>>>>> Yeah, that's a really valid question.
>>>>>>>
>>>>>>>> I don't think we need (or should encourage/allow) something drm
>>>>>>>> specific when there is already an existing solution used by both 
>>>>>>>> drm
>>>>>>>> and non-drm drivers.  Userspace should not have to learn to support
>>>>>>>> yet another mechanism to do the same thing.
>>>>>>>
>>>>>>> Question is how is userspace notified about new available core 
>>>>>>> dumps?
>>>>>>
>>>>>> I haven't looked into it too closely, as the CrOS userspace
>>>>>> crash-reporter already had support for devcoredump, so it "just
>>>>>> worked" out of the box[1].  I believe a udev event is what triggers
>>>>>> the crash-reporter to go read the devcore dump out of sysfs.
>>>>>
>>>>> I had a quick look at the devcoredump code, and it doesn't look like
>>>>> that is sending an event to the user, so we still need an event to
>>>>> indicate a GPU reset.
>>>>
>>>> There definitely is an event to userspace, I suspect somewhere down
>>>> the device_add() path?
>>>>
>>>
>>> Let me check that out as well, hope that is not due to a driver-private
>>> event for GPU reset, coz I think I have seen some of those in a few DRM
>>> drivers.
>>>
>>
>> Definitely no driver private event for drm/msm .. I haven't dug
>> through it all but this is the collector for devcoredump, triggered
>> somehow via udev.  Most likely from event triggered by device_add()
>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fchromium.googlesource.com%2Fchromiumos%2Fplatform2%2F%2B%2FHEAD%2Fcrash-reporter%2Fudev_collector.cc&amp;data=04%7C01%7Cshashank.sharma%40amd.com%7C86146416b717420501fc08da02c4785b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637825340130157925%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=LncI%2F5mIpeG1Avj2YXLmbZ5f1ONUfpf6TzJZH3%2Fs8%2Fw%3D&amp;reserved=0 
>>
> 
> Yes, that is correct. the uevent for devcoredump is from device_add()
> 
Yes, I could confirm in the code that device_add() sends a uevent.

kobject_uevent(&dev->kobj, KOBJ_ADD);

I was trying to map the ChromiumOs's udev event rules with the event 
being sent from device_add(), what I could see is there is only one udev 
rule for any DRM subsystem events in ChromiumOs's 99-crash-reporter.rules:

ACTION=="change", SUBSYSTEM=="drm", KERNEL=="card0", ENV{ERROR}=="1", \
   RUN+="/sbin/crash_reporter 
--udev=KERNEL=card0:SUBSYSTEM=drm:ACTION=change"

Can someone confirm that this is the rule which gets triggered when a 
devcoredump is generated ? I could not find an ERROR=1 string in the 
env[] while sending this event from dev_add();

- Shashank

> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Fdrivers%2Fbase%2Fcore.c%23L3340&amp;data=04%7C01%7Cshashank.sharma%40amd.com%7C86146416b717420501fc08da02c4785b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637825340130157925%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=5HyWYZ5ZWYz4mUPWeTW51QFdoY0NlA50Nbj1dAC6os4%3D&amp;reserved=0 
> 
> 
>>
>> BR,
>> -R
