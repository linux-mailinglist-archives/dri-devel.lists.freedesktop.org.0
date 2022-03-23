Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B03B74E5530
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1F210E6F9;
	Wed, 23 Mar 2022 15:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE6A10E6FF;
 Wed, 23 Mar 2022 15:25:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ein6M/UCFQK/3mawpcgQu5abSeVbWL2ooAp8ITLuhs4cvIFl+sQpBsJxVX9R/t0d2nbCxTlguOlzhbIKUwbCwgnFpzv7h4M+2RRbFMYzyEB1yFvhaXD91SU+ZjNdWlUdK7CWqnsTdpKnEM++pc0k6ovLkgxJjGN/AXKBl2GevQGIMh5wJVZt5s+r6Q52sK3qFcFbPAT3Kdm/LZG5teHDw7agmXo1xcCzhOKBKon5bpMGKkldrKJs7nlbGpJ+7zqHt+JxHYVlBkxv2m01y+jiLIiyVefNyFh/XQik/OlrjZggLS4Nje10lMTMznwVy4BAhIMRYs30FT7OyYjqKH0trQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFLIVYxasJqPPPFg/JtmWmjVPVGB8tEZ+ruG+f6LlZ0=;
 b=TEbGRnwvul1Ut70QgfQVVxBcIIlSXwRUynyE4Pi9wOtB90Ws4pMIBlOOXcHrH5qa2KzdfjSz2kn2KpsTlVrvJwA/lV9jWrRT9YfIR9dBNzFakCAG+1mKcadXp6klIDe/nq4jx7zh4u1E/CXQE1ZorQVyWPXVyiZS6Rq9qAjg8ynZJs9lB21PGvHUpCcoBzDL3zLa1WZxW40uLl1h0P0uS4Gd5Lmpy8uGFwWudZHycYh13RyROq3VVolM69KvpFOhmaQK/rWVVqcl/nV50qRgk3OJZM0M0dW0YLG2bGCT++eaIH8x3L/5rtBP0sKdMBdbNXHuvQYI262m1flmOMPsVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFLIVYxasJqPPPFg/JtmWmjVPVGB8tEZ+ruG+f6LlZ0=;
 b=AO8pW87eZcLy9EP0ekTEshmha15oYXPX0Ci0rhDljha9h8VgjtkHpcSDQncNbVMyVzhjehwPpWhEOzC4tgHTCplHpwzl5sgbbf+1CHusEmkSgeTttvvBz15imqx+v2NRSSaP+OwP7MlwAx/opnO3MK4lbUf7PdpMEJ8TpjmnFGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DM5PR12MB2439.namprd12.prod.outlook.com (2603:10b6:4:b4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 15:25:10 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::54ea:af56:9e64:7e51]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::54ea:af56:9e64:7e51%7]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 15:25:10 +0000
Message-ID: <5e7d4b55-99ca-5fa4-2995-5e42d0a29473@amd.com>
Date: Wed, 23 Mar 2022 16:25:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>,
 "Olsak, Marek" <Marek.Olsak@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
References: <20220311102709.225616cf@eldfell> <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
 <YjNvYmcuDKiIneDx@phenom.ffwll.local>
 <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
 <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
 <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
 <3f0b7273-4562-7a55-e52a-bd64334886fd@amd.com>
 <CAF6AEGu6FabmcWE+NsPgnPU0=MpbA6bmO1KkJ2hrVDBLFY92xA@mail.gmail.com>
 <CAPj87rOx1uogqqKX8XZEnzpcKKY6W9TWHQFr-bgZyEU0-ftjVw@mail.gmail.com>
 <CAKMK7uFMmLLRQeONDOMpOg12p7moyrC-+hxVEqpa4hSFopbGtA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uFMmLLRQeONDOMpOg12p7moyrC-+hxVEqpa4hSFopbGtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70349d43-3823-4b7a-7b00-08da0ce15183
