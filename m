Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD2A80839E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 09:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD1B10E820;
	Thu,  7 Dec 2023 08:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A11E10E820
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 08:56:41 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 15C3B6607341;
 Thu,  7 Dec 2023 08:56:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701939399;
 bh=Jom3weygsbLSD3ohHLXiOwJEM1mQmqwXykClyfVo3eI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PpkxIQANNO6DaetyigCj7PuOwXWyZ9xK7AsHEp/PP+mhcf8ebZXiW/ATeqSBoQx8K
 2nBq5q8OAp0L0E+6r7p/vdCVFg1ZllYifYBVxUgiw+Y3F/KUGgZAgN9myvC3vuY8ey
 80x2/fb5c90h6cfLA2MRQKb1v2PSy6AfmQquezGmDLsc28VgTVAaUgeH++3dqU5CB4
 tdJrftaV83GZoO+yoQRxa8vzFBtUYb2iHcMT5Dh/MTDg8jJh8OGaA6U4Fvi1ADmn+y
 kVmyrT9vxWrsXniqa7KafsmPHwLbAZvLTSlIjX1+7qOlNbqOn4Gk/WW/KjRd+DOTZW
 Q5KQdfEK+RE5w==
Date: Thu, 7 Dec 2023 09:56:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 03/14] drm/panthor: Add the device logical block
Message-ID: <20231207095635.435d3e77@collabora.com>
In-Reply-To: <20231207091243.7ce56a6e@collabora.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-4-boris.brezillon@collabora.com>
 <4d813208-39fe-4387-8415-4b0c17df42a4@arm.com>
 <20231207091243.7ce56a6e@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Dec 2023 09:12:43 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Wed, 6 Dec 2023 16:55:42 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
> > On 04/12/2023 17:32, Boris Brezillon wrote:  
> > > The panthor driver is designed in a modular way, where each logical
> > > block is dealing with a specific HW-block or software feature. In order
> > > for those blocks to communicate with each other, we need a central
> > > panthor_device collecting all the blocks, and exposing some common
> > > features, like interrupt handling, power management, reset, ...
> > > 
> > > This what this panthor_device logical block is about.
> > > 
> > > v3:
> > > - Add acks for the MIT+GPL2 relicensing
> > > - Fix 32-bit support
> > > - Shorten the sections protected by panthor_device::pm::mmio_lock to fix
> > >   lock ordering issues.
> > > - Rename panthor_device::pm::lock into panthor_device::pm::mmio_lock to
> > >   better reflect what this lock is protecting
> > > - Use dev_err_probe()
> > > - Make sure we call drm_dev_exit() when something fails half-way in
> > >   panthor_device_reset_work()
> > > - Replace CSF_GPU_LATEST_FLUSH_ID_DEFAULT with a constant '1' and a
> > >   comment to explain. Also remove setting the dummy flush ID on suspend.
> > > - Remove drm_WARN_ON() in panthor_exception_name()
> > > - Check pirq->suspended in panthor_xxx_irq_raw_handler()
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
> > > Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
> > > Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora    
> > 
> > We still have the "FIXME: this is racy"  
> 
> Yeah, I still didn't find a proper solution for that.

This [1] should fix the race condition in the unplug path.

[1]https://gitlab.freedesktop.org/panfrost/linux/-/commit/b79b28069e524ae7fea22a9a158b870eab2d5f9a
