Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KaDBeTwb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 22:17:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71F94C18B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 22:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EB810E077;
	Tue, 20 Jan 2026 21:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ny+PkBLb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D6110E030;
 Tue, 20 Jan 2026 21:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768943839; x=1800479839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Fj5IrTCfWpLuDR/zNUCOc3krpg/zdgIA4C3q0qM4dMc=;
 b=Ny+PkBLbgxBpYqmfnVHq4j3Aw+OXOzqj8wwHncc5hoO7blpYgkkJnLiC
 P9KmAVumFH0yMd7Aw15AKhEFKclRQaFkumeTsp29t5DFQLyuuuan3jBOc
 OGnbBxmcpFbEhWbWfpiYNehUWjxHbZXXnJBXuh1YY1KpUpNSuQmHuqT8u
 fTkzsk9TGzOGjyWlW3c7jsgGnzfI/tWGVa2g65Gdg8LQGeHVnRnnubHkM
 yIgVjyZm4cJmahSXxW7tFxxbj0tdrM4WR/fFpijUxp6HdNLg2aCdO6hdE
 UaEAXHj2Gt71N5pirvo7f1zHeisIw4gxKvKdkJrwoSI8KvVXaoq73mjT6 A==;
X-CSE-ConnectionGUID: 43vNQtzmR0+8ONKdivYTEw==
X-CSE-MsgGUID: N39tGP23TN2KyiEgptmMHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="95640192"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="95640192"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:17:18 -0800
X-CSE-ConnectionGUID: tP040WK2QYuIhOCZAg670g==
X-CSE-MsgGUID: aCdpwMz5Rp++XlW7FOCltw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206575787"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:17:13 -0800
Date: Tue, 20 Jan 2026 23:17:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] PCI: Fix restoring BARs on BAR resize rollback
 path
Message-ID: <aW_w1oFQCzUxGYtu@intel.com>
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
 <20251113162628.5946-7-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113162628.5946-7-ilpo.jarvinen@linux.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spamd-Result: default: False [-0.72 / 15.00];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linaro.org,hogyros.de,intel.com,amd.com,lists.freedesktop.org,google.com,gmail.com,linux.intel.com,vger.kernel.org,ffwll.ch,ursulin.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: B71F94C18B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Nov 13, 2025 at 06:26:23PM +0200, Ilpo Järvinen wrote:
