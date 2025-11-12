Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00706C52AFB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 15:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CBD10E749;
	Wed, 12 Nov 2025 14:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JBo3o4zb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1C210E749
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 14:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762957425;
 bh=1y8Od7Xh9l2hezr7urT6bLDtz1I1ySxP+ZueOMZZHsM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JBo3o4zb1JLLbr1XT7UAAi4htgKKiFDgd7aEJPH5Qdzj4PWSubQiKRZ/aaD/KJVC4
 xNsp2fGdaxvpsXhnLjNEYWIRU2aMLDHu/w4vC8wfibRiFLehlLOZ4VN/MVOJjSrg2G
 vLJaLdSAu4Yj4hWXDrEm48UQp3v+nUzL2Sy5bEQXgDRUGDXEyT7XaJU5fY49Ea8cE1
 LjB33+VvZ+k19n4QzOEFEIGxcdej8a2WyaNsQXDdwSyjqkldHvisT6Xh+JSLconcZf
 /8upHb7g67YuoIAsooLIAa4Rgs/FyDHvkNQU7sqjJEMNSeR4x6WaqjvM3bQ1QtjIYN
 jJI5mUKZlST9g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CB3617E0364;
 Wed, 12 Nov 2025 15:23:45 +0100 (CET)
Date: Wed, 12 Nov 2025 15:23:40 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Detlev Casanova
 <detlev.casanova@collabora.com>, Ashley Smith <ashley.smith@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH v7 1/2] drm/panthor: Make the timeout per-queue instead
 of per-job
Message-ID: <20251112152340.40f72b7e@fedora>
In-Reply-To: <20251112151253.7cfba768@fedora>
References: <20251112121744.1356882-1-boris.brezillon@collabora.com>
 <20251112121744.1356882-2-boris.brezillon@collabora.com>
 <7cea7efb7ff0ab34ab7352158ecce731a3f714d8.camel@redhat.com>
 <20251112143104.2cabebb9@fedora>
 <0558310f433debe93dddee0b6373bcb406b8bd62.camel@redhat.com>
 <20251112151253.7cfba768@fedora>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Nov 2025 15:12:53 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > OK. timeout_wq sharing is intended and allowed, so if that's what
> > you're doing, good. But I agree that accessing the wq through the
> > driver's struct is then cleaner and more obviously correct.  
> 
> Will do.

Actually, after looking into that, it seems I'd have to go back to
dev_get_drvdata(drm_gpu_scheduler::dev)::reset_wq to get the timeout
workqueue, so I think I'd prefer to keep using
drm_gpu_scheduler::timeout_wq unless that's really seen as a layering
violation (but I'd argue that accessing drm_gpu_scheduler::dev looks
like the same kind of layering violation to me).
