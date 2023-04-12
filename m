Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3F46DF54E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F169B10E7B6;
	Wed, 12 Apr 2023 12:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3085810E7B5;
 Wed, 12 Apr 2023 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681302770; x=1712838770;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T9rxpGy4eprHBlYgVHrJpKsqOe2l+2fTVDYhUxImQC8=;
 b=HZkjHLB7D0UliiFOvlIDEMu+pJJKEW4vrDykNMBOIw4nyAoTkclvfYfp
 EzcEXvnmgcJ4LFlzi0NcS8HQACtyXnIIzSeDT2vLU6jdg+xfQAOkYa/KE
 uuq4p6B1A+rEt1a0dGVnDR3ujO5MlG951Ebt5yEGPAD5eVlubivYhHwO0
 wosdZ9+K7sz+bs311nOPGlJUBlgwCdsVddBnoM66O9FxA1yUmJMJhX75V
 wu2wWyNPj1JRdpxnVUwDsbeDwXlQLOrKQX7bt897OIvkVV8X4F/ri9xvC
 rdvW0WqRbKXBh6g5olukV3qSB/3QvEcR8J9sOnqslZnNY1eAdNwtRfPpN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="327989386"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="327989386"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 05:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935100585"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="935100585"
Received: from amurkovx-mobl.ger.corp.intel.com (HELO [10.213.229.123])
 ([10.213.229.123])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 05:32:46 -0700
Message-ID: <292d10fe-3163-d282-6497-18c1d8621d72@linux.intel.com>
Date: Wed, 12 Apr 2023 13:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/7] drm/i915: Switch to fdinfo helper
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-5-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230411225725.2032862-5-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/04/2023 23:56, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/i915/i915_driver.c     |  3 ++-
>   drivers/gpu/drm/i915/i915_drm_client.c | 18 +++++-------------
>   drivers/gpu/drm/i915/i915_drm_client.h |  2 +-
>   3 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index db7a86def7e2..37eacaa3064b 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1696,7 +1696,7 @@ static const struct file_operations i915_driver_fops = {
>   	.compat_ioctl = i915_ioc32_compat_ioctl,
>   	.llseek = noop_llseek,
>   #ifdef CONFIG_PROC_FS
> -	.show_fdinfo = i915_drm_client_fdinfo,
> +	.show_fdinfo = drm_fop_show_fdinfo,
>   #endif
>   };
>   
> @@ -1796,6 +1796,7 @@ static const struct drm_driver i915_drm_driver = {
>   	.open = i915_driver_open,
>   	.lastclose = i915_driver_lastclose,
>   	.postclose = i915_driver_postclose,
> +	.show_fdinfo = i915_drm_client_fdinfo,
>   
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index b09d1d386574..4a77e5e47f79 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -101,7 +101,7 @@ static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
>   }
>   
>   static void
> -show_client_class(struct seq_file *m,
> +show_client_class(struct drm_printer *p,
>   		  struct i915_drm_client *client,
>   		  unsigned int class)
>   {
> @@ -117,22 +117,20 @@ show_client_class(struct seq_file *m,
>   	rcu_read_unlock();
>   
>   	if (capacity)
> -		seq_printf(m, "drm-engine-%s:\t%llu ns\n",
> +		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
>   			   uabi_class_names[class], total);
>   
>   	if (capacity > 1)
> -		seq_printf(m, "drm-engine-capacity-%s:\t%u\n",
> +		drm_printf(p, "drm-engine-capacity-%s:\t%u\n",
>   			   uabi_class_names[class],
>   			   capacity);
>   }
>   
> -void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
> +void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>   {
> -	struct drm_file *file = f->private_data;
>   	struct drm_i915_file_private *file_priv = file->driver_priv;
>   	struct drm_i915_private *i915 = file_priv->dev_priv;
>   	struct i915_drm_client *client = file_priv->client;
> -	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>   	unsigned int i;
>   
>   	/*
> @@ -141,12 +139,6 @@ void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
>   	 * ******************************************************************
>   	 */
>   
> -	seq_printf(m, "drm-driver:\t%s\n", i915->drm.driver->name);
> -	seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
> -		   pci_domain_nr(pdev->bus), pdev->bus->number,
> -		   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> -	seq_printf(m, "drm-client-id:\t%u\n", client->id);

As mentioned in my reply to the cover letter, I think the i915 
implementation is the right one. At least the semantics of it.

Granted it is a super set of the minimum required as documented by 
drm-usage-stats.rst - not only 1:1 to current instances of struct file, 
but also avoids immediate id recycling.

Former could perhaps be achieved with a simple pointer hash, but latter 
helps userspace detect when a client has exited and id re-allocated to a 
new client within a single scanning period.

Without this I don't think userspace can implement a fail safe method of 
detecting which clients are new ones and so wouldn't be able to track 
history correctly.

I think we should rather extend the documented contract to include the 
cyclical property than settle for a weaker common implementation.

Regards,

Tvrtko

> -
>   	/*
>   	 * Temporarily skip showing client engine information with GuC submission till
>   	 * fetching engine busyness is implemented in the GuC submission backend
> @@ -155,6 +147,6 @@ void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
>   		return;
>   
>   	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
> -		show_client_class(m, client, i);
> +		show_client_class(p, client, i);
>   }
>   #endif
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
> index 69496af996d9..ef85fef45de5 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.h
> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> @@ -60,7 +60,7 @@ static inline void i915_drm_client_put(struct i915_drm_client *client)
>   struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients);
>   
>   #ifdef CONFIG_PROC_FS
> -void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
> +void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
>   #endif
>   
>   void i915_drm_clients_fini(struct i915_drm_clients *clients);
