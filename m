Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E966B1E6F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 09:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E2410E7B0;
	Thu,  9 Mar 2023 08:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4130510E7B0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 08:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dH/mpeoqEJSaLA4gLS0tPKG6T4uzHrqPd5hX00iqCIu99jDFSwnEAT9BTtbXXmXPgsSoLRh+W4AsPU9wspQntDIQnUxpTGE79GQeOu4sI0V5k9GrRxMcTgdjwWhZfzOeLQGJJivJbms39jkfNjkoOSbkvePGBklfKwOObRAhsC1w1BOdVoaXcSx8a1Xl+yVpor9CM/qPH6TQrZxfPf1bmHt8+ebKSmry/jq1QzdCHK/K1YAPMXvAq1pgxCwmMEMcPcYDCX2LiS/PMY6Rp3XARqhURYnYxi5AoM+FrNMGfhYoCsyk+OruwCSdEbXS80WLTjAG90bBGdsNk/1nynx43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVfIyq6qIMm629iteLYQtt8WFq9Wy7paTlapuJXCgXE=;
 b=S+xQaF1FhTB7tjVjCBq4wiSTaos3bwVMQuoPqmt4Ghzw7+3AOaV4KDbdFXLdtBRktBv26pKgns9TPTYntY6f7UWxf/4QK4qpN1s671EPBA41F/nZiv9pwb8LMtgK+0AQkyrX1gn2Hh9zQAVZg29pOXrbOcwDr8l5b504QN2Aax6q0rDuQvbhTlcIwcY42eoY0XryGQRmuWpfAyoEoM0im1JtuMmIhxkAN0mAGP1Ikce2gWEkkbTs+niV5ypKEp2Y7Lg9wLG6HMN9LEstwmb9+Thfp8l9rqHv1YrfDEGJLgidVDlVATzr6TlL7g/jv49pvKU8rO9bvdVAaq7shSU5HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVfIyq6qIMm629iteLYQtt8WFq9Wy7paTlapuJXCgXE=;
 b=1+2k2I8SbZl2tBvioK8KDv4Yt+PIY2xMdH8ywKEPxITCQjOerKy2758XeunhOz4pFq4WC5p/oM8TuwOEdv1pvI9Z8iE+fEcYebhG1I+eqgkiJAmY6rRgGfcP6kG569DQpo0Tg4sru0gQc9hB6sbVtfAgvrIy0ql9+Q/hnzLB4OM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 08:42:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 08:42:40 +0000
