Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1448E22EDA1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 15:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA28889C61;
	Mon, 27 Jul 2020 13:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D4089BFE;
 Mon, 27 Jul 2020 13:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gL6MYc37Y7rTxODU9D0HQkwbXkQpccaQZU955AQRJAOUmrwOQdAuJavvV2StECPx8gE+UyP5DhFBmzo56MZaA70oL2/mFaRIFswiiTYYGSdxR1W8QdV0kdWzr3F7slXYjY/hsk5+xzxb4FhxlJcbJD+lkWR2Z9kKLoh6hk7C5ZN7cjfmLrGw7tG8BQNA4ly34sU6YMsBpCb7l2vfBmUQBXbuBaCzsBQihpBjrNsNaleLJcJrxRnh1prbkm7SKTR5hjrh1LvSbDiY95RproS0wL1imCoeZl+JhPNilJxuHBGy6YnT1BZX9Azqf235BaVAAHewuZ73dW+9Kyz2VmYZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51K/yy6E4H9tRje5PTimdsjradOXcjxWoAkp/JdSlTI=;
 b=VlSPLV66FCxm9ru8FBc4xD+H7oLt1EJHmKjG3cYeXtYkTrCiz11obHh6vQqIM5I5vkqDrhrzXr8DLzg4AtWd14XuqFUCC8ZrFCevTsO53IR6GVGFXeS1Tzdp94ldg5Wxatced0q/PmCWqI405k70W7g7vaneOW/GTgJ6rdW37aAafx0kf/v58NYuEuh2nDDxuKMG0aSwSd197ItkX+6hpsgbmZIVb7eaPrmIOfylJuO2MOWDpvydAVoIxCK7A6WmRmOO3kGU6bcp7YTBz96cN9/AalJis0g7SF3itPUcpSqxP/+Baxsj4DxTy0rRbdBvxB53fY/W290frjvT3isKlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51K/yy6E4H9tRje5PTimdsjradOXcjxWoAkp/JdSlTI=;
 b=L8JykQug4izzxwtXmi/pt/dO3JgLisusjCEm3urkNiNkl00d1xqxJu/72oc/hpcdJprCbMhTmd3E1KjZtnA5WVQBFlXVyUSllV7rcCpt7YYmXOsP8CN42WxspmLkS4SWCXZ5DgeRd1qIGk1xNwfBafWGBVSYLRowYSEgRBHtDKM=
Authentication-Results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Mon, 27 Jul
 2020 13:39:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 13:39:47 +0000
