Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B8584FC70
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 19:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C114510FA6F;
	Fri,  9 Feb 2024 18:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="C2jK1A21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE35010FA68
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 18:58:02 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40fb7427044so3543045e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 10:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707505079; x=1708109879; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hpsoRqpLKd64ELqO9NGXiBRvqEgLbbfFKZTlhwVqZyY=;
 b=C2jK1A2168vgT9YH9Ux2wH3fZWsZi5pXvUPwoyiN50AKSoe2iTXNvYB+n05yWYd3VK
 a6Zo5ViDaGR1vclQTxzzlKKQxUf5F3A19SAWLxxTW3t85ItAmrMGKDaExa2E9ge71Ni7
 r9nfeCL5icY4u13VQeND9XvgWHPz63xta04gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707505079; x=1708109879;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hpsoRqpLKd64ELqO9NGXiBRvqEgLbbfFKZTlhwVqZyY=;
 b=BZsvoTMCMeuFfvHbwwGx0VGbbHnpqszdou89o58jMpxiuWOyj8NS4tmXVMAUVM5ah4
 noNPODFSPiIcGoF3tJrjFFufFvvgrPNleuf0Mu7Z8MH8NCBQmgYexUzgnDGJip1YU6WL
 UsGrX4D3YnWG9V1w9PsUQtdqZPCE5RRSL8Dl4LNBu3z/sKfDnSxK4GQgNAHkP7NJpcYl
 CQPe27pcHU0Y4dGOZvQ0OekZ0Bdt/gXb+DisqabDNgq0L8hlwkF1RBLAB70apXs1uH3z
 ecJW6mVVNOh4kxNocO1brthbBKFP4j3eBWxmlCM/OOc18AXNzoE5vuOyDadc1hwEP5W2
 up0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh2XHpVSzEozoJnSF60AvRc7NjPc7r4j+POGVqmO2m4AE3zcmDiffaJFCYPjyxLvdhPvmGt6nEeVsYoYXM8owwyVzFR3wxsDdQ+mU0USaf
X-Gm-Message-State: AOJu0YzB7KFYglbSV1H6OE7vVa78jmrOQh+Su5zlmQYmeHFzrfDGmDAR
 OX12a1ZylwhVf5IODTIIjjwjh9K1881gPA1J9uaWREP0ijjxHUYjDpXUzRyMmJ4=
X-Google-Smtp-Source: AGHT+IFjn+aJvnSEzJz+EAyGWbTH8zfaAzdAB852+wGk5ozglY4pVSYurjcnABE1suegmfo4jHSmyw==
X-Received: by 2002:a05:600c:3b29:b0:410:6ab1:3793 with SMTP id
 m41-20020a05600c3b2900b004106ab13793mr138361wms.4.1707505079426; 
 Fri, 09 Feb 2024 10:57:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXdVcaugWKPlY3S+uMN+Yt0Shd5Z6ljLSH89dzmtTRV+PIFlROvUzlPzLOMEkGFzOI+00/ZjliktQqHZAMCqlMmgTX4Wy83WMU02Xj1XocEQoRq9NmcNfEbSBIy2Y5OS96xOfjWGeBJlNx9c0GHqOl3KS4KvjPnWXesosCzqiGfooi7kfedLm6W6BAyD3zqVOn0uRfG5uPv+pjbMFte4EkFAf04ycKQ3J5LBJZIzvi2nKsOCYwsXTa1JpZ833o3tArnUYfrXBak3+ujadZrFGUtLknX7FkebuKnDCxD/Uk2H2PIDhmr0PHdSeK4UhBFy4N3chVbOuuA/vNSa6eU9b/5SFhVlhYDbsDxQvIr5Nwjn7kTwyUtc+31kA==
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b0033b07f428b6sm2547283wrb.0.2024.02.09.10.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 10:57:59 -0800 (PST)
Date: Fri, 9 Feb 2024 19:57:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Dave Airlie <airlied@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v4 1/3] drm: Add drm_get_acpi_edid() helper
Message-ID: <ZcZ1tdXqH90RabvV@phenom.ffwll.local>
Mail-Followup-To: Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 amd-gfx@lists.freedesktop.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Dave Airlie <airlied@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20240207224429.104625-1-mario.limonciello@amd.com>
 <20240207224429.104625-2-mario.limonciello@amd.com>
 <87y1bvb7ns.fsf@intel.com> <ZcYHaXNJ8IqbLIra@phenom.ffwll.local>
 <9fa0c1ad-dd7d-4350-aad1-4723450850bd@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fa0c1ad-dd7d-4350-aad1-4723450850bd@amd.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Fri, Feb 09, 2024 at 09:34:13AM -0600, Mario Limonciello wrote:
