Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30A21F7E6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 19:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10FA6E03D;
	Tue, 14 Jul 2020 17:10:39 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F566E03D
 for <dri-devel@freedesktop.org>; Tue, 14 Jul 2020 17:10:38 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id l6so755210plt.7
 for <dri-devel@freedesktop.org>; Tue, 14 Jul 2020 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9Pi0r+taXC55e2CabsrtsPMzJOxhTQ5VmZxPESoJ2R0=;
 b=YcUpdW8ssFvg31o7FKf1VxZt+87ICTP6BSy10MKwemlGlPTgoZywHlO0FpXTOwd/RU
 w/bmCXL2iKjRaYWDvnTjtwzPvUKBib7XWkuxrC/k8O0L3uhEvg0mByeAVTHLIuI+oYJi
 UYI69blXL++kD2Z9kDNOsL0ynAVx1mU7fpvMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9Pi0r+taXC55e2CabsrtsPMzJOxhTQ5VmZxPESoJ2R0=;
 b=bBHEpBxGBAiyscPwjNlx4RX0l5egwldHCkpUEula90gg7g+OmRmXqHWLnUP01qyM3J
 0Q7Jat3Bgcn+gahOq1fFJ1wPGyVUhZjcMc8vJLBMATwKXHdJ9iJPOaRBmwx/+ixmpjsF
 AeE+6hrXnyH5p8yBRlgt2Zs9Id1R/qQo5iXj6aYqY091X1RAz2CoI6uaO8rS9vuuc6t4
 +IF+CmmG5adcai/d97b3TlnYZ6pjYZKrB0QxURdY16s8bC8dUgI1W8SBKfmIrZnyXHSG
 hm/JbS8Co6AnptLonqUafLTD/ylRTAa8Tuldf+7Ej5rXMnFYXrie+/vR+P2rrI4xttxT
 ge8w==
X-Gm-Message-State: AOAM53131kvnrIgeWGVNaJhUvzHP4TnszqEWmuI3LFwCRDeFgG+xaQio
 5bhjZxbiWetJoHUlXCIkcUQA3w==
X-Google-Smtp-Source: ABdhPJwDHng07+7Jqf3f0zfUAjKLkymgxwE7dDtjLH3NoOVCed41ZFg0oAaAvDN6Z5TOUJLbYrwhEg==
X-Received: by 2002:a17:90b:8d0:: with SMTP id
 ds16mr5960924pjb.2.1594746638227; 
 Tue, 14 Jul 2020 10:10:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id a3sm16338620pgd.73.2020.07.14.10.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 10:10:37 -0700 (PDT)
Date: Tue, 14 Jul 2020 10:10:36 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [PATCH] drm: msm: a6xx: fix gpu failure after system resume
Message-ID: <20200714171036.GS3191083@google.com>
References: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, rnayak@codeaurora.org, jonathan@marek.ca,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 06:55:30PM +0530, Akhil P Oommen wrote:
> On targets where GMU is available, GMU takes over the ownership of GX GDSC
> during its initialization. So, take a refcount on the GX PD on behalf of
> GMU before we initialize it. This makes sure that nobody can collapse the
> GX GDSC once GMU owns the GX GDSC. This patch fixes some weird failures
> during GPU wake up during system resume.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>

I went through a few dozen suspend/resume cycles on SC7180 and didn't run
into the kernel panic that typically occurs after a few iterations without
this patch.

Reported-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>

On which tree is this patch based on? I had to apply it manually because
'git am' is unhappy when I try to apply it:

  error: sha1 information is lacking or useless (drivers/gpu/drm/msm/adreno/a6xx_gmu.c).
  error: could not build fake ancestor

Both upstream and drm-msm are in my remotes and synced, so I suspect it's
some private tree. Please make sure to base patches on the corresponding
maintainer tree or upstream, whichs makes life easier for maintainers,
testers and reviewers.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
