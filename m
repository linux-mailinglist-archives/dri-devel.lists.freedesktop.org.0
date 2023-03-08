Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7E86B09BC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 14:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3078010E05D;
	Wed,  8 Mar 2023 13:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCC110E05D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 13:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0AhT4H+w+BgshT+klAzHeN3aAr/EwRNdSX9eNxqyuNVHZW1D4ExOVRCLTWTuHVix0lPLDW0ahmOqa18GxAzoCdH3WSaDiNcaf3z/hA17RMhQpkN5xZpkmspOp5A0nrBiI8wkd+N+gvWMm20mKjM87tD5TUKqFsQTVKEInpEDprwWLxPNtDEHIw5dmFx6sp2RC9+SE8YyErk98a4mjE1Ndty5VtYTiGINq1ItQNInLZ4v7P9PyBzAbUq7oW/tMU/HHb7Oj8CXX+wP9i5Cap+jC+7dozj/HNcaMxHTYWlEaXYvVyuTnhW4mMtnSNIGF2+sntf/sIuOtJtxEqS+qSiUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7HnP3j19VflBcljtKq4SYq0pwNZ1M370lfgQa6Twvw=;
 b=m6L6LL0KaWC8PjL9GfsvZ8vI6G7hAhRvN4fvRj4FnVf3P0kdNW+pAOSM0H9AfPG60g3tKV9ty27NamJr4VvaWFGvbEUxPaxOBl78xNPd/qjQ+FUCepMkrhTzLfSpfXJxiTetUXfCjMI8B08WhD/LtAZyq6YIro5n717c4TD3l0gKAw8HJUXBYKB+uOmt+TAVeJiwsGhvVLX1dzXUHU2pjUO4ygdFF6jZKhj42b3B8pTIUzsqSLqofyGCX7T6QfCb+5mPLbcuBxyHfi0zl52H2ZJ/MnrcmZEiyMbtGRcOCmoRNuxQ/JW/P+nLNUvE/kSqpgV9pTN0PlAzw5uw/TYk7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7HnP3j19VflBcljtKq4SYq0pwNZ1M370lfgQa6Twvw=;
 b=AHJswzIyhcaLz54VYz0BR7AsQFs3h7MYV2F03J3x6WHTKB4DWNBzFnRFegre72qxKLyDCUhZs8lZpcHEm4/3LKNUD4wJauq+XkmHryMjR0Ohw+/BTd4gDiCYJ/WvPAOM4upXgENeTmWw01jznYbSlF0Y8+S0vSKgLlkkiydRqvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4583.namprd12.prod.outlook.com (2603:10b6:208:26e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 13:47:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 13:47:23 +0000
Message-ID: <0d6cd23b-8c9e-067d-97ff-aa35dbbcf9bf@amd.com>
Date: Wed, 8 Mar 2023 14:47:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Content-Language: en-US
To: Karol Herbst <kherbst@redhat.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <CACO55tsnCMQt8UW5_UCY139kpZOdNXbMkBkFfUiB12jW5UgVmA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CACO55tsnCMQt8UW5_UCY139kpZOdNXbMkBkFfUiB12jW5UgVmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: 02cc1c89-1ec6-425e-2a81-08db1fdba4fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JeG4sWDw/xT9TwPk9qvmvomUkVBLCk047JhT62n8p5i1SJ4uMpYp3kktXQGFAKOCxrbCzHOo/5XaVqmgVhLJI6ft7fenU7IAj6K5TlLC1ryeBnCzVUQSt/R2xcAbUcAQenqWgjVIdrYKV3mSCHNISDK4bX+Z6svVgf251qP5FlUwL7mIn+cLIdzcmMAI7hagV+e61wfJr88iJmBmtVyaX3UO48k8PD2NMIo6U3+3WC1cul4FwAUrZDFOvsfeD67PCPtjMFuctW0d25Gz4P3fHNZHstiLlgVi+HU/AsCNjioEtFbTEN0YsbW5GIEkKAtyFNOrf6dLN9HA6dWd8G8qQdcOwf0N73LFEaD6ui+3jq5ArpeOuX1d4GbuYLgWFmcUaA+vh0c6D618VKmrL0chYFIuM5SHV6GQg0xrCdUozZUpq20O7/dGPXHE2UWrFcYkKccdQbJqYtIWTlct6TSw+Zz15BaO1jc2S1YuVkNarZ4Q3JWepd6SVVLYNhT2I9+XTjImTmyK+bEMg6CbZtTKI3+Whi+fBQ6M0wsDZ1mv1anMYuOokHsh3LcaLrp8n2nhfNO905EvdZ9ZhjH0WQyaNkAdfyYJq2G588RuiLkDNTpPN5bCElx9cQWRAcQf30aGMa7NfqbtQNqgXivlUZrYTCONa+Im3RSinzOjzKWd8ELDyUQMHwZM52LlfxRPlNiFZiQ+XSayPafqHqphvp7hZTdAW3JCz5CnokYCyBLa4Lw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199018)(38100700002)(2906002)(186003)(6506007)(6512007)(53546011)(66899018)(2616005)(31686004)(6666004)(66476007)(966005)(8936002)(66946007)(478600001)(66556008)(6486002)(5660300002)(7416002)(41300700001)(31696002)(66574015)(54906003)(6916009)(4326008)(316002)(36756003)(8676002)(83380400001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0k5VHVyZXNia2E0emJ2M3BEdHU2U0JmVE9mQkx1VnAxSUFCVzBhYWlJOXRy?=
 =?utf-8?B?MmkwR09keStpcHUzUzdaeDhFRjNmQTF2ejdGL2pSVGl4a1lySmxHMXMzRmVp?=
 =?utf-8?B?MGV4TFgxanVFSVBwUWN6T3QyQkF4eHdRUVVhRWNGcHlWYTQ2aWZFN08xbm9J?=
 =?utf-8?B?ampGNm93QVM3M2lQSUtocXJqdEU5YjdseW5ET2RNMzl3VS80eEh3WmZjeWhj?=
 =?utf-8?B?SU1YaTRDaEVTSXI3aFAvak9SUHRsR0t4d1lsMTlBa1J1UkJVRHZYLzRhK0dC?=
 =?utf-8?B?ZTBzK21zK2JtdElBaUJ1T0E4NmtyZGlZQmY0SjdFcnRsbE9vSWFSR1RvVWs3?=
 =?utf-8?B?dDFaMlhJNGZBYjVMMVRabktuNVFIdk10SDNiV0lqWVRTYVFZN2ZnQXQ3OVda?=
 =?utf-8?B?V3VGRDlOVWFWeklqVUdkL2ZtYVhpRHowWEJLc2pLVVVYUWNwT3RLejFBQnh1?=
 =?utf-8?B?Wk9EekdBYzFabFFxeExhMEp0OGxvRlJZUzNnTEZRUENEcEN1U3NaaXpEWjEv?=
 =?utf-8?B?OFRXNng1R0laRHd3KzRTZ0NzTXVWZ0pJb25xdHFyR1UxUENLODRyaGZnNmhP?=
 =?utf-8?B?Z0Fvb0J2WXhNYjZyVzlOYllORFVmU1FYY1RtWDJUeFRmUkFybXVIT21MdXNX?=
 =?utf-8?B?R1haaUNXdThIRHdPQVg0VGVSTjRRMllKaGRTL29tMklXOU5zeWU3Nkg1NGJE?=
 =?utf-8?B?QW5vUXdnaVR3UVY5ck5JWUt4V0hZRnBTd1NESWQwZkdRKzNIYVJ1Qk1veCtL?=
 =?utf-8?B?WkdLdklLb0JwNnNhOHJydVpRd2dyaWRiN3lYSWp4enVjWGlMZVZNNUZuc3ph?=
 =?utf-8?B?dVNMc21KK05DRm8rNStUWVlzcW5SdXE3MkZka0NlaVpScnpka0VhUWZvUktN?=
 =?utf-8?B?bUFOT0hLUFFRM3ZKUVd1bWh4N0RGY1crbnRMODN4Q2lBYWc3MFJ2Tk56dDRn?=
 =?utf-8?B?WVhnemFMSzFxT0s1a3BZdmVRV3l4SGkra05jeHRheGVIU1lLRWRtOU9BOWlI?=
 =?utf-8?B?aVBiOG95MFgySUhpdnd0Vm5zSnB2Vk9uWVpLK3JkZmhra2lHYTU1ekxudlRO?=
 =?utf-8?B?eUhzSEd6SGR1OVgrRUpIcDFTMEk1cUpIUW93UndBYzJHSHVTb1ZXVEJIWHJV?=
 =?utf-8?B?RDIxTUxiaksrRUx5MHJhYzBoYnhoTTdkTkg4V2pxUHB2dENWaENIVXRBTndC?=
 =?utf-8?B?eU9lYTZCeUpUSTdOZ2tSY3hHYjdZRFlkMUJXSUVYWkpPOGRwQmdNNERFZWRP?=
 =?utf-8?B?a2ZEdU9FZXlYYXg4UlY4NzNCbzZRQVNyeDNaaytiVS9xNTVzbXhKR29sSVIw?=
 =?utf-8?B?YkJCY3hKR1k2c3lKblczYVpIVG1nM2xneW9MMDFSZ0RWN0dIVm1GU29rZUNB?=
 =?utf-8?B?cDZIWHF1Y0p3dldQbld3VWNsOGZlbWpyY01hL2p1cWljMy9MbXFJVTZSajNQ?=
 =?utf-8?B?TENrbFpyY285ZHNQcUkyZnBMaEIydFdKa0lLNUhzSFIrT1o4THpoOStNL21h?=
 =?utf-8?B?aVNCbmdsMjJMbEZnbTArSFpVZGx0YlFjeEZTc0tQb3YwZm0vUnh1U2tzdmZi?=
 =?utf-8?B?YlJPTFkydmt6elpaaEhETVl3NjVaWVpjOVVMblJhQTZBQjFwNzB3aHMySkFo?=
 =?utf-8?B?QzRyMVBnMFpmTlozMWx0aHhzRUNPc1k0ZlhSS3lKZlZWVGpmWWJ2cUU1dVpO?=
 =?utf-8?B?ZGI5Ti81dEFjbnR2bmdtQjU1NGNweVNGSkhOWjVGSTVFazdhRzZhRE1zb2lz?=
 =?utf-8?B?ZFZnemh1U3YxWDZUTFNaN2svdXJENTNIaHA1ZElReTdWa2RSM2VmbU8zUjg2?=
 =?utf-8?B?TTBaMmpNNWxLMEI1Y0Ztc0RIZ0dFd3p3dEJCRUlNUkZYMktBSkZ4UUtCNE03?=
 =?utf-8?B?U0oxR3hZM2ZFcTRCSWd6V1h2VmhFRE1SQ2ppMWhyOXc3TUxaY2QwMnoxUUpU?=
 =?utf-8?B?aHJiK1lXdWZCSXNEZElTVUJYRm9JTmMvenBrNlI0U1FkcFVjSlV4TTZ4S1lz?=
 =?utf-8?B?MCtoKy9USUwrY2JSNTFXcnN0UzdqcU5UWlprUkJRYlk1ZlNCWC9FYkZXVW55?=
 =?utf-8?B?Tk96TGNUdHdxNWV1NGsvZFhjV3ZFZndhOWJhdjdvc0lKQkZvMURBQXVUZ1Fm?=
 =?utf-8?B?ZWRUUVY1QXpHekdJZjZiNi8zQnZFOTRkWVh1TEQ4S1Z0T2s3c0dxeVF2TUJY?=
 =?utf-8?Q?zMY2lEDchfAMkHE70Clu4ZDXyyTWRSuxrrbqavpgDl7S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02cc1c89-1ec6-425e-2a81-08db1fdba4fa
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:47:23.0932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFc6Cqb4mFzjj/x5RDMYMR6HdtQaqAglI07Nm9FHhLnJMSc6fy5+rzW7riysLk5G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4583
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
Cc: Asahi Lina <lina@asahilina.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Gary Guo <gary@garyguo.net>, Ella Stanforth <ella@iglunix.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.23 um 13:39 schrieb Karol Herbst:
> On Wed, Mar 8, 2023 at 9:46 AM Christian König <christian.koenig@amd.com> wrote:
>> Am 07.03.23 um 15:25 schrieb Asahi Lina:
>>> Some hardware may require more complex resource utilization accounting
>>> than the simple job count supported by drm_sched internally. Add a
>>> can_run_job callback to allow drivers to implement more logic before
>>> deciding whether to run a GPU job.
>> Well complete NAK.
>>
> There hasn't even been any kind of discussion yet you already come
> around with a "Well complete NAK"
>
> First, this can be seen as rude behavior and me being part of the drm
> community I don't want to have to see this kind of thing.
>
> Obviously, any kind of strong "technical" review point is a nak until
> people settle with an agreement on what to land, there is no point in
> pointing out a "NAK", especially if that's the first thing you say. If
> you want to express your strong disagreement with the proposed
> solution, then state what your pain points are directly.
>
> If there is a long discussion and a maintainer feels it's going
> nowhere and no conclusion will be reached it might be this kind of
> "speaking with authority" point has to be made. But not as the starter
> into a discussion. This is unnecessarily hostile towards the
> contributor. And I wished we wouldn't have to see this kind of
> behavior here.
>
> Yes, some kernel maintainers do this a lot, but kernel maintainers
> also have this kind of reputation and people don't want to have to
> deal with this nonsense and decide to not contribute at all. So please
> just drop this attitude.

Yes, you are completely right with that, but getting this message to the 
recipient is intentional on my side.

I give completely NAKs when the author of a patch has missed such a 
fundamental technical connection that further discussion doesn't make sense.

It's not meant to be in any way rude or offending. I can put a smiley 
behind it if it somehow helps, but we still need a way to raise this big 
red stop sign.

>> This is clearly going against the idea of having jobs only depend on
>> fences and nothing else which is mandatory for correct memory management.
>>
> I'm sure it's all documented and there is a design document on how
> things have to look like you can point out? Might help to get a better
> understanding on how things should be.

Yeah, that's the problematic part. We have documented this very 
extensively: 
https://www.kernel.org/doc/html/v5.9/driver-api/dma-buf.html#indefinite-dma-fences

And both Jason and Daniel gave talks about the underlying problem and 
try to come up with patches to raise warnings when that happens, but 
people still keep coming up with the same idea over and over again.

It's just that the technical relationship between preventing jobs from 
running and with that preventing dma_fences from signaling and the core 
memory management with page faults and shrinkers waiting for those 
fences is absolutely not obvious.

We had at least 10 different teams from different companies falling into 
the same trap already and either the patches were rejected of hand or 
had to painfully reverted or mitigated later on.

Regards,
Christian.

>
>> If the hw is busy with something you need to return the fence for this
>> from the prepare_job callback so that the scheduler can be notified when
>> the hw is available again.
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++++++
>>>    include/drm/gpu_scheduler.h            |  8 ++++++++
>>>    2 files changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 4e6ad6e122bc..5c0add2c7546 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1001,6 +1001,16 @@ static int drm_sched_main(void *param)
>>>                if (!entity)
>>>                        continue;
>>>
>>> +             if (sched->ops->can_run_job) {
>>> +                     sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>> +                     if (!sched_job) {
>>> +                             complete_all(&entity->entity_idle);
>>> +                             continue;
>>> +                     }
>>> +                     if (!sched->ops->can_run_job(sched_job))
>>> +                             continue;
>>> +             }
>>> +
>>>                sched_job = drm_sched_entity_pop_job(entity);
>>>
>>>                if (!sched_job) {
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 9db9e5e504ee..bd89ea9507b9 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -396,6 +396,14 @@ struct drm_sched_backend_ops {
>>>        struct dma_fence *(*prepare_job)(struct drm_sched_job *sched_job,
>>>                                         struct drm_sched_entity *s_entity);
>>>
>>> +     /**
>>> +      * @can_run_job: Called before job execution to check whether the
>>> +      * hardware is free enough to run the job.  This can be used to
>>> +      * implement more complex hardware resource policies than the
>>> +      * hw_submission limit.
>>> +      */
>>> +     bool (*can_run_job)(struct drm_sched_job *sched_job);
>>> +
>>>        /**
>>>             * @run_job: Called to execute the job once all of the dependencies
>>>             * have been resolved.  This may be called multiple times, if
>>>

