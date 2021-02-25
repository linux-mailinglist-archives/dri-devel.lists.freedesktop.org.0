Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04372325370
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7EC6E203;
	Thu, 25 Feb 2021 16:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07206E203
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 16:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+rjMQm1sAFoz1LpcPhWfyZ5fqtd+Yrs9T2++jYnbugBg+y709M5h3udnd65oOn8bRDriOiCcFylsVmUDsuLrXWkyDP0bwTEQBOtsbIPsyONKO6RQbxwzjpr3RbDgBU1upLtYJXgL3iip/fKopXkAeU76+THuOASIKdCc9KtNCNtxiBukZWmYp9B5zz+D1/sitFpKUtSxthPMvm/7FqMVrWwMA6PA0BjntdBPgUDQy4CDjNSQpD6H8olHDqZOZ86G6hs3V2SLUYDXKrPwR4v6rnf/fjthzhfvG7spj5DHTy2vlBPNmCtxy7WmavaQDy0/oBHk16MGnjoagO3mjmfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlQpBwcFa8g4hdFkmp4h55I6QQbuM7a3dz4Dc28/XaI=;
 b=lJgb9SXHzQlZEozkJc0jtHhnSTd1aTst2eQIBTs4MAFU3nUs7SYWcR7EaYH+95iPuj7kcS+sL69KtIVUq2JpYgcOOKindyQQYNTXymT3BdXvZo3XSrAa7/iXLWE34XTlFPPFbaN4aZrl4yckOaFPwsKtlS8keYi8Vsqh6eWP1/OQwcnUtHqDld+K+Slgg8SlrqP6XQDn1h7NEFssS0y3hUPV/cZR79iIRwrvbQ/br7yFjEw1/Bq185+rrmiqyY0giu+lwcneLzsQs1vVvb6GvQKgXF0qA2WfZRA0UYpbHMTLYkpqfmdfsftae24s2K6YcxPbUDcUqyXbOBU/PMEpWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlQpBwcFa8g4hdFkmp4h55I6QQbuM7a3dz4Dc28/XaI=;
 b=r2c3bkUpbRm+4w+LndzzGgNcYEc0bFgS0QRg9pf/SwxRkw8txwj16O7ygoG8E1E/VwnBhr5bPq2yTYOSnuVg8MIDVgkYhf7d5+f2AcRHh8QrNjmTk+SoGy7F09ddxaX8ez9MjPIUgGT/gMgQmCR3QMSPWgrGz6OLgr3/c+xdQTs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=vmware.com; 
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6558.namprd05.prod.outlook.com (2603:10b6:208:e3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.18; Thu, 25 Feb
 2021 16:25:25 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e%6]) with mapi id 15.20.3912.009; Thu, 25 Feb 2021
 16:25:25 +0000
Subject: Re: [RFC PATCH] drm/vkms: Add support for virtual hardware mode
To: Daniel Vetter <daniel@ffwll.ch>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210224105509.yzdimgbu2jwe3auf@adolin>
 <CAKMK7uFwdHaaGs8BPSAah1Vp5pJWTzxoruLgOWxQu1aDAyCKLQ@mail.gmail.com>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <9b1b55a6-dcea-db17-03ca-1dc52f4a8083@vmware.com>
