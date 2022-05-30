Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBAE537679
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 10:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C155310E142;
	Mon, 30 May 2022 08:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9CE10E142
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 08:26:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2862160F0D;
 Mon, 30 May 2022 08:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E785C385B8;
 Mon, 30 May 2022 08:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1653899172;
 bh=wf8IUvx869ZSiOWGg9P5mSNklgkEOoVyfqdFYqjaKyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vg7/DhTYe0xU6TH1qN1GDAI4Q2uR21Mcsqi+HSzgLPrVPpFecM1lloiqOpQ0kPVC6
 t6HTJR+nJCpuW0UX/KQL+stMDMvu6gQiS7PIiXmZd1WHVO1YS0sXmv/eJnn9K8ZJQT
 WttLvBv5a74PVQ4BJu2K+NRI07kAYT0YpHittWKE=
Date: Mon, 30 May 2022 10:26:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] dma-buf: Add a capabilities directory
Message-ID: <YpR/oRRWmzQZU1kI@kroah.com>
References: <20220527073422.367910-1-contact@emersion.fr>
 <dbee55fd-37ac-d7cd-dc78-d72776dfdfac@amd.com>
 <YpRwI7xm5Wtxyiz8@kroah.com>
 <y8_aHkQfpnkFGxtmlPCl1oeVug9pmGRyNP3JadMxYgQBfR0bnNo84pdtiMu3VptPHmcHlqwh0u8ntE7tZ6TWCzCMSLnBK_71fbLUY-ykN40=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <y8_aHkQfpnkFGxtmlPCl1oeVug9pmGRyNP3JadMxYgQBfR0bnNo84pdtiMu3VptPHmcHlqwh0u8ntE7tZ6TWCzCMSLnBK_71fbLUY-ykN40=@emersion.fr>
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 30, 2022 at 08:15:04AM +0000, Simon Ser wrote:
> On Monday, May 30th, 2022 at 09:20, Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > > > +static struct attribute *dma_buf_caps_attrs[] = {
> > > > +	&dma_buf_sync_file_import_export_attr.attr,
> > > > +	NULL,
> > > > +};
> > > > +
> > > > +static const struct attribute_group dma_buf_caps_attr_group = {
> > > > +	.attrs = dma_buf_caps_attrs,
> > > > +};
> > >
> > > Didn't we had macros for those? I think I have seen something for that.
> >
> > Yes, please use ATTRIBUTE_GROUPS()
> 
> This doesn't allow the user to set a group name, and creates an unused
> "_groups" variable, causing warnings.

Then set a group name.

But you really want to almost always be using lists of groups, which is
why that macro works that way.

> 
> > > > +
> > > > +static struct kobject *dma_buf_caps_kobj;
> > > > +
> > > > +int dma_buf_init_sysfs_capabilities(struct kset *kset)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	dma_buf_caps_kobj = kobject_create_and_add("caps", &kset->kobj);
> > > > +	if (!dma_buf_caps_kobj)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	ret = sysfs_create_group(dma_buf_caps_kobj, &dma_buf_caps_attr_group);
> >
> > Why do we have "raw" kobjects here?
> >
> > A group can have a name, which puts it in the subdirectory of the object
> > it is attached to.  Please do that and do not create a new kobject.
> 
> I see, I'll switch to sysfs_create_group with a group name in the next version.

No, do not do that, add it to the list of groups for the original
kobject.

thanks,

greg k-h
