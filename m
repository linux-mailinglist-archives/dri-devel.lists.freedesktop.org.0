Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A487464AB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 23:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C3310E0DF;
	Mon,  3 Jul 2023 21:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR02CU006.outbound.protection.outlook.com
 (mail-eastusazon11013013.outbound.protection.outlook.com [52.101.54.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DA610E233
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 21:07:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KruNppnviIkt0e8Mv9adSJU8mqtlh00ySYZjTR4HVgrMmbKtm26UFH5swBW9/bJcZp40w3hFADau65iEoofVZJu2guaTwzUBYUmVhkYzHbAsLkZzsp0+VlL2FSiBaKGSGFgzV3/4Gql8580tUAOfX/I/piHPTlQwLqyCZbWYexP2JhBQCG0NDmpn8MRdczhpkA4hmMgZRrNtFOEQ3Es4oubGwReQn4LXUbbb4HI0+LbO2hQ5PrdTqg6v2/omnm+4pOTqZOspepeEwZyAfrnTAsIKlOmiIvS4D+T2sSBZLh70l2yJURDYhqeUM+b0S8xCLKXmXTMyB2RYKTs+MrO11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPHaPYsp/Sgz/pvF/VoeSlqrmO1kc9AgFvEbCXVl95g=;
 b=VqdqjvFIxh90hF8vnWfKcH8w/A9mY2K/QqJeRhn0pj6NyMn2bJYFaf3HrwTGWJLn+yB9iVSLc4JTLchaBx6MxeGSCwnTJhYW1XZ1OZ+VER0nhzRJsntRKiKrVe1oXmIficK38xr/By65gkieRDIUntjk3xHzIlH8d0PLsuWJ1iwSUN40glLYnewiy7md+RA7Crnm0TDweL/KNpk75cGDOTXkASgavMeYSgvwzqZ4xIoA7zwMtz9Zf1qR97TVb16FAcnpB6nxFKrikQqO595Zf3/HA0YfTj9VsbiqhFiwqfoyDiaQq1Wt6foeNYMBMT3Jo2j55Q+XXw4SLop6WXaXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPHaPYsp/Sgz/pvF/VoeSlqrmO1kc9AgFvEbCXVl95g=;
 b=x4EsBoShVZ0DDxRueLF5lI1LUz6grHeblsJgSpAGg/wVJb/jbDrrsyZFC3lOZ8KpW7d/B9tNvDuPrLbpHLbX+74XviDRBVCToTnuMS37MWivD+addt3iDULiqJFUq8kPZ8i4TjwQ1aTznk018VXmvrAq9ipo+z4/dPRJxCnANSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from DM5PR05MB3371.namprd05.prod.outlook.com (2603:10b6:4:45::31) by
 BY3PR05MB8941.namprd05.prod.outlook.com (2603:10b6:a03:3b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 3 Jul
 2023 21:07:00 +0000
Received: from DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::5f94:a9ef:c567:e801]) by DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::5f94:a9ef:c567:e801%7]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 21:07:00 +0000
Message-ID: <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
Date: Mon, 3 Jul 2023 14:06:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, Zack Rusin <zackr@vmware.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org> <20230628104106.30360b55@eldfell>
 <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
 <20230629110348.3530f427@eldfell>
