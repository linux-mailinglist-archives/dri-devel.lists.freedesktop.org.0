Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60C1660E7D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 13:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604EB10E0FC;
	Sat,  7 Jan 2023 12:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E7C10E0FC
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 12:06:02 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso5305154wmb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 04:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZLjHqFbROXlE+sbQ3Mi0YQwdit1/ACHkltZB2eIp6ZY=;
 b=VZ5LC/sHAOIR5huRKj2y+0d40HWTG5UTtD8WCG8STyZQlXt4fYxcz2D61c7EiDK6+x
 1iq1BqhEjdpRL68bguKTkMX/H/fNo0BFSKZA5L7Sh7kAEIsM4f9s77WkVIFxDZOxdX4p
 yh1QQk2Nn0mdoUl0yg72fRnItYVKI0RJ5/Pmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLjHqFbROXlE+sbQ3Mi0YQwdit1/ACHkltZB2eIp6ZY=;
 b=YCac+cTFPuQp8Ppd1RMLbxQbrCbUKdaUcAwFhClp0sFeNjcHuaIiOsSQXKWRKrt4qW
 1ytbq9DLipYWgom+xhPNEqPGVdzEV6jS3z0r4Gs25YjU6C1uxlumDXAkz4+Pcu5v5x2O
 S6fHiP9Ze4dDwu0g2xes1s1RiJ5fsUzgfzUPJ4IWqhD19svTtEmsFjCf8pqbgmDuLDw7
 lJq+tmcNloSkglktFDj7/asAhPf4WW48vYuQHd0J4PSs16Smfsatkk6duBIRRyg0uJN4
 9Onxb9WLNVMEq5enqJZKn5EzqG3Ewvp5WmoRmRjzwCKQHf6SEy0gES35ulcEWtfnthlE
 Q2wg==
X-Gm-Message-State: AFqh2kr+9+6MAz3Y137s/sP9uSyqB2rO5sF4vmZQjbm6QERI8zfa3rnH
 1XP30IoMDfzm+JiL2gNSWQ1hqg==
X-Google-Smtp-Source: AMrXdXvG2OKBklPVU/w7yJTB6p28qUxxhsgOsf2xdlo6IBSDgcIEZZbPsf9QYXqEN76wJsjC57mQNQ==
X-Received: by 2002:a7b:ca4f:0:b0:3c6:edc0:5170 with SMTP id
 m15-20020a7bca4f000000b003c6edc05170mr40747291wml.25.1673093160874; 
 Sat, 07 Jan 2023 04:06:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c510900b003c6f8d30e40sm10842896wms.31.2023.01.07.04.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 04:05:59 -0800 (PST)
Date: Sat, 7 Jan 2023 13:05:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 1/2] drm/atomic: Allow vblank-enabled + self-refresh
 "disable"
Message-ID: <Y7lgJVP7hVtHpWTB@phenom.ffwll.local>
Mail-Followup-To: Brian Norris <briannorris@chromium.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Sean Paul <seanpaul@chromium.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20230106172310.v2.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
 <CA+ASDXNBDkzz_xRDbE9gNZZN5kSfxksh0EN01_CxNgyog_BZOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+ASDXNBDkzz_xRDbE9gNZZN5kSfxksh0EN01_CxNgyog_BZOg@mail.gmail.com>
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
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Sean Paul <seanpaul@chromium.org>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 05:27:33PM -0800, Brian Norris wrote:
> On Fri, Jan 6, 2023 at 5:23 PM Brian Norris <briannorris@chromium.org> wrote:
> > v2:
> >  * add 'ret != 0' warning case for self-refresh
> >  * describe failing test case and relation to drm/rockchip patch better
> 
> Ugh, there's always something you remember right after you hit send: I
> forgot to better summarize some of the other discussion from v1, and
> alternatives we didn't entertain. I'll write that up now (not sure
> whether in patch 1 or 2) and plan on sending a v3 for next week, in
> case there are any other comments I should address at the same time.

For me it needs to be in the helper patch, since anyone not doing rockchip
work will otherwise never find it. But you can also duplicate the
discussion summary into the 2nd patch, doesn't really hurt.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
