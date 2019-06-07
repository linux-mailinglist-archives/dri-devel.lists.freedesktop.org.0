Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B425A3A5B8
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CE389327;
	Sun,  9 Jun 2019 12:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71A789320;
 Fri,  7 Jun 2019 20:21:13 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfac7290000>; Fri, 07 Jun 2019 13:20:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 13:21:13 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 13:21:13 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 7 Jun 2019 20:21:13 +0000
Subject: Re: [PATCH v2 hmm 05/11] mm/hmm: Remove duplicate condition test
 before wait_event_timeout
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-6-jgg@ziepe.ca>
 <6833be96-12a3-1a1c-1514-c148ba2dd87b@nvidia.com>
 <20190607191302.GR14802@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <e17aa8c5-790c-d977-2eb8-c18cdaa4cbb3@nvidia.com>
Date: Fri, 7 Jun 2019 13:21:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190607191302.GR14802@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559938858; bh=s2G5tJqOqHdqmW4ufsTMsGq7fV6vI/5SQtvIg06oOJQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=NCN0Fg0UVPlZxRyhrIn98xNmC3K2z4IoTGT1OhCjed+O27VsZm5NM4QHj4rep7Og8
 XODt+Cfuu3++wYZ28eqx0HW9TvQbDlQa7GR5HED65qID4mb2JIKRmoA45K4klBPW8d
 Hq9ZpycikWWyiLiytAFnSTukk41Y6Bdu07pDpoQJUazx56fZxlp5w715nqwbCmBrH9
 0SozfIG/WwsFr9Wd2O4i9yDSRInWW5JjdIKRBYmN7gLDZDhpQnWus6UV4muO+t0Q2y
 SU26zQ7D0iCbo3+CcpZH3Aw9SEq7F0+j2HJn+RdPvu4LX119xAGzDS2WLbGChPceXF
 7EtJIWmAGa9mQ==
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

