Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0B3B1D87C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 15:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D50910E83C;
	Thu,  7 Aug 2025 13:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B1Lf7Ngw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DDB10E83C;
 Thu,  7 Aug 2025 13:03:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D96E600B0;
 Thu,  7 Aug 2025 13:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8005C4CEEB;
 Thu,  7 Aug 2025 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754571810;
 bh=ITjeV1vhs/OWV7VDwZrJVXBhkUVHJfvZRS6GRlX1xaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B1Lf7NgwIrMo5HOztfwNfC5MynlHS2F3ACdF7Bn6Tn16S1UiE1Cb3M8ZiwUsXZJp1
 g0SNA1/FwVyuaIS2k5piEq74s9jhSZPncOfMNik1qI0vlYwi3O9XonkwnrQxmXj7ps
 bipDhxJKa2oYf1QpIWxqGuYCV0T0nmSsiQIXjrtFhIt25C2BHiFDfReKKrEJUw91nN
 kPG2Mt65cEBjaLc2WVZiy5H/ciEsJN1qfcrc1UoSivzqa/2dxjJJCQzfvxra7k9m9C
 XqQo4A5bN/Hura6MAmB/Nn6Z6tyTE4tgYDmBsdLWb8r5sWxpBop4fa+ZdoHes0LUlS
 rKiKSSqkVvx6Q==
Date: Thu, 7 Aug 2025 09:03:28 -0400
From: Sasha Levin <sashal@kernel.org>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 antomani103@gmail.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Fix objtool warning in submit_lock_objects()
Message-ID: <aJSkIJPbvj5xuu77@lappy>
References: <20250805225557.593192-1-sashal@kernel.org>
 <CACSVV02Z=4Saw=-MA6zz-Dsye8T=AcARWs1AhUbWnyA8sY7fdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02Z=4Saw=-MA6zz-Dsye8T=AcARWs1AhUbWnyA8sY7fdQ@mail.gmail.com>
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

On Wed, Aug 06, 2025 at 04:38:19PM -0700, Rob Clark wrote:
>On Tue, Aug 5, 2025 at 3:56 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> Restructure submit_lock_objects() to use a single loop with break
>> statements to fix objtool warning:
>>
>>   drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x451:
>>   sibling call from callable instruction with modified stack frame
>>
>> The drm_exec_until_all_locked() macro uses computed gotos internally
>> for its retry loop. Having return statements inside this macro, or
>> immediately after it in certain code paths, confuses objtool's static
>> analysis of stack frames, causing it to incorrectly flag tail call
>> optimizations.
>
>Maybe we should instead just split out a separate
>submit_lock_objects_vmbind() and restore the error path 'goto error'
>instead of returning from within the loop?  Ie. basically revert
>submit_lock_objects to the way it was before commit 92395af63a99
>("drm/msm: Add VM_BIND submitqueue"), and then move the rest into a
>new fxn (with 'goto error' instead of 'return ret'?  In retrospect the
>vmbind case is kinda just shoehorned into the existing fxn.
>
>I can type up this version if you have better things to do.

I'll send it out :)

-- 
Thanks,
Sasha
