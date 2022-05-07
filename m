Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 852CD51E5D3
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 11:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1334A1125DB;
	Sat,  7 May 2022 09:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A84112582
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 09:06:12 +0000 (UTC)
Date: Sat, 7 May 2022 17:05:42 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1651914367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j815uNVTrC2zbEfuQ1kKt5KWSsZfGH90td0/PQ5ogrQ=;
 b=iYt7riG/mfb9s7dyzVgXIqRzZwelacsgxjTdeN1AgJ91kN3y9nSM/W9WzuEGg70/Fl/UFN
 nb+4oOkKnazbkpCJgnlsQVbx7EBJ6qmgeDXxyqNDAWK6TXDKkXapdrfwQLxTnrwKJKldRE
 px0qOTi/OvwmWo8YbfXXNFlE5qf+B24=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Cai Huoqing <cai.huoqing@linux.dev>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/4] drm/nvdla: Add driver support for NVDLA
Message-ID: <20220507090542.GA30702@chq-T47>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <YmqgailZKIuY7zTZ@orome>
 <beacfd71-ebd0-7fde-187f-34b7a42a47de@kapsi.fi>
 <20220429032810.GA10104@chq-T47> <YnAPDRZMc88cDdYS@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnAPDRZMc88cDdYS@orome>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02 5月 22 19:04:13, Thierry Reding wrote:
> On Fri, Apr 29, 2022 at 11:28:10AM +0800, Cai Huoqing wrote:
> > On 28 4月 22 18:56:07, Mikko Perttunen wrote:
> > > On 4/28/22 17:10, Thierry Reding wrote:
> > > > On Tue, Apr 26, 2022 at 02:07:57PM +0800, Cai Huoqing wrote:
> > > > > The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> > > > > which is integrated into NVIDIA Jetson AGX Xavier,
> > > > > so add driver support for this accelerator."
> > > > 
> > > > Hi,
> > > > 
> > > > nice to see this work going on. For subsequent revisions, can you please
> > > > also Cc the Tegra mailing list (linux-tegra@vger.kernel.org) as well as
> > > > the Tegra platform maintainers (that's Jon Hunter and myself). This will
> > > > make sure that more people with an interest in this will see your work.
> > > > Not everyone follows dri-devel, linaro-mm-sig or linux-media.
> > > > 
> > > > Thanks,
> > > > Thierry
> > > 
> > > From a quick glance it looks like this driver pokes DLA hardware directly
> > > which is not the intended programming model on Tegra hardware (there are
> > > Falcon microcontrollers that offload task scheduling and synchronization
> > > from the CPU). The hardware is also behind the Host1x bus so a simple
> > > platform device is not sufficient.
> > > 
> > > Was this driver developed against some platform with OpenDLA hardware (i.e.
> > > not Tegra)?
> > > 
> > > If so, we'd need to verify if the hardware matches the hardware in Tegra194.
> > > Also, this driver may not be ideal for Tegra platforms since we would lack
> > > the hardware scheduling and synchronization facilities. It is likely
> > > necessary to have separate drivers for OpenDLA and Tegra's DLA integration.
> > > 
> > > Thanks,
> > > Mikko
> > > 
> > Tegra DLA seems to work with a slave coprocessor, the host driver just
> > impelement message queue, share buffer, notification... The hardware
> > detail of DLA maybe in the slave driver(not linux OS?).
> > 
> > Sure, This driver just support for the SOCs or FPGAs that OPENDLA
> > inside. I will change this kind of description "integrated into NVIDIA Jetson AGX Xavier"
> > this driver dont support for Tegra directly.
> 
> Yes, I think it would be good to make it clear that this is not going to
> work with the Tegra instantiations so that people don't get confused.
> 
> I think it would be ideal, though, if we could reuse as much of this
> driver as possible to work with other instantiations. The only reference
> to OpenDLA that I can find and which seems somehow relevant to this is
> here:
> 
> 	https://github.com/SCLUO/ITRI-OpenDLA
Hi, thanks for your reply.

the hardware code here,
https://github.com/caihuoq/nvdla-hw
or https://github.com/nvdla/hw
which includes cmodel, RTL.

I also make a docker image to run cmodel simulator(based on qemu)
https://github.com/caihuoq/nvdla_docker
It can be used to check this driver.

Thanks,
Cai
> 
> Is that the version that you're using? Or is the version that you're
> using at least compatible with that one? Apart from that and the Tegra
> instantiations, are you aware of any other derivatives that we need to
> account for? I'm worried that this might fragment to the point where it
> becomes unmaintainable in upstream Linux.
> 
> Even if this doesn't concern the Tegra instantiation, I think most of my
> other comments remain valid. Things like global variables will get in
> the way of multiple FPGA instantiations as well, for example.
> 
> You will also need to provide the device tree bindings for the
> particular instantiation that you're working on. Typically this would be
> identified by a vendor-specific compatible string for your particular
> board, but if it stems from a "canonical" FPGA mapping, matching on that
> compatible string might also be an option. In either case, when you send
> out the DT bindings, please include the devicetree@vger.kernel.org
> mailing list so that they can be properly reviewed.
> 
> Thierry


