Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3D7797093
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 09:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43D310E782;
	Thu,  7 Sep 2023 07:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBD210E782;
 Thu,  7 Sep 2023 07:56:54 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6941F66072AE;
 Thu,  7 Sep 2023 08:56:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694073412;
 bh=q75sDFLtsd4dXey/PJJXXBizzHw/kHvzSiXOWVo/1k4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=diMx+z98IjGho6YklpvLmaYBJe2mGsynD+qPIgA94H2LsIOHzozkUe/uUoyAr+5xF
 3V1WmyslaLaNtmca/NGR0SrMur8rHq/XbFWKVgp1edqUJWQqXDqjfTMkufwFcNuzVo
 dYGuVrdOPm1p2FE48dKqhyDhwz9kfnx8Xx8CLKWCdO5NGMrKk67yRo4EmaeJswV1lc
 DLhL8cKfSgn/3nNePV/yCrDgW5l8Ml0EBjITjPYVdGQqa6FdtnsQrD9TBiJsNp+WtN
 nR4a62W/6NSGe4MVEZAiVeuZavymHdxIpWpgFS1P+bMhpTXRiCmuq6CAYR2G95YClq
 yuQGNVkeWMyew==
Date: Thu, 7 Sep 2023 09:56:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v2 2/7] drm/gpuvm: rename struct
 drm_gpuva_manager to struct drm_gpuvm
Message-ID: <20230907095649.13dbd49c@collabora.com>
In-Reply-To: <20230906214723.4393-3-dakr@redhat.com>
References: <20230906214723.4393-1-dakr@redhat.com>
 <20230906214723.4393-3-dakr@redhat.com>
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

On Wed,  6 Sep 2023 23:47:10 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> Rename struct drm_gpuva_manager to struct drm_gpuvm including
> corresponding functions. This way the GPUVA manager's structures align
> very well with the documentation of VM_BIND [1] and VM_BIND locking [2].
> 
> It also provides a better foundation for the naming of data structures
> and functions introduced for implementing a common dma-resv per GPU-VM
> including tracking of external and evicted objects in subsequent
> patches.

I'm fine with this rename, but I feel like some bits are missing in
this patch. I see a few functions taking a drm_gpuvm object and still
being prefixed with drm_gpuva_ (I'm not talking about functions that
only manipulate a drm_gpuva object, but those updating the the VM state,
like the sm_map/unmap helpers), and I think it'd be preferable to
rename the source files and the Kconfig option too.
