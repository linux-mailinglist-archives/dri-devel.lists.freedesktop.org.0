Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6E47488DF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 18:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B1910E3A9;
	Wed,  5 Jul 2023 16:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU007.outbound.protection.outlook.com
 (mail-westcentralusazon11011001.outbound.protection.outlook.com
 [40.93.199.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457B210E3A0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 16:08:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEvyuzjjWYXTSMWCWWadCOuvKjKgFarVOFQJmzo0NOINvB9kkml2GKUP7IRpEUv//sBnn7V7gFs1jlllWYUEHnBkAZqCCxnKRcepuTAy+KhjUVMRwTsNsoj5bptaZOQQO2J39ZFo1CP+5VfTQ3SFAmsf/zxuoesDdqhi5arYEAuj09L+wsKpdZSPyNkV8hTpmud34bao2ki9CYVVKjg8hJ+iEUcFJI7mjUeOtBHnxwkrQDnkqXuRgwzxlxIF2nWL4igoGJGRcTneUFTZ7IDRThy3MA+b9OmP4czhlmhnSZvOU9UFKCbw8iDL6aOY3bk3AOEEWc/PdPJmPt8Uk2Zrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrdPM9s1XPILT3zU0q3UonwQPQ+/3h9NcsrT2iT4fAc=;
 b=KUE/a6UZ9u/MTVmeBNEIDH5xMgDFama6xhpbRdHpTjfYTWDYRYqXuimic/e0w1uKUdzTXjY0lk1+xFQSxzjFpu9+ocWfA6vIBv33rqWZh2vx5HEa8zrbSB/4Eu9p11G90AS2Y4IEw3fJj/tK2+Qvjxj8aeT2DlpSkOUSrhHJCAK01D1dGTkeWY4khjf1uuEqFEabg//r4fy6vqYVFk/4kje+uEwL+QsAR9gYV3GeRuzXXMRv4Cda+SAfw6KfEGCbTVN+dC0gWDGJPfwh7j6qhIVfLb/nFf7WtDtuk69vE0YdHlkMTGOK+u090co64BmQrqJtRXar1ZUfyoddR8Af3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrdPM9s1XPILT3zU0q3UonwQPQ+/3h9NcsrT2iT4fAc=;
 b=xWqzVXZklCdRYZFuZW4rcUdwv7VCjd0gHAwt5eG8wHAgrjBaUcOYdSdHIdJkE0latNoCP/Ey2NoyzIwwlLulIjgMTTFjvQ9bqsSfOL+D3hdFhyEzKSPAkbcJQZ4aUWoVATdleUzqmPZ40sXUJF/KMZvcXJ7BjMPTQzUOTkzQpLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from DM5PR05MB3371.namprd05.prod.outlook.com (2603:10b6:4:45::31) by
 SA1PR05MB7952.namprd05.prod.outlook.com (2603:10b6:806:1ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 16:08:11 +0000
Received: from DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::5f94:a9ef:c567:e801]) by DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::5f94:a9ef:c567:e801%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 16:08:11 +0000
Message-ID: <ce7754be-8085-ffd1-93f3-a774f7fcdb87@vmware.com>
Date: Wed, 5 Jul 2023 09:08:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org> <20230628104106.30360b55@eldfell>
 <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
 <20230629110348.3530f427@eldfell>
 <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
 <20230704110845.490344f5@eldfell>
From: Michael Banack <banackm@vmware.com>
In-Reply-To: <20230704110845.490344f5@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::23) To DM5PR05MB3371.namprd05.prod.outlook.com
 (2603:10b6:4:45::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR05MB3371:EE_|SA1PR05MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: bc190b12-4a55-4806-250c-08db7d7207a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f6U0jXYd0dXWhKy6k/DYyOdWuzT2ZcWtysLehyFlJvWgaPcz8Qb0kxEmxAGpHDl0N1HDOTY1ADcZ3XCh+fDlH2nPaOlSgzmXTIkqzi69shICkKvqpUj6BoDq33gBR1dbeo4tksCgvx3/motjcmwVXknOYCrrhVCFXByY4bx9s12GQhElQ2idN9BaF+NoyaqCBMkACOe6EzVj8oZbxGgY4Kn+i0THb0L5pFGkrS56/9ou0z1ImvDOZeASoo9vXjdBvdLD3Mnmztoe60GrKlm9amFPr/LyZW566NinAXTRdIl4Y0O0K/5hbPW7UakVL9f0J/WvmDP+2BtS48BkKdQCyhyUfWKgI+I58DuFa/PT0ObKLTmTpOWeEI3yKTY+XDtiFy97VEQx+LbinVkzip7v6Elg+NMwSwSiksw0HD6b3GU4xCVyugcXgl+sffUlMsEzHOdqMr5V/yQBpfaDtaulTV7i/9tKX8CWN6PNRi99ZRZRgytjiZ5bSyKKGVVI2ze7bF0HtDs/HryljjRR7oeL22/EYKX6FW5+oUPzCBDcMukh0COS8xxs/x4wDd9I8VOR6R8j2kzoxuOQFji6XoW+Jtt5XC7Rku+PYzbxOdUBIBcgd0fIwaLBUtABZDUn/puXKrQ6123Iv5hhZL0RKhsKcONcPF+qTBjkpzoZxM7xSFBwhxOP5VixaCxlYJKcjVJg+tm1YQQuPFuZwLAXX0rRIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR05MB3371.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(31696002)(41300700001)(86362001)(6486002)(38100700002)(6666004)(53546011)(83380400001)(6506007)(2616005)(26005)(6512007)(54906003)(478600001)(316002)(36756003)(66476007)(4326008)(66556008)(66946007)(6916009)(8936002)(8676002)(186003)(31686004)(7416002)(2906002)(5660300002)(66899021)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk5uMXJZOGxYWjhqQ1hNTUZkczhmbkJJalIySi9iYXZ0TVZ1bm9ESjhDaXFj?=
 =?utf-8?B?TVgweG5BU3J3TnI4NkIwU3dnS3BpQnhTbEhuQWorSm1BdGZ2eXF1Y3FYWm8v?=
 =?utf-8?B?OG5TbzFGRDZkQUJOa2hOMGZHTlRDK2hYc0RPdEhJcFZvVVhMM0pPVkNCOVNv?=
 =?utf-8?B?Y0xWeTJVamNPQzRvK211N0U4blpjbGRJUFhNL0Z1bHhUR0R5YVp1YVNmcnNI?=
 =?utf-8?B?eGY1M2dIV01WbXArR2dOb3QrZlJNZmJRY0ludFJFTWhhWlV2Ym44aGdQLzRw?=
 =?utf-8?B?bXlUd0RuSmszb1pyWW9EUC9jVTJqRE5KcEd6dHA1MEpLUm9ldXY1TlRoNitH?=
 =?utf-8?B?ZWxBNXRiUzRranIzSzBzNytnamZrSVQ2SS9zQnVkUkw1L2xtK0NqYlFTSmUr?=
 =?utf-8?B?cjFPTERxNzdCZVh2OUNlckYyNEhKSkFQMlRHb29YY1VzNkFqQnYvd0dHbFZv?=
 =?utf-8?B?TFY2OGJjOTA2M3QvOStxUE8yRTA3UkI5Zmo2VXRYWW9TWkJrcmpwTEk5cDM3?=
 =?utf-8?B?Yzc4Zk9ZUWVmWDZIT0RQYzYySFVzQXUvUGxGYjhPS2h5Ty9JVi8vYlV3eWZ3?=
 =?utf-8?B?a2RIQ1hUeU53ZlRzN3BtV1BKT2lKVldOa0k4VXBjVW82YURRWXBXNktEOUcr?=
 =?utf-8?B?Y2pqcVhYRWhUdTBvbHdnK2c0bVUrNXpnMkpsazBvT3lKcU1zMGdiL0NrUklT?=
 =?utf-8?B?NkUwRWxWMWo0d0N0VDFWQVVPMHl4elBGTTNhN3E1VTJQTTlpS2RWWkxrY2lO?=
 =?utf-8?B?QkxmTHNFRnI1L051S29MSk1TMGZEZG1mQ1JBSWtvSkdKQmFaZzNlNWplRENN?=
 =?utf-8?B?dlU1Z0ZNang3YWtjMXZkTEsrOG9sQ0lneFlUUGNtRThOWDBhUENlbWN0a2Vy?=
 =?utf-8?B?VFIxWDgrK1ZRVDB3WHBXZkQzcmY3OWgvZVJiWldiNnBlL0NVOHZEdk41QXBl?=
 =?utf-8?B?c1pEck9ZMWZSUDUvSXRkeDVSbzdtUXIvTTBhQ3UwMmhNZkRiYWYvMk4vZW11?=
 =?utf-8?B?aGJPaGZpdkhlQlpUalpVYm5WK3dYemhJa0YweUVjalBGRENTcnZxbldXV01L?=
 =?utf-8?B?Z2x5NlRnb1gvYUxkOTdxSnYzcUR6b0J2M0xITzdZb2VtMy9pZFZHeVZFWU9B?=
 =?utf-8?B?Mk01enhLUTVMWUg2WC9tSnkwR0dBU3dsenQ1cm53M3FHNmRoSVhLbzQwMDJX?=
 =?utf-8?B?bm9ranFEWkorZGZBaGhpMWJkaFZRKzI0aUJuV0laVEtUZkk5aWE2dUtpdWln?=
 =?utf-8?B?cUVpM3NSeDBVbXVQbkZYaDNLRitlOWkzRnJ2UysrZmljbW5POUxXdDd5Mk5q?=
 =?utf-8?B?Sy9HM0FHVjdjRi9OMmMyd0R4aU9EV09iOEVkU3VxZXdKbXYzTXh0WHZtQU5B?=
 =?utf-8?B?MThzWmVXcC9FbDVGYmNNdVl1QXlvQVZudHZiMk9VdmdhT3IwaEtoM3hLQkNz?=
 =?utf-8?B?SXZWU1ZHL1RxWEptd1p4dWkrWXlHRGpMNWhFcDNLUjVTbkF4QWZUUFZKb3Ba?=
 =?utf-8?B?N21VeFJpYlBJa1dZWjBHUUxIeWlRak01L2FjNUN0L1VyUTRIRStlWTcvMzYr?=
 =?utf-8?B?TmUrcVB5UHRkcjdaWXZqUGl6SGVpQytWSDBZc1Zud3ptT0dVYTA5OUxyZGRp?=
 =?utf-8?B?Z0dBczJVd3E0SGVYRjQ2MkllYVdzMUlCdThKbVk2b0ZScWNCL0dKbml0ZFlq?=
 =?utf-8?B?a3BHWWI3cWNycENuMG1sR3Rxa29UOGx6K0g3MlhRUEFaNW9JaG1uRVlDUnBn?=
 =?utf-8?B?Rm9RUUx3R29SZDduV2MrQTZrNElBbTBka0N2ZlcxcXgwS085QWpsc3FBTTl1?=
 =?utf-8?B?R3p0SGVwTXlMVnR1RjJVdHlPVGtoS1lWTlFqSWxhdHFFY3BWdnVCbzQ5TGlm?=
 =?utf-8?B?N01velpQUHVYVUt0M0JMNHpRalNISUs0cEgzdGU4SkxTaUhGRHdMMnFxS2Fy?=
 =?utf-8?B?enNvSkhOUC9VdmR1eE13c0NTZVBvQyswV3JLR0o3dWE2YWhickpadWpSN2Rn?=
 =?utf-8?B?V0dSbzZDdnFVSUlqQUdoRGhmOGZaWk4wUGQwUjFwb2tNVzV5bGs4NTI3aGRC?=
 =?utf-8?B?aFFnclM5aWlFT2JJM3ZEaTY5YlRvUlFiaG5JN1hxMld1WVh2eWgyRWRjRHBm?=
 =?utf-8?Q?6bgU9F4iK9hnr5hi8QHF9wsHw?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc190b12-4a55-4806-250c-08db7d7207a5
X-MS-Exchange-CrossTenant-AuthSource: DM5PR05MB3371.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 16:08:11.3596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtKhEzTsUyOZN5IHJlQQROM9+FbmKFYnRUA5cHCtPhSf2n76WRjkOgpvCHFCwYIXnNJnXRj7eyylj0juxaojKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR05MB7952
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>, "zack@kde.org" <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/4/23 01:08, Pekka Paalanen wrote:
> On Mon, 3 Jul 2023 14:06:56 -0700
> Michael Banack <banackm@vmware.com> wrote:
>
>> Hi, I can speak to the virtual mouse/console half of this from the
>> VMware-side.
>>
>> I believe Zack's preparing a new set of comments here that can speak to
>> most of your concerns, but I'll answer some of the other questions directly.
>>
>> On 6/29/23 01:03, Pekka Paalanen wrote:
>>> Is it really required that the hotspot coordinates fall inside the
>>> cursor plane? Will the atomic commit be rejected otherwise?
>> Most console systems require the hotspot to get within the cursor image,
>> but in theory it's semantically meaningful to have it extend outside the
>> image.
>>
>> VMware's clients in particular will clamp the hotspot to the dimension
>> of the cursor image if we receive one that's out of bounds.
>>
>> So I would assume the right thing to do here would be to allow it and
>> let the clients figure out how to best handle it.
> Hi,
>
> if it is normal that clients clamp the hotspot to inside the cursor
> image, then I would come to the opposite conclusion: KMS UAPI needs to
> require the hotspot to be within the cursor image. Otherwise the
> results would be unpredictable, if clients still continue to clamp it
> anyway. I would assume that clients in use today are not prepared to
> handle hotspot outside the cursor image.
>
> It is also not a big deal to require that. I think it would be very rare
> to not have hotspot inside the cursor image, and even if it happened,
> the only consequence would be that the guest display server falls back
> to rendered cursor instead of a cursor plane. That may happen any time
> anyway, if an application sets e.g. a huge cursor that exceeds cursor
> plane size limits.
Hypervisors are normally more privileged than the kernel, so any 
hypervisor/remoting client here really should be dealing with this case 
rather than trusting the kernel to handle it for them.

 From that perspective, we would normally try to preserve the 
application/guest semantics as much as possible, and then that gives us 
the ability to deal with this on the hypervisor side if it turns out 
that there's a critical case with the hotspot outside the image that we 
need to handle.

But that said, while I've seen real Guests do this in the past, I don't 
recall seeing this from any modern operating systems, so I don't think 
it's a big deal for us either way.

>
> What I'm after with the question is that the requirement must be spelled
> out clearly if it is there, or not even hinted at if it's not there.
Agreed.

>>> The question of which input device corresponds to which cursor plane
>>> might be good to answer too. I presume the VM runner is configured to
>>> expose exactly one of each, so there can be only one association?
>> As far as I know, all of the VM consoles are written as though they
>> taking the place of what would the the physical monitors and input
>> devices on a native machine.  So they assume that there is one user,
>> sitting in front of one console, and all monitors/input devices are
>> being used by that user.
> Ok, but having a single user does not mean that there cannot be
> multiple independent pointers, especially on Wayland. The same with
> keyboards.

True, and if the userspace is doing anything complicated here, the 
hypervisor has to be responsible for ensuring that whatever it's doing 
works with that, or else this system won't work.  I don't know that the 
kernel is in a good position to police that.

>
>> Any more complicated multi-user/multi-cursor setup would have to be
>> coordinated through a lot of layers (ie from the VM's userspace/kernel
>> and then through hypervisor/client-consoles), and as far as I know
>> nobody has tried to plumb that all the way through.  Even physical
>> multi-user/multi-console configurations like that are rare.
> Right.
>
> So if there a VM viewer client running on a Wayland system, that viewer
> client may be presented with an arbitrary number of independent
> pointer/keyboard/touchscreen input devices. Then it is up to the client
> to pick one at a time to pass through to the VM.
>
> That's fine.
>
> I just think it would be good to document, that VM/viewer systems
> expect to expose just a single pointer to the guest, hence it is
> obvious which input device in the guest is associated with all the
> cursor planes in the guest.

I don't have a problem adding something that suggests what we think the 
hypervisors are doing, but I would be a little cautious trying to 
prescribe what the hypervisors should be doing here.

I certainly can't speak for all of them, but we at least do a lot of odd 
tricks to keep this coordinated that violate what would normally be 
abstraction layers in a physical system such as having the mouse and the 
display adapter collude.  Ultimately it's the hypervisor that is 
responsible for doing the synchronization correctly, and the kernel 
really isn't involved there besides ferrying the right information down.

>
> Btw. what do you do if a guest display server simultaneously uses
> multiple cursor planes, assuming there are multiple outputs each with a
> cursor plane? Or does the VM/viewer system limit the number of outputs
> to one for the guest?

Zack would have to confirm what the vmwgfx driver does, but the VMware 
virtual display hardware at least only has one cursor position.  So I 
would assume that vmwgfx tries to only expose one plane and the rest get 
emulated, or else it just picks one to set live, but I'm not an expert 
on vmwgfx.

Normally we try to run a userspace agent in the Guest that also helps 
coordinate screen positions/resolutions to match what the user wanted on 
their client.  So when a user connects and requests from our UI that 
they want the screens to be a particular configuration, we then send a 
message to the userspace agent which coordinates with the display 
manager to request that setup.  You can certainly manually configure 
modes with things like rotation/topologies that break the console mouse, 
but we try not to put the user into that state as much as possible.  
Multiple cursors in the Guest display manager probably fall into that 
category.


--Michael Banack
