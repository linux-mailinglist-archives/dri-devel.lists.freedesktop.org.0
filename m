Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AB1311676
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 00:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10C26EA6C;
	Fri,  5 Feb 2021 23:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354516F520
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 22:50:09 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d13so4322812plg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 14:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=gKCMWJy86du3XdDODHHkwDL4EqHeNQp1OLhPf7Jz0/g=;
 b=DeXiiiz5Xu4mcDBbUqmfnVGscCw+wn6NsdbMyjAgmzY0DOwxWhcYOd/PnXNYyBohsH
 kYceKhwQiG+aY1UbhHj+Kxmycp6RYnmrSDn4qOIt132V+xkdfuUzzL1LBYYDUIerwPc1
 txnAFI8K2L0gYegSqTqvFwLAFkxZc02oP87Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=gKCMWJy86du3XdDODHHkwDL4EqHeNQp1OLhPf7Jz0/g=;
 b=QjIWWviwWiEyVcGKHyRs5xW8nh/HaPRKiNc+/b/oq1SgCI13EbgN1fQLJdVBlCL/ye
 SdyCX3shsn1SARfy7av4Ykxw7dLBEA0mUx9da8PcEp4z3eHWdPat0K9McRksetQljigM
 ajGoqwnkINnF9VXtW8NUkrr2mIpcLa8S1phhoTK9aY+RgpYSgbQRgG/CP8SDLohbyYTk
 97+2xzWNJ85ysFbr0TjloLzzr+vRJf0BGGPx6sKnS8fuZ2Ia8Y/N4XV6b7xBhpVAPnhL
 ULs8FdP1BQpVSyEJ9DIP9njk5kifaS1YKTGUxbdwMbYiN9GTlK3Pw9/lP8KJOEWWx4u2
 xXHA==
X-Gm-Message-State: AOAM532lEldOS7odWN8peGyGo+S2J7beP8BTh0ak/m27ySrLIdz6vEzP
 8vKdDIO1ax9FsPiobPRmM/CaxA==
X-Google-Smtp-Source: ABdhPJwGvnWZVMON25jxMBQujRQW8J9vouiPFt6BaQnmk2Wd20tbSiNga0UjbYPbrvJYFU44SNIh9w==
X-Received: by 2002:a17:90a:8b15:: with SMTP id
 y21mr5929152pjn.82.1612565409676; 
 Fri, 05 Feb 2021 14:50:09 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3d74:5f76:aaaa:6cb8])
 by smtp.gmail.com with ESMTPSA id s126sm6639348pfs.81.2021.02.05.14.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:50:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1612557878-19743-1-git-send-email-khsieh@codeaurora.org>
References: <1612557878-19743-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: reset dp controller only at boot up and
 pm_resume
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Fri, 05 Feb 2021 14:50:07 -0800
Message-ID: <161256540764.76967.2035577896654812758@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Fri, 05 Feb 2021 23:16:26 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-02-05 12:44:38)
> DP_SW_RESET is the global SW reset that is used to initialize DP
> controller. If DP_SW_RESET executed during connection setup,
> two HPD related side effects may occurred,
> 1) pending HPD interrupts cleared unexpected
> 2) re start debounce logic which trigger another interrupt
> This patch only issue DP_SW_RESET at boot up and pm_resume.
> This patch also reinit video_comp before configure dp controller
> to avoid missing VIDEO_READY interrupt.
> 
> Fixes: 9fc418430c65 ("drm/msm/dp: unplug interrupt missed after irq_hpd handler")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
