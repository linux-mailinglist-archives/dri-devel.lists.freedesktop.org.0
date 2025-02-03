Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CA0A255C3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 10:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F3E10E3F5;
	Mon,  3 Feb 2025 09:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lCIEv6Bv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5861B10E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 09:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738574721;
 bh=ruYBLYQL0qLEkSgQB6asPUY130gP0Tm1+lbl5ZxAfzc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lCIEv6BvXlPzZ4jmRbWLRWJV78zQQcoqIEEcNEUbovPcXq1IfKInkIMI/TJiZGJ43
 /2SVU4791RDomk3Wj1kYb/6Jqndk+aKo9Joh5Xg34DvuwQgDjJwe+5Y+4LZYl4jScH
 inaG9zZjpieCVt8aQ1YUK0ubN7S3dc+Y642ZcnPRiiaQz+B42pI1uR9MaBmed63RGU
 vjvxN3GbqjOakH/kypww7VsA9jO/wIpwR8ismxoz+3LYf0gOj06ZcnKORAS1LhG2Qv
 r5sF7ySXoNU+3lJbgGlY7sCLU88d5Mk2c4QGjNLEYB2dmfxXh7ETNY7ipAo9wLp0XV
 v/CjAZg5YZJIQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DB5617E0E37;
 Mon,  3 Feb 2025 10:25:20 +0100 (CET)
Date: Mon, 3 Feb 2025 10:25:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Florent Tomasin <florent.tomasin@arm.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nd@arm.com, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
Message-ID: <20250203102513.1a020577@collabora.com>
In-Reply-To: <Z5ulnIuzapOVBQgb@phenom.ffwll.local>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <Z5ulnIuzapOVBQgb@phenom.ffwll.local>
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

On Thu, 30 Jan 2025 17:15:24 +0100
Simona Vetter <simona.vetter@ffwll.ch> wrote:

> On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote:
> > Hi,
> > 
> > This is a patch series covering the support for protected mode execution in
> > Mali Panthor CSF kernel driver.
> > 
> > The Mali CSF GPUs come with the support for protected mode execution at the
> > HW level. This feature requires two main changes in the kernel driver:
> > 
> > 1) Configure the GPU with a protected buffer. The system must provide a DMA
> >    heap from which the driver can allocate a protected buffer.
> >    It can be a carved-out memory or dynamically allocated protected memory region.
> >    Some system includes a trusted FW which is in charge of the protected memory.
> >    Since this problem is integration specific, the Mali Panthor CSF kernel
> >    driver must import the protected memory from a device specific exporter.
> > 
> > 2) Handle enter and exit of the GPU HW from normal to protected mode of execution.
> >    FW sends a request for protected mode entry to the kernel driver.
> >    The acknowledgment of that request is a scheduling decision. Effectively,
> >    protected mode execution should not overrule normal mode of execution.
> >    A fair distribution of execution time will guaranty the overall performance
> >    of the device, including the UI (usually executing in normal mode),
> >    will not regress when a protected mode job is submitted by an application.
> > 
> > 
> > Background
> > ----------
> > 
> > Current Mali Panthor CSF driver does not allow a user space application to
> > execute protected jobs on the GPU. This use case is quite common on end-user-device.
> > A user may want to watch a video or render content that is under a "Digital Right
> > Management" protection, or launch an application with user private data.
> > 
> > 1) User-space:
> > 
> >    In order for an application to execute protected jobs on a Mali CSF GPU the
> >    user space application must submit jobs to the GPU within a "protected regions"
> >    (range of commands to execute in protected mode).
> > 
> >    Find here an example of a command buffer that contains protected commands:
> > 
> > ```
> >           <--- Normal mode ---><--- Protected mode ---><--- Normal mode --->
> >    +-------------------------------------------------------------------------+
> >    | ... | CMD_0 | ... | CMD_N | PROT_REGION | CMD_N+1 | ... | CMD_N+M | ... |
> >    +-------------------------------------------------------------------------+
> > ```
> > 
> >    The PROT_REGION command acts as a barrier to notify the HW of upcoming
> >    protected jobs. It also defines the number of commands to execute in protected
> >    mode.
> > 
> >    The Mesa definition of the opcode can be found here:
> > 
> >      https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/panfrost/lib/genxml/v10.xml?ref_type=heads#L763  
> 
> Is there also something around that implements egl_ext_protected_context
> or similar in mesa?

I'll be looking at a mesa implementation for EGL_EXT_protected_content
in the coming weeks. I'll probably get back to reviewing the panthor
implementation when I have something working in mesa.

> I think that's the minimal bar all the protected gpu
> workload kernel support patches cleared thus far, since usually getting
> the actual video code stuff published seems to be impossible.
