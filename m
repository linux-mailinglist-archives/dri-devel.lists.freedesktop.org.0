Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF994B2AD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101886E2C7;
	Wed, 19 Jun 2019 07:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1006E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 15:11:02 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g18so8802839qkl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pqCED5mYNInU5PAv2mesXGcqWFvLrmpHYJb9ulnVVgI=;
 b=LBVe/THW38M79M/KQB0MqsNC8V1wTWwgrNtQzcbwdgrsd9omRHhFl/smzeUP4hs19l
 UdgXyrw1GFRVny04/ENna12tFcYmmXSPAo48Lo3Opnwrf6YiSlnglEI3U8vEeaeaojrj
 iQcEl3+0jnVssEVQwmiPCglL2a3lHfd+VBxlBKa0gZvKRrFbgFrf1/pLYQ+BBTLk2Flq
 bvU0KP012LVnE8c0fuesc8PbvokUq1cIOWQ24kAjVoRH2T4FU5LQlXDzz6uzXgj5mgZG
 t7EY370ctEPcvB6Cg/iTbzG/ujhAqbJlwE7rDdH+b2tdz8/P6DP1y/IzkV/uNpeg0nH1
 w0Ug==
X-Gm-Message-State: APjAAAUkZhvxaK/2UzqJ2a1DarfQ65XWjBVOFgPbTWkZTVycTuzuyoQm
 efFT8afUyLYjOlqWGfvXbfDUgg==
X-Google-Smtp-Source: APXvYqzNqG1TNcSVdITe8C3fCMJFkUWykHx0vaCyd8hF7H/75BSskda+UeSXCPEKbmE+kRdajwWEsQ==
X-Received: by 2002:a37:7847:: with SMTP id t68mr91753295qkc.128.1560870661341; 
 Tue, 18 Jun 2019 08:11:01 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 15sm8515948qtf.2.2019.06.18.08.11.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Jun 2019 08:11:00 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hdFlE-0008OK-D5; Tue, 18 Jun 2019 12:11:00 -0300
Date: Tue, 18 Jun 2019 12:11:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 hmm 06/12] mm/hmm: Hold on to the mmget for the
 lifetime of the range
Message-ID: <20190618151100.GI6961@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-7-jgg@ziepe.ca>
 <20190615141435.GF17724@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615141435.GF17724@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pqCED5mYNInU5PAv2mesXGcqWFvLrmpHYJb9ulnVVgI=;
 b=nCh2sLXrPktHy5XUJpjTlsCcshtqkRGZMfOua9pN5auRQe260AAMJlewmn5vXSTf2e
 Yc6POt9RnXEBOGGODqrP1rFPH7Cwm6+JhjPT5/rllkwaH/LtoXrRvluoAV6oe4NarBzt
 1k5+QybFYGGCga2ITf4dP/dJkwooOrYiCGgJL9cFPsdHIBZq5pdRYq1+Pz/XBNpoCt7E
 gS6VMSVDRqNygqmTx+TNLNkcy7/motNSfs4g6axRbb+X8ahuJ+lBfs2r0vK6Gb5qHpps
 EtDtwPMeiq+vcBcuwP536GU8VcFj8CLrVVuBc2x1aB7dl4PGOS5QoIPYqgsDjQ7l2cLm
 LZlg==
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

