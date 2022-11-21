Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84037631D8F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 10:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD7C10E1A5;
	Mon, 21 Nov 2022 09:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3856A10E19C;
 Mon, 21 Nov 2022 09:57:59 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4NG2rK4SWLz9sTV;
 Mon, 21 Nov 2022 10:57:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1669024673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKWoYQiC0VAkiUCGzxBqoBdAdK+x56nxwPF3bP38f5U=;
 b=oNEvH4skY4TBp/Ebbs17fzLDKLt1MO3gpxbnmrfFp/zJjTgU4pjE7N3OiqekH5FeIqyj14
 Vibdkb7NEiCkA0c8x/bAEq61vtdDZjV5fBgPHwwB0/53H4ssd4oM1NDsDM7627fRISwR08
 QQhKSCJaD2rLD5ZBlplgNtABFnAHvKT+LzWfmKLa5UDIk45bk7BVdUtqdQLSZRGhWrbKMx
 UkSreraXxBo7Yee9MP52QLJcvR0kxljqM0aGHasWFZUwRlqChBTSWJiHrepV1Vf+s9lMQM
 b6+GdB5MumediOvZHBudK+QTJpn1zlLGMg2SjK3gHQ/EW56BazjA2UxiMMYdFw==
Message-ID: <e08c0d60-45d1-85a6-9c55-38c8e87b56c3@mailbox.org>
Date: Mon, 21 Nov 2022 10:57:51 +0100
MIME-Version: 1.0
Subject: Re: [PATCH AUTOSEL 6.0 38/44] drm/amdgpu: Unlock bo_list_mutex after
 error handling
Content-Language: en-CA
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20221119021124.1773699-1-sashal@kernel.org>
 <20221119021124.1773699-38-sashal@kernel.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20221119021124.1773699-38-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: f8ftg7acuaueygqxyku7kzfg6jpuxt7h
X-MBO-RS-ID: ffdceb14de5baed1f1c
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
Cc: Philip Yang <Philip.Yang@amd.com>, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/19/22 03:11, Sasha Levin wrote:
> From: Philip Yang <Philip.Yang@amd.com>
> 
> [ Upstream commit 64f65135c41a75f933d3bca236417ad8e9eb75de ]
> 
> Get below kernel WARNING backtrace when pressing ctrl-C to kill kfdtest
> application.
> 
> If amdgpu_cs_parser_bos returns error after taking bo_list_mutex, as
> caller amdgpu_cs_ioctl will not unlock bo_list_mutex, this generates the
> kernel WARNING.
> 
> Add unlock bo_list_mutex after amdgpu_cs_parser_bos error handling to
> cleanup bo_list userptr bo.
> 
>  WARNING: kfdtest/2930 still has locks held!
>  1 lock held by kfdtest/2930:
>   (&list->bo_list_mutex){+.+.}-{3:3}, at: amdgpu_cs_ioctl+0xce5/0x1f10 [amdgpu]
>   stack backtrace:
>    dump_stack_lvl+0x44/0x57
>    get_signal+0x79f/0xd00
>    arch_do_signal_or_restart+0x36/0x7b0
>    exit_to_user_mode_prepare+0xfd/0x1b0
>    syscall_exit_to_user_mode+0x19/0x40
>    do_syscall_64+0x40/0x80
> 
> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index b7bae833c804..9d59f83c8faa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -655,6 +655,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  		}
>  		mutex_unlock(&p->bo_list->bo_list_mutex);
>  	}
> +	mutex_unlock(&p->bo_list->bo_list_mutex);
>  	return r;
>  }
>  

Looks doubtful that this is a correct backport — there's an identical mutex_unlock call just above.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

