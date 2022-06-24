Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6346E55A1EA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A356910F1E7;
	Fri, 24 Jun 2022 19:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84FA10F1E7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=NR+rVfPaKcwJC95HfuPGnx2NsOqea9V4VqvFvqFBnBg=;
 b=ZzY1rw1rBBZkbdbui9aaUX/x0KzQpCeGZmG8katPMT/D2ib0Nqf+mLbPGUbanH2vViCqxkiG3w/Js
 pglYitIOHro9Lx9QBo9ut502W2o/qlwP0jsJ678zaj3gkt2rx6Izvo7Nzm2Tweg28Z+Aa4GMX37ucE
 fYsw8E2eKTnN6RqvU8fZCTpvADZEkkFW3E/MZ66eY6QAQ1Rkm6tXoWwGyLl27jrSUw7VAqhdtFB357
 pBfggmIG7i9gIfdg0yIsurTaeHYMyhZmN5+mMyzxyl38cq1luIH9ckmVzMz0i0jbKvGODMWDOJwTAp
 mySQzKsCn46hpt2LvfH4AZ7xSu+eA7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=NR+rVfPaKcwJC95HfuPGnx2NsOqea9V4VqvFvqFBnBg=;
 b=FCZegqjzcDpEVqGSDdEChCMzFBRT4gbuTfsEOERwj+uMRryJKT0eqMBqnbvkgC4XYMygXPZeS6Jnn
 p10Gj6wDw==
X-HalOne-Cookie: c55c53cf29716556bad13e443f85f4cc77676190
X-HalOne-ID: e01212d8-f3f4-11ec-a916-d0431ea8a290
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id e01212d8-f3f4-11ec-a916-d0431ea8a290;
 Fri, 24 Jun 2022 19:36:00 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:35:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm/panel: panel-simple: Add dev_err_probe if
 backlight could not be found
Message-ID: <YrYSHqoHBUOZ7p8k@ravnborg.org>
References: <20220621072118.513346-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621072118.513346-1-alexander.stein@ew.tq-group.com>
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 21, 2022 at 09:21:18AM +0200, Alexander Stein wrote:
> If the backlight node is not enabled, this (silently) returns with
> -EPROBE_DEFER. /sys/kernel/debug/devices_deferred also shows nothing
> helpful:
> $ cat /sys/kernel/debug/devices_deferred
> display
> 
> With this patch, there is a helpful hint:
> $ cat /sys/kernel/debug/devices_deferred
> display panel-simple: Could not find backlight
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Thanks, applied to drm-misc (drm-misc-next)

	Sam
