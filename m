Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3FD9B6EB2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 22:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E3410E805;
	Wed, 30 Oct 2024 21:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.b="Hn4eDVf8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406FE10E0FD;
 Wed, 30 Oct 2024 21:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=Teay/SDFVQ3KrSrIP+rOxfqoHOvTS5vn0M/5NXbwQys=; b=Hn4eDVf8odnXEa3gXEbm04F6LU
 djR9gKjO57ul/d3FtdsFm/fG2y2ekwz4pJcTFtb+motJr/NBt6KmqAcxV1KLt9avHA0NOCJn3ZQSG
 r6jMjNFU9Gl1dPQdEIyeQBvvfO0FzNk+n7yvYYeX6zX4w9+Zk6e9fUyfJZRQDVT0ENZjJq1iyauLk
 4WUBCye/WmytimX1SwUvQ/abqFWff76EZkjWUJfB40m2CiYFAQ4QHHdjNvfd3Shc7WQyJX7Df+rF2
 0LDZaEyjmQt5/wRxxvWuw0CGBAoMcpQPWC0xG8j7oN5MsD4x44FzNPKvN+E9m0/M8lM2lKrzgWvDq
 7MUw87PA==;
Received: from d104-157-31-28.abhsia.telus.net ([104.157.31.28]
 helo=[192.168.1.250]) by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <logang@deltatee.com>) id 1t6G6q-004Cg7-17;
 Wed, 30 Oct 2024 15:20:09 -0600
Message-ID: <7e146e2f-5d7c-4f28-b801-360795b4cae7@deltatee.com>
Date: Wed, 30 Oct 2024 15:20:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Helgaas <helgaas@kernel.org>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20241030184641.GA1210322@bhelgaas>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20241030184641.GA1210322@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 104.157.31.28
X-SA-Exim-Rcpt-To: helgaas@kernel.org, vivek.kasireddy@intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 bhelgaas@google.com, linux-pci@vger.kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
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



On 2024-10-30 12:46, Bjorn Helgaas wrote:
> On Fri, Oct 25, 2024 at 06:57:37AM +0000, Kasireddy, Vivek wrote:
> In the PCIe world, I don't think a TLP can "loop back" to another
> function on the same device.

I'm not sure if the spec says anything that specifically denies this.
But it seems to me that it would be possible for a multifunction device
to handle a transfer to a neighbouring function internally and not
actually involve the PCIe fabric. This seems like something we'd want to
support if and when such a device were to be created.

Logan