Message-ID: <5f0814a3-4be3-a609-d3b3-dd51a4f459a1@amd.com>
Date: Thu, 9 Mar 2023 09:42:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the scheduler
 is torn down
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
 <585fa052-4eff-940e-b307-2415c315686a@amd.com>
 <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
 <7b39ef96-3ec5-c492-6e1b-bf065b7c90a2@amd.com>
 <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
 <e18500b5-21a0-77fd-8434-86258cefce5a@amd.com>
 <8696d00a-c642-b080-c19a-b0e619e4b585@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <8696d00a-c642-b080-c19a-b0e619e4b585@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: e7543d69-0e96-4b6a-731a-08db207a3e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bn/koooPM8RY1zLUC5Ty4PDo94gMsTn9tfXIMG/QRWeuqj+oLyAnrBYGRDg5wpR470yuUc0wBBMLa8mf69lHCe7la1DnnJRRr+wseoafziAIXRjz8RyB1mgKPL/t5XQ8PGUCqxtyChBr5Qh0xO6ZrKwsghDhmdVXoFbkH244CbCO/aCJvhtTR6oLkhW3yt5pJpotrUR9aadfLQWWe6oVtJX+7DNVul/eIwHrp8eSeZmVRj9XGSa41gf1nX4W2aVhW1IfzDIurRMstkE6/Ch9YOMkNGjFadKD7H4+mqyqlc9e20k7Ko6xKzNQol0KJqjRyE57tJ/G8llD1oquqFY2Z5ynekBX6+LYqTOgnZdfqK7vP+/aydCtpSvHfTbe3vwDKVrxZyS4PTFNXzB/ZP/1dHG1b6AgF2WJKaJyghG0hxiDTg6DAsMk33ntbRNoaWuXyCA71it7k8EA7E/85PbXp3drP/GUiw7t5+Z9A/d6BxxY/B5Xh7Z0yboAA35PZH+dDHRjQ1iISnDnfTKBzFHwQ6ve4sdjlqbKadYQtA+UIMnhAHhdrrRPHgWo2XDcXHeid9y4bV9Pa2is7vlLHV89Ss7zuc4g9jZj3BFNAHAuheZLpDhdYtvCDx9bX3nFb6XJkvTyzokZi2K3D1mf79MV79BpoNyDX6TV901/jTkR5zcZo04KThXRwmcg7vZhnQbi4RQ0FNgelk+Ol2OEkFKp+YR4tt/wWm8KQtIygM5PFwIYGXqWYDqvK1uKj7FR5tkq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199018)(36756003)(54906003)(110136005)(6486002)(478600001)(7416002)(316002)(5660300002)(66556008)(66476007)(2906002)(66946007)(8676002)(41300700001)(4326008)(8936002)(26005)(921005)(31696002)(86362001)(38100700002)(6506007)(6512007)(2616005)(186003)(6666004)(83380400001)(66574015)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGxEeGExbHpWOWtwT1VrS1QvOEJidXJlY3E1M0tSM0hoa2JWcnlHZU9NbU9o?=
 =?utf-8?B?bk5KOFdsTHQ3TzFQUmxZMVhEOXFkb3l4M2RQR2wvVEh0citDaU92b25ZUGVm?=
 =?utf-8?B?TlBvZSthOVpLQUFoTFpQMGYyM014a3Q1K1RNalhNRldpN3NXUWswaUpLVmVp?=
 =?utf-8?B?Q3pjakJoRXJwSEZxZllDQjU5MldDWVRXR25KMytjVkRST3NXbHl3OUZUR25o?=
 =?utf-8?B?U1dlUit4TkpPaE1VeDNacDFYNWpOK2xDNGZzQTBHR0pKWWpjVTJzZzF2WEth?=
 =?utf-8?B?VzU2YUNzSlBDbEpteURFWHRvUEpLSGJLaElCWkFRN1JYMHc2ekFLaEZ4bUJn?=
 =?utf-8?B?blBBbmFEVytNaXJ0dmJOQzJrMDByUTRHOEd2KzJxZHBHcTU1cElRTjZMOU5X?=
 =?utf-8?B?WTBISmJzTUhPSFdEZlRhcXd5VDkzWXNWN3lTUVRuSHdJTkpvek1vTmFqWVRO?=
 =?utf-8?B?ZFpRNHE2cmdYbFhxcUVjR1Z0VnM2Mjdwb2tuY2c4SmNPNGdMRFpSZno0OUhH?=
 =?utf-8?B?N3ZsVy9iN0ZtaGJsZU0zSEsxTTBXK0RId2UyWTBFNXFqMG8rVnJzSFN4T2ls?=
 =?utf-8?B?T0pINjE5RXU2dnRxU3lGekVjMEFUTDBvVzU1VklMblFpRVBnRmdFNHovTVdt?=
 =?utf-8?B?cDM4MDlwY3ZmTUpZQTZmQzN6U2h2WlhGVUZkZ1B5a2t3UlNPdzhsR0pnOTVY?=
 =?utf-8?B?WlhnUGdrM2M2VVAwa1ZQdWw5OUxSMmdHUEJNSkJpR0hvbkxaWnRmb1JoZG9j?=
 =?utf-8?B?VS9BUE9pVTBrQmpyak9iZFp5R2UySHNCeVhKRDVZMndmdlVIQ0ZWcTI0QjlY?=
 =?utf-8?B?TmRMYlJsTHhHUmE2N3Q0WDMxT3o1TmZLQlZCYURjdFZXM0xEQ2x0Zm1YQjRq?=
 =?utf-8?B?L2NqRk85Z1Rlai9pTzg3WG1sd1E1bU1BaC9jMzBiWVlhODgraDM5YmNyN2JI?=
 =?utf-8?B?S3RDcWhiay83andsVndkcUNKdkR4ZXpCNm5ZRWZrcWR0NDV1d3lmR2Fzb1Q3?=
 =?utf-8?B?dHBjc05LYVlob3dlSXVUamkvRDAwQnA5cFNkWUMzNkt0MkFFN0ZJS2RKeU5v?=
 =?utf-8?B?RDEzUmZrbVRJR0hYN1lGOEhZY0tKTHZIN1RPNGE1cjU1cFV2eURLUDZWYnJy?=
 =?utf-8?B?ZkJFZjJVUG5PSldKUFlPV3JPelBnSDBzVGNra0VGUllmTUp6cUVqRWxPUnRF?=
 =?utf-8?B?TnUxZGFMZGpSMEVtakUydTBhQlAycHNrUmduc1NMLzB4enlNOEpmYkF4NnpX?=
 =?utf-8?B?bU40b3ozSk9VMXFpZHpITzhpNUtWWVh0YWNFYkpCY0NxNkZDQ2UyaTdITTNF?=
 =?utf-8?B?TXN1bG96V2NMS3ZrL2NhRkFFL09ZUXpJNGFyRDBoNlgrZlo5RXhYUGVJYjhy?=
 =?utf-8?B?ZmF5RnBqcmVJQU9JYlIvdW15ME9oK0hKdGJTSkNLRzZHS2d5eWs2SWs5K1hq?=
 =?utf-8?B?cjRUK281c09LblZjTW5zaE1oMGdkUy80TUpxc0t5L1k1VzRGM3NEbHpmOFJs?=
 =?utf-8?B?R213NWhuV1NSMU9MVDNuODNqbVVlT1F2MHJsSHNUL3hOZ3haQkpwVFF1cnc4?=
 =?utf-8?B?cCtJNUx2TUlnYjN3dktKK01GSzBFWVdURVZ4VVgzQUFwYU84dFJjYXgvY0M2?=
 =?utf-8?B?b1l0R3ErVU52QW15S2ZCeHc2ekFRWlBDUjdJRytDZWJNWUd3L2cwVzk5R0pZ?=
 =?utf-8?B?WVRCbVA1bE9jampOM2JkSDJ2U09QQXVjUlNMeTJQU2FwbDdlOUNEQ2pMdmV4?=
 =?utf-8?B?OC85ZFIrK1daamFQNUpRTHY5VUw4QXNpUXZrKzc2YmFwWFcvQ2ZhbG9zK3p1?=
 =?utf-8?B?QWdyUVlBdE91dnlKTnQvQ0hyeXBHSnVGRit0WmNKRDU2VmlGUjBUUjlFWTFt?=
 =?utf-8?B?aGRaTEhHck5QWEJtSzQ4VGtwdUtVUWtyUklUblcyVWt2S20rcnkwQzFpbHFx?=
 =?utf-8?B?RFZURzFoR0hGOVorRnRKVGZ3VW5Ld1N0enVra0lhTkF0QWgrV1NKVUN4VzVU?=
 =?utf-8?B?ZDZtTHRnck4wUzErWjAvKzFuckxab2RwYzMxV2QzWnRReFJsU08rVndVNldn?=
 =?utf-8?B?S2FWTzJqNFRRTHFTNGxGWXlHUVFyamdqTEhZeExheWppTTBMS1kyVHBlSnND?=
 =?utf-8?Q?C6LdbTnXc28mtcd1aVqxXx7J9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7543d69-0e96-4b6a-731a-08db207a3e3d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 08:42:40.7089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmnVtAFqDFbHf4WgjdNhpXaXQ9zWLshYghO809tke04KrXjWz6d21ZWyPe6c/lN1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.23 um 20:37 schrieb Asahi Lina:
