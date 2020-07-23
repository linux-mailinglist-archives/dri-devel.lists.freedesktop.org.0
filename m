Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC62122B940
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 00:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C08D6E215;
	Thu, 23 Jul 2020 22:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11356E112;
 Thu, 23 Jul 2020 22:16:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4ApQ8PNVUn9V56eIKQXiKaUdxwZrQF/dQLEUbyu0JHfYsBcXCrcO10zcSKqyrwFgMFQxiIC4p2K7sGdgzPT4jzw+Cth13nEvbUJua/XsV1RBF4rVmujXY4+L1T+LzQr4NvRmw+LHjOOjoSK5QTzQSvYFgeS5JfpnQ2qbdovCz89EaZSZ5TRacdYKOolef44c2SpgLPwjO9sC7nOpK9dqcEDKSmb7KnH8pPG85fq4u5trDtgtVvFirHK7xPNiVwTk/YK9OMyiHBPJeEOZAqsIdGczkC4HZ2OUC5let6oMjTKI880R4CsdofCqbz1aumLgIwDcHp2j/O/D0ITMpshCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wV0Uapo9sQyIhz3RCYErPRQdQ6xWKRWP/EZr1b+FbK0=;
 b=hGdUbI85baH0pimdF7Zz9if/iqqsNZFrxsPyl7lKsFZSBKsAkgzl5LOIBR1UD5/vCTiN/ddSO0/ovMS3rz9tBnvkksYmPc3ljDiA/l+M/8ZzEx9qjiE96iMfFybZ5+CTkAC1pcNSWW302pKuFRAjhx60KhvsTmTJ0HEJCnPZjRuVRO0SKL+CRRY8KyubXqgeprszHNbi4CG6YT+8g3VK6PK9oorEbooQFumtrjX61MKDUSUb5AtUjyia2FFFSkB+oFMBpwzN9BQNVmum7DuAI/fGRSgt1U+EPPCz4n9Cp/9t36r35jbCpYfe/HZgorUfshwnRVCoT4ia2TqXUIYe+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wV0Uapo9sQyIhz3RCYErPRQdQ6xWKRWP/EZr1b+FbK0=;
 b=NWdiga2HfnUzpI2g3xFGQ4lA/6Mj5ATWa29dM6E4XY5uEMaZd87vSDd/UtsNYqQz4m7LAkr3HuUXBt9OSolbsrFKYHc3AOYy8IZXNa/GZ0K5cS+3oYfl5evIawEg8DDRjLVr2w+6e4yOhSeKT7D2hML4dwDsUNsWWXwj4BP+HrU=
Authentication-Results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB3780.namprd12.prod.outlook.com (2603:10b6:a03:1a2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Thu, 23 Jul
 2020 22:16:13 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1%7]) with mapi id 15.20.3216.020; Thu, 23 Jul 2020
 22:16:13 +0000
Subject: Re: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
To: Mazin Rezk <mnrzk@protonmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <ccd5d51b-b018-a3db-169b-ba6278a7be9f@amd.com>
Date: Thu, 23 Jul 2020 18:16:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
Content-Language: en-US
X-ClientProxiedBy: YQXPR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::29) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.180] (24.212.165.133) by
 YQXPR01CA0100.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:41::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Thu, 23 Jul 2020 22:16:11 +0000
X-Originating-IP: [24.212.165.133]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6270b484-1cb9-43b6-2de9-08d82f560290
X-MS-TrafficTypeDiagnostic: BY5PR12MB3780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB378063A5C388F3C1FBDBDC96EC760@BY5PR12MB3780.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: quVr1n2BqyTrsH20QEBaktWi24eYzboV56VkfWyzNiMEcTVCSsn9HIlOpIOk4ylxWQTc0a0mGBxqIiUcoUGJkQ/rvYiSx/Q85SAPZ6jTMRLZ16BvwixORQ4gwdNyh7yrNqFdpaINNFv/IUn/hhr6Vic2G7OL5bqq1rchFT/GlyUEQJiilzgvUfR6dfMlBITqk0LyoI0rYkAQc17K6yeLnR+zLmkJw4H84pJ+6UKivzycXMLvZdBRJ77nr2EIoblmzNxXx/0TPGgsoqEuxRcaaB41BsLsEOdOOGAp9Pl2yhUSwwOn2cHklcCZWOyEObl3Usc5vCMDpk4PGfFO8G321wImeZINWwPfTbW9fFgzs8B6ds3CqIQrkzrbhS8tOln6Q0/x43dZD1get9GufOPmeiDonKp1B6XO/MpXXsoQuEF/vf/i0qGIWlzGR08X5b6BSRN2jFhuOB4/A6E4dvkXaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(66946007)(2906002)(66556008)(66476007)(6486002)(52116002)(8936002)(31686004)(186003)(110136005)(54906003)(86362001)(26005)(16526019)(316002)(16576012)(53546011)(8676002)(31696002)(36756003)(478600001)(5660300002)(4326008)(7416002)(83380400001)(966005)(956004)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: OARquHn5enyEYYKP5IJeC143qevG3PUSUUaB+bAbc9hUgN0egdjgXyxru+hmKwGdwPG4tlDijqaRCrRQG7vStF3xwcT33BZ71rvY0bC9vASgqMqz5UBccGCvVqb01ayAh1cNaHKw7LEhcyA9wIowcYpo7ByE9A2Iv94IN2ovoRC4PVpCa/+B3TdCtWpkDiXwyV35a4EoHwxXryyaqENetwivL39i/PEtD0V3lJhtNShd1zAEabkodJr5gJ15oOpj78V1pqsIK8nF9SMHyGOm1ENYU2ydHR+BupOXesqG2fNdxMJYGLVShXO2DuVHJUZ2I5EFm16hDQ5al5DleflI0BtB8IW4YiLhX+9eqD4mZs5DUQThMWRnT5SXEeBMIWEB/ppM+dcly+wFd28xu1boqYU036frzhkvIuXm3tZ2eEof3AJJKkTzEJSrtY2ml2rpC+RAkK3yECPbPMaSu+QOXN61NuZsXwQYEq2v/UE7mjm2qg2Qkp7231dlcRqakOfl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6270b484-1cb9-43b6-2de9-08d82f560290
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 22:16:13.2899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNAm1FyK4NOgATjoPCsbLd59AKoVyuddkjGDhJP6+2iV3hsWVfjZz4rl3DgKPXa+6VFEO0ktJ9kHN08ttst3Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3780
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
 "keescook@chromium.org" <keescook@chromium.org>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "mphantomx@yahoo.com.br" <mphantomx@yahoo.com.br>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-23 5:10 p.m., Mazin Rezk wrote:
