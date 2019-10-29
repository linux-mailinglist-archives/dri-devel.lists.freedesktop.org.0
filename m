Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA713E97C3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDCC6E8CA;
	Wed, 30 Oct 2019 08:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E606EB6E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 13:59:39 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 71so12321518qkl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 06:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8jOH6aTboFzH2FE5ebDVzGbVS8tkTfz/e6O//bI0tkY=;
 b=bmxBD2OAvmOVfnwPNMiN/eVqi7GsYDRIia5VpSzsEeU3fhu94P9XTpfdxmbj+B9ffK
 j8sbwsjutzLq3euMQ0KDL0nRM6k8UIXEFUaohIDeKY47NVDxAo2XIr3Fl6NaihssYAN2
 mV8PbYrtfM/yqkn3vuB+Gtw4N+m0KUs16HzOE/XjXXcyHZMhmrjt49oHqFtpo94QCkX2
 2Diu/vAdMvuPycdAKdHaofdgUuhYXz/3iFT0BRCDBHz4LUmC+Kf0Q2kcjEKIBscXg+0W
 JvFkwsjlmJH/RfsDo3ZAIvTGf6Pyraa9wfWyBBzxcPLy3RDvfphX3pZZy2Ddi4G+ZQFO
 wcSw==
X-Gm-Message-State: APjAAAUYEUTUy5PEzzuyAiG/b9m0RWyqBwlyS0+RDgNTjl8JuPtWI2xP
 /nSghYCS6LE239k+2rB6lRJHdA==
X-Google-Smtp-Source: APXvYqw2t3qlIvqK+Izwy8tw608BKfVw2jgQ/Y0rREEshgcaboVymXi/nbliXAwFtIZ8GNBEqxuwOw==
X-Received: by 2002:a05:620a:8cb:: with SMTP id
 z11mr15146993qkz.72.1572357577964; 
 Tue, 29 Oct 2019 06:59:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id p188sm7446102qkb.33.2019.10.29.06.59.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Oct 2019 06:59:36 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPS24-0005x3-D2; Tue, 29 Oct 2019 10:59:36 -0300
Date: Tue, 29 Oct 2019 10:59:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH v2 13/15] drm/amdgpu: Use mmu_range_insert instead of
 hmm_mirror
