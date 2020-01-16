Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A679E13D603
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 09:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94156EC44;
	Thu, 16 Jan 2020 08:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299FB6EC3A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 08:37:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DA2852938A2;
 Thu, 16 Jan 2020 08:37:40 +0000 (GMT)
Date: Thu, 16 Jan 2020 09:37:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] drm/panfrost: Add the panfrost_gem_mapping concept
Message-ID: <20200116093737.5b310ef3@collabora.com>
In-Reply-To: <20200116021554.15090-1-robh@kernel.org>
References: <20200116021554.15090-1-robh@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jan 2020 20:15:54 -0600
Rob Herring <robh@kernel.org> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> With the introduction of per-FD address space, the same BO can be mapped
> in different address space if the BO is globally visible (GEM_FLINK)
> and opened in different context or if the dmabuf is self-imported. The
> current implementation does not take case into account, and attaches the
> mapping directly to the panfrost_gem_object.
> 
> Let's create a panfrost_gem_mapping struct and allow multiple mappings
> per BO.
> 
> The mappings are refcounted which helps solve another problem where
> mappings were torn down (GEM handle closed by userspace) while GPU
> jobs accessing those BOs were still in-flight. Jobs now keep a
> reference on the mappings they use.
> 
> v2 (robh):
> - Minor review comment clean-ups from Steven
> - Use list_is_singular helper
> - Just WARN if we add a mapping when madvise state is not WILLNEED.
>   With that, drop the use of object_name_lock.
> 
> v3 (robh):
> - Revert returning list iterator in panfrost_gem_mapping_get()

Feels a bit weird to ack my own patch, but this version is

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> Fixes: a5efb4c9a562 ("drm/panfrost: Restructure the GEM object creation")
> Fixes: 7282f7645d06 ("drm/panfrost: Implement per FD address spaces")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
