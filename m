Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF0C6BBFED
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 23:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A064710EA0D;
	Wed, 15 Mar 2023 22:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257D210EA0D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 22:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Lh/fTH0IApa4rUjij2hKr4uEpS9VPGARS8cLZJTnHdc=; b=MjPMrn8HDaFHfwL+LcuQsHZULq
 Tg7rLfUs4HpcJDbU1IjQBCnHXah/kXya9bPWfI0z5BVEeQb0ae5ioaCqSRNPhPyZ50VLix1vyJsYI
 ZS2eDm6ViAOG0K1VFdQMDh4nVcc7qjWkBOmLfqrMIc9V3lSRkqVvMJ/ssCmYb7diZ1ItVbmLqaQxe
 CIOBcupMgFmhUCt2pT28OtkwlzxnvBX+5wBB1mgWJnagG336qfpSJTINPMzLjVTbTObDXIzxvhI0V
 N/aiJy1Srkaomp7OqpvlVqWIWg/MZ4495dUPVK40E5i6z6SriFQ7yZ8hvwXqjwchtv09SM/VG5fSC
 78q2JQvg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1pcZnI-00Ed2h-0U; Wed, 15 Mar 2023 22:40:28 +0000
Date: Wed, 15 Mar 2023 15:40:28 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: enhancing module info to allow grouping of firmwares
Message-ID: <ZBJJXJ4TzF4ZUmNL@bombadil.infradead.org>
References: <CAPM=9txaQfHkjs6nWcwBtnYQXtr996dyht7wasJ7QOovjepmAw@mail.gmail.com>
 <CADnq5_PdxFdvVwVnQ2n4vXXPYKe0ZOVYBPT0Kf+6aPuQLc960g@mail.gmail.com>
 <CAPM=9txGT2hFNAQbY8Fncz_zGr0nNeQ4KbN_s=D0XXueCtDmLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9txGT2hFNAQbY8Fncz_zGr0nNeQ4KbN_s=D0XXueCtDmLQ@mail.gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-modules@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 07:18:11AM +1000, Dave Airlie wrote:
> MODULE_FIRMWARE_GROUP("g1")
> MODULE_FIRMWARE("fwv1.bin")
> MODULE_FIRMWARE("fwv2.bin")
> MODULE_FIRMWARE_GROUP_END("g2")

The way module namespaces were implemented could be used to leverage
something like this, just that you'd use it for firmware tags, not
symbols.

drivers/dma-buf/dma-buf.c:EXPORT_SYMBOL_NS_GPL(dma_buf_export, DMA_BUF);

Just that that would look like something like this, which might be
even nicer:

MODULE_FIRMWARE_GROUP("fwv1.bin", "nvidia/g1");
MODULE_FIRMWARE_GROUP("fwv2.bin", "nvidia/g1");

  Luis
