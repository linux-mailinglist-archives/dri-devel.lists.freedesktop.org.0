Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE3FC136
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF826E372;
	Thu, 14 Nov 2019 08:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4EF6E0F8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 13:02:05 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y10so2472642qto.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 05:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oMayMeIif+74vqoR9Hg244XFAjXhPl1nedXCyPx66Cc=;
 b=VZD3um6ARW/OVYPeCxCjJbVsPZxtpkOqh1XBTnVfWr3uiWGteocHyLDxI5H9r4fn/a
 Pu8ORX7jhkYPNA7fpebcALn7Wo1G+/pwWqEQS0rfVK44PoQ6c0k2z6eyoeKXF1BcwBoE
 YZ/UwdaCgjO2l9k6ekilv58U48LURKQlZWoITvHV0IpJzx4I8EcL6ljw8yyfKxmYTC7T
 JgYaS6rkmFAOwSviGuqjSf9Or4SqzzvqSwkbONt2RDlgCau6qXwm8tj9eOzoyQYMhCwY
 gusBt2njbAHKyA+at9PO4577rP8UnKpjBBIOtJLLDVda+Uyh6Is+pMoXpt7dvMlsBrLX
 PENQ==
X-Gm-Message-State: APjAAAXdG7msicze8PJI+ucMbSNo3ma45lLRaNYNx8dM20x2QCRf/HH4
 TFPiUP/LXLXCchl/QXusgZtYzw==
X-Google-Smtp-Source: APXvYqwGbusmGQAfGHn3CXk2dU2JO4knhTY4prDGLzmyu8apMpc1WOd3WOgt9K6JkDyAWe/3c1LxDA==
X-Received: by 2002:ac8:724f:: with SMTP id l15mr2476006qtp.234.1573650124104; 
 Wed, 13 Nov 2019 05:02:04 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id 187sm918223qkk.103.2019.11.13.05.02.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 13 Nov 2019 05:02:03 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUsHa-000767-Jc; Wed, 13 Nov 2019 09:02:02 -0400
Date: Wed, 13 Nov 2019 09:02:02 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
Message-ID: <20191113130202.GA26068@ziepe.ca>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-9-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-9-jhubbard@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oMayMeIif+74vqoR9Hg244XFAjXhPl1nedXCyPx66Cc=;
 b=nx3682LY4M40wGJ/sVGEu1B6oRowx3yCQZUXaDyQPZ8wp2PPM1JbbnvXpnwJ+1w7kN
 lveYAqZtu6ZiCNE2GeOgCzqCbaPveYJh+bEnyDI89VRNGCHDXS9A7L5ZDDa96GF+3bm0
 VmapuAT4FqF5vTUEuSGlcRA+NIY79GOrBmWnh2u551hGbiYfLURBD9nS87LvoXBLbrK0
 o1TB/3BSIGkHlZVczCO3ubOoj5u0dVQwEYLzu7svoxCzx/+RmvcCH+ACjaNBf3sl94Zf
 NRZR8twQGuvzHtghZ4nzQu/TUj0hyyqfJ3dXa+O6cdFNGC6w6BZNjOabe9aQdvwtecNu
 AUCw==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDg6MjY6NTVQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IEFzIGl0IHNheXMgaW4gdGhlIHVwZGF0ZWQgY29tbWVudCBpbiBndXAuYzogY3VycmVu