> On 2/9/2024 05:07, Daniel Vetter wrote:
> > On Thu, Feb 08, 2024 at 11:57:11AM +0200, Jani Nikula wrote:
> > > On Wed, 07 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> > > > Some manufacturers have intentionally put an EDID that differs from
> > > > the EDID on the internal panel on laptops.  Drivers can call this
> > > > helper to attempt to fetch the EDID from the BIOS's ACPI _DDC method.
> > > > 
> > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > ---
> > > >   drivers/gpu/drm/Kconfig    |  5 +++
> > > >   drivers/gpu/drm/drm_edid.c | 77 ++++++++++++++++++++++++++++++++++++++
> > > >   include/drm/drm_edid.h     |  1 +
> > > >   3 files changed, 83 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > > index 6ec33d36f3a4..ec2bb71e8b36 100644
> > > > --- a/drivers/gpu/drm/Kconfig
> > > > +++ b/drivers/gpu/drm/Kconfig
> > > > @@ -21,6 +21,11 @@ menuconfig DRM
> > > >   	select KCMP
> > > >   	select VIDEO_CMDLINE
> > > >   	select VIDEO_NOMODESET
> > > > +	select ACPI_VIDEO if ACPI
> > > > +	select BACKLIGHT_CLASS_DEVICE if ACPI
> > > > +	select INPUT if ACPI
> > > > +	select X86_PLATFORM_DEVICES if ACPI && X86
> > > > +	select ACPI_WMI if ACPI && X86
> > > 
> > > I think I'll defer to drm maintainers on whether this is okay or
> > > something to be avoided.
> > 
> > Uh yeah this is a bit much, and select just messes with everything. Just
> > #ifdef this in the code with a dummy alternative, if users configure their
> > kernel without acpi but need it, they get to keep all the pieces.
> > 
> > Alternatively make a DRM_ACPI_HELPERS symbol, but imo a Kconfig for every
> > function is also not great. And just using #ifdef in the code also works
> > for CONFIG_OF, which is exactly the same thing for platforms using dt to
> > describe hw.
> > 
> > Also I'd expect ACPI code to already provide dummy functions if ACPI is
> > provided, so you probably dont even need all that much #ifdef in the code.
> > 
> > What we defo cant do is select platform/hw stuff just because you enable
> > CONFIG_DRM.
> > -Sima
> 
> The problem was with linking.  I'll experiment with #ifdef for the next
> version.

Ah yes, if e.g. acpi is a module but drm is built-in then it will compile,
but not link.

You need

	depends on (ACPI || ACPI=n)

for this. Looks a bit funny but works for all combinations.

Since this gets mess it might be useful to have a DRM_ACPI_HELPERS Kconfig
that controls all this.
-Sima