Message-ID: <20191029135936.GD6128@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-14-jgg@ziepe.ca>
 <bc44f331-5448-ddc0-ecc3-d0ccb92e11a4@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc44f331-5448-ddc0-ecc3-d0ccb92e11a4@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8jOH6aTboFzH2FE5ebDVzGbVS8tkTfz/e6O//bI0tkY=;
 b=TOjiKaf4drtV5ldH8zR3DdZRftx4pfyMK7aX+WxF+hP7GAklHNLQJLB3u6THZAuUwq
 2J8U2Z8jfa4RHHqJi86VA8XDEEftIwINME4Xcqo7Lwf5TfQ/5CHndbgRjMZBi7ltmTD/
 9/OIdOP+IKZBXBOnw95rEg1RRCcplq0VveMXmbgEcrW0nIfOMVnpZGUZJC/dcmVtrcLp
 GnztoS4X7Cig0PpARFdiBQAFwuPsNE3oq28XslCe7YAiytEpFuhH3cYXFITze125lBn3
 w8SiavcWCCYZB5EGHirP4nTYv97GbqlF/YYAtwW9ZFYvfLIJ06XZktP4ccL77Rn8KbAv
 rdng==
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
Cc: Juergen Gross <jgross@suse.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDc6NTE6MzBBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gPiArc3RhdGljIGJvb2wgYW1kZ3B1X21uX2ludmFsaWRhdGVfZ2Z4KHN0cnVj
dCBtbXVfcmFuZ2Vfbm90aWZpZXIgKm1ybiwKPiA+ICsJCQkJICAgICBjb25zdCBzdHJ1Y3QgbW11
X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPiA+ICAgewo+ID4gLQlzdHJ1Y3QgYW1kZ3B1X2JvICpi
bzsKPiA+ICsJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBjb250YWluZXJfb2YobXJuLCBzdHJ1Y3Qg
YW1kZ3B1X2JvLCBub3RpZmllcik7Cj4gPiArCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
YW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRldik7Cj4gPiAgIAlsb25nIHI7Cj4gPiAgIAo+ID4g
LQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGJvLCAmbm9kZS0+Ym9zLCBtbl9saXN0KSB7Cj4gPiAtCj4g
PiAtCQlpZiAoIWFtZGdwdV90dG1fdHRfYWZmZWN0X3VzZXJwdHIoYm8tPnRiby50dG0sIHN0YXJ0
LCBlbmQpKQo+ID4gLQkJCWNvbnRpbnVlOwo+ID4gLQo+ID4gLQkJciA9IGRtYV9yZXN2X3dhaXRf
dGltZW91dF9yY3UoYm8tPnRiby5iYXNlLnJlc3YsCj4gPiAtCQkJdHJ1ZSwgZmFsc2UsIE1BWF9T
Q0hFRFVMRV9USU1FT1VUKTsKPiA+IC0JCWlmIChyIDw9IDApCj4gPiAtCQkJRFJNX0VSUk9SKCIo
JWxkKSBmYWlsZWQgdG8gd2FpdCBmb3IgdXNlciBib1xuIiwgcik7Cj4gPiAtCX0KPiA+ICsJLyog
RklYTUU6IElzIHRoaXMgbmVjZXNzYXJ5PyAqLwo+IAo+IE1vc3QgbGlrZWx5IG5vdC4KPiAKPiBD
aHJpc3RpYW4uCj4gCj4gPiArCWlmICghYW1kZ3B1X3R0bV90dF9hZmZlY3RfdXNlcnB0cihiby0+
dGJvLnR0bSwgcmFuZ2UtPnN0YXJ0LAo+ID4gKwkJCQkJICByYW5nZS0+ZW5kKSkKPiA+ICsJCXJl
dHVybiB0cnVlOwoKU28gaXMgdGhlIGJvLT50Ym8ubWVtLm51bV9wYWdlcyA9PSBiby0+dGJvLnR0
bS5udW1fcGFnZXMgYWx3YXlzPwoKQW5kIHVzZXJwdHIgY2FuJ3QgYmUgemVybyBoZXJlLCBvciBh
dCBsZWFzdCBpdCBkb2Vzbid0IG1hdHRlciBpZiBpdCBpcz8KCj4gPiArc3RhdGljIGJvb2wgYW1k
Z3B1X21uX2ludmFsaWRhdGVfaHNhKHN0cnVjdCBtbXVfcmFuZ2Vfbm90aWZpZXIgKm1ybiwKPiA+
ICsJCQkJICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPiA+ICAg
ewo+ID4gLQlzdHJ1Y3QgYW1kZ3B1X21uICphbW4gPSBjb250YWluZXJfb2YobWlycm9yLCBzdHJ1
Y3QgYW1kZ3B1X21uLCBtaXJyb3IpOwo+ID4gLQl1bnNpZ25lZCBsb25nIHN0YXJ0ID0gdXBkYXRl
LT5zdGFydDsKPiA+IC0JdW5zaWduZWQgbG9uZyBlbmQgPSB1cGRhdGUtPmVuZDsKPiA+IC0JYm9v
bCBibG9ja2FibGUgPSBtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHVwZGF0ZSk7Cj4gPiAt
CXN0cnVjdCBpbnRlcnZhbF90cmVlX25vZGUgKml0Owo+ID4gLQo+ID4gLQkvKiBub3RpZmljYXRp
b24gaXMgZXhjbHVzaXZlLCBidXQgaW50ZXJ2YWwgaXMgaW5jbHVzaXZlICovCj4gPiAtCWVuZCAt
PSAxOwo+ID4gLQo+ID4gLQkvKiBUT0RPIHdlIHNob3VsZCBiZSBhYmxlIHRvIHNwbGl0IGxvY2tp
bmcgZm9yIGludGVydmFsIHRyZWUgYW5kCj4gPiAtCSAqIGFtZGdwdV9tbl9pbnZhbGlkYXRlX25v
ZGUKPiA+IC0JICovCj4gPiAtCWlmIChhbWRncHVfbW5fcmVhZF9sb2NrKGFtbiwgYmxvY2thYmxl
KSkKPiA+IC0JCXJldHVybiAtRUFHQUlOOwo+ID4gLQo+ID4gLQlpdCA9IGludGVydmFsX3RyZWVf
aXRlcl9maXJzdCgmYW1uLT5vYmplY3RzLCBzdGFydCwgZW5kKTsKPiA+IC0Jd2hpbGUgKGl0KSB7
Cj4gPiAtCQlzdHJ1Y3QgYW1kZ3B1X21uX25vZGUgKm5vZGU7Cj4gPiAtCj4gPiAtCQlpZiAoIWJs
b2NrYWJsZSkgewo+ID4gLQkJCWFtZGdwdV9tbl9yZWFkX3VubG9jayhhbW4pOwo+ID4gLQkJCXJl
dHVybiAtRUFHQUlOOwo+ID4gLQkJfQo+ID4gKwlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IGNvbnRh
aW5lcl9vZihtcm4sIHN0cnVjdCBhbWRncHVfYm8sIG5vdGlmaWVyKTsKPiA+ICsJc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsKPiA+ICAg
Cj4gPiAtCQlub2RlID0gY29udGFpbmVyX29mKGl0LCBzdHJ1Y3QgYW1kZ3B1X21uX25vZGUsIGl0
KTsKPiA+IC0JCWl0ID0gaW50ZXJ2YWxfdHJlZV9pdGVyX25leHQoaXQsIHN0YXJ0LCBlbmQpOwo+
ID4gKwkvKiBGSVhNRTogSXMgdGhpcyBuZWNlc3Nhcnk/ICovCj4gPiArCWlmICghYW1kZ3B1X3R0
bV90dF9hZmZlY3RfdXNlcnB0cihiby0+dGJvLnR0bSwgcmFuZ2UtPnN0YXJ0LAo+ID4gKwkJCQkJ
ICByYW5nZS0+ZW5kKSkKPiA+ICsJCXJldHVybiB0cnVlOwo+ID4gICAKPiA+IC0JCWFtZGdwdV9t
bl9pbnZhbGlkYXRlX25vZGUobm9kZSwgc3RhcnQsIGVuZCk7Cj4gPiAtCX0KClRoaXMgb25lIHRv
byByaWdodD8KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
