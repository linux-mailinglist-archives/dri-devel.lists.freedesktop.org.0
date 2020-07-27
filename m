Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7766522ED3D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 15:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD36589C82;
	Mon, 27 Jul 2020 13:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AB689C82;
 Mon, 27 Jul 2020 13:27:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFAHTGOvU/Df27D5RbKQ6YbkJODhNcipykVRaRpmlatETLodXrQVE+Kquid8Eo9IkjYYB76zUbPHn0UKalhXNQ+6po8VPfn6SUgWpJsG/vh6XG8aJTAXxgKLnIvkC3hbkzPklkCcXtLSphN/SXolH7Lk+aHzO2xude9WHdYyVHZARpUciJKIO6P18BW409/yxMlJMlbGMUZK5YD81TzDgFtCmYglMiRs3XV+50NnOjAeSpoiJLTVRnGOMMK3bk2tmaN6coqwXWkATw50ILXaPcIP7fW1ssnOl2dEXE6kr8Ck5/0Uj5fVx+lSyuddJ16wvgWfVQNhKqx9svXRYO/Rog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/nkM/kKJ2ZuwPdrY8KfAKFJMCz4i9EFVFcZ5w0rD6g=;
 b=MTZeN8Jv4UG5iPPKazhh8ulu9fhmpTzdNKxkYu/QpRmlIXXpTH9q+KTl9yswR7hHeGX9nR0vvUh8bCbd6LoIPYPkffGoohnoxQrGAVr2sn/0S8heLUyi5Vrw8yKE+EDJNLP9+QC+PkFtL4hCixXY7LhJKYMo+//m146jg4juRZV5wbM8o+VQsKb/+SLVbo+4ghY89za8XCIg8WqHj7tAN0Lhax29maBmqCC2XvBxuKDPJkkcx4nOonySuqu1HkL1CweGxNlTz4GNT9MZ30jLttCdjDVTiik7Y6C3/yCzepApcB0uUnLvL0kEzbiH/+3p0TBk6G7Lv5wtrXLTY+odsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/nkM/kKJ2ZuwPdrY8KfAKFJMCz4i9EFVFcZ5w0rD6g=;
 b=Ni3dESiyDWtQYANIj8yi4JR/4tLqwFDyPGhe2mK7Lwbr2NKeWWuODM4zs7V1HclCn2YrDt4IATwJP38tNM207RMFEOQMaFM0P+bpYanDaH4Zb8RMeFuhjujj0bYaT5YWc5JYGFH+LbErnG0+KgOkEIuqcu8AuonBtdYgoU8Xdiw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3561.namprd12.prod.outlook.com (2603:10b6:5:3e::26) by
 DM6PR12MB4090.namprd12.prod.outlook.com (2603:10b6:5:217::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23; Mon, 27 Jul 2020 13:26:59 +0000
Received: from DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::6df0:61cb:d37:2a0b]) by DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::6df0:61cb:d37:2a0b%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 13:26:59 +0000
Subject: Re: [PATCH] drm/amd/display: Clear dm_state for fast updates
To: Mazin Rezk <mnrzk@protonmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <M0lxN5AUlPvzBKULfIBe5BZRwfQGXeMQCdWItYcQ-9P79y32WzExYK2Y0DwyNVtyGelqbvV07_lFk1oeT4cApbT-P_oH0bnxQbMmFsJv_xg=@protonmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <c8e3031a-b21f-2b19-9d39-7a01687c7f06@amd.com>
Date: Mon, 27 Jul 2020 09:26:54 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <M0lxN5AUlPvzBKULfIBe5BZRwfQGXeMQCdWItYcQ-9P79y32WzExYK2Y0DwyNVtyGelqbvV07_lFk1oeT4cApbT-P_oH0bnxQbMmFsJv_xg=@protonmail.com>
Content-Language: en-US
X-ClientProxiedBy: YQXPR01CA0106.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::35) To DM6PR12MB3561.namprd12.prod.outlook.com
 (2603:10b6:5:3e::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.180] (24.212.165.133) by
 YQXPR01CA0106.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:41::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Mon, 27 Jul 2020 13:26:57 +0000