X-MS-TrafficTypeDiagnostic: DM5PR12MB2439:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2439747C82334B80BC18FADD83189@DM5PR12MB2439.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gFcM+0xvPiEfrU/rEjwqkUAgn4tbAS3TiTzi6Va7hstIWvnuL1FClolpxeO6WQYuyeF/lg1F3pF2PmMu+39fePTOZpsJVaJP327lCIpcccnaiPk1JMRWUa3Ez7VeswZLkEqAnvgn8xwHklQBWxb3tYJKH1+fMO0ixVAo97l+gSrtUN+xqqqzIabozWrpcMSV8GJpQK2kFHxpdlcjW4Ojj/Oi8mdWQw3cfAFONLwilU0rkiec6SEo7W+e0uumbpijj+aORSgWN35437F8z+9Kn/Fr5IjhZqbZLNdeesLVXYxHBxCqzSpQaf7dEszRkj9GE/NTOADsmOIyNECzp0vAHw6G2EoxjOvbKUO5fCzhkzAQhnC4g39srdTtTfZhzU4U8H7URBbUNkYiOAn4L3BC0YnQ/PbT/bV3vliRt0xGZibIEXYjqhVo8jOlGXQqtV4fNfa3eerRQ8xdZbEIu7CbloY/DVTxxw0lceb+1CqU1ndBnbQOwslpJFFytdV+SCjZ8VDi5w+TzOgtx1k3qvGmaTH9NourisJlwkgRXy6OCDl9yCkF275asxEYg6Z9hkHpanB710roQX0bUtvb3WKuBe0aRhe+fNRvh7kf/Bg6KZY3c01fBypy+fOJVQa6DRPRgOnCALMNoXPYpP5SuPnsjQDPjbHYRpLkqNndjayMyyg46CbKfqt8XNmiBYo2vFPPcpxlMPbNzs7my8K2hWSPdafCpcCJbJmolcRNVHibAJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(316002)(66574015)(6486002)(4326008)(31696002)(31686004)(508600001)(54906003)(6636002)(66476007)(110136005)(66556008)(83380400001)(66946007)(186003)(2616005)(38100700002)(53546011)(6506007)(8936002)(86362001)(36756003)(2906002)(6666004)(5660300002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3Vzc2xmQ3NjMVVNd3BNa2NhMzJwMitidkxUS3FXb2RGamVySGluQWQ3Tkg2?=
 =?utf-8?B?ZDU5RDRuNWcrdXplalRlVnhQODdna3gxQTlNSzA4MklHY3VVUmpVUlk5YTVH?=
 =?utf-8?B?WGhhcmxPTXN4ZzZxNlRXcXhSWE5wdGZoRmljV29mLzFKd1RlQk9sQ0d0dVUx?=
 =?utf-8?B?WGxreVFpQllaeXphZEdlcnpkSkVLYzF5djl0YTM1SUVpdFBvZVhvMnhLWmEx?=
 =?utf-8?B?c21OemE5Wjd2TllXU2hQUjhTQ1RIWXRQSkk4enJwR1MxZlBRSkdhQ0t2aWU4?=
 =?utf-8?B?aW8xaWdSNy9rbUtyNE51MW4xK1VBUU4yOFBOc2Z2eDVXeW5keWREdVF0V3lW?=
 =?utf-8?B?dkVPTlE2WDNwTkI0KzVxMmNQUndaNW5WZ0JMTVFGL1JUS3IyNE5CdWpNcHU5?=
 =?utf-8?B?S1U3bVlwRDd5RkpCYzlDS0ZsOGZtTUhMTE43b2tEZi9Md3VuamxzVWIrSXJh?=
 =?utf-8?B?dHo4WlhRTkFjMEhhVUE5OFhTTEthbHNXQ2VaYWpPNDVqNVVwOU16aTNGM0xI?=
 =?utf-8?B?Ym0vUzlXdXB5OXFjLzcvMUtSeWxXZHVXdWNoaXBXOEk1K1VLTnh0Q09hc0FM?=
 =?utf-8?B?SWM0N3NTVGhGanlJSkFucEhpTldtVEoyNkUycHVodUlKYlZQZVZPV2dHOWI0?=
 =?utf-8?B?bjFUVVBJb1Y3ZWZUZ3M2NzUvK2ljQWZ5aS8rb0VyM2dPem9iMHVCNVJXVkhM?=
 =?utf-8?B?VW9oakNIZE5BTDI4eTVFUHZydWtvUWVYQkhZSTB1bkFjUnA1cmIxTmdzcWZE?=
 =?utf-8?B?QW1GWVVmWGlURUtacEY5STJiTTBwRERzb05Zb29Ra3hqeGVQNnluMktCQjVs?=
 =?utf-8?B?VkdERTNwSWtJcjhvbmdWV09kVzFRREpMdFZSNXFtYkErT0xEV2Nvd0QycHdo?=
 =?utf-8?B?Z3J0YjJKSUl3QzRuZUZSNlJtQXpodnZpRDNwcElKa0VQL2VEUThpM2Y2TkdR?=
 =?utf-8?B?VGUzU3Nma1FXZ2tneGM1ZGx1YUdjQkQyaStjU1lSN0tYdmozL3Y4amovWFRq?=
 =?utf-8?B?RW50aXpaekQraC9xTDBkTyt4UDVUYTRZaHB1RjRWNmpKdGpCOU1KVllCMFBT?=
 =?utf-8?B?Y3hyMktkb0VZcC9jQndZL3VGbkNZdnhvWVZsTkFLZ3R3djE0NmMreFJ3K1lq?=
 =?utf-8?B?Vis2NXZjSUxTSHZsYXZoYW0yL2c1Rlc3QW9tdHJkMXM4aTdrNmNPT3hPeGZF?=
 =?utf-8?B?NDZFNEcxM3lTNVNzK0trZ3gzRnBCRGpmeDNEMVNnaWZhUFltYU5iQjVhUWUy?=
 =?utf-8?B?Z2x6TFBKRTlKZjhEc3cvTDl6bkZWYWFTRmwwbysvbCt1YTVqSllMUlVNRzJw?=
 =?utf-8?B?TmtNYW9hd0Zpb0VZaG4xSVcyaFZWWjd0cVdtbXp6RHI3RDRsT2hsWTUvM1hu?=
 =?utf-8?B?eGlWL282Nm84blhoc1F3M3h5T1l1d2NyckNzMlFOQW13R0N2Y2ttdWZiNytC?=
 =?utf-8?B?eVU1enBGbkVoNW5FSG1Za1RvVzNGTEFoeFVsMXh6TVd2Unk0RDVRMUw2VGcx?=
 =?utf-8?B?VVMzWEdkZExHaTIzZTJTYmJUd2tNREFleEhWWDV0TlBocy9VeThDbW8rcHJi?=
 =?utf-8?B?NXpKZEJwckJpWkZxdkJ6Vm92L1I1bncwZDh3QkI2UTB1dDI1cjA3alYvK1Bs?=
 =?utf-8?B?QWJpczJENkVTdmdJazhCUjV3YTlLZjg3Y3c1aTdkai9UUEFsVk1NMUtKZFZB?=
 =?utf-8?B?NTgwUGsyWDF0b2piOFJ3K0dZVW9hL1Q5TElUaEFDVXZkaU1KWmRrdnV4K09r?=
 =?utf-8?B?UnorRk1rZ2VVSUMrTTBNVFFBTGZvUXBWTFdBTzIvdmpLU0ZEb1Zodit1UXVi?=
 =?utf-8?B?bzZNUE9BZXBVeEZaMXpiTGpOdmc4RUFURkM2OE1ydjQwVWYzTTVMTElHZG52?=
 =?utf-8?B?am8wU1Q1NExMKzZtZUVKQjhTZWZBeVN2STE0Y0pwYU5tTllkZElYeVZJZUtt?=
 =?utf-8?B?YWoxYXV4MmVhWUtaNHdzdFpaWlNpT0hoVldzdGQ2TFRCVTRVdndaUU9UMi9z?=
 =?utf-8?B?UTFXWlZQcVlmRXk2OFAxWmF0eC9RaThxOGJGckFVWEQzQTBqUHIyVFF0T3RW?=
 =?utf-8?Q?5Dk3gL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70349d43-3823-4b7a-7b00-08da0ce15183
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 15:25:10.4842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ukoy8awaaSu5try6DwY0e7GZEUFBxwUzLtGq/yQ/+EM69txRotuv+bGOmmIzPpay
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2439
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
 Shashank" <Shashank.Sharma@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Adding Marek and Andrey as well]

Am 23.03.22 um 16:14 schrieb Daniel Vetter:
> On Wed, 23 Mar 2022 at 15:07, Daniel Stone <daniel@fooishbar.org> wrote:
>> Hi,
>>
>> On Mon, 21 Mar 2022 at 16:02, Rob Clark <robdclark@gmail.com> wrote:
>>> On Mon, Mar 21, 2022 at 2:30 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Well you can, it just means that their contexts are lost as well.
>>> Which is rather inconvenient when deqp-egl reset tests, for example,
>>> take down your compositor ;-)
>> Yeah. Or anything WebGL.
>>
>> System-wide collateral damage is definitely a non-starter. If that
>> means that the userspace driver has to do what iris does and ensure
>> everything's recreated and resubmitted, that works too, just as long
>> as the response to 'my adblocker didn't detect a crypto miner ad'  is
>> something better than 'shoot the entire user session'.
> Not sure where that idea came from, I thought at least I made it clear
> that legacy gl _has_ to recover. It's only vk and arb_robustness gl
> which should die without recovery attempt.
>
> The entire discussion here is who should be responsible for replay and
> at least if you can decide the uapi, then punting that entirely to
> userspace is a good approach.

Yes, completely agree. We have the approach of re-submitting things in 
the kernel and that failed quite miserable.

In other words currently a GPU reset has something like a 99% chance to 
get down your whole desktop.

Daniel can you briefly explain what exactly iris does when a lost 
context is detected without gl robustness?

It sounds like you guys got that working quite well.

Thanks,
Christian.

>
> Ofc it'd be nice if the collateral damage is limited, i.e. requests
> not currently on the gpu, or on different engines and all that
> shouldn't be nuked, if possible.
>
> Also ofc since msm uapi is that the kernel tries to recover there's
> not much we can do there, contexts cannot be shot. But still trying to
> replay them as much as possible feels a bit like overkill.
> -Daniel
>
>> Cheers,
>> Daniel
>
>

