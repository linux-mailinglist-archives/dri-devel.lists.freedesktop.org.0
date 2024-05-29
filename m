Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E248D3DCA
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 19:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C74112D5D;
	Wed, 29 May 2024 17:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gfxRDvKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777AD112D41
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 17:55:36 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52b59f77670so42074e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717005334; x=1717610134; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oI1WONPChvzTYeClTUbWKLHkDxCb4Kvg9ToUPjcgp9U=;
 b=gfxRDvKvpeShH5k08Eh2C6S89DDbnoEjrU8L/CGAbpx2jRDpJd0WTaAbi+tqKJh/zt
 EdnfLjJmXDkJ1rz77+cmsDycvgC6QYnuXbHEpMl+4FayQJWAZCricM6VpDIUPdGB3u3z
 CO5qoRAQ8vUug7XPIUiWLtdKRcf4XvtXo7N2Ioz3evQO4O3MxYaWER+7wNIFGemNkZJQ
 Nry/EGc3lf1QhWkQ23T6dSUggiCQ6Ea4LzNvTtFdHXF+OszpT665EIVGE89hGruLUq4S
 qvzuZKTv5V36Eh0j+Gv8LwbTT0OfFKPBbkS0b1i/PSkYKQwfu9vHFyQDh4yHA+OwFC+u
 H7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717005334; x=1717610134;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oI1WONPChvzTYeClTUbWKLHkDxCb4Kvg9ToUPjcgp9U=;
 b=MtUNi7n9AhDN6wz+9Ku2P5ETuv0c9aySHIOT912EeXrolja9v69VaBejIiT11b5vte
 mWtV8z3svIj2wvcMgHDpU/B1y+JrvpAZU+B9/YcdpPyKopB9kZ4K58jQFj05r4Gkq7ti
 435F6+ubwkFEvnxkvLciyTD+o4Y9w9dNLhhAYudY9SpwWfhWyez3zpc/yEzxXuXu2sZe
 z2FS32/15DTTa9Be/PoJlErorHerdc857h2QuEzNLp1o4Vj3hj2Lsdtm/VjQGNRYbRqN
 Zw1KUzjwmshuFU6RghKdTq+ygaDT7lygFattacRTcNhPRuEaxG0kuhQK7YQAX0Cx7IfH
 vS5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNw9OEvyAVomG1z/5vRRainKmouZgOOsc3tCiYhWEK6ekuEeqX9UG8f/TSk9FQdqRng7LlwSBrSvd9yoIG3QuE4nCcYI0Tz0fpXtTvkaiT
X-Gm-Message-State: AOJu0YyxLmy9Jn2b27+mHvGSPaey86J9MCQAhPBJ2esnW0CjQxu8YcfS
 j/IhirK10iBMi/DkwLk6yUBj8+r3EUlgAmUhPX5sIcLaIDGcXb7hzR4Oucm/WRuat5d6Z0Bb7yh
 a
X-Google-Smtp-Source: AGHT+IFQAm6qc7XzXyN8C8JYg8UfiJ+A4EBCRSceaiEsuveEbLqGxA+ipv55BAQ/m89F/t4Nfy8sXA==
X-Received: by 2002:ac2:4a9e:0:b0:515:fc44:b3f7 with SMTP id
 2adb3069b0e04-5296556f224mr14865849e87.24.1717005334305; 
 Wed, 29 May 2024 10:55:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529716df56esm1317134e87.301.2024.05.29.10.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 10:55:33 -0700 (PDT)
Date: Wed, 29 May 2024 20:55:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org, 
 Chris Bainbridge <chris.bainbridge@gmail.com>, hughsient@gmail.com
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
Message-ID: <g34f3sdk22grheq2vaaonkl543dtk7nb5sffqgmkl5ywtj5skk@p5ht5ug33q4z>
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <Zlc4V1goFvU2antl@intel.com>
 <197d195f-9206-41dd-8ff1-f4bb4988fb9b@amd.com>
 <ZldMKZ1MzSDXOheJ@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZldMKZ1MzSDXOheJ@intel.com>
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

