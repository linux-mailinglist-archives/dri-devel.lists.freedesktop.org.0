Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA95DAD3B5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02BD8982E;
	Mon,  9 Sep 2019 07:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DFD6E152
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 22:31:46 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d72de540000>; Fri, 06 Sep 2019 15:31:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 06 Sep 2019 15:31:45 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 06 Sep 2019 15:31:45 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Sep
 2019 22:31:44 +0000
Subject: Re: [PATCH] mm, notifier: Fix early return case for new lockdep
 annotations
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
References: <20190906174730.22462-1-daniel.vetter@ffwll.ch>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <e076dad4-a5f0-d9cc-7611-4892985f95f2@nvidia.com>
Date: Fri, 6 Sep 2019 15:31:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906174730.22462-1-daniel.vetter@ffwll.ch>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1567809108; bh=HMZ0qlWEBQ226w28k44JWwaPPo4f1iFeti/9oDWU1G0=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=cKiY0E1yN7X0N9uQOvluxNcsXjklOOdWSsKNEQJzFwvVuOhhwiSp2iMiyAEyIJOmD
 BbNOqTrKkB+K/AMpJHdkNp6An2OKlfdVg57QX431Su/mfYlRFTMKGe34TSl+VLUxLf
 kXrpfkAZYbhFfBQpBAzM2YwRvhLxtIciId7pvonZQD1rEbZ4MgX8f0mE3iE8er4MTx
 NgCtHIENpw+87hfnh6ykdRYIc2YLZ5sohIGN5OK4F3vZmkem5XZ0hsqqs3PBY5bSKJ
 GYgctkGF6W3oKq4urLWEVnKHa3sBLQElqnm9gZ2ZM4T5SiA4M9xvEpPNeqG/LdlSi6
 Pf19VtL3+4R7w==
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 syzbot+aaedc50d99a03250fe1f@syzkaller.appspotmail.com,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS82LzE5IDEwOjQ3IEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IEkgbWlzc2VkIHRoYXQg
d2hlbiBleHRlbmRpbmcgdGhlIGxvY2tkZXAgYW5ub3RhdGlvbnMgdG8gdGhlCj4gbm9uYmxvY2tp
bmcgY2FzZS4KPiAKPiBJIG1pc3NlZCB0aGlzIHdoaWxlIHRlc3Rpbmcgc2luY2UgaW4gdGhlIGk5
MTUgbW11IG5vdGlmaWVycyBpcyBoaXR0aW5nCj4gYSBuaWNlIGxvY2tkZXAgc3BsYXQgYWxyZWFk
eSBiZWZvcmUgdGhlIHBvaW50IG9mIGdvaW5nIGludG8gb29tIGtpbGxlcgo+IG1vZGUgOi0vCj4g
Cj4gUmVwb3J0ZWQtYnk6IHN5emJvdCthYWVkYzUwZDk5YTAzMjUwZmUxZkBzeXprYWxsZXIuYXBw
c3BvdG1haWwuY29tCj4gRml4ZXM6IGQyYjIxOWVkMDNkNCAoIm1tL21tdV9ub3RpZmllcnM6IGFk
ZCBhIGxvY2tkZXAgbWFwIGZvciBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0L2VuZCIpCj4gQ2M6IEph
c29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91
bmRhdGlvbi5vcmc+Cj4gQ2M6ICJKw6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+
Cj4gQ2M6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiBDYzogSmFzb24g
R3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4gQ2M6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVs
LmNvbT4KPiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IFNlYW4gQ2hyaXN0b3BoZXJzb24g
PHNlYW4uai5jaHJpc3RvcGhlcnNvbkBpbnRlbC5jb20+Cj4gQ2M6IEplYW4tUGhpbGlwcGUgQnJ1
Y2tlciA8amVhbi1waGlsaXBwZUBsaW5hcm8ub3JnPgo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
PiAtLS0KPiAgaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIuaCB8IDUgKysrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIuaCBiL2luY2x1ZGUvbGludXgvbW11X25vdGlm
aWVyLmgKPiBpbmRleCA1YTAzNDE3ZTViZjcuLjRlZGQ5OGIwNjgzNCAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tbXVfbm90
aWZpZXIuaAo+IEBAIC0zNTYsMTMgKzM1NiwxNCBAQCBtbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9y
YW5nZV9zdGFydChzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPiAgc3RhdGljIGlu
bGluZSBpbnQKPiAgbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbm9uYmxvY2so
c3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UpCj4gIHsKPiArCWludCByZXQgPSAwOwo+
ICAJbG9ja19tYXBfYWNxdWlyZSgmX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFy
dF9tYXApOwo+ICAJaWYgKG1tX2hhc19ub3RpZmllcnMocmFuZ2UtPm1tKSkgewo+ICAJCXJhbmdl
LT5mbGFncyAmPSB+TU1VX05PVElGSUVSX1JBTkdFX0JMT0NLQUJMRTsKPiAtCQlyZXR1cm4gX19t
bXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydChyYW5nZSk7Cj4gKwkJcmV0ID0gX19t
bXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydChyYW5nZSk7Cj4gIAl9Cj4gIAlsb2Nr
X21hcF9yZWxlYXNlKCZfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcCk7
Cj4gLQlyZXR1cm4gMDsKPiArCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbmxpbmUg
dm9pZAo+IAoKUmV2aWV3ZWQtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4K
Cgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
