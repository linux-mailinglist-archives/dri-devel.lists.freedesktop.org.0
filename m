Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A379A7C0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 14:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2897810E2D7;
	Mon, 11 Sep 2023 12:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EB610E2D7;
 Mon, 11 Sep 2023 12:00:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E1A966072FC;
 Mon, 11 Sep 2023 13:00:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694433638;
 bh=uUUWwdEXUnbUt4WJ5vJ0ZVeiLzvKE3X94A9kyzMwdDQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kdSWcuhPucKf1SWwF9Xd2KzH6nORnBcR+JeKOFlnueJL0/XPGegRPuH0+zKelQYBC
 zjlAIftDpHO1rgMkPN4NV4vjr/QldwIUc7L+FLHh80krFHaJJtePwoPkFoUVK3/dq1
 EFzVIUyekJWVJI8zW0DInYnPBX70y/WTnoFBiMYiZkTPfCqkPZ9OANMSzKfsSXect5
 hjJ61dtkBz/PqlaMsnLWsygSA6NepTxVi7MK0H1ACUFZrG54UcwjwJX5JTfUn8BAML
 kfCiYeX4Ezf6GXSEZ4fzi82lHATEOACKmqBrqFN48PlLq0dkSPmMxZhfh0TN/BYh7A
 zZRSx5lE7lA1A==
Date: Mon, 11 Sep 2023 14:00:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v3 4/7] drm/gpuvm: common dma-resv per
 struct drm_gpuvm
Message-ID: <20230911140035.06159577@collabora.com>
In-Reply-To: <20230909153125.30032-5-dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-5-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat,  9 Sep 2023 17:31:11 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> @@ -240,9 +240,22 @@ struct drm_gpuvm {
>  	 * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
>  	 */
>  	const struct drm_gpuvm_ops *ops;
> +
> +	/**
> +	 * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
> +	 * dma-resv to &drm_exec.
> +	 */
> +	struct drm_gem_object d_obj;
> +
> +	/**
> +	 * @resv: the &dma_resv for &drm_gem_objects mapped in this GPU VA
> +	 * space
> +	 */
> +	struct dma_resv *resv;

Hm, I'd be tempted to drop this field and add a drm_gpuvm_resv() helper
returning vm->d_obj.resv;

>  };
