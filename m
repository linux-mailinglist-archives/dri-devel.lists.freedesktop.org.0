Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E38C3461AC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 15:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDE06E10F;
	Tue, 23 Mar 2021 14:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4136E0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MdClpF9ZBgMl2iVDn7AujDxQsV2mZzz+c5mCWJB/VKk=; b=IeX828/T33QQfl5lNCW5UFILFT
 w7MHuPI4oYCDLi6Rk7LW7GiiAwibIMmUIiXSBPOh/Q9g+ERcVNrj5bwLTpSoYO6Chb4PQoTQagzYk
 3+S8FBXYoe/JySrV4laxT0yleId4ZAbtqYyXDgzV1eiChk4TtoOJo0FXIxo0eEqQTECOdO73WRmEq
 CorwQiDHq7S/RmIr1nhPG0kTFbEbiMuZ+Qw9YY34+u/93fBNiVhrII4AqjCFLa/aREyOts53Bj+BY
 y2MEDX+ayo8yPk7aW3hoCQoN39EAjEibHfdjJp5skPB1qXJWlKz16JnS1uBxiF4KRvTFevu1SG5jj
 9/wk43eQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lOiFM-0001nE-B1; Tue, 23 Mar 2021 16:43:04 +0200
Subject: Re: [PATCH v5 19/21] drm/tegra: Implement new UAPI
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-20-mperttunen@nvidia.com>
 <YFnsQNiLg/5I/qKA@orome.fritz.box>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <494e3858-5b29-0b44-f2eb-7a7cc16ff325@kapsi.fi>
Date: Tue, 23 Mar 2021 16:43:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFnsQNiLg/5I/qKA@orome.fritz.box>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/23/21 3:25 PM, Thierry Reding wrote:
> On Mon, Jan 11, 2021 at 03:00:17PM +0200, Mikko Perttunen wrote:
>> Implement the non-submission parts of the new UAPI, including
>> channel management and memory mapping. The UAPI is under the
>> CONFIG_DRM_TEGRA_STAGING config flag for now.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v5:
>> * Set iova_end in both mapping paths
>> v4:
>> * New patch, split out from combined UAPI + submit patch.
>> ---
>>   drivers/gpu/drm/tegra/Makefile    |   1 +
>>   drivers/gpu/drm/tegra/drm.c       |  41 ++--
>>   drivers/gpu/drm/tegra/drm.h       |   5 +
>>   drivers/gpu/drm/tegra/uapi.h      |  63 ++++++
>>   drivers/gpu/drm/tegra/uapi/uapi.c | 307 ++++++++++++++++++++++++++++++
> 
> I'd prefer if we kept the directory structure flat. There's something
> like 19 pairs of files in the top-level directory, which is reasonably
> manageable. Also, it looks like there's going to be a couple more files
> in this new subdirectory. I'd prefer if that was all merged into the
> single uapi.c source file to keep things simpler. These are all really
> small files, so there's no need to aggressively split things up. Helps
> with compilation time, too.

Will do, although I think having plenty of subdirectories makes things 
more organized :)

> 
> FWIW, I would've been fine with stashing all of this into drm.c as well
> since the rest of the UAPI is in that already. The churn in this patch
> is reasonably small, but it would've been even less if this was just all
> in drm.c.

I think we shouldn't have the uapi in drm.c -- it just makes the file a 
bit of a dumping ground. I think drm.c should have the code that relates 
to initialization and initial registration with DRM.

