Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A2ACB54F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED90C6EAD1;
	Fri,  4 Oct 2019 07:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729356E117
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 20:32:57 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iG7mM-0006xH-SJ; Thu, 03 Oct 2019 20:32:50 +0000
Date: Thu, 3 Oct 2019 13:32:50 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH -next 00/11] lib/interval-tree: move to half closed
 intervals
Message-ID: <20191003203250.GE32665@bombadil.infradead.org>
References: <20191003201858.11666-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003201858.11666-1-dave@stgolabs.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DuwMGQIzbvieUCH04dpyi9AiTx6jv704Pfn5oVeJ17U=; b=RYxhot7mP0JyjcYaAZEScfO1B
 6EJMyUWXlNdT3UDcTvRnHCNreWLXGGY7iNXJWyn8XMRiBWuyKwXKAiNt97SK5zlHmjecIp1vV4QWf
 3MMmDQuoXudCRIc3Pntnzk2D+nvYpA8R+DX19eIvAyEP60ti312vCUTZKPIKYOvqoGA7oPhRxWmsb
 1wYUz+J1z5n5H4HBkA3jKBidq9Notx4vPfLBTylntN2b7ob3ZWf6Kqj8qAvdy6F2hUPeIbiIPuwzR
 7gp1Xw/1/mREnXHy2ysx3SPtsTRHHROdIH4BPHiovRiPo+t+ICndCH/x22GYqYbq3CHBGXVgVRR/X
 UqAc4SSkg==;
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, akpm@linux-foundation.org,
 walken@google.com, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDE6MTg6NDdQTSAtMDcwMCwgRGF2aWRsb2hyIEJ1ZXNv
IHdyb3RlOgo+IEl0IGhhcyBiZWVuIGRpc2N1c3NlZFsxLDJdIHRoYXQgYWxtb3N0IGFsbCB1c2Vy
cyBvZiBpbnRlcnZhbCB0cmVlcyB3b3VsZCBiZXR0ZXIKPiBiZSBzZXJ2ZWQgaWYgdGhlIGludGVy
dmFscyB3ZXJlIGFjdHVhbGx5IG5vdCBbYSxiXSwgYnV0IGluc3RlYWQgW2EsIGIpLiBUaGlzCgpT
byBob3cgZG9lcyBhIHVzZXIgcmVwcmVzZW50IGEgcmFuZ2UgZnJvbSBVTE9OR19NQVggdG8gVUxP
TkdfTUFYIG5vdz8KCkkgdGhpbmsgdGhlIHByb2JsZW0gaXMgdGhhdCBsYXJnZSBwYXJ0cyBvZiB0
aGUga2VybmVsIGp1c3QgZG9uJ3QgY29uc2lkZXIKaW50ZWdlciBvdmVyZmxvdy4gIEJlY2F1c2Ug
d2Ugd3JpdGUgaW4gQywgaXQncyBuYXR1cmFsIHRvIHdyaXRlOgoKCWZvciAoaSA9IHN0YXJ0OyBp
IDwgZW5kOyBpKyspCgphbmQganVzdCBhc3N1bWUgdGhhdCB3ZSBuZXZlciBuZWVkIHRvIGhpdCBV
TE9OR19NQVggb3IgVUlOVF9NQVguCklmIHdlJ3JlIHN0b3JpbmcgYWRkcmVzc2VzLCB0aGF0J3Mg
Z2VuZXJhbGx5IHRydWUgLS0gbW9zdCBhcmNoaXRlY3R1cmVzCmRvbid0IGFsbG93IGFkZHJlc3Nl
cyBpbiB0aGUgLVBBR0VfU0laRSB0byBVTE9OR19NQVggcmFuZ2UgKG9yIHRoZXknZApoYXZlIHRy
b3VibGUgd2l0aCBQVFJfRVJSKS4gIElmIHlvdSdyZSBsb29raW5nIGF0IGZpbGUgc2l6ZXMsIHRo
YXQncwpub3QgdHJ1ZSBvbiAzMi1iaXQgbWFjaGluZXMsIGFuZCB3ZSd2ZSBkZWZpbml0ZWx5IHNl
ZW4gZmlsZXN5c3RlbSBidWdzCndpdGggZmlsZXMgbnVkZ2luZyB1cCBvbiAxNlRCIChvbiAzMiBi
aXQgd2l0aCA0ayBwYWdlIHNpemUpLiAgT3IgYmxvY2sKZHJpdmVyIGJ1Z3Mgd2l0aCBzaW1pbGFy
bHkgc2l6ZWQgYmxvY2sgZGV2aWNlcy4KClNvLCB5ZWFoLCBlYXNpZXIgdG8gdXNlLiAgQnV0IGRh
bW5pbmcgY29ybmVyIGNhc2VzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
