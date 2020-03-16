Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DB8186E73
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 16:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A65F6E202;
	Mon, 16 Mar 2020 15:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970D06E202
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 15:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id B89793F6F5;
 Mon, 16 Mar 2020 16:24:43 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Yxwz0OuS; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xl9vV7p1JUBb; Mon, 16 Mar 2020 16:24:42 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id E48693F71B;
 Mon, 16 Mar 2020 16:24:32 +0100 (CET)
Received: from linlap1.host.shipmail.org (unknown [94.191.152.149])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 6659236044C;
 Mon, 16 Mar 2020 16:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1584372272; bh=Zx64ANFWAXny81LonXtbdHLC72j6+QdgVCTHhsAyJ8s=;
 h=To:Cc:From:Subject:Date:From;
 b=Yxwz0OuSt//0A1K1nNas6YYz0cbLutJ2A146s8UquROIs1VEA4PXf7jlF3HVkj+1A
 QK2Wm1+6D63fhGtX8rLqvBr43IXNEBbHfx9kAexW405aWoF2yxdZcic9boV7I9U89U
 BZvockfGfJQRvFN63Ejo71HVYGaQZilUHb47cc6U=
To: Christoph Hellwig <hch@infradead.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: DMA, TTM and memory encryption
Organization: VMware Inc.
Message-ID: <3d2317cd-bc40-47cb-3dae-8caa80acd767@shipmail.org>
Date: Mon, 16 Mar 2020 16:24:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christoph,

It would be good to revisit this to see if we could set a direction for 
supporting user-space mapping of dma-coherent memory with TTM.

I think in the end, what TTM needs is a DMA interface similar to the one 
outlined here:

https://lore.kernel.org/lkml/b811f66d-2353-23c6-c9fa-e279cdb0f832@shipmail.org/

That could without too much effort be implemented for all architectures 
TTM supports and also for those weird architectures you've described 
that need special treatment, it would probably suffice with a more 
elaborate definition of the dma_pfn_t together with the dma coherent 
fault work you were suggesting earlier.

Regardless, once this patchset is in,

https://lore.kernel.org/lkml/20200304114527.3636-1-thomas_os@shipmail.org/

a short term solution would be to export the dma_pgprot() function and 
have TTM use it to set the pgprot for dma-coherent memory.

What do you think about this?

Thanks,

Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
