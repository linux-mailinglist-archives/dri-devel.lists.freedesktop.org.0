Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89D6F165D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 13:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639CC10ECCC;
	Fri, 28 Apr 2023 11:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADAC10ECD6;
 Fri, 28 Apr 2023 11:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682679942; x=1714215942;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4JhFUNxs2IOSAeCxq2g3p+MSBgp8v39081pRbpfGz6A=;
 b=SYtV1BFjL8OqZ8Q4QlAWD5UfnH+aP3EtEnER9703ncGw21zOcxpte+Xd
 gsKeUZernuOHKikLecqC9yGuKx/IYk/5/Hbd7ofR3Ix+aeTYz2JlVS2gA
 eAUlIg6R62OcamBo4G0+3aKDMHTYmo0wQyYaC++WCx0fXqiWHsaUPnh9P
 i/mFC5XJsse6YXHrioSLJY6OxJIyS9nsys9RUW5bdhRnCfKKLMtCnMhSp
 yYJ4B++xIRHu4iJzDg8vPbZmgktdkO+O6tdCokFXDIkLgXPalO8oQU75R
 B5DEsgK/kTYywa8BKDdWx4STdk1PfNPomowmbMZuBn0L+FRe2GVC8HYkK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="434007269"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="434007269"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 04:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="838812488"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="838812488"
Received: from ksathish-mobl.ger.corp.intel.com (HELO [10.213.194.196])
 ([10.213.194.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 04:05:37 -0700
Message-ID: <135ff649-e50c-50f4-55ba-a1b615865e02@linux.intel.com>
Date: Fri, 28 Apr 2023 12:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 8/9] drm/fdinfo: Add comm/cmdline override fields
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230427175340.1280952-1-robdclark@gmail.com>
 <20230427175340.1280952-9-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230427175340.1280952-9-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/04/2023 18:53, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> These are useful in particular for VM scenarios where the process which
> has opened to drm device file is just a proxy for the real user in a VM
> guest.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 18 ++++++++++++++++++
>   drivers/gpu/drm/drm_file.c            | 15 +++++++++++++++
>   include/drm/drm_file.h                | 19 +++++++++++++++++++
>   3 files changed, 52 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 58dc0d3f8c58..e4877cf8089c 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -73,6 +73,24 @@ scope of each device, in which case `drm-pdev` shall be present as well.
>   Userspace should make sure to not double account any usage statistics by using
>   the above described criteria in order to associate data to individual clients.
>   
> +- drm-comm-override: <valstr>
> +
> +Returns the client executable override string.  Some drivers support letting
> +userspace override this in cases where the userspace is simply a "proxy".
> +Such as is the case with virglrenderer drm native context, where the host
> +process is just forwarding command submission, etc, from guest userspace.
> +This allows the proxy to make visible the executable name of the actual
> +app in the VM guest.
> +
> +- drm-cmdline-override: <valstr>
> +
> +Returns the client cmdline override string.  Some drivers support letting
> +userspace override this in cases where the userspace is simply a "proxy".
> +Such as is the case with virglrenderer drm native context, where the host
> +process is just forwarding command submission, etc, from guest userspace.
> +This allows the proxy to make visible the cmdline of the actual app in the
> +VM guest.

Perhaps it would be okay to save space here by not repeating the 
description, like:

drm-comm-override: <valstr>
drm-cmdline-override: <valstr>

Long description blah blah...
This allows the proxy to make visible the _executable name *and* command 
line_ blah blah..

> +
>   Utilization
>   ^^^^^^^^^^^
>   
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 9321eb0bf020..d7514c313af1 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -178,6 +178,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   	spin_lock_init(&file->master_lookup_lock);
>   	mutex_init(&file->event_read_lock);
>   
> +	mutex_init(&file->override_lock);
> +
>   	if (drm_core_check_feature(dev, DRIVER_GEM))
>   		drm_gem_open(dev, file);
>   
> @@ -292,6 +294,8 @@ void drm_file_free(struct drm_file *file)
>   	WARN_ON(!list_empty(&file->event_list));
>   
>   	put_pid(file->pid);
> +	kfree(file->override_comm);
> +	kfree(file->override_cmdline);
>   	kfree(file);
>   }
>   
> @@ -995,6 +999,17 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>   			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>   	}
>   
> +	mutex_lock(&file->override_lock);

You could add a fast unlocked check before taking the mutex for no risk 
apart a transient false negative. For 99.9999% of userspace it would 
mean no pointless lock/unlock cycle.

> +	if (file->override_comm) {
> +		drm_printf(&p, "drm-comm-override:\t%s\n",
> +			   file->override_comm);
> +	}
> +	if (file->override_cmdline) {
> +		drm_printf(&p, "drm-cmdline-override:\t%s\n",
> +			   file->override_cmdline);
> +	}
> +	mutex_unlock(&file->override_lock);
> +
>   	if (dev->driver->show_fdinfo)
>   		dev->driver->show_fdinfo(&p, file);
>   }
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 1339e925af52..604d05fa6f0c 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -370,6 +370,25 @@ struct drm_file {
>   	 */
>   	struct drm_prime_file_private prime;
>   
> +	/**
> +	 * @comm: Overridden task comm
> +	 *
> +	 * Accessed under override_lock
> +	 */
> +	char *override_comm;
> +
> +	/**
> +	 * @cmdline: Overridden task cmdline
> +	 *
> +	 * Accessed under override_lock
> +	 */
> +	char *override_cmdline;
> +
> +	/**
> +	 * @override_lock: Serialize access to override_comm and override_cmdline
> +	 */
> +	struct mutex override_lock;
> +

I don't think this should go to drm just yet though. Only one driver can 
make use of it so I'd leave it for later and print from msm_show_fdinfo 
for now.

Regards,

Tvrtko

>   	/* private: */
>   #if IS_ENABLED(CONFIG_DRM_LEGACY)
>   	unsigned long lock_count; /* DRI1 legacy lock count */
