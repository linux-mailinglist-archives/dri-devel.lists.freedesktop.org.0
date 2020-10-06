Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE39284735
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AF56E40D;
	Tue,  6 Oct 2020 07:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E062F6E21C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 00:53:08 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id a17so725066pju.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 17:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=VpS7X6EIHmnMVFG8t95f4eTiEJylc/0BC3yBDzUejrM=;
 b=lOpQopCjyEt4Ltl65nTh/NLJY26jMqDTYMrllPZw2VWtPaPoICadSHYsF7DO7J7F63
 oWM0C2zCCdV1kRPg20jntFj067/ze5WrdoZLZYQqkxwFqFL9fv8stApj7Hy9NxIstieO
 31uV38KLejd1JrJdu7x4DYuyK04uTmGBfbLuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=VpS7X6EIHmnMVFG8t95f4eTiEJylc/0BC3yBDzUejrM=;
 b=VGE3GTSFAPMhxLGYqdveWp2Mc67dUYlRsl20XHZRY9OsSLTrDRCZIgsR2cHzqdXDc/
 YXB6AieIFzWQgNK1S2v8/JM2/C5qiPVwR+g05ITAqOv9Y777jpe/5JDEPQHmsqgilBV6
 qeqF/IzRMygVhagf1rBaaCigZ67oQnvzJRfuF5oGNTROMqelv1Nlw2PHVGb8jV88h+h+
 uDgUv+yfe0lhvlG4QHoFxei6ko+EKAFprHhhSOU1te/76JdPcQhEESmpoB2G5dpriVt8
 4DmeVm9Zp6TkAJ6Oksy9K39Zagy9By5HOOeU8ErhKSTrhDzR7F4NlNQhjlS9BhlwGQ3V
 2AHQ==
X-Gm-Message-State: AOAM531+kYOukYWz9gi4bP2go6Kw6a9sxOgF3tJo/d1MZ3bP7bSw9OdF
 vbNQWZUwjfHXLEdK1JPLHureJw==
X-Google-Smtp-Source: ABdhPJwcHOjVjxdDby4/cVjBb9nbVM6zGtxqizkwy+3JzYP2vBMd0N90sEUJqcd/RzTbya7as0iiVA==
X-Received: by 2002:a17:90a:c302:: with SMTP id
 g2mr1996266pjt.173.1601945588397; 
 Mon, 05 Oct 2020 17:53:08 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id b22sm806470pjz.27.2020.10.05.17.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 17:53:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0de13a805820e4d73b8f906682386845@codeaurora.org>
References: <20201002220919.17245-1-khsieh@codeaurora.org>
 <160169114309.310579.5033839844955785761@swboyd.mtv.corp.google.com>
 <0de13a805820e4d73b8f906682386845@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: fixes wrong connection state caused by
 failure of link train
From: Stephen Boyd <swboyd@chromium.org>
To: khsieh@codeaurora.org
Date: Mon, 05 Oct 2020 17:53:06 -0700
Message-ID: <160194558634.310579.5267169787902306024@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2020-10-05 11:02:10)
> >> +       dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
> >> +
> >>         dp_display_disable(dp_display, 0);
> >> 
> >>         rc = dp_display_unprepare(dp);
> >>         if (rc)
> >>                 DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
> >> 
> >> -       dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
> >> -
> >>         state =  atomic_read(&dp_display->hpd_state);
> >>         if (state == ST_DISCONNECT_PENDING) {
> > 
> > I don't understand the atomic nature of this hpd_state variable. Why is
> > it an atomic variable? Is taking a spinlock bad? What is to prevent the
> > atomic read here to not be interrupted and then this if condition check
> > be invalid because the variable has been updated somewhere else?
> hpd_state variable updated by multiple threads. however it was protected 
> by mutex.
> in theory, it should also work as u32. since it was declared as atomic 
> from beginning
> and it does not cause any negative effects, can we keep it as it is?
> 

It does cause negative effects by generating worse code for something
that is already protected from concurrency by a mutex. Can we make it an
enum and name the enum and then add a comment indicating that the
'event_mutex' lock protects this variable?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
