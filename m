Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E66F338F9A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 15:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA98B6EE8A;
	Fri, 12 Mar 2021 14:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB8D6EE8A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 14:15:11 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E5E4F1F46DA6;
 Fri, 12 Mar 2021 14:15:09 +0000 (GMT)
Date: Fri, 12 Mar 2021 15:15:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [RFC PATCH 0/7] drm/panfrost: Add a new submit ioctl
Message-ID: <20210312151504.6234b437@collabora.com>
In-Reply-To: <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
 <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Mar 2021 12:16:33 +0000
Steven Price <steven.price@arm.com> wrote:

> Also the current code completely ignores PANFROST_BO_REF_READ. So either 
> that should be defined as 0, or even better we support 3 modes:
> 
>   * Exclusive ('write' access)
>   * Shared ('read' access)
>   * No fence - ensures the BO is mapped, but doesn't add any implicit 
> fences.

I looked at other drivers and they seem to have this
NO_FENCE/NO_IMPLICIT flag at the job/submit level and conditioned on
the presence of a in_sync_fd file. I can see per-BO NO_FENCE being
useful for sub-buffer accesses, assuming we don't want to deal with
other deps explicitly, but we could also force the NO_IMPLICIT behavior
for the whole job and let the user deal with all deps explicitly. TBH,
it's a bit unclear to me how that feature would be used by the vulkan
driver, so I'd rather leave that NO_FENCE use case for later.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
