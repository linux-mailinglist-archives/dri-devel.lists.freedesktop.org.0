Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B016C6504
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 11:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD4610E032;
	Thu, 23 Mar 2023 10:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118FA10E032
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679567395; x=1711103395;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gOXFFZe79WcM896xEk4DmyKX6AYQIZBrt1Fiv+yvES0=;
 b=mwB+ct02prEOB0QLNh1O3fkRvDukBQyOKURzIBnuSwQ9HiY9fywuFPsr
 XVl8+NPK0KwezcO5h3hgMy+BOAMFEB4eYr6jtiVGz5/Av0j2SGnWYY8L8
 49tFhM38BTyQq41XYpsvk8aSZYg4voAH0vbwLoSsUYpdhdYpHAl7isztU
 U1+dqFq+QvN3e8JmIK9JBLJgBWoQTlEv3aobGCD/LpyD3oJb93w51VbZf
 lHqiml2fuB6Xeg7an8U/63SIwD7l2QaL8I5uicve5/TNuKqjBZPnv5p4l
 kMi4JFyun+oPq4OB89Xi+zCDv0pxA/nqdqBtn7536G8bDkMV/yK3v/jJZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339482255"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="339482255"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 03:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="825769546"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="825769546"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 03:29:54 -0700
Date: Thu, 23 Mar 2023 11:29:52 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH] accel/habanalabs: Remove redundant pci_clear_master
Message-ID: <20230323102952.GD2130371@linux.intel.com>
References: <20230323083553.16864-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323083553.16864-1-cai.huoqing@linux.dev>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Tomer Tayar <ttayar@habana.ai>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 04:35:49PM +0800, Cai Huoqing wrote:
> Remove pci_clear_master to simplify the code,
> the bus-mastering is also cleared in do_pci_disable_device,
> like this:
> ./drivers/pci/pci.c:2197
> static void do_pci_disable_device(struct pci_dev *dev)
> {
> 	u16 pci_command;
> 
> 	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
> 	if (pci_command & PCI_COMMAND_MASTER) {
> 		pci_command &= ~PCI_COMMAND_MASTER;
> 		pci_write_config_word(dev, PCI_COMMAND, pci_command);
> 	}
> 
> 	pcibios_disable_device(dev);
> }.
> And dev->is_busmaster is set to 0 in pci_disable_device.
> 
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
LGTM

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

