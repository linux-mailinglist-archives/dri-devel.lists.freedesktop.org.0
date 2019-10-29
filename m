Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EBBE8DF2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 18:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8365B6EC50;
	Tue, 29 Oct 2019 17:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88EE6EC4F;
 Tue, 29 Oct 2019 17:19:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s1so14578830wro.0;
 Tue, 29 Oct 2019 10:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=+7k6Tgo7zdAI3sdkV2vUab4Qg2cErY2tDGH+QpqLC8g=;
 b=S8hKaTz2G6pztg0JMTKZOTO4zP8wIcoSzmrsuB25x51JUb/xRmmKGJpWXzplNd9r6c
 Umk4q+UM6CatUexvnS0ClpzoxuinMymGe+fZHDl5xfiT1SBcoxpg2M6lkex8Dgs3qa4B
 2W9R4H2YRiq85J4XMhmEGmBzwhMTAwKN6IOxPAL+PGcKeFNXbiClxFd9Z4/+1sAKaG0h
 Mx+RaLF9NPga4sBmwDWQV/w1eW35ajCfuuauUnxsrFAVc/ahoUvnbBaFobrDs3XuuVUk
 ouQHwnGjx5FbfHt1kbbkLVTP67a0IpDqDIv3AesmCnB15MqrkXoCux5F7TFDfFHIamWH
 vKnQ==
X-Gm-Message-State: APjAAAVWdzQ5vAd3pviHoCaZLY5BjLj1y4wmL2a/uitOUIx41hNCYtKw
 IwgMGNr4adLFlJj6F1TDVGE=
X-Google-Smtp-Source: APXvYqyE7qwpgL7KV62AOaDM+oFRQdWcTDjdZKuljhwWYaRRqCfiSc2s9/fNi7ZWZZwXl8hUkkgUgA==
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr20205293wro.234.1572369597497; 
 Tue, 29 Oct 2019 10:19:57 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f8sm3544088wmb.37.2019.10.29.10.19.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Oct 2019 10:19:56 -0700 (PDT)
Subject: Re: [PATCH v2 12/15] drm/amdgpu: Call find_vma under mmap_sem
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-13-jgg@ziepe.ca>
 <a368d1bf-ba69-bb63-2bfd-b674acc2f19b@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cd0507d9-80b9-34fc-1cd3-12d90ee65c21@gmail.com>
