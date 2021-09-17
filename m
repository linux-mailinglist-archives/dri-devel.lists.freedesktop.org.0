Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A4F40FEE2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 19:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB34E6E041;
	Fri, 17 Sep 2021 17:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABEC6E041
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 17:58:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631901510; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MYrf1V/sEPAeqWL6yw4C8SF9H3MC2Vavwq1Onm5ldzY=;
 b=ejM+iS6CBqUdP4YZMw3Kr8Pxz+r19pYwUqtSSo0joXo8CgbnV+l5X1+l0eLcNvgaE9EagA9M
 +lyonPH1A632p578YXGsV/YtDIdyqrIJbiJPtw7oywqY3NoB83wSUela3evsqtYW870nhAjr
 /CxlaEizVJxQq8miDqF6jEg+fPk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6144d72ac1b30e2f0246a2f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 17:58:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D4F72C4360D; Fri, 17 Sep 2021 17:58:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BF331C4338F;
 Fri, 17 Sep 2021 17:58:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 17 Sep 2021 10:58:00 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>
Subject: Re: [RESEND PATCH v6 00/14] drm/trace: Mirror DRM debug logs to
 tracefs
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
Message-ID: <3a16f36a7d483c98fcacb3781a09be64@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-21 10:55, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Hi all,
> I just had the pleasure of rebasing this set on our CrOS downstream
> kernel and wanted to resend it for consideration once again. There
> hasn't been any resistence to the set AFAIK, just perhaps not enough
> motivation for anyone to hit the go bit. There was some interest from
> the msm folks about a month ago, and it has been an invaluable tool
> on CrOS for the past ~year. Hopefully someone can dig into this and
> provide some feedback so we can move this forward.
> 
> Thanks!
> 
> Sean

Totally agree, This tool has been valuable for us in debugging many 
issues.
FWIW, I will go through the core bits and msm pieces to give my RB.

> 
> Changes since last v6:
> -Rebased on drm-tip
> 
> Original v6 of the set available here:
> https://patchwork.freedesktop.org/series/78133/
> https://lore.kernel.org/dri-devel/20200818210510.49730-1-sean@poorly.run/
> 
> Sean Paul (14):
>   drm/mipi_dbi: Convert pr_debug calls to DRM_DEBUG_DRIVER
>   drm/sil164: Convert dev_printk to drm_dev_dbg
>   drm/i915/utils: Replace dev_printk with drm helpers
>   drm/msm/dpu: Replace definitions for dpu debug macros
>   drm/print: rename drm_debug* to be more syslog-centric
>   drm/amd: Gate i2c transaction logs on drm_debug_syslog
>   drm/etnaviv: Change buffer dump checks to target syslog
>   drm/nouveau: Change debug checks to specifically target syslog
>   drm/i915: Change infoframe debug checks to specify syslog
>   drm/print: Add drm_debug_category_printer
>   drm/mst: Convert debug printers to debug category printers
>   drm/i915: Use debug category printer for welcome message
>   drm/atomic: Use debug category printer for atomic state printer
>   drm/print: Add tracefs support to the drm logging helpers
> 
>  Documentation/gpu/drm-uapi.rst               |   6 +
>  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c   |   4 +-
>  drivers/gpu/drm/drm_atomic_uapi.c            |   2 +-
>  drivers/gpu/drm/drm_dp_mst_topology.c        |   9 +-
>  drivers/gpu/drm/drm_drv.c                    |   3 +
>  drivers/gpu/drm/drm_mipi_dbi.c               |   8 +-
>  drivers/gpu/drm/drm_print.c                  | 242 ++++++++++++++++---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   8 +-
>  drivers/gpu/drm/i2c/sil164_drv.c             |  12 +-
>  drivers/gpu/drm/i915/display/intel_display.c |   4 +-
>  drivers/gpu/drm/i915/i915_drv.c              |   3 +-
>  drivers/gpu/drm/i915/i915_utils.c            |   5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  20 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h        |   4 +-
>  include/drm/drm_print.h                      |  96 +++++++-
>  15 files changed, 331 insertions(+), 95 deletions(-)
