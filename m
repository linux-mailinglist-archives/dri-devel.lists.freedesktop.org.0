Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5602ADCE33
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6A86EB9F;
	Fri, 18 Oct 2019 18:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC886E4AD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 12:17:53 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 3C0AB60BEB; Thu, 17 Oct 2019 12:17:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id 8D58360B69;
 Thu, 17 Oct 2019 12:17:48 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 17 Oct 2019 17:47:47 +0530
From: kgunda@codeaurora.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH V7 6/6] backlight: qcom-wled: Add auto string detection
 logic
In-Reply-To: <20191017112941.qqvgboyambzw63i3@holly.lan>
References: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
 <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
 <20191017112941.qqvgboyambzw63i3@holly.lan>
Message-ID: <fa32f7ec727cb2626ad877a6cef32a1b@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571314672;
 bh=fsLi8zg/9WbhFgBBMcLFgTLCZlbnzv150ryvbRkBxIA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZBDBGUOCEZo+UAWGD3oOh/xK/sTyAAYqjJJhUq7+o46nQ41J9dYYtKrplR7KgRqMt
 8c0ZR+UOBdBMQLZfrPwU/N5eDxAsxwa3E/0zrepA1hUDa3By825pE+YY4EmU/zdPAx
 WCH604HbjnKVm4H+nmxOap+PGm3SpMjM+ZS9ebtA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571314669;
 bh=fsLi8zg/9WbhFgBBMcLFgTLCZlbnzv150ryvbRkBxIA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mm0UqB8w/zaHSXX1qisLmk7qxgN3JHjNBfXHCFJ0TO0qbq67QdBsELuzoAgzEoLMj
 QXij8a76b7qWGGZsxqfZbap97WyjO5MYMh5b9bIbsRlp2V6EJeXinrdm+AZuqx3oNh
 AC9qm7o1iZqKrqpIEDRcVdV2pYA9BKOnio+GTqC4=
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

