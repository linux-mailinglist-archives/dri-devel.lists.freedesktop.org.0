Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28696F4CC4
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 00:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4516E10E08C;
	Tue,  2 May 2023 22:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB6610E08C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 22:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hq9UcYCw0YGefVJ8NzRgUGcDPFfhETx+38qR+9vdsYI=; b=3Mo0bgBM7LM+k3C8aD/hoX1SiY
 PFgn7K/tLRtVMWDSPf352AxVALEjONXmqJfKhZnGiBqqD8h8h4LtvA25JF20PTCfuIbHIXmSrUZTu
 ITNPT7Uha6MzLcy/ibK7h7YPYpEBVWfVffhBPoksiwIotdTwE/nm8wjc4h99sZ9kmQLI6BTu/rB1I
 JcraGc+LOd5apI7DAeHKY+HG7TC7l3VMlVsxxeVNBME4GoExLxeBM6mj3D+luAJPl+kkIuAZwyonJ
 ccDiO8tHqmH+Dr4www25ETJTO6P4NMsd0UbjolKx7/s5Eh1fO83hf5W8JgnaHiwz9i7csjB7bUAPR
 W9DocdwA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1ptyD4-002l2b-1K; Tue, 02 May 2023 22:10:58 +0000
Date: Tue, 2 May 2023 15:10:58 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] modules/firmware: add a new option to denote a firmware
 group to choose one.
Message-ID: <ZFGKcnwqzlyWniVo@bombadil.infradead.org>
References: <20230419043652.1773413-1-airlied@gmail.com>
 <ck2dzxvllhhh74oa3vjlacutc7rdmgl7cfrfq7vgx4w3jcufrz@7jbgxcat42yn>
 <CAPM=9tw0Y2A4DvuTHT_yd58Eit+tUmo63pbEOHwRJ66LeqznEQ@mail.gmail.com>
 <fsleccud43leoioli6bj4xoydwbdcjb5qr4denuf6morhgtqki@t6xya2mygon5>
 <ZEcJNcz+ArLfUSJ1@bombadil.infradead.org>
 <n6gwizwt26ucpuva2kt35rprth6iqeibi3inq2qrn5qhs3aa3b@4hjbhgnskutq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n6gwizwt26ucpuva2kt35rprth6iqeibi3inq2qrn5qhs3aa3b@4hjbhgnskutq>
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
Cc: Dave Airlie <airlied@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 02, 2023 at 11:11:58AM -0700, Lucas De Marchi wrote:
> Based on the above and my previous reply, I think we should have
> something more explicit about the order rather than relying on the
> toolchain behavior.

You can open code ELF sections and provide SORT() but you can also use
helpers for all this. Long ago I provided low level ELF helpers to
provide the ability to easily sort through data / code using
linker-tables [0], to help with ELF section with explicit ordering,
perhaps this could be leveraged?

I *think* for instance, one could do, using the built-in firmware
conversion as a slightly relateed example [1], provide a firmware helper for
drivers which uses something like DECLARE_FIRMWARE_TABLE(acme_gpu_fw),
then that is declared as the ELF table for acme_gpu_fw, the firmware API
could then get the hint to use that table for iterating over with
linktable_for_each(fw, acme_gpu_fw). One would not be using the linker
table for the actual firmware but instead for the firmware odering.


The firmware loader could be extended with something like

#define DECLARE_FIRMWARE_TABLE(fw_table)  DECLARE_LINKTABLE_RO(struct fw_foo, fw_table)

struct fw_foo {
	const char *opt_subfamily;
};

#define FW_NAME_ORDERED(__level, __family, __sub_family)	\
	static LINKTABLE_INIT_DATA(fw_foo, __level) 		\
	__fw_ordered_##__family = {		     		\
	opt_subfamily = sub_family,				\
};

Then firmware could would use 

FW_NAME_ORDERED(01, acme_gpu_fw, coyote);

And helpers can use it to look for the firmware an firmare API call.

As to why linker-tables never got upstream? It promised / documented
too much, we need to just make the API conversion smooth and target
that. The ordering is a secondary win. The fact that we can simplify
init levels etc, is more futuristic and should only be documented once
we get there.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20170620-linker-tables-v8
[1] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?h=20170620-linker-tables-v8&id=162698d2f1a2406c6a7a4d39f13113ca789fd2ec

  Luis
