Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9526074B863
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 22:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EE910E07C;
	Fri,  7 Jul 2023 20:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU002.outbound.protection.outlook.com
 (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8002210E07C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 20:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZuW+nEsIV18bB9yzrLgYmoA70ncaU/JIjZ2cj0RA4oTwgiAYAkNxGBLjlU6LjgO4GBEf6WHgfIJIvpankveY0plfZf73wiA4ExCv0KWXum2S9AofC/jRCpkpaEl+T158dOmjjCNkZQXITC/0pkwCgY6yIRdCSNpumThWwsti3Ulmee4zXUZ9ApMQ46+NBrjNSj+oe03JL3iznB4Te4l4RPiawx4+WYVi5HB29c+hy/qk5d/zeujtnui5chVmlvYcmo94OfFjKkrnAORXejgFPTQo5iswFP2yxRtQW9H0WSoXrrOMio+LPldbbGJEA6FJ0PG+2Kzaz8O2revUAD5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6PBs7kS24mI3u17BjBaeUczyYsXzr8m1bsIxmsQJ04=;
 b=bDKl7Coj2Tl9V4HM8s8Xz0YIoTN2BCl+uKsKMQRxdVuFSPrysXv+jXd7CvRYYuRjrDgkqVEaAIU2ruSQXU4yAFBKNadE7YVYkgJtcyP39RcdUdHQ5ocnfA19tMuLdzA9ZLAbuEd0n1NbpmZBoveABxbqhB0SbKQJkCAfMYus6kS8C03Be1vesQKMJS5tw2/p0ZpwlM90/kLK9DVRHhQ44NBVeQYXLkJpPmElBGQy4FE+PsrG6oVtMb1scX9R/TZG3VF13xvbvr/xe4wg6dFupf4FTQcVmB+fu7Nc0QLSssghY76G7ByjR/uaN15sLWDqrqpFKzTaHg9bI7TfnFjaAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6PBs7kS24mI3u17BjBaeUczyYsXzr8m1bsIxmsQJ04=;
 b=pm3PSqrGlWZgmgMNXh413KFBgTcz1hiAJHJG+qlk26CgDdRZ9qsEUqzO0ZG/xqymyaRUvZrE7p343/HD1SBD+zwur5ppMVmXh+ZOuKjCDqVwkIyUuHfKxxjUgjHoXOdbujqnUsKZduw9PJUodn1dkuEBvJ+kb6zDAHV+xlZ9qcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from DM5PR05MB3371.namprd05.prod.outlook.com (2603:10b6:4:45::31) by
 SA1PR05MB7983.namprd05.prod.outlook.com (2603:10b6:806:189::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 20:54:26 +0000
Received: from DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::5f94:a9ef:c567:e801]) by DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::5f94:a9ef:c567:e801%7]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 20:54:26 +0000
Message-ID: <6be74496-f14e-302c-329e-d865f5ee3c36@vmware.com>
Date: Fri, 7 Jul 2023 13:54:21 -0700
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
 <ce7754be-8085-ffd1-93f3-a774f7fcdb87@vmware.com>
 <20230706110146.0abeda0a@eldfell>
 <247b630c-8b16-7c33-987e-8b3451be3c70@vmware.com>
 <20230707113837.1a9d31e9@eldfell>
