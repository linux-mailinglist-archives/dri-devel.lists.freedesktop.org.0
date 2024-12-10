Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76039EBDE5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 23:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E3510E9AB;
	Tue, 10 Dec 2024 22:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C11210E2D5;
 Tue, 10 Dec 2024 22:33:48 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 23CEE1F8B2;
 Tue, 10 Dec 2024 23:33:46 +0100 (CET)
Date: Tue, 10 Dec 2024 23:33:44 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 0/3] drm/msm/dp: Fix and utilize TPG with a debugfs
Message-ID: <zmbipw4zmcdabimxdd4adyzeqhy5dyoburjxene4ub62ws2pym@drvsjowufdh2>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
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

On 2024-12-02 12:41:57, Abhinav Kumar wrote:
> DP Test Patten Generator is a very useful tool to debug issues such
> as blank screen or corruption seen on the DP monitor by isolating it
> to whether the corruption is coming from further upstream such as DPU
> OR from the DP controller and below. It was noted in [1] that this API
> is unused. Rather than dropping the API, it should be fixed and used.
> 
> Hence, this series fixes the DP Test Patten Generator API and also utilizes
> it by adding a debugfs for it.
> 
> [1] : https://patchwork.freedesktop.org/patch/623508/?series=141074&rev=1

This all sounds great, but perhaps the "unused function" issue applies to the
DSI TPG from your series at [1] as well.  There, the patch describes where to
insert the function call, but I remember that the contents of that function also
changed over time.

Are you planning to add a debugfs entry, or perhaps entries to configure the
pattern bits for DPU's DSI TPG as well, as suggested in [2]?  Or should someone
else look into it to make it useful again?

[1]: https://lore.kernel.org/linux-arm-msm/1626922232-29105-2-git-send-email-abhinavk@codeaurora.org/
[2]: https://lore.kernel.org/linux-arm-msm/CAA8EJpqjWbEbgn9Sw=Hd8f7pP+NXDeM308jG8HirKjk7QcfOxA@mail.gmail.com/

> 
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Stephen Boyd <swboyd@chromium.org>
> To: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Abhinav Kumar (3):
>       drm/msm/dp: account for widebus in msm_dp_catalog_panel_tpg_enable()
>       drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
>       drm/msm/dp: add a debugfs node for using tpg

Should TPG be capitalized in these titles, as it is an abbreviation with
capitalized words in your description as well?

Thanks!

- Marijn

> 
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++--
>  drivers/gpu/drm/msm/dp/dp_debug.c   | 61 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>  3 files changed, 76 insertions(+), 2 deletions(-)
> ---
> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> change-id: 20241202-tpg-3f7543c036ac
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
