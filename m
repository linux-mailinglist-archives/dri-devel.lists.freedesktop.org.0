Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8366C3703EC
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 01:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F336F60E;
	Fri, 30 Apr 2021 23:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B626F60E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 23:07:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619824041; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=V+oj2FdgO738BZ62IBogKd0JpzcCrCkPU4H+tDaGYLE=;
 b=F61OHCyRgbv0JaT324JJSoIGitOubJ+fjYxOLJ/bPhDkgtn2J3BHYCEHqtxG9M+ruewo6OBv
 yw+/GLfDnjo6crzIxXUx3cbKavhMKo5r4HhRJTW2hYWO+TAaaSkWk+pa+uQ/0AxEAglQnWY/
 PMpsmrVK1zGtfkjDmexDsUFhm80=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 608c8d9887ce1fbb562a53ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Apr 2021 23:07:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E44C1C4323A; Fri, 30 Apr 2021 23:07:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F3F79C433F1;
 Fri, 30 Apr 2021 23:07:02 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 30 Apr 2021 16:07:02 -0700
From: abhinavk@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [Freedreno] [PATCH 0/6] drm/msm: Trim down drm debugging logs
In-Reply-To: <20210430193104.1770538-1-swboyd@chromium.org>
References: <20210430193104.1770538-1-swboyd@chromium.org>
Message-ID: <b11b19848701cd11cba5ee0d8befeeb8@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-30 12:30, Stephen Boyd wrote:
> This patch series attempts to trim down the drm logging in the msm
> driver to make it useable with DRM_UT_DRIVER, DRM_UT_KMS, and DRM_UT_DP
> levels enabled. Right now the log is really spammy and prints multiple
> lines for what feels like every frame. I moved those prints off to
> other DRM_UT_* levels that felt appropriate. Please review.
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: aravindh@codeaurora.org
> Cc: Sean Paul <sean@poorly.run>
> 
For the entire series,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

> Stephen Boyd (6):
>   drm/msm: Move vblank debug prints to drm_dbg_vbl()
>   drm/msm: Use VERB() for extra verbose logging
>   drm/msm/dp: Drop malformed debug print
>   drm/msm: Move FB debug prints to drm_dbg_state()
>   drm/msm/disp: Use plane debug print helper
>   drm/msm/disp: Move various debug logs to atomic bucket
> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 16 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 22 +++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 38 +++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 10 ++---
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  6 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 19 ++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 14 +++----
>  drivers/gpu/drm/msm/dp/dp_panel.c             |  1 -
>  drivers/gpu/drm/msm/msm_drv.c                 |  4 +-
>  drivers/gpu/drm/msm/msm_fb.c                  |  8 ++--
>  12 files changed, 67 insertions(+), 75 deletions(-)
> 
> 
> base-commit: 9f4ad9e425a1d3b6a34617b8ea226d56a119a717
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
