Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DBB66408E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 13:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF8210E5AB;
	Tue, 10 Jan 2023 12:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8829A10E5AB;
 Tue, 10 Jan 2023 12:33:46 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F6366602D72;
 Tue, 10 Jan 2023 12:33:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673354024;
 bh=tQEEGgUywtfM47SU0jVZ/n63JMX3a1YEt0p7stzqRCM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YdHDsO1u0s7LjlC6HtEQP7Lk7wBQyRsZlL1PddsAt5f3adLvYn/215GuNk7SsGNi5
 I7iNY8259ZCMMrGaHq+rbeXblSFj4ezWlEseaCOomt3mG1V50PLlgBLr15GO7f0V/5
 z+LWYPfqjMEAHgLltBwkgRumlom3mlRMNaIifwLPY7FTWuaH/iSIUkcZzQNjPiOb5/
 /NEOXDLawz2TCliRfz5RrdHYYtWOeqwnoROKra/FECbpSymJVPq9G43ZW2un1FQm8M
 Y1jD58EYMk+dZWqTfjHGjuDjziX6R9buWj76VRiaYuI1y4mrVZF1lo8hp69hP8DEED
 B3rnzxngGZdbA==
Date: Tue, 10 Jan 2023 13:33:41 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 00/20] Initial Xe driver submission
Message-ID: <20230110133341.2167b900@collabora.com>
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Frank, who's also working on the pvr uAPI.

Hi,

On Thu, 22 Dec 2022 14:21:07 -0800
Matthew Brost <matthew.brost@intel.com> wrote:

> The code has been organized such that we have all patches that touch areas
> outside of drm/xe first for review, and then the actual new driver in a separate
> commit. The code which is outside of drm/xe is included in this RFC while
> drm/xe is not due to the size of the commit. The drm/xe is code is available in
> a public repo listed below.
> 
> Xe driver commit:
> https://cgit.freedesktop.org/drm/drm-xe/commit/?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7
> 
> Xe kernel repo:
> https://cgit.freedesktop.org/drm/drm-xe/

Sorry to hijack this thread, again, but I'm currently working on the
pancsf uAPI, and I was wondering how DRM maintainers/developers felt
about the new direction taken by the Xe driver on some aspects of their
uAPI (to decide if I should copy these patterns or go the old way):

- plan for ioctl extensions through '__u64 extensions;' fields (the
  vulkan way, basically)
- turning the GETPARAM in DEV_QUERY which can return more than a 64-bit
  integer at a time
- having ioctls taking sub-operations instead of one ioctl per
  operation (I'm referring to VM_BIND here, which handles map, unmap,
  restart, ... through a single entry point)

Regards,

Boris




