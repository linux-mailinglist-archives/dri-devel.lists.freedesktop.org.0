Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C3F64C507
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 09:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC15210E21E;
	Wed, 14 Dec 2022 08:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551D810E221
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 08:26:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EB630CE180B;
 Wed, 14 Dec 2022 08:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141E2C433AC;
 Wed, 14 Dec 2022 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1671006354;
 bh=nUhA1KN+yRl+UoxzA4ZvEUH9cmzVGlUJ/vaEO+7pygI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LsbQHL2YXxb5IMvaSJ7+YYdciPjG0QapQJSC0aODWhZWLAA24qZQ+IUljHoQzZVaf
 Kvgosw3knqxIc+u2CVFEGazvDlgaCKNs+RLLY5wol3TftjXDY3VXc55krmFoHhowjo
 0y4RU41w/u/7hgXMVyvBASAKpWQ/uyge07tHMDbw=
Date: Wed, 14 Dec 2022 09:25:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] usb: gadget: aspeed_udc: Add check for
 dma_alloc_coherent
Message-ID: <Y5mIj6yLpObaLfSr@kroah.com>
References: <20221214025414.44866-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214025414.44866-1-jiasheng@iscas.ac.cn>
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, neal_liu@aspeedtech.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, joel@jms.id.au, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 10:54:14AM +0800, Jiasheng Jiang wrote:
> Add the check for the return value of dma_alloc_coherent in order to
> avoid NULL pointer dereference.
> 
> This flaw was found using an experimental static analysis tool we are
> developing, APP-Miner, which has not been disclosed.
> 
> The allyesconfig build using GCC 9.3.0 shows no new warning. As we
> don't have a UDC device to test with, no runtime testing was able to
> be performed.
> 
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog:
> 
> v1 -> v2:
> 
> 1. Add "goto err;" when allocation fails.

You already sent a previous v2 that differs from this one, this should
be v3, right?

