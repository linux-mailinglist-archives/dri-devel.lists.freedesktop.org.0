Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C92312B8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C706E3B7;
	Tue, 28 Jul 2020 19:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0156E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 17:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gAxUDflyYD2Qz0uZDypM7APCGN6LsjUhjSUSWoYLPcY=; b=U8RJ5NSwZQ8iU78q1Zh5y2VxyZ
 KLqWvDt3ijkmQpa/cyxyk4D4lH1X6HTzXUZ8buyclAQa4oFopGO7GizuG8UlZlYXhKf06aO3+jWxW
 L5i2sFLebxgLmSaQiTOm/ba8eK8Vj7kcWqyUDl3TI1/IWRsEE2Nm52OaedKFXHgUc09g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0T9m-0005gL-AT; Tue, 28 Jul 2020 17:12:50 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0T9l-0004gC-Us; Tue, 28 Jul 2020 17:12:50 +0000
Subject: Re: [PATCH v3 4/4] xen: add helpers to allocate unpopulated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-5-roger.pau@citrix.com>
 <b5460659-88a5-c2aa-c339-815d5618bcb5@xen.org>
 <20200728165919.GA7191@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <b1732413-0bd0-6f58-6324-37497347ce5b@xen.org>
Date: Tue, 28 Jul 2020 18:12:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728165919.GA7191@Air-de-Roger>
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9nZXIsCgpPbiAyOC8wNy8yMDIwIDE3OjU5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDI4LCAyMDIwIGF0IDA1OjQ4OjIzUE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4gSGksCj4+Cj4+IE9uIDI3LzA3LzIwMjAgMTA6MTMsIFJvZ2VyIFBhdSBNb25uZSB3
cm90ZToKPj4+IFRvIGJlIHVzZWQgaW4gb3JkZXIgdG8gY3JlYXRlIGZvcmVpZ24gbWFwcGluZ3Mu
IFRoaXMgaXMgYmFzZWQgb24gdGhlCj4+PiBaT05FX0RFVklDRSBmYWNpbGl0eSB3aGljaCBpcyB1
c2VkIGJ5IHBlcnNpc3RlbnQgbWVtb3J5IGRldmljZXMgaW4KPj4+IG9yZGVyIHRvIGNyZWF0ZSBz
dHJ1Y3QgcGFnZXMgYW5kIGtlcm5lbCB2aXJ0dWFsIG1hcHBpbmdzIGZvciB0aGUgSU9NRU0KPj4+
IGFyZWFzIG9mIHN1Y2ggZGV2aWNlcy4gTm90ZSB0aGF0IG9uIGtlcm5lbHMgd2l0aG91dCBzdXBw
b3J0IGZvcgo+Pj4gWk9ORV9ERVZJQ0UgWGVuIHdpbGwgZmFsbGJhY2sgdG8gdXNlIGJhbGxvb25l
ZCBwYWdlcyBpbiBvcmRlciB0bwo+Pj4gY3JlYXRlIGZvcmVpZ24gbWFwcGluZ3MuCj4+Pgo+Pj4g
VGhlIG5ld2x5IGFkZGVkIGhlbHBlcnMgdXNlIHRoZSBzYW1lIHBhcmFtZXRlcnMgYXMgdGhlIGV4
aXN0aW5nCj4+PiB7YWxsb2MvZnJlZX1feGVuYmFsbG9vbmVkX3BhZ2VzIGZ1bmN0aW9ucywgd2hp
Y2ggYWxsb3dzIGZvciBpbi1wbGFjZQo+Pj4gcmVwbGFjZW1lbnQgb2YgdGhlIGNhbGxlcnMuIE9u
Y2UgYSBtZW1vcnkgcmVnaW9uIGhhcyBiZWVuIGFkZGVkIHRvIGJlCj4+PiB1c2VkIGFzIHNjcmF0
Y2ggbWFwcGluZyBzcGFjZSBpdCB3aWxsIG5vIGxvbmdlciBiZSByZWxlYXNlZCwgYW5kIHBhZ2Vz
Cj4+PiByZXR1cm5lZCBhcmUga2VwdCBpbiBhIGxpbmtlZCBsaXN0LiBUaGlzIGFsbG93cyB0byBo
YXZlIGEgYnVmZmVyIG9mCj4+PiBwYWdlcyBhbmQgcHJldmVudHMgcmVzb3J0aW5nIHRvIGZyZXF1
ZW50IGFkZGl0aW9ucyBhbmQgcmVtb3ZhbHMgb2YKPj4+IHJlZ2lvbnMuCj4+Pgo+Pj4gSWYgZW5h
YmxlZCAoYmVjYXVzZSBaT05FX0RFVklDRSBpcyBzdXBwb3J0ZWQpIHRoZSB1c2FnZSBvZiB0aGUg
bmV3Cj4+PiBmdW5jdGlvbmFsaXR5IHVudGFuZ2xlcyBYZW4gYmFsbG9vbiBhbmQgUkFNIGhvdHBs
dWcgZnJvbSB0aGUgdXNhZ2Ugb2YKPj4+IHVucG9wdWxhdGVkIHBoeXNpY2FsIG1lbW9yeSByYW5n
ZXMgdG8gbWFwIGZvcmVpZ24gcGFnZXMsIHdoaWNoIGlzIHRoZQo+Pj4gY29ycmVjdCB0aGluZyB0
byBkbyBpbiBvcmRlciB0byBhdm9pZCBtYXBwaW5ncyBvZiBmb3JlaWduIHBhZ2VzIGRlcGVuZAo+
Pj4gb24gbWVtb3J5IGhvdHBsdWcuCj4+IEkgdGhpbmsgdGhpcyBpcyBnb2luZyB0byBicmVhayBE
b20wIG9uIEFybSBpZiB0aGUga2VybmVsIGhhcyBiZWVuIGJ1aWx0IHdpdGgKPj4gaG90cGx1Zy4g
VGhpcyBpcyBiZWNhdXNlIHlvdSBtYXkgZW5kIHVwIHRvIHJlLXVzZSByZWdpb24gdGhhdCB3aWxs
IGJlIHVzZWQKPj4gZm9yIHRoZSAxOjEgbWFwcGluZyBvZiBhIGZvcmVpZ24gbWFwLgo+Pgo+PiBO
b3RlIHRoYXQgSSBkb24ndCBrbm93IHdoZXRoZXIgaG90cGx1ZyBoYXMgYmVlbiB0ZXN0ZWQgb24g
WGVuIG9uIEFybSB5ZXQuIFNvCj4+IGl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIGJlIGFscmVhZHkg
YnJva2VuLgo+Pgo+PiBNZWFud2hpbGUsIG15IHN1Z2dlc3Rpb24gd291bGQgYmUgdG8gbWFrZSB0
aGUgdXNlIG9mIGhvdHBsdWcgaW4gdGhlIGJhbGxvb24KPj4gY29kZSBjb25kaXRpb25hbCAobWF5
YmUgdXNpbmcgQ09ORklHX0FSTTY0IGFuZCBDT05GSUdfQVJNKT8KPiAKPiBSaWdodCwgdGhpcyBm
ZWF0dXJlIChhbGxvY2F0aW9uIG9mIHVucG9wdWxhdGVkIG1lbW9yeSBzZXBhcmF0ZWQgZnJvbQo+
IHRoZSBiYWxsb29uIGRyaXZlcikgaXMgY3VycmVudGx5IGdhdGVkIG9uIENPTkZJR19aT05FX0RF
VklDRSwgd2hpY2ggSQo+IHRoaW5rIGNvdWxkIGJlIHVzZWQgb24gQXJtLgo+IAo+IElNTyB0aGUg
cmlnaHQgc29sdXRpb24gc2VlbXMgdG8gYmUgdG8gc3VidHJhY3QgdGhlIHBoeXNpY2FsIG1lbW9y
eQo+IHJlZ2lvbnMgdGhhdCBjYW4gYmUgdXNlZCBmb3IgdGhlIGlkZW50aXR5IG1hcHBpbmdzIG9m
IGZvcmVpZ24gcGFnZXMKPiAoYWxsIFJBTSBvbiB0aGUgc3lzdGVtIEFGQUlDVCkgZnJvbSBpb21l
bV9yZXNvdXJjZSwgYXMgdGhhdCB3b3VsZCBtYWtlCj4gdGhpcyBhbmQgdGhlIG1lbW9yeSBob3Rw
bHVnIGRvbmUgaW4gdGhlIGJhbGxvb24gZHJpdmVyIHNhZmU/CgpEb20wIGRvZXNuJ3Qga25vdyB0
aGUgcmVnaW9ucyB1c2VkIGZvciB0aGUgaWRlbnRpdHkgbWFwcGluZ3MgYXMgdGhpcyBpcyAKb25s
eSBtYW5hZ2VkIGJ5IFhlbi4gU28gdGhlcmUgaXMgbm90aGluZyB5b3UgY2FuIHJlYWxseSBkbyBo
ZXJlLgoKQnV0IGRvbid0IHlvdSBoYXZlIHRoZSBzYW1lIGlzc3VlIG9uIHg4NiB3aXRoICJtYWdp
YyBwYWdlcyI/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