> On 09/03/2023 03.12, Christian König wrote:
>> Am 08.03.23 um 18:32 schrieb Asahi Lina:
>>> [SNIP]
>>> Yes but... none of this cleans up jobs that are already submitted by the
>>> scheduler and in its pending list, with registered completion callbacks,
>>> which were already popped off of the entities.
>>>
>>> *That* is the problem this patch fixes!
>> Ah! Yes that makes more sense now.
>>
>>>> We could add a warning when users of this API doesn't do this
>>>> correctly, but cleaning up incorrect API use is clearly something we
>>>> don't want here.
>>> It is the job of the Rust abstractions to make incorrect API use that
>>> leads to memory unsafety impossible. So even if you don't want that in
>>> C, it's my job to do that for Rust... and right now, I just can't
>>> because drm_sched doesn't provide an API that can be safely wrapped
>>> without weird bits of babysitting functionality on top (like tracking
>>> jobs outside or awkwardly making jobs hold a reference to the scheduler
>>> and defer dropping it to another thread).
>> Yeah, that was discussed before but rejected.
>>
>> The argument was that upper layer needs to wait for the hw to become
>> idle before the scheduler can be destroyed anyway.
> Unfortunately, that's not a requirement you can encode in the Rust type
> system easily as far as I know, and Rust safety rules mean we need to
> make it safe even if the upper layer doesn't do this... (or else we have
> to mark the entire drm_sched abstraction unsafe, but that would be a pity).

