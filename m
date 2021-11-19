Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45645727E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 17:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1330A6ED0A;
	Fri, 19 Nov 2021 16:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04206E0ED
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 16:11:11 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w1so44728722edc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=KIgonA2EFTJLKTGv6+UD7Og9LS6eD0ftI5Kt9N5ampc=;
 b=dgWOaaq8yzIV1gHvfhemyZzO0QeUnPQPv8uVRZXUwjLioj3Hwn6siTvzHlaMIZ+M10
 7tJHjRqw94twP/WJGnDKvc9Tmz0Fn6Yc9Vvt+pm9yC4Sy11voNWpvPXPuV5NiIR23tEp
 5UPYM6qyrV8lv4YGUd8iuMlwg7TcUyXij0cLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=KIgonA2EFTJLKTGv6+UD7Og9LS6eD0ftI5Kt9N5ampc=;
 b=3tfnUQ3N2tdMdaD2Ay0lydNjZ/OllUIm8VqqTt4BVm320oXfmE82CyzKtOvw3Fvf1T
 SjasCeMJpgDldLaMczEvW74VHDxJDfpxG0X/LKXalJLVObJ9ES55uXqSx4tBuUkKSQq0
 3y1jnB21TDHuii8A83/HZYYU5wWGfFDo9BAEAPWCjKWmx+P4+iDE7OG3s1EjVe9J6c+Y
 JW/hRg7JJuPbF16Ec5dmqerDyMVW3cfXYGvQARb4lGXH5AUciMit9+IPRUgiYJr4ezXo
 B0bS9k4KN5eyI1ZIuj68Vw2EVeYhBJqNcyHN4Z1MoSZfDn2iEe66sX5S11gpGyup/3pX
 PMVQ==
X-Gm-Message-State: AOAM530FGRfTstAELEAs9VJRCTSnjbAXDy8H1jXkden1r5aAgYW0+e0u
 T7a4cxrshnq0eqWM8huVzl7PNQ==
X-Google-Smtp-Source: ABdhPJxdLdSV5agM8x3vcedpr+NqChZx9RvCft+FI62Knox080qmHnRF7sNgy7+mWO4QtRIMEi9PDQ==
X-Received: by 2002:a05:6402:268d:: with SMTP id
 w13mr26820359edd.257.1637338270326; 
 Fri, 19 Nov 2021 08:11:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u16sm128924ejy.16.2021.11.19.08.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:11:09 -0800 (PST)
Date: Fri, 19 Nov 2021 17:11:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YZfMm3GkFereYPTZ@phenom.ffwll.local>
Mail-Followup-To: Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Brian Norris <briannorris@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <20211118123928.545dec8a@eldfell>
 <CAF6AEGuc9JbOsC4Lrvoqo8VzMHq+7ru7Y6_UwoZaGV2wHQ6E5g@mail.gmail.com>
 <20211119115419.505155b5@eldfell>
 <YZfIgd8s7uGXAD2X@phenom.ffwll.local>
 <98236dpcx39iOz8xAYrwGLfiLdwgUlljrbBgHL3wd8A0Wz4KzRk3PR8s_tb5Rxu4eScKI4483kB6Vhv-T64CJYOeQqwXlqo2c-64HvoS5cg=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98236dpcx39iOz8xAYrwGLfiLdwgUlljrbBgHL3wd8A0Wz4KzRk3PR8s_tb5Rxu4eScKI4483kB6Vhv-T64CJYOeQqwXlqo2c-64HvoS5cg=@emersion.fr>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Brian Norris <briannorris@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 04:04:28PM +0000, Simon Ser wrote:
> On Friday, November 19th, 2021 at 16:53, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > Random idea ... should we perhaps let userspace connect the boosting? I.e.
> > we do a bunch of standardized boost targets (render clocks, display sr
> > exit), and userspace can then connect it to whichever input device it
> > wants to?
> 
> On IRC we discussed having user-space hand over a FD to the kernel. When the FD
> becomes readable, the kernel triggers the boost.
> 
> This would let user-space use e.g. an input device, an eventfd, or an epoll FD
> with any combination of these as the boost signal.

Can userspace filter eventfd appropriately like we do here? And can they
get at that maybe 2nd eventfd from logind or whatever there is on distros
where /dev access is locked down for compositors/users.

I do agree that if we can do this generically maybe we should, but also
the use-case for input boosting is pretty well defined. I think it's just
about making sure that compositors is in control, and that we don't make
it worse (e.g. with the sr exit adding latency when the compositor can
redraw quickly enough).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