Ck9uIDYvNy8xOSAxMjoxMyBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIEZyaSwgSnVu
IDA3LCAyMDE5IGF0IDEyOjAxOjQ1UE0gLTA3MDAsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+Pgo+
PiBPbiA2LzYvMTkgMTE6NDQgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+IEZyb206IEph
c29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPj4+Cj4+PiBUaGUgd2FpdF9ldmVudF90
aW1lb3V0IG1hY3JvIGFscmVhZHkgdGVzdHMgdGhlIGNvbmRpdGlvbiBhcyBpdHMgZmlyc3QKPj4+
IGFjdGlvbiwgc28gdGhlcmUgaXMgbm8gcmVhc29uIHRvIG9wZW4gY29kZSBhbm90aGVyIHZlcnNp
b24gb2YgdGhpcywgYWxsCj4+PiB0aGF0IGRvZXMgaXMgc2tpcCB0aGUgbWlnaHRfc2xlZXAoKSBk
ZWJ1Z2dpbmcgaW4gY29tbW9uIGNhc2VzLCB3aGljaCBpcwo+Pj4gbm90IGhlbHBmdWwuCj4+Pgo+
Pj4gRnVydGhlciwgYmFzZWQgb24gcHJpb3IgcGF0Y2hlcywgd2UgY2FuIG5vIHNpbXBsaWZ5IHRo
ZSByZXF1aXJlZCBjb25kaXRpb24KPj4+IHRlc3Q6Cj4+PiAgICAtIElmIHJhbmdlIGlzIHZhbGlk
IG1lbW9yeSB0aGVuIHNvIGlzIHJhbmdlLT5obW0KPj4+ICAgIC0gSWYgaG1tX3JlbGVhc2UoKSBo
YXMgcnVuIHRoZW4gcmFuZ2UtPnZhbGlkIGlzIHNldCB0byBmYWxzZQo+Pj4gICAgICBhdCB0aGUg
c2FtZSB0aW1lIGFzIGRlYWQsIHNvIG5vIHJlYXNvbiB0byBjaGVjayBib3RoLgo+Pj4gICAgLSBB
IHZhbGlkIGhtbSBoYXMgYSB2YWxpZCBobW0tPm1tLgo+Pj4KPj4+IEFsc28sIGFkZCB0aGUgUkVB
RF9PTkNFIGZvciByYW5nZS0+dmFsaWQgYXMgdGhlcmUgaXMgbm8gbG9jayBoZWxkIGhlcmUuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+
Pj4gUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+Pj4g
ICAgaW5jbHVkZS9saW51eC9obW0uaCB8IDEyICsrLS0tLS0tLS0tLQo+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCj4+PiBpbmRleCA0
ZWUzYWNhYmU1ZWQyMi4uMmFiMzViNDA5OTJiMjQgMTAwNjQ0Cj4+PiArKysgYi9pbmNsdWRlL2xp
bnV4L2htbS5oCj4+PiBAQCAtMjE4LDE3ICsyMTgsOSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVk
IGxvbmcgaG1tX3JhbmdlX3BhZ2Vfc2l6ZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkK
Pj4+ICAgIHN0YXRpYyBpbmxpbmUgYm9vbCBobW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZChzdHJ1
Y3QgaG1tX3JhbmdlICpyYW5nZSwKPj4+ICAgIAkJCQkJICAgICAgdW5zaWduZWQgbG9uZyB0aW1l
b3V0KQo+Pj4gICAgewo+Pj4gLQkvKiBDaGVjayBpZiBtbSBpcyBkZWFkID8gKi8KPj4+IC0JaWYg
KHJhbmdlLT5obW0gPT0gTlVMTCB8fCByYW5nZS0+aG1tLT5kZWFkIHx8IHJhbmdlLT5obW0tPm1t
ID09IE5VTEwpIHsKPj4+IC0JCXJhbmdlLT52YWxpZCA9IGZhbHNlOwo+Pj4gLQkJcmV0dXJuIGZh
bHNlOwo+Pj4gLQl9Cj4+PiAtCWlmIChyYW5nZS0+dmFsaWQpCj4+PiAtCQlyZXR1cm4gdHJ1ZTsK
Pj4+IC0Jd2FpdF9ldmVudF90aW1lb3V0KHJhbmdlLT5obW0tPndxLCByYW5nZS0+dmFsaWQgfHwg
cmFuZ2UtPmhtbS0+ZGVhZCwKPj4+ICsJd2FpdF9ldmVudF90aW1lb3V0KHJhbmdlLT5obW0tPndx
LCByYW5nZS0+dmFsaWQsCj4+PiAgICAJCQkgICBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXQpKTsK
Pj4+IC0JLyogUmV0dXJuIGN1cnJlbnQgdmFsaWQgc3RhdHVzIGp1c3QgaW4gY2FzZSB3ZSBnZXQg
bHVja3kgKi8KPj4+IC0JcmV0dXJuIHJhbmdlLT52YWxpZDsKPj4+ICsJcmV0dXJuIFJFQURfT05D
RShyYW5nZS0+dmFsaWQpOwo+Pj4gICAgfQo+Pj4gICAgLyoKPj4+Cj4+Cj4+IFNpbmNlIHdlIGFy
ZSBzaW1wbGlmeWluZyB0aGluZ3MsIHBlcmhhcHMgd2Ugc2hvdWxkIGNvbnNpZGVyIG1lcmdpbmcK
Pj4gaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQoKSBpbmZvIGhtbV9yYW5nZV9yZWdpc3Rlcigp
IGFuZAo+PiByZW1vdmluZyBobW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZCgpIHNpbmNlIHRoZSBw
YXR0ZXJuCj4+IGlzIHRvIGFsd2F5cyBjYWxsIHRoZSB0d28gdG9nZXRoZXIuCj4gCj4gPyB0aGUg
aG1tLnJzdCBzaG93cyB0aGUgaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQgYmVpbmcgY2FsbGVk
IGluIHRoZQo+IChyZXQgPT0gLUVBR0FJTikgcGF0aC4gSXQgaXMgY29uZnVzaW5nIGJlY2F1c2Ug
aXQgc2hvdWxkIHJlYWxseSBqdXN0Cj4gaGF2ZSB0aGUgYWdhaW4gbGFiZWwgbW92ZWQgdXAgYWJv
dmUgaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQoKSBhcwo+IGV2ZW4gaWYgd2UgZ2V0IHRoZSBk
cml2ZXIgbG9jayBpdCBjb3VsZCBzdGlsbCBiZSBhIGxvbmcgd2FpdCBmb3IgdGhlCj4gY29sbGlk
aW5nIGludmFsaWRhdGlvbiB0byBjbGVhci4KPiAKPiBXaGF0IEkgd2FudCB0byBnZXQgdG8gaXMg
YSBwYXR0ZXJuIGxpa2UgdGhpczoKPiAKPiBwYWdlZmF1bHQoKToKPiAKPiAgICAgaG1tX3Jhbmdl
X3JlZ2lzdGVyKCZyYW5nZSk7Cj4gYWdhaW46Cj4gICAgIC8qIE9uIHRoZSBzbG93IHBhdGgsIGlm
IHdlIGFwcGVhciB0byBiZSBsaXZlIGxvY2tlZCB0aGVuIHdlIGdldAo+ICAgICAgICB0aGUgd3Jp
dGUgc2lkZSBvZiBtbWFwX3NlbSB3aGljaCB3aWxsIGJyZWFrIHRoZSBsaXZlIGxvY2ssCj4gICAg
ICAgIG90aGVyd2lzZSB0aGlzIGdldHMgdGhlIHJlYWQgbG9jayAqLwo+ICAgICBpZiAoaG1tX3Jh
bmdlX3N0YXJ0X2FuZF9sb2NrKCZyYW5nZSkpCj4gICAgICAgICAgIGdvdG8gZXJyOwo+IAo+ICAg
ICBsb2NrZGVwX2Fzc2VydF9oZWxkKHJhbmdlLT5tbS0+bW1hcF9zZW0pOwo+IAo+ICAgICAvLyBP
cHRpb25hbDogQXZvaWQgdXNlbGVzcyBleHBlbnNpdmUgd29yawo+ICAgICBpZiAoaG1tX3Jhbmdl
X25lZWRzX3JldHJ5KCZyYW5nZSkpCj4gICAgICAgIGdvdG8gYWdhaW47Cj4gICAgIGhtbV9yYW5n
ZV8odG91Y2ggdm1hcykKPiAKPiAgICAgdGFrZV9sb2NrKGRyaXZlci0+dXBkYXRlKTsKPiAgICAg
aWYgKGhtbV9yYW5nZV9lbmQoJnJhbmdlKSB7Cj4gICAgICAgICByZWxlYXNlX2xvY2soZHJpdmVy
LT51cGRhdGUpOwo+ICAgICAgICAgZ290byBhZ2FpbjsKPiAgICAgfQo+ICAgICAvLyBGaW5pc2gg
ZHJpdmVyIHVwZGF0ZXMKPiAgICAgcmVsZWFzZV9sb2NrKGRyaXZlci0+dXBkYXRlKTsKPiAKPiAg
ICAgLy8gUmVsZWFzZXMgbW1hcF9zZW0KPiAgICAgaG1tX3JhbmdlX3VucmVnaXN0ZXJfYW5kX3Vu
bG9jaygmcmFuZ2UpOwo+IAo+IFdoYXQgZG8geW91IHRoaW5rPwo+IAo+IElzIGl0IGNsZWFyPwo+
IAo+IEphc29uCj4gCgpBcmUgeW91IHRhbGtpbmcgYWJvdXQgYWNxdWlyaW5nIG1tYXBfc2VtIGlu
IGhtbV9yYW5nZV9zdGFydF9hbmRfbG9jaygpPwpVc3VhbGx5LCB0aGUgZmF1bHQgY29kZSBoYXMg
dG8gbG9jayBtbWFwX3NlbSBmb3IgcmVhZCBpbiBvcmRlciB0bwpjYWxsIGZpbmRfdm1hKCkgc28g
aXQgY2FuIHNldCByYW5nZS52bWEuCklmIEhNTSBkcm9wcyBtbWFwX3NlbSAtIHdoaWNoIEkgZG9u
J3QgdGhpbmsgaXQgc2hvdWxkLCBqdXN0IHJldHVybiBhbgplcnJvciB0byB0ZWxsIHRoZSBjYWxs
ZXIgdG8gZHJvcCBtbWFwX3NlbSBhbmQgcmV0cnkgLSB0aGUgZmluZF92bWEoKQp3aWxsIG5lZWQg
dG8gYmUgcmVwZWF0ZWQgYXMgd2VsbC4KSSdtIGFsc28gbm90IHN1cmUgYWJvdXQgYWNxdWlyaW5n
IHRoZSBtbWFwX3NlbSBmb3Igd3JpdGUgYXMgd2F5IHRvCm1pdGlnYXRlIHRocmFzaGluZy4gSXQg
c2VlbXMgdG8gbWUgdGhhdCBpZiBhIGRldmljZSBhbmQgYSBDUFUgYXJlCmJvdGggZmF1bHRpbmcg
b24gdGhlIHNhbWUgcGFnZSwgc29tZSBzb3J0IG9mIGJhY2tvZmYgZGVsYXkgaXMgbmVlZGVkCnRv
IGxldCBvbmUgc2lkZSBvciB0aGUgb3RoZXIgbWFrZSBzb21lIHByb2dyZXNzLgoKVGhyYXNoaW5n
IG1pdGlnYXRpb24gYW5kIGhvdyBtaWdyYXRlX3ZtYSgpIHBsYXlzIGluIHRoaXMgaXMgYQpkZWVw
IHRvcGljIGZvciB0aG91Z2h0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
