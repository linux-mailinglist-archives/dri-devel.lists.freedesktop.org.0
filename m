Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6555A208
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EE010E13A;
	Fri, 24 Jun 2022 19:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC7710E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=01lx53oXEjHB12EIpfEWhdf0NHxjveCZJS34ykm30Ss=;
 b=ZOWvTCZnvi8P2pj6UVgRVCSqgVRpbvGXApGsVxgHQ5/qAXyrUoigp18XhbkdprQA6qk+BR8Hk9CDs
 Bi0mMt6j2BnCVI6XSwPnPZPfwj/fUnrs19UXvNsqdCHFJcUaTKSm2hiBGtIpa1gsYwFLPvKtkWIBO7
 a+9MMP9yQ0cwPqET5UmWCieMyGBr3K+llVed06Jh3DvSR0UGJDSnO0bGbx7bQEQ5HDqZXtA7tWxJnK
 Vw5cj4j6pb3HmGEl2GzLCpjKtwut3xkS0FZQEp2tVbVivFHEqpABKHqX7MKJwzWUpU7Z5Md0CXOlQA
 9MseJX9bys8oB/z6OaNKO+2bEqnPs2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=01lx53oXEjHB12EIpfEWhdf0NHxjveCZJS34ykm30Ss=;
 b=6kcuP4B77m/2mVzBV51Mo1EuMCk9uDHHmhGlgk8oRrlw+w/fw7Gz6rrYEywGQEVr1b8HaKV3WukoA
 IIoppC6CQ==
X-HalOne-Cookie: a9df624f025a3f5ae97c156b21ee154a40fcede6
X-HalOne-ID: 801ce267-f3f6-11ec-be7c-d0431ea8bb03
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 801ce267-f3f6-11ec-be7c-d0431ea8bb03;
 Fri, 24 Jun 2022 19:47:38 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:47:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH v2] drm: shmobile: Use backlight helper
Message-ID: <YrYU2KEubtR+pmkO@ravnborg.org>
References: <20220616170821.1348169-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616170821.1348169-1-steve@sk2.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 07:08:21PM +0200, Stephen Kitt wrote:
> This started with work on the removal of backlight_properties'
> deprecated fb_blank field, much of which can be taken care of by using
> helper functions provided by backlight.h instead of directly accessing
> fields in backlight_properties. This patch series doesn't involve
> fb_blank, but it still seems useful to use helper functions where
> appropriate.
> 
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
Thanks, added to drm-misc (drm-misc-next)

	Sam
