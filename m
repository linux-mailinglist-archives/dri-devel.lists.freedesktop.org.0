Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24BA9B6FA9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 23:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B2910E808;
	Wed, 30 Oct 2024 22:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pymgKQqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE14E10E806;
 Wed, 30 Oct 2024 22:07:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D1679A435A6;
 Wed, 30 Oct 2024 22:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2195DC4CECE;
 Wed, 30 Oct 2024 22:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730326060;
 bh=FGBXaMTs0zoZtuIJw76pQkmdmDElPzZuxay8K6IRs+M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=pymgKQqxDWszTJEoGeU8SOxQXzSUDVj057M2/sGjtLFYJttHMz/9aSEyG9uEWshEx
 BZOsy13EfwLb3MxEWqHyDkKiERyJ7dN/vrGPYzUfkAIISMXHt65w6YgmNg3PWBRi3M
 jo4aN5OxjQ9jf+Nqo3Dd6a3LL+gTrg4tYNFL/yNQjWtny7MhIoBc11YHSs4a8nXt0i
 Ya2zIbvL8QOMwLzkZrrxkXkBLOLjS/gs0Ps8vu7HAzSG5YOAMfF5E11fIMtqnQGoDq
 ugDndL4kZm7pvqCaoQAiBV9DY3wxrlMa/cHBqAqpxeNXoqMo5nlRXkwyB/BaYRXNlx
 gwGxXiMQUL2yA==
Date: Wed, 30 Oct 2024 17:07:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Message-ID: <20241030220738.GA1221922@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e146e2f-5d7c-4f28-b801-360795b4cae7@deltatee.com>
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

On Wed, Oct 30, 2024 at 03:20:02PM -0600, Logan Gunthorpe wrote:
> On 2024-10-30 12:46, Bjorn Helgaas wrote:
> > On Fri, Oct 25, 2024 at 06:57:37AM +0000, Kasireddy, Vivek wrote:
> > In the PCIe world, I don't think a TLP can "loop back" to another
> > function on the same device.
> 
> I'm not sure if the spec says anything that specifically denies this.

I'm not a hardware guy and I don't know if there's a direct statement
about it, but if a Downstream Port supports ACS, it must support ACS
P2P Request Redirect (PCIe r6.0, sec 6.12.1.1), which specifically
applies to peer-to-peer TLPs.

If peer-to-peer TLPs appear on the link, the Downstream Port will see
them and act on them, e.g., either route them upstream (if P2P Request
Redirect is enabled) or back downstream.  I don't think the VF could
act on them directly via a loopback path because that would lead to
duplicate writes and duplicate Completions for reads.

> But it seems to me that it would be possible for a multifunction device
> to handle a transfer to a neighbouring function internally and not
> actually involve the PCIe fabric. This seems like something we'd want to
> support if and when such a device were to be created.

If peer-to-peer transactions are handled internally, an SR-IOV device
other than an RCiEP is required to support ACS with P2P Egress Control
(sec 7.7.11) and P2P Request Redirect (sec 7.7.11.2).

Bjorn
