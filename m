Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D80231076
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 19:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2736E03A;
	Tue, 28 Jul 2020 17:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFDA6E03A;
 Tue, 28 Jul 2020 17:07:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHNEwqgBu5HClsaG3hNYI7h6FF7ZFoHni2ODcyyFbb2ZXwb8UF/lAjogjNpsGp3qevi/nRZkaWg9WL+uMIBdrPNMjibKIq24I33IimBSS8KN9GdJAmXSB318prpvc8sqWP+KE0I1nesUULSj5TMmlks1I7ZNob5pttVmswvTYOQDILj7OGSIB1Cw0bLeSENL1fbIyPCm2xYNgBBKe40OxXJaWp+PWhcX5j6lcOuS17TRHpLTTzA8MwZFjkCPO1/li43rjGHYPPqsuOocXf6D3a/ZxZS/H08bhI/bdrxbOLBhNOGbVkDzZdAV9UiKZxRAKsxUU5o8zx3xT7naIjw8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sic0m2XeOHKVeB+rNI69uDwyE63gbG41+PS5Kk70DNU=;
 b=LUBjfoQIaALCClnKuKTfzWMtBvOMGh3oif7Wyh/LmRF0506eCXfBUGmDa4nqU3RUF0bdSIpgLsHweZcSGxZvjymJZSn8+iUIK2Wa3MflS0m5JWN8H//syJFJMqVIg3Iw9sPN9rur0T3n61thfKsV0laYYt3/I8k0VHeSHBdu779GWIhIp8bds6g/Htr141Mwz8HsPGLEIvnYFY/2KVwA6JqLYXcWL6poiY8XPc+osW+vVviRVE0DQrjpRa4Ihz+DqTiY8kCg5GXmkxLDClP+EEt215pNgy6ioOKbeGe0CkjB9ieSJt0VVpXYEJ1ABFqloFHxrfOidvTs7UWJ3CmOPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sic0m2XeOHKVeB+rNI69uDwyE63gbG41+PS5Kk70DNU=;
 b=fGoWSRKwxis5yCkqxabrPW82vzmNzBlctOm6LEqMSeU73aEuhCmuZsO2GxNp7UxaoDZFQJDErwubsVK4NgkK7AedXYG6mxcK4XMN+s8sClZN1H3KdtWgsPhpiNxu2peYVCRgPvSa92FE7IhZQq27StO/YrRHhidQ4Pth5nie4pE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Tue, 28 Jul
 2020 17:07:19 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1%7]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 17:07:19 +0000
Subject: Re: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
To: Paul Menzel <pmenzel@molgen.mpg.de>, Mazin Rezk <mnrzk@protonmail.com>,
 Duncan <1i5t5.duncan@cox.net>
References: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
 <202007231524.A24720C@keescook>
 <a86cba0b-4513-e7c3-ae75-bb331433f664@molgen.mpg.de>
 <202007241016.922B094AAA@keescook>
 <3c92db94-3b62-a70b-8ace-f5e34e8f268f@molgen.mpg.de>
 <_vGVoFJcOuoIAvGYtkyemUvqEFeZ-AdO4Jk8wsyVv3MwO-6NEVtULxnZzuBJNeHNkCsQ5Kxn5TPQ_VJ6qyj9wXXXX8v-hc3HptnCAu0UYsk=@protonmail.com>
 <20200724215914.6297cc7e@ws>
 <c7mHa5xU_kh7K9KM5P1UJoCY00b3Oxj3s_y3vr0LGQzUPtWlhv5JjjhT4CnnbDhuTZhCuHT2uMbjdDCZ-JLmHVlS7B_k-wj1OTmZpMD7cg4=@protonmail.com>
 <0b0fbe35-75cf-ec90-7c3d-bdcedbe217b7@molgen.mpg.de>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <0edb1498-6c43-27cc-b2fb-71ea5ca1a56c@amd.com>
