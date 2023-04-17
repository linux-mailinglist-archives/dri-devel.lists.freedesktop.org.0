Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00F46E4529
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 12:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E2F10E3EC;
	Mon, 17 Apr 2023 10:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B98C10E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681727190; x=1713263190;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p6J9xCduUQ1ErUtG/sJWiooPQVxeEqq3alTCs0pnWc4=;
 b=ZfCvEHkbaqS3X3iXHqND43R4QkBQL+Nc8diMEjf6y8woEjqt70hTB5Ec
 kgjX9PTVjqCKzviX6D2F64g9Txhdhopf+1rSWySdW9nG/oSkjLNZpP+50
 7PFRLIDqtMjQy1Gk0qb8DEXHfNzPyaFQpMfW2VnVKbOdqzeeuQ4jPcNn5
 /SnlrilheBmVxUUkgYc2ZTEV6JxcJzkmAk34IOJOmY9BcLZrb0QPfAkAu
 Ga3r9oj0GiQX6CeFNClDIB7mSSGCGFt7VsXmit3GLanKGTsz7HbzMPGvj
 Gke5vaRXvvUh2hbn9U/3oPpj6Y/GFg9DAEbyVAjBKdaVY9OznA/DU3Zkl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="344855092"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="344855092"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 03:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="723206427"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="723206427"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 03:26:26 -0700
Date: Mon, 17 Apr 2023 12:26:24 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/5] drm/debugfs: rework debugfs directory creation v3
Message-ID: <20230417102624.GB3141290@linux.intel.com>
References: <20230412145206.2483-1-christian.koenig@amd.com>
 <20230412145206.2483-3-christian.koenig@amd.com>
 <e0803bcf-c447-ad8d-bd1d-af8658cc72c4@habana.ai>
 <5446881a-bdb8-4d85-bf00-c54e001661f1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5446881a-bdb8-4d85-bf00-c54e001661f1@gmail.com>
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
Cc: "quic_jhugo@quicinc.com" <quic_jhugo@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "mcanal@igalia.com" <mcanal@igalia.com>, "mwen@igalia.com" <mwen@igalia.com>,
 Tomer Tayar <ttayar@habana.ai>, "maxime@cerno.tech" <maxime@cerno.tech>,
 "wambui.karugax@gmail.com" <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 09:18:31AM +0200, Christian König wrote:
> 
> 
> Am 16.04.23 um 18:03 schrieb Tomer Tayar:
> > On 12/04/2023 17:52, Christian König wrote:
> > >    /**
> > > - * accel_debugfs_init() - Initialize debugfs for accel minor
> > > + * accel_debugfs_init() - Register debugfs for accel minor
> > > + * @dev: Pointer to the device instance.
> > > + *
> > > + * This function creates a root directory for the device in debugfs.
> > > + */
> > > +void accel_debugfs_init(struct drm_device *dev)
> > > +{
> > > +	drm_debugfs_dev_init(dev, accel_debugfs_root);
> > > +}
> > > +
> > > +/**
> > > + * accel_debugfs_register() - Register debugfs for device
> > >     * @minor: Pointer to the drm_minor instance.
> > >     * @minor_id: The minor's id
> > >     *
> > > - * This function initializes the drm minor's debugfs members and creates
> > > - * a root directory for the minor in debugfs. It also creates common files
> > > - * for accelerators and calls the driver's debugfs init callback.
> > > + * Creates common files for accelerators.
> > >     */
> > > -void accel_debugfs_init(struct drm_minor *minor, int minor_id)
> > > +void accel_debugfs_register(struct drm_device *dev)
> > >    {
I wonder if we need this and can not use drm_debugfs_dev_register() ?
In drm there are two additional files "clients" and "gem_names" which are
appropriate to accel as well and so far we do not have any accel
specific files.

Regards
Stanislaw