Yeah, that should really not be something we should do.

But you could make the scheduler depend on your fw context object, don't 
you?

Detaching the scheduler from the underlying hw fences is certainly 
possible, but we removed that functionality because some people people 
tried to force push some Windows recovery module into Linux. We are in 
the process of reverting that and cleaning things up once more, but that 
will take a while.

Instead of detaching you could also block for the hw to become idle, but 
if you do that synchronous on process termination you run into trouble 
as well.

> I know it's a different way of thinking, but it has pretty clear
> benefits since with Rust you can actually guarantee that things are safe
> overall by just auditing explicitly unsafe code. If we just mark all of
> drm_sched unsafe, that means we now need to audit all details about how
> the driver uses it for safety. It makes more sense to just make the
> abstraction safe, which is much easier to audit.

I'm pretty familiar with that approach.

>
>>>>> Right now, it is not possible to create a safe Rust abstraction for
>>>>> drm_sched without doing something like duplicating all job tracking in
>>>>> the abstraction, or the above backreference + deferred cleanup mess, or
>>>>> something equally silly. So let's just fix the C side please ^^
>>>> Nope, as far as I can see this is just not correctly tearing down the
>>>> objects in the right order.
>>> There's no API to clean up in-flight jobs in a drm_sched at all.
>>> Destroying an entity won't do it. So there is no reasonable way to do
>>> this at all...
>> Yes, this was removed.
>>
>>>> So you are trying to do something which is not supposed to work in the
>>>> first place.
>>> I need to make things that aren't supposed to work impossible to do in
>>> the first place, or at least fail gracefully instead of just oopsing
>>> like drm_sched does today...
>>>
>>> If you're convinced there's a way to do this, can you tell me exactly
>>> what code sequence I need to run to safely shut down a scheduler
>>> assuming all entities are already destroyed? You can't ask me for a list
>>> of pending jobs (the scheduler knows this, it doesn't make any sense to
>>> duplicate that outside), and you can't ask me to just not do this until
>>> all jobs complete execution (because then we either end up with the
>>> messy deadlock situation I described if I take a reference, or more
>>> duplicative in-flight job count tracking and blocking in the free path
>>> of the Rust abstraction, which doesn't make any sense either).
>> Good question. We don't have anybody upstream which uses the scheduler
>> lifetime like this.
>>
>> Essentially the job list in the scheduler is something we wanted to
>> remove because it causes tons of race conditions during hw recovery.
>>
>> When you tear down the firmware queue how do you handle already
>> submitted jobs there?
> The firmware queue is itself reference counted and any firmware queue
> that has acquired an event notification resource (that is, which is busy
> with running or upcoming jobs) hands off a reference to itself into the
> event subsystem, so it can get notified of job completions by the
> firmware. Then once it becomes idle it unregisters itself, and at that
> point if it has no owning userspace queue, that would be the last
> reference and it gets dropped. So we don't tear down firmware queues
> until they are idle.

And could those fw queue not reference the scheduler?

>
> (There is a subtle deadlock break in the event module to make this work
> out, where we clone a reference to the queue and drop the event
> subsystem lock before signaling it of completions, so it can call back
> in and take the lock as it unregisters itself if needed. Then the actual
> teardown happens when the signaling is complete and that reference clone
> is the last one to get dropped.)
>
> If a queue is idle at the firmware level but has upcoming jobs queued in
> drm_sched, when those get deleted as part of an explicit drm_sched
> teardown (free_job()) the queue notices it lost its upcoming jobs and
> relinquishes the event resource if there are no running jobs. I'm not
> even sure exactly what order this all happens in in practice (it depends
> on structure field order in Rust!), but it doesn't really matter because
> either way everything gets cleaned up one way or another.
>
> I actually don't know of any way to actively abort jobs on the firmware,
> so this is pretty much the only option I have. I've even seen
> long-running compute jobs on macOS run to completion even if you kill
> the submitting process, so there might be no way to do this at all.
> Though in practice since we unmap everything from the VM anyway when the
> userspace stuff gets torn down, almost any normal GPU work is going to
> immediately fault at that point (macOS doesn't do this because macOS
> effectively does implicit sync with BO tracking at the kernel level...).

Oh, that is an interesting information. How does macOS do explicit sync 
then or isn't that supported at all?

> By the way, I don't really use the hardware recovery stuff right now.
> I'm not even sure if there is a sensible way I could use it, since as I
> said we can't exactly abort jobs. I know there are ways to lock up the
> firmware/GPU, but so far those have all been things the kernel driver
> can prevent, and I'm not even sure if there is any way to recover from
> that anyway. The firmware itself has its own timeouts and recovery for
> "normal" problems. From the point of view of the driver and everything
> above it, in-flight commands during a GPU fault or timeout are just
> marked complete by the firmware, after a firmware recovery cycle where
> the driver gets notified of the problem (that's when we mark the
> commands failed so we can propagate the error).

Yeah, that's exactly what we are telling our fw people for years that we 
need this as well.

> There is no re-submission or anything, userspace just gets told of the problem but
> the queue survives.

> In the future it might be possible to re-submit innocent commands

Long story short: Don't do this! This is what the Windows drivers have 
been doing and it creates tons of problems.

Just signal the problem back to userspace and let the user space driver 
decide what to do.

The background is that most graphics applications (games etc..) then 
rather start on the next frame instead of submitting the current one 
again while compute applications make sure that the abort and tell the 
user that the calculations might be corrupted and need to be redone.

Regards,
Christian.

>   (it is possible for a GPU fault to break another
> process running concurrently, and this is a problem macOS has too...),
> which is still not perfect due to side effects but might work most of
> the time, but that depends on the "command patching" stuff I mentioned,
> and I'm still not even sure if it will be possible to do safely. There's
> a lot of subtlety around what we can and can't do during a firmware
> recovery cycle that I haven't even started to investigate yet (the
> answer could be "nothing" even).
>
> ~~ Lina

