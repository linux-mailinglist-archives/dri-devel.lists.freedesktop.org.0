Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17CC30EE78
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967196ED0F;
	Thu,  4 Feb 2021 08:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21266EC05
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 21:58:31 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id y205so718889pfc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 13:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:to:date:message-id:user-agent;
 bh=NZyBJaM1wJYJrM3N9nWdphIUZzNaZF7K0cw+Alsw60s=;
 b=YuOUTknzG6QCCWY+6/9xwyK6R03ljdXy/eo0oFI/N+6GwosnDa5CyqQSfRHomVRq5Y
 /QU7kuuwvyKHdo8lw5/0kfKeynARxii+bcfHMWHLjs9pAUBAC1hEJdjvZFQ4lTU08YcK
 JPPSVfydjzgAxHpwSzs/Slc3zbOWlaxSXZv/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:to:date:message-id:user-agent;
 bh=NZyBJaM1wJYJrM3N9nWdphIUZzNaZF7K0cw+Alsw60s=;
 b=thGkqWOTCmk3LWoDt47HbJm4FXUqZSkkxK/ggiwanNzrEMCkxy0GY6MkCwzcPQvUP2
 pR+3Lh54DsFaPLsS/+XSdPIg37FeBQ1WJmbt2/KbwWaP1TsOKZEhJNSgUjRPuv1Cu4d8
 koBIdb9YgFUIRfq3/zgTq58oBzQ3HCm3yw1PoReJqK/AIwNUPRWjC+Qn/RtnE0dY/vah
 RCUggamw2Wb2ELL0iFdpLP/18hBtrQw2Gx7Lk3ejG+b9EEmzVK6Acmb5SOUdiz4uIA1w
 LvTkSxDSXfanItLIjn27pimsJdEoMbMgR1XbPUyA4jaDROzXIS5t7JmD3IinYltebg/3
 4z6g==
X-Gm-Message-State: AOAM533vblWTQ0zXHSxNH3e75PKzuBGqrbtp+BXhNNOZhkD/klajVCzQ
 Ge8IL2iUeZa6wFpk/ZeKruypRg==
X-Google-Smtp-Source: ABdhPJzk7PmvKQQrV2P9s6wrj8xy2r8VnWspZmZ4jUzlRnhKwjl19rpVf2Q70wAcSJtijokb8iTr1w==
X-Received: by 2002:a65:6207:: with SMTP id d7mr6025724pgv.92.1612389511562;
 Wed, 03 Feb 2021 13:58:31 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3571:bd6e:ee19:b59f])
 by smtp.gmail.com with ESMTPSA id o20sm3953813pgn.6.2021.02.03.13.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 13:58:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvTrfYYTfReGbAm9zcBNhjZvX0tko4kZUeQcyNZv4cM6w@mail.gmail.com>
References: <20210125234901.2730699-1-swboyd@chromium.org>
 <YBlz8Go2DseRWuOa@phenom.ffwll.local>
 <CAF6AEGuWhGuzxsBquj-WLSwa83r+zO7jAQ9ten2m+2KtoGpYSw@mail.gmail.com>
 <YBp2h2cVXrF6lBno@phenom.ffwll.local>
 <CAF6AEGvTrfYYTfReGbAm9zcBNhjZvX0tko4kZUeQcyNZv4cM6w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/kms: Make a lock_class_key for each crtc mutex
From: Stephen Boyd <swboyd@chromium.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date: Wed, 03 Feb 2021 13:58:28 -0800
Message-ID: <161238950899.76967.16385691346035591773@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Clark (2021-02-03 09:29:09)
> On Wed, Feb 3, 2021 at 2:10 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Feb 02, 2021 at 08:51:25AM -0800, Rob Clark wrote:
> > > On Tue, Feb 2, 2021 at 7:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, Jan 25, 2021 at 03:49:01PM -0800, Stephen Boyd wrote:
> > > > > This is because lockdep thinks all the locks taken in lock_crtcs() are
> > > > > the same lock, when they actually aren't. That's because we call
> > > > > mutex_init() in msm_kms_init() and that assigns on static key for every
> > > > > lock initialized in this loop. Let's allocate a dynamic number of
> > > > > lock_class_keys and assign them to each lock so that lockdep can figure
> > > > > out an AA deadlock isn't possible here.
> > > > >
> > > > > Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
> > > > > Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> > > > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > >
> > > > This smells like throwing more bad after initial bad code ...
> > > >
> > > > First a rant: https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
> >
> > Some technical on the patch itself: I think you want
> > mutex_lock_nested(crtc->lock, drm_crtc_index(crtc)), not your own locking
> > classes hand-rolled. It's defacto the same, but much more obviously
> > correct since self-documenting.
> 
> hmm, yeah, that is a bit cleaner.. but this patch is already on
> msm-next, maybe I'll add a patch on top to change it

How many CRTCs are there? The subclass number tops out at 8, per
MAX_LOCKDEP_SUBCLASSES so if we have more than that many bits possible
then it will fail.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