X-Originating-IP: [24.212.165.133]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 02e6dd5c-9f22-4225-db51-08d83230bd31
X-MS-TrafficTypeDiagnostic: DM6PR12MB4090:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB409095C63D0200D57BA3955FEC720@DM6PR12MB4090.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PjpkNFXzsHZ31Ry2g+HAH7K+oosCbZJObYRx7n9bf69WM+mXDVcuXEGowSU5Wlce3gy4gHmSN+DaQLwlodidS/iIEx7K4L71fO1KKwdg707JJ9J6cwBvO9JCKBAhiWeBSGJPMeDZqyuJRjDL8GCFC3YL/H76dU2wjrzXeqlMdUJW+Qa9xUDhA6jAjuxwdmrHSNHqKV8O+nSUdTmb5xtiPBbUFocji+hB6Q3++i24cAaHm4Z7TQl+aJuRi6SYflhACyxkrnAr4q22F5tTEwyhG924Pv6m0iWawUvl8Mogbjgl4nLQi73ShQVO/yZWYWXeQqSWKudvOph8PA0GYeSvTJe6EK7DGTwmgTD3yvGNHMQ7UYbypi2mzUSlZXWMq381FobG0DsffsH2ipi7RvBv25LRj1BhdCAGaWY2JwsaOqVYXPaoxssq6d9IECbfsKksf+2JUZkAvs3CKkcvd0hxfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3561.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(53546011)(16526019)(66556008)(31696002)(966005)(316002)(36756003)(6666004)(478600001)(31686004)(4326008)(6486002)(26005)(16576012)(15650500001)(86362001)(66946007)(110136005)(2906002)(956004)(66476007)(8676002)(52116002)(2616005)(54906003)(186003)(5660300002)(83380400001)(7416002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: R5wrgS1ARCTm50a/ei1MLMxU+BR8p1qdckjS8rpthBn03Of0kOYVzBlCNJy5XULwWXtfjmIABWZEd5+eDiPVz71J+uX4X9xW9ESBBMYG0yeSEzke9Htn6QkWQz6afj5HT+QMnQkl1EQyJ0fbLy122qL6aQLrH8xfIs0RO53tajWVUfzQtNfhBIvDfu7tVOLF2lbqBio2Bft/o9DA14bFOw8+2Mx0GsmSRJzGVcjoUYypUYErx+lbA4RQ4fFsiAZlqUhd9ZqJMCog+qpew3hkrjHv3nISYh31ORGojSdE1s3JkJWIqFZfxR8e4vcxFkouB55btb5aAzjS3U2PglS+zD/8PdnrtblxG4Iy3SfvdnV2sziNGTRQYrCDhD7u7WQTbCV5h9p7r9dxij8SsDNxTtc41t7aWKx067SPBjkV7vT36kUgfoi5XNezcFnAaMQtWjwHdZqbzsvawEi/pTXMilsvhaKX5W0wvXEp66IAWhE1+fPnnxENlQgrrtH20Wtv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e6dd5c-9f22-4225-db51-08d83230bd31
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3561.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 13:26:58.9394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9mV7BL7G/ifAgZEOqI3nJ3q/Pyx7d8wulJMvrdPL4fpx/CPMUWNsjhNS5Z9w40BDy58hWQnnQw8fkzv7t23tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4090
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
 "mphantomx@yahoo.com.br" <mphantomx@yahoo.com.br>,
 Duncan <1i5t5.duncan@cox.net>, Kees Cook <keescook@chromium.org>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "anthony.ruhier@gmail.com" <anthony.ruhier@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-27 1:40 a.m., Mazin Rezk wrote:
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
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=207383
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

In the bug report itself I mentioned that I don't really like hacking 
around the DRM core for resolving this patch but to go into more 
specifics, it's really two issues of code maintenance:

1. It's iterating over internal structures and layout of private objects 
in the state and modifying the state. The core doesn't really guarantee 
how these things are going to be laid out and it may change in the future.

2. It's freeing an allocation we don't own from DM. DRM doesn't track 
this state elsewhere for purposes of freeing, but nothing is really 
stopping the core from doing this later down the line.

The implementation itself is correct from a technical perspective, but 
I'd rather it reside in DRM as a helper for code maintenance purposes.

Regards,
Nicholas Kazlauskas

>   		}
>   	}
> 
> --
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
