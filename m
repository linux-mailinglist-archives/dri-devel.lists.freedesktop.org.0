Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AF22EE9FE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 00:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36926E563;
	Thu,  7 Jan 2021 23:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 698 seconds by postgrey-1.36 at gabe;
 Thu, 07 Jan 2021 23:53:54 UTC
Received: from spam.moreofthesa.me.uk (moreofthesa.me.uk
 [IPv6:2001:8b0:897:1651::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6246E563
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=moreofthesa.me.uk; s=201708; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+a3oh3wC3I221Ztlf7urGUM58XE28rfJHOe9CwssR00=; b=EUnmdP2WZgqI/FebH6B5R7oFN
 /r7sb4BSqhIRgyXLxBMsn42kArDpHJlLyp9J4cA7B6dZzoBVV/6STdnypuA67ZKfc/4uWPEcOZWHg
 KWgHFfotQ2YG+L1TcIfOHFcPK2nGLsmXTnbBBkNl/r6PZcloIXKh8or9qnV1ozYfyA3VaJmzjfyYZ
 BTkx44vTpXvb4aVdQoM3J1/HOaXSY63t2VGm8jxoldSxu0QFsLeUOSO3rtdqhIvYDbyBn59zwu+Xd
 MNIA/CEBq1TkpfTjL7CsJlXoZzd/Jt3rAYPeGyZY48x4wgswNiVUlSnXqj2iO2HhnKK8o9hnSPOjK
 KItTGW89A==;
Received: from [2001:8b0:897:1650::2]
 by spam.moreofthesa.me.uk with esmtp (Exim 4.92)
 (envelope-from <devspam@moreofthesa.me.uk>)
 id 1kxeun-0008SP-AH; Thu, 07 Jan 2021 23:42:01 +0000
Date: Thu, 07 Jan 2021 23:31:36 +0000
From: Darren Salt <devspam@moreofthesa.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 2/4] PCI: Add pci_rebar_bytes_to_size()
Message-ID: <58F0BFBCD0%devspam@moreofthesa.me.uk>
In-Reply-To: <20210107211757.GA1391831@bjorn-Precision-5520>
References: <20210107211757.GA1391831@bjorn-Precision-5520>
Mail-Followup-To: <helgaas@kernel.org>, <nirmoy.das@amd.com>,
 <bhelgaas@google.com>, <ckoenig.leichtzumerken@gmail.com>, 
 <linux-pci@vger.kernel.org>, <christian.koenig@amd.com>,
 <devspam@moreofthesa.me.uk>, <dri-devel@lists.freedesktop.org>
User-Agent: Messenger-Pro/2.73.6.4250 (Qt/5.11.3) (Linux-x86_64)
X-No-Archive: no
X-Orwell-Date: Thu, 13187 Dec 1984 23:31:36 +0000
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:8b0:897:1650::2
X-SA-Exim-Mail-From: devspam@moreofthesa.me.uk
X-SA-Exim-Scanned: No (on spam.moreofthesa.me.uk);
 SAEximRunCond expanded to false
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
Cc: ckoenig.leichtzumerken@gmail.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-pci@vger.kernel.org, bhelgaas@google.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I demand that Bjorn Helgaas may or may not have written...

>> +static inline int pci_rebar_bytes_to_size(u64 bytes)
>> +{
>> +	bytes = roundup_pow_of_two(bytes);
>> +	return max(ilog2(bytes), 20) - 20;

> This isn't returning a "size", is it?  It looks like it's returning the
> log2 of the number of MB the BAR will be, i.e., the encoding used by the
> Resizable BAR Control register "BAR Size" field.  Needs a brief comment to
> that effect and/or a different function name.

Given that, it seems to me that pci_rebar_size_to_bytes should be similarly
commented and/or renamed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
