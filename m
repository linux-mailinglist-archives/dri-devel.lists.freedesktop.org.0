Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3187197CE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 11:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142E010E220;
	Thu,  1 Jun 2023 09:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946E510E220;
 Thu,  1 Jun 2023 09:53:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D487064281;
 Thu,  1 Jun 2023 09:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B5CC433EF;
 Thu,  1 Jun 2023 09:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685613227;
 bh=fm7sw9sNJNxay74Yt8jfMtjyjVMmd/+OYcZxUbraMcA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=irmlnJdfZQqDpJHR+4hazW/0EFkoY7IbZnEvNqggTskj/EsMDRu54dYy/j77NVYso
 nlz0GS4Z3EQBpgLv1uXFxwFqv/9slQiO0f8oDSZWcoxfkufh+yyJRF31Xp3jd9pSFe
 pcPccoQrYfDSDmgY4Mn26q87m60AsIG618tpvtAgcPrQzStQawG879bjNgcYSc8YjT
 mJDEswbxaVNwAnZfniJaovR7UkIr40m5FABshB3WmZ6MPY3tDG0uhs7CTGik5zypq2
 cPx+W9+RSOM2XyYB7kK31CI/0mGqxqRmjanRVDQDgvOSISIYtg4ZcraJdbgHaQiDeE
 QTYGTzeGm/WyA==
Date: Thu, 1 Jun 2023 05:53:46 -0400
From: Sasha Levin <sashal@kernel.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: [PATCH AUTOSEL 6.1 4/9] drm/amd/display: Do not set drr on pipe
 commit
Message-ID: <ZHhqqkF8FCSqMi81@sashalap>
References: <20230511193945.623476-1-sashal@kernel.org>
 <20230511193945.623476-4-sashal@kernel.org>
 <bc4d10f2-6ded-bed3-1d81-7e09292adf6f@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc4d10f2-6ded-bed3-1d81-7e09292adf6f@mailbox.org>
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
Cc: felipe.clark@amd.com, wenjing.liu@amd.com, dri-devel@lists.freedesktop.org,
 Jun.Lei@amd.com, jiapeng.chong@linux.alibaba.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 aurabindo.pillai@amd.com, Alvin.Lee2@amd.com, sunpeng.li@amd.com,
 mwen@igalia.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 Dillon.Varone@amd.com, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 qingqing.zhuo@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 03:04:43PM +0200, Michel Dänzer wrote:
>On 5/11/23 21:39, Sasha Levin wrote:
>> From: Wesley Chalmers <Wesley.Chalmers@amd.com>
>>
>> [ Upstream commit 474f01015ffdb74e01c2eb3584a2822c64e7b2be ]
>>
>> [WHY]
>> Writing to DRR registers such as OTG_V_TOTAL_MIN on the same frame as a
>> pipe commit can cause underflow.
>>
>> [HOW]
>> Move DMUB p-state delegate into optimze_bandwidth; enabling FAMS sets
>> optimized_required.
>>
>> This change expects that Freesync requests are blocked when
>> optimized_required is true.
>
>This change caused a regression, see https://patchwork.freedesktop.org/patch/532240/?series=116487&rev=1#comment_972234 / 9deeb132-a317-7419-e9da-cbc0a379c0eb@daenzer.net .

Dropped, thanks!

-- 
Thanks,
Sasha
