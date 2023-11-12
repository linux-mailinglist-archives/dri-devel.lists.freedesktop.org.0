Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 727B47E9226
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 19:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D7D10E319;
	Sun, 12 Nov 2023 18:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A9110E0BF;
 Sun, 12 Nov 2023 18:51:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 27AF6CE0C6C;
 Sun, 12 Nov 2023 18:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35018C433C8;
 Sun, 12 Nov 2023 18:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699815106;
 bh=7V7AfIKqaTCD6m2lsmbg52UA7J/T4Eb6G/9aTJ+EDlU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NnN+Anc7K9m4jgChYzwebKq17e4JzFGV7xmKvAH4blQEQ3Y61Yc1e0iP7MoJHqdhm
 IuG9hXhtSC/wSHts98yNgLT7fSQyNJjujIQyVGUKKYXVS96XIDweNeSqAf9M20iJe/
 zxRSOmmoGznY0Tn3rBQCwVTeJklGF7NEwSP3k2/SapxQDbHX2dW4UEUpWwCFi18ghx
 WaitH1pGjKyfLdbYRtycne5fQCp6df3bh9xoZC/4xINF1NW94GbsGFdHJA13f9ZJ0n
 5zXTPqxRakp3zZoVQ24ZMF3kOrD+4s/Ix8diS4XFVScdjAYrWtWHVFo2/UyI9ocAeZ
 rfsRJ+xjZA2DA==
Date: Sun, 12 Nov 2023 13:51:44 -0500
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH AUTOSEL 6.6 09/11] drm/amd: Fix UBSAN
 array-index-out-of-bounds for Powerplay headers
Message-ID: <ZVEewK-GAnRsrPA3@sashalap>
References: <20231112132736.175494-1-sashal@kernel.org>
 <20231112132736.175494-9-sashal@kernel.org>
 <CADnq5_OyK=rDH38Q8Kiyq9BhWuihgd8wX7XKAffxwkO4w+ksog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_OyK=rDH38Q8Kiyq9BhWuihgd8wX7XKAffxwkO4w+ksog@mail.gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 12, 2023 at 01:00:37PM -0500, Alex Deucher wrote:
>On Sun, Nov 12, 2023 at 8:27 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Alex Deucher <alexander.deucher@amd.com>
>>
>> [ Upstream commit 49afe91370b86566857a3c2c39612cf098110885 ]
>>
>> For pptable structs that use flexible array sizes, use flexible arrays.
>>
>> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2039926
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>I don't think any of these UBSAN flexible array changes are stable material.

I'll drop it, but in general we've been taking kasan/ubsan/kcsan/...
annotation fixes since it enables (easier) testing on the LTS trees, and
for example finding issues specific to those LTS trees.
-- 
Thanks,
Sasha
