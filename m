Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5CE454A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A236E8DC;
	Fri, 25 Oct 2019 08:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E4F6E511
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 17:09:26 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n14so25829704ljj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 10:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IrAfe5w1HnK8l8FuW+hQKQUlkFSvckC54yQUeXG//ko=;
 b=kfG7PBVKzHpjRiuqsi+yWIxWz1YMxleP8RAd4B1d60wzSSbX8qGEHQqGGXTy3IGglU
 qPT3NWKzx9vncZrxMlidtfVCn53HLkQwQ2Eb+I2Re8UA+Is/TGrYI9n4tvADz0SMSDOG
 e0/T83NZp6E0MXyQxB0mC8/xYJMm10E4YmR2eCwjzPePrQtyMbxXTI7wSCu6aoNcOh8f
 eOaAfzBmrfTEfs+BKIhrj8aUMdiGbCaoiEXSWmvs/tVKZ35osi8QHo4p0baph+O0bHnm
 IwaVfGlYezt+LUVcCjTV2EvlPxeNeHppi8/rjdEh5ORypUZ+78OYSFfbTzR1KAhgNo9d
 Ehow==
X-Gm-Message-State: APjAAAWsOS0ZeImh1GuNuznqFy90JVL89mXgdrP1fSwIt6DtC70okxgE
 BIcEJVAAmTLpz09jRntZg4KdP0jv
X-Google-Smtp-Source: APXvYqxSkIhVMx2JQ4ozADmzdOXgHT9YOY73BRvR0bq+4cNTs8tWmZwy3WI9LUw0lgPggYogDS0wbg==
X-Received: by 2002:a2e:4e12:: with SMTP id c18mr27544082ljb.51.1571936965362; 
 Thu, 24 Oct 2019 10:09:25 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250]) by smtp.googlemail.com with ESMTPSA id
 n25sm10143389ljc.107.2019.10.24.10.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 10:09:24 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on
 client's registration
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20191024115016.GA2924027@ulmo>
 <55ab29ad-da9b-c178-4480-dc6edb09b3e4@gmail.com>
Message-ID: <b8a9fc65-3d2f-8461-e0de-83cbb45fea49@gmail.com>
Date: Thu, 24 Oct 2019 20:09:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <55ab29ad-da9b-c178-4480-dc6edb09b3e4@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IrAfe5w1HnK8l8FuW+hQKQUlkFSvckC54yQUeXG//ko=;
 b=mWbjhBCkHaL5glMlAQhj6Agacp7Li+u9if1i1Ymo2qjHZ1lHG0TLeYiSC97M/nRPK1
 Ad0R9qrXYKIE6zV1TcIBK6d9UtUT23ChFMh1uXvkVmiOVh+ukKHzfqd9bdHItfSID9zp
 X044GzJxWSpeVpQ8tT9dk7DRx6V/FBx6lF1HqtlZJe7X7D1saoe/5HFlvLT217poA8ns
 6skq943P1cTy+77942FQ8aBUiWYVacMA24Tn8E+YN7x6pNZABQ0Uwks5AW7Ezwtp+Y3o
 85GpDedISXW8N/FKjQOdMcGN+r4jQaswCPUeV9UUOumjOnhDiy8Zkj2hVDZxE9oLGH6W
 M/Ag==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjQuMTAuMjAxOSAxNjozNSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMjQuMTAuMjAx
