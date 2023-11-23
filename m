Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A37C7F631F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 16:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D0410E09F;
	Thu, 23 Nov 2023 15:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F6F10E09F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 15:37:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 913ABCE2A89;
 Thu, 23 Nov 2023 15:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEA5C433C7;
 Thu, 23 Nov 2023 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700753861;
 bh=uQXiq96nO9VqagRTVjE4tsnRbIa5zMx/56VxvD4vqmc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MNbX5XYoqyBOdgPdCyGzkWB4YkNNJx6Bb6oX+qx8Q66cZfm3KBHY+aafog/SV6IFL
 +rsfrj+JI8rU872TJebCWAvHnhKhkpFt92dlQlKtgkB6ulGXBgBmgNkte9YwWzYnWh
 6Wh/0gBvUrnet0wg1xSvGqMNlYpZ2NxE54kxpzMTpqx3hczB1PiNI3SsxxOdaa3rkn
 RpTmcDL98KGaLcTavywN1D6rp7FipD/6ygRWtUilwXJ3KMnl3c20hEVQjraOopyvY8
 9eD/yuTL8K+rqNLTS/xGb6pQiueDvG51NyX4i03cDGd7VfqQik9mczivvqVTV+vWvK
 maaAzVZrWWQxg==
MIME-Version: 1.0
Date: Thu, 23 Nov 2023 16:37:36 +0100
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v4 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
In-Reply-To: <CAAOTY__LqKkj7Exg=wr0QUD-AQ_i3adXLUSdT2M_oYj7iCBAKQ@mail.gmail.com>
References: <20230905084922.3908121-1-mwalle@kernel.org>
 <20230905084922.3908121-2-mwalle@kernel.org>
 <93576c3b04c8378c5c9296ec7a6585d9@kernel.org>
 <CAAOTY__LqKkj7Exg=wr0QUD-AQ_i3adXLUSdT2M_oYj7iCBAKQ@mail.gmail.com>
Message-ID: <27e0368bb6dd44cd8d176c824cbfe464@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jitao Shi <jitao.shi@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>, Stu Hsieh <stu.hsieh@mediatek.com>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

>> > mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
>> > always have the CRTC with id 0, the ext id 1 and the third id 2. This
>> > is only true if the paths are all available. But paths are optional
>> > (see
>> > also comment in mtk_drm_kms_init()), e.g. the main path might not be
>> > enabled or available at all. Then the CRTC IDs will shift one up, e.g.
>> > ext will be 0 and the third path will be 1.
>> >
>> > To fix that, dynamically calculate the IDs by the presence of the
>> > paths.
>> >
>> > While at it, make the return code a signed one and return -ENOENT if no
>> > path is found and handle the error in the callers.
>> >
>> > Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting
>> > possible_crtc way")
>> > Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > Signed-off-by: Michael Walle <mwalle@kernel.org>
>> > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> 
>> Is there anything wrong with these two patches? They are now lingering
>> around for more than two months.
>> 
>> Unfortunately, patch 2/2 won't apply anymore because of commit
>> 01389b324c97 ("drm/mediatek: Add connector dynamic selection
>> capability). And I'm a bit puzzled for what the crtc_id is used
>> there because I guess it will have the same problem this patch
>> fixes.
> 
> Please base on the latest kernel version to fix.

Of course, but the question is how to fix it. Maybe Jason-JH.Lin
can help here.

In any case, please pick patch 1/2, it's independent of the second
patch and should still apply.

-michael
