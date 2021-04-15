Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39243615AC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 00:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1BD6EABD;
	Thu, 15 Apr 2021 22:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FAD6EABD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 22:47:01 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id u15so4375590plf.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 15:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=4QXyNLhNR/ybAA8PhqI1Y4BCgzCX+KpeDdgoizSFaz0=;
 b=L8G3d+gV+ZHqNkVAriDsrtVhQMCQV82uICqEb1zx1gUZUrHTLb/QtmAwXKfy4wXRNo
 sbi42TE/mnsc+Lp3EC3yZuCmD88NlzUjqVXVC0gKoWE3IyTBrFsxCEmEtKHEQa35W/3/
 eoBFIqvEgEVTAx6u4F3UxeGblQP8MygfDsj2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=4QXyNLhNR/ybAA8PhqI1Y4BCgzCX+KpeDdgoizSFaz0=;
 b=dnEU/9cXsaW/tpP+RixlpOYG5WKx3mO2OY+b3qJDFkc1aA7gamFdm7tlc6Vai370xF
 BW29OGaY3h8LFbjtIFkjwu7yHOvVLaKoNV8fiUs0amCyu0MNYBd0gGU5GW/8hAyX1Vcm
 luQ44SO+u2JVTU2UTByjRpaPib7+7d98YdAd2FBv96Je5ktgSaZ8wPIMMO2lGLFI1nMq
 5L0EEb8njYJFp2k+xE0xnuFdTAxTaWfyhCtQ5BDLL5f+bNxTLNSK2ICKVYAfFIC6oodv
 x5QC95FrM681Gv3IND24P29OQOovUcLVf1irhcC7x1B9Y9e8txvhVd1wTRBGtVLJS9Hk
 Z/cg==
X-Gm-Message-State: AOAM532lGlp+m9YYtNi3s9QdSAfyAgQYRreXVQzHOZo0UuIwyLREeCDH
 JL07ZSV/OhsQnD2uu4i5VvBNjA==
X-Google-Smtp-Source: ABdhPJxFhcnc0BQvrngfQ3Z5AFfIdVKhj/xb/yL3sabyo7p2u8N5bSvEyBbGwKVUGR30J7RRrB+6pA==
X-Received: by 2002:a17:902:b188:b029:e8:bd90:3f99 with SMTP id
 s8-20020a170902b188b02900e8bd903f99mr6372521plr.6.1618526821364; 
 Thu, 15 Apr 2021 15:47:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1ddc:37d8:5171:510d])
 by smtp.gmail.com with ESMTPSA id a128sm3038828pfd.115.2021.04.15.15.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 15:47:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <78036f23979206070bd9c9df180e2866@codeaurora.org>
References: <1618355504-5401-1-git-send-email-khsieh@codeaurora.org>
 <161843459482.46595.11409016331159748598@swboyd.mtv.corp.google.com>
 <60bceecc3d4dcc71c66a4b093d0e6c0f@codeaurora.org>
 <161851718969.46595.12896385877607476879@swboyd.mtv.corp.google.com>
 <78036f23979206070bd9c9df180e2866@codeaurora.org>
Subject: Re: [PATCH v2 3/3] drm/msm/dp: check main link status before start
 aux read
From: Stephen Boyd <swboyd@chromium.org>
To: khsieh@codeaurora.org
Date: Thu, 15 Apr 2021 15:46:59 -0700
Message-ID: <161852681935.46595.9941294298184495830@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, dri-devel@lists.freedesktop.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-04-15 15:02:40)
> On 2021-04-15 13:06, Stephen Boyd wrote:
> > 
> > Is it really necessary to have this patch at all? I think there are
> > bigger problems with suspend/resume of the DP driver in relation to the
> > kthread stopping. I hope that the aux channel would start NAKing
> > transfers once the cable is disconnected too, so that we don't need to
> > do an extra check for each aux transfer.
> 
> I am working on duplicate this problem, but it is not happen on me yet 
> so far.
>  From kernel dump, i can see it crash at dp_irq_hdp_handle() after 
> suspended.
> dp_irq_hpd_handle and dp_pm_suspend() are serialized by event_mutex.
> 
> After suspend, ahb clock is disabled.
> Hence next dp_catalog_link_is_connected() crash at acess dp ctrl 
> registers.
> 
> 
> aux channel does not do NAKing immediately if unplugged. Therefore 
> aux_transfer will wait until timeout (HZ/4).
> worst, drm_dp_dpcd_access() will retry 32 times before return dpcd 
> read/write failed.
> This patch try to eliminate the time spinning on waiting for timeout 32 
> times.
> 

Would be useful to have that level of detail in the commit text.

Maybe when the cable is disconnected the DP phy should be shutdown and
some bit in the phy could effectively "cut off" the aux channel and then
NAKs would start coming through here in the DP controller I/O register
space?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
