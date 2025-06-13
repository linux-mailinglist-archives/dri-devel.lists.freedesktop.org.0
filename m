Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81607AD93E3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 19:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4368610E27B;
	Fri, 13 Jun 2025 17:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Gr3aw5h8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4440410E1DE;
 Fri, 13 Jun 2025 17:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=57Y23JBtJNE44cM4KB+IAZKhcAQpF0krjbGo4C6KOAY=; b=Gr3aw5h8BT8iJqyh9yRUzwSJTj
 CzcjqDNaislvMk7a4eT2nABb2htMPO7UczWqUQ8RPIV2PQUJsGFRJq1Y1LhhNxx4DgG52mMU1Olba
 mqE7LdQjluSLdLLb5XwfluGOib91IrRm564arvkFb+J8usHcyQx/oTMZRs9psgMfqlfRWYgKOkTkG
 q4xi6lGni52zlY6kbZwmO+JNrhglG+QYdsqKxn5yPmFL1ghPx+7fCkMlO281X647Wz3+rbpUmk1Id
 0UIWXJMvDA5vng3BhFZZC9Yjm96O5JHiBRB+Uc72+XtBW1PX1KKQJWihEN2NPkgfQ4LvSW2ltpzgG
 z12Mtwvw==;
Received: from [189.6.13.79] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ8R4-00398h-0g; Fri, 13 Jun 2025 19:43:26 +0200
Date: Fri, 13 Jun 2025 14:42:45 -0300
From: Melissa Wen <mwen@igalia.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v4 13/14] drm/amd/display: add drm_edid to dc_sink
Message-ID: <jau2ceehoydonrbqfsgsdhvgcoltqtxq6ahms3zenwqhlgu3k3@zno3kendzxg6>
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-14-mwen@igalia.com>
 <e8f4fb73-cb63-4662-b041-4719785c5b37@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8f4fb73-cb63-4662-b041-4719785c5b37@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/13, Mario Limonciello wrote:
> On 6/13/2025 7:58 AM, Melissa Wen wrote:
> > Add Linux opaque object to dc_sink for storing edid data cross driver,
> > drm_edid. Also include the Linux call to free this object, the
> > drm_edid_free()
> > 
> > v3:
> > - remove uneccessary include (jani)
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c | 6 ++++++
> >   drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h | 1 +
> >   drivers/gpu/drm/amd/display/dc/core/dc_sink.c   | 3 +++
> >   drivers/gpu/drm/amd/display/dc/dc.h             | 1 +
> >   include/drm/drm_edid.h                          | 4 ++--
> >   5 files changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> > index a90545b176cc..9e86dc15557b 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> > @@ -1,6 +1,7 @@
> >   // SPDX-License-Identifier: MIT
> >   #include "amdgpu_dm/dc_edid.h"
> >   #include "dc.h"
> > +#include <drm/drm_edid.h>
> >   bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
> >   			  struct dc_sink *current_sink)
> > @@ -25,3 +26,8 @@ void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
> >   	memmove(dc_sink->dc_edid.raw_edid, edid, len);
> >   	dc_sink->dc_edid.length = len;
> >   }
> > +
> > +void dc_edid_sink_edid_free(struct dc_sink *sink)
> > +{
> > +	drm_edid_free(sink->drm_edid);
> > +}
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> > index f42cd5bbc730..2c76768be459 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> > @@ -9,5 +9,6 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
> >   			  struct dc_sink *current_sink);
> >   void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
> >   			     const void *edid, int len);
> > +void dc_edid_sink_edid_free(struct dc_sink *sink);
> >   #endif /* __DC_EDID_H__ */
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> > index 455fa5dd1420..3774a3245506 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> > @@ -26,6 +26,7 @@
> >   #include "dm_services.h"
> >   #include "dm_helpers.h"
> >   #include "core_types.h"
> > +#include "dc_edid.h"
> >   /*******************************************************************************
> >    * Private functions
> > @@ -65,6 +66,8 @@ void dc_sink_retain(struct dc_sink *sink)
> >   static void dc_sink_free(struct kref *kref)
> >   {
> >   	struct dc_sink *sink = container_of(kref, struct dc_sink, refcount);
> > +
> > +	dc_edid_sink_edid_free(sink);
> >   	kfree(sink->dc_container_id);
> >   	kfree(sink);
> >   }
> > diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> > index 86feef038de6..cf56a0405a4f 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dc.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> > @@ -2466,6 +2466,7 @@ struct scdc_caps {
> >   struct dc_sink {
> >   	enum signal_type sink_signal;
> >   	struct dc_edid dc_edid; /* raw edid */
> > +	const struct drm_edid *drm_edid; /* Linux DRM edid*/
> 
> Don't you need a forward declaration for 'struct drm_edid' in dc.h to be
> able to do this?

I understand that, as it's just a pointer (the compiler knows the size)
and there is no circular dependencies between dc_sink and drm_edid, we
don't need a forward declaration. So I think we are fine also because
dc_sink->drm_edid dereference only happens in dc_edid.h that already
needs to include drm_edid.h for drm_edid helpers... but let me know if
I'm missing something.

> 
> Also you're missing a space at the end of the comment before the '*/'.

ack. I'll wait for more comments to send it fixed.

Thanks for reviewing.

Melissa

> 
> >   	struct dc_edid_caps edid_caps; /* parse display caps */
> >   	struct dc_container_id *dc_container_id;
> >   	uint32_t dongle_max_pix_clk;
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index e7a9a4928b97..8617d2285f38 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -469,8 +469,8 @@ int drm_edid_connector_update(struct drm_connector *connector,
> >   			      const struct drm_edid *edid);
> >   int drm_edid_connector_add_modes(struct drm_connector *connector);
> >   bool drm_edid_is_digital(const struct drm_edid *drm_edid);
> > -bool drm_edid_eq(const struct drm_edid *drm_edid_first,
> > -			 const struct drm_edid *drm_edid_second);
> > +bool drm_edid_eq(const struct drm_edid *drm_edid_1,
> > +		 const struct drm_edid *drm_edid_2);
> >   void drm_edid_get_product_id(const struct drm_edid *drm_edid,
> >   			     struct drm_edid_product_id *id);
> >   void drm_edid_print_product_id(struct drm_printer *p,
> 
