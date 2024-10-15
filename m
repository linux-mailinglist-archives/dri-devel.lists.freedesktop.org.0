Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29399F52E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918D810E5D6;
	Tue, 15 Oct 2024 18:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.b="Uor/DIgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2440 seconds by postgrey-1.36 at gabe;
 Tue, 15 Oct 2024 18:25:54 UTC
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA1810E5D6;
 Tue, 15 Oct 2024 18:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=BPeAYwyDZnaS1vv2XNPfZK8JukXiODb9mxxHVbQ3E+A=; b=Uor/DIgoky+qPE7WjyzQs2QUoh
 pa9jfeEf4hSn43vumap+WTU9ySIFIptUHHIxWmAlLdlpStg+fDuQH+fHD59TAKWfwIRMiaaDR0UEy
 SZi/IbQOCtG3ci3qvidmZ21tkTKkai5YP2+VflPwJXD1bzQb/XGCvlMEAFWx1RNpUTZ9yKXsOIIET
 5bTy5D7MvjTFakF++0jLxfFVZykpsVg76Pp33TQrPwRYplNcBsdno4AGEBnJvUHmAuBaVXIm99Av9
 JDIn/wXmWkSdmwUfmxI5TFK/LgK7rf1cmWN7+LQbaNff3J0jw4l2PXmNv7VkErw4Z5/6gNIZlAf/R
 RHYhzW5g==;
Received: from d104-157-31-28.abhsia.telus.net ([104.157.31.28]
 helo=[192.168.1.250]) by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <logang@deltatee.com>) id 1t0lbb-00A8Kk-2E;
 Tue, 15 Oct 2024 11:45:13 -0600
Message-ID: <eddb423c-945f-40c9-b904-43ea8371f1c4@deltatee.com>
Date: Tue, 15 Oct 2024 11:45:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
 <20241012024524.1377836-2-vivek.kasireddy@intel.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20241012024524.1377836-2-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 104.157.31.28
X-SA-Exim-Rcpt-To: vivek.kasireddy@intel.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, bhelgaas@google.com, linux-pci@vger.kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH v1 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
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


On 2024-10-11 20:40, Vivek Kasireddy wrote:
> Functions of the same PCI device (such as a PF and a VF) share the
> same bus and have a common root port and typically, the PF provisions
> resources for the VF. Therefore, they can be considered compatible
> as far as P2P access is considered.
> 
> Currently, although the distance (2) is correctly calculated for
> functions of the same device, an ACS check failure prevents P2P DMA
> access between them. Therefore, introduce a small function named
> same_pci_device_functions() to determine if the provider and
> client belong to the same device and facilitate P2P DMA between
> them by not enforcing the ACS check.

I'm not totally opposed to this. But the current code was done this way
for a reason: we can't be sure that functions on any given device can
talk to each other. So this change may break if used with other devices
with multiple functions that can't talk to each other.

That being said, the only alternative I can think of is another list of
allowed devices. However, given the pain it's been maintaining allowed
root ports, I'm not very enthusiastic about creating another list of
allowed devices in the kernel.

Logan
