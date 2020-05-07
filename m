Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0F61CA67B
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891DB6EAA9;
	Fri,  8 May 2020 08:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5696E97D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 12:05:03 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y4so6042727wrm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 05:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SGLZlKnkNOnrlUlvXwMl7HftcltiGBbmSFp2HVAgndo=;
 b=hyOUNYAOsDZKWWqHCOixppyA2yCLRZdjUpF+RZnLHJBqItce6dT4UizQy9FOZP1e/6
 GD25wLUYiSaxA5z5dL4LZPFo16kDESKVMvBka04Xb1mVcYBVKol0kPH8DABhlWrCIE6C
 NWDn/AYSYQp70jIqgz+VJ/64jgwWsJTMlNt1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SGLZlKnkNOnrlUlvXwMl7HftcltiGBbmSFp2HVAgndo=;
 b=kiyDwKFFEu+3nJd+Piq32WF3FCNpaDeXPBmdiIgVRTTQvJqkwOtj0gNqUztTdMrflA
 B5KCndqz77DlQCK0eevrRFkT6azPaJEZDoLblgHiWj/cS6BUkzTwOW5hNdoO31m4fPTr
 bH8CEFQ0cV4zTVne7d//jicrPIECj1LExIWfdhtCKJn1qySKjI9Zq4LAYNcl5ZE9tMf1
 XkEwzzlhzvz18gIo8vfrqjkUH7wmc24kOAnH14OZXZTD+BQ6NjH6mEDqs8wcLxHVsvny
 Yxs8O0zMfNcusKPdqJVGpIHQGR4RzWlh2ay2hahIC3jk3QqZGc/sUuZRTF24ctC4yZ9M
 pa0w==
X-Gm-Message-State: AGi0Puau2jDkJvOmlGkrV9hiVW82oXu0Kf4BHmW8ogKFuX7499fX9RIq
 +7UYHFA39+KAPiF5KWtvaWhv1xoPCulDd/6Jts8ryw==
X-Google-Smtp-Source: APiQypJH/afwUatYj1jaGjcUvHgD7oUYTlF8oDz2/GOBg3Wm44EhgjgOvQ7zBU70+FdGW2IMbo2TwNg/1PKujG5i3hk=
X-Received: by 2002:a5d:4e06:: with SMTP id p6mr14710611wrt.35.1588853101604; 
 Thu, 07 May 2020 05:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
 <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
 <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
 <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
 <CAAOTY_9+s8EknSFLyYHNDfJuxERTuubBXaQ41Y3J+DeuDMFGqA@mail.gmail.com>
 <CAECpkiM5ez8=iEe=fYKiDf5Pb6AHrTyt5uXqJQtQpQJHotupWA@mail.gmail.com>
 <CAAOTY__B+8XY=5n5C2AYBGskRhvOs2PmHVhjKJk7NmXDVM_-Nw@mail.gmail.com>