Date: Tue, 29 Oct 2019 14:07:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a368d1bf-ba69-bb63-2bfd-b674acc2f19b@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+7k6Tgo7zdAI3sdkV2vUab4Qg2cErY2tDGH+QpqLC8g=;
 b=kMvDAfqNMsgwLVSlQz2HGv5SXkrMFIA/sC5PQVA0qHCk2uNpr3vgteNY32KO6XolN9
 jrYaAZAZBspll0O/IT//xBGYiWDFZD8KU1uPmY2vK3KPsyhTb7mzyGHCGTLByQgbXpOx
 OeloXmN2vq/6bG5ZHNwG845uL6ZvA2Sdmd4uYMZ4E+4NJ7wccdnycw840yvcV4FBt6VL
 /xrA8JLUiBY/5hX+ugxid7ZLni4gqfgl/j7jRF06f5phYKlyiq6OI+yIzaRotZfKsIyc
 R7JU0GMg+/jruClJEMts6SYQJZeL4C+Qp1GS1gxReNthE6HvcZsnnoBEcT3avouO/n1H
 WYQw==
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
Reply-To: christian.koenig@amd.com
Cc: Juergen Gross <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMTAuMTkgdW0gMTc6Mjggc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gT24gMjAxOS0x
MC0yOCA0OjEwIHAubS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4gRnJvbTogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+Pgo+PiBmaW5kX3ZtYSgpIG11c3QgYmUgY2FsbGVk
IHVuZGVyIHRoZSBtbWFwX3NlbSwgcmVvcmdhbml6ZSB0aGlzIGNvZGUgdG8KPj4gZG8gdGhlIHZt
YSBjaGVjayBhZnRlciBlbnRlcmluZyB0aGUgbG9jay4KPj4KPj4gRnVydGhlciwgZml4IHRoZSB1
bmxvY2tlZCB1c2Ugb2Ygc3RydWN0IHRhc2tfc3RydWN0J3MgbW0sIGluc3RlYWQgdXNlCj4+IHRo
ZSBtbSBmcm9tIGhtbV9taXJyb3Igd2hpY2ggaGFzIGFuIGFjdGl2ZSBtbV9ncmFiLiBBbHNvIHRo
ZSBtbV9ncmFiCj4+IG11c3QgYmUgY29udmVydGVkIHRvIGEgbW1fZ2V0IGJlZm9yZSBhY3F1aXJp
bmcgbW1hcF9zZW0gb3IgY2FsbGluZwo+PiBmaW5kX3ZtYSgpLgo+Pgo+PiBGaXhlczogNjZjNDU1
MDBiZmRjICgiZHJtL2FtZGdwdTogdXNlIG5ldyBITU0gQVBJcyBhbmQgaGVscGVycyIpCj4+IEZp
eGVzOiAwOTE5MTk1ZjJiMGQgKCJkcm0vYW1kZ3B1OiBFbmFibGUgYW1kZ3B1X3R0bV90dF9nZXRf
dXNlcl9wYWdlcyBpbiB3b3JrZXIgdGhyZWFkcyIpCj4+IENjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4+IENjOiBEYXZpZCAoQ2h1bk1pbmcpIFpob3UgPERhdmlkMS5aaG91
QGFtZC5jb20+Cj4+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gT25lIHF1ZXN0aW9u
IGlubGluZSB0byBjb25maXJtIG15IHVuZGVyc3RhbmRpbmcuIE90aGVyd2lzZSB0aGlzIHBhdGNo
IGlzCj4KPiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5j
b20+Cj4KPgo+PiAtLS0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jIHwgMzcgKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+PiAgICAxIGZpbGUgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMKPj4gaW5kZXggZGZmNDFkMGE4NWZlOTYuLmMwZTQxZjFmMGMy
MzY1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4+IEBA
IC0zNSw2ICszNSw3IEBACj4+ICAgICNpbmNsdWRlIDxsaW51eC9obW0uaD4KPj4gICAgI2luY2x1
ZGUgPGxpbnV4L3BhZ2VtYXAuaD4KPj4gICAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3Rhc2suaD4K
Pj4gKyNpbmNsdWRlIDxsaW51eC9zY2hlZC9tbS5oPgo+PiAgICAjaW5jbHVkZSA8bGludXgvc2Vx
X2ZpbGUuaD4KPj4gICAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPj4gICAgI2luY2x1ZGUgPGxp
bnV4L3N3YXAuaD4KPj4gQEAgLTc4OCw3ICs3ODksNyBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRf
dXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykKPj4g
ICAgCXN0cnVjdCBobW1fbWlycm9yICptaXJyb3IgPSBiby0+bW4gPyAmYm8tPm1uLT5taXJyb3Ig
OiBOVUxMOwo+PiAgICAJc3RydWN0IHR0bV90dCAqdHRtID0gYm8tPnRiby50dG07Cj4+ICAgIAlz
dHJ1Y3QgYW1kZ3B1X3R0bV90dCAqZ3R0ID0gKHZvaWQgKil0dG07Cj4+IC0Jc3RydWN0IG1tX3N0
cnVjdCAqbW0gPSBndHQtPnVzZXJ0YXNrLT5tbTsKPj4gKwlzdHJ1Y3QgbW1fc3RydWN0ICptbTsK
Pj4gICAgCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSBndHQtPnVzZXJwdHI7Cj4+ICAgIAlzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYTsKPj4gICAgCXN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlOwo+PiBA
QCAtNzk2LDI1ICs3OTcsMTQgQEAgaW50IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3Ry
dWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBwYWdlICoqcGFnZXMpCj4+ICAgIAl1aW50NjRfdCAq
cGZuczsKPj4gICAgCWludCByID0gMDsKPj4gICAgCj4+IC0JaWYgKCFtbSkgLyogSGFwcGVucyBk
dXJpbmcgcHJvY2VzcyBzaHV0ZG93biAqLwo+PiAtCQlyZXR1cm4gLUVTUkNIOwo+PiAtCj4+ICAg
IAlpZiAodW5saWtlbHkoIW1pcnJvcikpIHsKPj4gICAgCQlEUk1fREVCVUdfRFJJVkVSKCJGYWls
ZWQgdG8gZ2V0IGhtbV9taXJyb3JcbiIpOwo+PiAtCQlyID0gLUVGQVVMVDsKPj4gLQkJZ290byBv
dXQ7Cj4+ICsJCXJldHVybiAtRUZBVUxUOwo+PiAgICAJfQo+PiAgICAKPj4gLQl2bWEgPSBmaW5k
X3ZtYShtbSwgc3RhcnQpOwo+PiAtCWlmICh1bmxpa2VseSghdm1hIHx8IHN0YXJ0IDwgdm1hLT52
bV9zdGFydCkpIHsKPj4gLQkJciA9IC1FRkFVTFQ7Cj4+IC0JCWdvdG8gb3V0Owo+PiAtCX0KPj4g
LQlpZiAodW5saWtlbHkoKGd0dC0+dXNlcmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX0FOT05P
TkxZKSAmJgo+PiAtCQl2bWEtPnZtX2ZpbGUpKSB7Cj4+IC0JCXIgPSAtRVBFUk07Cj4+IC0JCWdv
dG8gb3V0Owo+PiAtCX0KPj4gKwltbSA9IG1pcnJvci0+aG1tLT5tbXVfbm90aWZpZXIubW07Cj4+
ICsJaWYgKCFtbWdldF9ub3RfemVybyhtbSkpIC8qIEhhcHBlbnMgZHVyaW5nIHByb2Nlc3Mgc2h1
dGRvd24gKi8KPiBUaGlzIHdvcmtzIGJlY2F1c2UgbWlycm9yLT5obW0tPm1tdV9ub3RpZmllciBo
b2xkcyBhbiBtbWdyYWIgcmVmZXJlbmNlCj4gdG8gdGhlIG1tPyBTbyB0aGUgTU0gd2lsbCBub3Qg
anVzdCBnbyBhd2F5LCBidXQgaWYgdGhlIG1tZ2V0IHJlZmNvdW50IGlzCj4gMCwgaXQgbWVhbnMg
dGhlIG1tIGlzIG1hcmtlZCBmb3IgZGVzdHJ1Y3Rpb24gYW5kIHNob3VsZG4ndCBiZSB1c2VkIGFu
eSBtb3JlLgoKWWVzLCBleGFjdGx5LiBUaGF0IGlzIGEgcmF0aGVyIGNvbW1vbiBwYXR0ZXJuLCBv
bmUgcmVmZXJlbmNlIGNvdW50IGZvciAKdGhlIGZ1bmN0aW9uYWxpdHkgYW5kIG9uZSBmb3IgdGhl
IHN0cnVjdHVyZS4KCldoZW4gdGhlIGZ1bmN0aW9uYWxpdHkgaXMgZ29uZSB0aGUgc3RydWN0dXJl
IG1pZ2h0IHN0aWxsIGJlIGFsaXZlIGZvciAKc29tZSByZWFzb24uIFRUTSBhbmQgYSBjb3VwbGUg
b2Ygb3RoZXIgc3RydWN0dXJlcyB1c2UgdGhlIHNhbWUgYXBwcm9hY2guCgpDaHJpc3RpYW4uCgo+
Cj4KPj4gKwkJcmV0dXJuIC1FU1JDSDsKPj4gICAgCj4+ICAgIAlyYW5nZSA9IGt6YWxsb2Moc2l6
ZW9mKCpyYW5nZSksIEdGUF9LRVJORUwpOwo+PiAgICAJaWYgKHVubGlrZWx5KCFyYW5nZSkpIHsK
Pj4gQEAgLTg0Nyw2ICs4MzcsMTcgQEAgaW50IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMo
c3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBwYWdlICoqcGFnZXMpCj4+ICAgIAlobW1fcmFu
Z2Vfd2FpdF91bnRpbF92YWxpZChyYW5nZSwgSE1NX1JBTkdFX0RFRkFVTFRfVElNRU9VVCk7Cj4+
ICAgIAo+PiAgICAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwo+PiArCXZtYSA9IGZpbmRfdm1h
KG1tLCBzdGFydCk7Cj4+ICsJaWYgKHVubGlrZWx5KCF2bWEgfHwgc3RhcnQgPCB2bWEtPnZtX3N0
YXJ0KSkgewo+PiArCQlyID0gLUVGQVVMVDsKPj4gKwkJZ290byBvdXRfdW5sb2NrOwo+PiArCX0K
Pj4gKwlpZiAodW5saWtlbHkoKGd0dC0+dXNlcmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX0FO
T05PTkxZKSAmJgo+PiArCQl2bWEtPnZtX2ZpbGUpKSB7Cj4+ICsJCXIgPSAtRVBFUk07Cj4+ICsJ
CWdvdG8gb3V0X3VubG9jazsKPj4gKwl9Cj4+ICsKPj4gICAgCXIgPSBobW1fcmFuZ2VfZmF1bHQo
cmFuZ2UsIDApOwo+PiAgICAJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKPj4gICAgCj4+IEBAIC04
NjUsMTUgKzg2NiwxOSBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3Qg
YW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykKPj4gICAgCX0KPj4gICAgCj4+ICAg
IAlndHQtPnJhbmdlID0gcmFuZ2U7Cj4+ICsJbW1wdXQobW0pOwo+PiAgICAKPj4gICAgCXJldHVy
biAwOwo+PiAgICAKPj4gK291dF91bmxvY2s6Cj4+ICsJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsK
Pj4gICAgb3V0X2ZyZWVfcGZuczoKPj4gICAgCWhtbV9yYW5nZV91bnJlZ2lzdGVyKHJhbmdlKTsK
Pj4gICAgCWt2ZnJlZShwZm5zKTsKPj4gICAgb3V0X2ZyZWVfcmFuZ2VzOgo+PiAgICAJa2ZyZWUo
cmFuZ2UpOwo+PiAgICBvdXQ6Cj4+ICsJbW1wdXQobW0pOwo+PiAgICAJcmV0dXJuIHI7Cj4+ICAg
IH0KPj4gICAgCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
