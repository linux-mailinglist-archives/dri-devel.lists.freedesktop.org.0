Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EE722BF0A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 09:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D386E933;
	Fri, 24 Jul 2020 07:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845E56E92D;
 Fri, 24 Jul 2020 07:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlNBKaxUOYNaeXTgAhtl+dWCijblIlFJjpoRCcYuCdBrORROGg59s+drfMluX8McXK7zNFavon9LjoxOCDRnQAFGsmBFXGjhtglwSkE6u3/5OvIMbp7oVD2EDrCTRserYgp2QePganDPVKMixEamBJzSf3STNDNkK+v95WTJQVCX+EsQkLSNwCh7tgfxoXCnDARu/xq/7qKtVlIPgJtyTCzqx/Cc9McWAWhPvHJGeOPhsbbspfMxU6kew1xXbxqv7Ak+BRynrY3Qr2lS38bhFrDGEmls3jebcSM5swlWRlKgn6pG1ofzHgDVsijSTeiT9ZDBf3oMspAUbIc3XjejWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw+9IjABOTsw7I8XSuPGfJzd7Ri5xrCvALi7oFiu0IA=;
 b=fUgqqeQ0nfq7BhaaWulX2tNOfwpKVPqI5JxdXMwCxBPJOav7sWwyJjlY/z0C4Bp5FWOrlbfVhFz1jScet8LMMXH5jcXP/bL21mJ8UONwJDEoaNBqyRTT7apGvb+Z6fYQwALWYem4Hkvgz8/IThLNctUzDiHkBGUsila28uw2PSmLGLJpwtjWv8ncTVzqelS/mwJpgknCQx6urCnYHycAh/951q3C6Zs32453BpMhLcBEC4N8c6M22PPu8XvENZHIeoqhwowt0SLjIdUwzrWojTEebmCZaW2quZollj8CLNZaMz1GfG/awq6M029kl6eF+7URwOAaAU5Ac7sxu+S4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw+9IjABOTsw7I8XSuPGfJzd7Ri5xrCvALi7oFiu0IA=;
 b=G6qdrnEle2YC4/0nl9fYwaWKTb1YIXGx3Di/3jyqEpfjtJhUmgKyRk6sj1x+xPz0wdSQQy1/LudA+e7VJJAbm6mzGxZ7HqnEmEGqcETEyEwjdE7rdP1QK8NLul2oonYSmnUjWdcThSBAamnvG3zGRCAprQlG1ChZecpgoF99kAQ=
