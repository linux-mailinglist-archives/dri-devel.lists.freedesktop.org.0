Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C38326EA88B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 12:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1188010E1D9;
	Fri, 21 Apr 2023 10:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D720C10E130;
 Fri, 21 Apr 2023 10:46:28 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 11EA96602040;
 Fri, 21 Apr 2023 11:46:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682073986;
 bh=xy1oqjU5V/MfMlLIxJBwQthAmE3+07DxTdM+2r5CRK4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jjamna4sOjLQkH1nkuIHUE36adS3B1KZwwMxTmygRn+u3/pxkEYo1F5PkmJVw4239
 wJ2unj8E4sgzv5F/dTBIm4We4BM1YRFVftcf1/unkDQWK2Gd8rlwkOk9isIcl8ZU4K
 u3XVV6sZQ+x6LNMVcVXbvfWEV7n0cWBzE/lFdNDolnKXKo1R0RgZY1KEKNYJjymDZe
 1pjNjYuBEHtQJtRZME2qyikHAFFiWNiovamiotKiNxWQ1hFWpN/6yOaGatSU0+IjMt
 oBZ1VO0ap3BM0VFBCdynQBNuj87otIdpOiix9tBW/8hGrk0GbKGltZP8Kp2AIPgw2M
 F57uTnKdV+DXQ==
Date: Fri, 21 Apr 2023 12:46:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v3 04/15] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230421124622.6386cd60@collabora.com>
In-Reply-To: <20230404012741.116502-5-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
 <20230404012741.116502-5-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net,
 donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  4 Apr 2023 03:27:30 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> +/**
> + * drm_gpuva_prealloc_create - creates a preallocated node to store a
> + * &drm_gpuva entry.
> + *
> + * Returns: the &drm_gpuva_prealloc object on success, NULL on failure
> + */
> +struct drm_gpuva_prealloc *
> +drm_gpuva_prealloc_create(void)
> +{
> +	struct drm_gpuva_prealloc *pa;
> +
> +	pa = kzalloc(sizeof(*pa), GFP_KERNEL);
> +	if (!pa)
> +		return NULL;
> +
> +	if (mas_preallocate(&pa->mas, GFP_KERNEL)) {

mas_preallocate() needs a valid tree field to calculate the number
of nodes to pre-allocate. I guess we're missing a MA_STATE_INIT() here,
and we need to pass a gpuva_mgr object to this helper.

> +		kfree(pa);
> +		return NULL;
> +	}
> +
> +	return pa;
> +}
> +EXPORT_SYMBOL(drm_gpuva_prealloc_create);
