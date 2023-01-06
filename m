Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3526605EF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF03F10E8A5;
	Fri,  6 Jan 2023 17:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3C110E8A6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:50:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z5so900454wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 09:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MEWcai/0BTUSDXzlv/9ZnddHBUgd9q90oSNrTCd/iAE=;
 b=hkasdKR/OrqmQwA/oOWmPJTk7z6ETkOAnL/+a1hwca7i4k8ududHCU7HQbUMGoP+qW
 Uw1kYQ2NTYX+GOukmMyi/bR5ErlLtQqAnJdJ2bagG5WkAe3w1XbjORO4Qr+yOgg+9g3Q
 Mf1s4J2Xy6cIj76SMWXp0VGHGG3zAIgDoQ+Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MEWcai/0BTUSDXzlv/9ZnddHBUgd9q90oSNrTCd/iAE=;
 b=wQE6A9BpWvWLwlFslVtU9s8/Op/0auqQRsBCshstdnjpM2X/EfSbb/VaPLR+GepETZ
 O6J0nrEQbGk+osYc/Ltn9bUc41zV9HGE9ZNA8Pb8cTSTG+kyvbVnwNrbY+cg5o0azogm
 gDzwBLoZwEd7tH46sl/IYOIxRNiwBSbBycJ24/861Lrw9W1oVm8gE5E7V60LZNZdcvCY
 f2JUNcpvjqpt6nov8rckUwv6u6Bjg7f+MFrkH7TyYQrfTi8gNjC/OOm6EfSknuHa9frZ
 nQ7Vs1jvji3TXzi442MwX5txHRK61soG0RbDZGZbFmIzmlLZYmw8tv0HOcEChms6ReHG
 +o7g==
X-Gm-Message-State: AFqh2koY9oalGSPNKPWrH/q/+mIno9bR1vE+X0Edcod8Q2+T+VJ5dG1d
 LXHV5fecvQokNpwnx0WlZCcw2g==
X-Google-Smtp-Source: AMrXdXsSQA1sZlk78KWMQ3ZlByTzU+qPddwuRA0IvEpJPokqzlPt1nfac/dSnY9a55WhImAedfMMaw==
X-Received: by 2002:adf:f4c1:0:b0:27e:7f5:6634 with SMTP id
 h1-20020adff4c1000000b0027e07f56634mr26567517wrp.60.1673027399535; 
 Fri, 06 Jan 2023 09:49:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o12-20020adfe80c000000b0024258722a7fsm1710958wrm.37.2023.01.06.09.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 09:49:58 -0800 (PST)
Date: Fri, 6 Jan 2023 18:49:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] drm/atomic: Allow vblank-enabled + self-refresh
 "disable"
Message-ID: <Y7hfRNHMjk5H+muj@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
 Brian Norris <briannorris@chromium.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Sean Paul <seanpaul@chromium.org>, stable@vger.kernel.org
References: <20230105174001.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
 <Y7fH88gNfja364JD@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7fH88gNfja364JD@kroah.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Brian Norris <briannorris@chromium.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 08:04:19AM +0100, Greg KH wrote:
> On Thu, Jan 05, 2023 at 05:40:17PM -0800, Brian Norris wrote:
> > The self-refresh helper framework overloads "disable" to sometimes mean
> > "go into self-refresh mode," and this mode activates automatically
> > (e.g., after some period of unchanging display output). In such cases,
> > the display pipe is still considered "on", and user-space is not aware
> > that we went into self-refresh mode. Thus, users may expect that
> > vblank-related features (such as DRM_IOCTL_WAIT_VBLANK) still work
> > properly.
> > 
> > However, we trigger the WARN_ONCE() here if a CRTC driver tries to leave
> > vblank enabled here.
> > 
> > Add a new exception, such that we allow CRTCs to be "disabled" (with
> > self-refresh active) with vblank interrupts still enabled.
> > 
> > Cc: <stable@vger.kernel.org> # dependency for subsequent patch
> 
> "subsequent" doesn't mean much when it is committed, give it a name
> perhaps?

It also looks a bit funny tbh, and a bit much like duct-tape. I need to
think through how this is supposed to work really.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
