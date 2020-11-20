Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F782BAC3B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 15:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7086E8C5;
	Fri, 20 Nov 2020 14:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEF86E8C5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 14:55:07 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s13so10046016wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 06:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mDbFpDoH46rwgjhp9KkUIksLLBrp8I03s2KBD6EiFjA=;
 b=GxM9+Ys5sk19hoYCooGvrOIX0rBWPteYVgp0aOTEVajQch/6NuDL3zWHbKLp9IUnlF
 OA5KoTkZxP0CeVe3IpoJUuUPDzYOmFG3cmYGuoA3J4u4JA/pL+EVtdiYNWU2iTuAFfis
 aRbFJLGtTBdv8y15JtqkcGIsSZqz6Eewp2mz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mDbFpDoH46rwgjhp9KkUIksLLBrp8I03s2KBD6EiFjA=;
 b=GY2e/bZQvcfrHjYvUlEcg+1AIPIARaFCZ/RZgN5kADPcCchZ7RTGNvqJfDQRlfsyWE
 Xnx5QMNMvRvntjLBbDpga4VDUtzyjYK5lKjduJMpHlSuJzWS46jcLeEQPe+hnJ5P+BX5
 2Hv4G7awld/9Wtuv45VgjiTATr2ipWFxxEPb+TL+krKk84HWpw+p08PpMEhcAZdl/oWP
 mJSF3y0pETn5zNJBDV/ya/qoy5/MQuWhdUbPnGuW5uA9C+iQNN+V4saefgH2Ayx/wPoI
 ND/HrlkgOBE2UI3TaMCYvjNJPstbcSxGqw0+QSES5jbzc68RgzJOuUDN2MgvZP8zKjNk
 etlA==
X-Gm-Message-State: AOAM532cYEWKq9K4lhu4G9TzpplcFUFRx1N406rCH+Py0L1S+7pJABNc
 xmVR/aEIRjkD7Jhr8aq0VIrKgQ==
X-Google-Smtp-Source: ABdhPJy/AjNu+1tlXvWN/XznIvZZdoa7MWUCrhg3q7yJL1YwDWf57dQW2RmhToU9OZ2ojhLTnlIs6g==
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr10265488wme.171.1605884106439; 
 Fri, 20 Nov 2020 06:55:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z189sm4747071wme.23.2020.11.20.06.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 06:55:05 -0800 (PST)
Date: Fri, 20 Nov 2020 15:55:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/vboxvideo: Unmap iomem on probe-failure and remove
Message-ID: <20201120145503.GI401619@phenom.ffwll.local>
References: <20201027135153.324873-1-hdegoede@redhat.com>
 <f6b034c3-ef86-7214-f65e-af93b78bd456@redhat.com>
 <20201119175131.GI18329@kadam>
 <CAKMK7uGB5-aDSyA42PVs7_86NEfinftvKWx6AKsLFjoUS-1VGw@mail.gmail.com>
 <20201120075811.GJ18329@kadam>
 <CAKMK7uHdAipPHEwyPPop+bny4Qm6hX=6cG1+0jG2y1NfsUi8JQ@mail.gmail.com>
 <20201120110055.GM18329@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120110055.GM18329@kadam>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 02:00:55PM +0300, Dan Carpenter wrote:
> On Fri, Nov 20, 2020 at 10:39:45AM +0100, Daniel Vetter wrote:
> > On Fri, Nov 20, 2020 at 8:58 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Thu, Nov 19, 2020 at 08:30:59PM +0100, Daniel Vetter wrote:
> > > > On Thu, Nov 19, 2020 at 6:51 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > >
> > > > > On Thu, Nov 19, 2020 at 12:35:56PM +0100, Hans de Goede wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On 10/27/20 2:51 PM, Hans de Goede wrote:
> > > > > > > Add missing pci_iounmap() calls to properly unmap the memory on
> > > > > > > probe-failure and remove.
> > > > > > >
> > > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > > > >
> > > > > > For some reason the spam-filter used by Red Hat's email system has eaten
> > > > > > Daniel Vetter's reply to this, so let me copy and paste that from patchwork:
> > > > > >
> > > > > > Daniel Vetter wrote:
> > > > > >
> > > > > > > I think switching over to devm would be really nice. And for pci all
> > > > > > > you need to do is use pcim_enable_device and delete all the cleanup
> > > > > > > code, and it's all done. Hand rolling device cleanup code really isn't
> > > > > > > a great idea and way too error-prone. Plus you're using lots of devm_
> > > > > > > already.
> > > > > >
> > > > > > Good point, so I just checked and the vboxvideo code is already
> > > > > > using pcim_enable_device() so it looks like this is a false-positive
> > > > > > from the lkp@intel.com bot, and Dan Carpenter missed that pcim_enable_device()
> > > > > > makes all subsequent pci-resource acquiring calls behave like devm calls,
> > > > > > when he forwarded the report to me.
> > > > > >
> > > > > > Tl;DR: there is no bug / leak and this patch can be dropped.
> > > > > >
> > > > > > Is there a place where I can report a bug against the lkp@intel.com bot
> > > > > > for this false-positive ?
> > > > >
> > > > > Ah.  Thanks!
> > > > >
> > > > > This is a Smatch bug.  There is a list for that smatch@vger.kernel.org
> > > > > but I already remove the pci_iomap() from the list of functions that
> > > > > needs to be unwound based on your report.
> > > >
> > > > I guess if smatch sees a pci_enable_device but not pcim_enable_device
> > > > on the same device as passed to pci_iomap (and a pile of other pci
> > > > functions) then it still must be unwound. Could smatch detect that?
> > > > There's a lot of pci drivers not using the managed functions, catching
> > > > bugs in these would be good.
> > >
> > > It's a lot of code.  There would be two ways to implement this:
> > >
> > > 1) Somehow store the links to figure out the value of:
> > >
> > >          devres_find(vbox->ddev.pdev.dev)->enabled
> > >
> > > That's very complicated.  I'm sort of working on some of the steps
> > > involved but and it's probably a multi year process before it's
> > > possible.
> > >
> > > 2) Create a data base table with driver data, then store if the driver
> > > calls pcim_enable_device().  This is still a bit of work, but probably
> > > straight forward.  Storing driver data would be useful for other things
> > > as well.
> > 
> > Hm maybe I totally misunderstand how smatch works, but I thought you
> > can track additional invariants and stuff on various pointers. So I
> > figured you just track whether pci_enable_device has been called on a
> > struct pci_device *dev, and then if anyone calls pci_iomap on the same
> > pointer and there's no cleanup, it's a bug. For any other case you
> > just can't tell (since absence of pcim_enable_device might just mean
> > that smatch doesn't see through the maze). Or is that what you meant
> > with approach 2?
> 
> Hm...  Your idea is another option #3.  It's probably less work.
> 
> I'll take a look at it.

btw if you do this, the inverse isn't an issue. I.e. a pcim_enable_device
on the same pci_device you see a pci_iounmap. This can happen when a
driver maps something just to check a few things, reliazes the feature
isn't there, and then drops the mapping.

It's only redundant when it's on a direct return path of the driver's
pci_driver->probe function, or anything that's only called from
pci_driver->remove. So quite tricky to correctly catch all cases.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