> 
>>   5 files changed, 401 insertions(+), 16 deletions(-)
>>   create mode 100644 drivers/gpu/drm/tegra/uapi.h
>>   create mode 100644 drivers/gpu/drm/tegra/uapi/uapi.c
>>
>> diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
>> index d6cf202414f0..0abdb21b38b9 100644
>> --- a/drivers/gpu/drm/tegra/Makefile
>> +++ b/drivers/gpu/drm/tegra/Makefile
>> @@ -3,6 +3,7 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
>>   
>>   tegra-drm-y := \
>>   	drm.o \
>> +	uapi/uapi.o \
>>   	gem.o \
>>   	fb.o \
>>   	dp.o \
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index afd3f143c5e0..6a51035ce33f 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -20,6 +20,7 @@
>>   #include <drm/drm_prime.h>
>>   #include <drm/drm_vblank.h>
>>   
>> +#include "uapi.h"
>>   #include "drm.h"
>>   #include "gem.h"
>>   
>> @@ -33,11 +34,6 @@
>>   #define CARVEOUT_SZ SZ_64M
>>   #define CDMA_GATHER_FETCHES_MAX_NB 16383
>>   
>> -struct tegra_drm_file {
>> -	struct idr contexts;
>> -	struct mutex lock;
>> -};
>> -
>>   static int tegra_atomic_check(struct drm_device *drm,
>>   			      struct drm_atomic_state *state)
>>   {
>> @@ -90,7 +86,8 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
>>   	if (!fpriv)
>>   		return -ENOMEM;
>>   
>> -	idr_init_base(&fpriv->contexts, 1);
>> +	idr_init_base(&fpriv->legacy_contexts, 1);
>> +	xa_init_flags(&fpriv->contexts, XA_FLAGS_ALLOC1);
>>   	mutex_init(&fpriv->lock);
>>   	filp->driver_priv = fpriv;
>>   
>> @@ -429,7 +426,7 @@ static int tegra_client_open(struct tegra_drm_file *fpriv,
>>   	if (err < 0)
>>   		return err;
>>   
>> -	err = idr_alloc(&fpriv->contexts, context, 1, 0, GFP_KERNEL);
>> +	err = idr_alloc(&fpriv->legacy_contexts, context, 1, 0, GFP_KERNEL);
>>   	if (err < 0) {
>>   		client->ops->close_channel(context);
>>   		return err;
>> @@ -484,13 +481,13 @@ static int tegra_close_channel(struct drm_device *drm, void *data,
>>   
>>   	mutex_lock(&fpriv->lock);
>>   
>> -	context = idr_find(&fpriv->contexts, args->context);
>> +	context = idr_find(&fpriv->legacy_contexts, args->context);
>>   	if (!context) {
>>   		err = -EINVAL;
>>   		goto unlock;
>>   	}
>>   
>> -	idr_remove(&fpriv->contexts, context->id);
>> +	idr_remove(&fpriv->legacy_contexts, context->id);
>>   	tegra_drm_context_free(context);
>>   
>>   unlock:
>> @@ -509,7 +506,7 @@ static int tegra_get_syncpt(struct drm_device *drm, void *data,
>>   
>>   	mutex_lock(&fpriv->lock);
>>   
>> -	context = idr_find(&fpriv->contexts, args->context);
>> +	context = idr_find(&fpriv->legacy_contexts, args->context);
>>   	if (!context) {
>>   		err = -ENODEV;
>>   		goto unlock;
>> @@ -538,7 +535,7 @@ static int tegra_submit(struct drm_device *drm, void *data,
>>   
>>   	mutex_lock(&fpriv->lock);
>>   
>> -	context = idr_find(&fpriv->contexts, args->context);
>> +	context = idr_find(&fpriv->legacy_contexts, args->context);
>>   	if (!context) {
>>   		err = -ENODEV;
>>   		goto unlock;
>> @@ -563,7 +560,7 @@ static int tegra_get_syncpt_base(struct drm_device *drm, void *data,
>>   
>>   	mutex_lock(&fpriv->lock);
>>   
>> -	context = idr_find(&fpriv->contexts, args->context);
>> +	context = idr_find(&fpriv->legacy_contexts, args->context);
>>   	if (!context) {
>>   		err = -ENODEV;
>>   		goto unlock;
>> @@ -732,10 +729,21 @@ static int tegra_gem_get_flags(struct drm_device *drm, void *data,
>>   
>>   static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
>>   #ifdef CONFIG_DRM_TEGRA_STAGING
>> -	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create,
>> +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_OPEN, tegra_drm_ioctl_channel_open,
>> +			  DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_CLOSE, tegra_drm_ioctl_channel_close,
>> +			  DRM_RENDER_ALLOW),
> 
> I'd prefer to keep call these TEGRA_OPEN_CHANNEL and TEGRA_CLOSE_CHANNEL
> because I find that easier to think of. My reasoning goes: the TEGRA_
> prefix means we're operating at a global context and then we perform the
> OPEN_CHANNEL and CLOSE_CHANNEL operations. Whereas by the same reasoning
> TEGRA_CHANNEL_OPEN and TEGRA_CHANNEL_CLOSE suggest we're operating at
> the channel context and perform OPEN and CLOSE operations. For close you
> could make the argument that it makes sense, but you can't open a
> channel that you don't have yet.

I go by the same argument but consider TEGRA_CHANNEL_OPEN a bit of a 
"static method" of channels, and as such acceptable :p But I do see your 
point -- I can change it.

> 
> And if that doesn't convince you, I think appending _LEGACY here like we
> do for CREATE and MMAP would be more consistent. Who's going to remember
> which one is new: TEGRA_CHANNEL_OPEN or TEGRA_OPEN_CHANNEL?
> 
>> +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_MAP, tegra_drm_ioctl_channel_map,
>>   			  DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap,
>> +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
>>   			  DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_drm_ioctl_gem_create,
>> +			  DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_drm_ioctl_gem_mmap,
>> +			  DRM_RENDER_ALLOW),
>> +
>> +	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE_LEGACY, tegra_gem_create, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP_LEGACY, tegra_gem_mmap, DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_READ, tegra_syncpt_read,
>>   			  DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_INCR, tegra_syncpt_incr,
>> @@ -789,10 +797,11 @@ static void tegra_drm_postclose(struct drm_device *drm, struct drm_file *file)
>>   	struct tegra_drm_file *fpriv = file->driver_priv;
>>   
>>   	mutex_lock(&fpriv->lock);
>> -	idr_for_each(&fpriv->contexts, tegra_drm_context_cleanup, NULL);
>> +	idr_for_each(&fpriv->legacy_contexts, tegra_drm_context_cleanup, NULL);
>> +	tegra_drm_uapi_close_file(fpriv);
>>   	mutex_unlock(&fpriv->lock);
>>   
>> -	idr_destroy(&fpriv->contexts);
>> +	idr_destroy(&fpriv->legacy_contexts);
>>   	mutex_destroy(&fpriv->lock);
>>   	kfree(fpriv);
>>   }
>> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
>> index 0f38f159aa8e..1af57c2016eb 100644
>> --- a/drivers/gpu/drm/tegra/drm.h
>> +++ b/drivers/gpu/drm/tegra/drm.h
>> @@ -59,6 +59,11 @@ struct tegra_drm {
>>   	struct tegra_display_hub *hub;
>>   };
>>   
>> +static inline struct host1x *tegra_drm_to_host1x(struct tegra_drm *tegra)
>> +{
>> +	return dev_get_drvdata(tegra->drm->dev->parent);
>> +}
>> +
>>   struct tegra_drm_client;
>>   
>>   struct tegra_drm_context {
>> diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
>> new file mode 100644
>> index 000000000000..5c422607e8fa
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tegra/uapi.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/* Copyright (c) 2020 NVIDIA Corporation */
>> +
>> +#ifndef _TEGRA_DRM_UAPI_H
>> +#define _TEGRA_DRM_UAPI_H
>> +
>> +#include <linux/dma-mapping.h>
>> +#include <linux/idr.h>
>> +#include <linux/kref.h>
>> +#include <linux/xarray.h>
>> +
>> +#include <drm/drm.h>
>> +
>> +struct drm_file;
>> +struct drm_device;
>> +
>> +struct tegra_drm_file {
>> +	/* Legacy UAPI state */
>> +	struct idr legacy_contexts;
>> +	struct mutex lock;
>> +
>> +	/* New UAPI state */
>> +	struct xarray contexts;
>> +};
>> +
>> +struct tegra_drm_channel_ctx {
>> +	struct tegra_drm_client *client;
>> +	struct host1x_channel *channel;
>> +	struct xarray mappings;
>> +};
> 
> This is mostly the same as tegra_drm_context, so can't we just merge the
> two? There's going to be slight overlap, but overall things are going to
> be less confusing to follow.
> 
> Even more so because I think we should consider phasing out the old UAPI
> eventually and then we can just remove the unneeded fields from this.

Okay.

> 
>> +
>> +struct tegra_drm_mapping {
>> +	struct kref ref;
>> +
>> +	struct device *dev;
>> +	struct host1x_bo *bo;
>> +	struct sg_table *sgt;
>> +	enum dma_data_direction direction;
>> +	dma_addr_t iova;
>> +	dma_addr_t iova_end;
> 
> iova_end seems to never be used. Do we need it?

It is used in the firewall.

> 
>> +};
>> +
>> +int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
>> +				 struct drm_file *file);
>> +int tegra_drm_ioctl_channel_close(struct drm_device *drm, void *data,
>> +				  struct drm_file *file);
>> +int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
>> +				struct drm_file *file);
>> +int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
>> +				struct drm_file *file);
>> +int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
>> +				   struct drm_file *file);
>> +int tegra_drm_ioctl_gem_create(struct drm_device *drm, void *data,
>> +				struct drm_file *file);
>> +int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
>> +				struct drm_file *file);
>> +
>> +void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
>> +void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
>> +struct tegra_drm_channel_ctx *
>> +tegra_drm_channel_ctx_lock(struct tegra_drm_file *file, u32 id);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/tegra/uapi/uapi.c b/drivers/gpu/drm/tegra/uapi/uapi.c
>> new file mode 100644
>> index 000000000000..d503b5e817c4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tegra/uapi/uapi.c
>> @@ -0,0 +1,307 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2020 NVIDIA Corporation */
>> +
>> +#include <linux/host1x.h>
>> +#include <linux/iommu.h>
>> +#include <linux/list.h>
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>> +
>> +#include "../uapi.h"
>> +#include "../drm.h"
>> +
>> +struct tegra_drm_channel_ctx *
>> +tegra_drm_channel_ctx_lock(struct tegra_drm_file *file, u32 id)
>> +{
>> +	struct tegra_drm_channel_ctx *ctx;
>> +
>> +	mutex_lock(&file->lock);
>> +	ctx = xa_load(&file->contexts, id);
>> +	if (!ctx)
>> +		mutex_unlock(&file->lock);
>> +
>> +	return ctx;
>> +}
> 
> This interface seems slightly odd. Looking at how this is used I see how
> doing it this way saves a couple of lines. However, it also make this
> difficult to understand, so I wonder if it wouldn't be better to just
> open-code this in the three callsites to make the code flow a bit more
> idiomatic.

Ok, will do. (Another option may be to add a 
tegra_drm_channel_ctx_unlock that just unlocks file->lock -- that'd 
abstract it out even better, which I quite like -- but I'll go with your 
preference)

> 
>> +
>> +static void tegra_drm_mapping_release(struct kref *ref)
>> +{
>> +	struct tegra_drm_mapping *mapping =
>> +		container_of(ref, struct tegra_drm_mapping, ref);
>> +
>> +	if (mapping->sgt)
>> +		dma_unmap_sgtable(mapping->dev, mapping->sgt,
>> +				  mapping->direction, DMA_ATTR_SKIP_CPU_SYNC);
>> +
>> +	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
>> +	host1x_bo_put(mapping->bo);
>> +
>> +	kfree(mapping);
>> +}
>> +
>> +void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping)
>> +{
>> +	kref_put(&mapping->ref, tegra_drm_mapping_release);
>> +}
>> +
>> +static void tegra_drm_channel_ctx_close(struct tegra_drm_channel_ctx *ctx)
> 
> Yeah, the more often I read it, the more I'm in favour of just
> collapsing tegra_drm_channel_ctx into tegra_drm_channel if for nothing
> else but to get rid of that annoying _ctx suffix that's there for no
> other reason than to differentiate it from "legacy" contexts.
> 
>> +{
>> +	unsigned long mapping_id;
> 
> It's clear from the context that this is a mapping ID, so I think you
> can just leave out the "mapping_" prefix to save a bit on screen space.

Sure.

> 
>> +	struct tegra_drm_mapping *mapping;
>> +
>> +	xa_for_each(&ctx->mappings, mapping_id, mapping)
>> +		tegra_drm_mapping_put(mapping);
>> +
>> +	xa_destroy(&ctx->mappings);
>> +
>> +	host1x_channel_put(ctx->channel);
>> +
>> +	kfree(ctx);
>> +}
>> +
>> +int close_channel_ctx(int id, void *p, void *data)
>> +{
>> +	struct tegra_drm_channel_ctx *ctx = p;
>> +
>> +	tegra_drm_channel_ctx_close(ctx);
>> +
>> +	return 0;
>> +}
> 
> The signature looked strange, so I went looking for where this is called
> from and turns out I can't find any place where this is used. Do we need
> it?

Ah, maybe I have left it from some previous version. Will fix.

> 
>> +
>> +void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
>> +{
>> +	unsigned long ctx_id;
> 
> Just like for mappings above, I think it's fine to leave out the ctx_
> prefix here.

Yep.

> 
>> +	struct tegra_drm_channel_ctx *ctx;
>> +
>> +	xa_for_each(&file->contexts, ctx_id, ctx)
>> +		tegra_drm_channel_ctx_close(ctx);
>> +
>> +	xa_destroy(&file->contexts);
>> +}
>> +
>> +int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
>> +				 struct drm_file *file)
>> +{
>> +	struct tegra_drm_file *fpriv = file->driver_priv;
>> +	struct tegra_drm *tegra = drm->dev_private;
>> +	struct drm_tegra_channel_open *args = data;
>> +	struct tegra_drm_client *client = NULL;
>> +	struct tegra_drm_channel_ctx *ctx;
>> +	int err;
>> +
>> +	if (args->flags)
>> +		return -EINVAL;
>> +
>> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>> +	if (!ctx)
>> +		return -ENOMEM;
>> +
>> +	err = -ENODEV;
>> +	list_for_each_entry(client, &tegra->clients, list) {
>> +		if (client->base.class == args->host1x_class) {
>> +			err = 0;
>> +			break;
>> +		}
>> +	}
>> +	if (err)
>> +		goto free_ctx;
> 
> This type of construct looks weird. I found that a good way around this
> is to split this off into a separate function that does the lookup and
> just returns NULL when it doesn't find one, which is very elegant:
> 
> 	struct tegra_drm_client *tegra_drm_find_client(struct tegra_drm *tegra, u32 class)
> 	{
> 		struct tegra_drm_client *client;
> 
> 		list_for_each_entry(client, &tegra->clients, list)
> 			if (client->base.class == class)
> 				return client;
> 
> 		return NULL;
> 	}
> 
> and then all of a sudden, the very cumbersome construct above becomes
> this pretty piece of code:
> 
> 	client = tegra_drm_find_client(tegra, args->host1x_class);
> 	if (!client) {
> 		err = -ENODEV;
> 		goto free_ctx;
> 	}
> 
> No need for initializing client to NULL or preventatively setting err =
> -ENODEV or anything.

Yep.

> 
>> +
>> +	if (client->shared_channel) {
>> +		ctx->channel = host1x_channel_get(client->shared_channel);
>> +	} else {
>> +		ctx->channel = host1x_channel_request(&client->base);
>> +		if (!ctx->channel) {
>> +			err = -EBUSY;
> 
> I -EBUSY really appropriate here? Can host1x_channel_request() fail for
> other reasons?

It could also fail due to being out of memory (failing to allocate space 
for CDMA) - I guess we should plumb the error code here. But -EBUSY is 
really the most likely thing to happen anyway. Perhaps that can be done 
separately.

> 
>> +			goto free_ctx;
>> +		}
>> +	}
>> +
>> +	err = xa_alloc(&fpriv->contexts, &args->channel_ctx, ctx,
>> +		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
>> +	if (err < 0)
>> +		goto put_channel;
>> +
>> +	ctx->client = client;
>> +	xa_init_flags(&ctx->mappings, XA_FLAGS_ALLOC1);
>> +
>> +	args->hardware_version = client->version;
>> +
>> +	return 0;
>> +
>> +put_channel:
>> +	host1x_channel_put(ctx->channel);
>> +free_ctx:
>> +	kfree(ctx);
>> +
>> +	return err;
>> +}
>> +
>> +int tegra_drm_ioctl_channel_close(struct drm_device *drm, void *data,
>> +				  struct drm_file *file)
>> +{
>> +	struct tegra_drm_file *fpriv = file->driver_priv;
>> +	struct drm_tegra_channel_close *args = data;
>> +	struct tegra_drm_channel_ctx *ctx;
>> +
>> +	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
>> +	if (!ctx)
>> +		return -EINVAL;
>> +
>> +	xa_erase(&fpriv->contexts, args->channel_ctx);
>> +
>> +	mutex_unlock(&fpriv->lock);
>> +
>> +	tegra_drm_channel_ctx_close(ctx);
>> +
>> +	return 0;
>> +}
>> +
>> +int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
>> +				struct drm_file *file)
>> +{
>> +	struct tegra_drm_file *fpriv = file->driver_priv;
>> +	struct drm_tegra_channel_map *args = data;
>> +	struct tegra_drm_channel_ctx *ctx;
>> +	struct tegra_drm_mapping *mapping;
>> +	struct drm_gem_object *gem;
>> +	u32 mapping_id;
>> +	int err = 0;
>> +
>> +	if (args->flags & ~DRM_TEGRA_CHANNEL_MAP_READWRITE)
>> +		return -EINVAL;
>> +
>> +	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
>> +	if (!ctx)
>> +		return -EINVAL;
>> +
>> +	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
>> +	if (!mapping) {
>> +		err = -ENOMEM;
>> +		goto unlock;
>> +	}
>> +
>> +	kref_init(&mapping->ref);
>> +
>> +	gem = drm_gem_object_lookup(file, args->handle);
>> +	if (!gem) {
>> +		err = -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	mapping->dev = ctx->client->base.dev;
>> +	mapping->bo = &container_of(gem, struct tegra_bo, gem)->base;
> 
> We already have host1x_bo_lookup() in drm.c that you can use to avoid
> this strange cast.

Okay, will fix.

> 
>> +
>> +	if (!iommu_get_domain_for_dev(mapping->dev) ||
>> +	    ctx->client->base.group) {
> 
> This expression is now used in at least two places, so I wonder if we
> should have a helper for it along with some documentation about why this
> is the right thing to do. I have a local patch that adds a comment to
> the other instance of this because I had forgotten why this was correct,
> so I can pick that up and refactor later on.

Actually, just last week I found out that the condition here is wrong 
(at least for this particular instance) -- with the current condition, 
if IOMMU is disabled we end up in the first branch, but if the BO in 
question was imported through DMA-BUF the iova will be NULL - 
host1x_bo_pin returns an SGT instead, so we need to go to the else path, 
which works fine. (If ctx->client->base.group is set, this is not a 
problem since import will IOMMU map the BO and set iova). I have a local 
fix for this which I'll add to v6.

> 
>> +		host1x_bo_pin(mapping->dev, mapping->bo,
>> +			      &mapping->iova);
>> +	} else {
>> +		mapping->direction = DMA_TO_DEVICE;
>> +		if (args->flags & DRM_TEGRA_CHANNEL_MAP_READWRITE)
>> +			mapping->direction = DMA_BIDIRECTIONAL;
>> +
>> +		mapping->sgt =
>> +			host1x_bo_pin(mapping->dev, mapping->bo, NULL);
>> +		if (IS_ERR(mapping->sgt)) {
>> +			err = PTR_ERR(mapping->sgt);
>> +			goto put_gem;
>> +		}
>> +
>> +		err = dma_map_sgtable(mapping->dev, mapping->sgt,
>> +				      mapping->direction,
>> +				      DMA_ATTR_SKIP_CPU_SYNC);
>> +		if (err)
>> +			goto unpin;
>> +
>> +		/* TODO only map the requested part */
>> +		mapping->iova = sg_dma_address(mapping->sgt->sgl);
> 
> That comment seems misplaced here since the mapping already happens
> above. Also, wouldn't the same TODO apply to the host1x_bo_pin() path in
> the if block? Maybe the TODO should be at the top of the function?
> 
> Alternatively, if this isn't implemented in this patch anyway, maybe
> just drop the comment altogether. In order to implement this, wouldn't
> the UAPI have to change as well? In that case it might be better to add
> the TODO somewhere in the UAPI header, or in a separate TODO file in the
> driver's directory.

Yeah, I'll drop the comment. The UAPI originally had support for this 
but I dropped it upon Dmitry's objection.

> 
>> +	}
>> +
>> +	mapping->iova_end = mapping->iova + gem->size;
>> +
>> +	mutex_unlock(&fpriv->lock);
>> +
>> +	err = xa_alloc(&ctx->mappings, &mapping_id, mapping,
>> +		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
>> +	if (err < 0)
>> +		goto unmap;
>> +
>> +	args->mapping_id = mapping_id;
>> +
>> +	return 0;
>> +
>> +unmap:
>> +	if (mapping->sgt) {
>> +		dma_unmap_sgtable(mapping->dev, mapping->sgt,
>> +				  mapping->direction, DMA_ATTR_SKIP_CPU_SYNC);
>> +	}
>> +unpin:
>> +	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
>> +put_gem:
>> +	drm_gem_object_put(gem);
>> +	kfree(mapping);
>> +unlock:
>> +	mutex_unlock(&fpriv->lock);
>> +	return err;
>> +}
>> +
>> +int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
>> +				  struct drm_file *file)
>> +{
>> +	struct tegra_drm_file *fpriv = file->driver_priv;
>> +	struct drm_tegra_channel_unmap *args = data;
>> +	struct tegra_drm_channel_ctx *ctx;
>> +	struct tegra_drm_mapping *mapping;
>> +
>> +	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
>> +	if (!ctx)
>> +		return -EINVAL;
>> +
>> +	mapping = xa_erase(&ctx->mappings, args->mapping_id);
>> +
>> +	mutex_unlock(&fpriv->lock);
>> +
>> +	if (mapping) {
>> +		tegra_drm_mapping_put(mapping);
>> +		return 0;
>> +	} else {
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +int tegra_drm_ioctl_gem_create(struct drm_device *drm, void *data,
>> +			       struct drm_file *file)
>> +{
>> +	struct drm_tegra_gem_create *args = data;
>> +	struct tegra_bo *bo;
>> +
>> +	if (args->flags)
>> +		return -EINVAL;
> 
> I'm not sure it's worth doing this, especially because this is now a new
> IOCTL that's actually a subset of the original. I think we should just
> keep the original and if we want to deprecate the flags, or replace them
> with new ones, let's just try and phase out the deprecated ones.

Ok, I'll look into it.

> 
> Thierry

Thanks,
Mikko

> 
>> +
>> +	bo = tegra_bo_create_with_handle(file, drm, args->size, args->flags,
>> +					 &args->handle);
>> +	if (IS_ERR(bo))
>> +		return PTR_ERR(bo);
>> +
>> +	return 0;
>> +}
>> +
>> +int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
>> +			     struct drm_file *file)
>> +{
>> +	struct drm_tegra_gem_mmap *args = data;
>> +	struct drm_gem_object *gem;
>> +	struct tegra_bo *bo;
>> +
>> +	gem = drm_gem_object_lookup(file, args->handle);
>> +	if (!gem)
>> +		return -EINVAL;
>> +
>> +	bo = to_tegra_bo(gem);
>> +
>> +	args->offset = drm_vma_node_offset_addr(&bo->gem.vma_node);
>> +
>> +	drm_gem_object_put(gem);
>> +
>> +	return 0;
>> +}
>> -- 
>> 2.30.0
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