T24gMjAxOS0xMC0xNyAxNjo1OSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IE9uIFdlZCwgT2N0
IDE2LCAyMDE5IGF0IDAzOjQzOjQ2UE0gKzA1MzAsIEtpcmFuIEd1bmRhIHdyb3RlOgo+PiBUaGUg
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
cmEub3JnPgo+IAo+IEl0J3MgYSBjb21wbGV4IGJpdCBvZiBjb2RlIGJ1dCBJJ20gT0sgd2l0aCBp
dCBpbiBwcmluY2lwbGUuIEV2ZXJ5dGhpbmcKPiBiZWxvdyBpcyBhYm91dCBzbWFsbCBkZXRhaWxz
IGFuZC9vciBuaXRwaWNraW5nLgo+IAo+IAo+PiArc3RhdGljIHZvaWQgd2xlZF9vdnBfd29yayhz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4+ICt7Cj4+ICsJc3RydWN0IHdsZWQgKndsZWQgPSBj
b250YWluZXJfb2Yod29yaywKPj4gKwkJCQkJIHN0cnVjdCB3bGVkLCBvdnBfd29yay53b3JrKTsK
Pj4gKwllbmFibGVfaXJxKHdsZWQtPm92cF9pcnEpOwo+PiArfQo+PiArCj4gCj4gQSBiaXQgb2Yg
Y29tbWVudGluZyBhYm91dCB3aHkgd2UgaGF2ZSB0byB3YWl0IDEwbXMgYmVmb3JlIGVuYWJsaW5n
IHRoZQo+IE9WUCBpbnRlcnJ1cHQgd291bGQgYmUgYXBwcmVjaWF0ZWQuCj4gCj4gClN1cmUuIFdp
bGwgYWRkIHRoZSBjb21tZW50IGluIHRoZSBuZXh0IHNlcmllcy4KPj4gK3N0YXRpYyBpcnFyZXR1
cm5fdCB3bGVkX292cF9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpfd2xlZCkKPj4gK3sKPj4g
KwlzdHJ1Y3Qgd2xlZCAqd2xlZCA9IF93bGVkOwo+PiArCWludCByYzsKPj4gKwl1MzIgaW50X3N0
cywgZmF1bHRfc3RzOwo+PiArCj4+ICsJcmMgPSByZWdtYXBfcmVhZCh3bGVkLT5yZWdtYXAsCj4+
ICsJCQkgd2xlZC0+Y3RybF9hZGRyICsgV0xFRDNfQ1RSTF9SRUdfSU5UX1JUX1NUUywgJmludF9z
dHMpOwo+PiArCWlmIChyYyA8IDApIHsKPj4gKwkJZGV2X2Vycih3bGVkLT5kZXYsICJFcnJvciBp
biByZWFkaW5nIFdMRUQzX0lOVF9SVF9TVFMgcmM9JWRcbiIsCj4+ICsJCQlyYyk7Cj4+ICsJCXJl
dHVybiBJUlFfSEFORExFRDsKPj4gKwl9Cj4+ICsKPj4gKwlyYyA9IHJlZ21hcF9yZWFkKHdsZWQt
PnJlZ21hcCwgd2xlZC0+Y3RybF9hZGRyICsKPj4gKwkJCSBXTEVEM19DVFJMX1JFR19GQVVMVF9T
VEFUVVMsICZmYXVsdF9zdHMpOwo+PiArCWlmIChyYyA8IDApIHsKPj4gKwkJZGV2X2Vycih3bGVk
LT5kZXYsICJFcnJvciBpbiByZWFkaW5nIFdMRURfRkFVTFRfU1RBVFVTIHJjPSVkXG4iLAo+PiAr
CQkJcmMpOwo+PiArCQlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4+ICsJfQo+PiArCj4+ICsJaWYgKGZh
dWx0X3N0cyAmCj4+ICsJCShXTEVEM19DVFJMX1JFR19PVlBfRkFVTFRfQklUIHwgV0xFRDNfQ1RS
TF9SRUdfSUxJTV9GQVVMVF9CSVQpKQo+PiArCQlkZXZfZGJnKHdsZWQtPmRldiwgIldMRUQgT1ZQ
IGZhdWx0IGRldGVjdGVkLCBpbnRfc3RzPSV4IGZhdWx0X3N0cz0gCj4+ICV4XG4iLAo+PiArCQkJ
aW50X3N0cywgZmF1bHRfc3RzKTsKPj4gKwo+PiArCWlmIChmYXVsdF9zdHMgJiBXTEVEM19DVFJM
X1JFR19PVlBfRkFVTFRfQklUKSB7Cj4+ICsJCW11dGV4X2xvY2soJndsZWQtPmxvY2spOwo+PiAr
CQlkaXNhYmxlX2lycV9ub3N5bmMod2xlZC0+b3ZwX2lycSk7Cj4gCj4gV2UncmUgY3VycmVudGx5
IHJ1bm5pbmcgdGhlIHRocmVhZGVkIElTUiBmb3IgdGhpcyBpcnEuIERvIHdlIHJlYWxseSAKPiBu
ZWVkCj4gdG8gZGlzYWJsZSBpdD8KPiAKV2UgbmVlZCB0byBkaXNhYmxlIHRoaXMgSVJRLCBkdXJp
bmcgdGhlIGF1dG8gc3RyaW5nIGRldGVjdGlvbiBsb2dpYy4gCkJlY2F1c2UKaW4gdGhlIGF1dG8g
c3RyaW5nIGRldGVjdGlvbiB3ZSBjb25maWd1cmUgdGhlIGN1cnJlbnQgc2lua3Mgb25lIGJ5IG9u
ZSAKYW5kIGNoZWNrIHRoZQpzdGF0dXMgcmVnaXN0ZXIgZm9yIHRoZSBPVlBzIGFuZCBzZXQgdGhl
IHJpZ2h0IHN0cmluZyBjb25maWd1cmF0aW9uLiBXZSAKZW5hYmxlIGl0IGxhdGVyIGFmdGVyCnRo
ZSBhdXRvIHN0cmluZyBkZXRlY3Rpb24gaXMgY29tcGxldGVkLgo+PiArCj4+ICsJCWlmICh3bGVk
X2F1dG9fZGV0ZWN0aW9uX3JlcXVpcmVkKHdsZWQpKQo+PiArCQkJd2xlZF9hdXRvX3N0cmluZ19k
ZXRlY3Rpb24od2xlZCk7Cj4+ICsKPj4gKwkJZW5hYmxlX2lycSh3bGVkLT5vdnBfaXJxKTsKPj4g
Kwo+PiArCQltdXRleF91bmxvY2soJndsZWQtPmxvY2spOwo+PiArCX0KPj4gKwo+PiArCXJldHVy
biBJUlFfSEFORExFRDsKPj4gK30KPj4gKwo+IAo+IFNuaXAuCj4gCj4gCj4+ICtzdGF0aWMgaW50
IHdsZWRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICt7Cj4+ICsJc3Ry
dWN0IHdsZWQgKndsZWQgPSBkZXZfZ2V0X2RydmRhdGEoJnBkZXYtPmRldik7Cj4+ICsKPj4gKwlj
YW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJndsZWQtPm92cF93b3JrKTsKPj4gKwltdXRleF9kZXN0
cm95KCZ3bGVkLT5sb2NrKTsKPiAKPiBIYXZlIHRoZSBpcnEgaGFuZGxlcnMgYmVlbiBkaXNhYmxl
ZCBhdCB0aGlzIHBvaW50Pwo+IApPay4uIG1heSBub3QgYmUuIEkgd2lsbCBkaXNhYmxlIHRoZSBp
cnEncyBoZXJlIGluIG5leHQgc2VyaWVzLgoKPiBBbHNvLCBpZiB5b3Ugd2FudCB0byBkZXN0cm95
IHRoZSBtdXRleCBzaG91bGRuJ3QgdGhhdCBjb2RlIGJlCj4gaW50cm9kdWNlZCBpbiB0aGUgc2Ft
ZSBwYXRjaCB0aGF0IGludHJvZHVjZXMgdGhlIG11dGV4PwpPay4uIEkgd2lsbCBtb3ZlIGl0IHRv
IHRoZSBzYW1lIHBhdGNoIHdoZXJlIHRoZSBtdXRleCBpbnRyb2R1Y2VkIGluIG5leHQgCnNlcmll
cy4KPj4gKwo+PiArCXJldHVybiAwOwo+PiArfQo+IAo+IAo+IERhbmllbC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