dCBGT0xMX0xPTkdURVJNCj4gYmVoYXZpb3IgaXMgaW5jb21wYXRpYmxlIHdpdGggRkFVTFRfRkxB
R19BTExPV19SRVRSWSBiZWNhdXNlIG9mIHRoZQo+IEZTIERBWCBjaGVjayByZXF1aXJlbWVudCBv
biB2bWFzLgo+IAo+IEhvd2V2ZXIsIHRoZSBjb3JyZXNwb25kaW5nIHJlc3RyaWN0aW9uIGluIGdl
dF91c2VyX3BhZ2VzX3JlbW90ZSgpIHdhcwo+IHNsaWdodGx5IHN0cmljdGVyIHRoYW4gaXMgYWN0
dWFsbHkgcmVxdWlyZWQ6IGl0IGZvcmJhZGUgYWxsCj4gRk9MTF9MT05HVEVSTSBjYWxsZXJzLCBi
dXQgd2UgY2FuIGFjdHVhbGx5IGFsbG93IEZPTExfTE9OR1RFUk0gY2FsbGVycwo+IHRoYXQgZG8g
bm90IHNldCB0aGUgImxvY2tlZCIgYXJnLgo+IAo+IFVwZGF0ZSB0aGUgY29kZSBhbmQgY29tbWVu
dHMgYWNjb3JkaW5nbHksIGFuZCB1cGRhdGUgdGhlIFZGSU8gY2FsbGVyCj4gdG8gdGFrZSBhZHZh
bnRhZ2Ugb2YgdGhpcywgZml4aW5nIGEgYnVnIGFzIGEgcmVzdWx0OiB0aGUgVkZJTyBjYWxsZXIK
PiBpcyBsb2dpY2FsbHkgYSBGT0xMX0xPTkdURVJNIHVzZXIuCj4gCj4gQWxzbywgcmVtb3ZlIGFu
IHVubmVzc2FyeSBwYWlyIG9mIGNhbGxzIHRoYXQgd2VyZSByZWxlYXNpbmcgYW5kCj4gcmVhY3F1
aXJpbmcgdGhlIG1tYXBfc2VtLiBUaGVyZSBpcyBubyBuZWVkIHRvIGF2b2lkIGhvbGRpbmcgbW1h
cF9zZW0KPiBqdXN0IGluIG9yZGVyIHRvIGNhbGwgcGFnZV90b19wZm4oKS4KPiAKPiBBbHNvLCBt
b3ZlIHRoZSBEQVggY2hlY2sgKCJpZiBhIFZNQSBpcyBEQVgsIGRvbid0IGFsbG93IGxvbmcgdGVy
bQo+IHBpbm5pbmciKSBmcm9tIHRoZSBWRklPIGNhbGwgc2l0ZSwgYWxsIHRoZSB3YXkgaW50byB0
aGUgaW50ZXJuYWxzCj4gb2YgZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKCkgYW5kIF9fZ3VwX2xvbmd0
ZXJtX2xvY2tlZCgpLiBUaGF0IGlzOgo+IGdldF91c2VyX3BhZ2VzX3JlbW90ZSgpIGNhbGxzIF9f
Z3VwX2xvbmd0ZXJtX2xvY2tlZCgpLCB3aGljaCBpbiB0dXJuCj4gY2FsbHMgY2hlY2tfZGF4X3Zt
YXMoKS4gSXQncyBsaWdodGx5IGV4cGxhaW5lZCBpbiB0aGUgY29tbWVudHMgYXMgd2VsbC4KPiAK
PiBUaGFua3MgdG8gSmFzb24gR3VudGhvcnBlIGZvciBwb2ludGluZyBvdXQgYSBjbGVhbiB3YXkg
dG8gZml4IHRoaXMsCj4gYW5kIHRvIERhbiBXaWxsaWFtcyBmb3IgaGVscGluZyBjbGFyaWZ5IHRo
ZSBEQVggcmVmYWN0b3JpbmcuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpn
Z0B6aWVwZS5jYT4KPiBDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+
Cj4gQ2M6IEplcm9tZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogSXJhIFdlaW55
IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1
YmJhcmRAbnZpZGlhLmNvbT4KPiAgZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyB8IDI1
ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgbW0vZ3VwLmMgICAgICAgICAgICAgICAgICAg
ICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKystLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDI0IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlw
ZTEuYwo+IGluZGV4IGQ4NjQyNzdlYTE2Zi4uNzMwMWI3MTBjOWE0IDEwMDY0NAo+ICsrKyBiL2Ry
aXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKPiBAQCAtMzQwLDcgKzM0MCw2IEBAIHN0YXRp
YyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2
YWRkciwKPiAgewo+ICAJc3RydWN0IHBhZ2UgKnBhZ2VbMV07Cj4gIAlzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYTsKPiAtCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hc1sxXTsKPiAgCXVuc2ln
bmVkIGludCBmbGFncyA9IDA7Cj4gIAlpbnQgcmV0Owo+ICAKPiBAQCAtMzQ4LDMzICszNDcsMTMg
QEAgc3RhdGljIGludCB2YWRkcl9nZXRfcGZuKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25l
ZCBsb25nIHZhZGRyLAo+ICAJCWZsYWdzIHw9IEZPTExfV1JJVEU7Cj4gIAo+ICAJZG93bl9yZWFk
KCZtbS0+bW1hcF9zZW0pOwo+IC0JaWYgKG1tID09IGN1cnJlbnQtPm1tKSB7Cj4gLQkJcmV0ID0g
Z2V0X3VzZXJfcGFnZXModmFkZHIsIDEsIGZsYWdzIHwgRk9MTF9MT05HVEVSTSwgcGFnZSwKPiAt
CQkJCSAgICAgdm1hcyk7Cj4gLQl9IGVsc2Ugewo+IC0JCXJldCA9IGdldF91c2VyX3BhZ2VzX3Jl
bW90ZShOVUxMLCBtbSwgdmFkZHIsIDEsIGZsYWdzLCBwYWdlLAo+IC0JCQkJCSAgICB2bWFzLCBO
VUxMKTsKPiAtCQkvKgo+IC0JCSAqIFRoZSBsaWZldGltZSBvZiBhIHZhZGRyX2dldF9wZm4oKSBw
YWdlIHBpbiBpcwo+IC0JCSAqIHVzZXJzcGFjZS1jb250cm9sbGVkLiBJbiB0aGUgZnMtZGF4IGNh
c2UgdGhpcyBjb3VsZAo+IC0JCSAqIGxlYWQgdG8gaW5kZWZpbml0ZSBzdGFsbHMgaW4gZmlsZXN5
c3RlbSBvcGVyYXRpb25zLgo+IC0JCSAqIERpc2FsbG93IGF0dGVtcHRzIHRvIHBpbiBmcy1kYXgg
cGFnZXMgdmlhIHRoaXMKPiAtCQkgKiBpbnRlcmZhY2UuCj4gLQkJICovCj4gLQkJaWYgKHJldCA+
IDAgJiYgdm1hX2lzX2ZzZGF4KHZtYXNbMF0pKSB7Cj4gLQkJCXJldCA9IC1FT1BOT1RTVVBQOwo+
IC0JCQlwdXRfcGFnZShwYWdlWzBdKTsKPiAtCQl9Cj4gLQl9Cj4gLQl1cF9yZWFkKCZtbS0+bW1h
cF9zZW0pOwo+IC0KPiArCXJldCA9IGdldF91c2VyX3BhZ2VzX3JlbW90ZShOVUxMLCBtbSwgdmFk
ZHIsIDEsIGZsYWdzIHwgRk9MTF9MT05HVEVSTSwKPiArCQkJCSAgICBwYWdlLCBOVUxMLCBOVUxM
KTsKPiAgCWlmIChyZXQgPT0gMSkgewo+ICAJCSpwZm4gPSBwYWdlX3RvX3BmbihwYWdlWzBdKTsK
PiAgCQlyZXR1cm4gMDsKCk1pbmQgdGhlIHJldHVybiB3aXRoIHRoZSBsb2NrIGhlbGQgdGhpcyBu
ZWVkcyBzb21lIGdvdG8gdW53aW5kCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