> BAR resize operation is implemented in the pci_resize_resource() and
> pbus_reassign_bridge_resources() functions. pci_resize_resource() can
> be called either from __resource_resize_store() from sysfs or directly
> by the driver for the Endpoint Device.
> 
> The pci_resize_resource() requires that caller has released the device
> resources that share the bridge window with the BAR to be resized as
> otherwise the bridge window is pinned in place and cannot be changed.
> 
> pbus_reassign_bridge_resources() implement rollback of the resources if
> the resize operation fails, but rollback is performed only for the
> bridge windows. Because releasing the device resources are done by the
> caller of the BAR resize interface, these functions performing the BAR
> resize do not have access to the device resources as they were before
> the resize.
> 
> pbus_reassign_bridge_resources() could try to
> __pci_bridge_assign_resources() after rolling back the bridge windows
> as they were, however, it will not guarantee the resource are assigned
> due to differences how FW and the kernel may want to assign the
> resources (alignment of the start address and tail).
> 
> In order to perform rollback robustly, the BAR resize interface has to
> be altered to also release the device resources that share the bridge
> window with the BAR to be resized.
> 
> Also, remove restoring from the entries failed list as saved list
> should now contain both the bridge windows and device resources so
> the extra restore is duplicated work.
> 
> Some drivers (currently only amdgpu) want to prevent releasing some
> resources. Add exclude_bars param to pci_resize_resource() and make
> amdgpu to pass its register BAR (BAR 5) which should never be released
> during resize operation. Normally 64-bit prefetchable resources do not
> share bridge window with it as the register BAR (32-bit only) but there
> are various fallbacks in the resource assignment logic which may make
> the resources to share the bridge window in rare cases.
> 
> This change (together with the driver side changes) is to counter the
> resource releases that had to be done to prevent resource tree
> corruption in the ("PCI: Release assigned resource before restoring
> them") change. As such, it likely restores functionality in cases where
> device resources were released to avoid resource tree conflicts which
> appeared to be "working" when such conflicts were not correctly
> detected by the kernel.

This thing completely broke my DG2 + non-reBAR system.  The bisect
points to commit 4efaa80b3d75 ("drm/i915: Remove driver side BAR
release before resize") but the real problems seem to be in this
patch. A had a quick look at the code and spotted a few issues...

<snip>
> @@ -2468,34 +2466,78 @@ int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res)
>  		free_list(&added);
>  
>  	if (!list_empty(&failed)) {
> -		if (pci_required_resource_failed(&failed, type)) {
> +		if (pci_required_resource_failed(&failed, type))
>  			ret = -ENOSPC;
> -			goto cleanup;
> -		}
> -		/* Only resources with unrelated types failed (again) */
>  		free_list(&failed);
> +		if (ret)
> +			return ret;
> +
> +		/* Only resources with unrelated types failed (again) */
>  	}
>  
> -	list_for_each_entry(dev_res, &saved, list) {
> +	list_for_each_entry(dev_res, saved, list) {
>  		struct pci_dev *dev = dev_res->dev;
>  
>  		/* Skip the bridge we just assigned resources for */
>  		if (bridge == dev)
>  			continue;
>  
> +		if (!dev->subordinate)
> +			continue;
> +
>  		pci_setup_bridge(dev->subordinate);
>  	}
>  
> -	free_list(&saved);
> -	up_read(&pci_bus_sem);
>  	return 0;
> +}
>  
> -cleanup:
> -	/* Restore size and flags */
> -	list_for_each_entry(dev_res, &failed, list)
> -		restore_dev_resource(dev_res);
> -	free_list(&failed);
> +int pci_do_resource_release_and_resize(struct pci_dev *pdev, int resno, int size,
> +				       int exclude_bars)
> +{
> +	struct resource *res = pci_resource_n(pdev, resno);
> +	struct pci_dev_resource *dev_res;
> +	struct pci_bus *bus = pdev->bus;
> +	struct resource *b_win, *r;
> +	LIST_HEAD(saved);
> +	unsigned int i;
> +	int ret = 0;
> +
> +	b_win = pbus_select_window(bus, res);
> +	if (!b_win)
> +		return -EINVAL;
> +
> +	pci_dev_for_each_resource(pdev, r, i) {
> +		if (i >= PCI_BRIDGE_RESOURCES)
> +			break;
> +
> +		if (exclude_bars & BIT(i))
> +			continue;
>  
> +		if (b_win != pbus_select_window(bus, r))
> +			continue;
> +
> +		ret = add_to_list(&saved, pdev, r, 0, 0);
> +		if (ret)
> +			goto restore;
> +		pci_release_resource(pdev, i);
> +	}
> +
> +	pci_resize_resource_set_size(pdev, resno, size);
> +
> +	if (!bus->self)
> +		goto out;
> +
> +	down_read(&pci_bus_sem);
> +	ret = pbus_reassign_bridge_resources(bus, res, &saved);
> +	if (ret)
> +		goto restore;
> +
> +out:
> +	up_read(&pci_bus_sem);
> +	free_list(&saved);
> +	return ret;
> +
> +restore:
>  	/* Revert to the old configuration */
>  	list_for_each_entry(dev_res, &saved, list) {
>  		struct resource *res = dev_res->res;
> @@ -2510,13 +2552,21 @@ int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res)
>  
>  		restore_dev_resource(dev_res);
>  
> -		pci_claim_resource(dev, i);
> -		pci_setup_bridge(dev->subordinate);
> -	}
> -	up_read(&pci_bus_sem);
> -	free_list(&saved);
> +		ret = pci_claim_resource(dev, i);
> +		if (ret)
> +			continue;

This clobbers 'ret' was supposedly meant to be returned to the
caller in the end. Thus (at least in my case) the caller always
sees a return value of 0, and then it forgets to restores the
reBAR setting back to the original value.

>  
> -	return ret;
> +		if (i < PCI_BRIDGE_RESOURCES) {
> +			const char *res_name = pci_resource_name(dev, i);
> +
> +			pci_update_resource(dev, i);
> +			pci_info(dev, "%s %pR: old value restored\n",
> +				 res_name, res);
> +		}
> +		if (dev->subordinate)
> +			pci_setup_bridge(dev->subordinate);
> +	}
> +	goto out;
>  }
>  
>  void pci_assign_unassigned_bus_resources(struct pci_bus *bus)
> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> index 3d0b0b3f60c4..e4486d7030c0 100644
> --- a/drivers/pci/setup-res.c
> +++ b/drivers/pci/setup-res.c
> @@ -444,8 +444,7 @@ static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev,
>  	return cmd & PCI_COMMAND_MEMORY;
>  }
>  
> -static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
> -					 int size)
> +void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int size)
>  {
>  	resource_size_t res_size = pci_rebar_size_to_bytes(size);
>  	struct resource *res = pci_resource_n(dev, resno);
> @@ -456,9 +455,9 @@ static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
>  	resource_set_size(res, res_size);
>  }
>  
> -int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> +int pci_resize_resource(struct pci_dev *dev, int resno, int size,
> +			int exclude_bars)
>  {
> -	struct resource *res = pci_resource_n(dev, resno);
>  	struct pci_host_bridge *host;
>  	int old, ret;
>  	u32 sizes;
> @@ -468,10 +467,6 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
>  	if (host->preserve_config)
>  		return -ENOTSUPP;
>  
> -	/* Make sure the resource isn't assigned before resizing it. */
> -	if (!(res->flags & IORESOURCE_UNSET))
> -		return -EBUSY;
> -
>  	if (pci_resize_is_memory_decoding_enabled(dev, resno))
>  		return -EBUSY;
>  
> @@ -490,19 +485,13 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
>  	if (ret)
>  		return ret;
>  
> -	pci_resize_resource_set_size(dev, resno, size);
> -
> -	/* Check if the new config works by trying to assign everything. */
> -	if (dev->bus->self) {
> -		ret = pbus_reassign_bridge_resources(dev->bus, res);
> -		if (ret)
> -			goto error_resize;
> -	}
> +	ret = pci_do_resource_release_and_resize(dev, resno, size, exclude_bars);
> +	if (ret)
> +		goto error_resize;
>  	return 0;
>  
>  error_resize:
>  	pci_rebar_set_size(dev, resno, old);
> -	pci_resize_resource_set_size(dev, resno, old);

This new order is very broken because the new reBAR setting
may have turned some of the originally set bits in the BAR
to read-only. Thus we may not be able to restore the BAR back
to the original value.

In my case the original settings are 256MiB / 0x4030000000,
followed by a failed resize to 8GiB, and finally we see a
failed restore 'BAR 2: error updating (0x3000000c != 0x0000000c)'
due to the read-only bits.

i915 limps along after the failure but nothing really works,
and xe just completely explodes.

>  	return ret;
>  }
>  EXPORT_SYMBOL(pci_resize_resource);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index d1fdf81fbe1e..cc58abbd2b20 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1428,7 +1428,8 @@ static inline int pci_rebar_bytes_to_size(u64 bytes)
>  }
>  
>  u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
> -int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
> +int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size,
> +				     int exlucde_bars);
>  int pci_select_bars(struct pci_dev *dev, unsigned long flags);
>  bool pci_device_is_present(struct pci_dev *pdev);
>  void pci_ignore_hotplug(struct pci_dev *dev);
> -- 
> 2.39.5

-- 
Ville Syrjälä
Intel
