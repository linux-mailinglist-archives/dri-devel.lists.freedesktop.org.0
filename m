Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9AD4DC338
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 10:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D89510E5AB;
	Thu, 17 Mar 2022 09:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2BD10E167;
 Thu, 17 Mar 2022 09:46:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7IMVBvp/DIWyh1br/dReDMvK1r9t7X4ZKBp9sLREdBY1NLdXRaUvROntZwpUeTeyyQWDVUx1pCQwuQLM1P1f38YoiwJDLWsdpDTWJkZH5PlzLhZbKzRobmVf1cOsqIR25lkTN7dSCfOJ+8eD8N+whYgPdvnKEF4PXU5TYOK9eGbuOfWRGyEG9d6xOcZAJu8vKVI5beXoWAiz20Eh4bQ1Qzc4OMSbSzayXfZeQ1vJ9mhF9VO6DEqnAPqotESb0c4noMTbW6pXqwBIbhH527GxH1q0L3O7yqIOviFjCt8Cwn6msx/LM0r87iprTYe5LknunmNm43gOqMBrrpuC5NQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cD8vVCuHPo11404EeNHwUE4M/VHOAZcOtqyzzJDHtIU=;
 b=ZocNNe5AppaVG7PGjJUzT7RL/+zZPHsofQGeDItjKzWwkLmsy/JzzfBWL+pP4fo2XLzNXvckkV+vqzHHkWFHnB/RTEywBRVZcAYP4tEltYknPldP8+7qrbKGyUtqDQnz/j8VzM2iwlYt9ldcO09ipSNuxaNp8rxIXpOQ3wZKhK6K25ui55FO5wWcSTDepp2M1Z+u8Jdq9cw4ki9+TqXqxrC0kIgKvBAhepax4LXI7qKzRduUAoC/pFuf2DvF36izBERdBo3ny+j4vVW15w7XBe1h9XXsxVpxeJhQjTf9EiegDPReiGcyisDKe4/IYdORTbCvatW74ZWOGHU74uIJzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cD8vVCuHPo11404EeNHwUE4M/VHOAZcOtqyzzJDHtIU=;
 b=cFapjBJ74LBNygF23V+6ZXx4v67ukhcEq8rKxAzuHkuVjk98cTUFcEtWbeGI4TxBJOlllKqRIFzaKeTPh8wWp9davXkYmlfp+puH8ve5r+zhxlfp9g4O9tMAPPckKa4n3F1UJTYD4qrh264Hf68qVLQbIP/7Xo7wvkpd7OcTKP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4578.namprd12.prod.outlook.com (2603:10b6:5:2a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 09:46:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 09:46:33 +0000
Message-ID: <303f0fda-485c-2f0b-4ae2-d0e5a7c349c1@amd.com>
Date: Thu, 17 Mar 2022 10:46:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YjL/k6kh+5RihGIV@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P251CA0016.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71c980be-4030-4baf-a2e0-08da07fb0579
X-MS-TrafficTypeDiagnostic: DM6PR12MB4578:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4578CBA878F3AFF4F1E12A6583129@DM6PR12MB4578.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8iIWTiqRShwMHbakNMLaW6OR8axyreaPbtP3XaA22Ul1szPfFKfAPu9OPrPPw9IHDKFb9x4S9fQzG+yDgBzfI69q6LiPfV19xX8P5+sxfHQAQxs1IRATlwKUQDJA46vqQCyEopE9xBkvyzU4OBH+xxL728Kq9DzYP0hAJE+ePy7wvrKE52SjorGGnUjIGuVL/1pO6Wr2nAIht0mnvf3vRyLraXPRBGUVjr9isroXxOp05EkkqOd1yiHRq3717qiEk2uMjXmKKj8HPtpfvtTQDFkZYO28OI2nVeTpiSEOakKnyITT64xcCuBajnUIwbIabJ4l/mNenEtm8qDn2KlaObcAO4OhqYq1z8cbROsfzxTRFSLXaPjK0DFP23nm5qRsL1abJIXfsfWg9N/vdH/1e5p9Z7oRqgkX0SNmsPSYWMpsyU6q3Med/ecb69hiJRK0uLohKAFjoKbWbtYFItYk5rZ4QvTvSoOyG9KInCv0PUT2XafWSX4OPHRnqvJuT+Gj03FbSooc0/TRLHws/AMLdmDG+9DP9nFI4NlfrhxI7vJaH/cYS5YrgglnUo8U2uL3n/Ls5JOg+KxMt4Q9/vtIohKzoI1SV0/8tIiQ//jEHGbkyRcYF93dJm9vYn0jsWdgdmEndqqU5rjxxaqjTox+/NgUDWlH9Va9pXSZ1qNpa1bDFYnmPJZ8xE2YkYIHQ0utQnT9uJ/hFKNz48KzjBjbS4/UgsORajKob5qXISZnJkxX0jeeJoJGQLdAMLb2UHVs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6506007)(6512007)(38100700002)(31686004)(316002)(6666004)(5660300002)(2616005)(8936002)(66476007)(66946007)(66556008)(8676002)(4326008)(26005)(186003)(54906003)(110136005)(66574015)(508600001)(31696002)(6486002)(86362001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXZ1REd0NlU1NnYzbStNQXJ2MnJYMlMyOHoxdzJDRWtpSDcxTjZOb3lNdmxu?=
 =?utf-8?B?bHdBU29JWStpYS90MGZCRlZJNnRhRGpNdUF2UDFURVZGeHFpR1hEQjZsTk8v?=
 =?utf-8?B?RG9QcUIwUXAyNzcwa0pnRmxzcmpjb0E1RzJ2UWFEWVNTUXV4WFVObVN5akZR?=
 =?utf-8?B?aVE5MEhPcWFDYjdiWEljWUU0YTEwR0xaYjRQSmF4cE84R2FPSFg2VXl0b3lC?=
 =?utf-8?B?VUxXQUp3cVFTeFRUcloxdVkrTUZRQ0VDczNrNXJnaE1xTGdnR3AzSEhxQUFi?=
 =?utf-8?B?amsyRkFFaUl4dW5HR2JWaWtPWFdHOWhnYXNCS2lBcWpTZ1ljZmt5bE1BLzF3?=
 =?utf-8?B?VEphSGtJQU53QUhpeUhaanBpOUE5bXAydHZHWG1uYjhVdDVKSUR0UzJSSmY1?=
 =?utf-8?B?MGNEN2JUMXJZbnZPTEZkWmFxYzNqOFJIcm1WSkFqNHg3cWdUMnZKeDUvbTQx?=
 =?utf-8?B?Z1dBQ3oyNzhiQnUvMU1kMVFYNDJJa0hmcERBSmtUb0ZLamZBNllyZENqRTNV?=
 =?utf-8?B?Zmk2MFh5M2NRbDZna1BjNTAvNkpOYngzcFNTd1M4bU1TQ1BsZndaTVMyejMz?=
 =?utf-8?B?VHR4NW90SW95eTZlVmhjVldHdjBuRXI1SzNqK0dCMDBiZG1mNW9ZNGRQSzRM?=
 =?utf-8?B?c09PV3JDOTNMaWJmZ0xITzlZdkQ2WU56Tll6OHoyMml1Q1c4b0ppaWtOV2pt?=
 =?utf-8?B?a2szRkxVRG9HUnU3Sm1TNWlSaERPQlhIbDB3dEJLSkZqandCcGcwMHREMnVw?=
 =?utf-8?B?aU9vbFBMMkJFR0pJMXB1RGgra2Z2eFVUbEFvWE1uTDhiakxJRVFMTW5jMDkr?=
 =?utf-8?B?WDBteDhFOTFOdGhEbVY5Unl5UU1BT2RKT0IrMGQ2M3d3YlcxTGowU3cvRnBL?=
 =?utf-8?B?Y0hnYXVnWUpjYXRLRC9Dd3ZSRTFwUGhLZDcvZHc0S3IrdXdNcFdFaklIR2l2?=
 =?utf-8?B?UWptUGV4ZmFvY2s4Q2dRQk01RjU0VVQvMWpmc0FFR01rNy9rcld5bzFYcFln?=
 =?utf-8?B?Wm9yNkorOUVVMklPZEthSC9VQWN0S2lpbnBqbkZTYUlnVlFHSUoxUnVzRFZq?=
 =?utf-8?B?Wms4Y2RFay91alljREtKTXRiMXhaMHpGYyszdjR2Qkl2MnNvbFRjenFoclgx?=
 =?utf-8?B?L0ZoWXpzdGRvMWdnR0FxVVNoYTVKc3hGcHM2UEprN1FOTjUrZjdlbWp5WHNV?=
 =?utf-8?B?cGsrUFZxMnpNUFZrZU5acDJKQ2o0VmZIVzd6M1B0RDF3N29QL08xb0t6TzhE?=
 =?utf-8?B?ajRmRE5tRzltUUwxVklQMFZmUTJId2NZUWRRN3NrME1yelBKQXhjNFFoZ3VS?=
 =?utf-8?B?TzZ1aU15R2FxMEpqTno3N2NlbktyaFM5R3M3TmlZM291b21FVCtFajJiYkpM?=
 =?utf-8?B?R3FVRlkrSEhwclZ2NXpvWW5iQVNyTDFtNXVGTDI3V0Vqd0wwT054OE5HOHJj?=
 =?utf-8?B?enJkL2F0K0pTSlNqY3lEaGVMenIwdUlLRUxLTTBxNjVtcis2UGhWamJxZmto?=
 =?utf-8?B?ZFFSV3k5VWxXWDVweWN2QXN5NmF0RGx5dTRvQjM2MmZOWEk1MlQvQ0dGNlVG?=
 =?utf-8?B?Zy80aC9ySU8xT2tLYjJXay8zaXM1cWVkalYrZi8wVnhIVGNJWExnaUpaZzF1?=
 =?utf-8?B?Vi9ES2UyMDI3VlhQZ0FKdHNaK1pHTnJnb0ttT09CTks3Y0NlemxSVXJ2bVMz?=
 =?utf-8?B?WllRZy9rOE1halFFTXk2VEtOMncwVGhQQ1lBbGtBT1JVeHhpM2NwT21Bbm4z?=
 =?utf-8?B?VHA1YnpsSEUxeDVxZ2VrSGQ0cmJrSUVlTldFbFcza3RscnFPTCtFczI4dHhn?=
 =?utf-8?B?dlBUWUF0UEg0RnFCVGd6ek5pV2MrZW0vaGszZWk0QVlTWVhCb2NvTnJMQWpj?=
 =?utf-8?B?OFMvZGhzQjQrNUJubDIrN3FxR292RUxNd2I3WDZScnVieUZEVGNoTy9LaTEx?=
 =?utf-8?Q?nB4aeyagGeBtN7IVfivq7lVkG1V1THo8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c980be-4030-4baf-a2e0-08da07fb0579
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 09:46:33.9202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7NyrTLp26epiFUEanBETdvHUVbYcdDRZ9MZtV5MbGEClnzoQ5AVjK+538t6HPQy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4578
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <contactshashanksharma@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.03.22 um 10:29 schrieb Daniel Vetter:
> On Thu, Mar 17, 2022 at 08:03:27AM +0100, Christian König wrote:
>> Am 16.03.22 um 16:36 schrieb Rob Clark:
>>> [SNIP]
>>> just one point of clarification.. in the msm and i915 case it is
>>> purely for debugging and telemetry (ie. sending crash logs back to
>>> distro for analysis if user has crash reporting enabled).. it isn't
>>> used for triggering any action like killing app or compositor.
>> By the way, how does msm it's memory management for the devcoredumps?
> GFP_NORECLAIM all the way. It's purely best effort.

Ok, good to know that it's as simple as that.

> Note that the fancy new plan for i915 discrete gpu is to only support gpu
> crash dumps on non-recoverable gpu contexts, i.e. those that do not
> continue to the next batch when something bad happens.

> This is what vk wants

That's exactly what I'm telling an internal team for a couple of years 
now as well. Good to know that this is not that totally crazy.

>   and also what iris now uses (we do context recovery in userspace in
> all cases), and non-recoverable contexts greatly simplify the crash dump
> gather: Only thing you need to gather is the register state from hw
> (before you reset it), all the batchbuffer bo and indirect state bo (in
> i915 you can mark which bo to capture in the CS ioctl) can be captured in
> a worker later on. Which for non-recoverable context is no issue, since
> subsequent batchbuffers won't trample over any of these things.
>
> And that way you can record the crashdump (or at least the big pieces like
> all the indirect state stuff) with GFP_KERNEL.

Interesting idea, so basically we only do the state we need to reset 
initially and grab a reference on the killed application to gather the 
rest before we clean them up.

Going to keep that in mind as well.

Thanks,
Christian.

>
> msm probably gets it wrong since embedded drivers have much less shrinker
> and generally no mmu notifiers going on :-)
>
>> I mean it is strictly forbidden to allocate any memory in the GPU reset
>> path.
>>
>>> I would however *strongly* recommend devcoredump support in other GPU
>>> drivers (i915's thing pre-dates devcoredump by a lot).. I've used it
>>> to debug and fix a couple obscure issues that I was not able to
>>> reproduce by myself.
>> Yes, completely agree as well.
> +1
>
> Cheers, Daniel

