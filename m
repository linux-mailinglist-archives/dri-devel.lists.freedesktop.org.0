Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 039154D52FC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 21:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF7010ED23;
	Thu, 10 Mar 2022 20:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2075.outbound.protection.outlook.com [40.107.102.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEFB10ED22;
 Thu, 10 Mar 2022 20:17:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY4lPwgYMP5P22qkciGVRgillB6a1NaKuUhE7hp39LiaAS+scAWdJhgx1Ji3hWSXS9bKdiDbLJl+0De60BEeYKQQJgNdW/3D6oHswYUZkL/csHEguJ3YKTtG1T4DwPSjYosLifDgYyQ7UM4oppRjLWfPLgc6EMI1bLhRN60CcPoemPe25Khm52P8M58KUGiA6VnmeGV8yzzVoJwFbV6wPgdNFcQeDnWIgPhjG6qImhD46PbQEjvGXXiJ+n5XouJPtAC+pLoHi7bLbH+a7coiDpH/+KggrjcS/XT8Kb8Avsg0FN0FDdygk+Dz1Jns0DkBSbVdhKmEkVE/UXGJWth3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZJmiq6d3yoq9sguAlWEqVVwagc8xLikWzmHunA5RLs=;
 b=Gl5LryRDq0BW2vq9lg0AdvaoKKpMnt9Ih+lTh6NrGYCNbgGjq8R5A0oob9wXsRHm05vUowLHn0m0oPYXYdfEUwf5DlDXNEME3B3aIpGBBfE9xsmvifJZsQgxPBi4NFSLeJyxk33LI1DpgWa1vK0t/7plx0qwjVJtamWZtPb3ncFoH6hPvDg7erkUZ/N4z8xgG0/4l+U5B4IhVdwvhLxHElucUK2Lmx59dgPwLxWS88Sk/ssrITeAoFgyVA2NXmzLGB+9ZT5gkdZ1WROjKbSO5uWc3oftUsywItOXdZAv6WdamRBl0LnR36BI7aCFy+lC/5B2Ba97k59Mkrd2/eio+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZJmiq6d3yoq9sguAlWEqVVwagc8xLikWzmHunA5RLs=;
 b=caSH35hDMiSA7CXQWbkR/Pj3IWoTdUtN7B1+jpPJMTah5iYwW+yrkoAbAJnfZ+fUxJBgZvxfA5sN8Y6Rgy9rWfqb0dC9V7EhewzmzQf4yUuRClJEZUAGwzidVL9f6H9epujQAsUjde7NBKrK3YR/clIZwQ3B1zek41d1j48evsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MN2PR12MB4847.namprd12.prod.outlook.com (2603:10b6:208:1ba::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 20:17:18 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a%8]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 20:17:18 +0000
Message-ID: <15407342-d1ab-6e86-1c29-1114967d9349@amd.com>
Date: Thu, 10 Mar 2022 21:17:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0105.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::46) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 297223a3-3658-4903-6783-08da02d2f965
X-MS-TrafficTypeDiagnostic: MN2PR12MB4847:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB48473F61FEE0F17A860FEBA5F20B9@MN2PR12MB4847.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6SeGU1FW+Eh28heToyKIFbHZfH3Q1yF8AUZaqHx/+nblSSSRDOxNxe9bQB06re6y05+oiw2rk04kj5JN7kjcqHQDmfllIdmtQmRYS6eG1kpxpWC/uipMtYBMSxlVpaF/6bOKK6SbfYPStZAgnHYVHkyFIvja/cwnOC/oOaf4r6iU2vuPTCsoMksc60m8z+6bFmt0zbhrsM85QuUE+b0LZL0+rzW3FWHK/rjNyjgGZ0yARXM0UP/FNrHBxXzO69RabJraqWPSwThH0UV4eAQD2CdMIb5ioKpQhVcLOhHZ4a1I1MlrrNxloSjhOHr6eb2ZoBHQKqSi5xaIXJdVg0qcjDLW6ucQJ1wh6itpDvF9IL3YoulNtMMiJ+ZzapFTbj6zmTWNhrLpR3GZc0A48V/VVPw0MgiAOHxJYlGZz6Pm13+WiX25YYBBqK79MxmodJuDSB5nhJi3pb+Gk1y9ZQP6L620vNzf9UlgrkxU97nxfySU7cEfb45XmhlcjCNaq6nV5vhNc+UulNev8cdhROsZRxot0eRscHdO/cSxfr4xsbMZc2mu532LZD+ncjAg63iO15CnxwJIVAuoiTFJgG+/o/7LmMbjYDzRWg0zxzZ0B/WfsmQExOEKU2Hh2Iygf7tRv+RjnQ9gjd8DMMVpf2lPORFBxefOq31kInxQtilR5/1Fg5rcHxJIIfIhSBJzyW9T1UWtLD38pOSJh+/qti6WFSsPoB5+ySjO+MNklDmZkmj4flcezetNq4FqjB7g73RshNkKVJYA+gR8KuP2facwfEU6XZHk7DbW/4AtgA63N4uI27kicYPtwpvW6BdGVDCb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5040.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(86362001)(966005)(2616005)(26005)(186003)(66946007)(66574015)(45080400002)(6506007)(31686004)(83380400001)(36756003)(53546011)(31696002)(54906003)(6916009)(316002)(66476007)(6666004)(66556008)(2906002)(508600001)(38100700002)(5660300002)(8676002)(4326008)(8936002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU5xa2I4NlZ4VU5sczlxZm13SzBlQ2doWmNuMzhVMzFxcGl5UVJXZlV4VWpO?=
 =?utf-8?B?WXMycDFRZWErRnoxMzBDZjh6UHNtV3BGNDU5bHNORzUxSGs2NVFlc0QrQ0tH?=
 =?utf-8?B?V2Z5bVpMMnJZV2ozdWw2dHhmVE13V3V1VGhUN21weDQ4Nk1WWGZlc2JETHpw?=
 =?utf-8?B?andVc3l1dFVYeWUrVFpwLytycEowTG95TCtuQjlSTDhleDVmYkhHK3M0Zyta?=
 =?utf-8?B?Z2hweFBUV1JNUk40MEVjS1UvMGxhU2JFZjVrMUhxWXNHaTVSaENmekUxT21j?=
 =?utf-8?B?a2Fma2xPK2ZDUEFOUFc5Y2NYSGIxZkNqR05WWkZqbXdVR0ZZZXpjTzJLZUNT?=
 =?utf-8?B?Vklpb0NrSGltQXM1RVJ0SE1wckE5VGpGQ1RWd3FtbE1HazFBT293MkRIalE3?=
 =?utf-8?B?N1hJUDl4ZzNYYWNlSGk0NzlIV3VYR2hxTE9EMUVXd21QK0NMeE5seWMxejk3?=
 =?utf-8?B?a0RVOUFldENHNHlqWUluSzYvdGx6UDk1UXJyYi93Y1FBWVE0bkZFRG13Ykl5?=
 =?utf-8?B?Um9VNHlJVlF6MXIrWTBSMGladklkM0V4SVJtOHh2UEZOdVZPUGhRUk4ycVBY?=
 =?utf-8?B?VnRlS3pPM0krYmkyOS9nTVljS1lDMHYyelgyQXJhbjhWRG03MVgwbHhHUThq?=
 =?utf-8?B?MVE3R0ZpQnJ2b1dDTmRpcEFlOE15QWJSdkFyckNnVU4ydTJmWFhvVE0yNENM?=
 =?utf-8?B?YXRtZlBEKzNzNlRxejlKN3c4MXRUZTBJa2tCckZyVnVoZmFFVDdZR3dBYUcv?=
 =?utf-8?B?RXJaU01qZmx1RHpkb0h0SUl1Z1Eyb3gvR1NIN1QraXlSNWlzSmh6bklMOEhU?=
 =?utf-8?B?bEEzQ2RVZ1lybndYV0dTWUxmYzJMaTlEamI4VlJEL0NUNk9yeWVCak1aOCta?=
 =?utf-8?B?MmExb2RGa1VYVHRZdzArazFDOXNhVDVtUUhUSTFLYnphTWtISTNDNnE2eHhS?=
 =?utf-8?B?d2tpa0pTRXVNME5VNXhhVDFlSi92Y1JIY0J3ejVFK3BCWVJJUTYrM2YxVVJU?=
 =?utf-8?B?S3dOcE9VZk1JUzYxaW1ZRXVSb3VnaEhYWkhnM0NWMG9vZEx2L2UweDllNGk2?=
 =?utf-8?B?czZsSm9HYnExeGhQRG9BMVR3MTJNeWY4bmVadXlLazlEZFZKNDl6RnVqNnhV?=
 =?utf-8?B?aUxBMDMyanFRUS9FQ2Uxc0Fnem95UGRlMzMxejNlZGNBSEpWZUsrejdpa1Zq?=
 =?utf-8?B?T0FuODhFdWpUM0xhVXlONEJ4dkIrTUVNNEY0alQ5bk5Ca3dJNzNHYlBIUldN?=
 =?utf-8?B?WTN5YVZiNFNlVnNKczE5R2FjbHpZOWpRY1F4R0V2ZG1UZTVLeWIwQ3duWTF2?=
 =?utf-8?B?NDc1dVZNa2d5MG44aVVoRXRlQkxhZXdZQThWZ3RHVTZmOUVMaWxLRXBkUGww?=
 =?utf-8?B?Z3hmSEIwK1N1R0VQdXhhTU5lYmQ0OXczWFM1NDFhUjdQVGdnMkhTMENRRDhz?=
 =?utf-8?B?WkVCcjJZYkJ3d2p3MnlDQ20zNUc3bTR3cjlNdWRGM0g0NWVUZUprNWxyM2Zr?=
 =?utf-8?B?bTlaWGE1Zmp1cnVJNCtyMXE1SzBPRFM0dkxPUFplSmlRVHV2ZnJSMXRQMm9u?=
 =?utf-8?B?V1RQelZ1SE5CdHdhVy90d2xON0c0ck9kNFVCa3Zjd2hWTzhVVHRndHNnK3Nm?=
 =?utf-8?B?dXRwVEFBKytQVGh5cUdBR284Si9ZazU0VmxWLzROOTVTd3pFL2Y5Qzk3aXBP?=
 =?utf-8?B?L1dpZWdYOEROUFF0UWFFTG5vbmxCbWUyZ3pRWVovMmZFYTdUd3kzZ044U3BI?=
 =?utf-8?B?QXQyNlVjbjd3YjA0VEU0RE1FSnFGdEVFQ25keExUaVZPdnVVTDBYcGZsRFFk?=
 =?utf-8?B?dkRMUWlzZGJvOHIyT0R3WGs1MXdaRlhWUFdTMlZ6UDBlLzR1RmxxSDZUT0F4?=
 =?utf-8?B?M2QrZEEyUEovSXRhSWdNOXdhLzl3QS8zY0xRRzljRmxYZ2VxSkhaeWZMNnRM?=
 =?utf-8?Q?jUUXjrjp5SoDtx1JEO9DgGb5ROsdqixq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297223a3-3658-4903-6783-08da02d2f965
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 20:17:17.9406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GV82iLj6BCGHFpsNl3xTVoqTNZ6eyuTPcys/PAodDZ6Cqf6rLajftjlWsADDJ2TS84tK8cPjOCLpjjDvf/aFMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4847
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/10/2022 8:56 PM, Rob Clark wrote:
> On Thu, Mar 10, 2022 at 11:44 AM Sharma, Shashank
> <shashank.sharma@amd.com> wrote:
>>
>>
>>
>> On 3/10/2022 8:35 PM, Rob Clark wrote:
>>> On Thu, Mar 10, 2022 at 11:14 AM Sharma, Shashank
>>> <shashank.sharma@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 3/10/2022 7:33 PM, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 3/10/2022 9:40 AM, Rob Clark wrote:
>>>>>> On Thu, Mar 10, 2022 at 9:19 AM Sharma, Shashank
>>>>>> <shashank.sharma@amd.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 3/10/2022 6:10 PM, Rob Clark wrote:
>>>>>>>> On Thu, Mar 10, 2022 at 8:21 AM Sharma, Shashank
>>>>>>>> <shashank.sharma@amd.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 3/10/2022 4:24 PM, Rob Clark wrote:
>>>>>>>>>> On Thu, Mar 10, 2022 at 1:55 AM Christian König
>>>>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Am 09.03.22 um 19:12 schrieb Rob Clark:
>>>>>>>>>>>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
>>>>>>>>>>>> <contactshashanksharma@gmail.com> wrote:
>>>>>>>>>>>>> From: Shashank Sharma <shashank.sharma@amd.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>> This patch adds a new sysfs event, which will indicate
>>>>>>>>>>>>> the userland about a GPU reset, and can also provide
>>>>>>>>>>>>> some information like:
>>>>>>>>>>>>> - process ID of the process involved with the GPU reset
>>>>>>>>>>>>> - process name of the involved process
>>>>>>>>>>>>> - the GPU status info (using flags)
>>>>>>>>>>>>>
>>>>>>>>>>>>> This patch also introduces the first flag of the flags
>>>>>>>>>>>>> bitmap, which can be appended as and when required.
>>>>>>>>>>>> Why invent something new, rather than using the already existing
>>>>>>>>>>>> devcoredump?
>>>>>>>>>>>
>>>>>>>>>>> Yeah, that's a really valid question.
>>>>>>>>>>>
>>>>>>>>>>>> I don't think we need (or should encourage/allow) something drm
>>>>>>>>>>>> specific when there is already an existing solution used by both
>>>>>>>>>>>> drm
>>>>>>>>>>>> and non-drm drivers.  Userspace should not have to learn to support
>>>>>>>>>>>> yet another mechanism to do the same thing.
>>>>>>>>>>>
>>>>>>>>>>> Question is how is userspace notified about new available core
>>>>>>>>>>> dumps?
>>>>>>>>>>
>>>>>>>>>> I haven't looked into it too closely, as the CrOS userspace
>>>>>>>>>> crash-reporter already had support for devcoredump, so it "just
>>>>>>>>>> worked" out of the box[1].  I believe a udev event is what triggers
>>>>>>>>>> the crash-reporter to go read the devcore dump out of sysfs.
>>>>>>>>>
>>>>>>>>> I had a quick look at the devcoredump code, and it doesn't look like
>>>>>>>>> that is sending an event to the user, so we still need an event to
>>>>>>>>> indicate a GPU reset.
>>>>>>>>
>>>>>>>> There definitely is an event to userspace, I suspect somewhere down
>>>>>>>> the device_add() path?
>>>>>>>>
>>>>>>>
>>>>>>> Let me check that out as well, hope that is not due to a driver-private
>>>>>>> event for GPU reset, coz I think I have seen some of those in a few DRM
>>>>>>> drivers.
>>>>>>>
>>>>>>
>>>>>> Definitely no driver private event for drm/msm .. I haven't dug
>>>>>> through it all but this is the collector for devcoredump, triggered
>>>>>> somehow via udev.  Most likely from event triggered by device_add()
>>>>>>
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fchromium.googlesource.com%2Fchromiumos%2Fplatform2%2F%2B%2FHEAD%2Fcrash-reporter%2Fudev_collector.cc&amp;data=04%7C01%7Cshashank.sharma%40amd.com%7C3b5c0e8744234962061d08da02d00248%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637825389694363926%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=mWI1Z%2B8eMJApePc5ajRipbGUG9Cw9wXf2FCw6NQxVaM%3D&amp;reserved=0
>>>>>>
>>>>>
>>>>> Yes, that is correct. the uevent for devcoredump is from device_add()
>>>>>
>>>> Yes, I could confirm in the code that device_add() sends a uevent.
>>>>
>>>> kobject_uevent(&dev->kobj, KOBJ_ADD);
>>>>
>>>> I was trying to map the ChromiumOs's udev event rules with the event
>>>> being sent from device_add(), what I could see is there is only one udev
>>>> rule for any DRM subsystem events in ChromiumOs's 99-crash-reporter.rules:
>>>>
>>>> ACTION=="change", SUBSYSTEM=="drm", KERNEL=="card0", ENV{ERROR}=="1", \
>>>>      RUN+="/sbin/crash_reporter
>>>> --udev=KERNEL=card0:SUBSYSTEM=drm:ACTION=change"
>>>>
>>>> Can someone confirm that this is the rule which gets triggered when a
>>>> devcoredump is generated ? I could not find an ERROR=1 string in the
>>>> env[] while sending this event from dev_add();
>>>
>>> I think it is actually this rule:
>>>
>>> ACTION=="add", SUBSYSTEM=="devcoredump", \
>>>     RUN+="/sbin/crash_reporter
>>> --udev=SUBSYSTEM=devcoredump:ACTION=add:KERNEL_NUMBER=%n"
>>>
>>> It is something non-drm specific because it supports devcore dumps
>>> from non drm drivers.  I know at least some of the wifi and remoteproc
>>> drivers use it.
>>>
>>
>> Ah, this seems like a problem for me. I understand it will work for a
>> reset/recovery app well, but if a DRM client (like a compositor), who
>> wants to listen only to DRM events (like a GPU reset), wouldn't this
>> create a lot of noise for it ? Like every time any subsystem produces
>> this coredump, there will be a change in devcoresump subsystem, and the
>> client will have to parse the core file, and then will have to decide if
>> it wants to react to this, or ignore.
>>
>> Wouldn't a GPU reset event, specific to DRM subsystem server better in
>> such case ?
>>
> 
> So, I suppose there are two different use-cases.. for something like
> distro which has generic crash telemetry (ie. when users opt in to
> automated crash reporting), and in general for debugging gpu crashes,
> you want devcoredump, preferably with plenty of information about gpu
> state, etc, so you actually have a chance of debugging problems you
> can't necessarily reproduce locally.  Note also that mesa CI has some
> limited support for collecting devcore dumps if a CI run triggers a
> GPU fault.
> 
> For something like just notifying a compositor that a gpu crash
> happened, perhaps drm_event is more suitable.  See
> virtio_gpu_fence_event_create() for an example of adding new event
> types.  Although maybe you want it to be an event which is not device
> specific.  This isn't so much of a debugging use-case as simply
> notification.

Exactly, in fact that should have been a part of my cover-letter. May be 
I will send a V2 with better doc.

- Shashank

> 
> BR,
> -R
