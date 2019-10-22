Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54253DFE42
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 09:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B826E400;
	Tue, 22 Oct 2019 07:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02AF89402
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 07:20:27 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 542466079C; Tue, 22 Oct 2019 07:20:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id 1BFE9602D8;
 Tue, 22 Oct 2019 07:20:16 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 22 Oct 2019 12:50:16 +0530
From: kgunda@codeaurora.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH V8 6/6] backlight: qcom-wled: Add auto string detection
 logic
In-Reply-To: <20191021103150.ta7qalltldofouh4@holly.lan>
References: <1571402009-8706-1-git-send-email-kgunda@codeaurora.org>
 <1571402009-8706-7-git-send-email-kgunda@codeaurora.org>
 <20191021103150.ta7qalltldofouh4@holly.lan>
Message-ID: <0d41f3eb83bbae9eaab0723a84bfcb1b@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Approved-At: Tue, 22 Oct 2019 07:27:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571728827;
 bh=EVwj46UeE2wGGDTOX5OHTVhOFwofSd5fYovKQxbRLQg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dWFWIuvfhkYhzhxaCFrwEsjwAD6OHiNShNaNIzxk8XoTN1KGvmppbfSYjkQoOGTkT
 kaBx5EoMwX0C8/4ivSYMZfuArOjpTYa6/N25SyUi9j7zJYi/iLnxtxTWWHB5KP7Gyp
 L1ERtz9LOVC3CFeW+MJ2FxquzrnpUbV013oRX/UE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571728826;
 bh=EVwj46UeE2wGGDTOX5OHTVhOFwofSd5fYovKQxbRLQg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L182tLUn5lO3IAJmkyDsbs67sIsNniqSSrUcM/4htc7AHSW6qY8UzUT2JztXMGK0f
 eYdL11L+La2yCVX3QAQ5tVN+DH34lPoZGTunK3dzImJAB6zIq1mxy+NAiZGiooY7Vo
 yKwNxmgTYuTPfNtvox+bMnBltKkQCsVS23TY9sOs=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yMSAxNjowMSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IE9uIEZyaSwgT2N0
