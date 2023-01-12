Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42969666C36
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 09:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C230C10E88D;
	Thu, 12 Jan 2023 08:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0EB10E88D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 08:17:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHV1vpGkZa9GYnVJhkgpwvt5TD70KPg07ZB4C0gt3ncuU+Qps67J5RhuWsnhq9PQNdjyaR20e9beTGD9vz0J2n6HVZ0UehFxP/GC0EEDO8QPL7giiVKeuIpbJ/yNwGtbOZ76APTAHGCH6XZc8zL7xB4T24L1zeio8kYEtf+89scHFiSltP4LXYqZb2EdY9tr/AiMTfYYhvDfGqJPNuqkiJo6Lws2K2fWyZhM9d3MlHF1wUjxeyAUVrHCzJ2q13hxWiSlirssLZGQkrXSpPecnu8hjD/zIGa3ZkItZ4XKD1th21heJe+A9TMZVzWuVJTjvVPLvWVFIVJnwo7Do/L2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhpZ6TmtUE/4qtDH4tuv1gmdSIFfJVCkGumJ+omqkEQ=;
 b=DbFVEDDvWP4eAprTpiFazKdKCm/7DbAYB0JAMGIicXZ/pSz5QbBZM9NwhyTT83HWLPIAWAhcpxxl3jqCovTVL4MqTaSUekzKIOYO09EsasH2QTfccI8Zxfs4cNLL6OzZUAzuWUOaXLCxocseFA0qbTMXeVwPE0ACs4NUrn43GtIK9STRuFaf8lwB5WRr29bIMTfq93edC/Zj44z1DvJVLN7Wn3efWSt3d7B26L8WeqpH0XSDMdfzhiCLzPFzW9HspjQS1leiun3HjUROPU3mSOfmKe7xRK1F1MaX+FyrpCycNKqxvjkvGvOVv4EqhduuHeGzYGhljwY+jGIKIu0mkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhpZ6TmtUE/4qtDH4tuv1gmdSIFfJVCkGumJ+omqkEQ=;
 b=rbV7JbG+YtA0jU1tnlzDCnp6b4kM8kHW6DMywXCC5+xAgbJdC03e0d2lfVKX1ULBpEc67EbskjTu31VKSUmZ2H2HEj5p4KS4pDEsyPG9AJV9Gl2KjRfOLuEEswv3B1L8wzl10SU/B2WmE8tbRIpUQ3t0ABfLjJld3pJnGouvMSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4296.namprd12.prod.outlook.com (2603:10b6:610:af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 08:17:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 08:17:32 +0000
Message-ID: <2df3c97f-9e54-e743-a29f-f20f5461c851@amd.com>
Date: Thu, 12 Jan 2023 09:17:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/4] Track exported dma-buffers with memcg
Content-Language: en-US
To: Shakeel Butt <shakeelb@google.com>, "T.J. Mercier" <tjmercier@google.com>
References: <20230109213809.418135-1-tjmercier@google.com>
 <CALvZod4ru7F38tAO-gM9ZFKaEhS0w3KqFbPwhwcTvgJs4xMUow@mail.gmail.com>
 <Y78+rfzXPq5XGs9O@phenom.ffwll.local>
 <CABdmKX0TAv=iRz0s+F6dVVX=xsK00BeUPkRM4bnsfemDAY9U4w@mail.gmail.com>
 <20230112081337.fxgnhdk44mxu26et@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230112081337.fxgnhdk44mxu26et@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4296:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4d5930-d6f8-4c08-992b-08daf4757411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xm7yPWzQLZGzmC6sVqwvO7+qAxlA61VClD/CI+xqIwjQi6bSObX4dWU16JV/WRntLVb7GkZYtNuYpsTzdX+bkE6MRplB5z84veWuXZK8+Rsi+GIRZgwKM8zrps/mcJbol6gTYRBRnPZdd9TEoieDrjbCy2FMNKhz5iboRwhZGZDgecZ0UPVpgJcOyeUZ7vvfaJLbwjYyx67xOW0V0Z82iyFP3XU0GnU2M+bIGWGnUBB73MzNo92CjncSYuCBFW3DZMPfkdfvnju8PuV5XkK+DFWNVOlK+ArX5SIXrvMqoyRrxjkAPVvAi7kRWLi/n8eoBjMkrVbh/3LMyLwb38CG+2i0VLx3/TtlyQ9GY/6oO1QJbsoisnSRzPwG2ySb75RECsA2I4zT2n1j3xmHU1C0CTU0HXTlUsZk5CVFFJSjXPibKFhlln8m8wPtFV84VxM7MB7vdQuPbQKYgxNz2VWwiE5Aa1srnzeaWYX5ezWsn7cmnIAmaFaB1AnD8ZYs80M3+60cH8rxH2R/k1d0zM3U8fOlDAgCKIJsZU8UFxXOL0ZNhjxy7wbdORD0nlEus1XShpsS8Afb/MKgbr8zTtZ8+h8seVfiqYGS6tCCry6BnIip22Q3/M3+/bglw3lRk/t8JT43UhclaWmoRgvKf+5PGvf+I2bWbbbC2QPZB/i5saoAQlrwXBDj7B9i0xe9/sdRLNh9snaDOZr36bsCQRawbmSE/0Icmvy+BV2oI6ZLRKQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199015)(8936002)(5660300002)(7416002)(7406005)(41300700001)(38100700002)(36756003)(2906002)(31696002)(86362001)(6486002)(478600001)(31686004)(26005)(186003)(6512007)(6506007)(8676002)(4326008)(66476007)(66946007)(66556008)(316002)(110136005)(2616005)(54906003)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUo0VHB5ZnpTZUtxV2dndEROdVNuYUtvckkwVzRVckpvNUpHR2lQaStUd051?=
 =?utf-8?B?RzFEK0wyUFQvbGR2bFJHWGVRL3ZhUlAxbDREbWJzWUp3RHhrSC9WL0hsdG1W?=
 =?utf-8?B?N0dzODFlN3VoS2w2RnBIVnJmRFlSV2g3UGNVMVRJNkFIUzcwcHpCQzdxMENR?=
 =?utf-8?B?U0xNOFMrTnNqWm1GbVlxNVA2dm1DQjY1Qm8wQkNSOGdGUHhJUG5hbFd5OWdX?=
 =?utf-8?B?S2xVZCtBYXNiVFFlUEFXV0dzZVZrd0wzbktiNUhrRFlqZ3JvZ2V5VXB5L3dV?=
 =?utf-8?B?Sk1oVGpYTU5aeG0wMEhIMEpwU3ptZHZvY0ZiZGZpS3hvUUxtWFBTdEJ4WjFI?=
 =?utf-8?B?eGV2c1FFdTdRNzM5aFl2clFuM1FuREw5cHNuU0dYUTVENVE0MU5RNHVGRmhS?=
 =?utf-8?B?MzN4bXIwQ2t0RUxxS2EzbFVxSDZpVFhvbjB2Y3lqWmgzRUFSZ0tpeUwyZ2I4?=
 =?utf-8?B?QzJkOG14YmVCeWszdktJOGNLcUI0bVVqRVR3YWswRVpPT3BadjhQaStLRUM5?=
 =?utf-8?B?YWhQQ2J2VG11UnVZa1VsYStkalg1NjUrUmxVTUdYa0hQSFBKNTJJUkhZQ1VM?=
 =?utf-8?B?OUZCVlpwcHpsZ0J0TjB0UHpMVitvNE1nRXJpOGNxOGNRRjlCdkxqNVFQcERm?=
 =?utf-8?B?MkR6NGZEbU9tUkRucWRCY2dGYXdueDhnZjVkZm5ZRUpRNU82SUZOODYzUkli?=
 =?utf-8?B?SmlkZmlPYkFiQjY0SWRKN05kN3JOb21ISGtSejR5SHBuT3JLWEgxK3plc2lv?=
 =?utf-8?B?MnI1L3oveUNMWXFYUUlZTkJteDVnTGZuOVdxOHl5RE1NZFRuTHpuTGhUTzcw?=
 =?utf-8?B?L3ZadndFVXNiTDFNZXRoakl3WUpMalM2SlF6SHhHa1VaQytwVFpnNmF1MFFB?=
 =?utf-8?B?cnhnaSs4cENpclVIbGNqQmVyaDN6SHFYTjhVOEgzMjZTUkJ1RHZ6K0lKRUVK?=
 =?utf-8?B?aGgxMGxQNGhhWGJrQmdUK2NZSDdvdWdjRUpkV2RvaWFhY0NzK2U4am44T0xr?=
 =?utf-8?B?VHVDTkhDRU5NU2ZVeHh6U2Z3S2xCT3lCaGljN3l0dEJKR0xWYXJDSVJRY3NF?=
 =?utf-8?B?ZURiUnZ3L0ZJNWx6NDNRdVFOMmE5QTc5cXpiLzMrRXQrNVRsVmYzMS9hY3pG?=
 =?utf-8?B?WTFuWGN1eDB1TDVvRFRuY2ZJWnpYSkxDZWh3R3piZXJGNjJqVVR0U0FndG81?=
 =?utf-8?B?L1BtWjJtWUdObVdLTVVwTjkzNjU0TUYrMU9JL1gxNG9RVS92MEtzTEZsWk5n?=
 =?utf-8?B?djA2TjFORjNVMlpFU0IrbnFNeklrZFVCNzN1K2ZNZXplbUIvWFBVbnYwWUpU?=
 =?utf-8?B?V3pnbExsRE1LcXQ3V0NQenErTThrTldISkpTVlBmNklldWtHTklYbjhiZTJZ?=
 =?utf-8?B?ZlliYXpIcXFPWWx3OERHZUpHT0NaeDZiZHVMV1d5eWwzMHZreHdSclQrSkwz?=
 =?utf-8?B?dmNuaFFkWFJzRjdMYkZ0aEVndUhNRnlXeDBxUkk1cHRhazhBWkhEMmJtZ1RJ?=
 =?utf-8?B?SUM0ckNCcGRmdGFENkNCOWlOT2cxaVFTSkNSWW1WMUJQb0VTbEFFbDNqNmxZ?=
 =?utf-8?B?UVAxc0lFV1VqZ1ZoVGNmcVB6ZUp4RitkTkRPMW82V3pHYVE5MkdJZC9UcFFR?=
 =?utf-8?B?aUE3V2dGampheFM2d2VTRlhrNVpFOVRMVEZvcGFpT2l4MEwvWkFnaGZPakVE?=
 =?utf-8?B?Q1VzYUNaN3pLRHJZamRsMHdTUituOVYyRzZzSVVGRmlsaVpTUTJHU1YxaXlX?=
 =?utf-8?B?aU1FcHFOUWFsY0Nwd0tLdGx1cG1nWloxZmJsdzNNV3hIQVdCM0tPM2tjYnhF?=
 =?utf-8?B?RHhvQVlWNWlTcEhSdWpqZHYwZEIxS3RpMG1sZjFwOWFMT0ZiTjVYZDFic2JK?=
 =?utf-8?B?NnFXcmJzdnJlT2RpS0xCdkNnWkUyVno0aXFmbTZZNU9DQVl2THVsaWIwNENR?=
 =?utf-8?B?V2VmYXJ3eWN4MUM0NXBkUm5JRXEwU0JUdEYrU3gxZ1o5citWSXFMNWpwc2xt?=
 =?utf-8?B?dm1VaTI1REtPVEdtVDAxbzFaNk1rRGNIZ2h5TUszSDZYQjVpaFZDcVZtajV2?=
 =?utf-8?B?dmxrWFlyOFFReHBNRjlmYndOLzNiOGsxOHN4bnF1dUNpd2gyVlpwOHBGVlkx?=
 =?utf-8?Q?9/rapmkssopwpK/aUC2zLkLXd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4d5930-d6f8-4c08-992b-08daf4757411
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:17:32.4820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFdVJy4fXovAhBnUlO1FQi7je/3ZE5Db5Yfu6Y+1FibZcqyAbtkIHcA2Dcsr+XDS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4296
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
Cc: linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 Roman Gushchin <roman.gushchin@linux.dev>, Carlos Llamas <cmllamas@google.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, jstultz@google.com, Zefan Li <lizefan.x@bytedance.com>,
 cgroups@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, android-mm@google.com,
 Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Todd Kjos <tkjos@android.com>,
 selinux@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Eric Paris <eparis@parisplace.org>, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Muchun Song <muchun.song@linux.dev>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.01.23 um 09:13 schrieb Shakeel Butt:
> On Wed, Jan 11, 2023 at 04:49:36PM -0800, T.J. Mercier wrote:
> [...]
>>> The problem is a bit that with gpu allocations reclaim is essentially "we
>>> pass the error to userspace and they get to sort the mess out". There are
>>> some exceptions (some gpu drivers to have shrinkers) would we need to make
>>> sure these shrinkers are tied into the cgroup stuff before we could enable
>>> charging for them?
>>>
>> I'm also not sure that we can depend on the dmabuf being backed at
>> export time 100% of the time? (They are for dmabuf heaps.) If not,
>> that'd make calling the existing memcg folio based functions a bit
>> difficult.
>>
> Where does the actual memory get allocated? I see the first patch is
> updating the stat in dma_buf_export() and dma_buf_release(). Does the
> memory get allocated and freed in those code paths?

Nope, dma_buf_export() just makes the memory available to others.

The driver which calls dma_buf_export() is the one allocating the memory.

Regards,
Christian.
