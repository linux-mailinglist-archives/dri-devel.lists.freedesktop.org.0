Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147D938F70
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 14:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9BA10E54D;
	Mon, 22 Jul 2024 12:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dO5bk3Ec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2056B10E50D;
 Mon, 22 Jul 2024 12:55:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2811960AF5;
 Mon, 22 Jul 2024 12:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4A7C116B1;
 Mon, 22 Jul 2024 12:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721652953;
 bh=XEr1R9iOxtde4IqHwns90ckqnpkrizp/7tl7omPCH9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dO5bk3Eci+cstrckuFXddKynl3is4BpUi4nBExxwJ3k9ZzafTjF1Q2wbfJnPI+1lZ
 m2MBNVA8mFDDgf1ekeqwkPVPGp2/6WnZlv/WnpCNd6u8uTyqXiOHqpPGoj6WNNWmGJ
 5pFCTXYM8hqMpRmrGRmt7FmZt45ellyEaQqZgvYuKP4QTiUYy8Mr8FLQcR1R7mL4JZ
 0IJfoRzyFLKRQGR339F5T2cNeJyQpt1EhCHdxVO4q++7YcK5P6t3KN4ycT3zxgpIlC
 SOSL8YblC5TKdkt8F2sfWQu91nzSXjf7UVPUcHR5qdJTHAIEnRD0pqZRRt2+e1BfVI
 gA2C0nQqJJ83A==
Date: Mon, 22 Jul 2024 08:55:52 -0400
From: Sasha Levin <sashal@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Jesse Zhang <jesse.zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Felix.Kuehling@amd.com,
 shashank.sharma@amd.com, guchun.chen@amd.com, Philip.Yang@amd.com,
 mukul.joshi@amd.com, xiaogang.chen@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH AUTOSEL 6.1 13/14] drm/amdgpu: fix dereference null
 return value for the function amdgpu_vm_pt_parent
Message-ID: <Zp5W2GE3G3j-0bjP@sashalap>
References: <20240605120455.2967445-1-sashal@kernel.org>
 <20240605120455.2967445-13-sashal@kernel.org>
 <ZnFPL2BeQOEGPO6Q@duo.ucw.cz>
 <6b933c16-5ddb-4b09-b367-3cf42ae94304@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b933c16-5ddb-4b09-b367-3cf42ae94304@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 18, 2024 at 01:42:56PM +0200, Christian König wrote:
>Am 18.06.24 um 11:11 schrieb Pavel Machek:
>>Hi!
>>
>>>[ Upstream commit a0cf36546cc24ae1c95d72253c7795d4d2fc77aa ]
>>>
>>>The pointer parent may be NULLed by the function amdgpu_vm_pt_parent.
>>>To make the code more robust, check the pointer parent.
>>If this can happen, it should not WARN().
>>
>>If this can not happen, we don't need the patch in stable.
>
>Right, that patch shouldn't be backported in any way.

I'll drop it, thanks!

-- 
Thanks,
Sasha
