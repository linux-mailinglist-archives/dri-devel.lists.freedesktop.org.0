Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2537C574496
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 07:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D671A1DF0;
	Thu, 14 Jul 2022 05:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C64CA095D;
 Thu, 14 Jul 2022 05:38:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCnJWXnEQ4cc/DBLGB3IZteTV+NqCU5UpZxg16BJHyQDHHiO5m51VNj2XNtruPHhIkvQTaHmP/yF4eVsXS+rjq1r/9SxesDLxcoo8NCIzhdhBJEbY5IK/3jCd35b0MEl9ssB5dqy5GJPY03akXdnpMeYiwr9AvchxOSWtbNosaXiatL4Sg6mNGCRUbhipJ+laiSx9/mfS61XxTw8uJe3/C8xFs1gK/uFoJRZNl1z6xU/5mYDzgfIPPxuFYuJriOOKiC7ZAhKofRP5fdhcwwQcMjL68OxyfetEDuTb5e+f/aipQPcoWQKRbfeAdYtZ0U6bB8iW6BuxYYqxNSwAqGxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ec5/Ogb2I/KRT6Jv0dLuFteAMn2pcAG9ZHXIx4QFrE=;
 b=a5rutk3J4sHCc8fnnH3KoD6x2Q1S0gPzCNlSf8WUZSnOrDE2bMRWtm71KzJ6E/t9iWgYTRgzxLfzLchB10tKMTpn+mBchXNTorgC+IvTHB/eaC/w0G6K1580BOTeOdPdWD6/imttjLVCnL+tODVEWjBTKathhmR394+1orUbmtNsYCyxlPEJK4JcmlxHfucFY/uO/8HApxSM3aQqNP85fpDzttwuLKojSs/M1oXH+0sinXEzM7xqPRi70itbHcOdTBnySubwybYjoXkPOHiVXlzSOtWdvMTu7tAjHIvGnEt8V95zjmb5/X/pHTT+acm1ACLCHUUdrfi2+c5pGQy1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ec5/Ogb2I/KRT6Jv0dLuFteAMn2pcAG9ZHXIx4QFrE=;
 b=CdWvNXMasfoQTCohO8uOq6LIiXkeNxl86A4YntbwPWDYPgnnoQcL7i2EdgXqkXq5JGzKBkElzhKOh93nQt4wi+v4neJC8fCzw1apdHf0xSkrkhcZIE3Mrd98F9Q07rMMb/IgNKwEWt5cRdCqDtDuNZ8RZLl0QGqj3xTvTKtIUw/sMVSa8D1hnW8SQFzWrRxZoN/rtoGbMq5dSAthqw6KFkDfTM0Wx2lTmj/kJk6vkdy75DkA/zlyG6pjkYWnPcbMU2JckbpDuBvQqgCTNUvduJEqcAHh0EcIBbH8/+9z7P2b3LArrnoQYoGWEvRqlIpB4pPQvU0VOgF3PyramHrqWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB5796.namprd12.prod.outlook.com (2603:10b6:8:63::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Thu, 14 Jul
 2022 05:38:44 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7%5]) with mapi id 15.20.5417.020; Thu, 14 Jul 2022
 05:38:44 +0000
References: <20220707190349.9778-1-alex.sierra@amd.com>
 <20220707190349.9778-7-alex.sierra@amd.com>
 <7a772ca0-0c82-2251-dd54-8ad466774e99@redhat.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v8 06/15] mm: remove the vma check in migrate_vma_setup()
