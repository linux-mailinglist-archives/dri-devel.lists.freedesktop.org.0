Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E78663CD0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAFA10E57D;
	Tue, 10 Jan 2023 09:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3271810E576
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673342924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AVLVGIsrOqTjuPIgOoAR2+SxsgygvuAEJGJpLf5gXoE=;
 b=Rbwmg4vkkZ9ByG2Yg4VvImR5QpOHL4y/lDGoxZ0KlPYr8menhdvhlrb4JHwiAx4IS7M0Gi
 TywHQwhGqWIn9OvLwwb03Kn1c/ADuxX1KOCr6k9bev51aDuXdluILuFfnlUMCZJV2o7uJD
 8rAtRCTZId5QaS358NKaD5eNCtLtuQc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-iQ7GWgQMOW6q9_t-IdD4-w-1; Tue, 10 Jan 2023 04:28:41 -0500
X-MC-Unique: iQ7GWgQMOW6q9_t-IdD4-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D79A3C10694;
 Tue, 10 Jan 2023 09:28:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39937C16033;
 Tue, 10 Jan 2023 09:28:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B5C3718000B3; Tue, 10 Jan 2023 10:28:39 +0100 (CET)
Date: Tue, 10 Jan 2023 10:28:39 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property
 for rescanning of modes
Message-ID: <20230110092839.3mx7dcbhj2w7hm5q@sirius.home.kraxel.org>
References: <20221118013054.182304-1-vivek.kasireddy@intel.com>
 <20221118013054.182304-3-vivek.kasireddy@intel.com>
 <20230106085640.54hvmhblmh4o2jxb@sirius.home.kraxel.org>
 <Y7frUw39xU70WQkD@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <Y7frUw39xU70WQkD@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, Dongwon Kim <dongwon.kim@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 10:35:15AM +0100, Daniel Vetter wrote:
> On Fri, Jan 06, 2023 at 09:56:40AM +0100, Gerd Hoffmann wrote:
> > On Thu, Nov 17, 2022 at 05:30:54PM -0800, Vivek Kasireddy wrote:
> > > Setting this property will allow the userspace to look for new modes or
> > > position info when a hotplug event occurs.
> > 
> > This works just fine for modes today.
> > 
> > I assume this is this need to have userspace also check for position
> > info updates added by patch #1)?
> 
> What does this thing even do? Quick grep says qxl and vmwgfx also use
> this, but it's not documented anywhere, and it's also not done with any
> piece of common code. Which all looks really fishy.

It's again a virtualization-specific thing.  On physical hardware you
typically have no idea which of your two monitors stands left and which
stands right.  On virtual hardware the host knows how the two windows
for the two heads are arranged and can pass on that information to the
guest.  suggested_x/y properties added by patch #1 do pass that
information to userspace so the display server can arrange things
correctly without manual invention.

I have no clue though why this hotplug_mode_update property exists in
the first place and why mutter checks it.  IMHO mutter could just check
for suggested_x/y directly.

take care,
  Gerd

