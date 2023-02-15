Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBA26986CA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 22:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD56D10EC20;
	Wed, 15 Feb 2023 21:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3090F10EC25;
 Wed, 15 Feb 2023 21:01:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC548B8225F;
 Wed, 15 Feb 2023 21:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B77AC433EF;
 Wed, 15 Feb 2023 21:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676494911;
 bh=M6ZOoCl7jWICTgzLwXh9t/Dp/gETGHVOG4bryHSv4Sc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YWx3Z+N5LfxCD8fkfuIiM2xyRDjRLpTj4HKEHXJjoyzoe+qNYwqItdJphEBZhZEFL
 798v4Fg+KQyyKQ2E5wcIJZy9iEbUc2lpAUUBqzspgioaD3/mFsrtnx84ZhGTOJC25J
 uIKc5diPd40XXQZJOOMhhQtMJPaoQyCapFW0OI3BOCHlGLeAr9oGVbzmnSW22RuecA
 TtQY6d7JwYY8IqOaN1oX4dx5tEN+Sn/aw1LSIaFcQ8bAOdgQEn7Xt/vNjtLayq6r7Z
 xGYFKZXCmWIlJ3wEKvMdwQoQnGONrF/3QOs1Y2wrQolFCIlwkgajNTN4G/1BmRDtap
 CbUC0AbIbLhlg==
Date: Wed, 15 Feb 2023 16:01:50 -0500
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH AUTOSEL 6.1 24/24] drm/amd/display: disable S/G display
 on DCN 3.1.2/3
Message-ID: <Y+1IPsPAJNKRA8IA@sashalap>
References: <20230215204547.2760761-1-sashal@kernel.org>
 <20230215204547.2760761-24-sashal@kernel.org>
 <CADnq5_PEGUSTFAzPOQtJFpsBqWQMaox=E1AxE+-h3_FxSbHNzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CADnq5_PEGUSTFAzPOQtJFpsBqWQMaox=E1AxE+-h3_FxSbHNzg@mail.gmail.com>
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
Cc: stylon.wang@amd.com, yifan1.zhang@amd.com, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, roman.li@amd.com,
 Jerry.Zuo@amd.com, aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 15, 2023 at 03:55:07PM -0500, Alex Deucher wrote:
>On Wed, Feb 15, 2023 at 3:46 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Alex Deucher <alexander.deucher@amd.com>
>>
>> [ Upstream commit 077e9659581acab70f2dcc04b5bc799aca3a056b ]
>>
>> Causes flickering or white screens in some configurations.
>> Disable it for now until we can fix the issue.
>>
>> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2352
>> Cc: roman.li@amd.com
>> Cc: yifan1.zhang@amd.com
>> Reviewed-by: Yifan Zhang <yifan1.zhang@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This was reverted upstream and should be dropped.

Ack, I'll drop it. Thanks!

-- 
Thanks,
Sasha