Authentication-Results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2354.namprd12.prod.outlook.com (2603:10b6:207:44::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Fri, 24 Jul
 2020 07:26:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.021; Fri, 24 Jul 2020
 07:26:41 +0000
Subject: Re: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
To: Mazin Rezk <mnrzk@protonmail.com>, Kees Cook <keescook@chromium.org>
References: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
 <202007231524.A24720C@keescook>
 <4KGdosy_NHW6FYCc2rCq4e71vYI7e4InqrLJ4S1GJsLcfjHv_INF-CzIYusOFqznOxyvflBTlFCXvyy7J37fn-QKfNOQK78MM38VdjdUXks=@protonmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6ab6f915-b316-97b4-53ab-21a5531637c7@amd.com>
Date: Fri, 24 Jul 2020 09:26:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <4KGdosy_NHW6FYCc2rCq4e71vYI7e4InqrLJ4S1GJsLcfjHv_INF-CzIYusOFqznOxyvflBTlFCXvyy7J37fn-QKfNOQK78MM38VdjdUXks=@protonmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0073.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0073.eurprd06.prod.outlook.com (2603:10a6:208:fa::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.20 via Frontend Transport; Fri, 24 Jul 2020 07:26:38 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5c49be57-ee53-4844-c529-08d82fa2e890
X-MS-TrafficTypeDiagnostic: BL0PR12MB2354:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2354593B88852019C70AD5EB83770@BL0PR12MB2354.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Be9xtTtNoRn+hij+cE4Bm4EzdGhC/jjXU0g6IZqWFM7KX4vLYromfijyZRwtEhRWx8E836egvDjyooG9VwkibYK2AXaGSHtHsRd9GX1zVjBa8XapwY/vAds2OLdVISGxbs908Y+VEUnQ82ZRKRo7UAWgj2W5/bf376XoDFnmxH+B7MnbHgiNccM6xxHIdI6NbkvReeUPUSmfd5agfisVQv7zhJDBEaCVk+7EbngTVnGR62AxHleXDSsWHw8aXQ6v2TBG7MpY9QBOfZdXfR/IhG12U+wA+oUlZuKmuySqm0UcPL8vTmyNqFAM4f4bhDpnzloCqaykY79L83qVPw3vlpNY3y0ZeUWk7esOdRuhIfQT2IA/xSdodwtapNyUKivrmQ2LK4KFv/fABANHesG4inm9Eg2V0lv+ygY1Gjrs/wB8vYNpvVkLVDixcwnil5EhU1BCk+EtzklXZ4D2V0wD9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(966005)(53546011)(66476007)(2906002)(52116002)(2616005)(66946007)(31686004)(83380400001)(7416002)(186003)(66556008)(16526019)(45080400002)(54906003)(110136005)(6666004)(478600001)(316002)(4326008)(5660300002)(86362001)(8936002)(31696002)(6486002)(8676002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: vNtWOV0AmIqJxAn4TlZ2upRlnLbkHjIhbd3/pIFMq/ULEkvFtERlq37egvlzGNICzI1FfBA8KOgg/eWciRamIrBGQevbARQ8DQ0wPwI32w8wDt1UQ3kr8LbvJBMpsCVaWyhjS8JIXR8cfJKfF6m5jL9AK0slZwe+EXnpjZjAr/NSXgVJwZlGt61xTVzzywU2CdKHKP9564u3MeVX3YsRyHwhc2evbymuEFQBTv+iwSQctQlqikH30a4lnr6+olXw3otOmE8HmO+JTXDlBJcH9i08c9hriq0lU1DAMAdSuySBoa0gXjQnWqPOxHTOY77ZaiCfc0BFjObcFTjVeXCx/KxMG6pe9uv1+4uE+mbTZd9ihYewhqCw6TM5dpzAQn7UuRvTb/+aGPdnAyw/2DlHO75qksgjrV/9lM0JmydIw53I+JhfmNcJz2jaMPkAV2KKk/RdaI9ZweY75onrT9FgYht4Csz02+uinHUCy26VfRPlgZx67Q+G8570Nt+6gXiKVfutSoxCCXJHkyE1DdEQ5YwlbVwDryJwHugw+7Uksjvj3hYJAeKalIW5zD5vovQ3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c49be57-ee53-4844-c529-08d82fa2e890
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 07:26:41.0341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DYxBxhd+21e77TDQaOthWSSIYml1+FMT1AHtGvTX2chEMbjchQPZfSsE2fFG8e8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2354
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
Cc: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>,
 "anthony.ruhier@gmail.com" <anthony.ruhier@gmail.com>,
 "1i5t5.duncan@cox.net" <1i5t5.duncan@cox.net>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "mphantomx@yahoo.com.br" <mphantomx@yahoo.com.br>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.07.20 um 00:58 schrieb Mazin Rezk:
> On Thursday, July 23, 2020 6:32 PM, Kees Cook <keescook@chromium.org> wrote:
>
>> On Thu, Jul 23, 2020 at 09:10:15PM +0000, Mazin Rezk wrote:
>>
>>> When amdgpu_dm_atomic_commit_tail is running in the workqueue,
>>> drm_atomic_state_put will get called while amdgpu_dm_atomic_commit_tail is
>>> running, causing a race condition where state (and then dm_state) is
>>> sometimes freed while amdgpu_dm_atomic_commit_tail is running. This bug has
>>> occurred since 5.7-rc1 and is well documented among polaris11 users [1].
>>> Prior to 5.7, this was not a noticeable issue since the freelist pointer
>>> was stored at the beginning of dm_state (base), which was unused. After
>>> changing the freelist pointer to be stored in the middle of the struct, the
>>> freelist pointer overwrote the context, causing dc_state to become garbage
>>> data and made the call to dm_enable_per_frame_crtc_master_sync dereference
>>> a freelist pointer.
>>> This patch fixes the aforementioned issue by calling drm_atomic_state_get
>>> in amdgpu_dm_atomic_commit before drm_atomic_helper_commit is called and
>>> drm_atomic_state_put after amdgpu_dm_atomic_commit_tail is complete.
>>> According to my testing on 5.8.0-rc6, this should fix bug 207383 on
>>> Bugzilla [1].
>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D207383&amp;data=02%7C01%7Charry.wentland%40amd.com%7C53cc9cffb1d244d7b43508d82f5bed1b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637311419153032496&amp;sdata=t45vmEJ80UXOmRfndGfe69AOedtkFUwDqvWgGDrSuOk%3D&amp;reserved=0
>> Nice work tracking this down!
>>
>>> Fixes: 3202fa62f ("slub: relocate freelist pointer to middle of object")
>> I do, however, object to this Fixes tag. :) The flaw appears to have
>> been with amdgpu_dm's reference tracking of "state" in the nonblocking
>> case. (How this reference counting is supposed to work correctly, though,
>> I'm not sure.) If I look at where the drm helper was split from being
>> the default callback, it looks like this was what introduced the bug:
>>
>> da5c47f682ab ("drm/amd/display: Remove acrtc->stream")
>>
>> ? 3202fa62f certainly exposed it much more quickly, but there was a race
>> even without 3202fa62f where something could have realloced the memory
>> and written over it.
>>
>> -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
>>
>> Kees Cook
>
> Thanks, I'll be sure to avoid using 3202fa62f as the cause next time.
> I just thought to do that because it was what made the use-after-free cause
> a noticeable bug.
>
> Also, by the way, I just realised the patch didn't completely solve the bug.
> Sorry about that, making an LKML thread on this was hasty on my part. Should
> I get further confirmation from the Bugzilla thread before submitting a patch
> for this bug in the future?

Submitting stuff as early as possible is mostly a good idea. Just if the 
code is utterly broken or completely unreadable you should probably 
expect a harsh response :)

Maybe ask for more testing in the commit message if you are not 100% 
sure if that really fixes a bug or not.

Regards,
Christian.

>
> Thanks,
> Mazin Rezk

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
