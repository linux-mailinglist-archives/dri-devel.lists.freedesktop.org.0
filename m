Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB84436E9F3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E2B6EE64;
	Thu, 29 Apr 2021 12:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF586EE65
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:04:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x5so16384803wrv.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 05:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MiEGZ+NS79WfLSCC9MIwqhDMsalGqkYSHOP1/CwaZU4=;
 b=YgwMixYszQENkHqy9w2Jcs0yAfAy1kkME8DMPpQ5ZZLD193GRfpHBf4uqFL3SRq2Cy
 MM+bj/rtvHESAWxPWym3OBx8oRK+LwSF0/sJoHB5CqkFIFcySppu5xnLyQbDsdRqeY9C
 GNh3BbYzxbHMCioyzp9U4suZ3fcl/+bL0ydOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MiEGZ+NS79WfLSCC9MIwqhDMsalGqkYSHOP1/CwaZU4=;
 b=S1lFy0TJBKrSpgaAHiPfMWpCukBOagHMRDqc+1MCs96UEST8Iz0psSI52Hz1DCvU86
 ziU7ACFdUwva2sgyQZPWzMC2BBC8yMnw7d5z+CSdJbd+v8l+sa4+G9oSti0t+oISGv9V
 LGzv1QRXhWx4oUF8tSR05jlbaVBik37klAGkdgMUl7a6j3oPV1/8w30kb9pu8pGYtwWs
 fXJSRhT6F5tAT5IM+Z6qPfUpajJg+GBSSjspdY8kxxcIESUjl5xTUqVgI0PZ4fTsvgkU
 PjkkOSZdYOkDRZR7uf7UHu+hQj3626HhJcvmc/RTVsCtq5jVmeSo0qtODTYm3cW/UTzU
 wsDA==
X-Gm-Message-State: AOAM5322V9zw2Jf64TELCBHbCA7kvvztzdTmpIXJtSRRSQTySe6uxicu
 OF75N/xnXDZ7XArVRPc39Fa/zw==
X-Google-Smtp-Source: ABdhPJzmDVcXuCXiplPzF0O0arZ1mMffMpsXfHhp9ao117QhIvz6OE2+jM6MkrgthQaHAg5tIffCHw==
X-Received: by 2002:adf:d0c8:: with SMTP id z8mr43468889wrh.68.1619697898559; 
 Thu, 29 Apr 2021 05:04:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e10sm4495558wrw.20.2021.04.29.05.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 05:04:57 -0700 (PDT)
Date: Thu, 29 Apr 2021 14:04:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
Message-ID: <YIqg59yageIUwiwy@phenom.ffwll.local>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local> <YIqehmw+kG53LF3t@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIqehmw+kG53LF3t@kroah.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@lists.freedesktop.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 linux-usb@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 01:54:46PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 29, 2021 at 01:40:28PM +0200, Daniel Vetter wrote:
> > On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
> > > Userspace could hold open a reference to the connector->kdev device,
> > > through e.g. holding a sysfs-atrtribute open after
> > > drm_sysfs_connector_remove() has been called. In this case the connector
> > > could be free-ed while the connector->kdev device's drvdata is still
> > > pointing to it.
> > > 
> > > Give drm_connector devices there own device type, which allows
> > > us to specify our own release function and make drm_sysfs_connector_add()
> > > take a reference on the connector object, and have the new release
> > > function put the reference when the device is released.
> > > 
> > > Giving drm_connector devices there own device type, will also allow
> > > checking if a device is a drm_connector device with a
> > > "if (device->type == &drm_sysfs_device_connector)" check.
> > > 
> > > Note that the setting of the name member of the device_type struct will
> > > cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
> > > as extra info. So this extends the uevent part of the userspace API.
> > > 
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > Are you sure? I thought sysfs is supposed to flush out any pending
> > operations (they complete fast) and handle open fd internally?
> 
> Yes, it "should" :)

Thanks for confirming my vague memories :-)

Hans, pls drop this one.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
