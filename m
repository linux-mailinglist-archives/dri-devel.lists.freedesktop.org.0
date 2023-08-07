Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDFE771DA6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 11:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F37010E062;
	Mon,  7 Aug 2023 09:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Mon, 07 Aug 2023 09:57:34 UTC
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1590A10E062
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 09:57:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1691401349; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jY7EyKSQmPFFyCau2neoIEEjqWN2hCNik5EX/1/k06ECSTT0FqxuN7uuDQzdeYlkoDEGKRbvandPZwrXAD8TSuELSO/RHf60NgbD19FeWLmjOMkPGhhGtFWeNrRpU6Ijf7sFyF17E1u3gRWjaGdlwMnl6/SdEnGpiU8CsWwfI78=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1691401349;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=L76lKqNpw6MTRutzpQTG1BbjMe/MuCCavRV0bG6xNjE=; 
 b=TQXpOm+NvwQv+2Ot/QB1GpYdPCjH9OiQLTFw1iZGomE2uJzyfIvM7PB4q6/BqQbwpIGpmjVMA8cHZvtqDK5OVEmNaca3hgWdUqLfnDZefaLIzfL9ZmKlIojr7RDRcBIUE+gUvpZtSjSiZaI8Ojei7gWn1d+2ivHBafFyJbBvsFM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691401349; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=L76lKqNpw6MTRutzpQTG1BbjMe/MuCCavRV0bG6xNjE=;
 b=XUMYrfq8thCHKRolwOQgoPin9XCimKf7qH0bFQii+vvdX5de0J8xu+3ncu6v6nhI
 nKZB2lFEX3QeWVYeLe239mqxKanT4abRJKIACVPGnyO/wW5vNFjYu02Ku4Qu//HeZSQ
 Qdu0Kgeug3FSN8f03VH0WfyeOaVlXoNfVTkBrkjH0NHebE2agUNjJDywxfD8VDzePCJ
 H/KFju+Gd60E/sCXxRO1UHcKllrjN8+yzyh4+WCYnQ+OjlsLjW4OnQnbAqFIwMgDPGA
 6xK57KO3+xLOrdW3ARmspnqnFz1eENEj/ZISex//fTesnqb3cHiUYlpcrnwcHbh96D8
 PMqJmCl+ww==
Received: from edelgard.fodlan.icenowy.me (120.85.97.93 [120.85.97.93]) by
 mx.zohomail.com with SMTPS id 1691401346322705.5458666282636;
 Mon, 7 Aug 2023 02:42:26 -0700 (PDT)
Message-ID: <27d09ea33c085d6a2ea9efb91a8cdd7e7464fda7.camel@icenowy.me>
Subject: Re: [PATCH 1/3] clk: sunxi-ng: add support for rate resetting notifier
From: Icenowy Zheng <uwu@icenowy.me>
To: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 07 Aug 2023 17:42:22 +0800
In-Reply-To: <20230807-a64_pll_video0_notifier-v1-1-8a7ccdc14c79@oltmanns.dev>
References: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
 <20230807-a64_pll_video0_notifier-v1-1-8a7ccdc14c79@oltmanns.dev>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 =?gb2312?Q?Ond=810=940ej?= Jirman <x@xnux.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

