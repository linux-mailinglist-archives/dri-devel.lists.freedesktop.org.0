Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A07B57AB121
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 13:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F3010E652;
	Fri, 22 Sep 2023 11:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C9410E652;
 Fri, 22 Sep 2023 11:45:53 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B27F56607298;
 Fri, 22 Sep 2023 12:45:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695383152;
 bh=MoMkptljEz1wEeXfbVsyAz0hGh9sZ9dJCPGyUcLkgRM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gAbPPTK5nC9/gENoEpD7H/GLKGT/0Pcigwu/MkVfY0HfBH2bL8qQxy1nJlZnGBEF9
 uKKMPY9G/lHfxFLQYMWoIEJKAD0ws61WQazeiOjgwWdxgYcxMq1r6hZyi0F92SmVZM
 IRX4XA2QGGebm67C1Cozt8DurmVxShzeVzF3Zhw3BnJbmfNHAIMIUbXRtKL/xtcCrH
 8MVM0+BCGRax5aeXfo/ztZCLyPxarp1e+wIISHSK/h/Cc/TU+4IEt9AShp32sR4FWq
 oKmmtj9rx0LwnJHZPSN8CFbtfI4gykvk3fDs2Da65SCrY7OEtdLU8uXDHUh+qd4I6Q
 kv4XMgooNOXpA==
Date: Fri, 22 Sep 2023 13:45:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v4 7/8] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <20230922134548.7ede67c0@collabora.com>
In-Reply-To: <20230920144343.64830-8-dakr@redhat.com>
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-8-dakr@redhat.com>
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

On Wed, 20 Sep 2023 16:42:40 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> +	/**
> +	 * @DRM_GPUVM_RESV_PROTECTED: GPUVM is protected externally by the
> +	 * GPUVM's &dma_resv lock

I think we need to be more specific, and list the fields/operations
that need to be externally protected when DRM_GPUVM_RESV_PROTECTED is
set.

> +	 */
> +	DRM_GPUVM_RESV_PROTECTED = (1 << 0),