Date: Thu, 14 Jul 2022 15:31:32 +1000
In-reply-to: <7a772ca0-0c82-2251-dd54-8ad466774e99@redhat.com>
Message-ID: <87wncgckym.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64580125-9d39-41de-9fd1-08da655b1dad
X-MS-TrafficTypeDiagnostic: DM4PR12MB5796:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0VXzYQh3OSBOm87f7t6Fw9yweXKSZsbpBIeqRM3KTW9/pAui1VmwhCUKuEm5/tJMXh5Ppf64ZOByOlYF5UrkWs2nI3fUDJVIYIFtu5Vb8KdLkqocZU2Tc9ZhXhnGKoBLhHonPPg2K171lVdmNhIUK8frKY2hRPUY7yuFgOdpC5Tg4eIqwOTc8GJ35MgB5ZmAiSICvEGDuIL/RTI55xf6iHnp6ivKFvEDU7A7GOdvJ2eljlt6OuIo8xUyzYDh5P3EQG2bv7hoGWua4QfcencaQrDb/ST6vd8qDxvQeLdVMH4tZQ6EwBVOSybdgo4b2yqiZtLsCICfFjpf/sGuVkApKbRymN28zHqbCngyUZjIRyV7vbl8NiBxxo1ViZ7O0anwHCiF6vxz6BE0tPYAkuadnfqfRajKxD0oU5mKrg0Q59tPBWYgM2J6QTHKmIflxCFHVS3Ihogncjq4URl6FSoHPhbjCg0HId7LplvDSOFqoo8rxEQj3LcoBmua4TGCK8fAr8uzLt9tAzg5Zq6P/8ZBzaBYPQajY8xU7urcQvoeDV09keCceZ9pBdHrFgVO82yRJNY8rz/ThFAVXkWkJncPvA1qrzK3WW9yY00yZjSB+P/439Y3dg942PRqsvdRxT6ii5CUIbxIJ2QmvEnPbTMFwTfvLlqFuKwZIcDYYhPnd4siZ6Z19A2wtbBdgDO7n3qNK+7+MhEYxaeb+iSuiehs+Bm0iBXs3OwrvBXNsr07XBjG1CBx8UuvQnoegIW422ys
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(26005)(316002)(478600001)(66556008)(66946007)(6512007)(6486002)(186003)(4326008)(8936002)(83380400001)(8676002)(7416002)(9686003)(5660300002)(66476007)(41300700001)(38100700002)(6506007)(6666004)(53546011)(2906002)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N4nPbdohYLsaESKqeXjU5HuQYobdQeB7rWRSUoE75eK+K50jXd9aYDwPcWPT?=
 =?us-ascii?Q?w/d9sSRBIwGcRTafSgKQxknmNIJjTCRsLJbl3sXiK0cF8SYZJW+NLPHKCt54?=
 =?us-ascii?Q?C9DAf2BaPBA+AGaNVo0qRYy4OCcQinRIC31KD+1Zph58AoId17eleprXdO15?=
 =?us-ascii?Q?z8cSSDNLfZt+Bf74XK5yd8ulzbBHMa+SV74c0vJcw5tUkG3OuRlyx4M4QJ9n?=
 =?us-ascii?Q?l+5ZGihaXzKj1RVUFgkI79H+jtWyyZfpoq/qcLifIghCUJv3I6oGYFNHBfPp?=
 =?us-ascii?Q?kbgyCeV5KQaIEC9YjP7+v+6zyuwd6XJ13jhs1bPSS76FvLpqeCqeG2oXA8yQ?=
 =?us-ascii?Q?A9ljAvcTYv46cHXmE0WbS/jOHnz0Skhmrh6ITxtAszmPhJieMdC3h1Me2PJS?=
 =?us-ascii?Q?RA51CJb2YMCJxr4SmIDdPcpOQkIMRU5J7mjzodeWM0IOdvRE4Yda0eG3V52C?=
 =?us-ascii?Q?Z6PXnVXj9jxgRLT8C+Q31simd3V7Fo9Oz7yI7Q6zbOIsfM1whmMfbkfZOkI8?=
 =?us-ascii?Q?o/9+kVR6wkM0oi7HPqpvY2S5ScyaRj6FLqXC2vlZjLD373xWzoJ8C23EoxvK?=
 =?us-ascii?Q?I2EN5ahab4NLucGqWK8fMaFQnba2geTgX3F+FrOJzpOECw8UKfIIXu1ctZ04?=
 =?us-ascii?Q?xlJjqT2pc07qCuRsVPypjaGrU+AKFPTyXHWln7/BLaWVLkAjSxu+NFoQMd88?=
 =?us-ascii?Q?l3JLHxc0CRjuw7mklupx/9ebjtGgjuIifsLUs7poGkcYRIQAYhh/M6KCtSk+?=
 =?us-ascii?Q?FWxHZAd4ZfLbTfZkis8oPol+fKiLShj/Y8HaKTGIWogVh+Kx3LwpA2bQfLGI?=
 =?us-ascii?Q?wCUy+pxg9l2jXQhCxfoTMv17o8cKqVc90wLVm2cKvpk+bPMpUYeT25uuyuVM?=
 =?us-ascii?Q?TjrXYjqCKnr9C7qyVJZb9APEN/lr6JEr6nPbourwsxSRkj9n9UUx0+/t/JH2?=
 =?us-ascii?Q?oBWoqpKvXS7aSkK4bGIqoAjPd1Zi4NXjN8jd3Qx2tOgL01xdZ7p7enB73uU4?=
 =?us-ascii?Q?P0zqYexbccKOejGFKUiO2lx9qCeusDqEI4uXPbH5Fdqw2AeXQC7Z3WAmN2wm?=
 =?us-ascii?Q?xtz2zR4zU9bflMaY4VOOx6AP9f6Tgcl/HsQH5DfJKyBXde/sDseCCm0HUegp?=
 =?us-ascii?Q?aql+HGG3GYB2hzuZW7hot83W778V7LcBPuvrO1NADnsncHZiRv43I+q0MwuA?=
 =?us-ascii?Q?Qqa9UKAjuaJpE1QUrXYzo3RqMdstvbSC4Hx/dF0ilPdCMHHGhPZCYEiY5Ckb?=
 =?us-ascii?Q?RRfjaeEOnbKtFQZI+Yh11CkXPqwaaYcFW7IYMc15DIP+ySlLKpsxynDLbv4H?=
 =?us-ascii?Q?cWLOjwfG239f5TQR3r/7BHEZlW1/k1U+l2Dt4WciHnPdYs167ZhEWmBzpnL+?=
 =?us-ascii?Q?1n1RRPrca42+Ys9VKYuMQMs68Q7SvUYaIJ8NchBV7kyJ3vXAvnELy9iNu170?=
 =?us-ascii?Q?DC2dxg/yGvTAHFLncjxvgmrbfPba5rs7F74aVYx6XiUPxDkVwcPg26VvS5Xg?=
 =?us-ascii?Q?IwbXFH/Rb7bWHmoWBtobl5tJdI5nQ8djEHTTQI+CyhqZAJKh3Jd3SV1+tAqS?=
 =?us-ascii?Q?mIeGx85e7lywFhV1NGdOKZWjzGH+piijjWB6Zjv5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64580125-9d39-41de-9fd1-08da655b1dad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 05:38:44.4287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/41Zbg7ptvL+3LpLX59Qh/52PacdqDss0LIiCwgS0LkUOstRV7R1mDDvk2++z87IEXFlA1rXEz7ZmfMjKhxuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5796
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


