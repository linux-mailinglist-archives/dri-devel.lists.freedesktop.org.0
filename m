Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09D5A7DEA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 14:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A2710E381;
	Wed, 31 Aug 2022 12:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896E110E37E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 12:49:28 +0000 (UTC)
Received: from maud (unknown [IPv6:2601:18d:8700:1ffa:ccf1:c9dd:4b35:443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0948D66015AB;
 Wed, 31 Aug 2022 13:49:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661950167;
 bh=udSIZcRQcz0xs4pptDqsvC6JIR0/xiMXACrZHVRDjj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WVIS4Tj7khhOhQPDdSLYQKH2tSYXVhTnh+dDROU+88k4Dgw9zl/pnNG1P3KH3IgXm
 u8ERa4TxvnXBk85RoznWkOjg64UjlNiLfGRIM8k7T8W+HPUECCGDh9LqiM4hCbaprv
 7UGgvOM9Qg7TmT8FOzw2joPfp9TDZBhoiPw/YBnpOzceI/G3iW4Gh+J7gMn4xUryBD
 Qg9tSc0WeCy+nxGQ6+wcEv0jnJWNaGd9Qw10yysxGtGM3SaARMep4ksW1xFWAG4B1H
 Dvv0R7d40IDpcOEx3r8Z/QsRCj83ZtENXIg4Dh2UYtZHgX97tLN0URPUnPckPzykjk
 JD3lfz9bIH/jA==
Date: Wed, 31 Aug 2022 08:49:16 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/panfrost: Update io-pgtable API
Message-ID: <Yw9YzJD7S9R+cRwp@maud>
References: <daef7f8c134d989c55636a5790d8c0fcaca1bae3.1661205687.git.robin.murphy@arm.com>
 <YwRAnbNdx9nbGLom@maud>
 <bbff1b5b-020c-7f61-1530-20fb0d6a1ef9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbff1b5b-020c-7f61-1530-20fb0d6a1ef9@arm.com>
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
Cc: tomeu.vizoso@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 11:42:33AM +0100, Robin Murphy wrote:
> On 2022-08-23 03:51, Alyssa Rosenzweig wrote:
> > > -static size_t get_pgsize(u64 addr, size_t size)
> > > +static size_t get_pgsize(u64 addr, size_t size, size_t *count)
> > >   {
> > > -	if (addr & (SZ_2M - 1) || size < SZ_2M)
> > > -		return SZ_4K;
> > > +	size_t blk_offset = -addr % SZ_2M;
> > 
> > addr is unsigned. if this is correct, it's magic.
> 
> Eh, it's just well-defined unsigned integer overflow. Take "SZ_2M - (addr %
> SZ_2M)", realise the first term can be anything that's zero modulo SZ_2M,
> including zero, then also that the operations can be done in either order to
> give the same result, and there you go.

Shrug. It still seems voodoo to me but if this is normal kernel style
I'm not going to complain, Acked-by for the patch regardless.
