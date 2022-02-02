Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347114A76BE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 18:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D2310E3BC;
	Wed,  2 Feb 2022 17:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBF610E3AB;
 Wed,  2 Feb 2022 17:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643822599; x=1675358599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uLI0kZfe4Bghrz9S1UavU6SCOMlq5bAHamHQNE/enuc=;
 b=XcTkWV+9DtwFGiydgy2gnZIZYZsFJqVar5TECzBBnHxd2OrYSdfmjZn0
 nwHJ7pmLsPlWzCzTuf8dsrf7lfrBAKzYq7QR0zZLmJg6vOkidpIR95nOP
 AplcioY4EbAZF53kfyV1usxLEbT1pRJ3CA/Cpi8krQ9V22oZXoojsQ3p/
 1UPrKxwQFe7pr3Ri6EIVhZduWexVpDgZbXRitTklyvjemGFrbnvKdQAFM
 90QDqQ0qCjasfuiP0/twAQ82ggpeuTCzZ4HWsRgDRLcPrl7kkSZ5cjXo2
 U4NI6emyNoWB13X2Rk1yAfoyzBTPqvJLNFbD1MllHNMzSf8g/Z7u2x6vu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="272462387"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="272462387"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 09:07:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="538340442"
Received: from sbossomx-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.32.64])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 09:07:19 -0800
Date: Wed, 2 Feb 2022 12:07:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/3] drm: Stop spamming log with drm_cache
 message
Message-ID: <Yfq6RdAWGwEtMkYH@intel.com>
References: <20220131165926.3230642-1-lucas.demarchi@intel.com>
 <20220131165926.3230642-2-lucas.demarchi@intel.com>
 <826ebabfb8a177cc451443763e274c9671a68121.camel@intel.com>
 <20220201174133.mxkwzofmocskoc5k@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220201174133.mxkwzofmocskoc5k@ldmartin-desk2>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Souza,
 Jose" <jose.souza@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 01, 2022 at 09:41:33AM -0800, Lucas De Marchi wrote:
> On Tue, Feb 01, 2022 at 09:12:05AM -0800, Jose Souza wrote:
> > On Mon, 2022-01-31 at 08:59 -0800, Lucas De Marchi wrote:
> > > Only x86 and in some cases PPC have support added in drm_cache.c for the
> > > clflush class of functions. However warning once is sufficient to taint
> > > the log instead of spamming it with "Architecture has no drm_cache.c
> > > support" every few millisecond. Switch to WARN_ONCE() so we still get
> > > the log message, but only once, together with the warning. E.g:
> > > 
> > > 	------------[ cut here ]------------
> > > 	Architecture has no drm_cache.c support
> > > 	WARNING: CPU: 80 PID: 888 at drivers/gpu/drm/drm_cache.c:139 drm_clflush_sg+0x40/0x50 [drm]
> > > 	...
> > > 
> > > v2 (Jani): use WARN_ONCE() and keep the message previously on pr_err()
> > 
> > Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
> > 
> > But while at it, why not add a drm_device parameter to this function so we can use drm_WARN_ONCE()?
> > Anyways, it is better than before.
> 
> I thought about that, but it didn't seem justifiable because:
> 
> 1) drm_WARN_ONCE will basically add dev_driver_string() to the log.
> However the warning message here is basically helping the bootstrap of
> additional archs. They shouldn't be seen on anything properly supported.
> 
> 2) This seems all to be a layer below drm anyway and could even be used
> in places outside easy access to a drm pointer.
> 
> So, it seems the benefit of using the subsystem-specific drm_WARN_ONCE
> doesn't justify the hassle of changing the callers, possibly adding
> additional back pointers to have access to the drm device pointer.

Initially I had same feeling as Jose, but good points raised here.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> thanks
> Lucas De Marchi