5ZyoIDIwMjMtMDgtMDfmmJ/mnJ/kuIDnmoQgMTE6MzYgKzAyMDDvvIxGcmFuayBPbHRtYW5uc+WG
memBk++8mgo+IEZyb206IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPiAKPiBJbiBz
b21lIHNpdHVhaXRvbnMsIHdlIHdpbGwgd2FudCBhIGNsb2NrIHJhdGUgYmUga2VwdCB3aGlsZSBp
dHMKPiBwYXJlbnQKPiBjYW4gY2hhbmdlLCBmb3IgZXhhbXBsZSwgdG8gbWFrZSBkdWFsLWhlYWQg
d29yayBvbiBBNjQsIFRDT04wIGNsb2NrCj4gbmVlZHMgdG8gYmUga2VwdCBmb3IgTENEIGRpc3Bs
YXkgYW5kIGl0cyBwYXJlbnQgKG9yIGdyYW5kcGFyZW50KQo+IFBMTC1WaWRlbzAgbmVlZCB0byBi
ZSBjaGFuZ2VkIGZvciBIRE1JIGRpc3BsYXkuIChUaGVyZSdzIGEgcXVpcmsgb24KPiBBNjQKPiB0
aGF0IEhETUkgUEhZIGNhbiBvbmx5IHVzZSBQTEwtVmlkZW8wLCBub3QgUExMLVZpZGVvMSkuCj4g
Cj4gQWRkIGEgbm90aWZpZXIgaGVscGVyIHRvIGNyZWF0ZSBzdWNoIGtpbmQgb2YgcmF0ZSBrZWVw
aW5nIG5vdGlmaWVyIGJ5Cj4gcmVzZXQgdGhlIHJhdGUgYWZ0ZXIgdGhlIHBhcmVudCBjaGFuZ2Vk
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPiAt
LS0KPiDCoGRyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdV9jb21tb24uYyB8IDIyICsrKysrKysrKysr
KysrKysrKysrKysKPiDCoGRyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdV9jb21tb24uaCB8IDEyICsr
KysrKysrKysrKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdV9jb21tb24uYyBiL2RyaXZlcnMvY2xr
L3N1bnhpLQo+IG5nL2NjdV9jb21tb24uYwo+IGluZGV4IDhkMjhhN2EwNzlkMC4uNDM0ZmE0NmFk
NDYwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdV9jb21tb24uYwo+ICsr
KyBiL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdV9jb21tb24uYwo+IEBAIC04Nyw2ICs4NywyOCBA
QCBpbnQgY2N1X3BsbF9ub3RpZmllcl9yZWdpc3RlcihzdHJ1Y3QgY2N1X3BsbF9uYgo+ICpwbGxf
bmIpCj4gwqB9Cj4gwqBFWFBPUlRfU1lNQk9MX05TX0dQTChjY3VfcGxsX25vdGlmaWVyX3JlZ2lz
dGVyLCBTVU5YSV9DQ1UpOwo+IMKgCj4gK3N0YXRpYyBpbnQgY2N1X3JhdGVfcmVzZXRfbm90aWZp
ZXJfY2Ioc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGxvbmcgZXZlbnQsIHZvaWQKPiAqZGF0YSkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCBjY3VfcmF0ZV9yZXNldF9uYiAqcmF0ZV9yZXNldCA9Cj4gdG9fY2N1X3JhdGVfcmVzZXRfbmIo
bmIpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZiAoZXZlbnQgPT0gUFJFX1JBVEVfQ0hBTkdFKSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJhdGVfcmVzZXQtPnNhdmVkX3JhdGUg
PSBjbGtfZ2V0X3JhdGUocmF0ZV9yZXNldC0KPiA+dGFyZ2V0X2Nsayk7CgpJbiBmYWN0IEkgdGhp
bmsgd2Ugc2hvdWxkIGhhdmUgYSBiZXR0ZXIgd2F5IHRvIHNhdmUgdGhlIGludGVuZGVkIGNsb2Nr
CnJhdGUgOy0pCgo+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZSBpZiAoZXZlbnQgPT0gUE9TVF9SQVRF
X0NIQU5HRSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbGtfc2V0X3JhdGUo
cmF0ZV9yZXNldC0+dGFyZ2V0X2NsaywgcmF0ZV9yZXNldC0KPiA+c2F2ZWRfcmF0ZSk7Cj4gK8Kg
wqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gTk9USUZZX0RPTkU7Cj4g
K30KPiArCj4gK2ludCBjY3VfcmF0ZV9yZXNldF9ub3RpZmllcl9yZWdpc3RlcihzdHJ1Y3QgY2N1
X3JhdGVfcmVzZXRfbmIKPiAqcmF0ZV9yZXNldF9uYikKPiArewo+ICvCoMKgwqDCoMKgwqDCoHJh
dGVfcmVzZXRfbmItPmNsa19uYi5ub3RpZmllcl9jYWxsID0KPiBjY3VfcmF0ZV9yZXNldF9ub3Rp
Zmllcl9jYjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGNsa19ub3RpZmllcl9yZWdpc3Rl
cihyYXRlX3Jlc2V0X25iLT5jb21tb24tPmh3LmNsaywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcmF0ZV9y
ZXNldF9uYi0+Y2xrX25iKTsKPiArfQo+ICsKPiDCoHN0YXRpYyBpbnQgc3VueGlfY2N1X3Byb2Jl
KHN0cnVjdCBzdW54aV9jY3UgKmNjdSwgc3RydWN0IGRldmljZQo+ICpkZXYsCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5vZGUsIHZvaWQgX19pb21lbQo+ICpyZWcsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc3VueGlfY2N1X2Rl
c2MgKmRlc2MpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdV9jb21tb24u
aCBiL2RyaXZlcnMvY2xrL3N1bnhpLQo+IG5nL2NjdV9jb21tb24uaAo+IGluZGV4IGZiZjE2YzZi
ODk2ZC4uNmIwYjA1ZmFlMTIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2Nj
dV9jb21tb24uaAo+ICsrKyBiL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdV9jb21tb24uaAo+IEBA
IC02OSw0ICs2OSwxNiBAQCBpbnQgZGV2bV9zdW54aV9jY3VfcHJvYmUoc3RydWN0IGRldmljZSAq
ZGV2LCB2b2lkCj4gX19pb21lbSAqcmVnLAo+IMKgdm9pZCBvZl9zdW54aV9jY3VfcHJvYmUoc3Ry
dWN0IGRldmljZV9ub2RlICpub2RlLCB2b2lkIF9faW9tZW0gKnJlZywKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3Qgc3VueGlfY2N1
X2Rlc2MgKmRlc2MpOwo+IMKgCj4gK3N0cnVjdCBjY3VfcmF0ZV9yZXNldF9uYiB7Cj4gK8KgwqDC
oMKgwqDCoMKgc3RydWN0IG5vdGlmaWVyX2Jsb2NrwqDCoMKgY2xrX25iOwo+ICvCoMKgwqDCoMKg
wqDCoHN0cnVjdCBjY3VfY29tbW9uwqDCoMKgwqDCoMKgwqAqY29tbW9uOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgY2xrwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCp0YXJnZXRfY2xr
Owo+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2F2
ZWRfcmF0ZTsKPiArfTsKPiArCj4gKyNkZWZpbmUgdG9fY2N1X3JhdGVfcmVzZXRfbmIoX25iKSBj
b250YWluZXJfb2YoX25iLCBzdHJ1Y3QKPiBjY3VfcmF0ZV9yZXNldF9uYiwgY2xrX25iKQo+ICsK
PiAraW50IGNjdV9yYXRlX3Jlc2V0X25vdGlmaWVyX3JlZ2lzdGVyKHN0cnVjdCBjY3VfcmF0ZV9y
ZXNldF9uYgo+ICpyYXRlX3Jlc2V0X25iKTsKPiArCj4gwqAjZW5kaWYgLyogX0NPTU1PTl9IXyAq
Lwo+IAoK

