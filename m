Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924744BC26
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 16:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604556E426;
	Wed, 19 Jun 2019 14:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6564B6E375
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 11:34:54 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m29so19415106qtu.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 04:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Lo9X66uznaZ6SGYkNk0Sx1BYJ1CIYwurC70zh2R4uz8=;
 b=KfrOS8idy87TqUUuBHVq/qDS8CCFO7gR/UYF59s5ompXDCpgicgZbHaHda2J12aXY1
 bbC6UAT4vy+aZnLoZdcqq9h+YiYj+lseTxq2qtLYlwnUUsceT/lA9xa1RkHJWa/s/z+C
 84ZczV+cWMpOzVr4uQZ883A2jZ0oFIUb6Xrq5kvT+JANeDzepSegfTZ7MOVUCjTIu2YU
 EfJlXEQHQSXwS3m+wjmXVz0SCEomtGEn/J5rMZ7A5ayK44olIc0bMqMGLQ6V6yoVUtyY
 KpLNvQmHWKyQHdJwLuKCHM4sQSSb0WTg6MiR/03gfOKmUfDMv01VhrY5uJAwq92/Nv3C
 uD4w==
X-Gm-Message-State: APjAAAX3xHvEBFEGkydoaPdFdRxD84VQT+JZlrC1PFanrOWypxRIKKWe
 0lucGAkK1M5Lv1JGhfB7pkEOBA==
X-Google-Smtp-Source: APXvYqysE5jQwu5IGvItnPtoqMfHXLCakREbAz5IbbNkflU7Xd2VYz5hjEn1/wSvLEs0Ks3ehAZ0LQ==
X-Received: by 2002:ad4:5388:: with SMTP id i8mr6987929qvv.166.1560944093328; 
 Wed, 19 Jun 2019 04:34:53 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i22sm10799810qti.30.2019.06.19.04.34.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 04:34:52 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hdYrc-0002xP-6l; Wed, 19 Jun 2019 08:34:52 -0300
Date: Wed, 19 Jun 2019 08:34:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 hmm 06/12] mm/hmm: Hold on to the mmget for the
 lifetime of the range
Message-ID: <20190619113452.GB9360@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-7-jgg@ziepe.ca>
 <20190615141435.GF17724@infradead.org>
 <20190618151100.GI6961@ziepe.ca>
 <20190619081858.GB24900@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619081858.GB24900@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 19 Jun 2019 14:58:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Lo9X66uznaZ6SGYkNk0Sx1BYJ1CIYwurC70zh2R4uz8=;
 b=FKAUonMZk1gq68qWyHk5hxQwjYagl4YsmsAJviMRujON6p/cymKi6K/YRCSBGj83zJ
 JkfE/8aIyLUhGGY3g43VYw3XN/P1XonbUFKtelLRQiEwpnDabiu0XyHp4MTd4BxXnjq0
 V7oSMVDQ0B9LhdM9XamUqUYQ5FEAD5RlNAb4/W6UMjxMBMs9JgY42UFu4GcvX+n/zWDK
 MfPOy1Eqv9vEhMluQPKsGeBikLCd90E0ip1ORNx/X6O84GweOuD7mvfqOcigbyXMEBZB
 NoPogRjRvgMiG+lHlke1ShBBcwTOJQM51QTvE9P4WYq9zRxtb4rz854nmVnQvJZtVMtb
 Qb+A==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDE6MTg6NThBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gPiAgCW11dGV4X2xvY2soJmhtbS0+bG9jayk7Cj4gPiAtCWxpc3RfZGVsKCZy
YW5nZS0+bGlzdCk7Cj4gPiArCWxpc3RfZGVsX2luaXQoJnJhbmdlLT5saXN0KTsKPiA+ICAJbXV0
ZXhfdW5sb2NrKCZobW0tPmxvY2spOwo+IAo+IEkgZG9uJ3Qgc2VlIHRoZSBwb2ludCB3aHkgdGhp
cyBpcyBhIGxpc3RfZGVsX2luaXQgLSB0aGF0IGp1c3QKPiByZWluaXRpYWxpemXRlSByYW5nZS0+
bGlzdCwgYnV0IGRvZXNuJ3QgY2hhbmdlIGFueXRoaW5nIGZvciB0aGUgbGlzdAo+IGhlYWQgaXQg
d2FzIHJlbW92ZWQgZnJvbS4gIChhbmQgaWYgdGhlIGxpc3RfZGVsX2luaXQgd2FzIGludGVuZGVk
Cj4gYSBsYXRlciBwYXRjaCBpbiB5b3VyIGJyYW5jaCByZXZlcnRzIGl0IHRvIHBsYWluIGxpc3Rf
ZGVsLi4pCgpKdXN0IGZvbGxvd2luZyB0aGUgaW5zdHJ1Y3Rpb25zOgoKLyoqCiAqIGxpc3RfZW1w
dHlfY2FyZWZ1bCAtIHRlc3RzIHdoZXRoZXIgYSBsaXN0IGlzIGVtcHR5IGFuZCBub3QgYmVpbmcg
bW9kaWZpZWQKICogQGhlYWQ6IHRoZSBsaXN0IHRvIHRlc3QKICoKICogRGVzY3JpcHRpb246CiAq
IHRlc3RzIHdoZXRoZXIgYSBsaXN0IGlzIGVtcHR5IF9hbmRfIGNoZWNrcyB0aGF0IG5vIG90aGVy
IENQVSBtaWdodCBiZQogKiBpbiB0aGUgcHJvY2VzcyBvZiBtb2RpZnlpbmcgZWl0aGVyIG1lbWJl
ciAobmV4dCBvciBwcmV2KQogKgogKiBOT1RFOiB1c2luZyBsaXN0X2VtcHR5X2NhcmVmdWwoKSB3
aXRob3V0IHN5bmNocm9uaXphdGlvbgogKiBjYW4gb25seSBiZSBzYWZlIGlmIHRoZSBvbmx5IGFj
dGl2aXR5IHRoYXQgY2FuIGhhcHBlbgogKiB0byB0aGUgbGlzdCBlbnRyeSBpcyBsaXN0X2RlbF9p
bml0KCkuIEVnLiBpdCBjYW5ub3QgYmUgdXNlZAogKiBpZiBhbm90aGVyIENQVSBjb3VsZCByZS1s
aXN0X2FkZCgpIGl0LgogKi8KCkFncmVlIGl0IGRvZXNuJ3Qgc2VlbSBvYnZpb3VzIHdoeSB0aGlz
IGlzIHJlbGV2YW50IHdoZW4gY2hlY2tpbmcgdGhlCmxpc3QgaGVhZC4uCgpNYXliZSB0aGUgY29t
bWVudCBpcyBhIGJpdCBtaXNsZWFkaW5nPwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
