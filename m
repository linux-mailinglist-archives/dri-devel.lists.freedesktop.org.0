Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D57EE652
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 18:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F379F6E7A2;
	Mon,  4 Nov 2019 17:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E326E7A2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 17:42:12 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-XL6FPTikNZSBZoFGdWe7Ow-1; Mon, 04 Nov 2019 12:42:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77158107ACC2;
 Mon,  4 Nov 2019 17:42:03 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6427A5D6C8;
 Mon,  4 Nov 2019 17:41:57 +0000 (UTC)
Date: Mon, 4 Nov 2019 12:41:55 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 08/18] mm/process_vm_access: set FOLL_PIN via
 pin_user_pages_remote()
Message-ID: <20191104174155.GE5134@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-9-jhubbard@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-9-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: XL6FPTikNZSBZoFGdWe7Ow-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572889331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jx5P8upI6dI7oz+S3BNibk79bUjpeE+hNekAqjPP73c=;
 b=KqpQJptNv8+VCoCYgSVg0VArGRw30uivWKEdlAc1WfHpnkSr4S7ggMDNM9ukMYCvkhJlsQ
 ZaqOsJ64uTmKJ7Wq5bKk9yk9jF6PmgSudCEugow/TiOBO77aETV94QMJ+nqz/fbKTC0Dc4
 DlfHSB9DgXEwL3FrHFDqcAjal752VmY=
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMDMsIDIwMTkgYXQgMDE6MTg6MDNQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IENvbnZlcnQgcHJvY2Vzc192bV9hY2Nlc3MgdG8gdXNlIHRoZSBuZXcgcGluX3VzZXJf
cGFnZXNfcmVtb3RlKCkKPiBjYWxsLCB3aGljaCBzZXRzIEZPTExfUElOLiBTZXR0aW5nIEZPTExf
UElOIGlzIG5vdyByZXF1aXJlZCBmb3IKPiBjb2RlIHRoYXQgcmVxdWlyZXMgdHJhY2tpbmcgb2Yg
cGlubmVkIHBhZ2VzLgo+IAo+IEFsc28sIHJlbGVhc2UgdGhlIHBhZ2VzIHZpYSBwdXRfdXNlcl9w
YWdlKigpLgo+IAo+IEFsc28sIHJlbmFtZSAicGFnZXMiIHRvICJwaW5uZWRfcGFnZXMiLCBhcyB0
aGlzIG1ha2VzIGZvcgo+IGVhc2llciByZWFkaW5nIG9mIHByb2Nlc3Nfdm1fcndfc2luZ2xlX3Zl
YygpLgo+IAo+IFJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKUmV2aWV3
ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgoKPiAtLS0KPiAgbW0v
cHJvY2Vzc192bV9hY2Nlc3MuYyB8IDI4ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9tbS9wcm9jZXNzX3ZtX2FjY2Vzcy5jIGIvbW0vcHJvY2Vzc192bV9hY2Nlc3Mu
Ywo+IGluZGV4IDM1N2FhN2JlZjZjMC4uZmQyMGFiNjc1Yjg1IDEwMDY0NAo+IC0tLSBhL21tL3By
b2Nlc3Nfdm1fYWNjZXNzLmMKPiArKysgYi9tbS9wcm9jZXNzX3ZtX2FjY2Vzcy5jCj4gQEAgLTQy
LDEyICs0MiwxMSBAQCBzdGF0aWMgaW50IHByb2Nlc3Nfdm1fcndfcGFnZXMoc3RydWN0IHBhZ2Ug
KipwYWdlcywKPiAgCQlpZiAoY29weSA+IGxlbikKPiAgCQkJY29weSA9IGxlbjsKPiAgCj4gLQkJ
aWYgKHZtX3dyaXRlKSB7Cj4gKwkJaWYgKHZtX3dyaXRlKQo+ICAJCQljb3BpZWQgPSBjb3B5X3Bh
Z2VfZnJvbV9pdGVyKHBhZ2UsIG9mZnNldCwgY29weSwgaXRlcik7Cj4gLQkJCXNldF9wYWdlX2Rp
cnR5X2xvY2socGFnZSk7Cj4gLQkJfSBlbHNlIHsKPiArCQllbHNlCj4gIAkJCWNvcGllZCA9IGNv
cHlfcGFnZV90b19pdGVyKHBhZ2UsIG9mZnNldCwgY29weSwgaXRlcik7Cj4gLQkJfQo+ICsKPiAg
CQlsZW4gLT0gY29waWVkOwo+ICAJCWlmIChjb3BpZWQgPCBjb3B5ICYmIGlvdl9pdGVyX2NvdW50
KGl0ZXIpKQo+ICAJCQlyZXR1cm4gLUVGQVVMVDsKPiBAQCAtOTYsNyArOTUsNyBAQCBzdGF0aWMg
aW50IHByb2Nlc3Nfdm1fcndfc2luZ2xlX3ZlYyh1bnNpZ25lZCBsb25nIGFkZHIsCj4gIAkJZmxh
Z3MgfD0gRk9MTF9XUklURTsKPiAgCj4gIAl3aGlsZSAoIXJjICYmIG5yX3BhZ2VzICYmIGlvdl9p
dGVyX2NvdW50KGl0ZXIpKSB7Cj4gLQkJaW50IHBhZ2VzID0gbWluKG5yX3BhZ2VzLCBtYXhfcGFn
ZXNfcGVyX2xvb3ApOwo+ICsJCWludCBwaW5uZWRfcGFnZXMgPSBtaW4obnJfcGFnZXMsIG1heF9w
YWdlc19wZXJfbG9vcCk7Cj4gIAkJaW50IGxvY2tlZCA9IDE7Cj4gIAkJc2l6ZV90IGJ5dGVzOwo+
ICAKPiBAQCAtMTA2LDE0ICsxMDUsMTUgQEAgc3RhdGljIGludCBwcm9jZXNzX3ZtX3J3X3Npbmds
ZV92ZWModW5zaWduZWQgbG9uZyBhZGRyLAo+ICAJCSAqIGN1cnJlbnQvY3VycmVudC0+bW0KPiAg
CQkgKi8KPiAgCQlkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7Cj4gLQkJcGFnZXMgPSBnZXRfdXNl
cl9wYWdlc19yZW1vdGUodGFzaywgbW0sIHBhLCBwYWdlcywgZmxhZ3MsCj4gLQkJCQkJICAgICAg
cHJvY2Vzc19wYWdlcywgTlVMTCwgJmxvY2tlZCk7Cj4gKwkJcGlubmVkX3BhZ2VzID0gcGluX3Vz
ZXJfcGFnZXNfcmVtb3RlKHRhc2ssIG1tLCBwYSwgcGlubmVkX3BhZ2VzLAo+ICsJCQkJCQkgICAg
IGZsYWdzLCBwcm9jZXNzX3BhZ2VzLAo+ICsJCQkJCQkgICAgIE5VTEwsICZsb2NrZWQpOwo+ICAJ
CWlmIChsb2NrZWQpCj4gIAkJCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7Cj4gLQkJaWYgKHBhZ2Vz
IDw9IDApCj4gKwkJaWYgKHBpbm5lZF9wYWdlcyA8PSAwKQo+ICAJCQlyZXR1cm4gLUVGQVVMVDsK
PiAgCj4gLQkJYnl0ZXMgPSBwYWdlcyAqIFBBR0VfU0laRSAtIHN0YXJ0X29mZnNldDsKPiArCQli
eXRlcyA9IHBpbm5lZF9wYWdlcyAqIFBBR0VfU0laRSAtIHN0YXJ0X29mZnNldDsKPiAgCQlpZiAo
Ynl0ZXMgPiBsZW4pCj4gIAkJCWJ5dGVzID0gbGVuOwo+ICAKPiBAQCAtMTIyLDEwICsxMjIsMTIg
QEAgc3RhdGljIGludCBwcm9jZXNzX3ZtX3J3X3NpbmdsZV92ZWModW5zaWduZWQgbG9uZyBhZGRy
LAo+ICAJCQkJCSB2bV93cml0ZSk7Cj4gIAkJbGVuIC09IGJ5dGVzOwo+ICAJCXN0YXJ0X29mZnNl
dCA9IDA7Cj4gLQkJbnJfcGFnZXMgLT0gcGFnZXM7Cj4gLQkJcGEgKz0gcGFnZXMgKiBQQUdFX1NJ
WkU7Cj4gLQkJd2hpbGUgKHBhZ2VzKQo+IC0JCQlwdXRfcGFnZShwcm9jZXNzX3BhZ2VzWy0tcGFn
ZXNdKTsKPiArCQlucl9wYWdlcyAtPSBwaW5uZWRfcGFnZXM7Cj4gKwkJcGEgKz0gcGlubmVkX3Bh
Z2VzICogUEFHRV9TSVpFOwo+ICsKPiArCQkvKiBJZiB2bV93cml0ZSBpcyBzZXQsIHRoZSBwYWdl
cyBuZWVkIHRvIGJlIG1hZGUgZGlydHk6ICovCj4gKwkJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9j
ayhwcm9jZXNzX3BhZ2VzLCBwaW5uZWRfcGFnZXMsCj4gKwkJCQkJICB2bV93cml0ZSk7Cj4gIAl9
Cj4gIAo+ICAJcmV0dXJuIHJjOwo+IC0tIAo+IDIuMjMuMAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
