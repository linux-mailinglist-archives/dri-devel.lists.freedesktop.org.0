Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722FE3A5C8
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F2589308;
	Sun,  9 Jun 2019 12:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E73890E8;
 Fri,  7 Jun 2019 22:13:01 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfae15d0000>; Fri, 07 Jun 2019 15:12:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 15:13:00 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 15:13:00 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 7 Jun 2019 22:13:00 +0000
Subject: Re: [PATCH v2 hmm 05/11] mm/hmm: Remove duplicate condition test
 before wait_event_timeout
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-6-jgg@ziepe.ca>
 <6833be96-12a3-1a1c-1514-c148ba2dd87b@nvidia.com>
 <20190607191302.GR14802@ziepe.ca>
 <e17aa8c5-790c-d977-2eb8-c18cdaa4cbb3@nvidia.com>
 <20190607204427.GU14802@ziepe.ca>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <ba55e382-c982-8e50-4ee7-7f05c9f7fafa@nvidia.com>
Date: Fri, 7 Jun 2019 15:13:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190607204427.GU14802@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559945565; bh=w3a7b9rytavrVqWAu68ZTBiYbQdXk8HyDqOvXxODynI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=CWdWEdXPdbaJqJvgBK8un2hHaJjvd5blgVCjnqh9s/ui4hx87u/PJ98EsE3qmq6Qu
 1W50vUYw1wY0Qu8QqArvY53uYzlLZ8EkYK+2k62MiFKOdIsVhEE7Gzv4g3wnvDXtD5
 8pYFkrEtJoIqZ9LyuyvmlNSpvhmXLsYcW9r73wlDH8OG6Pl1/sKkUaQ2HV6PkV61/Z
 efjBqzJjkpXoY7LY2JKKbOGi0PFCKWjp0sHy67fAO92y2bEogWuGzdZmw1y4bzEVGW
 tmZOCvZJeqxrnQZ9gAn/6QduMPBBZq+PkRyjmTnXOJhExey4BRW0jLc8st2oDC44/D
 qk8qFJQluW+dQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvNy8xOSAxOjQ0IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gRnJpLCBKdW4g
