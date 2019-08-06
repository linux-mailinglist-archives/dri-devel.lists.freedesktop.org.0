Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63528845C3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF32E6E61C;
	Wed,  7 Aug 2019 07:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4C66E51B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 18:02:10 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k10so16326901qtq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 11:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DWmSMnF3B1mTPtWIyEYX2euOl5QowlPflL5LrFAqjMw=;
 b=MpaqiglNrZxrkJ0c0LKpNkZ+erhjp9oLQXR65/zGZbdXCDLYFt23tYOjJ0ohv7ZZxt
 wVsnUvZ0znWIPa/T61Qw7KbTDjld4ChRbaj2wB3rji+TEIb0jGqAmANnCgBoa8x0tkcA
 NqNlCWZoKp1rJPgrA2pqW/NzFremdxgc+zqU0tIl58+MHoWoSr8GKuU32Vvv3imAwKz/
 wwAw/bPQPmjuSHnKN5f1JDiZY33unwZ0AE1Z6qgXtC9FkHAyi/ienYzC+VYNz2NrUwjo
 pOS9h2zjNOQu5zDr+mQk1D228flBM/9pT7/dNWnrKIAimHTQVCOzbvRCPWrM2hbjweJm
 xlDw==
X-Gm-Message-State: APjAAAX4hBHupvOzNaFrKRY1NpBfJE5QoY42e1IuZgSfA5uMutrq+HVS
 FWVx8z/tdvzw7bAnZ+EmcRxnqA==
X-Google-Smtp-Source: APXvYqzwT9xNxemQscVlJmSlpGsNQA9yiKA1TtYWgT1CZ65aDe7RTogerUHwfzBX65WGTnxLLbQenA==
X-Received: by 2002:ac8:f99:: with SMTP id b25mr4258745qtk.142.1565114530121; 
 Tue, 06 Aug 2019 11:02:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id w10sm263879qts.77.2019.08.06.11.02.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 11:02:09 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv3mj-0000H9-63; Tue, 06 Aug 2019 15:02:09 -0300
Date: Tue, 6 Aug 2019 15:02:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/15] mm: remove the mask variable in
 hmm_vma_walk_hugetlb_entry
Message-ID: <20190806180209.GN11627@ziepe.ca>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806160554.14046-9-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DWmSMnF3B1mTPtWIyEYX2euOl5QowlPflL5LrFAqjMw=;
 b=Fz9mT5h+F2iLSvCsBQC5ggiqblN5sutWqjuhuF03Psd+Uf9SPIthU1SFjsJOpswgqI
 i/rgIdKvSW+0tmW7prrn9Y9533G5r4E6d8zM2DnGZ+TNNPM1MBH1FT1zMnZwkyxWU56W
 iIxNzxmjUm0QE0MLJTbJe3z6JqTvYF91SW6QufY/zMDl+9YGG4y5cVhS4ePPcReybl3S
 5KnATeu6yNsS0v/Exp3ApYHy7cwB4/w0c77CJqZUqewRB2Fv001+6QZuzn3886W/04vb
 HuXkgysTL1jkEq+Yt2WQvBYWRBxT7DYd/4ML1Ga5aZt50ou9KZTiM8DcK7BJNDl2Ss0U
 6iSw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NDZQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIHBhZ2V3YWxrIGNvZGUgYWxyZWFkeSBwYXNzZXMgdGhlIHZhbHVlIGFz
IHRoZSBobWFzayBwYXJhbWV0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+Cj4gIG1tL2htbS5jIHwgNyArKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
