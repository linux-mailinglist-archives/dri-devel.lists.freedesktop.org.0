Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD05140DE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 05:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ACB10F955;
	Fri, 29 Apr 2022 03:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114AC10F955
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 03:38:00 +0000 (UTC)
Date: Fri, 29 Apr 2022 11:37:33 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1651203477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeqiwakqteIi2ux9lGt03PezpQ4Ym4Vpg4af5bUrfCk=;
 b=A8RwEq/r9EAn+Oa7cpOExaCcnom40vxxnKfIQHrrTjJISw1kLb22sEDC7KLr9k5NEQYFBI
 gYWc2ur/A2f5zaV+GQ6X49tdJGex9XeU5NsE7t1L3F3elKVKi6LoEUr2y4hjHIpNrCuUJU
 U/DzOkxM0LsiKRuoLwjq2gG4YkyU++o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Cai Huoqing <cai.huoqing@linux.dev>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 0/4] drm/nvdla: Add driver support for NVDLA
Message-ID: <20220429033733.GA15753@chq-T47>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <YmqgailZKIuY7zTZ@orome>
 <beacfd71-ebd0-7fde-187f-34b7a42a47de@kapsi.fi>
 <aa55c03c-6d22-9718-a2a5-28d9ce114954@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa55c03c-6d22-9718-a2a5-28d9ce114954@nvidia.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28 4月 22 17:35:56, Jon Hunter wrote:
> 
> On 28/04/2022 16:56, Mikko Perttunen wrote:
> > On 4/28/22 17:10, Thierry Reding wrote:
> > > On Tue, Apr 26, 2022 at 02:07:57PM +0800, Cai Huoqing wrote:
> > > > The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> > > > which is integrated into NVIDIA Jetson AGX Xavier,
> > > > so add driver support for this accelerator."
> > > 
> > > Hi,
> > > 
> > > nice to see this work going on. For subsequent revisions, can you please
> > > also Cc the Tegra mailing list (linux-tegra@vger.kernel.org) as well as
> > > the Tegra platform maintainers (that's Jon Hunter and myself). This will
> > > make sure that more people with an interest in this will see your work.
> > > Not everyone follows dri-devel, linaro-mm-sig or linux-media.
> > > 
> > > Thanks,
> > > Thierry
> > 
> >  From a quick glance it looks like this driver pokes DLA hardware
> > directly which is not the intended programming model on Tegra hardware
> > (there are Falcon microcontrollers that offload task scheduling and
> > synchronization from the CPU). The hardware is also behind the Host1x
> > bus so a simple platform device is not sufficient.
> > 
> > Was this driver developed against some platform with OpenDLA hardware
> > (i.e. not Tegra)?
> > 
> > If so, we'd need to verify if the hardware matches the hardware in
> > Tegra194. Also, this driver may not be ideal for Tegra platforms since
> > we would lack the hardware scheduling and synchronization facilities. It
> > is likely necessary to have separate drivers for OpenDLA and Tegra's DLA
> > integration.
> 
> 
> I believe that this is derived from the following github project ...
> 
> https://github.com/nvdla/sw
> 
Sure, based on https://github.com/nvdla/sw

The copyright retain in this driver,
like "Copyright (C) 2017-2018 NVIDIA CORPORATION"

Thanks
Cai
> Jon
> 
> -- 
> nvpublic
