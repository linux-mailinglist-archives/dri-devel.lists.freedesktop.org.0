Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 783CD1D2FB7
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 14:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944DB6E366;
	Thu, 14 May 2020 12:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1897F6E366
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:30:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so3856152wru.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 05:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=J2ZtatzqD3OE8VdsdW4HBUMkQqixlxQVBQrLMq5CUUY=;
 b=cna/1t9SJDeWhOllSyrFsbKx0FpSu+qU5vcjm9dCmgeETaVbC4scdE9YaQZa7xAhkr
 jHrdBmIyDJ83s6hG2UqR5xnjB9KlJDeexh3TNwXFT20K9xALDBUx8a5xF63UB4ckWqdz
 rmeI0Urauv7XBVMJ/YekgTPyJ+K5u+QxcAMms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=J2ZtatzqD3OE8VdsdW4HBUMkQqixlxQVBQrLMq5CUUY=;
 b=fmgLQdhA0zEqUC1Dc1yqZ2GSrkKNnxwkj0KmoToxqD/h/4I49OiwMutqp9yIS1V3mc
 JtbaWFd6KLSJfIEo+tFO+JPGkXnrbuVpdCWFNnNii5CSfTOVJiqPFkeg6K9TLkqxjgRD
 xtT7v0fZFDFEClLoOrRmJ/gqybbfvQKVc1IBRO+u9K/KmcY6dY91puAqtFDptXFf9hlA
 gMEj38/AEJ5YimBwIgFpvGgcSSO/ykThLGr3/e7r9JzsMwRPXnzrip8qEIxKvkSA2/7O
 Rh4Prqzmr6AQF8yqA869fcoc5NgzRth1r2U9ZT4baCzoZJ/PhGWoh3x2EIzwjJEpkXa7
 GPog==
X-Gm-Message-State: AOAM532lAEdvy+W9a6RAaDAzQhHreOmX7smtLrsqUsYr3G+QWBTwKFXf
 Xxpo+Rz5bhklUz2b4KtVpJDxOA==
X-Google-Smtp-Source: ABdhPJxzzUZ9N249No4GSzh95gQlAWDkP3vcLToZAWmJAuT2AF/3WaSYIEjZHpBOhUMq5YlyAgExqA==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr5203956wru.62.1589459410673;
 Thu, 14 May 2020 05:30:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p7sm4269731wmg.38.2020.05.14.05.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:30:09 -0700 (PDT)
Date: Thu, 14 May 2020 14:30:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
Message-ID: <20200514123007.GP206103@phenom.ffwll.local>
Mail-Followup-To: David Stevens <stevensd@chromium.org>,
 Tomasz Figa <tfiga@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 virtio-dev@lists.oasis-open.org
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 05:19:40PM +0900, David Stevens wrote:
> Sorry for the duplicate reply, didn't notice this until now.
> 
> > Just storing
> > the uuid should be doable (assuming this doesn't change during the
> > lifetime of the buffer), so no need for a callback.
> 
> Directly storing the uuid doesn't work that well because of
> synchronization issues. The uuid needs to be shared between multiple
> virtio devices with independent command streams, so to prevent races
> between importing and exporting, the exporting driver can't share the
> uuid with other drivers until it knows that the device has finished
> registering the uuid. That requires a round trip to and then back from
> the device. Using a callback allows the latency from that round trip
> registration to be hidden.

Uh, that means you actually do something and there's locking involved.
Makes stuff more complicated, invariant attributes are a lot easier
generally. Registering that uuid just always doesn't work, and blocking
when you're exporting?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