Date: Thu, 25 Feb 2021 11:25:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <CAKMK7uFwdHaaGs8BPSAah1Vp5pJWTzxoruLgOWxQu1aDAyCKLQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [71.175.59.246]
X-ClientProxiedBy: BL0PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:207:3c::16) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (71.175.59.246) by
 BL0PR02CA0003.namprd02.prod.outlook.com (2603:10b6:207:3c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Thu, 25 Feb 2021 16:25:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25e466b0-ce1c-410b-fa40-08d8d9a9f4c7
X-MS-TrafficTypeDiagnostic: MN2PR05MB6558:
X-Microsoft-Antispam-PRVS: <MN2PR05MB65581B582156B7551B9A9DF2CE9E9@MN2PR05MB6558.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NgefEC6Qnsi0Ge3jjazgmP3bVr/drVDD3w65gDXKTyiLr3EPGnpEbPqv4U1RJNf/4GI8/PoyLGYd5TYsBlZyyjGpwuswHv3acPJafukuhm9iydZKvAGGGCetL+oWZr5XXnK3hASPDSU0HoTtgAyb2tX41LX0juODhvVPkM/CxIPCMJZcyivFkA0pSlFSZC6QrOdYsDWBgTHDh3YG+QZMm4UFRoHXHXf8TADoRkoROZt5rJZTu52mTCRROOdw9ceDvY7abjoUtgJvD9Nm/4eqaCZDAmO7jgPVrW2Mteu9ujoz3hPbB8yUFh5I7KAeqKmm5kFgW38nNq64rdh5pQZ3JaRV/8X/TfBbeJYCtteeXc+WnyQYsizacZn8V/lvwGV789vNFujM7hKx0QDwlJluJzqfVlRVJSIHVJpnHMke7cn9qbLDufj8lszKwZQx677Yf/gexep9M5IZd3/HQ3+bveQDmC7ziYORV+AJMj5qRmsTeXX2IYUba0jaRY/MAR70M6uco0gRDKEhn7ktI2I1ZOnVGJYwQvKtJn2xa+1MPrdur7oGUhbsZkkzG9i/9OQtp//JJZjMKI9xpVNI7ivFRmtFH1QyOELVgExtjhUqPxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(4326008)(110136005)(86362001)(54906003)(8936002)(478600001)(66946007)(66556008)(16526019)(31696002)(316002)(5660300002)(2906002)(83380400001)(31686004)(956004)(6486002)(36756003)(2616005)(16576012)(26005)(8676002)(53546011)(186003)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2JKaWl4UlJIcG9tKzRxT2d1NVd1NzU5NGJmWUtTUVVTUERaMjdRZGczWEwz?=
 =?utf-8?B?NlkwNVIxUW1NbFcvYmNYejZCb3BNN2JYYm9rZ1VibmFCODRNTndkYlR2c3Iy?=
 =?utf-8?B?OVQ1NkRZcHBVZGJzNUdaS2RWclY0VTdCcGkzNC92cklvMTJKVE1OWEo5RXlZ?=
 =?utf-8?B?TGVraEpmWDhPWmVVYkh3bllqVjZjMXdtL1RzdTNnNHJMMW5zSEdJdWxGZ2ZW?=
 =?utf-8?B?UWxydjdtK2Q2aWVmd1REaVJLOE5ncnN2OGpUZ3A3QnhDaDR0V3UzUXAxbnNN?=
 =?utf-8?B?TVhkLzYyUVFoalNSZjB2OWJ6YWlacmNIU0RMeGttbTN2djZDL1A4a1QrOFM2?=
 =?utf-8?B?bXUzZkVXMHBUamNCOWVFbGF2ZlhtRWFPSFVjR2RMMEwzRm5CcEZhSmVteU90?=
 =?utf-8?B?YktiSEp2cUs4VGpUMzBKRG1ac0UxYlEvMTVVWEpObHA0MWpKZHFKQ3RyV1Yx?=
 =?utf-8?B?UHByOEpNK0hPMzhTY2E2Zlp2OGJ4Z0Y4RVNhb3NlR1NjZDVpMHpMK0w3V1Fs?=
 =?utf-8?B?ZmpHcHJZazNUMVA1cDMyRUdrN0g2d2JvcVZ0K0xhU3J6TnJkNVlMVExUSWZy?=
 =?utf-8?B?WVdtQkhsYVVQeC9CbHYvSHUwU2E0K3JLR2s4MlNUWTRLaVd2L0ZzM3E1Rk9q?=
 =?utf-8?B?V2Y5ZDhVb2Z2TUJLQ3ZOVXZYQ0xYUFZsK1J0Yk1WVjA1Y1E3elVRRk9mS1c0?=
 =?utf-8?B?R2xVZHNEZ0U0RW1qNVFITUozVXVkNk5DaHA3TUVubXMrY2lyREt0RHFNQ0J5?=
 =?utf-8?B?RVFKditycEdCWlMyYzB0WEZnL1VKbzZYZURxWnpaNkJRbHhtcnhVelFta1Ev?=
 =?utf-8?B?ODJGREgyNkRJUHlWczBBbER1QlVpWU84MnhVazBZYzdQbjlycjUxTVNaUUR4?=
 =?utf-8?B?UkhJNGtHZG9pbzRYZytMOHJ2dlRWbFhQM1l6SExzRzZhNi9hVi8zUVJ4ZzE5?=
 =?utf-8?B?Yk5FSDYyVnhBZDN1RGpwakcyV2dwUG1qSTlwWkgvcXFIQTFXd2x5bitCaEJR?=
 =?utf-8?B?clJjeXpNU1RvT2N2QndmbVRZS1N5ZUJnZ1RtNFFoL1p5L3VHY015WTlweEdY?=
 =?utf-8?B?S2JmTzF2WGFSNUloYUU4YWlkVzUrMUhGL1V1b2JrMmtTMFV3akZCa211SXRB?=
 =?utf-8?B?S2tUTnc3dTlQWlJPYXNVenU3ek9Zdm9raGhCSE1BNm9QRU9qL0Z2aUx6aVV6?=
 =?utf-8?B?aUNEV21vMjBNRUJESjZKcEhKZTJZQXRlWC8yZStWTmZzbGFkMjF0NGNvOEdH?=
 =?utf-8?B?ZDBsYTRpZ0pGUFY0NXB5V0F4cVBYZkhDN09DU0dsamRtL1hqclZKd1FKNnI0?=
 =?utf-8?B?SWt6YkZ6TW45YUU5cU9DckYza1hYUUpUelFUTytMUDJ0MUtBYXhIUWNHejYy?=
 =?utf-8?B?bGVuQjJURE5PRnhsaXdwanJGZWZvQ3R5emhDYllwdXN0dEhSZW00bmkybkdK?=
 =?utf-8?B?MExoUUc0NW04SHFRYzk0QXNXbm8yekxsSEhVL1ZBeGloSTUwM2NHaU9tNEl2?=
 =?utf-8?B?cVNvekd5ZUw3WjFsd014dmNSVktwbDNlQWE4WlQ3V2I2cHUxaVY0WGQwYVNK?=
 =?utf-8?B?T3pvTzE1VCsrcWI2N3pER2I0ZzBtaU4veThWdWZ5bXBSbDNzNkVRVElubnlZ?=
 =?utf-8?B?b2l1MHZMd3ZmM0J6dEFCNmxoWHBjbmpiY2I3dytyQlZTN0xoVEVGOU1jREtU?=
 =?utf-8?B?a01pZWJYM0E0aFVZWjJTSnZBbG9yYWsvUElYN3lKRXRsQi9XMk5ScTRaL3dC?=
 =?utf-8?Q?BJLRaXzayS4Tfc7P/8+Um9tn6ryTdfxIPlPy5/5?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e466b0-ce1c-410b-fa40-08d8d9a9f4c7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 16:25:25.5510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYBRSG4ZZDdRN2Yf2OrN6ODjxhXBfFIDgPn3v71viQi2Kp+6lUV+drgtWWIUKIzRNrvOMR3UgEwZAiWIolv5aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6558
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/25/21 4:09 AM, Daniel Vetter wrote:
> On Wed, Feb 24, 2021 at 11:55 AM Sumera Priyadarsini
> <sylphrenadin@gmail.com> wrote:
>>
>> Add a virtual hardware or vblank-less mode as a module to enable
>> VKMS to emulate virtual graphic drivers. This mode can be enabled
>> by setting enable_virtual_hw=1 at the time of loading VKMS.
>>
>> A new function vkms_crtc_composer() has been added to bypass the
>> vblank mode and is called directly in the atomic hook in
>> vkms_atomic_begin(). However, some crc captures still use vblanks
>> which causes the crc-based igt tests to crash. Currently, I am unsure
>> about how to approach one-shot implementation of crc reads so I am
>> still working on that.
> 
> Gerd, Zack: For virtual hw like virtio-gpu or vmwgfx that does
> one-shot upload and damage tracking, what do you think is the best way
> to capture crc for validation? Assuming that's even on the plans
> anywhere ...
> 
> Ideally it'd be a crc that the host side captures, so that we really
> have end-to-end validation, including the damage uploads and all that.
> 
> For vkms we're going for now with one-shot crc generation after each
> atomic flip (or DIRTYFB ioctl call). Will need a pile of igt changes,
> but seems like the most fitting model.
> Other option would be that we'd wire up something on the kernel side
> that generates a crc on-demand every time igt reads a new crc value
> (maybe with some rate limiting). But that's not really how virtual hw
> works when everything is pushed explicitly to the host side.

Well, this is a bit tricky. With virtual gpu's the presentation is not 
necessarily well defined. Technically the presentation might not even 
happen (i.e. someone disconnected the screen to a running vm), or it 
could happen on a completely different machine (i.e. someone is remotely 
running a vm), etc. With recent vmwgfx the guest owns the presentation 
surface (i.e. screen targets), it's not a big deal to set software 
cursors and get the host to generate CRC but it's not too different from 
doing it inside the guest. Realistically we could provide anything, 
generating CRC's out of some block of memory is trivial and so is 
putting it in either some register or any dedicated guest memory. It's 
more about what kind of guarantees we could reasonable provide, or more 
precisely "what kind of presentation testing could we do for a 
GL/Vulkan/DX12 app that could be potentially running over vnc".

For us the response to that has basically been "if the screen target 
memory in guest matches what the app thought it should be then we're 
done", but one of my pet peeves in our stack has been the difficulty of 
testing presentation fully so I'd be very excited to hear other ideas.

My guess is that without GL/Vulkan/DX12 extensions which actually expose 
the underlying CRC info from the display engines we can't really provide 
very strong guarantees and we won't be able to provide much better 
support than just sharing the CRC of the in guest screen target memory. 
With that model in mind the design you mention above is basically as 
good as it gets for what we have.

z
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
