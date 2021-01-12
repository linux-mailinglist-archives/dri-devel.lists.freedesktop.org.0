Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E412F3C3D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E525B89A83;
	Tue, 12 Jan 2021 22:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BA189AAD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 22:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V94ogXIZBF2XJYNvk89lShmRj0frGCY/ix5JRIAL8RY=; b=Kfw6cMPL9TnBbkksgk9/ZlWsQ6
 pVtXM+G6YCyPSI5Jw1U+DV4Ib8CiPibF0wft17GlU7EDjY0NHIISU4x7J8ojOlmY4jqgq+K80j0pi
 DI4I9easErv/PehZL08pUuCPzvW2GXyFha6/A7Jevl0m8DaJ2gzUwxa5HM3wViCPtPWmwbRxvZdtz
 77bTQSfrLY2LIf7GgzjVfi0sKzBIZElr9Y5iDCNWXSpi2YpiZfsWCc7euALgKjLzZ7xPYoO2ZFzVb
 SUDPNV1s3GIA9SASzKZH9ovej1SdDvu0H4klXTZzBV3vlRt+uUZkRcJ2H1RqmNNhjH7HJCqQY6egI
 wSPcEubA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kzS1n-0008QT-JS; Wed, 13 Jan 2021 00:20:39 +0200
Subject: Re: [PATCH v5 04/21] gpu: host1x: Remove cancelled waiters immediately
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-5-mperttunen@nvidia.com>
 <1c2c4a31-68a2-c938-fe65-6059d9889126@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <1f98ce42-dc6b-299c-f55e-f6dd87b99cab@kapsi.fi>
