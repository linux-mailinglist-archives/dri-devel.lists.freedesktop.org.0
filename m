Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35696F4913
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 19:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAEA10E1B1;
	Tue,  2 May 2023 17:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDE310E5AA;
 Tue,  2 May 2023 17:21:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87FFD61CE1;
 Tue,  2 May 2023 17:21:54 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 73981C433EF;
 Tue,  2 May 2023 17:21:52 +0000 (UTC)
Date: Tue, 2 May 2023 13:21:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH 03/14] drm/xe: Do not take any action if our
 device was removed.
Message-ID: <ZFFGp1XD5Nfum0H7@rdvivi-mobl4>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-4-rodrigo.vivi@intel.com>
 <ZFEvAuZRXl5U6ntH@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFEvAuZRXl5U6ntH@DUT025-TGLU.fm.intel.com>
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 02, 2023 at 03:40:50PM +0000, Matthew Brost wrote:
> On Wed, Apr 26, 2023 at 04:57:02PM -0400, Rodrigo Vivi wrote:
> > Unfortunately devcoredump infrastructure does not provide and
> > interface for us to force the device removal upon the pci_remove
> > time of our device.
> > 
> > The devcoredump is linked at the device level, so when in use
> > it will prevent the module removal, but it doesn't prevent the
> > call of the pci_remove callback. This callback cannot fail
> > anyway and we end up clearing and freeing the entire pci device.
> > 
> > Hence, after we removed the pci device, we shouldn't allow any
> > read or free operations to avoid segmentation fault.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_devcoredump.c | 19 ++++++++++++++++---
> >  1 file changed, 16 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index d9531183f03a..a08929c01b75 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -42,6 +42,11 @@
> >   * hang capture.
> >   */
> >  
> > +static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
> > +{
> > +	return container_of(coredump, struct xe_device, devcoredump);
> 
> Confused how still would ever return NULL, can you explain?

Very good question! I'm honestly still confused myself.

There's something not quite right with the device relationship that
is getting created with the failling_device and the virtual coredump device.

Once failing_device is removed, the devcoredump should be removed as well,
or both removals blocked. However this is not what happens.

On rmmod xe, the device removal is called and we free all xe structs.
The pci device removal is a void function. We cannot fail. The module
removal ends up blocked because the relationship, but that doesn't
saves the day since the device itself is already gone, by the pci
removal function.

But the devcoredump device is there and active. There's no callback on
devcoredump infra that we could call to force the device removal. Then
any read function will hit a NULL xe device and BOOM!

This is one of the things I planned to tackle on the devcoredump side
after we get this basic infra in use in our driver. This patch allows
us to be protected from this scenario while we don't fix this at the
devcoredump side.

It's worth saying that the devcoredump virtual device is auto removed
after a time elapsed... couple minutes? (I can't remember by heart now).

> 
> Matt
> 
> > +}
> > +
> >  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >  				   size_t count, void *data, size_t datalen)
> >  {
> > @@ -51,6 +56,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >  	struct drm_print_iterator iter;
> >  	struct timespec64 ts;
> >  
> > +	/* Our device is gone already... */
> > +	if (!data || !coredump_to_xe(coredump))
> > +		return -ENODEV;
> > +
> >  	iter.data = buffer;
> >  	iter.offset = 0;
> >  	iter.start = offset;
> > @@ -80,12 +89,16 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >  static void xe_devcoredump_free(void *data)
> >  {
> >  	struct xe_devcoredump *coredump = data;
> > -	struct xe_device *xe = container_of(coredump, struct xe_device,
> > -					    devcoredump);
> > +
> > +	/* Our device is gone. Nothing to do... */
> > +	if (!data || !coredump_to_xe(coredump))
> > +		return;
> > +
> >  	mutex_lock(&coredump->lock);
> >  
> >  	coredump->faulty_engine = NULL;
> > -	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
> > +	drm_info(&coredump_to_xe(coredump)->drm,
> > +		 "Xe device coredump has been deleted.\n");
> >  
> >  	mutex_unlock(&coredump->lock);
> >  }
> > -- 
> > 2.39.2
> > 
