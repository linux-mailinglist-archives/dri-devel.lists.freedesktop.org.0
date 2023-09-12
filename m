Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FC779CA7A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA3310E3C1;
	Tue, 12 Sep 2023 08:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5887810E3C1;
 Tue, 12 Sep 2023 08:45:04 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 640E56607313;
 Tue, 12 Sep 2023 09:45:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694508302;
 bh=lErICr+q3ZQmh/6qxgn+s5S3emeQX9FvqkNGfIW8eIE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IA9dmnnsAKGyEKJgDTJAEm90F4WWeELJltzbdWRhfyB/aV5Z7MpB4L1t+/P54ISDR
 IUGdLnMZJT1BMRWad96UWLwcMSIALIPMJ4Bah/BjzrjWGdYVixEkeQZSZAGDD2AnLL
 PXJOTMzCtpDXLOwkQJkWUpFw5pRj0ypF7+Yta9uOW5rSh+lxI0qVKGffh1Fp8BUeUD
 +/LA9YHz6p+55kg8v9NbCDflvRvQkk18DEWrDoWoOXKq3BdK+Ztcw/7TvELMycc1NS
 LF6vR8Pnup2raaz642AGR0qPZbrq1qpDg1MwXQskkcudHejBfT/gHA8rBDBUx0QwCL
 7NQogmlhGgYDQ==
Date: Tue, 12 Sep 2023 10:44:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 11/13] drm/sched: Waiting for pending jobs to
 complete in scheduler kill
Message-ID: <20230912104459.746f2f29@collabora.com>
In-Reply-To: <20230912021615.2086698-12-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-12-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 luben.tuikov@amd.com, donald.robson@imgtec.com, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Sep 2023 19:16:13 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> Wait for pending jobs to be complete before signaling queued jobs.

You probably want to add 'in drm_sched_entity_kill()', even if it's
already specified in the subject, because I was trying to understand
why we'd want to do that in the normal path.

> This
> ensures dma-fence signaling order correct and also ensures the entity is
> not running on the hardware after drm_sched_entity_flush or
> drm_sched_entity_fini returns.
