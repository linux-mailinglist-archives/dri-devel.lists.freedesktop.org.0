Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE7DCC3DC3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 16:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D84910E71A;
	Tue, 16 Dec 2025 15:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dbKxuug3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE1E10E70D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 15:16:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 043F36001D;
 Tue, 16 Dec 2025 15:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C493C4CEF1;
 Tue, 16 Dec 2025 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765898179;
 bh=xEiw3/MtFG45NReGwfEyl6N3nBoIQ4msAhJFoouzYLM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dbKxuug3RAKTc3W76vBdxvAR0vjOHxLdW/+pEpARkhS7h30tPiGyPUt7Wp9D81uVn
 ZHZD6AYynCerAN4d+eJEs/B7hqzOkzmosNDKDnasGmznUfnrKhdYUMpcoCn1CAo/I/
 b0WRZAXlxC3idC0Y7yDi63gj90/Ju8IE71rCMm1tS1K1JjkB53Bo8uY4dIo284cPcX
 u3YJMvJ8Qc36YSomrmnvI0oyOKsspgMxO0jjlQ6zVc6wGrL2IwUtjFabFvsMssSH9g
 ewLN/KCFPaEyVBB5x2PO6hgHlikJ1l2LPCsK8rpYEd0Oe04Eg0yMtY+AcQj2af0kUQ
 LB8L7hxCdkmKg==
Message-ID: <7371981b-2220-4441-b349-57038a6320b7@kernel.org>
Date: Tue, 16 Dec 2025 09:16:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Remove amdxdna_flush()
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251216031311.2033399-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251216031311.2033399-1-lizhi.hou@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/15/25 9:13 PM, Lizhi Hou wrote:
> amdxdna_flush() was introduced to ensure that the device does not access
> a process address space after it has been freed. However, this is no
> longer necessary because the driver now increments the mm reference count
> when a command is submitted and decrements it only after the command has
> completed. This guarantees that the process address space remains valid
> for the entire duration of command execution. Remove amdxdna_flush to
> simplify the teardown path.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 29 ++++++++++---------------
>   1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 1973ab67721b..fcf7e7869007 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -105,43 +105,38 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
>   	return ret;
>   }
>   
> -static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
> +static void amdxdna_client_cleanup(struct amdxdna_client *client)
>   {
> -	struct amdxdna_client *client = filp->driver_priv;
> -	struct amdxdna_dev *xdna = to_xdna_dev(ddev);
> -
> -	XDNA_DBG(xdna, "closing pid %d", client->pid);
> -
> +	list_del(&client->node);
> +	amdxdna_hwctx_remove_all(client);
>   	xa_destroy(&client->hwctx_xa);
>   	cleanup_srcu_struct(&client->hwctx_srcu);
>   	mutex_destroy(&client->mm_lock);
> +
>   	if (client->dev_heap)
>   		drm_gem_object_put(to_gobj(client->dev_heap));
>   
>   	iommu_sva_unbind_device(client->sva);
>   
> -	XDNA_DBG(xdna, "pid %d closed", client->pid);
>   	kfree(client);
>   }
>   
> -static int amdxdna_flush(struct file *f, fl_owner_t id)
> +static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
>   {
> -	struct drm_file *filp = f->private_data;
>   	struct amdxdna_client *client = filp->driver_priv;
> -	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_dev *xdna = to_xdna_dev(ddev);
>   	int idx;
>   
> -	XDNA_DBG(xdna, "PID %d flushing...", client->pid);
> +	XDNA_DBG(xdna, "closing pid %d", client->pid);
> +
>   	if (!drm_dev_enter(&xdna->ddev, &idx))
> -		return 0;
> +		return;
>   
>   	mutex_lock(&xdna->dev_lock);
> -	list_del_init(&client->node);
> -	amdxdna_hwctx_remove_all(client);
> +	amdxdna_client_cleanup(client);
>   	mutex_unlock(&xdna->dev_lock);
>   
>   	drm_dev_exit(idx);
> -	return 0;
>   }
>   
>   static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
> @@ -217,7 +212,6 @@ static const struct file_operations amdxdna_fops = {
>   	.owner		= THIS_MODULE,
>   	.open		= accel_open,
>   	.release	= drm_release,
> -	.flush		= amdxdna_flush,
>   	.unlocked_ioctl	= drm_ioctl,
>   	.compat_ioctl	= drm_compat_ioctl,
>   	.poll		= drm_poll,
> @@ -333,8 +327,7 @@ static void amdxdna_remove(struct pci_dev *pdev)
>   	client = list_first_entry_or_null(&xdna->client_list,
>   					  struct amdxdna_client, node);
>   	while (client) {
> -		list_del_init(&client->node);
> -		amdxdna_hwctx_remove_all(client);
> +		amdxdna_client_cleanup(client);
>   
>   		client = list_first_entry_or_null(&xdna->client_list,
>   						  struct amdxdna_client, node);

