Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0665B20670
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA7110E436;
	Mon, 11 Aug 2025 10:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="MOC9jVQY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4053610E436
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:56:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754909767; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g0Pss77BdVF5GyA3MPtntNOEY3Jwe6jfGJzrJH4rnT59wW/RSVp85D1kxXv/jf/mjvsGYI4fU8gGQa/eeBQ+iRlYqIWP2cyJQGicWqi4c1UCApVNozbN6B08x8ep/nGz65B5cEvkck5KREW+oDGt+gZFX6nXlXFTJW/Qt0MbbrE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1754909767;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=G+Em1yigSYKGpSutasCgI5Mjtpjuuyzd78rKbkGKgP8=; 
 b=d9I/kVuYQhF/LLHJcokBl/D3ad5lOEQOJzzwj4/hN7TEHJDd7QTzhsOLeXsV4JGCwOz8TYAftHvfO36P2llSPFXWBYgeSvbHFVf2gWM9puKdropAq9bc44DPyksw7N/Rl2IEpei1N/p43Q/A/FZzeaF+IXjVWkJgPJqJoYHxoEI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754909767; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=G+Em1yigSYKGpSutasCgI5Mjtpjuuyzd78rKbkGKgP8=;
 b=MOC9jVQYZ17uT1u72NJCbgBBpXkqR50VJp8aIPh5rToM2WBz8+QNVUulwCKQrlqi
 xAMSMkrhDLJlD9vAVVHfXMYD6fiANm65dYSp5BgefDFmBn0wly5nbB/wytJokEKV71F
 zXxQseQziyUmFLNkymhVuiDjnxbjJdoxfemNw/gY=
Received: by mx.zohomail.com with SMTPS id 1754909766270534.3509971757793;
 Mon, 11 Aug 2025 03:56:06 -0700 (PDT)
Message-ID: <d36e24ce-c2cb-4d44-aacd-aa1e44665c75@collabora.com>
Date: Mon, 11 Aug 2025 13:56:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: use new debugfs device-centered functions
To: Brahmajit Das <listout@listout.xyz>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 simona@ffwll.ch
Cc: linux-next@vger.kernel.org, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20250809125443.4011734-1-listout@listout.xyz>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250809125443.4011734-1-listout@listout.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 8/9/25 15:54, Brahmajit Das wrote:
> Replace the use of drm_debugfs_create_files() with the new
> drm_debugfs_add_files() function, which centers the debugfs files
> management on the drm_device instead of drm_minor.
> 
> Signed-off-by: Brahmajit Das <listout@listout.xyz>
> ---
>  drivers/gpu/drm/virtio/virtgpu_debugfs.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> index 853dd9aa397e..b7c895fe5ddc 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> @@ -94,7 +94,7 @@ virtio_gpu_debugfs_host_visible_mm(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> -static struct drm_info_list virtio_gpu_debugfs_list[] = {
> +static struct drm_debugfs_info virtio_gpu_debugfs_list[] = {
>  	{ "virtio-gpu-features", virtio_gpu_features },
>  	{ "virtio-gpu-irq-fence", virtio_gpu_debugfs_irq_info, 0, NULL },
>  	{ "virtio-gpu-host-visible-mm", virtio_gpu_debugfs_host_visible_mm },
> @@ -105,7 +105,6 @@ static struct drm_info_list virtio_gpu_debugfs_list[] = {
>  void
>  virtio_gpu_debugfs_init(struct drm_minor *minor)
>  {
> -	drm_debugfs_create_files(virtio_gpu_debugfs_list,
> -				 VIRTIO_GPU_DEBUGFS_ENTRIES,
> -				 minor->debugfs_root, minor);
> +	drm_debugfs_add_files(minor->dev, virtio_gpu_debugfs_list,
> +			      VIRTIO_GPU_DEBUGFS_ENTRIES);
>  }

drm_debugfs_create_files() uses drm_info_node, while
drm_debugfs_add_files() uses drm_debugfs_entry. This patch looks wrong
and, AFAICT, doesn't improve anything. Hence, let's keep this code as-is
if there is no real benefit from the change.

-- 
Best regards,
Dmitry
