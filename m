Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47549AEBC8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 18:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE2510E2B0;
	Thu, 24 Oct 2024 16:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.b="VZN70DSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C712710E2B0;
 Thu, 24 Oct 2024 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=jDrqNELMr4hJN1aNtpR6XIChV3cdGXU6NdzMsUfUu2Q=; b=VZN70DSEHTNVPzL+RGGTX59N7u
 QP4SQI+9x/ruSZAa/+2N4QB0MjvGWc1r/15twm78XTUiSYkbNBAk1dIUbsV4tADi75JwD18oDlhLO
 N7AHpuDs3tzHWRknPrua4P5B8dIszCAF2cWBGzu1oUYSZZqqJCrJok7qUmzyQwGxoVSN1/oBvTZ/+
 dGuAhXS/xjavYldjg1wkmFUQ+JYPdkN/KlHt2YFupcHxKTZk12iqwZO3aW8IsV2QY1SNDqLe8389m
 qC9Aqf/4h6XH73D45XjvKFxJzRu2j/se9tEqu00LWYUKJWjWHLSguWoUrdlvMiIiFyEBEsjBhi+bO
 dC0ZTsLA==;
Received: from d104-157-31-28.abhsia.telus.net ([104.157.31.28]
 helo=[192.168.1.250]) by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <logang@deltatee.com>) id 1t40aO-00H4d1-2k;
 Thu, 24 Oct 2024 10:21:21 -0600
Message-ID: <2e8eec04-c73c-410d-a844-716a68c6dac2@deltatee.com>
Date: Thu, 24 Oct 2024 10:21:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20241022151616.GA879071@bhelgaas>
 <26d7baf8-cfdc-4118-b423-5935128cc47f@deltatee.com>
 <IA0PR11MB718513F3D07518E9CCF3D498F84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <IA0PR11MB718513F3D07518E9CCF3D498F84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 104.157.31.28
X-SA-Exim-Rcpt-To: vivek.kasireddy@intel.com, helgaas@kernel.org,
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



On 2024-10-23 23:50, Kasireddy, Vivek wrote:
>> I'd echo many of Bjorn's concerns. In addition, I think the name of the
>> pci_devs_are_p2pdma_compatible() isn't quite right. Specifically this is
>> dealing with PCI functions within a single device that are known to
>> allow P2P traffic. So I think the name should probably reflect that.
> Would pci_devfns_support_p2pdma() be a more appropriate name?

That sounds better to me, thanks.

Logan
