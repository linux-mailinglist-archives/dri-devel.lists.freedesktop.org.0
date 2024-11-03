Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857AE9BAC30
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 06:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC8410E371;
	Mon,  4 Nov 2024 05:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UWkH2r65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3466110E375
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 05:48:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B7A5AA426ED;
 Mon,  4 Nov 2024 05:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF50C4CED0;
 Mon,  4 Nov 2024 05:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1730699294;
 bh=RwMs4LFV1maPF/tm4MibNScL3B4lk59iHdGmNhzk37s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UWkH2r65Qz/BItghQFfV4/WUnakg1LjlVayaczT9oE8vvJjiCY2oFWjh1IvKuNSU8
 NfveXpiuRiSDpvBZYgaAuJd0hwAL9D4MuVwp2kF7t4mldhlFLqYd/HaKQIc9RuWHf9
 8Hu/jSoN7gWqw0NYwB83aleyoHd1fIfinMtpl5Bo=
Date: Mon, 4 Nov 2024 00:59:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm: Change drm_class from pointer to const struct
 class
Message-ID: <2024110419-rehydrate-unenvied-e66f@gregkh>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <9e5567f6-c27e-4875-9db8-0435669a7d7c@gmail.com>
 <56lilw7gkq4ggtxfoykxcd727llmdrc2wksoafhjktxwpxil4e@6kcfqgwtxcrj>
 <f09db690-f4a2-41d2-905f-764faa8e6f0c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f09db690-f4a2-41d2-905f-764faa8e6f0c@gmail.com>
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

On Sat, Nov 02, 2024 at 10:33:24PM +0100, Heiner Kallweit wrote:
> On 22.09.2024 17:11, Dmitry Baryshkov wrote:
> > On Sun, Sep 08, 2024 at 02:11:25PM GMT, Heiner Kallweit wrote:
> >> Define class drm statically and constify it. This ensure that no user
> >> of the exported struct class can tamper with it.
> >>
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >> ---
> >>  drivers/gpu/drm/drm_internal.h       |  2 +-
> >>  drivers/gpu/drm/drm_privacy_screen.c |  2 +-
> >>  drivers/gpu/drm/drm_sysfs.c          | 32 ++++++++++++++--------------
> >>  3 files changed, 18 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> >> index 1705bfc90..6e0df44b6 100644
> >> --- a/drivers/gpu/drm/drm_internal.h
> >> +++ b/drivers/gpu/drm/drm_internal.h
> >> @@ -139,7 +139,7 @@ bool drm_master_internal_acquire(struct drm_device *dev);
> >>  void drm_master_internal_release(struct drm_device *dev);
> >>  
> >>  /* drm_sysfs.c */
> >> -extern struct class *drm_class;
> >> +extern const struct class drm_class;
> >>  
> >>  int drm_sysfs_init(void);
> >>  void drm_sysfs_destroy(void);
> >> diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
> >> index 6cc39e307..2fbd24ba5 100644
> >> --- a/drivers/gpu/drm/drm_privacy_screen.c
> >> +++ b/drivers/gpu/drm/drm_privacy_screen.c
> >> @@ -401,7 +401,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
> >>  	mutex_init(&priv->lock);
> >>  	BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
> >>  
> >> -	priv->dev.class = drm_class;
> >> +	priv->dev.class = &drm_class;
> >>  	priv->dev.type = &drm_privacy_screen_type;
> >>  	priv->dev.parent = parent;
> >>  	priv->dev.release = drm_privacy_screen_device_release;
> >> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> >> index f8577043e..f443f9a76 100644
> >> --- a/drivers/gpu/drm/drm_sysfs.c
> >> +++ b/drivers/gpu/drm/drm_sysfs.c
> >> @@ -58,7 +58,15 @@ static struct device_type drm_sysfs_device_connector = {
> >>  	.name = "drm_connector",
> >>  };
> >>  
> >> -struct class *drm_class;
> >> +static char *drm_devnode(const struct device *dev, umode_t *mode)
> >> +{
> >> +	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
> >> +}
> >> +
> >> +const struct class drm_class = {
> >> +	.name = "drm",
> >> +	.devnode = drm_devnode,
> >> +};
> >>  
> >>  #ifdef CONFIG_ACPI
> >>  static bool drm_connector_acpi_bus_match(struct device *dev)
> >> @@ -93,11 +101,6 @@ static void drm_sysfs_acpi_register(void) { }
> >>  static void drm_sysfs_acpi_unregister(void) { }
> >>  #endif
> >>  
> >> -static char *drm_devnode(const struct device *dev, umode_t *mode)
> >> -{
> >> -	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
> >> -}
> >> -
> > 
> > Please keep this function in place and move drm_class declarattion next
> > to it. It simplifies reviewing the code.
> > 
> >>  static int typec_connector_bind(struct device *dev,
> >>  				struct device *typec_connector, void *data)
> >>  {
> >> @@ -138,14 +141,12 @@ static const struct component_ops typec_connector_ops = {
> >>   */
> >>  int drm_sysfs_init(void)
> >>  {
> >> -	drm_class = class_create("drm");
> >> -	if (IS_ERR(drm_class))
> >> -		return PTR_ERR(drm_class);
> >> +	int ret = class_register(&drm_class);
> >>  
> >> -	drm_class->devnode = drm_devnode;
> >> +	if (!ret)
> >> +		drm_sysfs_acpi_register();
> >>  
> >> -	drm_sysfs_acpi_register();
> >> -	return 0;
> >> +	return ret;
> >>  }
> >>  
> >>  /**
> >> @@ -156,8 +157,7 @@ int drm_sysfs_init(void)
> >>  void drm_sysfs_destroy(void)
> >>  {
> >>  	drm_sysfs_acpi_unregister();
> >> -	class_destroy(drm_class);
> >> -	drm_class = NULL;
> >> +	class_unregister(&drm_class);
> > 
> > This code makes me wonder: can we define static classes in unloadable
> > modules? What happens if userspace holds the reference on the class in
> > sysfs, while we remove the module ?

Bad things happen, don't do that :)

Good news is it's really hard to hold onto a class structure from
userspace, sysfs should not be doing this, so there shouldn't be really
any other code paths that cause this to happen, unless you do something
odd in your driver.

thanks,

greg k-h
