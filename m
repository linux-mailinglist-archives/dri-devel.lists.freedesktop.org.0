Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59AD2735B1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 00:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0012897EE;
	Mon, 21 Sep 2020 22:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677A089DF9;
 Mon, 21 Sep 2020 22:23:35 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B21723A62;
 Mon, 21 Sep 2020 22:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600727015;
 bh=N9RzAc6C05t2rxlnw7lSRzYBzP947+Ts1bAKMsLmjEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CluYU3j+OZ6XbzXp4elhUn92tatuqzSObk4WseHK3gulRNfFdoM3XXQ7GgS+G4xvK
 kvbtvWJXZAgYM3RJzYV8SaGS1CNoGPsNIvg1Xs/mnOCkm/yQVAzQJYYmJEmvpr+nPl
 7Rqin2VNlKQqbOYisp71I5TxrLYGu6uPZozrpNj8=
Date: Mon, 21 Sep 2020 23:23:30 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCHv4 1/6] iommu/io-pgtable-arm: Add support to use system
 cache
Message-ID: <20200921222329.GA4409@willie-the-truck>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <3b1beb6cf6a34a44b0ecff9ec5a2105b5ff91bd4.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <20200921180318.GG3141@willie-the-truck>
 <9646dd4f-f1e6-992d-b8a0-0f2c14fa9fe8@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9646dd4f-f1e6-992d-b8a0-0f2c14fa9fe8@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 11:03:49PM +0100, Robin Murphy wrote:
> On 2020-09-21 19:03, Will Deacon wrote:
> > On Fri, Sep 11, 2020 at 07:57:18PM +0530, Sai Prakash Ranjan wrote:
> > > Add a quirk IO_PGTABLE_QUIRK_SYS_CACHE to override the
> > > attributes set in TCR for the page table walker when
> > > using system cache.
> > 
> > I wonder if the panfrost folks can reuse this for the issue discussed
> > over at:
> > 
> > https://lore.kernel.org/r/cover.1600213517.git.robin.murphy@arm.com
> 
> Isn't this all hinged around the outer cacheability attribute, rather than
> shareability (since these are nominally NC mappings and thus already
> properly Osh)? The Panfrost issue is just about shareability domains being a
> bit wonky; the cacheability attributes there are actually reasonably normal
> (other than not having a non-cacheable type at all, only a choice of
> allocation policies...)

Hmm, yes, this quirk _also_ changes the cacheability settings which isn't
what we need. It's a bit grotty having two different ways to configure these
TCR bits (i.e. a quirk and a format), but at least the mali format rejects
all of the quirks so I suppose it's not the end of the world.

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