David Hildenbrand <david@redhat.com> writes:

> On 07.07.22 21:03, Alex Sierra wrote:
>> From: Alistair Popple <apopple@nvidia.com>
>>
>> migrate_vma_setup() checks that a valid vma is passed so that the page
>> tables can be walked to find the pfns associated with a given address
>> range. However in some cases the pfns are already known, such as when
>> migrating device coherent pages during pin_user_pages() meaning a valid
>> vma isn't required.
>
> As raised in my other reply, without a VMA ... it feels odd to use a
> "migrate_vma" API. For an internal (mm/migrate_device.c) use case it is
> ok I guess, but it certainly adds a bit of confusion. For example,
> because migrate_vma_setup() will undo ref+lock not obtained by it.
>
> I guess the interesting point is that
>
> a) Besides migrate_vma_pages() and migrate_vma_setup(), the ->vma is unused.
>
> b) migrate_vma_setup() does collect+unmap+cleanup if unmap failed.
>
> c) With our source page in our hands, we cannot be processing a hole in
> a VMA.
>
>
>
> Not sure if it's better. but I would
>
> a) Enforce in migrate_vma_setup() that there is a VMA. Code outside of
> mm/migrate_device.c shouldn't be doing some hacks like this.
>
> b) Don't call migrate_vma_setup() from migrate_device_page(), but
> directly migrate_vma_unmap() and add a comment.
>
>
> That will leave a single change to this patch (migrate_vma_pages()). But
> is that even required? Because ....
>
>> @@ -685,7 +685,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>>  			continue;
>>  		}
>>
>> -		if (!page) {
>> +		if (!page && migrate->vma) {
>
> How could we ever have !page in case of migrate_device_page()?

Oh good point. This patch was originally part of a larger series I was
working on at the time but you're right - for migrate_device_page() we
should never hit this case. I will respin the next patch (number 7 in
this series) to include this.

> Instead, I think a VM_BUG_ON(migrate->vma); should hold and you can just
> simplify.
>
>>  			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
>>  				continue;
>>  			if (!notified) {
