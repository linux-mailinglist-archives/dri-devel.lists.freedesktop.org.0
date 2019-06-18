Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBE4A213
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A406E178;
	Tue, 18 Jun 2019 13:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3A76E178
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id A0BD63F346;
 Tue, 18 Jun 2019 15:27:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zT5fbSyYnUPr; Tue, 18 Jun 2019 15:27:12 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 6D3E23F58D;
 Tue, 18 Jun 2019 15:27:12 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 303D4360195;
 Tue, 18 Jun 2019 15:27:12 +0200 (CEST)
Subject: Re: [PATCH 1/4] drm/vmwgfx: Assign eviction priorities to resources
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20190618062442.14647-1-thomas@shipmail.org>
 <20190618105408.GB29642@arch-x1c3>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <53e453b0-1c27-7fd1-fb50-02166e32c6be@shipmail.org>
Date: Tue, 18 Jun 2019 15:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618105408.GB29642@arch-x1c3>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1560864432; bh=yv9mwuPiSvxh30f59EgVNSxlBHFy2aZq7s9xrxeCgos=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hHl43NICSS2FkxH2UZ1EdOTUBxiSpTvO+4xWHsjGB5INztDBeS3sa5++KzfHhYf2Z
 eMWu/QTfrQXlRyLN0PILeEC/RXxdGKIruqu1Ck590pn3CGwOI12b3bgYHdVG/samab
 02+NixoOcK3eOdmgNYQ1ikhD2zKU8nrv3ReyIntg=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=hHl43NIC; 
 dkim-atps=neutral
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
Cc: pv-drivers@vmware.com, Thomas Hellstrom <thellstrom@vmware.com>,
 Deepak Rawat <drawat@vmware.com>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xOC8xOSAxMjo1NCBQTSwgRW1pbCBWZWxpa292IHdyb3RlOgo+IEhpIFRob21hcywKPgo+
IE9uIDIwMTkvMDYvMTgsIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+PiBGcm9t
OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4+Cj4+IFRUTSBwcm92
aWRlcyBhIG1lYW5zIHRvIGFzc2lnbiBldmljdGlvbiBwcmlvcml0aWVzIHRvIGJ1ZmZlciBvYmpl
Y3QuIFRoaXMKPj4gbWVhbnMgdGhhdCBhbGwgYnVmZmVyIG9iamVjdHMgd2l0aCBhIGxvd2VyIHBy
aW9yaXR5IHdpbGwgYmUgZXZpY3RlZCBmaXJzdAo+PiBvbiBtZW1vcnkgcHJlc3N1cmUuCj4+IFVz
ZSB0aGlzIHRvIG1ha2Ugc3VyZSBzdXJmYWNlcyBhbmQgaW4gcGFydGljdWxhciBub24tZGlydHkg
c3VyZmFjZXMgYXJlCj4+IGV2aWN0ZWQgZmlyc3QuIEV2aWN0aW5nIGluIHBhcnRpY3VsYXIgc2hh
ZGVycywgY290YWJsZXMgYW5kIGNvbnRleHRzIGltcGx5Cj4+IGEgc2lnbmlmaWNhbnQgcGVyZm9y
bWFuY2UgaGl0IG9uIHZtd2dmeCwgc28gbWFrZSBzdXJlIHRoZXNlIHJlc291cmNlcyBhcmUKPj4g
ZXZpY3RlZCBsYXN0Lgo+PiBTb21lIGJ1ZmZlciBvYmplY3RzIGFyZSBzdWItYWxsb2NhdGVkIGlu
IHVzZXItc3BhY2Ugd2hpY2ggbWVhbnMgd2UgY2FuIGhhdmUKPj4gbWFueSByZXNvdXJjZXMgYXR0
YWNoZWQgdG8gYSBzaW5nbGUgYnVmZmVyIG9iamVjdCBvciByZXNvdXJjZS4gSW4gdGhhdCBjYXNl
Cj4+IHRoZSBidWZmZXIgb2JqZWN0IGlzIGdpdmVuIHRoZSBoaWdoZXN0IHByaW9yaXR5IG9mIHRo
ZSBhdHRhY2hlZCByZXNvdXJjZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ry
b20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IERlZXBhayBSYXdhdCA8
ZHJhd2F0QHZtd2FyZS5jb20+Cj4gRndpdyBwYXRjaGVzIDEtMyBhcmU6Cj4gUmV2aWV3ZWQtYnk6
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4KPiBQYXRjaCA0IGlz
Ogo+IEFja2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+
Cj4gSHVnZSB0aGFua3MgZm9yIHNvcnRpbmcgdGhpcyBvdXQuCj4gRW1pbAoKVGhhbmtzIGZvciBy
ZXZpZXdpbmcsIEVtaWwuCgovVGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
