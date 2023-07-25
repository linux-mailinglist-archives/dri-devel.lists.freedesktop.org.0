Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D0C7623D2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 22:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB25810E408;
	Tue, 25 Jul 2023 20:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C199310E407;
 Tue, 25 Jul 2023 20:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1T6VPBeaM1JHWtLPdJNgrvi5eiGg1jZdzyc1JdbI8YwWQ/XHK/uxW8e7ff8SkwQDjON26QbaGTsw4MAFrIz8PfPaNDIAYxT7JzrbypQPx1LA0Tlofc7kAYfOoycMr6gMX+TOWag/iCacAOyildvcqfOErqA6KRvla88ei/2nwZAv/6vUyhn96hkAF3249H0TIWFNhoh7ZHtN4wqWUtczHPS1Lj7PB3qzmmJtivxUS05U973SgF8PCQLiKutZYCSvCDNxBH1pD+ApJrVPqKoRgSXrfG3Yb4heIHHzh/T9B32NzmyqwKKQgBSAalxRNDsWNxbo228V2cXgOuEW2VW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6k4EUt8qHCAK9dvSVnWkfkvSJXXZKggAUGnJG3EkyI=;
 b=OhGX+UPQtounqkMU9m5oCLfMZ+asuYlYP34luvG+r4Cu6YNTQYe4E+ba88BeOF0qZ8rkZn4pXEYUtk4q8XxyDE1saw55YFim/mYIkvViKgm173mm6PAwtdjk0I0FHvpzOqkNqkV8KQhxBkhk7kSd6AFcRCKXCDakJI/zk52IKeuKt2jHQCOcL+I5J7PNSQIpKeb0GzcUAf34IrzK6E2t37qSiEI3Afe98N6ZiLbDhmDzVCoqN6pdjPj9Ddve/nHAWdGpCsD2jT4y9SWCSrjegf/t0416R/4STExjtM0TkJEjET9p32kwk7CoAn3GGLUWQMnhkEcwt9i7V6A6Y9Xd1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6k4EUt8qHCAK9dvSVnWkfkvSJXXZKggAUGnJG3EkyI=;
 b=wJ1Qj0a1DafLSiz6bily1OGROkK62ApkfOpgHRChb7XMbqTM0xvcBptnKpIp+rU5Q8eohkt3BUbTPepF44Rjxo/eekBDFX0MUxiugTEKeHfMYkEt3BV4O2oXqVj/A3n4IpduB06hkdc9HC84TTUDjU/BzpjljBMHbUNunTfZzJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH0PR12MB5299.namprd12.prod.outlook.com (2603:10b6:610:d6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 20:44:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 20:44:36 +0000
Message-ID: <1f4c1c2f-ba17-63fb-2f55-9265cc3d31fb@amd.com>
Date: Tue, 25 Jul 2023 15:44:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V7 4/9] wifi: mac80211: Add support for ACPI WBRF
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230719090020.2716892-1-evan.quan@amd.com>
 <20230719090020.2716892-5-evan.quan@amd.com>
 <9b1f45f9-02a3-4c03-b9d5-cc3b9ab3a058@lunn.ch>
 <7d059aed-fac0-cdcd-63d5-58185bb345db@amd.com>
 <DM6PR12MB26196A993B3BA93392AA0FEDE403A@DM6PR12MB2619.namprd12.prod.outlook.com>
 <d4cfbbae-9cd0-4767-8c80-ec09d1dbaf9c@lunn.ch>
 <6aa9061b-1702-b8f2-9cb8-982895b9def4@amd.com>
 <5e92b45a-d99b-4a8a-9987-46c75a5fcb3c@lunn.ch>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <5e92b45a-d99b-4a8a-9987-46c75a5fcb3c@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:610:b3::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH0PR12MB5299:EE_
