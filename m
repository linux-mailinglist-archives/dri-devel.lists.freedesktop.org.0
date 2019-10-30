Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9DFEAC46
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABC76EBF9;
	Thu, 31 Oct 2019 09:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC58B6EBB6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 23:05:23 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba17390001>; Wed, 30 Oct 2019 16:05:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 16:05:23 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 30 Oct 2019 16:05:23 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 23:05:22 +0000
Subject: Re: [PATCH 14/19] vfio, mm: pin_longterm_pages (FOLL_PIN) and
 put_user_page() conversion
To: Andrew Morton <akpm@linux-foundation.org>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-15-jhubbard@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <cfa579f0-999c-9712-494a-9d519bbc4314@nvidia.com>
Date: Wed, 30 Oct 2019 16:05:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191030224930.3990755-15-jhubbard@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572476729; bh=53l+EYxovXaJJmkDDYPwp5PBwN0eKGoaifL7qKM0Mds=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=md/zgeBc2zml8TuAaTKRK2oyv1Btng0H6ozq8zn2sRJiXmTfxKbYsvkGcjK6gQS+q
 3nPYnJq+1Eps5VG6ooIJSjGzkjOCMYIGUlSFcOJoUyjFNZ1H0vd+dWvWBSOqDkH5Uc
 dvFo63nthImmg9iCDmU6xj0EE8b8pgUM6g95EetFKN1/r0QnPl5BygVRpoyVLlCyiH
 iCMwhme/pZSwh1q5oOeHae8CYEOAkIwb1y6ebulV3/7WSgE5bb3SmwuYCg/xWfmbmX
 iPDY0K1xyswztlMvQmBw8+uJFpl2scC5scONZ/nlQeN+ZcWegNbDORlz6y4lLuTxuj
 WJ+vmX9yZfaww==
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
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMzAvMTkgMzo0OSBQTSwgSm9obiBIdWJiYXJkIHdyb3RlOgo+IFRoaXMgYWxzbyBmaXhl
cyBvbmUgb3IgdHdvIGxpa2VseSBidWdzLgoKV2VsbCwgYWN0dWFsbHkganVzdCBvbmUuLi4KCj4g
Cj4gMS4gQ2hhbmdlIHZmaW8gZnJvbSBnZXRfdXNlcl9wYWdlcyhGT0xMX0xPTkdURVJNKSwgdG8K
PiBwaW5fbG9uZ3Rlcm1fcGFnZXMoKSwgd2hpY2ggc2V0cyBib3RoIEZPTExfTE9OR1RFUk0gYW5k
IEZPTExfUElOLgo+IAo+IE5vdGUgdGhhdCB0aGlzIGlzIGEgY2hhbmdlIGluIGJlaGF2aW9yLCBi
ZWNhdXNlIHRoZQo+IGdldF91c2VyX3BhZ2VzX3JlbW90ZSgpIGNhbGwgd2FzIG5vdCBzZXR0aW5n
IEZPTExfTE9OR1RFUk0sIGJ1dCB0aGUKPiBuZXcgcGluX3VzZXJfcGFnZXNfcmVtb3RlKCkgY2Fs
bCB0aGF0IHJlcGxhY2VzIGl0LCAqaXMqIHNldHRpbmcKPiBGT0xMX0xPTkdURVJNLiBJdCBpcyBp
bXBvcnRhbnQgdG8gc2V0IEZPTExfTE9OR1RFUk0sIGJlY2F1c2UgdGhlCj4gRE1BIGNhc2UgcmVx
dWlyZXMgaXQuIFBsZWFzZSBzZWUgdGhlIEZPTExfUElOIGRvY3VtZW50YXRpb24gaW4KPiBpbmNs
dWRlL2xpbnV4L21tLmgsIGFuZCBEb2N1bWVudGF0aW9uL3Bpbl91c2VyX3BhZ2VzLnJzdCBmb3Ig
ZGV0YWlscy4KCkNvcnJlY3Rpb246IHRoZSBhYm92ZSBjb21tZW50IGlzIHN0YWxlIGFuZCB3cm9u
Zy4gSSB3cm90ZSBpdCBiZWZvcmUgCmdldHRpbmcgZnVydGhlciBpbnRvIHRoZSBkZXRhaWxzLCBh
bmQgdGhlIHBhdGNoIGRvZXNuJ3QgZG8gdGhpcy4gCgpJbnN0ZWFkLCBpdCBrZWVwcyBleGFjdGx5
IHRoZSBvbGQgYmVoYXZpb3I6IHBpbl9sb25ndGVybV9wYWdlc19yZW1vdGUoKQppcyBjYXJlZnVs
IHRvIGF2b2lkIHNldHRpbmcgRk9MTF9MT05HVEVSTS4gSW5zdGVhZCBvZiBzZXR0aW5nIHRoYXQg
ZmxhZywKaXQgZHJvcHMgaW4gYSAiVE9ETyIgY29tbWVudCBuZWFyYnkuIDopCgpJJ2xsIHVwZGF0
ZSB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGluIHRoZSBuZXh0IHZlcnNpb24gb2YgdGhlIHNlcmll
cy4KCgp0aGFua3MsCgpKb2huIEh1YmJhcmQKTlZJRElBCgo+IAo+IDIuIEJlY2F1c2UgYWxsIEZP
TExfUElOLWFjcXVpcmVkIHBhZ2VzIG11c3QgYmUgcmVsZWFzZWQgdmlhCj4gcHV0X3VzZXJfcGFn
ZSgpLCBhbHNvIGNvbnZlcnQgdGhlIHB1dF9wYWdlKCkgY2FsbCBvdmVyIHRvCj4gcHV0X3VzZXJf
cGFnZXMoKS4KPiAKPiBOb3RlIHRoYXQgdGhpcyBlZmZlY3RpdmVseSBjaGFuZ2VzIHRoZSBjb2Rl
J3MgYmVoYXZpb3IgaW4KPiB2ZmlvX2lvbW11X3R5cGUxLmM6IHB1dF9wZm4oKTogaXQgbm93IHVs
dGltYXRlbHkgY2FsbHMKPiBzZXRfcGFnZV9kaXJ0eV9sb2NrKCksIGluc3RlYWQgb2Ygc2V0X3Bh
Z2VfZGlydHkoKS4gVGhpcyBpcwo+IHByb2JhYmx5IG1vcmUgYWNjdXJhdGUuCj4gCj4gQXMgQ2hy
aXN0b3BoIEhlbGx3aWcgcHV0IGl0LCAic2V0X3BhZ2VfZGlydHkoKSBpcyBvbmx5IHNhZmUgaWYg
d2UgYXJlCj4gZGVhbGluZyB3aXRoIGEgZmlsZSBiYWNrZWQgcGFnZSB3aGVyZSB3ZSBoYXZlIHJl
ZmVyZW5jZSBvbiB0aGUgaW5vZGUgaXQKPiBoYW5ncyBvZmYuIiBbMV0KPiAKPiBbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDE5MDcyMzE1MzY0MC5HQjcyMEBsc3QuZGUKPiAKPiBDYzog
QWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
dmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCAxNSArKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyBiL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11
X3R5cGUxLmMKPiBpbmRleCBkODY0Mjc3ZWExNmYuLjc5NWUxM2YzZWYwOCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCj4gKysrIGIvZHJpdmVycy92ZmlvL3Zm
aW9faW9tbXVfdHlwZTEuYwo+IEBAIC0zMjcsOSArMzI3LDggQEAgc3RhdGljIGludCBwdXRfcGZu
KHVuc2lnbmVkIGxvbmcgcGZuLCBpbnQgcHJvdCkKPiAgewo+ICAJaWYgKCFpc19pbnZhbGlkX3Jl
c2VydmVkX3BmbihwZm4pKSB7Cj4gIAkJc3RydWN0IHBhZ2UgKnBhZ2UgPSBwZm5fdG9fcGFnZShw
Zm4pOwo+IC0JCWlmIChwcm90ICYgSU9NTVVfV1JJVEUpCj4gLQkJCVNldFBhZ2VEaXJ0eShwYWdl
KTsKPiAtCQlwdXRfcGFnZShwYWdlKTsKPiArCj4gKwkJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9j
aygmcGFnZSwgMSwgcHJvdCAmIElPTU1VX1dSSVRFKTsKPiAgCQlyZXR1cm4gMTsKPiAgCX0KPiAg
CXJldHVybiAwOwo+IEBAIC0zNDksMTEgKzM0OCwxMSBAQCBzdGF0aWMgaW50IHZhZGRyX2dldF9w
Zm4oc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdmFkZHIsCj4gIAo+ICAJZG93
bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwo+ICAJaWYgKG1tID09IGN1cnJlbnQtPm1tKSB7Cj4gLQkJ
cmV0ID0gZ2V0X3VzZXJfcGFnZXModmFkZHIsIDEsIGZsYWdzIHwgRk9MTF9MT05HVEVSTSwgcGFn
ZSwKPiAtCQkJCSAgICAgdm1hcyk7Cj4gKwkJcmV0ID0gcGluX2xvbmd0ZXJtX3BhZ2VzKHZhZGRy
LCAxLCBmbGFncywgcGFnZSwgdm1hcyk7Cj4gIAl9IGVsc2Ugewo+IC0JCXJldCA9IGdldF91c2Vy
X3BhZ2VzX3JlbW90ZShOVUxMLCBtbSwgdmFkZHIsIDEsIGZsYWdzLCBwYWdlLAo+IC0JCQkJCSAg
ICB2bWFzLCBOVUxMKTsKPiArCQlyZXQgPSBwaW5fbG9uZ3Rlcm1fcGFnZXNfcmVtb3RlKE5VTEws
IG1tLCB2YWRkciwgMSwKPiArCQkJCQkJZmxhZ3MsIHBhZ2UsIHZtYXMsCj4gKwkJCQkJCU5VTEwp
Owo+ICAJCS8qCj4gIAkJICogVGhlIGxpZmV0aW1lIG9mIGEgdmFkZHJfZ2V0X3BmbigpIHBhZ2Ug
cGluIGlzCj4gIAkJICogdXNlcnNwYWNlLWNvbnRyb2xsZWQuIEluIHRoZSBmcy1kYXggY2FzZSB0
aGlzIGNvdWxkCj4gQEAgLTM2Myw3ICszNjIsNyBAQCBzdGF0aWMgaW50IHZhZGRyX2dldF9wZm4o
c3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdmFkZHIsCj4gIAkJICovCj4gIAkJ
aWYgKHJldCA+IDAgJiYgdm1hX2lzX2ZzZGF4KHZtYXNbMF0pKSB7Cj4gIAkJCXJldCA9IC1FT1BO
T1RTVVBQOwo+IC0JCQlwdXRfcGFnZShwYWdlWzBdKTsKPiArCQkJcHV0X3VzZXJfcGFnZShwYWdl
WzBdKTsKPiAgCQl9Cj4gIAl9Cj4gIAl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOwo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
