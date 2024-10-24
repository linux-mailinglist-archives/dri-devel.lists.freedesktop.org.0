Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA49AEF1E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 20:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8354610E98F;
	Thu, 24 Oct 2024 18:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hi4qEvv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2364B10E998;
 Thu, 24 Oct 2024 18:01:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC3F65C4A4F;
 Thu, 24 Oct 2024 18:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20400C4CEC7;
 Thu, 24 Oct 2024 18:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729792916;
 bh=65K4O56rVHThA5ysojnEJMgb3ZoD2iESEOa/k2ZO2Ck=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Hi4qEvv2e7AIR4rf2U6sIfySU+vUxJDOiGarKWTZtrG3qGBTHRfDslWUo2R9QDdov
 u6t7PbDVc/WNuwvo41Fv/2rDDRvZAhmdQc4tqZVvSTRngjJ4nFqgYr/A7uNORzBznk
 AOREP14kh/uM1DGz7ana6FC1EcHyqkyhMAeBF0LWmrRFAgxGRAgTBVGv7PUMIbEq2Z
 X3Sm0eFad4Bcavp9UL+IxdUaR/zmAGK8SQfQZnEE/bIR+Jc57/QUK+SNjiZFbhhTRN
 dv6O4NI1uDhTE367NAawqhdSQzkdgNUun1Wn0INemXseDmU1bb7hYOxidlEgZqHRWO
 HM5l2Oo5VbpLw==
Date: Thu, 24 Oct 2024 13:01:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Message-ID: <20241024180154.GA965482@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e8eec04-c73c-410d-a844-716a68c6dac2@deltatee.com>
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

On Thu, Oct 24, 2024 at 10:21:17AM -0600, Logan Gunthorpe wrote:
> On 2024-10-23 23:50, Kasireddy, Vivek wrote:
> >> I'd echo many of Bjorn's concerns. In addition, I think the name of the
> >> pci_devs_are_p2pdma_compatible() isn't quite right. Specifically this is
> >> dealing with PCI functions within a single device that are known to
> >> allow P2P traffic. So I think the name should probably reflect that.
> >
> > Would pci_devfns_support_p2pdma() be a more appropriate name?
> 
> That sounds better to me, thanks.

This sounds similar to what's done in pci_dev_specific_acs_enabled().
Could this problem be solved by adding more device-specific quirks
there?

Bjorn
