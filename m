Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BA482D96B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 14:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A3710E27C;
	Mon, 15 Jan 2024 13:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9CB10E27C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705323904;
 bh=Kr6baZN9/uT+f6HmrKgzqxvVL4au/4Oj3XC+JYZ/PZg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fAGcDCv2a1MM7Wab+TRN4MJ7hoew8vMhC2HNlGLB2XlgGc8LqIYKtsgO6SyqdaLVU
 oSp/tqb2ZNKsk5eANAiUGx2AwQuN68vOBCYDhNdF4kv8gxk7OkkDnYUniXSDzpRA7j
 AIrOQ8c/K/r8mS/FWq+F8Eh2+qFjR+QuZiIgqYfdCPV3BsetEjrSdvZYxuY0nBv/Z2
 NWUHEMtRt1N1ewwq2HvlO0mWAlQrvqh3fnSZBLZ79BQUOmkDXuiMhHm1JWEcNca3bw
 PkQFKbRjTjdis/4vfdFV1ZbE6Wkh+iv0sctZa0iMqRmJHX0GUD5FUiOGbFAMi5Cf7/
 PXyC+tcZV6tQw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C3020378000A;
 Mon, 15 Jan 2024 13:05:03 +0000 (UTC)
Date: Mon, 15 Jan 2024 14:05:02 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v3 10/14] drm/panthor: Add the scheduler logical block
Message-ID: <20240115140502.2d8b6a2c@collabora.com>
In-Reply-To: <cb31820e-4cd7-4495-977d-99f1da1fe602@arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-11-boris.brezillon@collabora.com>
 <cb31820e-4cd7-4495-977d-99f1da1fe602@arm.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, "Marty E .
 Plummer" <hanetzer@startmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Dec 2023 12:50:21 +0100
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> On 04/12/2023 18:33, Boris Brezillon wrote:
> 
> <snip>
> 
> > +static void
> > +panthor_queue_put_syncwait_obj(struct panthor_queue *queue)
> > +{
> > +	if (queue->syncwait.kmap) {
> > +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(queue->syncwait.kmap);
> > +
> > +		drm_gem_vmap_unlocked(queue->syncwait.obj, &map);  
> 
> pretty sure you mean vUNmap here...

I certainly do. Will be fixed in v4.

Thanks,

Boris