> 
> > 
> > > 
> > > 
> > > >   	help
> > > >   	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
> > > >   	  introduced in XFree86 4.0. If you say Y here, you need to select
> > > > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > > > index 923c4423151c..c649b4f9fd8e 100644
> > > > --- a/drivers/gpu/drm/drm_edid.c
> > > > +++ b/drivers/gpu/drm/drm_edid.c
> > > > @@ -28,6 +28,7 @@
> > > >    * DEALINGS IN THE SOFTWARE.
> > > >    */
> > > > +#include <acpi/video.h>
> > > >   #include <linux/bitfield.h>
> > > >   #include <linux/cec.h>
> > > >   #include <linux/hdmi.h>
> > > > @@ -2188,6 +2189,49 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
> > > >   	return ret == xfers ? 0 : -1;
> > > >   }
> > > > +/**
> > > > + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
> > > > + * @data: struct drm_device
> > > > + * @buf: EDID data buffer to be filled
> > > > + * @block: 128 byte EDID block to start fetching from
> > > > + * @len: EDID data buffer length to fetch
> > > > + *
> > > > + * Try to fetch EDID information by calling acpi_video_get_edid() function.
> > > > + *
> > > > + * Return: 0 on success or error code on failure.
> > > > + */
> > > > +static int
> > > > +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
> > > > +{
> > > > +	struct drm_device *ddev = data;
> > > > +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
> > > > +	unsigned char start = block * EDID_LENGTH;
> > > > +	void *edid;
> > > > +	int r;
> > > > +
> > > > +	if (!acpidev)
> > > > +		return -ENODEV;
> > > > +
> > > > +	/* fetch the entire edid from BIOS */
> > > > +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> > > > +	if (r < 0) {
> > > > +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +	if (len > r || start > r || start + len > r) {
> > > > +		r = -EINVAL;
> > > > +		goto cleanup;
> > > > +	}
> > > > +
> > > > +	memcpy(buf, edid + start, len);
> > > > +	r = 0;
> > > > +
> > > > +cleanup:
> > > > +	kfree(edid);
> > > > +
> > > > +	return r;
> > > > +}
> > > > +
> > > >   static void connector_bad_edid(struct drm_connector *connector,
> > > >   			       const struct edid *edid, int num_blocks)
> > > >   {
> > > > @@ -2643,6 +2687,39 @@ struct edid *drm_get_edid(struct drm_connector *connector,
> > > >   }
> > > >   EXPORT_SYMBOL(drm_get_edid);
> > > > +/**
> > > > + * drm_get_acpi_edid - get EDID data, if available
> > > 
> > > I'd prefer all the new EDID API to be named drm_edid_*. Makes a clean
> > > break from the old API, and is more consistent.
> > > 
> > > So perhaps drm_edid_read_acpi() to be in line with all the other struct
> > > drm_edid based EDID reading functions.
> > > 
> > > > + * @connector: connector we're probing
> > > > + *
> > > > + * Use the BIOS to attempt to grab EDID data if possible.
> > > > + *
> > > > + * The returned pointer must be freed using drm_edid_free().
> > > > + *
> > > > + * Return: Pointer to valid EDID or NULL if we couldn't find any.
> > > > + */
> > > > +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector)
> > > > +{
> > > > +	const struct drm_edid *drm_edid;
> > > > +
> > > > +	switch (connector->connector_type) {
> > > > +	case DRM_MODE_CONNECTOR_LVDS:
> > > > +	case DRM_MODE_CONNECTOR_eDP:
> > > > +		break;
> > > > +	default:
> > > > +		return NULL;
> > > > +	}
> > > > +
> > > > +	if (connector->force == DRM_FORCE_OFF)
> > > > +		return NULL;
> > > > +
> > > > +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector->dev);
> > > > +
> > > > +	/* Note: Do *not* call connector updates here. */
> > > > +
> > > > +	return drm_edid;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_get_acpi_edid);
> > > > +
> > > >   /**
> > > >    * drm_edid_read_custom - Read EDID data using given EDID block read function
> > > >    * @connector: Connector to use
> > > > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > > > index 7923bc00dc7a..ca41be289fc6 100644
> > > > --- a/include/drm/drm_edid.h
> > > > +++ b/include/drm/drm_edid.h
> > > > @@ -410,6 +410,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
> > > >   	void *data);
> > > >   struct edid *drm_get_edid(struct drm_connector *connector,
> > > >   			  struct i2c_adapter *adapter);
> > > > +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector);
> > > 
> > > There's a comment
> > > 
> > > /* Interface based on struct drm_edid */
> > > 
> > > towards the end of the file, gathering all the new API under it.
> > > 
> > > Other than that, LGTM,
> > > 
> > > BR,
> > > Jani.
> > > 
> > > >   u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
> > > >   struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
> > > >   				     struct i2c_adapter *adapter);
> > > 
> > > -- 
> > > Jani Nikula, Intel
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
