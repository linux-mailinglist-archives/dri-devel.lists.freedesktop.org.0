Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB79AEEFB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 19:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8948710E984;
	Thu, 24 Oct 2024 17:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NqpkYQZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A45B10E984;
 Thu, 24 Oct 2024 17:59:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AAEF15C062E;
 Thu, 24 Oct 2024 17:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4498C4CEC7;
 Thu, 24 Oct 2024 17:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729792785;
 bh=+D96GA7IQEKRhi/+1zz338XETq5dWJAX3pXc35gnxqE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=NqpkYQZ3qhVJZMCjUaPfwYo510mwIg1NxcR2/1artfiI2LPFXBbb7HQSK4i6YCHta
 C1JOKF/LB79KMyY/FXM36UtNyjy0uNglcpYU3DCl/NN1/gf1TJdzq1lAgF6yBIAwau
 YQcTZB3d/Espqee4Q0F1o5ThqpneymGOa9bAUwfFVT2X0giE4zO/Fyk9CRlkWjnBoZ
 et3W8D1IBIMVk4Pdv/OLouiFooJW1B0G669QHIhi6HuMRa1b8FYOS4ez80gHg7xlwb
 KV0fLt5pPf38XD5r8nUwuESFx0mdheIsBH9uqS0mmr0dpY8Ds8X8DoNBp5t6YlQwdc
 i+836OQqqp6wQ==
Date: Thu, 24 Oct 2024 12:59:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Message-ID: <20241024175944.GA965060@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71853199C12F60897CDE80D4F84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On Thu, Oct 24, 2024 at 05:58:48AM +0000, Kasireddy, Vivek wrote:
> > Subject: Re: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for
> > functions of same device
> > 
> > On Sun, Oct 20, 2024 at 10:21:29PM -0700, Vivek Kasireddy wrote:
> > > Functions of the same PCI device (such as a PF and a VF) share the
> > > same bus and have a common root port and typically, the PF provisions
> > > resources for the VF. Therefore, they can be considered compatible
> > > as far as P2P access is considered.

I don't understand the "therefore they can be considered compatible"
conclusion.  The spec quote below seems like it addresses exactly this
situation: it says ACS can control peer-to-peer requests between VFs.

> ...
> > I'm not sure what you refer to by "PF provisions resources for the
> > VF".  Isn't it *always* the case that the architected PCI
> > resources (BARs) are configured by the PF?  It sounds like you're
> > referring to something Intel GPU-specific beyond that?
>
> What I meant to say is that since PF provisions the resources for
> the VF in a typical scenario,

Are you talking about BARs?  As far as I know, the PF BAR assignments
always (not just in typical scenarios) determine the VF BAR
assignments.  

Or are you referring to some other non-BAR resources?

> they should be automatically P2PDMA compatible particularly when the
> provider is the VF and PF is the client. However, since this cannot
> be guaranteed on all the PCI devices out there for various reasons,
> my objective is to start including the ones that can be tested and
> are known to be compatible (Intel GPUs).

Regardless of BAR or other VF resources, I don't think VFs are
automatically P2PDMA compatible.  For example, PCIe r6.0, sec 6.12.1.2
says:

  For ACS requirements, single-Function devices that are SR-IOV
  capable must be handled as if they were Multi-Function Devices.

  ...

  - ACS P2P Request Redirect: must be implemented by Functions that
    support peer-to-peer traffic with other Functions. This includes
    SR-IOV Virtual Functions (VFs).  ACS P2P Request Redirect is
    subject to interaction with the ACS P2P Egress Control and ACS
    Direct Translated P2P mechanisms (if implemented). Refer to
    Section 6.12.3 for more information.  When ACS P2P Request
    Redirect is enabled in a Multi-Function Device that is not an
    RCiEP, peer-to-peer Requests (between Functions of the device)
    must be redirected Upstream towards the RC.

Or do you mean something else by "P2PDMA compatible"?

Bjorn