Subject: Re: [PATCH] drm/amd/display: Clear dm_state for fast updates
To: Mazin Rezk <mnrzk@protonmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <M0lxN5AUlPvzBKULfIBe5BZRwfQGXeMQCdWItYcQ-9P79y32WzExYK2Y0DwyNVtyGelqbvV07_lFk1oeT4cApbT-P_oH0bnxQbMmFsJv_xg=@protonmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ba078fb0-0dbc-df06-cfe9-f9537883f82a@amd.com>
Date: Mon, 27 Jul 2020 15:39:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <M0lxN5AUlPvzBKULfIBe5BZRwfQGXeMQCdWItYcQ-9P79y32WzExYK2Y0DwyNVtyGelqbvV07_lFk1oeT4cApbT-P_oH0bnxQbMmFsJv_xg=@protonmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0069.eurprd03.prod.outlook.com (2603:10a6:208::46)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0069.eurprd03.prod.outlook.com (2603:10a6:208::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Mon, 27 Jul 2020 13:39:45 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6addd46-628f-47f8-1223-08d832328734
X-MS-TrafficTypeDiagnostic: MN2PR12MB4302:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4302074372299FC05E878CAA83720@MN2PR12MB4302.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EQTkAolNRDTlbFSea5hc4MgFUG80N44/YE2z/6X2aOXwtJQXUBSzh4k3b13tDMv8ViFKZBPRce5fpgkBLaDMkoemF9uWg/oQW2TloUt7LYCAxbLuRzI7tMIKnBZG7EoXmTbwjCqJ5etEEitFg8mZDdHq8euyeOs5dg6m0j1v8OYAZtysJbtpILrD9o936aZabYR8e/on+Kh4C+ChuoOvk4zWhGJOG2xvmpzhJtidtWz+y2kU9gvQ8ZljfxRdJfdFvZPv2dAt8mXTr1RhLlbNkgVIqODZg26E7DWjg32wFMu8qwX5+ibfXQUPVjTrur9eqdTpw7KvSUUedUnse4+cwXc9C4eBt3pOCqx70yae8cyDrLU78Zg5+Ej2jwYUhxcqu2UqqoyHRRhwe2OuNUT2zbf5VgZwJIDHbOc7TL52Ct1+LK6zBcryrSNa+ed4o20YkhAgAFaB8dkZVboY2t/i4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(316002)(8676002)(478600001)(2616005)(66946007)(4326008)(45080400002)(6486002)(66556008)(66476007)(2906002)(6666004)(186003)(31686004)(5660300002)(16526019)(86362001)(36756003)(15650500001)(54906003)(83380400001)(7416002)(8936002)(31696002)(110136005)(52116002)(966005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: kPjR53l4gMo3J/zkps+ASxCmJtnyOG5BJjVE/9T4ShHLe3m8uajFIJUERDM3bI6DP2ZiT1nB3SVQc5vpmZaBLk6GCYfTVe6g9Wd78WEqbGtGAK/5Uyoitk4WrUP63rAJ9VIfsqcaizk6ZfwP5j1s4CNWSG5Wsl202p+jiKob0S7QvjuQt7UcJCbx2BMDkKYFeIlVgcPDHfwINaNdzPOzP87T0tQSzgRjcwtSKfYV71LkcIupx1F8y0PCD7KTrM0TP+cliRsX7Tu1k70a32aJfiUZ3eQEJNDQ01aQgOdAcHRYg7U2f4QvMidtfc2Z/8bkYE4tWO//fvIgbnL6EzjMoKWV7q4s+TqXF8gmdxW07DHuxvDshnaCoJjt3isvOOD29VOwroonw5xmENR7/C/mTHXskECGRNj53lQzY52s0Cfx/iSvFw0oHf4MjVdWz9Msk9dIpWZ3MTe9FpF+l7XRSk96VpoNpo6FDon/QQEUfxx9N69/j4cMQ9vIyCopzj+Y45FiklXXWIO02cy1/1ivNP1+dFwcilVgnFnXMPj0Lyau+2lW+PE8mWFU3gGG+iBB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6addd46-628f-47f8-1223-08d832328734
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 13:39:47.2934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voH7p2/jP26h8/UY+wt1T35sdubb/oZbjyg98Ha+2ljvD+8gYSs+YRoEikocZ9w2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 "anthony.ruhier@gmail.com" <anthony.ruhier@gmail.com>,
 Duncan <1i5t5.duncan@cox.net>, Kees Cook <keescook@chromium.org>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "mphantomx@yahoo.com.br" <mphantomx@yahoo.com.br>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.07.20 um 07:40 schrieb Mazin Rezk:
> This patch fixes a race condition that causes a use-after-free during
> amdgpu_dm_atomic_commit_tail. This can occur when 2 non-blocking commits
> are requested and the second one finishes before the first. Essentially,
> this bug occurs when the following sequence of events happens:
>
> 1. Non-blocking commit #1 is requested w/ a new dm_state #1 and is
> deferred to the workqueue.
>
> 2. Non-blocking commit #2 is requested w/ a new dm_state #2 and is
> deferred to the workqueue.
>
> 3. Commit #2 starts before commit #1, dm_state #1 is used in the
> commit_tail and commit #2 completes, freeing dm_state #1.
>
> 4. Commit #1 starts after commit #2 completes, uses the freed dm_state
> 1 and dereferences a freelist pointer while setting the context.

Well I only have a one mile high view on this, but why don't you let the 
work items execute in order?

That would be better anyway cause this way we don't trigger a cache line 
ping pong between CPUs.

Christian.

>
> Since this bug has only been spotted with fast commits, this patch fixes
> the bug by clearing the dm_state instead of using the old dc_state for
> fast updates. In addition, since dm_state is only used for its dc_state
> and amdgpu_dm_atomic_commit_tail will retain the dc_state if none is found,
> removing the dm_state should not have any consequences in fast updates.
>
> This use-after-free bug has existed for a while now, but only caused a
> noticeable issue starting from 5.7-rc1 due to 3202fa62f ("slub: relocate
> freelist pointer to middle of object") moving the freelist pointer from
> dm_state->base (which was unused) to dm_state->context (which is
> dereferenced).
>
> Bugzilla: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D207383&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C16d6d6d4a02241deb94e08d831efa1bb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637314252605493548&amp;sdata=JuaMFSMTjAVQBBpbXIf2RWj%2BLcx19ki25XLXbr1C6RA%3D&amp;reserved=0
> Fixes: bd200d190f45 ("drm/amd/display: Don't replace the dc_state for fast updates")
> Reported-by: Duncan <1i5t5.duncan@cox.net>
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 ++++++++++++++-----
>   1 file changed, 27 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 86ffa0c2880f..710edc70e37e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8717,20 +8717,38 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>   		 * the same resource. If we have a new DC context as part of
>   		 * the DM atomic state from validation we need to free it and
>   		 * retain the existing one instead.
> +		 *
> +		 * Furthermore, since the DM atomic state only contains the DC
> +		 * context and can safely be annulled, we can free the state
> +		 * and clear the associated private object now to free
> +		 * some memory and avoid a possible use-after-free later.
>   		 */
> -		struct dm_atomic_state *new_dm_state, *old_dm_state;
>
> -		new_dm_state = dm_atomic_get_new_state(state);
> -		old_dm_state = dm_atomic_get_old_state(state);
> +		for (i = 0; i < state->num_private_objs; i++) {
> +			struct drm_private_obj *obj = state->private_objs[i].ptr;
>
> -		if (new_dm_state && old_dm_state) {
> -			if (new_dm_state->context)
> -				dc_release_state(new_dm_state->context);
> +			if (obj->funcs == adev->dm.atomic_obj.funcs) {
> +				int j = state->num_private_objs-1;
>
> -			new_dm_state->context = old_dm_state->context;
> +				dm_atomic_destroy_state(obj,
> +						state->private_objs[i].state);
> +
> +				/* If i is not at the end of the array then the
> +				 * last element needs to be moved to where i was
> +				 * before the array can safely be truncated.
> +				 */
> +				if (i != j)
> +					state->private_objs[i] =
> +						state->private_objs[j];
>
> -			if (old_dm_state->context)
> -				dc_retain_state(old_dm_state->context);
> +				state->private_objs[j].ptr = NULL;
> +				state->private_objs[j].state = NULL;
> +				state->private_objs[j].old_state = NULL;
> +				state->private_objs[j].new_state = NULL;
> +
> +				state->num_private_objs = j;
> +				break;
> +			}
>   		}
>   	}
>
> --
> 2.27.0
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
