Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3A1926A01
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 23:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC44010E96F;
	Wed,  3 Jul 2024 21:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KCFvnY1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E8A10E9D9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 21:08:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7B5A4CE30F7;
 Wed,  3 Jul 2024 21:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F622C2BD10;
 Wed,  3 Jul 2024 21:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720040913;
 bh=E6RZusLu6+EGO4OZbTy3pXuf5zwbb3APvZKN2/8n9zE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=KCFvnY1FCD1OA8mFJrWbd7BFdnY3e39apbo20o+IpnZ8Xmwa7zMKlUZBQR2Z9Sv6S
 XGdgjCpdtipMCxATZg7vtah7wpzV5/I3Y9XJy3ir2A8RKnUodEe1MfOHXduBpzQleC
 RnW+3cuine4AcM2aiMjgERKf+Y4LQaE4q00y8/aWG6xjeY/MPonVjDmqhKGrA44WYc
 48yhSQFdTS03CsyzOopLBGLjKFvzOZhAfZb6FtlcOvdc88FLbDMDBl2unKnf4YOL5S
 BvuOenO4SaKFnwpigeXiDBJPUKt+xxDzbraID+CdtjKUzfO5xqP+yaa0u2MDvzHr6V
 jcnGR2Gsd8coQ==
Date: Wed, 3 Jul 2024 16:08:31 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Icenowy Zheng <uwu@icenowy.me>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 bhelgaas@google.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: PCIe coherency in spec (was: [RFC PATCH 2/2] drm/ttm: downgrade
 cached to write_combined when snooping not available)
Message-ID: <20240703210831.GA63958@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c5e0f77-b24d-47dd-86d2-31cb8e44b42a@app.fastmail.com>
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

On Wed, Jul 03, 2024 at 04:52:30PM +0800, Jiaxun Yang wrote:
> 在2024年7月2日七月 下午6:03，Jiaxun Yang写道：
> > 在2024年7月2日七月 下午5:27，Christian König写道：
> >> Am 02.07.24 um 11:06 schrieb Icenowy Zheng:
> >>> [SNIP] However I don't think the definition of the AGP spec could apply on all
> >>> PCI(e) implementations. The AGP spec itself don't apply on
> >>> implementations that do not implement AGP (which is the most PCI(e)
> >>> implementations today), and it's not in the reference list of the PCIe
> >>> spec, so it does no help on this context. 
> >> No, exactly that is not correct.
> >>
> >> See as I explained the No-Snoop extension to PCIe was created to help 
> >> with AGP support and later merged into the base PCIe specification.
> >>
> >> So the AGP spec is now part of the PCIe spec.
> 
> Hi Bjorn & linux-pci folks,
> 
> It seems like we have some disputes on interpretation pf PCIe
> specification.
> 
> We are seeking your expertise on the question: Does PCIe
> specification mandate Cache coherency via snoop?

I'm not qualified to opine on this.  I'd say it's a question for the
PCI SIG protocol workgroup.  https://forum.pcisig.com/ is a place to
start.

Bjorn