Date: Tue, 28 Jul 2020 13:07:13 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0b0fbe35-75cf-ec90-7c3d-bdcedbe217b7@molgen.mpg.de>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::37)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.21 via Frontend Transport; Tue, 28 Jul 2020 17:07:17 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4bca8ad2-657a-432a-a89a-08d83318af62
X-MS-TrafficTypeDiagnostic: BY5PR12MB4115:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB41151A2B3C9202C8856B0DC7EC730@BY5PR12MB4115.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oeV8Eo+6kUHEc9jATJ8WqgaLr7XXqIfqkPxpRoucXEhr9yomJ5gFKyHrwxXy8jDdTPIb/UZJssTs6TnH16Ih8n7Zs+j+Dz4VKHlrNvC/S28pMhITDDWQSlkQog0nJAnkVQZR4wjjHtA/Tb4nEJEmU33K55Pz8SuJl+yU7TDH2aQfuz6Jgl5GAer0J0Bj0Lb9qMPhtuJ/mWIthWmNeTNPo5KtuHyMZw9lenrQ0h3Okg4fEKSKVJDWxB9FI3wHRB6QUrZYaVWKvmnLK9dKWnxZqJkKhI6gRlxiHdbcRCkZX5rTH3ZlWut1pBulide2033z7Y+sJ1lqmW+kpm0amQQE5PvJy2VuwpN96JhaofpSAb/JGWmG9Wxh6tEgteb/ZP1PWU2PS9s5qEVXoYZ9mTshF09O3Sj4MQHsjp+QjpHqJPah5MHGRYztMwHVNNljHKW32btDnrLYHGzTaalkkiH4mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(6666004)(86362001)(52116002)(8676002)(316002)(4326008)(110136005)(54906003)(8936002)(26005)(66946007)(5660300002)(16576012)(66556008)(66476007)(966005)(186003)(83380400001)(7416002)(16526019)(478600001)(6486002)(36756003)(31686004)(53546011)(31696002)(2906002)(2616005)(956004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: tKObakxShWzy7gnht50gqJVjBiY5OXQz9GeKF+7wocO78vAebgNwFE/A6qHvWNsyJuLu/o/wXuOysgSQAXET2a3TI7btoNOuRIu1/z38CQ16nxtxz0OcVLLPnnCaTeAht6vU2IPtQUtHqxjZ7BwrjmeQ7wjXdy+esoR9YLxNzTp7NeBB15jBjfAOFu4V7/8lTMIGbrqDHgjz+qsWxgTGrPMdVx0FDgil6LHqcwCseVCyipiEqAOtnBY3p5fZ8TMdH8bibjI6mqrabQ3utHVtPawD29KgWGcV2I20HbJzsC9jcGmnAOfdh/kH/UayRotdLfKqojGqPKnWpocL2OeodrsZacmUpjkM8+1fKYnNllbf6v/Zj+f2JxAbloXGQNbfXt9oqmRqzZFwEcu+AyDyJKUYAHKmRLvsKDViOqod+oqxF5fVrlGhjMQC+g/Q12h85wjy0jhKf6DyijcgcG8dFcJ8mZkrJWXRdiqSW748L5YfnHYRo1HeMnoahOAq3p5g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bca8ad2-657a-432a-a89a-08d83318af62
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 17:07:19.4271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDl/DJuFWcE0q5UIkMV6nLtn9S2/msPX4D4JWgrg6RXZ73C83pfNIrYhfW9WD051re8M4uIQKhMLmZb5BEtvKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115
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
Cc: anthony.ruhier@gmail.com, Kees Cook <keescook@chromium.org>,
 sunpeng.li@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, regressions@leemhuis.info,
 amd-gfx@lists.freedesktop.org, Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, mphantomx@yahoo.com.br,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-28 5:22 a.m., Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Am 25.07.20 um 07:20 schrieb Mazin Rezk:
>> On Saturday, July 25, 2020 12:59 AM, Duncan wrote:
>>
>>> On Sat, 25 Jul 2020 03:03:52 +0000 Mazin Rezk wrote:
>>>
>>>>> Am 24.07.20 um 19:33 schrieb Kees Cook:
>>>>>
>>>>>> There was a fix to disable the async path for this driver that
>>>>>> worked around the bug too, yes? That seems like a safer and more
>>>>>> focused change that doesn't revert the SLUB defense for all
>>>>>> users, and would actually provide a complete, I think, workaround
>>>>
>>>> That said, I haven't seen the async disabling patch. If you could
>>>> link to it, I'd be glad to test it out and perhaps we can use that
>>>> instead.
>>>
>>> I'm confused. Not to put words in Kees' mouth; /I/ am confused (which
>>> admittedly could well be just because I make no claims to be a
>>> coder and am simply reading the bug and thread, but I'd appreciate some
>>> "unconfusing" anyway).
>>>
>>> My interpretation of the "async disabling" reference was that it was to
>>> comment #30 on the bug:
>>>
>>> https://bugzilla.kernel.org/show_bug.cgi?id=207383#c30 
>>>
>>>
>>> ... which (if I'm not confused on this point too) appears to be yours.
>>> There it was stated...
>>>
>>> I've also found that this bug exclusively occurs when commit_work is on
>>> the workqueue. After forcing drm_atomic_helper_commit to run all of the
>>> commits without adding to the workqueue and running the OS, the issue
>>> seems to have disappeared.
>>> <<<<
>>>
>>> Would not forcing all commits to run directly, without placing them on
>>> the workqueue, be "async disabling"? That's what I /thought/ he was
>>> referencing.
>>
>> Oh, I thought he was referring to a different patch. Kees, could I get
>> your confirmation on this?
>>
>> The change I made actually affected all of the DRM code, although this 
>> could
>> easily be changed to be specific to amdgpu. (By forcing blocking on
>> amdgpu_dm's non-blocking commit code)
>>
>> That said, I'd still need to test further because I only did test it 
>> for a
>> couple of hours then. Although it should work in theory.
>>
>>> OTOH your base/context swap idea sounds like a possibly "less
>>> disturbance" workaround, if it works, and given the point in the
>>> commit cycle... (But if it's out Sunday it's likely too late to test
>>> and get it in now anyway; if it's another week, tho...)
>>
>> The base/context swap idea should make the use-after-free behave how it
>> did in 5.6. Since the bug doesn't cause an issue in 5.6, it's less of a
>> "less disturbance" workaround and more of a "no disturbance" workaround.
> 
> Sorry for bothering, but is there now a solution, besides reverting the 
> commits, to avoid freezes/crashes *without* performance regressions?
> 
> 
> Kind regards,
> 
> Paul

Mazin's "drm/amd/display: Clear dm_state for fast updates" change 
accomplishes this, at least as a temporary hack.

I've started work on a more large scale fix that we could get in in after.

Regards,
Nicholas Kazlauskas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
