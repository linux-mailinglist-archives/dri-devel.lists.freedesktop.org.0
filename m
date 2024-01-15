Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A7682D829
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 12:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CEE10E1C3;
	Mon, 15 Jan 2024 11:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A548910E1C3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705317323;
 bh=mq9cexTGaudmGQYYXeK7nwB6TXKlek7TOaHX4J6SF2s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SC+8xVIWV8L5lXk7z3hE22uVf8lLSZGC3f4+Ty9mgiQBQiy29gXoGK/Ak9AsQac4+
 A7t/AMxY/ruJaPt2OwSlrLDVPVbIBOhlIDe5sXPPtssKNgXmRDfsTPn7MVK9IZoOTW
 uCHhyFAEtrrEh3pXNwv+nR6FezyaWh56JItkBqzXjA2hREa9cGAR2fMkefYu/4hojS
 vcfImCfEQk+7RR6MBzbj83gu/+DZ73wck5veEVwus5hHJ0rdVYYfS1bjb6lG8FZI5E
 UupkXXWiYyG4Ji1idmqGmK4yqqvhrThHizJRG1buJcg7qDTlh2oTRrSpPgHvcfa0Oi
 WNI0a7sMwO94g==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9FCEB3782053;
 Mon, 15 Jan 2024 11:15:22 +0000 (UTC)
Date: Mon, 15 Jan 2024 12:15:21 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 09/14] drm/panthor: Add the heap logical block
Message-ID: <20240115121521.0f417bb4@collabora.com>
In-Reply-To: <ae360c8e-e51a-47f7-8093-a796fcc0a058@arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-10-boris.brezillon@collabora.com>
 <ae360c8e-e51a-47f7-8093-a796fcc0a058@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 16:27:39 +0000
Steven Price <steven.price@arm.com> wrote:

> On 04/12/2023 17:33, Boris Brezillon wrote:
> > Tiler heap growing requires some kernel driver involvement: when the
> > tiler runs out of heap memory, it will raise an exception which is
> > either directly handled by the firmware if some free heap chunks are
> > available in the heap context, or passed back to the kernel otherwise.
> > The heap helpers will be used by the scheduler logic to allocate more
> > heap chunks to a heap context, when such a situation happens.
> > 
> > Heap context creation is explicitly requested by userspace (using
> > the TILER_HEAP_CREATE ioctl), and the returned context is attached to a
> > queue through some command stream instruction.
> > 
> > All the kernel does is keep the list of heap chunks allocated to a
> > context, so they can be freed when TILER_HEAP_DESTROY is called, or
> > extended when the FW requests a new chunk.
> > 
> > v3:
> > - Add a FIXME for the heap OOM deadlock  
> 
> Sadly I don't have any better solutions that what you've described in
> the FIXME.

Fully fixing the problem indeed requires having non-blocking/failable BO
allocation helpers (which is something we have on our TODO), but there's
something we might want to address now: the heap chunk allocation
currently happens with the scheduler lock held, which prevents the job
timeout from killing the group and leads to an actual deadlock of the
whole scheduler. I think we should deffer the heap chunk allocation to
a work, queued to the different wq (that's what kbase does BTW).
