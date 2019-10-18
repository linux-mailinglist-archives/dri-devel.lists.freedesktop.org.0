Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D64DCE36
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEB16EBA1;
	Fri, 18 Oct 2019 18:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8A46EAB0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 05:03:10 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 2210060F5C; Fri, 18 Oct 2019 05:03:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id F337560614;
 Fri, 18 Oct 2019 05:03:08 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 18 Oct 2019 10:33:08 +0530
From: kgunda@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V7 6/6] backlight: qcom-wled: Add auto string detection
 logic
In-Reply-To: <20191017133024.GQ4365@dell>
References: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
 <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
 <20191017122653.GO4365@dell>
 <689831a9d7561f51cdb7ea0a1760d472@codeaurora.org>
 <20191017133024.GQ4365@dell>
Message-ID: <1b21d0a80847173c4a1ee1943f974bda@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571374990;
 bh=xkwmYNFg1uTAlzxvBXAlwxTv5Amb5w9CFHuhTI/GUFA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A3o4N4A+ThwRlG0WSfKtqT+hdLXEqISvjODSLiJHe4LxZGoNQBMc5MIXYw7MF9EVC
 js9ZQULfDl1XODGzDcP3gvCoVYqwRJaQTvhXuwkCjDGdTQsEZSUQHGcMl+bFYCjy70
 fxfT6dIU4Pxvz6drxmEw7n86GORXOvEzbRMQxVkc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571374989;
 bh=xkwmYNFg1uTAlzxvBXAlwxTv5Amb5w9CFHuhTI/GUFA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TRC7FdhxqcvRaLT3Z2cDlrb+g+4pDGxEVYxnLUuUgZoPoO/wtPLN9gVyReShp55gi
 xZfl6WnVEscRs/4rMCP9o3Hi44mrwgtKDlPFI1iIAUnFJrl48mgT1qNXIlpGaBK86l
 7u9NU5BBQd7q9vlZZZkKwbJac2wZrnyGnJTpDrlA=
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
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org,
 linux-arm-msm-owner@vger.kernel.org, linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xNyAxOTowMCwgTGVlIEpvbmVzIHdyb3RlOgo+IE9uIFRodSwgMTcgT2N0IDIw