OSAxNDo1MCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4gT24gU3VuLCBKdW4gMjMsIDIw
MTkgYXQgMDg6Mzc6NDFQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gT24gQVJN
MzIgd2UgZG9uJ3Qgd2FudCBhbnkgb2YgdGhlIGNsaWVudHMgZGV2aWNlIHRvIGJlIGJhY2tlZCBi
eSB0aGUKPj4+IGltcGxpY2l0IGRvbWFpbiwgc2ltcGx5IGJlY2F1c2Ugd2UgY2FuJ3QgYWZmb3Jk
IHN1Y2ggYSB3YXN0ZSBvbiBvbGRlcgo+Pj4gVGVncmEgU29DcyB0aGF0IGhhdmUgdmVyeSBmZXcg
ZG9tYWlucyBhdmFpbGFibGUgaW4gdG90YWwuIFRoZSByZWNlbnQgSU9NTVUKPj4+IHN1cHBvcnQg
YWRkaXRpb24gZm9yIHRoZSBWaWRlbyBEZWNvZGVyIGhhcmR3YXJlIHVuY292ZXJlZCB0aGUgcHJv
YmxlbQo+Pj4gdGhhdCBhbiB1bmZvcnR1bmF0ZSBkcml2ZXJzIHByb2JlIG9yZGVyIHJlc3VsdHMg
aW4gdGhlIERSTSBkcml2ZXIgcHJvYmUKPj4+IGZhaWx1cmUgaWYgQ09ORklHX0FSTV9ETUFfVVNF
X0lPTU1VPXkgZHVlIHRvIGEgc2hvcnRhZ2Ugb2YgSU9NTVUgZG9tYWlucwo+Pj4gY2F1c2VkIGJ5
IHRoZSBpbXBsaWNpdCBiYWNraW5nLiBUaGUgaG9zdDF4X2NsaWVudF9yZWdpc3RlcigpIGlzIGEg
Y29tbW9uCj4+PiBmdW5jdGlvbiB0aGF0IGlzIGludm9rZWQgYnkgYWxsIG9mIHRoZSByZWxldmFu
dCBEUk0gZHJpdmVycyBkdXJpbmcgdGhlaXJzCj4+PiBwcm9iZSBhbmQgaGVuY2UgaXQgaXMgY29u
dmVuaWVudCB0byByZW1vdmUgdGhlIGltcGxpY2l0IGJhY2tpbmcgdGhlcmUsCj4+PiByZXNvbHZp
bmcgdGhlIHByb2JsZW0uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxk
aWdldHhAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jIHwg
MTkgKysrKysrKysrKysrKysrKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspCj4+Cj4+IEkgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gZG8gdGhpcyBpbiBhIGNlbnRyYWwgcGxh
Y2UgbGlrZSB0aGlzLiBJZiB3ZQo+PiByZWFsbHkgZG8gbmVlZCB0aGlzLCB3aHkgY2FuJ3Qgd2Ug
ZG8gaXQgaW4gdGhlIGluZGl2aWR1YWwgZHJpdmVycz8KPiAKPiBXaHkgZG8geW91IHdhbnQgdG8g
ZHVwbGljYXRlIHRoZSBzYW1lIGFjdGlvbiBmb3IgZWFjaCBkcml2ZXIgaW5zdGVhZCBvZgo+IGRv
aW5nIGl0IGluIGEgc2luZ2xlIGNvbW1vbiBwbGFjZT8KPiAKPj4gd2UgYWxyZWFkeSBjYWxsIGhv
c3QxeF9jbGllbnRfaW9tbXVfYXR0YWNoKCkgZnJvbSBhbGwgdGhlIGRyaXZlcnMgYW5kCj4+IHRo
YXQgZGV0YWNoZXMgZnJvbSB0aGUgSU9NTVUgYXMgd2VsbC4gU28gSSdtIG5vdCBzdXJlIEkgdW5k
ZXJzdGFuZCB3aHkKPj4gdGhpcyBpcyBuZWVkZWQuCj4gCj4gV2lzaCB5b3UgY291bGQgYXNrIHRo
YXQgY291cGxlIG1vbnRocyBhZ28uIEknbGwgdHJ5IHRvIHJlZnJlc2ggdGhlIGRldGFpbHMuCj4g
CgpJbiBrZXJuZWwncyBib290IG9yZGVyOgoKMSkgSG9zdDF4IGlzIGF0dGFjaGVkIHRvIGV4Y2x1
c2l2ZSBpbXBsaWNpdCBkb21haW4KMikgSG9zdDF4IGlzIGRldGFjaGVkIGZyb20gdGhlIGltcGxp
Y2l0IGRvbWFpbiBhbmQgYXR0YWNoZWQgdG8gZXhwbGljaXQKMykgQm90aCBEQydzIGZhaWwgdG8g
YXR0YWNoIHRvIGltcGxpY2l0IGRvbWFpbiBiZWNhdXNlIERNQS1tYXBwaW5nIGNvZGUKZG9lc24n
dCB0YWtlIGludG8gYWNjb3VudCBtdWx0aXBsZSBkZXZpY2VzIGluIHRoZSBzYW1lIGdyb3VwLgo0
KSBHUjJEIGlzIGF0dGFjaGVkIHRvIGV4Y2x1c2l2ZSBpbXBsaWNpdCBkb21haW4KNSkgR1IzRCBp
cyBhdHRhY2hlZCB0byBleGNsdXNpdmUgaW1wbGljaXQgZG9tYWluCjYpIFZERSBpcyBhdHRhY2hl
ZCB0byBleGNsdXNpdmUgaW1wbGljaXQgZG9tYWluCjcpIFZERSBpcyBkZXRhY2hlZCBmcm9tIHRo
ZSBpbXBsaWNpdCBkb21haW4gYW5kIGF0dGFjaGVkIHRvIGV4cGxpY2l0CjgpIERDIGNsaWVudCBp
cyB0cnlpbmcgdG8gYXR0YWNoIHRvIERSTSBkb21haW4gaW4KaG9zdDF4X2NsaWVudF9pb21tdV9h
dHRhY2goKSBhbmQgdGhhdCBmYWlscyBiZWNhdXNlIHRlZ3JhLXNtbXUgY29kZQphbGxvY2F0ZXMg
QVNJRCBpbiB0ZWdyYV9zbW11X2F0dGFjaF9kZXYoKS0+dGVncmFfc21tdV9hc19wcmVwYXJlKCkg
KGkuZS4Kb24gSU9NTVUgZ3JvdXAncyBhdHRhY2hpbmcpIGFuZCBhbGwgQVNJRHMgYXJlIGFscmVh
ZHkgYnVzeS4KCkhlbmNlIGlmIERSTSBzdWItZGV2aWNlIGRyaXZlcnMgYXJlIGRldGFjaGluZyBm
cm9tIHRoZSBpbXBsaWNpdCBkb21haW4Kb24gcHJvYmUsIHRoZW4gdGhlIHByb2JsZW0gaXMgZ2V0
dGluZyB3b3JrZWQgYXJvdW5kIGJlY2F1c2UgdGhlcmUgYXJlCmF2YWlsYWJsZSBBU0lEcyBhdCB0
aGUgdGltZSBvZiBob3N0MXggY2xpZW50cyBpbml0aWFsaXphdGlvbi4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