Date: Wed, 13 Jan 2021 00:20:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1c2c4a31-68a2-c938-fe65-6059d9889126@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMS8xMy8yMSAxMjowNyBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDExLjAxLjIwMjEg
MTY6MDAsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+PiAtdm9pZCBob3N0MXhfaW50cl9w
dXRfcmVmKHN0cnVjdCBob3N0MXggKmhvc3QsIHVuc2lnbmVkIGludCBpZCwgdm9pZCAqcmVmKQo+
PiArdm9pZCBob3N0MXhfaW50cl9wdXRfcmVmKHN0cnVjdCBob3N0MXggKmhvc3QsIHVuc2lnbmVk
IGludCBpZCwgdm9pZCAqcmVmLAo+PiArCQkJIGJvb2wgZmx1c2gpCj4+ICAgewo+PiAgIAlzdHJ1
Y3QgaG9zdDF4X3dhaXRsaXN0ICp3YWl0ZXIgPSByZWY7Cj4+ICAgCXN0cnVjdCBob3N0MXhfc3lu
Y3B0ICpzeW5jcHQ7Cj4+ICAgCj4+IC0Jd2hpbGUgKGF0b21pY19jbXB4Y2hnKCZ3YWl0ZXItPnN0
YXRlLCBXTFNfUEVORElORywgV0xTX0NBTkNFTExFRCkgPT0KPj4gLQkgICAgICAgV0xTX1JFTU9W
RUQpCj4+IC0JCXNjaGVkdWxlKCk7Cj4+ICsJYXRvbWljX2NtcHhjaGcoJndhaXRlci0+c3RhdGUs
IFdMU19QRU5ESU5HLCBXTFNfQ0FOQ0VMTEVEKTsKPj4gICAKPj4gICAJc3luY3B0ID0gaG9zdC0+
c3luY3B0ICsgaWQ7Cj4+IC0JKHZvaWQpcHJvY2Vzc193YWl0X2xpc3QoaG9zdCwgc3luY3B0LAo+
PiAtCQkJCWhvc3QxeF9zeW5jcHRfbG9hZChob3N0LT5zeW5jcHQgKyBpZCkpOwo+PiArCj4+ICsJ
c3Bpbl9sb2NrKCZzeW5jcHQtPmludHIubG9jayk7Cj4+ICsJaWYgKGF0b21pY19jbXB4Y2hnKCZ3
YWl0ZXItPnN0YXRlLCBXTFNfQ0FOQ0VMTEVELCBXTFNfSEFORExFRCkgPT0KPj4gKwkgICAgV0xT
X0NBTkNFTExFRCkgewo+PiArCQlsaXN0X2RlbCgmd2FpdGVyLT5saXN0KTsKPj4gKwkJa3JlZl9w
dXQoJndhaXRlci0+cmVmY291bnQsIHdhaXRlcl9yZWxlYXNlKTsKPj4gKwl9Cj4+ICsJc3Bpbl91
bmxvY2soJnN5bmNwdC0+aW50ci5sb2NrKTsKPj4gKwo+PiArCWlmIChmbHVzaCkgewo+PiArCQkv
KiBXYWl0IHVudGlsIGFueSBjb25jdXJyZW50bHkgZXhlY3V0aW5nIGhhbmRsZXIgaGFzIGZpbmlz
aGVkLiAqLwo+PiArCQl3aGlsZSAoYXRvbWljX3JlYWQoJndhaXRlci0+c3RhdGUpICE9IFdMU19I
QU5ETEVEKQo+PiArCQkJY3B1X3JlbGF4KCk7Cj4+ICsJfQo+IAo+IEEgYnVzeS1sb29wIHNob3Vs
ZG4ndCBiZSB1c2VkIGluIGtlcm5lbCB1bmxlc3MgdGhlcmUgaXMgYSB2ZXJ5IGdvb2QKPiByZWFz
b24uIFRoZSB3YWl0X2V2ZW50KCkgc2hvdWxkIGJlIHVzZWQgaW5zdGVhZC4KPiAKPiBCdXQgcGxl
YXNlIGRvbid0IGh1cnJ5IHRvIHVwZGF0ZSB0aGlzIHBhdGNoLCB3ZSBtYXkgbmVlZCBvciB3YW50
IHRvCj4gcmV0aXJlIHRoZSBob3N0MXgtd2FpdGVyIGFuZCB0aGVuIHRoZXNlIGFsbCB3YWl0ZXIt
cmVsYXRlZCBwYXRjaGVzIHdvbid0Cj4gYmUgbmVlZGVkLgo+IAoKWWVzLCB3ZSBzaG91bGQgaW1w
cm92ZSB0aGUgaW50ciBjb2RlIHRvIHJlbW92ZSBhbGwgdGhpcyBjb21wbGV4aXR5LiBCdXQgCmxl
dCdzIG1lcmdlIHRoaXMgZmlyc3QgdG8gZ2V0IGEgZnVuY3Rpb25hbCBiYXNlbGluZSBhbmQgZG8g
bGFyZ2VyIGRlc2lnbiAKY2hhbmdlcyBpbiBmb2xsb3ctdXAgcGF0Y2hlcy4KCkl0IGlzIGN1bWJl
cnNvbWUgZm9yIG1lIHRvIGRldmVsb3AgZnVydGhlciBzZXJpZXMgKG9mIHdoaWNoIEkgaGF2ZSAK
c2V2ZXJhbCB1bmRlciB3b3JrIGFuZCBwbGFubmluZykgd2l0aCB0aGlzIGJhc2VsaW5lIHNlcmll
cyBub3QgYmVpbmcgCm1lcmdlZC4gVGhlIHVuY2VydGFpbnR5IG9uIHRoZSBhcHByb3ZhbCBvZiB0
aGUgVUFQSSBkZXNpZ24gYWxzbyBtYWtlcyBpdCAKaGFyZCB0byBrbm93IHdoZXRoZXIgaXQgbWFr
ZXMgc2Vuc2UgZm9yIG1lIHRvIHdvcmsgb24gdG9wIG9mIHRoaXMgY29kZSAKb3Igbm90LCBzbyBJ
J2QgbGlrZSB0byBmb2N1cyBvbiB3aGF0J3MgbmVlZGVkIHRvIGdldCB0aGlzIG1lcmdlZCBpbnN0
ZWFkIApvZiBmdXJ0aGVyIHJlZGVzaWduIG9mIHRoZSBkcml2ZXIgYXQgdGhpcyB0aW1lLgoKTWlr
a28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
