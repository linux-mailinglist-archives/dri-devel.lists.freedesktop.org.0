Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D35BB580C1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 17:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA7210E4F5;
	Mon, 15 Sep 2025 15:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.b="WwuuRcgj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CAA10E4F3;
 Mon, 15 Sep 2025 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=ct6Q6jd9bg2f3Yaega2w/3bt4lVQ8RUfwQj2iLKeA0k=; b=WwuuRcgjKBfqMAdgftjSrkdCkd
 E98/p++osXW2XuK5DOyzTWeE+Id+csr7dnCOVTrW+zFjN0Zu0iPuuMWA8/wXxnNULDNJMe0oFmllW
 cHxMDutsK1cIl9fCp8UU4DvJhE9X93FfzSZn8bqda2lzpUH2EEfzCjiL5YLIpCbpR0yxtXJN+B1kO
 npoljLq5CyW84ZgE25L6yyivVlJ6qyPj7JiE0B8pl/gkXm5W7DMETtZp7AduSvCFm5rXQ2YmZwQaS
 LqGLFU4FB55rvQgSQWnc/umArpQUfxB4PI5PQGtACojtsQiUffX7029YRu6kf9RiXlmmDZPlGqjen
 L2YESB+A==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <logang@deltatee.com>) id 1uyBCk-005CIr-1L;
 Mon, 15 Sep 2025 09:33:22 -0600
Message-ID: <7cb11157-4b77-407d-ac48-7e75dc01a7a3@deltatee.com>
Date: Mon, 15 Sep 2025 09:33:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-2-vivek.kasireddy@intel.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20250915072428.1712837-2-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: vivek.kasireddy@intel.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, bhelgaas@google.com, linux-pci@vger.kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=4.0.1
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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



On 2025-09-15 01:21, Vivek Kasireddy wrote:
> Typically, functions of the same PCI device (such as a PF and a VF)
> share the same bus and have a common root port and the PF provisions
> resources for the VF. Given this model, they can be considered
> compatible as far as P2PDMA access is considered.
> 
> Currently, although the distance (2) is correctly calculated for
> functions of the same device, an ACS check failure prevents P2P DMA
> access between them. Therefore, introduce a small function named
> pci_devfns_support_p2pdma() to determine if the provider and client
> belong to the same device and facilitate P2PDMA between them by
> not enforcing the ACS check.
> 
> However, since it is hard to determine if the device functions of
> any given PCI device are P2PDMA compatible, we only relax the ACS
> check enforcement for device functions of Intel GPUs. This is
> because the P2PDMA communication between the PF and VF of Intel
> GPUs is handled internally and does not typically involve the PCIe
> fabric.
> 
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Cc: <linux-pci@vger.kernel.org>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

This looks good to me, thanks.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

