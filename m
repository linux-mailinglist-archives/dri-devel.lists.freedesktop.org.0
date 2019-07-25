Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC0C74835
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041816E67A;
	Thu, 25 Jul 2019 07:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9518993B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 01:14:27 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id v22so35236386qkj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2QscBl/3tbBrXReK2tsv96us6PdZtQnqjBeeXbxeJtw=;
 b=I5Xu6PRyYCUPLp/MRVlOp9Ltgt4pOBpJ4J6LaU7N/pTakbfy28FyJluXjGkb9XHJR5
 8N1y7IhUnucRz0EgAy50xQjF79AhYCay6QSDSA3iAi2LyJmDYx1/Zp9QSx0UgFp/icLh
 rl1O4kJ5xMT4d2h7+qj29OJkL+nv06qH+I3MfW+MuSxdsuTlCtOXhw9vXmLhhyxOZhsX
 GHFYb0DYqX+qCK6yZ0dNlVdMuhaFo9j7zbEeuTqYR8X8IPmJUuLjpNgt9S81W3AoLRTc
 wgMNPt9eY57Y2FoZZzffwwpnXCKXruTI76Y22pwfecqH+5CNGfzbD0yu9Y1INJHTCEJz
 qKtQ==
X-Gm-Message-State: APjAAAV4fEHenbsCUuQw5+BQCcijX1wPaPnTTphFxpLZe3xn6ZujOzcm
 92aNQv7ffzy6wIn5jMIi5EEVUg==
X-Google-Smtp-Source: APXvYqx9ciisQdvPSwTvcdjpywJ+TPlixY+OV7qviQmXLqIq62Jmz3/cvYtUMzroSQEs8t3xbOZYHw==
X-Received: by 2002:a05:620a:1ea:: with SMTP id
 x10mr54556510qkn.484.1564017266127; 
 Wed, 24 Jul 2019 18:14:26 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id k7sm20307997qth.88.2019.07.24.18.14.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 18:14:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hqSKu-00006q-Vv; Wed, 24 Jul 2019 22:14:24 -0300
Date: Wed, 24 Jul 2019 22:14:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Message-ID: <20190725011424.GA377@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723210506.25127-1-rcampbell@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=2QscBl/3tbBrXReK2tsv96us6PdZtQnqjBeeXbxeJtw=;
 b=CLuwqZyxlnhSQLNy2YRvagdU0Et/zZ17Ms4ehbdSvHLmk/gxwl3Wy/TTFegvnq+Et5
 4OpzVJv31gfdKu+/y13I9cSc1xlCIrpNLtabHb96qgORKl53PzbY30X66v61S563aYvw
 Z37UCLu003OZv8+NzTJzDSWyvzaPJpCNXSGq9hTC782PqR5qb6OfdY663YIxKKz6zIal
 IUoHez0chz3E2syIDBmGa7w0i9EJIB2xJ/Oxn1p3vnYmrNLjnuIVSG83ByHoyfGxuzLd
 v/OfQGlL/BCupE+LUBwfJE+qrXBuBE9jk/6+jF2E0ImNgnz9zBrdwCRnFkuXmowLxdCC
 tjIQ==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MDU6MDZQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gVGhlIGhtbV9taXJyb3Jfb3BzIGNhbGxiYWNrIGZ1bmN0aW9uIHN5bmNfY3B1X2Rl
dmljZV9wYWdldGFibGVzKCkgcGFzc2VzCj4gYSBzdHJ1Y3QgaG1tX3VwZGF0ZSB3aGljaCBpcyBh
IHNpbXBsaWZpZWQgdmVyc2lvbiBvZiBzdHJ1Y3QKPiBtbXVfbm90aWZpZXJfcmFuZ2UuIFRoaXMg
aXMgdW5uZWNlc3Nhcnkgc28gcmVwbGFjZSBobW1fdXBkYXRlIHdpdGgKPiBtbXVfbm90aWZpZXJf
cmFuZ2UgZGlyZWN0bHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1w
YmVsbEBudmlkaWEuY29tPgo+IENjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQu
Y29tPgo+IENjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gQ2M6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhh
dC5jb20+Cj4gCj4gVGhpcyBpcyBiYXNlZCBvbiA1LjMuMC1yYzEgcGx1cyBDaHJpc3RvcGggSGVs
bHdpZydzIDYgcGF0Y2hlcwo+ICgiaG1tX3JhbmdlX2ZhdWx0IHJlbGF0ZWQgZml4ZXMgYW5kIGxl
Z2FjeSBBUEkgcmVtb3ZhbCB2MiIpLgo+IEphc29uLCBJIGJlbGlldmUgdGhpcyBpcyB0aGUgcGF0
Y2ggeW91IHdlcmUgcmVxdWVzdGluZy4KCkRvZXNuJ3QgdGhpcyBuZWVkIHJldmlzaW9uIHRvIGlu
Y2x1ZGUgYW1ncHU/Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYzogICAg
ICAgICAuc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMgPSBhbWRncHVfbW5fc3luY19wYWdldGFi
bGVzX2dmeCwKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmM6ICAgICAgICAg
LnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzID0gYW1kZ3B1X21uX3N5bmNfcGFnZXRhYmxlc19o
c2EsCgpUaGFua3MsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
