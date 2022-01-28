Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3FE49F706
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 11:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA2810F1A7;
	Fri, 28 Jan 2022 10:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7D710F1A7;
 Fri, 28 Jan 2022 10:17:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A151BB8251C;
 Fri, 28 Jan 2022 10:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D34C340EB;
 Fri, 28 Jan 2022 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643365075;
 bh=Wsd8ffzqUJJ+zDgbfdKPUsCAFuCJyeA7XLquQGZ1eDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KXdeexPQNSOzFEyxuaoplfy9s0PsJnxDsh5nkqq/QfzRpqOuopR/lEVGwcJ8MU9Kg
 hlBOWTmCLX14ktV8V3GtW4Pqbh3Iyt2BKKOLOgeuFgm4PjqssSvR1jX4J2NYRKCecO
 jcrsYievae9koevYV18tk+4vLJ10l7QHhQQCH1zw=
Date: Fri, 28 Jan 2022 11:17:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhou Qingyang <zhou1615@umn.edu>
Subject: Re: [PATCH] drm/amd/display: Fix a NULL pointer dereference in
 amdgpu_dm_connector_add_common_modes()
Message-ID: <YfPCyxqO5zQWv8Xn@kroah.com>
References: <20220124165732.56587-1-zhou1615@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124165732.56587-1-zhou1615@umn.edu>
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
Cc: Wayne Lin <Wayne.Lin@amd.com>, Leo Li <sunpeng.li@amd.com>, kjlu@umn.edu,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>, dri-devel@lists.freedesktop.org,
 Jude Shih <shenshih@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 12:57:29AM +0800, Zhou Qingyang wrote:
> In amdgpu_dm_connector_add_common_modes(), amdgpu_dm_create_common_mode()
> is assigned to mode and is passed to drm_mode_probed_add() directly after
> that. drm_mode_probed_add() passes &mode->head to list_add_tail(), and
> there is a dereference of it in list_add_tail() without recoveries, which
> could lead to NULL pointer dereference on failure of
> amdgpu_dm_create_common_mode().
> 
> Fix this by adding a NULL check of mode.
> 
> This bug was found by a static analyzer.
> 
> Builds with 'make allyesconfig' show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_types and amdgpu_dm")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> The analysis employs differential checking to identify inconsistent 
> security operations (e.g., checks or kfrees) between two code paths 
> and confirms that the inconsistent operations are not recovered in the
> current function or the callers, so they constitute bugs. 
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7f9773f8dab6..9ad94186b146 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8143,6 +8143,9 @@ static void amdgpu_dm_connector_add_common_modes(struct drm_encoder *encoder,
>  		mode = amdgpu_dm_create_common_mode(encoder,
>  				common_modes[i].name, common_modes[i].w,
>  				common_modes[i].h);
> +		if (!mode)
> +			continue;
> +
>  		drm_mode_probed_add(connector, mode);
>  		amdgpu_dm_connector->num_modes++;
>  	}
> -- 
> 2.25.1
> 

As stated before, umn.edu is still not allowed to contribute to the
Linux kernel.  Please work with your administration to resolve this
issue.

