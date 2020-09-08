Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F51261BF5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 21:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC5D6E062;
	Tue,  8 Sep 2020 19:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Tue, 08 Sep 2020 19:12:16 UTC
Received: from a27-18.smtp-out.us-west-2.amazonses.com
 (a27-18.smtp-out.us-west-2.amazonses.com [54.240.27.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EA16E062;
 Tue,  8 Sep 2020 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599592015;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=lWsMChywupzdHzp7I9YzcKd0Y+ARnhQXfU8/OA9aDl4=;
 b=Qd3YPHq1Q0iig7uHqwxRH6H3jLI/CYplrHLvFKt2p6Yq6p2YCIZPgc4BDK1Cnm3Q
 n5LMc4cOkuws+6Cv35zuJDYHxYQarsLonCybzwkvXd0LYkrC/GVBcFHk8neUr/xU9WA
 10N7yOEeS1r6uTNCMs3UQ6IOHxZLbysipQz1ybXI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599592015;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=lWsMChywupzdHzp7I9YzcKd0Y+ARnhQXfU8/OA9aDl4=;
 b=CfyP9hTbRf3x1j6O53/dN5XmGZi5Ay4yNSA/vPbmU3aB8VpCDfrR+bBoOuPgGCF9
 8GuqikQOUbCZAZmNYo1ZGXLt/oWTc638XuK7BqGL7Kd6Mhd6FJNBSpwE5fvcs4iP0Ld
 SjI2Nr24m2OoUoDPQSwahmYXEKrlv9YRQxfa6e4A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Date: Tue, 8 Sep 2020 19:06:55 +0000
From: abhinavk@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: move vblank events to complete_commit()
In-Reply-To: <20200907170450.370122-1-robdclark@gmail.com>
References: <20200907170450.370122-1-robdclark@gmail.com>
Message-ID: <010101746f1d259a-b9077f57-c120-4164-bbdc-a62318745db6-000000@us-west-2.amazonses.com>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.08-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Hongbo Yao <yaohongbo@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bernard <bernard@vivo.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-arm-msm-owner@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-07 10:04, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We could get a vblank event racing with the current atomic commit,
> resulting in sending the pageflip event to userspace early, causing
> tearing.  On the other hand, complete_commit() ensures that the
> pending flush is complete.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

I checked our downstream code as well and yes we are not signaling
page flips inside the vblank_cb and are doing it after 
wait_for_commit_done
This aligns with that.
Hence,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c2729f71e2fa..89c0245b5de5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -297,7 +297,6 @@ void dpu_crtc_vblank_callback(struct drm_crtc 
> *crtc)
>  		dpu_crtc->vblank_cb_time = ktime_get();
>  	else
>  		dpu_crtc->vblank_cb_count++;
> -	_dpu_crtc_complete_flip(crtc);
>  	drm_crtc_handle_vblank(crtc);
>  	trace_dpu_crtc_vblank_cb(DRMID(crtc));
>  }
> @@ -402,6 +401,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 
> event)
>  void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>  {
>  	trace_dpu_crtc_complete_commit(DRMID(crtc));
> +	_dpu_crtc_complete_flip(crtc);
>  }
> 
>  static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