In-Reply-To: <CAAOTY__B+8XY=5n5C2AYBGskRhvOs2PmHVhjKJk7NmXDVM_-Nw@mail.gmail.com>
From: Anand Mistry <amistry@chromium.org>
Date: Thu, 7 May 2020 22:04:50 +1000
Message-ID: <CAECpkiOjLZrr3yqG83D6kWiWKh9XmBnbtLEeeYTn-kdxC5V7dw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
Cc: Anand K Mistry <amistry@google.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgNiwgMjAyMCBhdCAxMDo1OSBQTSBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSwgQW5hbmQ6Cj4KPiBBbmFuZCBNaXN0cnkgPGFt
aXN0cnlAY2hyb21pdW0ub3JnPiDmlrwgMjAyMOW5tDXmnIg25pelIOmAseS4iSDkuIvljYg3OjAz
5a+r6YGT77yaCj4gPgo+ID4gT24gV2VkLCBNYXkgNiwgMjAyMCBhdCAxMDoyNSBBTSBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpLCBB
bmFuZCwKPiA+ID4KPiA+ID4gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+
IOaWvCAyMDIw5bm0NOaciDI55pelIOmAseS4iSDkuIrljYgxMjozN+Wvq+mBk++8mgo+ID4gPiA+
Cj4gPiA+ID4gSGksIEFuYW5kLAo+ID4gPiA+Cj4gPiA+ID4gQW5hbmQgSy4gTWlzdHJ5IDxhbWlz
dHJ5QGNocm9taXVtLm9yZz4g5pa8IDIwMjDlubQ05pyIMjjml6Ug6YCx5LqMIOS4iuWNiDk6NTTl
r6vpgZPvvJoKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBTdW4sIDI2IEFwciAyMDIwIGF0IDE4OjA0
LCBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IEhpLCBBbmFuZDoKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQW5hbmQg
SyBNaXN0cnkgPGFtaXN0cnlAY2hyb21pdW0ub3JnPiDmlrwgMjAyMOW5tDTmnIgyMOaXpSDpgLHk
uIAg5LiL5Y2IMjowOeWvq+mBk++8mgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSWYgZG1h
X21hcF9zZygpIG1lcmdlcyBwYWdlcyB3aGVuIGNyZWF0aW5nIHRoZSBtYXBwaW5nLCBvbmx5IHRo
ZSBmaXJzdAo+ID4gPiA+ID4gPiA+IGVudHJpZXMgd2lsbCBoYXZlIGEgdmFsaWQgc2dfZG1hX2Fk
ZHJlc3MoKSBhbmQgc2dfZG1hX2xlbigpLCBmb2xsb3dlZCBieQo+ID4gPiA+ID4gPiA+IGVudHJp
ZXMgd2l0aCBzZ19kbWFfbGVuKCkgPT0gMC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEFuYW5kIEsgTWlzdHJ5IDxhbWlzdHJ5QGdvb2dsZS5jb20+Cj4gPiA+Cj4g
PiA+IEF1dGhvciBzaG91bGQgc2lnbiBvZmYgdGhpcyBwYXRjaCwgcGxlYXNlIGdpdmUgYSBzaWdu
IG9mZiB0YWcgYnkgYXV0aG9yLgo+ID4KPiA+IFNvcnJ5LCBlbWFpbCBpc3N1ZXMgbWVhbnQgaSBz
ZW50IHRoZSBwYXRjaCBmcm9tIGEgZGlmZmVyZW50IGFjY291bnQuCj4gPiBTaG91bGQgSSByZS1z
ZW5kIHRoZQo+ID4gcGF0Y2ggZnJvbSB0aGUgc2FtZSBhY2NvdW50IGFzIHRoZSBzaWduLW9mZiBs
aW5lPyBJJ20gc3RpbGwgd29ya2luZyBteQo+ID4gd2F5IHRocm91Z2ggdGhlIGtlcm5lbCBwYXRj
aCBwcm9jZXNzLgo+ID4KPgo+IElmIHlvdSB3YW50IHRvIHVzZSBjaHJvbWl1bSBhY2NvdW50LCB5
b3UgY291bGQgc2ltcGx5IHJlcGx5IHRoaXMgZW1haWwKPiB3aXRoIGEgc2lnbi1vZmYtYnkgdGFn
IG9mIGNocm9taXVtIGFjY291bnQuCgpBY2suIFRoaXMgaXMgZmluZSBmb3Igbm93LiBJJ2xsIHRy
eSBkb2luZyBpdCBiZXR0ZXIgd2l0aCB0aGUgbmV4dCBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IEFu
YW5kIEsgTWlzdHJ5IDxhbWlzdHJ5QGNocm9taXVtLm9yZz4KCj4KPiBSZWdhcmRzLAo+IENodW4t
S3VhbmcuCj4KPiA+ID4KPiA+ID4gUmVnYXJkcywKPiA+ID4gQ2h1bi1LdWFuZy4KPiA+ID4KPiA+
ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZ2VtLmMgfCAzICsrKwo+ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9nZW0uYwo+ID4gPiA+ID4gPiA+IGluZGV4IGIwNGEzYzJiMTExZTA5Li5mOGZk
OGI5OGMzMGUzZCAxMDA2NDQKPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gPiA+ID4gPiA+ID4gQEAgLTIyNCw2ICsyMjQsOSBAQCBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm10a19nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgICAgICAgIGV4
cGVjdGVkID0gc2dfZG1hX2FkZHJlc3Moc2ctPnNnbCk7Cj4gPiA+ID4gPiA+ID4gICAgICAgICBm
b3JfZWFjaF9zZyhzZy0+c2dsLCBzLCBzZy0+bmVudHMsIGkpIHsKPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgaWYgKCFzZ19kbWFfbGVuKHMpKQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIHRoaW5rIHRoaXMg
c2hvdWxkIGJlICdjb250aW51ZScKPiA+ID4gPiA+Cj4gPiA+ID4gPiBzY2F0dGVybGlzdC5oIGhh
cyB0aGUgY29tbWVudDoKPiA+ID4gPiA+IC8qCj4gPiA+ID4gPiAgKiBUaGVzZSBtYWNyb3Mgc2hv
dWxkIGJlIHVzZWQgYWZ0ZXIgYSBkbWFfbWFwX3NnIGNhbGwgaGFzIGJlZW4gZG9uZQo+ID4gPiA+
ID4gICogdG8gZ2V0IGJ1cyBhZGRyZXNzZXMgb2YgZWFjaCBvZiB0aGUgU0cgZW50cmllcyBhbmQg
dGhlaXIgbGVuZ3Rocy4KPiA+ID4gPiA+ICAqIFlvdSBzaG91bGQgb25seSB3b3JrIHdpdGggdGhl
IG51bWJlciBvZiBzZyBlbnRyaWVzIGRtYV9tYXBfc2cKPiA+ID4gPiA+ICAqIHJldHVybnMsIG9y
IGFsdGVybmF0aXZlbHkgc3RvcCBvbiB0aGUgZmlyc3Qgc2dfZG1hX2xlbihzZykgd2hpY2gKPiA+
ID4gPiA+ICAqIGlzIDAuCj4gPiA+ID4gPiAgKi8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTbyBicmVh
a2luZyBvbiB0aGUgZmlyc3Qgc2dfZG1hX2xlbihzZykgPT0gMCBhcHBlYXJzIHRvIGJlIChvbmUg
b2YpCj4gPiA+ID4gPiB0aGUgZG9jdW1lbnRlZCBhcHByb2FjaC4KPiA+ID4gPiA+Cj4gPiA+ID4K
PiA+ID4gPiBPa2F5LCB5b3UncmUgcmlnaHQuIFNvCj4gPiA+ID4KPiA+ID4gPiBSZXZpZXdlZC1i
eTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gPiA+ID4KPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiA+ID4gQ2h1bi1LdWFuZy4KPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGlmIChz
Z19kbWFfYWRkcmVzcyhzKSAhPSBleHBlY3RlZCkgewo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIERSTV9FUlJPUigic2dfdGFibGUgaXMgbm90IGNvbnRpZ3VvdXMiKTsKPiA+
ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ID4gPiA+
ID4gPiA+IC0tCj4gPiA+ID4gPiA+ID4gMi4yNi4xLjMwMS5nNTViYzNlYjdjYjktZ29vZwo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiA+ID4gPiA+IExpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdAo+ID4gPiA+ID4gPiA+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiA+ID4gPiA+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
