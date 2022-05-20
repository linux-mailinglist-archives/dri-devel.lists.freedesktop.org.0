Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3952EDC7
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 16:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD6010E132;
	Fri, 20 May 2022 14:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919F510E144
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 14:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1653055577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8kMqEf9YfAX3H29253p/70YKpwvNJYTtZtS12zg/C0=;
 b=KOBN+EQGWXZmWL4+RRnwr8YfcxaMZ+c1ieiTk5bbyn7FqV/RwNSo8OusXD2oIPMXAvmGgw
 1zz+J+c73VLRBZ9WDG2j9IkaqVAvhadpLhW5ibRcHHFR+KK5+oQ8WP5CGprJvMXLwgEnvd
 o2fzU0P/wcaO11UKWR7vDXhA6k5w000=
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-atkjlmlMNlWNhtsRyPDFdA-1; Fri, 20 May 2022 16:06:15 +0200
X-MC-Unique: atkjlmlMNlWNhtsRyPDFdA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNkXmOs/ncKIbe7ThH/QtYwCOdEi8vSM5AyaRJj70inFJByMD/R1C9zoxwbgXB1VlPw3UG3/a8Lz8NEAGZFUzwvnxbpmaWRTSGAUVAb6eySW5dXfatSrmDbpU69rkCpKF9yM64Y0IZ4OnV/jI675zxGQyAbOxQP4sDSw2V/4oFAgBId4iCLKUM5p1yvmk8UbDOERhAyhgB0n/mGhhc7moz4BZ9cP5MrPPjC1siNcJurFbVnnhePky/f5Xz5Re2JYtHvy1VxugV3obyixEPxUibRLXznPcu+9tXqKq3GKNCSJLAEFx83gEGYknB8BkrWH0OVZJ9ykpSyujkai4j4r2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nbfn2DqF++Z2hUraN3a5UmYO8l7KJ0rCWKc+6E3Y1bM=;
 b=DpsVCXAhEEyLKjfbzVgwHWZGbr6pdZvEu6F05QvQECP4BkTMbAcFHeLmeFtiFfUaA7HtgQSfX06rwvVd70D7+FT0VYDeTi+NcO/gtNeedjp8HfZlhQcdMX8hgkzYLrrH3AlzhIkpOSRsRyDl3FBCkZiGoCBf4PLFccbXfZYY7jCzlY707RQCnBDAJ+B/FKpdLnRxfquulTM3HtLCUe8LSoz3ESknJOFcYLdrcPInPP+TjjUt2wD2asDRD6hmGYqTV0nbjAGXTYJQegOpC1OjZeiAlts4kaLDQbyvrAvcDTaTIlnsvAHhuOZ3ryXu/yAeIUhhnIgXm+M/KZVCURKk9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3792.eurprd04.prod.outlook.com (2603:10a6:803:20::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Fri, 20 May
 2022 14:06:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 14:06:12 +0000
Message-ID: <9af0181a-e143-4474-acda-adbe72fc6227@suse.com>
Date: Fri, 20 May 2022 16:06:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@netscape.net>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
 <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
 <0dcb05d0-108f-6252-e768-f75b393a7f5c@suse.com>
 <77255e5b-12bf-5390-6910-dafbaff18e96@netscape.net>
 <a2e95587-418b-879f-2468-8699a6df4a6a@suse.com>
 <8b1ebea5-7820-69c4-2e2b-9866d55bc180@netscape.net>
 <c5fa3c3f-e602-ed68-d670-d59b93c012a0@netscape.net>
 <3bff3562-bb1e-04e6-6eca-8d9bc355f2eb@suse.com>
 <3ca084a9-768e-a6f5-ace4-cd347978dec7@netscape.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3ca084a9-768e-a6f5-ace4-cd347978dec7@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0496.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6670da7-e65c-4abf-9908-08da3a69e573
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3792:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <VI1PR0402MB379263CA2C6FE207A8522F7BB3D39@VI1PR0402MB3792.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HLnBuBIgQ8gqfwOLzhAHmRluhhMONmIZAJEi/zVeKl788/wBFD4JgPxaMj5JI7OWuYmw8jednPGeDy5Q4b1KqboeUn6OEOg7fMwEv7c0uDn4VB5ImURLBo+OBT/d91uYEqJtszzpGAW1bo6HOA4mGcX31CPBQvLIkeSULmGa+pU7YGQVE5Qa+wRodeCiZI5aChe+VoOO3BM7aMfXVaartWt4SXS+rPVhqIaA72mAjKYTxIGLJUBDs2Sz1DLv23fA4YfRQLSmPP/eqO3UHRmB4LkRzsZCQV1PTqBStOQ7CvxThV8WOQBNjj1eJHVfHXSJ1pvW0GSJPMNrrpsS+vr9bIRqbfrgDhx85S0YCyoPP9EcI/fenFTEuXxYakUy9D8Iu7pPeiEg26J1TlLnbkqEnJG1OdSe3vRSkqxglo45cYvc9IDFm3d5HezLKePsPS770ZCNRd3Ci2K3zh6OaXLQi/14U4jNgqX2OJJV1NirO6e1wxSD+Iek3I2QTCgs+4gqWtIKtqW3OlvOeQZ7Aa1O/vhZs7epu3tRCsurghaEdpNfZXh0ydP9KPPzqz8CmGU+PWWcJ9/XQLCloboXLnt1NJ3+XMaBb5SZPJrKmreshwe9n/CMOOZtc1KeZ2PGb5L0kUqgz0699Hm9m2ADkM8PEMYEircHnNNEW7TWc9e7TYy9ex21THFhPCB/BaxK5SEnFeWGU1DiRXfQg6m/wgR1xjJIFqNCGIJCW/PKu3cWHfMuRrvcQDcwWO+3cNJ9oNtx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6560.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(186003)(31686004)(2616005)(107886003)(36756003)(83380400001)(7416002)(2906002)(66946007)(53546011)(54906003)(316002)(6916009)(8936002)(38100700002)(6486002)(5660300002)(6666004)(86362001)(4326008)(8676002)(66476007)(66556008)(31696002)(508600001)(6512007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RNRJxt6348ITF1tOaCAbM7Gh7tcoJaXJjCKb1l6c1zsnfydqBhfCorkjvWze?=
 =?us-ascii?Q?Fapmk/EQvHMrX2Sa+PJ/W+QoP6xBvNqE1PwkqXHsjp3xce9tD5FZzCUlMaAd?=
 =?us-ascii?Q?S7PpNbJTIU0b/xfATcs+TSGjSl2XHbCRSafvPXpGhi+TXRIZQwE15erRIr25?=
 =?us-ascii?Q?B1y8TY6JUvn7CVRBNf2nAyUvrTm1hG1Y+2TFjIBIH9hVVepyajhdT7uqvsP9?=
 =?us-ascii?Q?Vn1qH0z5xN3GCrmeV18mbtjhWczACgLM/TpZVSNNDWVuXnS07mAwm3pXWa3G?=
 =?us-ascii?Q?2IxlsOoU4+O2zqiD+b6YIP3KCn/a07q9SCezYfjgLnICU83Epr/sULjQOJnD?=
 =?us-ascii?Q?8wYw08G2EIpJU9pQDeqFGrc4/LpNnM4xY2EX+mZfOpVq4h1p6z68e2ky1/WF?=
 =?us-ascii?Q?ljC6FQq0yBdenujRpOvNlYT5FQo361vVRvuVSQWo1Xo4Sec+rwwl+0uTdcXD?=
 =?us-ascii?Q?/avWvBMQof9DBF7WGwgw/bwyMgR41q04ZpO1EsHVWVykAm9YWBkY5sqR+yRZ?=
 =?us-ascii?Q?aBySkbHfE17MZS7DWx/HqSZ8MNnUT5JtPWuYRVU2/+QdEsHBHvTfYiV3QCdV?=
 =?us-ascii?Q?lkpviMuGVRrwjlse7mUFFI2gP5YffhmVMxHZEjVcqOZReDyb/vdntRI+eWUW?=
 =?us-ascii?Q?NasZKZAfyuc5VYlEVriu73I2x8MsmONvoSEhiuUCk5CuDfosiNFKshGd9yxI?=
 =?us-ascii?Q?KIMoAtV+PAaWIqKX0VO0AqpMlHeN9AB3c0v4CwvCTDqr2Ebap6MzTC6kln5g?=
 =?us-ascii?Q?Avh4HpipNNn3kyZg5l2ULsxeYYcTZCMY4MY83AjMRdOrTLF4kzm72iMx0EUw?=
 =?us-ascii?Q?8KBqKNfx/VtYZFyb8LpyD2LsW30eF00OhHd89bE6UXHVAa5EK/TDDexl/eC7?=
 =?us-ascii?Q?9ES0VJ4gCQ6JWqJuHZ/t08yzsxKl4EW5D51M8DKdkeu7KDwVbRwZv6rruf90?=
 =?us-ascii?Q?zsrx3mK0sObMgQXDpvCiNNoXK399sXpzaxGt3/x1Dql6oSkASTRYC2atzKic?=
 =?us-ascii?Q?C2zgNYvQEFtNf6NTeitF4MAzXDeR94NSk4WagAt5HfTAc6ocVQCrqPvF8q4T?=
 =?us-ascii?Q?nTB6jQ8fPT3194lRr1l7IPHAEBW9Q5cTf5A7QwgLY/re0YpHB0cgLDw95adR?=
 =?us-ascii?Q?SuExHuoK7gj/FACDRteoESS7qj0RtAELg/tLQHIkA6dcW3A2IQ1xrOTBd0A+?=
 =?us-ascii?Q?L5QpkNfQLkYgWrUjpplaXoirYUZ1+a2RaFEFqjsGnZp3NhrJ3Tsg28wzYo6/?=
 =?us-ascii?Q?eEs1bOJYwGP4f5Z78dSrm29FwUe/KQK1exj10gEPdak2QdwaeFbcXQdF8jOa?=
 =?us-ascii?Q?+GCO2qM0khkmOp/xgV+niy3xkSjGOTfc+4AZXaXIN9SaNMt5ZIE3bzpznZy1?=
 =?us-ascii?Q?7C+G7/lOU/G03pbgmqj1zndkRA44XLPPpKSxsRKhZDZKq8+wdeEba+qXHkVO?=
 =?us-ascii?Q?y9dolyCUXz1dqOTuv6RCTSZ/Otj8zz78sX7BtNv1TlbxYNDObzh8NdtbLe/4?=
 =?us-ascii?Q?dmg6IvLn+OFIMfLM8b5dVZjYoRyWPeEmtoa7rUhufpYj/Z5e7bpg/M0BUtcT?=
 =?us-ascii?Q?QoV2Ii64RJDmb8WmdbnIQNlco3l3e2c83YAQMq6UhtVS9o44EiILmDg8DWzC?=
 =?us-ascii?Q?tR9Za/fqKzEMfIFkUffMAr3Zt9BhiMMYtiKjIpDAdjYEw3y9bJlOdqODvXp1?=
 =?us-ascii?Q?e96f+/NHNjclTp1aNkgrUcCispKUctYZe/ckuuuMrGa0LD9XST07YhEMo4wl?=
 =?us-ascii?Q?l4k5Tw7qgg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6670da7-e65c-4abf-9908-08da3a69e573
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 14:06:12.3131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mt/j61/+hYBLfFT+OYetP5T8RV6/4g09AkioVUQwEFYqr36qVB1vI6Lx3kMCv/f7jVp+R1l7FOjNgEprXhqLVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3792
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
Cc: Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.05.2022 15:33, Chuck Zmudzinski wrote:
> On 5/20/2022 5:41 AM, Jan Beulich wrote:
>> On 20.05.2022 10:30, Chuck Zmudzinski wrote:
>>> On 5/20/2022 2:59 AM, Chuck Zmudzinski wrote:
>>>> On 5/20/2022 2:05 AM, Jan Beulich wrote:
>>>>> On 20.05.2022 06:43, Chuck Zmudzinski wrote:
>>>>>> On 5/4/22 5:14 AM, Juergen Gross wrote:
>>>>>>> On 04.05.22 10:31, Jan Beulich wrote:
>>>>>>>> On 03.05.2022 15:22, Juergen Gross wrote:
>>>>>>>>
>>>>>>>> ... these uses there are several more. You say nothing on why
>>>>>>>> those want
>>>>>>>> leaving unaltered. When preparing my earlier patch I did inspect t=
hem
>>>>>>>> and came to the conclusion that these all would also better
>>>>>>>> observe the
>>>>>>>> adjusted behavior (or else I couldn't have left pat_enabled() as t=
he
>>>>>>>> only predicate). In fact, as said in the description of my earlier
>>>>>>>> patch, in
>>>>>>>> my debugging I did find the use in i915_gem_object_pin_map() to be
>>>>>>>> the
>>>>>>>> problematic one, which you leave alone.
>>>>>>> Oh, I missed that one, sorry.
>>>>>> That is why your patch would not fix my Haswell unless
>>>>>> it also touches i915_gem_object_pin_map() in
>>>>>> drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>>>>>
>>>>>>> I wanted to be rather defensive in my changes, but I agree at least
>>>>>>> the
>>>>>>> case in arch_phys_wc_add() might want to be changed, too.
>>>>>> I think your approach needs to be more aggressive so it will fix
>>>>>> all the known false negatives introduced by bdd8b6c98239
>>>>>> such as the one in i915_gem_object_pin_map().
>>>>>>
>>>>>> I looked at Jan's approach and I think it would fix the issue
>>>>>> with my Haswell as long as I don't use the nopat option. I
>>>>>> really don't have a strong opinion on that question, but I
>>>>>> think the nopat option as a Linux kernel option, as opposed
>>>>>> to a hypervisor option, should only affect the kernel, and
>>>>>> if the hypervisor provides the pat feature, then the kernel
>>>>>> should not override that,
>>>>> Hmm, why would the kernel not be allowed to override that? Such
>>>>> an override would affect only the single domain where the
>>>>> kernel runs; other domains could take their own decisions.
>>>>>
>>>>> Also, for the sake of completeness: "nopat" used when running on
>>>>> bare metal has the same bad effect on system boot, so there
>>>>> pretty clearly is an error cleanup issue in the i915 driver. But
>>>>> that's orthogonal, and I expect the maintainers may not even care
>>>>> (but tell us "don't do that then").
>>> Actually I just did a test with the last official Debian kernel
>>> build of Linux 5.16, that is, a kernel before bdd8b6c98239 was
>>> applied. In fact, the nopat option does *not* break the i915 driver
>>> in 5.16. That is, with the nopat option, the i915 driver loads
>>> normally on both the bare metal and on the Xen hypervisor.
>>> That means your presumption (and the presumption of
>>> the author of bdd8b6c98239) that the "nopat" option was
>>> being observed by the i915 driver is incorrect. Setting "nopat"
>>> had no effect on my system with Linux 5.16. So after doing these
>>> tests, I am against the aggressive approach of breaking the i915
>>> driver with the "nopat" option because prior to bdd8b6c98239,
>>> nopat did not break the i915 driver. Why break it now?
>> Because that's, in my understanding, is the purpose of "nopat"
>> (not breaking the driver of course - that's a driver bug -, but
>> having an effect on the driver).
>=20
> I wouldn't call it a driver bug, but an incorrect configuration of the
> kernel by the user.=C2=A0 I presume X86_FEATURE_PAT is required by the
> i915 driver

The driver ought to work fine without PAT (and hence without being
able to make WC mappings). It would use UC instead and be slow, but
it ought to work.

> and therefore the driver should refuse to disable
> it if the user requests to disable it and instead warn the user that
> the driver did not disable the feature, contrary to what the user
> requested with the nopat option.
>=20
> In any case, my test did not verify that when nopat is set in Linux 5.16,
> the thread takes the same code path as when nopat is not set,
> so I am not totally sure that the reason nopat does not break the
> i915 driver in 5.16 is that static_cpu_has(X86_FEATURE_PAT)
> returns true even when nopat is set. I could test it with a custom
> log message in 5.16 if that is necessary.
>=20
> Are you saying it was wrong for static_cpu_has(X86_FEATURE_PAT)
> to return true in 5.16 when the user requests nopat?

No, I'm not saying that. It was wrong for this construct to be used
in the driver, which was fixed for 5.17 (and which had caused the
regression I did observe, leading to the patch as a hopefully least
bad option).

> I think that is
> just permitting a bad configuration to break the driver that a
> well-written operating system should not allow. The i915 driver
> was, in my opinion, correctly ignoring the nopat option in 5.16
> because that option is not compatible with the hardware the
> i915 driver is trying to initialize and setup at boot time. At least
> that is my understanding now, but I will need to test it on 5.16
> to be sure I understand it correctly.
>=20
> Also, AFAICT, your patch would break the driver when the nopat
> option is set and only fix the regression introduced by bdd8b6c98239
> when nopat is not set on my box, so your patch would
> introduce a regression relative to Linux 5.16 and earlier for the
> case when nopat is set on my box. I think your point would
> be that it is not a regression if it is an incorrect user configuration.

Again no - my view is that there's a separate, pre-existing issue
in the driver which was uncovered by the change. This may be a
perceived regression, but is imo different from a real one.

Jan

> I respond by saying a well-written driver should refuse to honor
> the incorrect configuration requested by the user and instead
> warn the user that it did not honor the incorrect kernel option.
>=20
> I am only presuming what your patch would do on my box based
> on what I learned about this problem from my debugging. I can
> also test your patch on my box to verify that my understanding of
> it is correct.
>=20
> I also have not yet verified Juergen's patch will not fix it, but
> I am almost certain it will not unless it is expanded so it also
> touches i915_gem_object_pin_map() with the fix. I plan to test
> his patch, but expanded so it touches that function also.
>=20
> I also plan to test your patch with and without nopat and report the
> results in the thread where you posted your patch. Hopefully
> by tomorrow I will have the results.
>=20
> Chuck
>=20

