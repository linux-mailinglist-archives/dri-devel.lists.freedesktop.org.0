Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3378C989
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0D810E437;
	Tue, 29 Aug 2023 16:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5230010E437
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 16:21:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 868166607236;
 Tue, 29 Aug 2023 17:21:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693326092;
 bh=3+O/QGaroGgVr93uHseHK0tgwOpPRcK4aPxNgWkihgU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P3ObXaY7aVLGXhujA6rt8K63I6RDU4KM/26gaS0iN/w0cd/74pjUBdi0v7lBq6FT6
 KrSxdM//pS/c4j10LWDkwjMQiyaHOSqr/wzUYcN7zJotZaLIfc27Les5jEoaE38bP+
 pGQpVdhpu3MIIDIfwFYXG35DPWLEIwoHZauzxa69NWK+Jnb5QIzyIQFEUrcOgQcl/S
 vmk6MwsYkeAwmBIpHPLSRtbpRw+jqvYn8UFNIwdcWyzqPLPDxopyFTLJMt6EmO2cv2
 Wi6yy1MrE0fWD4LRNk5bO1Z/PQoUri4rl9rzwXdRtZ12By0ryCz6Vp2WOQ1anHFEg6
 UjJ1kyGMqayTg==
Date: Tue, 29 Aug 2023 18:21:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 10/15] drm/panthor: Add the heap logical block
Message-ID: <20230829182129.77cdc5c5@collabora.com>
In-Reply-To: <b2f47884-2f33-5374-8fdc-2d252c367534@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-11-boris.brezillon@collabora.com>
 <b2f47884-2f33-5374-8fdc-2d252c367534@arm.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Aug 2023 15:39:03 +0100
Steven Price <steven.price@arm.com> wrote:

> I'm not sure whether we should really be describing this structure in
> the kernel. Beyond the size the kernel has no reason to be looking at
> the internals and the spec does have a warning that the layout may change.

Yeah, I guess I just wanted to have that documented somewhere, so
people understand what this heap context is about. Was quite obscure to
me before that. Anyway, I can move that to some mesa doc, that's not a
big deal.

> 
> Interestingly kbase also rounds this size up to ensure that it is at
> least a cache line. Which I guess might be required if the CPU and GPU
> are not coherent as we zero the context (from the CPU) before use.

Makes sense.