IDE4LCAyMDE5IGF0IDA2OjAzOjI5UE0gKzA1MzAsIEtpcmFuIEd1bmRhIHdyb3RlOgo+PiBUaGUg
YXV0byBzdHJpbmcgZGV0ZWN0aW9uIGFsZ29yaXRobSBjaGVja3MgaWYgdGhlIGN1cnJlbnQgV0xF
RAo+PiBzaW5rIGNvbmZpZ3VyYXRpb24gaXMgdmFsaWQuIEl0IHRyaWVzIGVuYWJsaW5nIGV2ZXJ5
IHNpbmsgYW5kCj4+IGNoZWNrcyBpZiB0aGUgT1ZQIGZhdWx0IGlzIG9ic2VydmVkLiBCYXNlZCBv
biB0aGlzIGluZm9ybWF0aW9uCj4+IGl0IGRldGVjdHMgYW5kIGVuYWJsZXMgdGhlIHZhbGlkIHNp
bmsgY29uZmlndXJhdGlvbi4KPj4gQXV0byBjYWxpYnJhdGlvbiB3aWxsIGJlIHRyaWdnZXJlZCB3
aGVuIHRoZSBPVlAgZmF1bHQgaW50ZXJydXB0cwo+PiBhcmUgc2VlbiBmcmVxdWVudGx5IHRoZXJl
YnkgaXQgdHJpZXMgdG8gZml4IHRoZSBzaW5rIGNvbmZpZ3VyYXRpb24uCj4+IAo+PiBUaGUgYXV0
by1kZXRlY3Rpb24gYWxzbyBraWNrcyBpbiB3aGVuIHRoZSBjb25uZWN0ZWQgTEVEIHN0cmluZwo+
PiBvZiB0aGUgZGlzcGxheS1iYWNrbGlnaHQgbWFsZnVuY3Rpb25zIChiZWNhdXNlIG9mIGRhbWFn
ZSkgYW5kCj4+IHJlcXVpcmVzIHRoZSBkYW1hZ2VkIHN0cmluZyB0byBiZSB0dXJuZWQgb2ZmIHRv
IHByZXZlbnQgdGhlCj4+IGNvbXBsZXRlIHBhbmVsIGFuZC9vciBib2FyZCBmcm9tIGJlaW5nIGRh
bWFnZWQuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBLaXJhbiBHdW5kYSA8a2d1bmRhQGNvZGVhdXJv
cmEub3JnPgo+PiAtLS0KPj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jIHwg
Mzk4IAo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCAzOTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYyAKPj4gYi9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYwo+PiBpbmRleCA2NThiMWUwLi5iMmU2NzU0IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYwo+PiArKysgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYwo+PiBAQCAtMTkzLDcgKzIxNiwyMyBA
QCBzdGF0aWMgaW50IHdsZWRfbW9kdWxlX2VuYWJsZShzdHJ1Y3Qgd2xlZCAqd2xlZCwgCj4+IGlu
dCB2YWwpCj4+ICAJCQkJV0xFRDNfQ1RSTF9SRUdfTU9EX0VOLAo+PiAgCQkJCVdMRUQzX0NUUkxf
UkVHX01PRF9FTl9NQVNLLAo+PiAgCQkJCXZhbCA8PCBXTEVEM19DVFJMX1JFR19NT0RfRU5fU0hJ
RlQpOwo+PiAtCXJldHVybiByYzsKPj4gKwlpZiAocmMgPCAwKQo+PiArCQlyZXR1cm4gcmM7Cj4+
ICsKPj4gKwlpZiAod2xlZC0+b3ZwX2lycSA+IDApIHsKPj4gKwkJaWYgKHZhbCkgewo+PiArCQkJ
LyoKPj4gKwkJCSAqIFdhaXQgZm9yIGF0IGxlYXN0IDEwbXMgYmVmb3JlIGVuYWJsaW5nIE9WUCBp
bnRlcnJ1cHQKPj4gKwkJCSAqIGFmdGVyIG1vZHVsZSBlbmFibGUgc28gdGhhdCBzb2Z0IHN0YXJ0
IGlzIGNvbXBsZXRlZC4KPj4gKwkJCSAqLwo+IAo+IENvbW1lbnRzIHNob3VsZCBub3Qgc2F5IHdo
YXQgaXMgZG9lcyAod2UgY2FuIHJlYWQgdGhhdCkuIEl0IHNob3VsZCBiZQo+IHNheWluZyB3aGF0
IGlzIHdlaXJkIGFib3V0IHRoZSBoYXJkd2FyZSB0aGUgcmVzdWx0cyBpbiB1cyBlbmFibGluZyB0
aGUKPiBpbnRlcnJ1cHQgaW4gYW4gdW51c3VhbCB3YXkuCj4gCj4gTW9yZSBsaWtlOgo+IAo+ICJU
aGUgaGFyZHdhcmUgZ2VuZXJhdGVzIGEgc3Rvcm0gb2Ygc3B1cmlvdXMgT1ZQIGludGVycnVwdHMg
ZHVyaW5nIHNvZnQKPiBzdGFydCBvcGVyYXRpb25zIHNvIGRlZmVyIGVuYWJsaW5nIHRoZSBJUlEg
Zm9yIDEwbXMgdG8gZW5zdXJlIHRoYXQKPiB0aGUgc29mdCBzdGFydCBpcyBjb21wbGV0ZS4iCj4g
Cj4gTm90ZSB0aGF0IEkgYW0gb25seSBndWVzc2luZyB0aGF0IGlzIGFuIHNwdXJpb3VzIGludGVy
cnVwdCBzdG9ybSB0aGF0Cj4gY2F1c2VkIHlvdSB0byBkZWZlciB0aGUgaW50ZXJydXB0IGVuYWJs
ZS4uLiBJIGRvbid0IHdhbnQgdG8gaGF2ZSB0bwo+IGd1ZXNzIHdoaWNoIGlzIHdoeSBJIGFtIGFz
a2luZyBmb3IgYSBnb29kIHF1YWxpdHkgY29tbWVudCEKPiAKPiAKPiBEYW5pZWwuClllcy4gWW91
ciBndWVzcyBpcyBjb3JyZWN0LiBUaGUgaGFyZHdhcmUgZG9jdW1lbnQgZXhwbGFpbnMgdGhlIHNh
bWUuClRoZSBXTEVEIGJvb3N0IHZvbHRhZ2UgY2FuIGhpdCBPVlAgbGltaXQgaW4gbm9ybWFsIG9w
ZXJhdGluZyBjb25kaXRpb25zIApzdWNoIGFzCmR1cmluZyB0aGUgc29mdCBzdGFydCB0aW1pbmcu
CkhlbmNlLCB3YWl0aW5nIGZvciB0aGUgc29mdCBzdGFydCB0byBjb21wbGV0ZSBiZWZvcmUgZW5h
YmxpbmcgdGhlIE9WUCAKaW50ZXJydXB0CnRvIGF2b2lkIHRoZSBzcHVyaW91cyBpbnRlcnJ1cHRz
LgoKSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWVudCBhcyB5b3Ugc3VnZ2VzdGVkIGluIHRoZSBuZXh0
IHNlcmllcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
