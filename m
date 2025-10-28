Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD494C14A95
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E9B10E3BE;
	Tue, 28 Oct 2025 12:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tQu52Bpm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D899710E3BE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:39:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 89089418EE;
 Tue, 28 Oct 2025 12:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81AAC4CEE7;
 Tue, 28 Oct 2025 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761655180;
 bh=6MD0sthR182nStMxcccxrkgtZws4XvRSBv3yo0xYeUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tQu52BpmKIJ4y5/J+HudOPWYMPnBQ8O5RJPqxC8zWA2XAMkqt80DX0w5FroCxN97K
 F3hreKWsd7kHK5s4LMjxCn+8a2SyINQgpkwrMtUYhln3ZRx/3ytNG/S0whWtDzZIOR
 LuzoBOWezS8yZdIP9MQEPXhNtVnQAqjNmHnr902jNnNx3Mb7aFKui+/MuTtJQ708Xb
 iQqvZubrXNFumDRqUWrkCckeIkgoILYM8QmMwhwIwmMSwQf9oCO4GpeV478VAUPuK5
 7bpDfkNH5HfpeOGhtJZW7w29iX2ZDqTfYLLDWQy0q7cgBonIpqVmOF+h8tdq2RdUHS
 ZPy8GBRbeLRAw==
Date: Tue, 28 Oct 2025 12:40:30 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: foss@joelselvaraj.com, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: qcom-wled: fix unbalanced ovp irq enable
Message-ID: <aQC5vsJzeA-cPdKd@aspen.lan>
References: <20251021-qcom-wled-fix-unbalanced-ovp-irq-enable-v2-1-7ff115b4ffe7@joelselvaraj.com>
 <280f1e92-36a1-450b-b6df-b36c3aed3c1c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <280f1e92-36a1-450b-b6df-b36c3aed3c1c@oss.qualcomm.com>
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

On Wed, Oct 22, 2025 at 07:14:32PM +0200, Konrad Dybcio wrote:
> On 10/21/25 8:53 PM, Joel Selvaraj via B4 Relay wrote:
> > From: Joel Selvaraj <foss@joelselvaraj.com>
> >
> > In Xiaomi Poco F1 and at least few other devices, the qcom wled driver
> > triggers unbalanced ovp irq enable warning like the following during
> > boot up.
> >
> > [    1.151677] ------------[ cut here ]------------
> > [    1.151680] Unbalanced enable for IRQ 176
> > [    1.151693] WARNING: CPU: 0 PID: 160 at kernel/irq/manage.c:774 __enable_irq+0x50/0x80
> > [    1.151710] Modules linked in:
> > [    1.151717] CPU: 0 PID: 160 Comm: kworker/0:11 Not tainted 5.17.0-sdm845 #4
> > [    1.151724] Hardware name: Xiaomi Pocophone F1 (DT)
> > [    1.151728] Workqueue: events wled_ovp_work
> > ...<snip>...
> > [    1.151833] Call trace:
> > [    1.151836]  __enable_irq+0x50/0x80
> > [    1.151841]  enable_irq+0x48/0xa0
> > [    1.151846]  wled_ovp_work+0x18/0x24
> > [    1.151850]  process_one_work+0x1d0/0x350
> > [    1.151858]  worker_thread+0x13c/0x460
> > [    1.151862]  kthread+0x110/0x114
> > [    1.151868]  ret_from_fork+0x10/0x20
> > [    1.151876] ---[ end trace 0000000000000000 ]---
> >
> > Fix it by storing and checking the state of ovp irq before enabling and
> > disabling it.
> >
> > Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> > ---
> > I was able to debug the issue a little further. This happens mainly because
> > devm_request_threaded_irq already enables the ovp irq during probe. Then ovp
> > work gets scheduled when update_status happens and in turn enables the irq again.
> > Tracking the status makes it easy to avoid the double irq enable. But I am
> > open to try a different approach if there is any suggestion.
>
> Would reverting this change and adding (| IRQF_NO_AUTOEN) to that call
> fix it?

I'd definitely favour trying an alternative approach.

wled_[disable|enable]_ovp_irq() do hide "unbalanced enable/disable"
warnings but they will not nest correctly. That put things are high risk
of bugs (even if there are no bugs now it makes maintaining this driver
"high risk" in the future).


Daniel.