T24gU2F0LCBKdW4gMTUsIDIwMTkgYXQgMDc6MTQ6MzVBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gPiAgCW11dGV4X2xvY2soJmhtbS0+bG9jayk7Cj4gPiAtCWxpc3RfZm9yX2Vh
Y2hfZW50cnkocmFuZ2UsICZobW0tPnJhbmdlcywgbGlzdCkKPiA+IC0JCXJhbmdlLT52YWxpZCA9
IGZhbHNlOwo+ID4gLQl3YWtlX3VwX2FsbCgmaG1tLT53cSk7Cj4gPiArCS8qCj4gPiArCSAqIFNp
bmNlIGhtbV9yYW5nZV9yZWdpc3RlcigpIGhvbGRzIHRoZSBtbWdldCgpIGxvY2sgaG1tX3JlbGVh
c2UoKSBpcwo+ID4gKwkgKiBwcmV2ZW50ZWQgYXMgbG9uZyBhcyBhIHJhbmdlIGV4aXN0cy4KPiA+
ICsJICovCj4gPiArCVdBUk5fT04oIWxpc3RfZW1wdHkoJmhtbS0+cmFuZ2VzKSk7Cj4gPiAgCW11
dGV4X3VubG9jaygmaG1tLT5sb2NrKTsKPiAKPiBUaGlzIGNhbiBqdXN0IHVzZSBsaXN0X2VtcHR5
X2NhcmVmdWwgYW5kIGF2b2lkIHRoZSBsb2NrIGVudGlyZWx5LgoKU3VyZSwgaXQgaXMganVzdCBh
IGRlYnVnZ2luZyBoZWxwZXIgYW5kIHRoZSBtbXB1dCBzaG91bGQgc2VyaWFsaXplCnRoaW5pZ3Mg
ZW5vdWdoIHRvIGJlIHJlbGlhYmxlLiBJIGhhZCB0byBtb3ZlIHRoZSBSQ1UgcGF0Y2ggYWhlYWQg
b2YKdGhpcy4gVGhhbmtzCgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCBh
OWFjZTI4OTg0ZWE0Mi4uMWVkZGRhNDVjZWZhZTcgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBi
L21tL2htbS5jCkBAIC0xMjQsMTMgKzEyNCwxMSBAQCBzdGF0aWMgdm9pZCBobW1fcmVsZWFzZShz
dHJ1Y3QgbW11X25vdGlmaWVyICptbiwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCiAJaWYgKCFrcmVm
X2dldF91bmxlc3NfemVybygmaG1tLT5rcmVmKSkKIAkJcmV0dXJuOwogCi0JbXV0ZXhfbG9jaygm
aG1tLT5sb2NrKTsKIAkvKgogCSAqIFNpbmNlIGhtbV9yYW5nZV9yZWdpc3RlcigpIGhvbGRzIHRo
ZSBtbWdldCgpIGxvY2sgaG1tX3JlbGVhc2UoKSBpcwogCSAqIHByZXZlbnRlZCBhcyBsb25nIGFz
IGEgcmFuZ2UgZXhpc3RzLgogCSAqLwotCVdBUk5fT04oIWxpc3RfZW1wdHkoJmhtbS0+cmFuZ2Vz
KSk7Ci0JbXV0ZXhfdW5sb2NrKCZobW0tPmxvY2spOworCVdBUk5fT04oIWxpc3RfZW1wdHlfY2Fy
ZWZ1bCgmaG1tLT5yYW5nZXMpKTsKIAogCWRvd25fd3JpdGUoJmhtbS0+bWlycm9yc19zZW0pOwog
CW1pcnJvciA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmaG1tLT5taXJyb3JzLCBzdHJ1Y3Qg
aG1tX21pcnJvciwKQEAgLTkzOCw3ICs5MzYsNyBAQCB2b2lkIGhtbV9yYW5nZV91bnJlZ2lzdGVy
KHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogCQlyZXR1cm47CiAKIAltdXRleF9sb2NrKCZobW0t
PmxvY2spOwotCWxpc3RfZGVsKCZyYW5nZS0+bGlzdCk7CisJbGlzdF9kZWxfaW5pdCgmcmFuZ2Ut
Pmxpc3QpOwogCW11dGV4X3VubG9jaygmaG1tLT5sb2NrKTsKIAogCS8qIERyb3AgcmVmZXJlbmNl
IHRha2VuIGJ5IGhtbV9yYW5nZV9yZWdpc3RlcigpICovCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