From: Michael Banack <banackm@vmware.com>
In-Reply-To: <20230707113837.1a9d31e9@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0061.namprd15.prod.outlook.com
 (2603:10b6:208:237::30) To DM5PR05MB3371.namprd05.prod.outlook.com
 (2603:10b6:4:45::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR05MB3371:EE_|SA1PR05MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c6c276-2f34-4fb6-f261-08db7f2c5972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RvKS/DUc1MINk3zH+vQzc/Frefx2R8u20j7xaf4IvJx4V/Qb5mDAXSLn2s04flBOXbcj86QxQTFG8y+bJa6ITlSDv6gDTsR504l31jQXmKTEgZOhQS/c2dI3RS6CNHPRYndHHZ1J/2wGMvIct8IjELtN+Mm4N0o2IFKtyUI/DWn8MKan32fDgUEnSbFD1Vvy9P9qSppGkIFBYk5tUL3rG2pQubS9Spimp6jDsu+L2sWDNZOh2GdvjVX+y6WXRyu3fb/9GP0J04yyV5ufiKTN5bJde0l9W0EFN+B4BetOh7ZVZRCoXckaCWFVKCWLNOvpibuol6JnRemSZA3laapp1ifSsP4xClWf65nmtAqp0ipLi8lXKfTdJBfIaB/ux0JTcrHIUIx3VIoXg2sJuxA9hoju9+Q6Khq8aX7Pzs2aKwaqLycZksrv4tzccxZlWqtP5/7WvEu//Vxbu/oJ7SSL+NToTWwnxY4GypVyhUeWQd2DgQzwYjFJSMlQzmD/oo3GDUnXRlQ4fCdaDxrsJeqpTcr1/A+jE2YF66ILo4L3WJkkfN+NaUPLbePFtaHWFZhtDMn+t6oELkoMmMCN4uUNMDFrRspJHFHv+0UITmyHJrQsC3yMQwLDmXivRgpTK1guvqJikZHQxW8aAnYH5pGsS/k2+aw2OkxZjRrUt7MxhE7Rh+KS+ZwYT4/P4wJ2/Zqp66cSkn0MYL2+SMI5jl7XbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR05MB3371.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199021)(31686004)(66899021)(6486002)(6666004)(478600001)(54906003)(83380400001)(36756003)(86362001)(2616005)(2906002)(66946007)(31696002)(186003)(6506007)(26005)(53546011)(6512007)(41300700001)(38100700002)(66476007)(316002)(6916009)(4326008)(66556008)(8676002)(8936002)(5660300002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZ2Y2dMQkkvbTdwQmpZZGw0VFowMm1DbjRwdk1wd2VlUU1nWnRqY3FvWGZa?=
 =?utf-8?B?akhUdXpaQzRycm04eWRYMHBtbXBZRWhrOER0RDVQQjhjWDJnV1RWSW1TRGlL?=
 =?utf-8?B?cEdZajgzSlZSeUUwQjhCS3J4NkNOaGpiTWcwektrazVYQllCcnRSYWk5cnlo?=
 =?utf-8?B?d0MvMnFEUW5HeUJPRDhSTFpoTmpHNk5BVXdzZWYxS1MzbDZxanFWdWdldG1u?=
 =?utf-8?B?WkJvL1lybjdCM0t1QWZiTk9FQVRCUi91U1hoTUhEamFrcWptczcvQTQ3L3Np?=
 =?utf-8?B?c2hvS21VeWdRb0NwNHFTY0RHOU9PODB2NEVQRkJNOFJXbXBKUGpkQjl2RXF3?=
 =?utf-8?B?dkJlWG02SDl1K0t1eHlJc2dSdHNHcEU4ak1leTF6YlRjWjB2N09mUjdJVTRx?=
 =?utf-8?B?TTZjYTcyRndnU0F5YUxPRnRCT0lLRHlRczhOcnNONkUzNk9jRzFjZ0Z0MlhF?=
 =?utf-8?B?QnVMVnJHUFVsMU4yeFpHblZpdTNPQVV4MThSNVRCcWd6emIwWDJaNVpFMWU1?=
 =?utf-8?B?UmdSSHhQS21BVTFYSm05Sm01d3AzSEQwS3F6MWpBZnBJMWRwZW9HeW5FRE5J?=
 =?utf-8?B?ellZTWVQRC9NSE5BRjIrcUFNOS9iRXlsL0t3eG92SGtsUVk3TTg1cFRqUm5h?=
 =?utf-8?B?RzFId3JWWkhSVHM3VUphbFFDbjEzQUcrSEhQTGNXckl2UWZsaUFGNEVoaWpu?=
 =?utf-8?B?VGxRcklzR2F1c0tqK3VTdlRRVm5RaU10WjlkTTNOSkU1YU1qdkRmVTNaOUhv?=
 =?utf-8?B?VS9yeXkwY3EyZlRtejFQOVlJQ1krZjZJY3FESyt2ZHBETE1PM244Zy9VbDIz?=
 =?utf-8?B?Q1FoMGkvbmxFemMrWEtMQkZlclpXV3h1eTFWclF2R3BCZVYrYlUyakU1enpz?=
 =?utf-8?B?QzRzdzNmNk9hN3VCL3lRc1FhRkd1dGIwaGQzcnhIUjVka28zUmxNT3ZhcTFv?=
 =?utf-8?B?UGhmeG9KZENMK2ZyR2xGc3p3NmNrMlIzY21rZVg5WXdQdGlSOXd6YkUyQ2Rl?=
 =?utf-8?B?NTZGOGY0bk1yREJRWEpRNzQ2dHc3M1RUV3FlNldkOWQrMklHQkR4cEpoaytp?=
 =?utf-8?B?d2Jyc0lmRFNXNjB0UnRVNmhPOTBUaDQyYmlrOUNTRUVodXR6ZUNnQTNncGxa?=
 =?utf-8?B?dGx3T2svM0p3MWFVK3VxUWR2cUhOQWJrVDVWbzFoQWJkWmYxUzRia0szSEJs?=
 =?utf-8?B?dGV5NXhTWHo1M3JEOHhEMVc1ZDFQZXhLd1BDMXZTVHRINW5jZzAzRFFDV29N?=
 =?utf-8?B?VjhnZkhVSkZzQTlWMXROMGRZUldGL0xwQ01FWFRDWndpa3pPVDJJbGhzcUlN?=
 =?utf-8?B?L3VNZ2FkOS85WTdLYXNpQlM3OUxDaUp0WkQ4S05QZ3IzanVzUitSVGU1L3di?=
 =?utf-8?B?YXdpWFoyOUJKa1NKaVZ3NEV5QkhEZGd3MW5TVHlQLzZ2L25IMlcrdlA5dVNq?=
 =?utf-8?B?NkZnNmFjRW5obEU0NmNLYXMxL2NjRm42eWFLZTc1TGlBZ1ZiU2tFU3hFcmJv?=
 =?utf-8?B?MGVFckNaeE9WM3BzQk1tY3h5QU9NY1ZNa0pPZjdGalF6eXBjZ1pVc0RYdEpq?=
 =?utf-8?B?UWxzSHI3SEsyb0NWNFdXODdFZzF1K1dEbk90UFlhV29CYy9VYlJlSFZOdkdv?=
 =?utf-8?B?ZVZYcjBYWHJPckVrWm9KeHFmQkRMZC9vZmU5aGtpS3kvV1VMQy9JNlBBWjNa?=
 =?utf-8?B?eFhxZ2Z3RUVaYXkvb2Zia3E1d0hsUjhydGx4d01lOGhEaVQrKy96Y1U0UzdK?=
 =?utf-8?B?S3FXVG8zaFdLRnVUaHFiaEN2UHRHZlNxekNFYWd6eWJGbmdSeXBGaElyWDlK?=
 =?utf-8?B?QWx0a2FQMHpwRWY2a3ZLU2pkMlZZZjBNYk9WRUF6OGtBYnVJUXZURlZNeVpi?=
 =?utf-8?B?TCt1QXNPR0FyZ08xblNGWm9uQlZuc3hWWWxTeWhNZzZEdFpXR2hQRll4dXBU?=
 =?utf-8?B?elFCUmhyZmN2cnJpenlhVzF5WHp6aWZLRmZyalRkemJ4bWxiZnFZVVJxZzRY?=
 =?utf-8?B?VVdUMVBpNGRvbHowVWtuNDMrdThJQUI3YythaW96RDQ1Vithb0V1Z0dWbGpa?=
 =?utf-8?B?MmZwV2piMzZoSE1CQU5VRW5EQ0VxWHNDWE00QWlqcmRIZXBHbEdSMWFwSzlt?=
 =?utf-8?Q?D5GFmyaLjeW64OC7l0pq8Odlb?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c6c276-2f34-4fb6-f261-08db7f2c5972
X-MS-Exchange-CrossTenant-AuthSource: DM5PR05MB3371.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 20:54:26.1442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAu9Grnm0LNo2ZhoOTcUaKLjUxaib8ynkcHa9Wdtgy9xqWUmUaI715ZbjIv91GjORQq9TuTL6ijtj7vTiPyazA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR05MB7983
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



On 7/7/23 01:38, Pekka Paalanen wrote:
>
> That statement was based on the assumption that existing hypervisors
> and VM viewer applications are not prepared to deal with hotspots
> outside of cursor image. Therefore, if a guest is upgraded to a version
> that uses hotspots outside of cursor images, and the VM stack is not
> updated, it will malfunction.
>
> Therefore it is best to model the new UAPI in a way that is compatible
> with existing VM stack, especially since allowing this new feature
> (hotspots outside of cursor image) has no known benefits.
>
> Below I see my assumption was incorrect, but it still causes you to
> fall back to something less optimal.

Okay, right.  That's why I was saying that it's not a big deal either 
way to VMware, but I wanted to at least make the case for allowing 
somewhat arbitrary hotspots just because it is semantically meaningful, 
and I don't know if any other hypervisors care about allowing it more 
than we do.


>> Essentially setting the hotspot properties means that the hypervisor
>> console can choose to either draw the cursor where the plane is located,
>> or use the cursor-plane + hotspot information to draw the cursor where
>> the user's mouse is on the client.
>>
>> That works the same whether the hotspot is clamped or not.  We mostly
>> use clamping to avoid pathological cases (like a hotspot ot MAX_UINT32),
>> and get away with it because real Guest applications that do this are
>> very rare.
> My point here is that you can design the new Linux UAPI to help you:
> you can rule out cases that would lead to non-optimal behaviour, like
> falling back to the drawing of cursor plane you mention when it would
> be better to commandeer the cursor plane with the hotspot information.

We can't though, because we can't trust the guest kernel any more than 
the kernel can trust userspace.

So we need to handle these cases one way or another, both for older 
guests, and to ensure we don't have some security issue from a malicious 
guest kernel.

>
>>>>>>> The question of which input device corresponds to which cursor plane
>>>>>>> might be good to answer too. I presume the VM runner is configured to
>>>>>>> expose exactly one of each, so there can be only one association?
>>>>>> As far as I know, all of the VM consoles are written as though they
>>>>>> taking the place of what would the the physical monitors and input
>>>>>> devices on a native machine.  So they assume that there is one user,
>>>>>> sitting in front of one console, and all monitors/input devices are
>>>>>> being used by that user.
>>>>> Ok, but having a single user does not mean that there cannot be
>>>>> multiple independent pointers, especially on Wayland. The same with
>>>>> keyboards.
>>>> True, and if the userspace is doing anything complicated here, the
>>>> hypervisor has to be responsible for ensuring that whatever it's doing
>>>> works with that, or else this system won't work.  I don't know that the
>>>> kernel is in a good position to police that.
>>> What do you mean by policing here?
>>>
>>> Isn't it the hypervisor that determines what virtual input devices will
>>> be available to the guest OS? Therefore, the hypervisor is in a
>>> position to expose exactly one pointer device and exactly one
>>> cursor plane to guest OS which means the guest OS cannot get the
>>> association wrong. If that's the general and expected hypervisor
>>> policy, then there is no need to design explicit device association in
>>> the guest kernel UAPI. If so, I'd like it to be mentioned in the kernel
>>> docs, too.
>> I'm not entirely sure how to fit what you're calling a "pointer" into my
>> mental model of what the hypervisor is doing...
> My definition: A pointer is a pointing input device that requires a
> cursor image to be drawn at the right location for it to be usable.
Right, but normal desktops (and our consoles) expect multiple input 
devices to feed into a single cursor.  So the connection between the 
on-screen cursor and the corresponding input-devices is not clear to me 
when you start talking about multiple pointers, even without any 
hypervisors in the picture.

>
>> For a typical Linux Guest, we currently expose 3+ virtual mouse devices,
>> and choose which one to send input to based on what their guest drivers
>> are doing, and what kind of input we got from the client.  We expect the
>> input from all of those to end up in the same user desktop session,
>> which we expect to own all the virtual screens, and that the user the
>> only gets one cursor image from that.
> Why do you need to expose so many pointer devices? Just curious.
For one, we don't know what drivers are actually going to be running in 
the Guest.  If someone configured the Guest to not support the PS/2 
mouse, or didn't have USB support compiled in, we still need to be able 
to send mouse input.  (We actually ran into this for years with some 
Linux distro installers, where they had frozen their installer with some 
weird/older kernel configs and just didn't support our preferred vmmouse 
device.)  So we plug them all in at boot, and then try to pick the one 
that looks the most active.

But we also need to be able to send both absolute/relative events, and 
we had trouble getting Guests to support both of those coming from the 
same virtual mouse device, so if the client changes mouse modes we would 
route those to the appropriate device dynamically.

There's some other quirky situations, like some absolute virtual mice 
not supporting the entire multimon topology correctly or mouse buttons 
not applying properly when things get split across mouse devices, but 
those are less common.

>
> If you do expose multiple mouse (pointer) devices, then guest OS can
> choose to use each of them as a different independent cursor on the
> same desktop. The only thing stopping that is that it's not usually
> useful, so it's not done.
>
> Therefore, what you need to document in the Linux UAPI instead is that
> *all* pointer devices are associated with the *same* cursor plane. That
> forbids the multi-pointer pointer scenario the VM stack cannot handle.
At least all mouse input devices that the hypervisor console is going to 
use to send input to that desktop, yeah.  (You could still have 
non-hypervisor input sources that don't enter the picture, like some 
kind of passthrough/remote device or something.)

>> So I guess I'm not clear on what kind of usermode<=>kernel contract you
>> want here if the kernel isn't what's owning the translation between the
>> mouse input and the cursor position.  The hypervisor awkwardly has to
>> straddle both the input/graphics domain, and we do so by making
>> assumptions about how the user desktop is going to behave.
> Correct. In order to reduce that awkwardness, I encourage you to write
> down the expectations and requirements in this new Linux UAPI (the KMS
> cursor place hotspot property). Then you can be much more confident on
> how a random Linux desktop will behave.
>
> It will also help the reviewers here to understand what the new UAPI is
> and how it is supposed to work.

The cursor hotspot is I think fairly straightforward, as far as what 
that means for how hypervisor clients are expected to draw the mouse, 
and Zack's working on that part.

My point was that how the hypervisor then sends input is sort of outside 
the scope of the graphics portion here, and I think probably outside the 
current Linux UAPI entirely (unless there's some other input/topology 
system somewhere else I'm not familiar with).

> However, in your case, the userspace (Wayland or X11 display server) is
> not free to choose any arbitrary input-cursor association they might
> want. You have a specific expectation that all pointing devices control
> the same pointer. Since the hotspot property is exclusive to your use
> case, I think it make sense to write down the expectations with the
> hotspot property. Guest userspace has to explicitly program for the
> hotspot property anyway, so it can also take care of your requirements.
I see your point, and I can see the value in documenting something to 
that effect, if only because it's /useful/ for userspaces trying to work 
with this.  (And the only way anyone is using this today.)

But I'm still a little fuzzy on what portion of that is within the Linux 
UAPI scope for the hotspot...

It seems like it might be more useful to restrict the scope of the Linux 
UAPI contract for how the hotspot property works to just how userspace 
can expect the hypervisors to display it on screen, and not try to tie 
in any expectations for how mouse input is going to work.

Like, VMware is using virtual mouse devices here, but another hypervisor 
might have no kernel mouse device and instead inject input entirely 
through a userspace daemon?  So even trying to express the input part of 
the contract in terms of kernel input devices I'm not sure makes sense.

I guess my fear is that I don't want to lock this down in a way that 
excludes some well-meaning hypervisor that implements the graphics part 
correctly but does something just weird enough on the input side to not 
be considered compliant.

So I guess I would vote for trying to include something to that effect 
as context or explanation, but not try to strictly define how that works?

--Michael Banack
