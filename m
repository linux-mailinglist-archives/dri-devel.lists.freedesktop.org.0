Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB953965B
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 20:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F064F10E176;
	Tue, 31 May 2022 18:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8035910E176
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 18:37:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D92706100A;
 Tue, 31 May 2022 18:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E51C385A9;
 Tue, 31 May 2022 18:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1654022261;
 bh=FmT3hKzK66TRO4Aq8HCWNAbGUt1xsVUL71rKu+JU8Ls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SpGAAc9Rf5CznobihOXAONrqDxNUg8DoPlUW1jLZa3eY1FF3HfrHLKRi0c55mottH
 CzCdAdwK09B+XObZZDQMhHv1OusQnQv1OJPGK+43X17OrQwnuuDFkj2GNC2soeuUsl
 O+/Ri74j4HStKC4N523xCwajpjZaDqUcAw6+ETuE=
Date: Tue, 31 May 2022 20:37:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Ekstrand <jason.ekstrand@collabora.com>
Subject: Re: [PATCH v3] dma-buf: Add a capabilities directory
Message-ID: <YpZgcbor2ZmbMDZq@kroah.com>
References: <20220527073422.367910-1-contact@emersion.fr>
 <dbee55fd-37ac-d7cd-dc78-d72776dfdfac@amd.com>
 <YpRwI7xm5Wtxyiz8@kroah.com>
 <y8_aHkQfpnkFGxtmlPCl1oeVug9pmGRyNP3JadMxYgQBfR0bnNo84pdtiMu3VptPHmcHlqwh0u8ntE7tZ6TWCzCMSLnBK_71fbLUY-ykN40=@emersion.fr>
 <YpR/oRRWmzQZU1kI@kroah.com>
 <35f5f6228207da2f91aa6930772a43c3cf7db979.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35f5f6228207da2f91aa6930772a43c3cf7db979.camel@collabora.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 07:53:50AM -0500, Jason Ekstrand wrote:
> On Mon, 2022-05-30 at 10:26 +0200, Greg KH wrote:
> > On Mon, May 30, 2022 at 08:15:04AM +0000, Simon Ser wrote:
> > > On Monday, May 30th, 2022 at 09:20, Greg KH
> > > <gregkh@linuxfoundation.org> wrote:
> > > 
> > > > > > +static struct attribute *dma_buf_caps_attrs[] = {
> > > > > > +       &dma_buf_sync_file_import_export_attr.attr,
> > > > > > +       NULL,
> > > > > > +};
> > > > > > +
> > > > > > +static const struct attribute_group dma_buf_caps_attr_group
> > > > > > = {
> > > > > > +       .attrs = dma_buf_caps_attrs,
> > > > > > +};
> > > > > 
> > > > > Didn't we had macros for those? I think I have seen something
> > > > > for that.
> > > > 
> > > > Yes, please use ATTRIBUTE_GROUPS()
> > > 
> > > This doesn't allow the user to set a group name, and creates an
> > > unused
> > > "_groups" variable, causing warnings.
> > 
> > Then set a group name.
> > 
> > But you really want to almost always be using lists of groups, which
> > is
> > why that macro works that way.
> 
> I think I see the confusion here.  The ATTRIBUTE_GROUPS() macro is
> intended for device drivers and to be used with add_device().  However,
> this is dma-buf so there is no device and no add_device() call to hook.
> Unless there are other magic macros to use in this case, I think we're
> stuck doing it manually.

Have a list of attribute groups and add it to the kobject when you
create it so they all get created at the same time.

Don't do piece-meal "add one, and then another, and then another" as
that just gets messy and complex and impossible to unwind the error
conditions from.

sysfs_create_groups() is what you need to use here.  I need to drop
sysfs_create_group() one day...

thanks,

greg k-h