MTksIGtndW5kYUBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPiAKPj4gT24gMjAxOS0xMC0xNyAxNzo1
NiwgTGVlIEpvbmVzIHdyb3RlOgo+PiA+IE9uIFdlZCwgMTYgT2N0IDIwMTksIEtpcmFuIEd1bmRh
IHdyb3RlOgo+PiA+Cj4+ID4gPiBUaGUgYXV0byBzdHJpbmcgZGV0ZWN0aW9uIGFsZ29yaXRobSBj
aGVja3MgaWYgdGhlIGN1cnJlbnQgV0xFRAo+PiA+ID4gc2luayBjb25maWd1cmF0aW9uIGlzIHZh
bGlkLiBJdCB0cmllcyBlbmFibGluZyBldmVyeSBzaW5rIGFuZAo+PiA+ID4gY2hlY2tzIGlmIHRo
ZSBPVlAgZmF1bHQgaXMgb2JzZXJ2ZWQuIEJhc2VkIG9uIHRoaXMgaW5mb3JtYXRpb24KPj4gPiA+
IGl0IGRldGVjdHMgYW5kIGVuYWJsZXMgdGhlIHZhbGlkIHNpbmsgY29uZmlndXJhdGlvbi4KPj4g
PiA+IEF1dG8gY2FsaWJyYXRpb24gd2lsbCBiZSB0cmlnZ2VyZWQgd2hlbiB0aGUgT1ZQIGZhdWx0
IGludGVycnVwdHMKPj4gPiA+IGFyZSBzZWVuIGZyZXF1ZW50bHkgdGhlcmVieSBpdCB0cmllcyB0
byBmaXggdGhlIHNpbmsgY29uZmlndXJhdGlvbi4KPj4gPiA+Cj4+ID4gPiBUaGUgYXV0by1kZXRl
Y3Rpb24gYWxzbyBraWNrcyBpbiB3aGVuIHRoZSBjb25uZWN0ZWQgTEVEIHN0cmluZwo+PiA+ID4g
b2YgdGhlIGRpc3BsYXktYmFja2xpZ2h0IG1hbGZ1bmN0aW9ucyAoYmVjYXVzZSBvZiBkYW1hZ2Up
IGFuZAo+PiA+ID4gcmVxdWlyZXMgdGhlIGRhbWFnZWQgc3RyaW5nIHRvIGJlIHR1cm5lZCBvZmYg
dG8gcHJldmVudCB0aGUKPj4gPiA+IGNvbXBsZXRlIHBhbmVsIGFuZC9vciBib2FyZCBmcm9tIGJl
aW5nIGRhbWFnZWQuCj4+ID4gPgo+PiA+ID4gU2lnbmVkLW9mZi1ieTogS2lyYW4gR3VuZGEgPGtn
dW5kYUBjb2RlYXVyb3JhLm9yZz4KPj4gPiA+IC0tLQo+PiA+ID4gIGRyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3Fjb20td2xlZC5jIHwgNDEwCj4+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0KPj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDA0IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCj4+ID4gPgo+PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3Fjb20td2xlZC5jCj4+ID4gPiBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20t
d2xlZC5jCj4+ID4gPiBpbmRleCBiNWIxMjVjLi5mZjdjNDA5IDEwMDY0NAo+PiA+ID4gLS0tIGEv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPj4gPiA+ICsrKyBiL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jCj4gCj4gWy4uLl0KPiAKPj4gPiA+ICsJCWlmIChp
bnRfc3RzICYgV0xFRDNfQ1RSTF9SRUdfT1ZQX0ZBVUxUX1NUQVRVUykKPj4gPiA+ICsJCQlkZXZf
ZGJnKHdsZWQtPmRldiwgIldMRUQgT1ZQIGZhdWx0IGRldGVjdGVkIHdpdGggU0lOSyAlZFxuIiwK
Pj4gPiA+ICsJCQkJaSArIDEpOwo+PiA+Cj4+ID4gSSBoYXZlbid0IHJldmlld2VkIHRoZSB3aG9s
ZSBwYXRjaCwgYnV0IHRoaXMgY2F1Z2h0IG15IGV5ZS4KPj4gPgo+PiA+IEkgdGhpbmsgdGhpcyBz
aG91bGQgYmUgdXBncmFkZWQgdG8gZGV2X3dhcm4oKS4KPj4gPgo+PiBUaG91Z2h0IG9mIGtlZXBp
bmcgdGhlc2UgbWVzc2FnZXMgc2lsZW50LCBCZWNhdXNlIHRoZSBzdHJpbmcgCj4+IGNvbmZpZ3Vy
YXRpb24KPj4gd2lsbCBiZSBjb3JyZWN0ZWQgaW4gdGhpcwo+PiBhbmQgaW5mb3JtaW5nIGl0IGF0
IGVuZCBvZiB0aGUgYXV0byBzdHJpbmcgZGV0ZWN0aW9uLgo+IAo+IFsuLi5dCj4gCj4+ID4gPiAr
CX0gZWxzZSB7Cj4+ID4gPiArCQlkZXZfd2Fybih3bGVkLT5kZXYsICJOZXcgV0xFRCBzdHJpbmcg
Y29uZmlndXJhdGlvbiBmb3VuZCAleFxuIiwKPj4gPiA+ICsJCQkgc2lua192YWxpZCk7Cj4+ID4K
Pj4gPiBXaHkgd291bGQgdGhlIHVzZXIgY2FyZSBhYm91dCB0aGlzPyAgSXMgaXQgbm90IG5vcm1h
bD8KPj4gPgo+PiBBY3R1YWxseSwgaXQgY29tZXMgaGVyZSBpZiB0aGUgdXNlciBwcm92aWRlZCBz
dHJpbmcgY29uZmlndXJhdGlvbiBpbiAKPj4gdGhlCj4+IGRldmljZSB0cmVlIGlzIGluLWNvcnJl
Y3QuCj4+IFRoYXQncyB3aHkganVzdCBpbmZvcm1pbmcgdGhlIHVzZXIgYWJvdXQgdGhlIHJpZ2h0
IHN0cmluZyAKPj4gY29uZmlndXJhdGlvbiwKPj4gYWZ0ZXIgdGhlIGF1dG8gc3RyaW5nIGRldGVj
dGlvbi4KPiAKPiBUaGVuIEkgdGhpbmsgd2UgbmVlZCB0byBiZSBtb3JlIGZvcnRoY29taW5nLiAg
VGVsbCB0aGUgdXNlciB0aGUKPiBjb25maWd1cmF0aW9uIGlzIGluY29ycmVjdCBhbmQgd2hhdCB5
b3UndmUgZG9uZSB0byByZWN0aWZ5IGl0Lgo+IAo+ICJYWFggaXMgbm90IGEgdmFsaWQgY29uZmln
dXJhdGlvbiAtIHVzaW5nIFlZWSBpbnN0ZWFkIgo+IApTdXJlLiBXaWxsIHVwZGF0ZSBpdCBpbiB0
aGUgbmV4dCBzZXJpZXMuCj4gWy4uLl0KPiAKPj4gPiA+ICtzdGF0aWMgaW50IHdsZWRfY29uZmln
dXJlX292cF9pcnEoc3RydWN0IHdsZWQgKndsZWQsCj4+ID4gPiArCQkJCSAgc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPj4gPiA+ICt7Cj4+ID4gPiArCWludCByYzsKPj4gPiA+ICsJdTMy
IHZhbDsKPj4gPiA+ICsKPj4gPiA+ICsJd2xlZC0+b3ZwX2lycSA9IHBsYXRmb3JtX2dldF9pcnFf
YnluYW1lKHBkZXYsICJvdnAiKTsKPj4gPiA+ICsJaWYgKHdsZWQtPm92cF9pcnEgPCAwKSB7Cj4+
ID4gPiArCQlkZXZfZGJnKCZwZGV2LT5kZXYsICJvdnAgaXJxIGlzIG5vdCB1c2VkXG4iKTsKPj4g
Pgo+PiA+IEkgYXNzdW1lIHRoaXMgaXMgb3B0aW9uYWwuICBXaGF0IGhhcHBlbnMgaWYgbm8gSVJR
IGlzIHByb3ZpZGVkPwo+PiA+Cj4+IEhlcmUgT1ZQIElSUSBpcyB1c2VkIHRvIGRldGVjdCB0aGUg
d3Jvbmcgc3RyaW5nIGRldGVjdGlvbi4gSWYgaXQgaXMgCj4+IG5vdAo+PiBwcm92aWRlZCB0aGUg
YXV0byBzdHJpbmcgZGV0ZWN0aW9uIGxvZ2ljIHdvbid0IHdvcmsuCj4gCj4gIk9WUCBJUlEgbm90
IGZvdW5kIC0gZGlzYWJsaW5nIGF1dG9tYXRpYyBzdHJpbmcgZGV0ZWN0aW9uIgo+IApTdXJlLiBX
aWxsIHVwZGF0ZSBpdCBpbiB0aGUgbmV4dCBzZXJpZXMuCj4+ID4gSWYsIGZvciBpbnN0YW5jZSwg
cG9sbGluZyBtb2RlIGlzIGVuYWJsZWQsIG1heWJlIHNvbWV0aGluZyBsaWtlIHRoaXMKPj4gPiB3
b3VsZCBiZSBiZXR0ZXI/Cj4+ID4KPj4gPiAgICAgICBkZXZfd2FybigmcGRldi0+ZGV2LCAiTm8g
SVJRIGZvdW5kLCBmYWxsaW5nIGJhY2sgdG8gcG9sbGluZwo+PiA+IG1vZGVcbiIpOwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
