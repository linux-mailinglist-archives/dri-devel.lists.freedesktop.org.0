Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7CC98A9C6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 18:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BBB10E2F2;
	Mon, 30 Sep 2024 16:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="h1Sn3Ip6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D7F10E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 16:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727713881;
 bh=4isPE9g+V2OkFDChYzooZfh+5FYlUu/NYY2NFlhJb2A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h1Sn3Ip6f+lqTYJ2RD9IjPGy+WarL6Cp9QU2pt0FMG2PB6/7TcM/50yTtK7B6Eai5
 ilkuvdbekoPkoxAIFJQH6LulCsK2cKHU6OFs2/zCaJBtOL8pJk2dSeFeO+iPDCDy7X
 3+Xzfo10zjRYrbRUciZgM8l4PAXITjQWpGrC+U15/dJ5TgCabnHGnY4rVFvC1DC2Tp
 nV8WrMNjHkcH9c9g7jIHIJZCtt/CFYhfVDD1VuX2EEDjeARytIHuvbQKVsiqEcjfrK
 xaB72MpDsLFePOEGShgI0kJL4hPV1OWfzdI3YAEOFS8yandLyNJ1V8N0+0btdI35/I
 +Fj3uOQkG9OHA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E7B817E360F;
 Mon, 30 Sep 2024 18:31:21 +0200 (CEST)
Date: Mon, 30 Sep 2024 18:31:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH] drm/panthor: Fix access to uninitialized variable in
 tick_ctx_cleanup()
Message-ID: <20240930183112.388d3a07@collabora.com>
In-Reply-To: <c96f2fd-db5b-5593-1c10-7893724e554e@inria.fr>
References: <20240930161101.67366-1-boris.brezillon@collabora.com>
 <c96f2fd-db5b-5593-1c10-7893724e554e@inria.fr>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Mon, 30 Sep 2024 18:16:04 +0200 (CEST)
Julia Lawall <julia.lawall@inria.fr> wrote:

> On Mon, 30 Sep 2024, Boris Brezillon wrote:
> 
> > The group variable can't be used to retrieve ptdev in our second loop,
> > because it might be uninitialized or point to a group that's already
> > gone. Get the ptdev object from the scheduler instead.  
> 
> Won't it always be pointing to some random place above the list_head at
> the start of the list in the last element of the array?

Oh, absolutely. I'll fix the commit message and send a v2 shortly.
