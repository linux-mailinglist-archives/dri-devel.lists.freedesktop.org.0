Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8D29A1288
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 21:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CFF10E756;
	Wed, 16 Oct 2024 19:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.b="ZjyhWYi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607A610E756;
 Wed, 16 Oct 2024 19:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=E3pz5NktMcCGwJTcSzoyiX83mvd/y+YLGX6taQ43k9c=; b=ZjyhWYi3kKoj0lDPInjmIHNWv7
 p1AGmi/U/v97PQhWcRgzXCPMQh00dWWn/8/kL7Z58Qfo1O8tScKSDWfjUsraLS3DyEWS+wzMRpUva
 P/gtgxpxc4WWEfLVSXgYjagpzFjp83q9HMYkGWmyOmHnmOPr/ZVKnmNwdrRj1ba81yUyDHKg8Ew1f
 iCVTXV4naH5KrdUbVqzKX7ZYbXv5JW5uIDWnKwcmFtjQVCy8+DzZs8zcVeoSv/P/TrgzzfATPv/Jw
 xMUq2+xJILS5YrLd3pnTdQcvDidGP468q42h8lG32MOItfYsevprrtqH2s6FNlDLr90Sji0ujVjCK
 1V4E2kXQ==;
Received: from d104-157-31-28.abhsia.telus.net ([104.157.31.28]
 helo=[192.168.1.250]) by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <logang@deltatee.com>) id 1t19i8-00AvqA-2C;
 Wed, 16 Oct 2024 13:29:33 -0600
Message-ID: <d115cc88-cc0c-41fc-840e-e11b783919cc@deltatee.com>
Date: Wed, 16 Oct 2024 13:29:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
 <20241012024524.1377836-2-vivek.kasireddy@intel.com>
 <eddb423c-945f-40c9-b904-43ea8371f1c4@deltatee.com>
 <IA0PR11MB71855AF581EAA8EE8F43E820F8462@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <IA0PR11MB71855AF581EAA8EE8F43E820F8462@IA0PR11MB7185.namprd11.prod.outlook.com>
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



On 2024-10-15 23:29, Kasireddy, Vivek wrote:
> I think it would make sense to limit the passing criteria for device functions'
> compatibility to Intel GPUs for now. These are the devices I am currently
> testing that we know are P2P compatible. Would this be OK?

Yes, this sounds good to me. We can reconsider if we get more rules like
it in the future.

Thanks,

Logan