On Wed, May 29, 2024 at 06:39:21PM +0300, Ville Syrjälä wrote:
> On Wed, May 29, 2024 at 09:45:55AM -0500, Mario Limonciello wrote:
> > On 5/29/2024 09:14, Ville Syrjälä wrote:
> > > On Tue, May 28, 2024 at 04:03:19PM -0500, Mario Limonciello wrote:
> > >> If the lid on a laptop is closed when eDP connectors are populated
> > >> then it remains enabled when the initial framebuffer configuration
> > >> is built.
> > >>
> > >> When creating the initial framebuffer configuration detect the ACPI
> > >> lid status and if it's closed disable any eDP connectors.
> > >>
> > >> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> > >> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
> > >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > >> ---
> > >> Cc: hughsient@gmail.com
> > >> v1->v2:
> > >>   * Match LVDS as well
> > >> ---
> > >>   drivers/gpu/drm/drm_client_modeset.c | 30 ++++++++++++++++++++++++++++
> > >>   1 file changed, 30 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> > >> index 31af5cf37a09..0b0411086e76 100644
> > >> --- a/drivers/gpu/drm/drm_client_modeset.c
> > >> +++ b/drivers/gpu/drm/drm_client_modeset.c
> > >> @@ -8,6 +8,7 @@
> > >>    */
> > >>   
> > >>   #include "drm/drm_modeset_lock.h"
> > >> +#include <acpi/button.h>
> > >>   #include <linux/module.h>
> > >>   #include <linux/mutex.h>
> > >>   #include <linux/slab.h>
> > >> @@ -257,6 +258,34 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
> > >>   		enabled[i] = drm_connector_enabled(connectors[i], false);
> > >>   }
> > >>   
> > >> +static void drm_client_match_edp_lid(struct drm_device *dev,
> > >> +				     struct drm_connector **connectors,
> > >> +				     unsigned int connector_count,
> > >> +				     bool *enabled)
> > >> +{
> > >> +	int i;
> > >> +
> > >> +	for (i = 0; i < connector_count; i++) {
> > >> +		struct drm_connector *connector = connectors[i];
> > >> +
> > >> +		switch (connector->connector_type) {
> > >> +		case DRM_MODE_CONNECTOR_LVDS:
> > >> +		case DRM_MODE_CONNECTOR_eDP:

What about DPI or DSI panels? I think they should also be handled in a
similar way. Not sure regarding the SPI.

> > >> +			if (!enabled[i])
> > >> +				continue;
> > >> +			break;
> > >> +		default:
> > >> +			continue;
> > >> +		}
> > >> +
> > >> +		if (!acpi_lid_open()) {
> > >> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
> > >> +				    connector->base.id, connector->name);
> > >> +			enabled[i] = false;
> > >> +		}
> > >> +	}
> > >> +}
> > > 

[trimmed]

> 
> The other potential issue here is whether acpi_lid_open() is actually
> trustworthy. Some kms drivers have/had some lid handling in their own
> code, and I'm pretty sure those have often needed quirks/modparams
> to actually do sensible things on certain machines.
> 
> FWIW I ripped out all the lid crap from i915 long ago since it was
> half backed, mostly broken, and ugly, and I'm not looking to add it
> back there. But I do think handling that in drm_client does seem
> somewhat sane, as that should more or less match what userspace
> clients would do. Just a question of how bad the quirk situation
> will get...

Looking at drivers/acpi/button.c, the button driver handles some of the
quirks when posting the data to the input subsystem.

> 
> 
> Also a direct acpi_lid_open() call seems a bit iffy. But I guess if
> someone needs this to work on non-ACPI system they get to figure out
> how to abstract it better. acpi_lid_open() does seem to return != 0
> when ACPI is not supported, so at least it would err on the side
> of enabling everything.

Thanks. I was going to comment, but you got it first. I think a proper
implementation should check for SW_LID input device instead of simply
using acpi_lid_open(). This will handle the issue for other,
non-ACPI-based laptops.

-- 
With best wishes
Dmitry
