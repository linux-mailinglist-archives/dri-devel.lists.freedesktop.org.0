Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF246E0E0D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 15:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CBF10EAEA;
	Thu, 13 Apr 2023 13:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DA410EAD8;
 Thu, 13 Apr 2023 13:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681391262; x=1712927262;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=M2aUEW+IML2DV0GcrvR6z18+5jlp57gNIuCt5UccOMs=;
 b=dkoFahGr68cnY4bpAIx8G6gvJrZk0MUaJ92P3z+irLBoquvodfKyi+gL
 mIkjWYrNoLhzi7UkFmvIZ8W/qlKlqs4gO4LUiYYVC6/x4H3lw6DPsXbRL
 cuxHpqM2OSiW3WhK+IXWYWiaq5OUkXbRj2lfHzez25GywHGaqhmPoHzN9
 XlOzQ8bX+YA56/Xm6OewwN6t/CANOtj2Gbj0XPh7JDI6Ex/m/uN8xz6BV
 9S9CF6TwMv6+SMGsismloVVY7lUJkLucgxEaloQfEK2XD21Caa60M7RyJ
 cLJOetvLvRHj7QW2i49MIAS7KdoT8KXfOXjsHKqvtBZaLCBwq1MqfI8X/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342922391"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="342922391"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 06:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="639665454"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="639665454"
Received: from mmcgar2x-mobl1.ger.corp.intel.com (HELO [10.213.231.135])
 ([10.213.231.135])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 06:07:37 -0700
Message-ID: <76c836a3-30a8-a46e-5a1a-0e3dc5967459@linux.intel.com>
Date: Thu, 13 Apr 2023 14:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 4/6] drm/i915: Switch to fdinfo helper
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-5-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230412224311.23511-5-robdclark@gmail.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/04/2023 23:42, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>

There is more do to here to remove my client->id fully (would now be 
dead code) so maybe easiest if you drop this patch and I do it after you 
land this and it propagates to our branches? I'd like to avoid pain with 
conflicts if possible..

Regards,

Tvrtko

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/i915/i915_driver.c     |  3 ++-
>   drivers/gpu/drm/i915/i915_drm_client.c | 18 +++++-------------
>   drivers/gpu/drm/i915/i915_drm_client.h |  2 +-
>   3 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index db7a86def7e2..0d91f85f8b97 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1696,7 +1696,7 @@ static const struct file_operations i915_driver_fops = {
>   	.compat_ioctl = i915_ioc32_compat_ioctl,
>   	.llseek = noop_llseek,
>   #ifdef CONFIG_PROC_FS
> -	.show_fdinfo = i915_drm_client_fdinfo,
> +	.show_fdinfo = drm_show_fdinfo,
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
