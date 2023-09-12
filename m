Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D67979D419
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 16:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1207A10E0C5;
	Tue, 12 Sep 2023 14:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D922910E0C5;
 Tue, 12 Sep 2023 14:53:05 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F0EC7660731A;
 Tue, 12 Sep 2023 15:53:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694530384;
 bh=7pr9nMqLHgNUUEvsRR36/rZ7W75CUex4/e4+WtNgODQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W1JlRr7ZqTtrqtPq9UvfB55AWW8DHUya1n0XdpJpzvbupm158eoNpRzxdrVPhY7Wf
 6FXh+M9goXKsyjADR6lhumJhqOhe2Fr+bZRCxLYHtmZu4502pL24sudQQjShWzLNTo
 7S2OEtDufIEWwMCy6DxmiLjZxpQ0adpCDCXeQM1NUhRK6g9q6T/Z0ArZ0tcgHr07S4
 sJ6sPDC/CRXJutCsYFVv4zwH6CmPPbOEaPhy374DpHPlK23ro28AL/pSL4yJhpFEeK
 06XO04sf3f1v6YGADtyZjktt4uZnDi1F5+n6v2ZnE14CyYRdbRYp/b1r10C/YqvvoF
 ZB5RhOGWCfHzw==
Date: Tue, 12 Sep 2023 16:53:00 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 05/13] drm/sched: Split free_job into own work item
Message-ID: <20230912165300.53c1a151@collabora.com>
In-Reply-To: <ZQB3xdWpukcxB4dh@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-6-matthew.brost@intel.com>
 <20230912100833.792eacb6@collabora.com>
 <ZQB3xdWpukcxB4dh@DUT025-TGLU.fm.intel.com>
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

On Tue, 12 Sep 2023 14:37:57 +0000
Matthew Brost <matthew.brost@intel.com> wrote:

> > Looks like you are changing the behavior here (unconditional ->
> > conditional timestamp update)? Probably something that should go in a
> > separate patch.
> >   
> 
> This patch creates a race so this check isn't need before this patch.
> With that I think it makes sense to have all in a single patch. If you
> feel strongly about this, I can break this change out into a patch prior
> to this one.

It's probably fine to keep it in this patch, but we should
definitely have a comment explaining why this check is needed.