From: Michael Banack <banackm@vmware.com>
In-Reply-To: <20230629110348.3530f427@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0103.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::44) To DM5PR05MB3371.namprd05.prod.outlook.com
 (2603:10b6:4:45::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR05MB3371:EE_|BY3PR05MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1e7ca0-2247-4ca0-10f4-08db7c097126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AuetHUyHiFcPSINozvhLXX5eJ8ZMIEPwf06LHCP0Dbow3MTIPsV83IpZKlUgM2o2Vlzh/TYdw9KZfu6cTld1+VESWnm+lkKvpRQTT4Yjflqlklcwaw5TkWdDCFsH22YagmBmiwr81vpaOKw7aISYgM08ozI0L0vC5LCIvBGCJBn69xBjfeFp99zTkUJC6cxxkT2wE12rTsmfQWrd0CBJo6bAiv/eQpTYi+j+vJ4v4uV8KR9sXnA9GXoLAqcKNkTKzWRy/jkGOGiOwUQgFkVKoO7XNXyL5GJoXF/gcQDm/w+4hcK3rDDK7RiD+lid8H0zQ1g1E+L11bdVh0Aelsf7ttketAWYJWGThp68R5GXufonqcscpm43d916Xv/8oW/yA/b3sfNag9Zjipup+gwVa5G1lbOqZOnCvCQBsQtMmB4sCkfMIXmwNpw+ZMX59l67I7ZyzYHXGNTj2KwuEhwlRZrFGJR6YThnYAwtnufdQKlzrcfNB+OcGJEmqfJW5tOXsdQLcRsrJfKgKVVdticaJ/GDfbHSDGSEgl2wGpn6/nWnWM5MFu957fiqt8zfohIIPUUatvBt81zqTsjudjDmpk1WJ/524+CcjHFyFn6kzb6tEkqen/Nxmv4KnWEtv0EaW2ztyQOjCFD+cNSL74UlSUkmvuTaSfhT9ldNA8sP/1UfViPVN3M4NFBTRcHEuIQVOi2yH2zDUza9oZXrRFnM6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR05MB3371.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199021)(31686004)(6636002)(6506007)(4326008)(53546011)(66946007)(66556008)(54906003)(66476007)(110136005)(478600001)(6666004)(36756003)(31696002)(86362001)(26005)(186003)(6512007)(83380400001)(2616005)(7416002)(8676002)(316002)(5660300002)(6486002)(2906002)(41300700001)(8936002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2xVZlV0a0dWU0ZrQlkrNktYT0xQaEF3Njg0V1NzK1UrUFlOUUF5aXRoWFpI?=
 =?utf-8?B?ZmFmblhQSkg3QmNVK0RiazRVYXVySmYxdHBqRDZ6SEVuQ0pMTGpPbzVSNUlZ?=
 =?utf-8?B?TUM2dHdTRE5EUXVteEh5TDN5bmpYaW1hNXZjc0s0blpBY3V4N2hyeVJQQmVn?=
 =?utf-8?B?Z1djTGhPVlM1L1NTYzRDdW1LZ01KN3RqNmJwUU0xMlJMUjdpRFp6YXJ4Mnho?=
 =?utf-8?B?bSsxQytvM1RuWUY1Z0gwRFdZZmtvOTlUNk5ZSmR6VHNZYzZjOStPY2d1YzFu?=
 =?utf-8?B?eHRRdUkwY2hQS2pNa0pVa0FoSEZZaWFmQ1puUHNZT1p3OXhKVk83bWNGdUFw?=
 =?utf-8?B?dlY5OGxXNDZMMlhReTBWRXZEdTZySWhBQVRBNWlGbk9ucjZFUHZWOE9TRTBz?=
 =?utf-8?B?RWI1NzI2aDN3VnQ3VFB1NUFjMjVFK2hobXZHdGs5ZFBVNHZwQjQ5VE5waVJW?=
 =?utf-8?B?YVlmQzhqUTdIc1BRZHB1dVRQNjNhZ1loeUlodm9CVTJjSkVmaGNucUpsa1hD?=
 =?utf-8?B?NWRtS0o5UlkzV05uVjJlM0JSYXVxS3I2N0JySlh6cXlLTUYwb3RtSTExVU9i?=
 =?utf-8?B?enl3TW1yMWlVVnZOeTVIalVyWFB4VlJ1bzR3TVp6T1MzWDlGWCt1Z1kwdFda?=
 =?utf-8?B?bVRGMURaMW1KaklhQTNHbzhYalJuOFpObXlFOWt5Z1FiYlBMNlFSdFRCKzdm?=
 =?utf-8?B?SkZjZ0dpa3JwVm9HNURWRE5xbkpaNzl2OG9qam9jNk5vSUFsd3lXWVcyRlJY?=
 =?utf-8?B?ODU5YkRoY1RmVThHdDNxS1ZHQXJ6K21lNjRFUStzSzdHejJZWFowNjQ2YjYz?=
 =?utf-8?B?K1ZQZ29TMXdjR2tUQjAvWDEvVmY3RXlrY3R6cGtuZjRTVEZNU1dEdERicVh5?=
 =?utf-8?B?U1VJM2J6Nm5COGUzMkZIZVNpMkFpVnJEbEpJbDVVWVhmZWhvM1ltdXlzZ1Fm?=
 =?utf-8?B?UDdjdW9ickZndjlRYWNXcEEzSERpNlcwbUJSN21VcWwzcVNlSFhGOTRWRUJB?=
 =?utf-8?B?QU5xMTlHTW9od1JUOXhZcytVKzFpMmVGcThtNHd2Z1BDaVU3TkYwNE1Da0Zz?=
 =?utf-8?B?NlVoRjFEMjVhcmoyK3FEa1hMdFBiV016UkJBNE1mMHR5bzlRLzJKSVJESG1K?=
 =?utf-8?B?R0x2UXJHTVJDMXVOL2pPc0o2MWtRaS9SRFZTUzNDRU52UVNIY2t6Und2WFdt?=
 =?utf-8?B?Nkw2L0sxQzArbWlBRkpoOEdUVFBQYXhrdTdkYVNIR29jTUJVRG9MMjZ2ZWJz?=
 =?utf-8?B?UmZlYlNkNjZqT2FLQkNRdklhM3FRNFBBKzlmcXY0cS9WdjJyMWdnRGxDT1pR?=
 =?utf-8?B?TUFNYzA1anRHSWIzZDVmOVpCQVhXTXUyS0RaNk5MWkNLK0E3WjN6STNSanlO?=
 =?utf-8?B?a2s0TncrSmsyN2FSS3oraXpPWVJLeStvUGJtUlpmRUFabHF5c1FvOFhHdEIw?=
 =?utf-8?B?L3BvVDNrd25Qa1FHRFRIRGJqNld1UGJuazJmUHFkNzBFZHJobDBoUTJRZUlI?=
 =?utf-8?B?VCtrVDZ2Y25FYVFQL29HK2RjS1hTTmxrbGcwWStMeTFzbVVOUzlVQWQ4R29p?=
 =?utf-8?B?dlJYZEZ2cHVBK0g2ZkhTd0g3QVNxRmUrZndZR2JLUnRmckx3MWxKZ3Q3ay81?=
 =?utf-8?B?VU9nTW81WTF2SjRGQlJrclVROGZyK0V3TTBTQmtoUmlYOXZOU0V6NFZ5SURw?=
 =?utf-8?B?aUVUMENyVVNaWEZ3MU1MU3hmTHp1c3hTcUp3Y1RJUmh2VmF4MFJVRFE2UFhF?=
 =?utf-8?B?NXhuWjNpU0c4UTFZSmpaRlpjUUZsWlRPcG15TXZpODZxK2R0dUh0eVM3bHhN?=
 =?utf-8?B?QkF1V1d2Z2VZa1V3dDBEQ2ZCMFpSYUpVQS9qWEEwREVSWlNRbmxqTkxObm16?=
 =?utf-8?B?SFdCbnRqaEhrQldtc1o2b3pnVmtrVzhQUFJUeWVTczdNV0djNWZxcEZvL05Q?=
 =?utf-8?B?Wm1IbjNkOHJuTjRiU1d0L051R3VGNmxacTVrWkNaMmsyTjg4bmQ4NTY4OTlW?=
 =?utf-8?B?RnJiVXVvYXhnbnlNbHl0VUhsc1pUY25mSUdFZS8wUGMybVZFbDVhVVZ0dEJQ?=
 =?utf-8?B?aldHOVEwN0dkRWlCTDJwN3E4MmVYSnV6dWxoRTRtNTdVTUphcnI5TVl3TFd3?=
 =?utf-8?Q?jFzrcvBVpYtuYhce76ofN9dqT?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1e7ca0-2247-4ca0-10f4-08db7c097126
X-MS-Exchange-CrossTenant-AuthSource: DM5PR05MB3371.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 21:06:59.9747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/+WnfN3K0/SZm2Zw3sXkMMlBloqU1OBhRAGDRd4KAISmQ+RB4ZY7CxzhNtEDSWUnp1cwofdAIbYxgVTUXeuWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR05MB8941
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>, "zack@kde.org" <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, I can speak to the virtual mouse/console half of this from the 
VMware-side.

I believe Zack's preparing a new set of comments here that can speak to 
most of your concerns, but I'll answer some of the other questions directly.

On 6/29/23 01:03, Pekka Paalanen wrote:
>
> Is it really required that the hotspot coordinates fall inside the
> cursor plane? Will the atomic commit be rejected otherwise?
Most console systems require the hotspot to get within the cursor image, 
but in theory it's semantically meaningful to have it extend outside the 
image.

VMware's clients in particular will clamp the hotspot to the dimension 
of the cursor image if we receive one that's out of bounds.

So I would assume the right thing to do here would be to allow it and 
let the clients figure out how to best handle it.

>
>>   *
>>   * This information is only relevant for drivers working on top
>>   * of para-virtualized hardware. The reason for that is that
>>   * the hotspot is fairly encapsulated in the system but imagine having
>>   * multiple windows with virtual machines running on servers
>>   * across the globe, as you move the mouse across the screen
>>   * and the cursor moves over those multiple windows you wouldn't
>>   * want to be sending those mouse events to those machines, so virtual
>>   * machine monitors implement an optimization where unless the mouse
>>   * is locked to the VM window (e.g. via a click) instead of propagating
>>   * those mouse events to those VM's they change the image of the native
>>   * cursor to what's inside the mouse cursor plane and do not interact
>>   * with the VM window until mouse is clicked in it.
> Surely the mouse events are sent to those machines across the globe
> regardless?
>
> The point I believe you want to make is that in addition that, a
> virtual machine viewer application independently moves the cursor image
> on the viewer window to avoid the roundtrip latency across the globe
> between mouse movement and cursor movement.
>
> Why is the locking you mention relevant? Wouldn't you do this
> optimization always if there is any cursor plane image set?
>
> Or if you literally do mean that no input is sent to the VM at all
> until the pointer is locked to that window, then why bother using the
> guest cursor image without locking?
>
> I suppose different viewers could do different things, so maybe it's
> not necessary to go into those details. Just the idea of the viewer
> independently moving the cursor image to reduce hand-eye latency is
> important, right?

Yeah, the discussions of "locking" here are more implementation details 
of how VMware's console works, and while  there are other consoles that 
work this way, many of them don't.

So it's probably more confusing than helpful without some more 
background that the other layers here don't need to worry about.

The main idea is that the client needs to know where the VM thinks the 
mouse is to determine whether it /can/ safely accelerate it all the way 
through to the client's cursor stack.  If something else in the VM is 
moving the mouse around, like an additional remote connection, then the 
client needs to fallback to an emulated cursor on the client side for a 
while.

> The question of which input device corresponds to which cursor plane
> might be good to answer too. I presume the VM runner is configured to
> expose exactly one of each, so there can be only one association?
As far as I know, all of the VM consoles are written as though they 
taking the place of what would the the physical monitors and input 
devices on a native machine.  So they assume that there is one user, 
sitting in front of one console, and all monitors/input devices are 
being used by that user.

Any more complicated multi-user/multi-cursor setup would have to be 
coordinated through a lot of layers (ie from the VM's userspace/kernel 
and then through hypervisor/client-consoles), and as far as I know 
nobody has tried to plumb that all the way through.  Even physical 
multi-user/multi-console configurations like that are rare.

>
> Btw. for my own curiosity, what happens if there are two simultaneous
> viewer instances open to the same VM/guest instance? Will they fight
> over controlling the same pointer?

I can't speak for all consoles, but VMware at least uses a bunch of 
heuristics that typically boil down to which mouse input source has been 
moving the cursor most recently.

--Michael Banack