X-MS-Office365-Filtering-Correlation-Id: 27918d82-8500-4a0d-5135-08db8d4ff59e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJVZxhRVqmI14EhjWYD10LCIrFqyHoXDoB0Vu6qlQCqrY8hE6AKErxnS3ahYJ+68Zl8LEXleFw0jX2yaGM45q2Rf3PnbdN1ls1HfApMSezQNIjJKjp+hMZ1tAeSr5jegN5HBiVGEuzQ16S+YNLMlwlN6+qD7CXY78wlzqIvU5+XfPWF9sC223VbATbaTkzK7vGrDQHtN6RS7jepIFeIxiGTNvCoZhh9qSzJKPdBgGvbgcMBM3E5iUfMLClpZ/etfg47oHrTR1IYpt7F4kUl3g2uzxdwh33cmROWWjCZWYmD+1DdAaAyHHGFktK2ySicU7oGPODpnUcL3Unfd039fZXJNnxTEuI6VnX3M0U0E1wQxpVUBKfy7eJFUVx7efjuYRdH3ZQJM/pUstdYl3Cv6bxXOnjoLaUzShgR/BamriPvOdA4WqQ1ZszKE5ayz0Lrhn2SHZ4pfSWuhpPJl0iUeM0cP2o+OYigZIYQhPkN2EafcCkCU9/b3CwC9H8HmymxuMWOKLLyWQj2X3GKuvWs7vhr/loFRzXxzz0Yl3StWUgtzJArqao/oYEkcOquFFKJe87HFBDlyKRHByq66Et8SDhu1JegSfqHA173R6SEjkiKmOoQOCSPiXirly61jyDZTmd2wc+rSsjbI+k2gtxhAIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(31686004)(7416002)(44832011)(8936002)(8676002)(5660300002)(41300700001)(316002)(6916009)(4326008)(54906003)(2906002)(66476007)(66556008)(66946007)(6486002)(6512007)(53546011)(478600001)(186003)(6506007)(6666004)(31696002)(86362001)(36756003)(2616005)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vjg1SnhFWVRUQk9wODFuVDNUMlpqOEp1aklBeloyMVd6ekNQNnZPOVpIMFBt?=
 =?utf-8?B?ZXkrbitNL2ZnVHdwNWNJbjc4YUhGY0pmT2JOUjhPWVB2NGxSeE1IU0V4Q01H?=
 =?utf-8?B?ZG9JeTViWmNUeXJrd2h1bVJIRVJtbGdIazRLVmVsakI0d3lYMWp2Z0hEaTFH?=
 =?utf-8?B?ZFdGcThGVHNQYU10TmtmQVk5TytMbFRncjZxSVNNRnlVcU9YczgxYlIwZGxN?=
 =?utf-8?B?d21rOVJFZHpSNU9nOGdEOFBpQnJRWEpMcVo1VE9BRzBmZDJYc1laVEthZWtX?=
 =?utf-8?B?d2l0bGpKbkt0MFhhbEU2dG5pVHBhMFZWMk9WNnZJQjI2N3gyVjZsQnhlUWhj?=
 =?utf-8?B?Y0E5dnJkNHY2TERpN3ZxTVFvNmMzSlpEMHJBeEJKdU9jVjAwS05rTTlITjNq?=
 =?utf-8?B?emtUM0FWcTNEME42eFdJaTFzdGlHTlkyTTNCNXFBVjYvZnA3SjlFWXpyTnFu?=
 =?utf-8?B?K1Y1S3A0RjZoNnN4Q1lFWkdXT2FYS00xblRQcnlOdE5aV21sUEVnUmV2VHdx?=
 =?utf-8?B?QmZuVE5rc2FmcFFaWEh3bHpWL05pZlphMFh3Y0VOWngyTCtGQmExUitmYVg2?=
 =?utf-8?B?Q1hmdDFHOW96U2RXa2Q4Ym5CUy9pNVhiQ2c2ZGF1QzY2Zk41TngxbVVBZ2J6?=
 =?utf-8?B?WUU2djE5TmE5US8yQndqVko1NFBzeW1MdmxXSUhIejJxRjhJWnRlL2pOWVZM?=
 =?utf-8?B?YkVVWExFU3VkZlNNNWVvWHhNTGRZYnBHcHhTR3AwQTY3MHo3S0NHMmgvWEx5?=
 =?utf-8?B?Q0trc0xKVWZoaEtJN240cm5UT2xQSHpEZUhBTm5Kcy9RRElMcnZGZTR2L09o?=
 =?utf-8?B?WmtIL0EzL1NOdWh2bW9RZitaalhPUjRBVWh0bnUxMWpPeXF6TEVtRWpWZWl1?=
 =?utf-8?B?ZS9QdVdWbUNNRHNUSXRCa1RYK3lVVnhGbS8xeTdpRU1vb0xuNkVpaXZsSTJ2?=
 =?utf-8?B?YmkxMWRBaXdKWmZSL29aa2REOElZNWVOcWlFZEtab3BWVDlSZk1BY2RjY1U5?=
 =?utf-8?B?bE5DOXJLNmk0U3l2R21zQXpoQUpqRTI1YXpHOWJPbjZJNFdBWWlESW1ldU02?=
 =?utf-8?B?TUMrQnRaenplWUphTmJFc1ltSVpZemF2TnlTNXpNL1NPZEZmaTI4RWFpeHpC?=
 =?utf-8?B?L0sxVS9LMXpmeVlNVGhMRjl3MXMvTHJQalQ0NG01ckMvbDZHUXdTZG5DSjNO?=
 =?utf-8?B?L3VrVVhSM0tMREVOWWtJdU51d2JaT1dPMmpQbjJGZVBNY0Y0WTBsRHdVRVh3?=
 =?utf-8?B?ek04NWZ0eUVvUUFYZDFlMEZOMldwV09RZXJvMFp5bmltWVZjL1kraGhLTksv?=
 =?utf-8?B?c0ZiQ2RyeHZsb2d4SncvMG02dUNsb290ZmVkRkJCdkxiM3NuRkxJNkFIczJY?=
 =?utf-8?B?Z2VvTlczYjRXYS9TRjQ1eEdvTHdHbzlrMzNmNnliRk53MncwSjF3dEdERzZu?=
 =?utf-8?B?YmR1ZWRvcGg2b0NncEc4aUVHdkRqbUxKalVpNnl3NG5Gc0NSUzNZTzZsQU05?=
 =?utf-8?B?OUVMY1Zmb29VV1puSWRmQVp6TENISHgyYmxPa2ZXM091cVFaL3BDM2VEMHVO?=
 =?utf-8?B?cEQ4MkQ4aWRSZGVUUE9zcDV6NnR2VTVJZFFkT3ZaVGlkcE82c1lySGI5V3VD?=
 =?utf-8?B?S2Z6eTQ2c2l1VkVObTg3MEhmVkh0dkpHT1B6UmFocHlLSWpJSnkrRDRVank1?=
 =?utf-8?B?UFFRUm0veTlRbFV5NkM4bkNzckE1dVhabmZqL2xMVThnQlQ5OFNUeFRoVFE1?=
 =?utf-8?B?UWEzRHdKZTF4bHBTSkN3SnVmbzFzelgrdWRuNXU4NVVoZy80aHhJUWJwbTdq?=
 =?utf-8?B?NVJ2TmhHTmg0cUY1MEpCQ0JjMzA3d0thUFcvVTBJeEp1aC9zRlBIQjJuQXhr?=
 =?utf-8?B?UW1qR3diNk1xazlCY1lEQjBucjZDQXZoaGxFS2xXNXc5V3hVNStsRURnV0Fw?=
 =?utf-8?B?NkNWa0FvSkxFclM5Zm0yR0ZidnlkMXRabkpiRzhmYUpPSFZ2Y0ZFMHNxNnBP?=
 =?utf-8?B?L0Q2Z1lmYVNXUWt1NHJSOU9FZlBHQ2I3RjZBQUpOS05FVXZ2WlhVUDZ6RjJQ?=
 =?utf-8?B?L3NwVVBlcUhIY2U2bC9uQ2NQYnpPM0hpS2FkWDU2bWxZdUVPMFRjT2NMV0pQ?=
 =?utf-8?B?N0ZUL213WUZyNUx0ellsNHhMMDB0eU8xaExLMlI0aW1PQW51d3oxR3ZIR0dm?=
 =?utf-8?Q?FBE63AEvA1/okTCl0B6KovtDJoFVOathJgzG6KCrkUmN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27918d82-8500-4a0d-5135-08db8d4ff59e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 20:44:36.7004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTwf2cy+6E6r2v2Ddk17agf6nop5w0Es3i+trTK1DDcoLY1+HPcH32dlmJ7AVivoc5dqUeOsJqFD7FiGi8KzXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5299
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
Cc: "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "trix@redhat.com" <trix@redhat.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "Quan, Evan" <Evan.Quan@amd.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/25/23 15:09, Andrew Lunn wrote:
>> This comes back to the point that was mentioned by Johannes - you need to
>> have deep design understanding of the hardware to know whether or not you
>> will have producers that a consumer need to react to.
> Yes, this is the policy is keep referring to. I would expect that
> there is something somewhere in ACPI which says for this machine, the
> policy is Yes/No.
It's not yes/no for a "model" or "machine".  It's yes/no for a given 
*device*
within a machine.
>
> It could well be that AMD based machine has a different ACPI extension
> to indicate this policy to what Intel machine has. As far as i
> understand it, you have not submitted this yet for formal approval,
> this is all vendor specific, so Intel could do it completely
> differently. Hence i would expect a generic API to tell the core what
> the policy is, and your glue code can call into ACPI to find out that
> information, and then tell the core.
Which is exactly what wbrf_supported_producer() and 
wbrf_supported_consumer() do.
If there is another vendor's implementation introduced they can make 
those functions
return TRUE for their implementations.
>> If all producers indicate their frequency and all consumers react to it you
>> may have activated mitigations that are unnecessary. The hardware designer
>> may have added extra shielding or done the layout such that they're not
>> needed.
> And the policy will indicate No, nothing needs to be done. The core
> can then tell produces and consumes not to bother telling the core
> anything.
>
>> So I don't think we're ever going to be in a situation that the generic
>> implementation should be turned on by default.  It's a "developer knob".
> Wrong. You should have a generic core, which your AMD CPU DDR device
> plugs into. The Intel CPU DDR device can plug into, the nvidea GPU can
> plug into, your Radeon GPU can plug into, the intel ARC can plug into,
> the generic WiFi core plugs into, etc.
It's not a function of "device" though, it's "device within machine".
>
>> If needed these can then be enabled using the AMD ACPI interface, a DT one
>> if one is developed or maybe even an allow-list of SMBIOS strings.
> Notice i've not mentioned DT for a while. I just want a generic core,
> which AMD, Intel, nvidea, Ampare, Graviton, Qualcomm, Marvell, ...,
> etc can use. We should be solving this problem once, for everybody,
> not adding a solution for just one vendor.
>
>        Andrew
I don't see why other implementations can't just come up with other
platform specific ways to respond affirmatively to
wbrf_supported_producer() or
wbrf_supported_consumer().
