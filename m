Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05AAF5129
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 17:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5B66FA00;
	Fri,  8 Nov 2019 16:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6049A6F9FE;
 Fri,  8 Nov 2019 16:33:30 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id q70so6816122wme.1;
 Fri, 08 Nov 2019 08:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d12YzuQ4OOUJW5jPNwfT02SFHHJndjYuWq6ftUtWsrs=;
 b=LrgQnsm/0iSNE3h8bDumh+NJUFk+ZiYWevDmrhc32jbw4e/hnify8HDuxMnoF5zRoO
 uUQjbQ4WpFZqRTwCAGz3OPq3sFy8U2xsnbtyggd++ECuEf3kpYHOnDB282Ss9TsDzYWP
 r611Hf2+Es1ZOzxHydInjthhE9V68RaAfgNIkcz9sxz/VEf8P8HmEpejfvPbXTdZ9577
 p8H8jEZzXNlVVymtanCvCyu8ZGn1aH/oBVtjM5ALdGxHe0yi23kD0k0GS643BUgiDTxv
 eMjEQ6gCzHuZt6WWyvSIMXj6uMIJFQEppDpRCiAjP1ttfDQ8f2+37U5P1PGnrY+62Uk1
 qpXg==
X-Gm-Message-State: APjAAAVactVB1We1Tf/KGlvyQBkFKKoybGRVpCs50FYhTDOvdB4S/chH
 xyu/wCB9dd6ViSlfT2khKMI0Va93r2GCVm6EDrU=
X-Google-Smtp-Source: APXvYqwDzBxaGdrNz3PUj2ft/eTIeajp+L0S1d7eD+nlwoY1n6dyrDrLCFcmllMwSL/eFK2mKhAx8g+ub81oS65uLUQ=
X-Received: by 2002:a7b:c408:: with SMTP id k8mr9513409wmi.67.1573230808946;
 Fri, 08 Nov 2019 08:33:28 -0800 (PST)
MIME-Version: 1.0
References: <20191108143814.118856-1-colin.king@canonical.com>
 <7155ecfc-1aff-002d-9cc6-e097525e7cb6@amd.com>
In-Reply-To: <7155ecfc-1aff-002d-9cc6-e097525e7cb6@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Nov 2019 11:33:16 -0500
Message-ID: <CADnq5_OgwugkJAkHvcdMsKGvdL_jYxS5g8L-697cWQwh-Wy-mg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: fix dereference of pointer
 aconnector when it is null
To: Mikita Lipski <mlipski@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=d12YzuQ4OOUJW5jPNwfT02SFHHJndjYuWq6ftUtWsrs=;
 b=h/7Q83+Y+UWeONi2+mS2jpHkFnqQbs0EGaw6F+I5lOb1idZNWlNQJcHE8VRqK+919v
 MJtnB2E5oqbrnqJseQ5n9vZCCaUb49lpaDtPF69tYDZHijCkW6Dd9PF/mEgCW/qop6oN
 nEnmBsv25XYLCW90WcfFX2H8QGXcPEcbMG/PeyiBvCpV1DGKagiOruvQ9Q6RvgEV9M7j
 EN8bHyLricAhahgyrOV/h6q4byTLh5jzYO8H7k55Di9zdlmE8EQNyFettwfOXZfHFm69
 iDJpqa7iv1utUeG562OARQrbJLwRWcjOoblSjv1EE68R3Cbz2cA6pUdvo49sAIyY0FOs
 IS1A==
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Colin King <colin.king@canonical.com>,
 "Lipski, Mikita" <Mikita.Lipski@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgTm92IDgsIDIwMTkgYXQgOTo0MiBBTSBN
aWtpdGEgTGlwc2tpIDxtbGlwc2tpQGFtZC5jb20+IHdyb3RlOgo+Cj4gVGhhbmtzIQo+Cj4gUmV2
aWV3ZWQtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KPgo+IE9uIDA4
LjExLjIwMTkgOTozOCwgQ29saW4gS2luZyB3cm90ZToKPiA+IEZyb206IENvbGluIElhbiBLaW5n
IDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gPgo+ID4gQ3VycmVudGx5IHBvaW50ZXIgYWNv
bm5lY3RvciBpcyBiZWluZyBkZXJlZmVyZW5jZWQgYnkgdGhlIGNhbGwgdG8KPiA+IHRvX2RtX2Nv
bm5lY3Rvcl9zdGF0ZSBiZWZvcmUgaXQgaXMgYmVpbmcgbnVsbCBjaGVja2VkLCB0aGlzIGNvdWxk
Cj4gPiBsZWFkIHRvIGEgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlLiAgRml4IHRoaXMgYnkgY2hl
Y2tpbmcgdGhhdAo+ID4gYWNvbm5lY3RvciBpcyBudWxsIGJlZm9yZSBkZXJlZmVyZW5jaW5nIGl0
Lgo+ID4KPiA+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJEZXJlZmVyZW5jZSBiZWZvcmUgbnVsbCBj
aGVjayIpCj4gPiBGaXhlczogNTEzM2M2MjQxZDljICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgTVNU
IGF0b21pYyByb3V0aW5lcyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29s
aW4ua2luZ0BjYW5vbmljYWwuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyB8IDUgKystLS0KPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
aGVscGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1faGVscGVycy5jCj4gPiBpbmRleCBlM2NkYTY5ODRkMjguLjcyZTY3Nzc5NmE0OCAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X2hlbHBlcnMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG1faGVscGVycy5jCj4gPiBAQCAtMTkzLDEyICsxOTMsMTEgQEAgYm9vbCBkbV9o
ZWxwZXJzX2RwX21zdF93cml0ZV9wYXlsb2FkX2FsbG9jYXRpb25fdGFibGUoCj4gPiAgICAgICAg
KiB0aGF0IGJsb2NrcyBiZWZvcmUgY29tbWl0IGd1YXJhbnRlZWluZyB0aGF0IHRoZSBzdGF0ZQo+
ID4gICAgICAgICogaXMgbm90IGdvbm5hIGJlIHN3YXBwZWQgd2hpbGUgc3RpbGwgaW4gdXNlIGlu
IGNvbW1pdCB0YWlsICovCj4gPgo+ID4gLSAgICAgZG1fY29ubl9zdGF0ZSA9IHRvX2RtX2Nvbm5l
Y3Rvcl9zdGF0ZShhY29ubmVjdG9yLT5iYXNlLnN0YXRlKTsKPiA+IC0KPiA+IC0KPiA+ICAgICAg
IGlmICghYWNvbm5lY3RvciB8fCAhYWNvbm5lY3Rvci0+bXN0X3BvcnQpCj4gPiAgICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPiA+Cj4gPiArICAgICBkbV9jb25uX3N0YXRlID0gdG9fZG1fY29u
bmVjdG9yX3N0YXRlKGFjb25uZWN0b3ItPmJhc2Uuc3RhdGUpOwo+ID4gKwo+ID4gICAgICAgbXN0
X21nciA9ICZhY29ubmVjdG9yLT5tc3RfcG9ydC0+bXN0X21ncjsKPiA+Cj4gPiAgICAgICBpZiAo
IW1zdF9tZ3ItPm1zdF9zdGF0ZSkKPiA+Cj4KPiAtLQo+IFRoYW5rcywKPiBNaWtpdGEgTGlwc2tp
Cj4gbWlraXRhLmxpcHNraUBhbWQuY29tCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
