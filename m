Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E034B2CA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0D96E2E5;
	Wed, 19 Jun 2019 07:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEBC6E1B5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:13:26 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id w17so8770888qto.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 06:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xfhednnMko0J/Gc2EkI7pHwdsX7U0u0gJ5ATooY4GNw=;
 b=udO7uzTsncfoNSVZ/9vRc5oPg3yUFpsVVI2pQbYznn6rErc8+DGPIpNkOWR2INJTFY
 wYYtOoJRn0y9SqGMyx+g2KdKQxY+stMwul56BujqkEwrxOQAXRaSmzBcdCZ9rFIAkGUr
 /WhPHWDPNQHqhquy3AXcriktCc7fXxo+Uq888D9fSyW/Jstv72w9TeHIwxo2cIXp2i4P
 wpp/JF/TOj6dfP0wXJ3CUHPSqWd6CAhTobTQUWXoOEv/Yknr6cP5XeEvgm5bWk+2a5nU
 fYrT9HbvlU29As3ZbZQNTfehnhUHnUoAcLUgNTiHs0c/3Im3u/B8XxtPyotJ35P5Be4A
 SrfA==
X-Gm-Message-State: APjAAAWPnh3aT10eYFPO3gG4FD6mMESYniqpArAh50YUlJaPIHMhqSvU
 cTvYosQOC7dkIbtFeuDIjNDhQA==
X-Google-Smtp-Source: APXvYqyc4kGixlViSKnI/I5Z67eQQFGhrtX0nDRpvMdx2bumrawkhX26fgDCqWaQXW/nU4uS4gAM1Q==
X-Received: by 2002:a0c:b095:: with SMTP id o21mr27915778qvc.73.1560863605800; 
 Tue, 18 Jun 2019 06:13:25 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id f26sm11997359qtf.44.2019.06.18.06.13.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Jun 2019 06:13:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hdDvQ-0002cw-RL; Tue, 18 Jun 2019 10:13:24 -0300
Date: Tue, 18 Jun 2019 10:13:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 hmm 08/12] mm/hmm: Remove racy protection against
 double-unregistration
Message-ID: <20190618131324.GF6961@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-9-jgg@ziepe.ca>
 <20190615141612.GH17724@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615141612.GH17724@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xfhednnMko0J/Gc2EkI7pHwdsX7U0u0gJ5ATooY4GNw=;
 b=IpiFSBFYBoTwYfqvmxe8FloHMIqrMYqzAICMX/Tb1PQC8juV4R8QgNi8F2dTL850tB
 tOwbQTRNRQoTa3xOCOwC0OMtxDoNRGuOeI46BFC3kNaAvJiY4P/iyf7RzcsFxc8G45SH
 49zuAflb0zkgaDa+XIi2Wbzs2rUuPcOYneeddw2YI9zDMI26K+cYLBKrGFj8ybuggLo0
 cQrcA8DdzOTHcCXD3549+9H4FoxLRnXA5ooKkdIrNAGnGy1kdMiPech7iq2XGAhKkjdI
 ubP4uCFkrQKLP+0w6s5evp9n0tqrCRE+4lbHqXQX1c3CzOmVczeuL07tv7hCBLVhCB3b
 0WjA==
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

T24gU2F0LCBKdW4gMTUsIDIwMTkgYXQgMDc6MTY6MTJBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6NDQ6NDZQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gRnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFu
b3guY29tPgo+ID4gCj4gPiBObyBvdGhlciByZWdpc3Rlci91bnJlZ2lzdGVyIGtlcm5lbCBBUEkg
YXR0ZW1wdHMgdG8gcHJvdmlkZSB0aGlzIGtpbmQgb2YKPiA+IHByb3RlY3Rpb24gYXMgaXQgaXMg
aW5oZXJlbnRseSByYWN5LCBzbyBqdXN0IGRyb3AgaXQuCj4gPiAKPiA+IENhbGxlcnMgc2hvdWxk
IHByb3ZpZGUgdGhlaXIgb3duIHByb3RlY3Rpb24sIGl0IGFwcGVhcnMgbm91dmVhdSBhbHJlYWR5
Cj4gPiBkb2VzLCBidXQganVzdCBpbiBjYXNlIGRyb3AgYSBkZWJ1Z2dpbmcgUE9JU09OLgo+IAo+
IEkgZG9uJ3QgZXZlbiB0aGluayB3ZSBldmVuIG5lZWQgdG8gYm90aGVyIHdpdGggdGhlIFBPSVNP
Tiwgbm9ybWFsIGxpc3QKPiBkZWJ1Z2dpbmcgd2lsbCBhbHJlYWR5IGNhdGNoIGEgZG91YmxlIHVu
cmVnaXN0cmF0aW9uIGFueXdheS4KCm1pcnJvci0+aG1tIGlzbid0IGEgbGlzdCBzbyBsaXN0IGRl
YnVnZ2luZyB3b24ndCBoZWxwLgoKTXkgY29uY2VybiB3aGVuIEkgd3JvdGUgdGhpcyB3YXMgdGhh
dCBvbmUgb2YgdGhlIGluIGZsaWdodCBwYXRjaGVzIEkKY2FuJ3Qgc2VlIG1pZ2h0IGJlIGRlcGVu
ZGluZyBvbiB0aGlzIGRvdWJsZS11bnJlZ2lzdGVyLWlzLXNhZmUKYmVoYXZpb3IsIHNvIEkgd2Fu
dGVkIHRoZW0gdG8gY3Jhc2ggcmVsaWFibHkuCgpJdCBpcyBhIHJlYWxseSBvdmVybHkgY29uc2Vy
dmF0aXZlIHRoaW5nIHRvIGRvLi4KClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