MDcsIDIwMTkgYXQgMDE6MjE6MTJQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwgd3JvdGU6Cj4gCj4+
PiBXaGF0IEkgd2FudCB0byBnZXQgdG8gaXMgYSBwYXR0ZXJuIGxpa2UgdGhpczoKPj4+Cj4+PiBw
YWdlZmF1bHQoKToKPj4+Cj4+PiAgICAgIGhtbV9yYW5nZV9yZWdpc3RlcigmcmFuZ2UpOwo+Pj4g
YWdhaW46Cj4+PiAgICAgIC8qIE9uIHRoZSBzbG93IHBhdGgsIGlmIHdlIGFwcGVhciB0byBiZSBs
aXZlIGxvY2tlZCB0aGVuIHdlIGdldAo+Pj4gICAgICAgICB0aGUgd3JpdGUgc2lkZSBvZiBtbWFw
X3NlbSB3aGljaCB3aWxsIGJyZWFrIHRoZSBsaXZlIGxvY2ssCj4+PiAgICAgICAgIG90aGVyd2lz
ZSB0aGlzIGdldHMgdGhlIHJlYWQgbG9jayAqLwo+Pj4gICAgICBpZiAoaG1tX3JhbmdlX3N0YXJ0
X2FuZF9sb2NrKCZyYW5nZSkpCj4+PiAgICAgICAgICAgIGdvdG8gZXJyOwo+Pj4KPj4+ICAgICAg
bG9ja2RlcF9hc3NlcnRfaGVsZChyYW5nZS0+bW0tPm1tYXBfc2VtKTsKPj4+Cj4+PiAgICAgIC8v
IE9wdGlvbmFsOiBBdm9pZCB1c2VsZXNzIGV4cGVuc2l2ZSB3b3JrCj4+PiAgICAgIGlmIChobW1f
cmFuZ2VfbmVlZHNfcmV0cnkoJnJhbmdlKSkKPj4+ICAgICAgICAgZ290byBhZ2FpbjsKPj4+ICAg
ICAgaG1tX3JhbmdlXyh0b3VjaCB2bWFzKQo+Pj4KPj4+ICAgICAgdGFrZV9sb2NrKGRyaXZlci0+
dXBkYXRlKTsKPj4+ICAgICAgaWYgKGhtbV9yYW5nZV9lbmQoJnJhbmdlKSB7Cj4+PiAgICAgICAg
ICByZWxlYXNlX2xvY2soZHJpdmVyLT51cGRhdGUpOwo+Pj4gICAgICAgICAgZ290byBhZ2FpbjsK
Pj4+ICAgICAgfQo+Pj4gICAgICAvLyBGaW5pc2ggZHJpdmVyIHVwZGF0ZXMKPj4+ICAgICAgcmVs
ZWFzZV9sb2NrKGRyaXZlci0+dXBkYXRlKTsKPj4+Cj4+PiAgICAgIC8vIFJlbGVhc2VzIG1tYXBf
c2VtCj4+PiAgICAgIGhtbV9yYW5nZV91bnJlZ2lzdGVyX2FuZF91bmxvY2soJnJhbmdlKTsKPj4+
Cj4+PiBXaGF0IGRvIHlvdSB0aGluaz8KPj4+Cj4+PiBJcyBpdCBjbGVhcj8KPj4+Cj4+PiBKYXNv
bgo+Pj4KPj4KPj4gQXJlIHlvdSB0YWxraW5nIGFib3V0IGFjcXVpcmluZyBtbWFwX3NlbSBpbiBo
bW1fcmFuZ2Vfc3RhcnRfYW5kX2xvY2soKT8KPj4gVXN1YWxseSwgdGhlIGZhdWx0IGNvZGUgaGFz
IHRvIGxvY2sgbW1hcF9zZW0gZm9yIHJlYWQgaW4gb3JkZXIgdG8KPj4gY2FsbCBmaW5kX3ZtYSgp
IHNvIGl0IGNhbiBzZXQgcmFuZ2Uudm1hLgo+IAo+PiBJZiBITU0gZHJvcHMgbW1hcF9zZW0gLSB3
aGljaCBJIGRvbid0IHRoaW5rIGl0IHNob3VsZCwganVzdCByZXR1cm4gYW4KPj4gZXJyb3IgdG8g
dGVsbCB0aGUgY2FsbGVyIHRvIGRyb3AgbW1hcF9zZW0gYW5kIHJldHJ5IC0gdGhlIGZpbmRfdm1h
KCkKPj4gd2lsbCBuZWVkIHRvIGJlIHJlcGVhdGVkIGFzIHdlbGwuCj4gCj4gT3ZlcmFsbCBJIGRv
bid0IHRoaW5rIGl0IG1ha2VzIGEgbG90IG9mIHNlbnNlIHRvIHNsZWVwIGZvciByZXRyeSBpbgo+
IGhtbV9yYW5nZV9zdGFydF9hbmRfbG9jaygpIHdoaWxlIGhvbGRpbmcgbW1hcF9zZW0uIEl0IHdv
dWxkIGJlIGJldHRlcgo+IHRvIGRyb3AgdGhhdCBsb2NrLCBzbGVlcCwgdGhlbiByZS1hY3F1aXJl
IGl0IGFzIHBhcnQgb2YgdGhlIGhtbSBsb2dpYy4KPiAKPiBUaGUgZmluZF92bWEgc2hvdWxkIGJl
IGRvbmUgaW5zaWRlIHRoZSBjcml0aWNhbCBzZWN0aW9uIGNyZWF0ZWQgYnkKPiBobW1fcmFuZ2Vf
c3RhcnRfYW5kX2xvY2soKSwgbm90IGJlZm9yZSBpdC4gSWYgd2UgYXJlIHJldHJ5aW5nIHRoZW4g
d2UKPiBhbHJlYWR5IHNsZXB0IGFuZCB0aGUgYWRkaXRpb25hbCBDUFUgY29zdCB0byByZXBlYXQg
dGhlIGZpbmRfdm1hIGlzCj4gaW1tYXRlcmlhbCwgSU1ITz8KPiAKPiBEbyB5b3Ugc2VlIGEgcmVh
c29uIHdoeSB0aGUgZmluZF92bWEoKSBldmVyIG5lZWRzIHRvIGJlIGJlZm9yZSB0aGUKPiAnYWdh
aW4nIGluIG15IGFib3ZlIGV4YW1wbGU/IHJhbmdlLnZtYSBkb2VzIG5vdCBuZWVkIHRvIGJlIHNl
dCBmb3IKPiByYW5nZV9yZWdpc3Rlci4KClllcywgZm9yIHRoZSBHUFUgY2FzZSwgdGhlcmUgY2Fu
IGJlIG1hbnkgZmF1bHRzIGluIGFuIGV2ZW50IHF1ZXVlCmFuZCB0aGUgZ29hbCBpcyB0byB0cnkg
dG8gaGFuZGxlIG1vcmUgdGhhbiBvbmUgcGFnZSBhdCBhIHRpbWUuClRoZSB2bWEgaXMgbmVlZGVk
IHRvIGxpbWl0IHRoZSBhbW91bnQgb2YgY29hbGVzY2luZyBhbmQgY2hlY2tpbmcKZm9yIHBhZ2Vz
IHRoYXQgY291bGQgYmUgc3BlY3VsYXRpdmVseSBtaWdyYXRlZCBvciBtYXBwZWQuCgo+PiBJJ20g
YWxzbyBub3Qgc3VyZSBhYm91dCBhY3F1aXJpbmcgdGhlIG1tYXBfc2VtIGZvciB3cml0ZSBhcyB3
YXkgdG8KPj4gbWl0aWdhdGUgdGhyYXNoaW5nLiBJdCBzZWVtcyB0byBtZSB0aGF0IGlmIGEgZGV2
aWNlIGFuZCBhIENQVSBhcmUKPj4gYm90aCBmYXVsdGluZyBvbiB0aGUgc2FtZSBwYWdlLAo+IAo+
IE9uZSBvZiB0aGUgcmVhc29ucyB0byBwcmVmZXIgdGhpcyBhcHByb2FjaCBpcyB0aGF0IGl0IG1l
YW5zIHdlIGRvbid0Cj4gbmVlZCB0byBrZWVwIHRyYWNrIG9mIHdoaWNoIHJhbmdlcyB3ZSBhcmUg
ZmF1bHRpbmcsIGFuZCBpZiB0aGVyZSBpcyBhCj4gbG90IG9mICp1bnJlbGF0ZWQqIGZhdWx0IGFj
dGl2aXR5ICh1bmxpa2VseT8pIHdlIGNhbiByZXNvbHZlIGl0IHVzaW5nCj4gbW1hcCBzZW0gaW5z
dGVhZCBvZiB0aGlzIGVsYWJvcmF0ZSByYW5nZXMgc2NoZW1lIGFuZCByZWxhdGVkCj4gbG9ja2lu
Zy4KPiAKPiBUaGlzIHdvdWxkIHJlZHVjZSB0aGUgb3ZlcmFsbCB3b3JrIGluIHRoZSBwYWdlIGZh
dWx0IGFuZAo+IGludmFsaWRhdGVfc3RhcnQvZW5kIHBhdGhzIGZvciB0aGUgY29tbW9uIHVuY29u
dGVuZGVkIGNhc2VzLgo+IAo+PiBzb21lIHNvcnQgb2YgYmFja29mZiBkZWxheSBpcyBuZWVkZWQg
dG8gbGV0IG9uZSBzaWRlIG9yIHRoZSBvdGhlcgo+PiBtYWtlIHNvbWUgcHJvZ3Jlc3MuCj4gCj4g
V2hhdCB0aGUgd3JpdGUgc2lkZSBvZiB0aGUgbW1hcF9zZW0gd291bGQgZG8gaXMgZm9yY2UgdGhl
IENQVSBhbmQKPiBkZXZpY2UgdG8gY2xlYW5seSB0YWtlIHR1cm5zLiBPbmNlIHRoZSBkZXZpY2Ug
cGFnZXMgYXJlIHJlZ2lzdGVyZWQKPiB1bmRlciB0aGUgd3JpdGUgc2lkZSB0aGUgQ1BVIHdpbGwg
aGF2ZSB0byB3YWl0IGluIGludmFsaWRhdGVfc3RhcnQgZm9yCj4gdGhlIGRyaXZlciB0byBjb21w
bGV0ZSBhIHNob290ZG93biwgdGhlbiB0aGUgd2hvbGUgdGhpbmcgc3RhcnRzIGFsbAo+IG92ZXIg
YWdhaW4uCj4gCj4gSXQgaXMgY2VydGFpbmx5IGltYWdpbmFibGUgc29tZXRoaW5nIGNvdWxkIGhh
dmUgYSAnbWluIGxpZmUnIHRpbWVyIGZvcgo+IGEgZGV2aWNlIG1hcHBpbmcgYW5kIGhvbGQgbW0g
aW52YWxpZGF0ZV9zdGFydCwgYW5kIGRldmljZSBwYWdlZmF1bHQKPiBmb3IgdGhhdCBtaW4gdGlt
ZSB0byBwcm9tb3RlIGJldHRlciBzaGFyaW5nLgo+IAo+IEJ1dCwgaWYgd2UgZG9uJ3QgdXNlIHRo
ZSBtbWFwX3NlbSB0aGVuIHdlIGNhbiBsaXZlbG9jayBhbmQgdGhlIGRldmljZQo+IHdpbGwgc2Vl
IGFuIHVucmVjb3ZlcmFibGUgZXJyb3IgZnJvbSB0aGUgdGltZW91dCB3aGljaCBtZWFucyB3ZSBo
YXZlCj4gcmlzayB0aGF0IHVuZGVyIGxvYWQgdGhlIHN5c3RlbSB3aWxsIHNpbXBseSBvYnNjdXJl
bHkgZmFpbC4gVGhpcyBzZWVtcwo+IHVuYWNjZXB0YWJsZSB0byBtZS4uCj4gCj4gUGFydGljdWxh
cmx5IHNpbmNlIGZvciB0aGUgT0RQIHVzZSBjYXNlIHRoZSBpc3N1ZSBpcyBub3QgdHJhc2hpbmcK
PiBtaWdyYXRpb24gYXMgYSBHUFUgbWlnaHQgaGF2ZSwgYnV0IHNpbXBsZSBzeXN0ZW0gc3RhYmls
aXR5IHVuZGVyIHN3YXAKPiBsb2FkLiBXZSBkbyBub3Qgd2FudCB0aGUgT0RQIHBhZ2VmYXVsdCB0
byBwZXJtYW5lbnRseSBmYWlsIGR1ZSB0bwo+IHRpbWVvdXQgaWYgdGhlIFZNQSBpcyBzdGlsbCB2
YWxpZC4uCj4gCj4gSmFzb24KPiAKCk9LLCBJIHVuZGVyc3RhbmQuCklmIHlvdSBjb21lIHVwIHdp
dGggYSBzZXQgb2YgY2hhbmdlcywgSSBjYW4gdHJ5IHRlc3RpbmcgdGhlbS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
