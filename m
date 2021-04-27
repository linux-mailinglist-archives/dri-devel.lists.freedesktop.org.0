Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF79736CB7E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 21:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BCB6E575;
	Tue, 27 Apr 2021 19:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1606E575
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 19:10:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619550659; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=v6eUGz19oOlUzlO97WvNXlGdx655IYIHReGP61Hna/U=;
 b=JlflZyVpHCqATv2e7h+a/93U9ErwVtzwhRaEOXXeK0OwVGMdxCCk3yW5FM6BxtEg/elYgK6Q
 Y7U8h7smAxEKAImI8jFVAcKhuiwC/MLK4xE8LmLuEsdMXnAfYNWQg4xpx5qOPEPbKlLkCJbL
 dbOYM4/jYAuP0Wd1gJOlmn8To7Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 608861b6febcffa80f561adc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 19:10:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9B729C4338A; Tue, 27 Apr 2021 19:10:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DEC6C433D3;
 Tue, 27 Apr 2021 19:10:45 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 27 Apr 2021 12:10:45 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 0/4] drm/msm: improve register snapshotting
In-Reply-To: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
Message-ID: <cffa1baab24ae7dd6f292726abfaf4d5@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-26 17:18, Dmitry Baryshkov wrote:
> Rework MSM coredump support: add DSI PHY registers, simplify
> snapshotting code.
> 
> Changes since v1:
>  - Readd mutex serializing register snapshot calls
> 
>  - Add DSI PHY register dumping support
> 
Need to mention the dependency here , got missed from the prev patchset
> ----------------------------------------------------------------
> Dmitry Baryshkov (4):
>       drm/msm: pass dump state as a function argument
>       drm/msm: make msm_disp_state transient data struct
>       drm/msm: get rid of msm_iomap_size
>       drm/msm/dsi: add DSI PHY registers to snapshot data
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  5 +-
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c      | 90 
> +++++++----------------
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 21 +-----
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 22 ++----
>  drivers/gpu/drm/msm/dp/dp_display.c               |  4 +-
>  drivers/gpu/drm/msm/dsi/dsi.c                     |  5 +-
>  drivers/gpu/drm/msm/dsi/dsi.h                     |  5 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c                | 11 +--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c             | 31 +++++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h             |  4 +
>  drivers/gpu/drm/msm/msm_drv.c                     | 27 +++----
>  drivers/gpu/drm/msm/msm_drv.h                     |  6 +-
>  drivers/gpu/drm/msm/msm_kms.h                     |  8 +-
>  13 files changed, 97 insertions(+), 142 deletions(-)
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
