Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F26E9E87
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BFC10ECF7;
	Thu, 20 Apr 2023 22:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E77610ECF7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:04:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7585760B8B;
 Thu, 20 Apr 2023 22:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0AAC433EF;
 Thu, 20 Apr 2023 22:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682028256;
 bh=rD9VMfKEJUFC4BYnTD9baNPUr4s7JyEl0ztF0Di7OKw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EPQM4RDE1vMmsg7wiEkmGqzvCIyrImc5T/Bq/lqdOuEdICx6O4ap+Ub/FsyWPaHl7
 nXwQO/Qdxv8dnF4h8A2ap5SSbWNe7H8hOm0z32DRkhmePr7VeEB2LaSoWHvv1nWXRl
 hI2P+e3jctlTnnOx/kH02gPjWp7wHKr4a5OoCBTrAJM8GEawx2cK86+cd0uAA+4gCF
 Mcg7cPFrfnSVSxCuS97zKToBgg2ZtXbqevEgc7mxdOxgLyGvBQxl0QkB+z9WdZhfE9
 3v2CeZ7jEXj5t3DH5eBmA7wA6cblDyn0kjKoPN9RjOHd5GWSbCf0RsJ6Ezrq+yfbou
 tY8F5n76uF5zQ==
Message-ID: <6b7c1f22-2d97-bda9-affd-2e3a7a1d42ed@kernel.org>
Date: Fri, 21 Apr 2023 07:04:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] PCI: Add ASPEED vendor ID
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230420191036.GA315493@bhelgaas>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230420191036.GA315493@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR AST SERVER GRAPHICS CHIPS"
 <dri-devel@lists.freedesktop.org>, linux-ide@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>,
 Patrick McLean <chutzpah@gentoo.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/21/23 04:10, Bjorn Helgaas wrote:
> [+cc Damien, linux-ide]
> 
> On Thu, Apr 20, 2023 at 09:08:48AM +0200, Thomas Zimmermann wrote:
>> Am 19.04.23 um 20:37 schrieb Bjorn Helgaas:
>>> On Wed, Apr 19, 2023 at 09:00:15AM +0200, Thomas Zimmermann wrote:
>>>> Am 19.04.23 um 00:57 schrieb Patrick McLean:
>>>>> Currently the ASPEED PCI vendor ID is defined in
>>>>> drivers/gpu/drm/ast/ast_drv.c, move that to include/linux/pci_ids.h
>>>>> with all the rest of the PCI vendor ID definitions. Rename the definition
>>>>> to follow the format that the other definitions follow.
>>>>
>>>> Thanks a lot. Can you please also move and rename the PCI device ids? [1]
>>>
>>> Generally we move things to pci_ids.h only when they are shared
>>> between multiple drivers.  This is mostly to make backports easier.
>>>
>>> PCI_VENDOR_ID_ASPEED is (or will be) used in both ast_drv.c and
>>> libata-core.c, so it qualifies.
>>>
>>> It doesn't look like PCI_CHIP_AST2000 and PCI_CHIP_AST2100 would
>>> qualify since they're only used in ast_drv.c and ast_main.c, which are
>>> part of the same driver.
>>
>> Ok, I see. Can I take the patch into DRM trees?
> 
> The first time around I got two patches [2].  This time I only got
> this patch, but IIUC there are still two patches in play here:
> 
>   - This one, which moves PCI_VENDOR_ID_ASPEED to pci_ids.h, and
>   - The libata-core one that adds a use in ata_dev_config_ncq()
> 
> Those should go together via the same tree.  I supplied my ack to
> indicate that I'm not going to merge anything myself, and I expect
> whoever merges the libata patch to also merge this one.
> 
> If for some reason the libata-core patch doesn't happen, then this
> patch shouldn't happen either, because there would no longer be any
> sharing between drivers that would justify a pci_ids.h addition.

I can take both patches through the libata tree but there were comments on the
second patch for libata and I have not seen these addressed yet (I did not get a
v2). And in the meantime, it seems that the PCI ID patch was reworked as a
single patch... Not sure what's happening here.


