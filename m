Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CE753F0F8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 22:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C9810FB71;
	Mon,  6 Jun 2022 20:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC77310FB71
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Ka1TstOWIq/uwWbI0ltivqnySUBaQmYAJjhs5L+uFtQ=;
 b=LNfDtB4wj+D5BF2YFa+dsimjUyIRcnBqRJuc1gWVJJ2WQRGzCCK2/Fp7XmPd2x8CwqX3VFpy7xGJe
 /twRS6RP+Jl9wjBLOaLoykj2E48IOEbfGQSxCBTJDrEqg3uIods5z0+kmNkajaDRdqnOrnqSDY4qCx
 Z7wC90armxFFwKN1QPDnWZwnNU9QUjjxp6CcnFFNY6qKV5fkoqXbbcmEd2CFqPBPXOBt5WDEnY84on
 dEXQ9z8KV9CJfh/NIDcEZEDP+QyNzhjajPIn+xnm1zeFt7P5A0zYvsCMIq49UUrrPdQ6QUbM0ZlPUv
 tB3uf3WfVLZng5ZEHrh46QhC9oo7lww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Ka1TstOWIq/uwWbI0ltivqnySUBaQmYAJjhs5L+uFtQ=;
 b=03czCzu+A+UQWWKkvZaMDlWN9f8keJg9Lub74nSGWSf9HSwJrZ5ek2baj1eWVW6pVVOJ0jqCx4tEJ
 OkQd9zXAw==
X-HalOne-Cookie: 21ab51b31a6fe080a3deed71589524505420b830
X-HalOne-ID: 5e400a0c-e5da-11ec-be77-d0431ea8bb03
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 5e400a0c-e5da-11ec-be77-d0431ea8bb03;
 Mon, 06 Jun 2022 20:50:59 +0000 (UTC)
Date: Mon, 6 Jun 2022 22:50:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
Message-ID: <Yp5osTQK+HCN2Ads@ravnborg.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-2-hsinyi@chromium.org>
 <Yp5Ti3ov/fnw0xeQ@ravnborg.org>
 <1c6e4d09-cf7a-2812-fd0d-09a21a275201@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c6e4d09-cf7a-2812-fd0d-09a21a275201@redhat.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

> > Please move this up so it is together with the other get_* methods, in
> > alphabetic order. That is, right after get_modes(), and then this also
> > matches the order in the .c file with is extra bonus.
> 
> The downside of moving this up is that it will break drivers which don't
> use c99 style named-struct-field initializers for there drm_panel_funcs.
> 
> I admit that no drivers should be using the old style struct init, but
> are we sure that that is the case?

There is no in-tree driver that uses old style struct init for
drm_panel_funcs - so we are safe here.

I just did a quick git grep -A 4 drm_panel_funcs to verify it,
browsing through the output did not reveal any old style users.

	Sam
