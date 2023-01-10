Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A466636DD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 02:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40F310E0FA;
	Tue, 10 Jan 2023 01:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9381F10E0FA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:47:37 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 k7-20020a056830168700b0067832816190so6215359otr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 17:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kbDcjQtwcmYIyMwYrj6WVATDcFAVZZpovnNCEJKINmc=;
 b=qFcyM27Xbo5tKN2io6bi2zLc6Pb2fKgrzjr3usL6fFZ/eMmZxf8JV4ni8ZtxQ84vAK
 sK7qmXC5dNvM6ePIGeUbtF1s1lsumaDCC+I605W8zUdwevk9B5yPJIMO3YAYb3nyQSOV
 wXbLqNy/gkvObGh/MoTWxeSCtuyeJL9NlLLtcEtnsLlcpKmN1wGMDnvdTCYXlXT69jz7
 Q0cNNkh94qHckX4ck7DlWz+YkJjk+nwbuHHWzK9oCrNfhh6duJha5SIhBEJJuxCwApVM
 7Oq0Fu8hueRCOFcwf8PL9+UTPMRLqHQl817LRAMO6Q7B15QnQrc6Ft2mD1uhrw15QvLx
 VlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kbDcjQtwcmYIyMwYrj6WVATDcFAVZZpovnNCEJKINmc=;
 b=tmJCdLaHhwEQjNP5QNiMYedeAmhVIXJBQpzTTjA/4BcnbpzWouY9neZhwLsBjjrjb3
 1gVQspS7x7cYT1zkraTH8ta+uodi01+xxjQWxkxYJ8vbq256ORFw2m9ynT3u2ezqr0MJ
 x72MGskJBCY4PKOGsGCYzYPkZT7rePA3hc0nDQtna4ZS2y6OjRlu17R908l8OhO2ArA0
 DdGuPAz9kISOh6jiaSYfatj+4ryt/RUaQ9HwnNQ95qOdnFAWK76oTCrEf+dc+231lKXU
 DvzK3saOl+VOw44AB/vZrI6D3speViRszdQDZc5z6+QZ6rCD7dTmwNe9dI6uWqEE//Sn
 32Hw==
X-Gm-Message-State: AFqh2kr9wKLO6PhnzLvpPmtio2EhQ+go2MGw2ri8izGpPQjGD2Hh9pkv
 3ipvkxI+SR+WUmOrR4L1aYBHogXb1X0+MWGQu5c=
X-Google-Smtp-Source: AMrXdXvvOgJPNnYtha/68FhbwNYmEh+bLUpMyl+dlv1Y6ezF1RZbS7ig7ahlDY/Aoks9r8hpVJT5WzWwe7Zkbrw1ABs=
X-Received: by 2002:a9d:7310:0:b0:678:272b:41e1 with SMTP id
 e16-20020a9d7310000000b00678272b41e1mr3478533otk.328.1673315256862; Mon, 09
 Jan 2023 17:47:36 -0800 (PST)
MIME-Version: 1.0
References: <20221216233355.542197-1-robdclark@gmail.com>
 <20221216233355.542197-2-robdclark@gmail.com>
 <3ae74f28-580b-3b53-3d7b-e8bde97dabe3@collabora.com>
In-Reply-To: <3ae74f28-580b-3b53-3d7b-e8bde97dabe3@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Jan 2023 17:47:34 -0800
Message-ID: <CAF6AEGvGb66L7cXod40PiKijJRTCOhWL+qCz4bgmi-69ZxJt8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Fix GEM handle creation UAF
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 9, 2023 at 3:28 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 12/17/22 02:33, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Userspace can guess the handle value and try to race GEM object creation
> > with handle close, resulting in a use-after-free if we dereference the
> > object after dropping the handle's reference.  For that reason, dropping
> > the handle's reference must be done *after* we are done dereferencing
> > the object.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
>
> Added fixes/stable tags and applied this virtio-gpu patch to misc-fixes.
> The Panfrost patch is untouched.

Thanks.. the panfrost patch was not intended to be part of the same
series (but apparently that is what happens when I send them at the
same time), and was superceded by a patch from Steven Price (commit
4217c6ac8174 ("drm/panfrost: Fix GEM handle creation ref-counting")
already applied to misc-fixes

BR,
-R
