Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B3CCB3F
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E666C6E3BC;
	Sat,  5 Oct 2019 16:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327E26EB4A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 11:40:56 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 0FB28602F2; Fri,  4 Oct 2019 11:40:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id 3E641614B5;
 Fri,  4 Oct 2019 11:40:55 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 04 Oct 2019 17:10:55 +0530
From: kgunda@codeaurora.org
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH V6 5/8] backlight: qcom-wled: Restructure the driver for
 WLED3
In-Reply-To: <6f50ea19-f320-b4e6-f269-4d1e2189fa77@ti.com>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-6-git-send-email-kgunda@codeaurora.org>
 <6f50ea19-f320-b4e6-f269-4d1e2189fa77@ti.com>
Message-ID: <7300c740873439b341d05ee40e071c3f@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1570189256;
 bh=ripHZzJ25rIS8dQQRxX/6LaM0R0g+Keu+K/houPPzd0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R3024MVWCCQCzJyN7l7EPvE6OimHjRwpfQ1q4AMmwx3hH5cz6hAKcI4HltdkcfgAc
 CcFrVwaR8zBHBuWXMaxcA0paxWbuCAkl/wvl8jfbU7Ey+jheo9/SYXX4rcOdwwA1jf
 KdRxyuK3t93WGAwKZS4qJ3KeNH2bdF/1AWcXYdkY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1570189255;
 bh=ripHZzJ25rIS8dQQRxX/6LaM0R0g+Keu+K/houPPzd0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nzm3x7gi6Cr0TVvrsQvNSRUYb5+6KKewDbjcBIgCiixY8wy2Xu9fSgcD2qR2u9xDr
 F86dOqf+oyr754oV9v4r+JeemzF8pOVIcQyAS6AfciI891D6YdEdGyGMeffzjbYBi/
 OFHbeR3xAIGiuXhigwdb6Ye09pV6lL0lVroympqM=
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
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wMSAyMDo0NywgRGFuIE11cnBoeSB3cm90ZToKPiBLaXJhbgo+IAo+IE9uIDkv
MzAvMTkgMTozOSBBTSwgS2lyYW4gR3VuZGEgd3JvdGU6Cj4+IFJlc3RydWN0dXJlIHRoZSBkcml2
ZXIgdG8gYWRkIHRoZSBzdXBwb3J0IGZvciBuZXcgV0xFRAo+PiBwZXJpcGhlcmFscy4KPj4gCj4+
IFNpZ25lZC1vZmYtYnk6IEtpcmFuIEd1bmRhIDxrZ3VuZGFAY29kZWF1cm9yYS5vcmc+Cj4+IEFj
a2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+PiAt
LS0KPj4gICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYyB8IDM5NSAKPj4gKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI0
NSBpbnNlcnRpb25zKCspLCAxNTAgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgCj4+IGIvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcWNvbS13bGVkLmMKPj4gaW5kZXggZjE5MTI0Mi4uNzQwZjFiNiAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPj4gKysrIGIvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPj4gQEAgLTcsNTkgKzcsNzEgQEAKPj4gICAjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3Mu
aD4KPj4gICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4+ICAgICAvKiBGcm9tIERUIGJpbmRp
bmcgKi8KPj4gKyNkZWZpbmUgV0xFRF9NQVhfU1RSSU5HUwkJCQk0Cj4+ICsKPj4gICAjZGVmaW5l
IFdMRURfREVGQVVMVF9CUklHSFRORVNTCQkJCTIwNDgKPj4gICAtI2RlZmluZSBXTEVEM19TSU5L
X1JFR19CUklHSFRfTUFYCQkJMHhGRkYKPj4gLSNkZWZpbmUgV0xFRDNfQ1RSTF9SRUdfVkFMX0JB
U0UJCQkJMHg0MAo+PiArI2RlZmluZSBXTEVEX1NJTktfUkVHX0JSSUdIVF9NQVgJCQkweEZGRgo+
IAo+IFdoeSBkaWQgeW91IGNoYW5nZSBzb21lIG9mIHRoZXNlIGFnYWluPwo+IAo+IENhbiB5b3Ug
anVzdCBjaGFuZ2UgaXQgdG8gdGhlIGZpbmFsICNkZWZpbmUgaW4gcGF0Y2ggNC84Pwo+IAo+IERh
bgo+IAo+IDxzbmlwPgpPay4uIExvb2tzIGxpa2Ugc29tZSB0aGluZyB3ZW50IHdyb25nIHdpdGgg
dGhpcyBzZXJpZXMuIEkgd2lsbCByZS11cGxvYWQgCml0IGFnYWluLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
