Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB57E637DBD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 17:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F96610E13A;
	Thu, 24 Nov 2022 16:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CF410E122;
 Thu, 24 Nov 2022 16:51:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8C67AB8284C;
 Thu, 24 Nov 2022 16:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17275C433D6;
 Thu, 24 Nov 2022 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669308658;
 bh=LqTeO6gNFJ8QzpGc7p1Ojhk4LXQvlTeE1H7lbaBY37I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R6PpUCqscN7vv03f6DE3nnqQRkJ5f7xJXkmEn1/A6TX2DB2jIzeVWC2nrmvuWnfd7
 v7d/Yxm+73wnzbXxeL7wmPULHybcYkWnkKeSihr0wl0qqWQayeDcQXX5Plsk4JlVZf
 pC9MmgxljQ0mbjIMW/uvP7uVvf7+a34eFOaarpWpQzFfsIMl36agB7P2ytbY6xMWbX
 PRvmi2dKf/gZHmT9aBf0lfpKaGEHkN9PsIlityYeq4SMlFJ2DicV58Du5BA7g1Xyjw
 GDbE4j4Rn+s6BbSg5oY3azaJ3+UEGiSGasyggnfi1XzZW20JeuTUQy4bJydpxw86Jv
 AbI0OjCWy4hvg==
Date: Thu, 24 Nov 2022 11:50:56 -0500
From: Sasha Levin <sashal@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH AUTOSEL 6.0 38/44] drm/amdgpu: Unlock bo_list_mutex after
 error handling
Message-ID: <Y3+g8KpFuNG/SqaR@sashalap>
References: <20221119021124.1773699-1-sashal@kernel.org>
 <20221119021124.1773699-38-sashal@kernel.org>
 <e08c0d60-45d1-85a6-9c55-38c8e87b56c3@mailbox.org>
 <0916abd9-265d-e4ed-819b-9dfa05e8d746@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0916abd9-265d-e4ed-819b-9dfa05e8d746@amd.com>
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
Cc: Philip Yang <Philip.Yang@amd.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 12:07:40PM +0100, Christian König wrote:
>Am 21.11.22 um 10:57 schrieb Michel Dänzer:
>>On 11/19/22 03:11, Sasha Levin wrote:
>>>From: Philip Yang <Philip.Yang@amd.com>
>>>
>>>[ Upstream commit 64f65135c41a75f933d3bca236417ad8e9eb75de ]
>>>
>>>Get below kernel WARNING backtrace when pressing ctrl-C to kill kfdtest
>>>application.
>>>
>>>If amdgpu_cs_parser_bos returns error after taking bo_list_mutex, as
>>>caller amdgpu_cs_ioctl will not unlock bo_list_mutex, this generates the
>>>kernel WARNING.
>>>
>>>Add unlock bo_list_mutex after amdgpu_cs_parser_bos error handling to
>>>cleanup bo_list userptr bo.
>>>
>>>  WARNING: kfdtest/2930 still has locks held!
>>>  1 lock held by kfdtest/2930:
>>>   (&list->bo_list_mutex){+.+.}-{3:3}, at: amdgpu_cs_ioctl+0xce5/0x1f10 [amdgpu]
>>>   stack backtrace:
>>>    dump_stack_lvl+0x44/0x57
>>>    get_signal+0x79f/0xd00
>>>    arch_do_signal_or_restart+0x36/0x7b0
>>>    exit_to_user_mode_prepare+0xfd/0x1b0
>>>    syscall_exit_to_user_mode+0x19/0x40
>>>    do_syscall_64+0x40/0x80
>>>
>>>Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>>>Reviewed-by: Christian König <christian.koenig@amd.com>
>>>Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>Signed-off-by: Sasha Levin <sashal@kernel.org>
>>>---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>index b7bae833c804..9d59f83c8faa 100644
>>>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>@@ -655,6 +655,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>  		}
>>>  		mutex_unlock(&p->bo_list->bo_list_mutex);
>>>  	}
>>>+	mutex_unlock(&p->bo_list->bo_list_mutex);
>>>  	return r;
>>>  }
>>Looks doubtful that this is a correct backport — there's an identical mutex_unlock call just above.
>
>
>Oh, yes good point. This patch doesn't needs to be backported at all 
>because it just fixes a problem introduced in the same cycle:

Dropping it, thanks!

-- 
Thanks,
Sasha