> When amdgpu_dm_atomic_commit_tail is running in the workqueue,
> drm_atomic_state_put will get called while amdgpu_dm_atomic_commit_tail is
> running, causing a race condition where state (and then dm_state) is
> sometimes freed while amdgpu_dm_atomic_commit_tail is running. This bug has
> occurred since 5.7-rc1 and is well documented among polaris11 users [1].
> 
> Prior to 5.7, this was not a noticeable issue since the freelist pointer
> was stored at the beginning of dm_state (base), which was unused. After
> changing the freelist pointer to be stored in the middle of the struct, the
> freelist pointer overwrote the context, causing dc_state to become garbage
> data and made the call to dm_enable_per_frame_crtc_master_sync dereference
> a freelist pointer.
> 
> This patch fixes the aforementioned issue by calling drm_atomic_state_get
> in amdgpu_dm_atomic_commit before drm_atomic_helper_commit is called and
> drm_atomic_state_put after amdgpu_dm_atomic_commit_tail is complete.
> 
> According to my testing on 5.8.0-rc6, this should fix bug 207383 on
> Bugzilla [1].
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=207383
> 
> Fixes: 3202fa62f ("slub: relocate freelist pointer to middle of object")
> Reported-by: Duncan <1i5t5.duncan@cox.net>
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>

Thanks for the investigation and your patch. I appreciate the help in 
trying to narrow down the root cause as this issue has been difficult to 
reproduce on my setups.

Though I'm not sure this really resolves the issue - we make use of the 
drm_atomic_helper_commit helper function from DRM which internally does 
what you're doing with this patch:

	drm_atomic_state_get(state);
	if (nonblock)
		queue_work(system_unbound_wq, &state->commit_work);
	else
		commit_tail(state);

So even when it gets queued off to the unbound workqueue we still have a 
reference on the state.

That reference gets dropped as part of commit tail helper in DRM as well:

if (funcs && funcs->atomic_commit_tail)
		funcs->atomic_commit_tail(old_state);
	else
		drm_atomic_helper_commit_tail(old_state);

	commit_time_ms = ktime_ms_delta(ktime_get(), start);
	if (commit_time_ms > 0)
		drm_self_refresh_helper_update_avg_times(old_state,
						 (unsigned long)commit_time_ms,
						 new_self_refresh_mask);

	drm_atomic_helper_commit_cleanup_done(old_state);

	drm_atomic_state_put(old_state);

So instead of a use after free happening when we access the state we get 
a double-free happening later at the end of commit tail in DRM.

What I think would be the right next step here is to actually determine 
what sequence of IOCTLs and atomic commits are happening under your 
setup with a very verbose dmesg log. You can set a debug level for DRM 
in your kernel parameters with something like:

drm.debug=0x54

I don't see anything in amdgpu_dm.c that looks like it would be freeing 
the state so I suspect something in the core is this doing this.

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 86ffa0c2880f..86d6652872f2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7303,6 +7303,7 @@ static int amdgpu_dm_atomic_commit(struct drm_device *dev,
>   	 * unset legacy_cursor_update
>   	 */
> 
> +	drm_atomic_state_get(state);

Also note that if the drm_atomic_helper_commit() call fails here then 
we're going to never free this structure. So we should really be 
checking the return code here below before trying to do this, if at all.

Regards,
Nicholas Kazlauskas

>   	return drm_atomic_helper_commit(dev, state, nonblock);
> 
>   	/*TODO Handle EINTR, reenable IRQ*/
> @@ -7628,6 +7629,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
> 
>   	if (dc_state_temp)
>   		dc_release_state(dc_state_temp);
> +
> +	drm_atomic_state_put(state);
>   }
> 
> 
> --
> 2.27.0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
