Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2694BCF3C6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388726E1ED;
	Tue,  8 Oct 2019 07:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887966E5D1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 13:03:38 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id i13so4003055uaq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 06:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ds8WznLX+NYi3ptkiUX0OCakAHSXETW90blbf1WdtvY=;
 b=rDrWUVMF4AjfVsPKfccg4SuMCGicIROm+GFiUTD9qGVUmIN7KDh/6zqggyq34xe4xw
 3utwiNFxN0K0HG2u+9s+7Fnn4HVjtR0M9f7EMOCz38heMMCqjDRW07ueubgTZ/XGSXAa
 tBou+Yx6sm55gg0FYY4j/UxmwghBSQlVsrGsSWtCh8S2aZEcxkjMj0S5+IENUy4S/ku4
 Z715jrxoT3kpHj7zoJM592E/U4hXmtMTVzLYXEBR9O1Z68cin3Y14kToY/Q6DiHcQ4FO
 ghGbZD/c4xVqNc8ppTsogNuSwBQ2C881+nj52MZ0mKk9HY+wRvitCl5alUX/wb7iTHO0
 /zZg==
X-Gm-Message-State: APjAAAU4YJG2EQFpYAnLKPt/yPeeQGbXeNHRYk7pIMkAfbFBMcMvIFNw
 tEOVZ7S1PFjiKymQWjSBBUL2v3zq9Fm4g5hIFG9Hqg==
X-Google-Smtp-Source: APXvYqyXRPLlM1sC+Qh9Y+U2YnUrT41/QnuLEzazUmqup77OPEOS8gKvErJCG8qbHkr6M+W+SZdp07y4EAEUpxg6cwg=
X-Received: by 2002:a9f:2924:: with SMTP id t33mr11661088uat.69.1570453416905; 
 Mon, 07 Oct 2019 06:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191003041438.194224-1-cychiang@chromium.org>
 <b8ad03db-b93f-44e0-ccd6-fc8bda1af223@baylibre.com>
In-Reply-To: <b8ad03db-b93f-44e0-ccd6-fc8bda1af223@baylibre.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 7 Oct 2019 21:03:10 +0800
Message-ID: <CAFv8Nw+xfqzKC+x9m-Zd-dmPNayXxqTCeo8JsO7pQn8Uk1Ybsw@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] drm/bridge: dw-hdmi: Restore audio when setting
 a mode
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ds8WznLX+NYi3ptkiUX0OCakAHSXETW90blbf1WdtvY=;
 b=SeFZrK8gMg6fY4PxMOK0NPAoUBk5SKZP6Rm2RpMc1sRZKgJg2NDDLR9yH+ZTkFrojb
 ECECpc6XwZXZYWrLpY3dkrOp1pLvCwRPEB3LV/Opy8prDkyQaXBI+0Em6seuvBwIpUf3
 WSFX4glUQS905Oi7/4W2htI0p1s5RzgKNERk4=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Doug Anderson <dianders@chromium.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Jaroslav Kysela <perex@perex.cz>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Yakir Yang <ykk@rock-chips.com>,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNywgMjAxOSBhdCA3OjU3IFBNIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25n
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIDAzLzEwLzIwMTkgMDY6MTQsIENo
ZW5nLVlpIENoaWFuZyB3cm90ZToKPiA+IEZyb206IERhbmllbCBLdXJ0eiA8ZGprdXJ0ekBjaHJv
bWl1bS5vcmc+Cj4gPgo+ID4gV2hlbiBzZXR0aW5nIGEgbmV3IGRpc3BsYXkgbW9kZSwgZHdfaGRt
aV9zZXR1cCgpIGNhbGxzCj4gPiBkd19oZG1pX2VuYWJsZV92aWRlb19wYXRoKCksIHdoaWNoIGRp
c2FibGVzIGFsbCBoZG1pIGNsb2NrcywgaW5jbHVkaW5nCj4gPiB0aGUgYXVkaW8gY2xvY2suCj4g
Pgo+ID4gV2Ugc2hvdWxkIG9ubHkgKHJlLSllbmFibGUgdGhlIGF1ZGlvIGNsb2NrIGlmIGF1ZGlv
IHdhcyBhbHJlYWR5IGVuYWJsZWQKPiA+IHdoZW4gc2V0dGluZyB0aGUgbmV3IG1vZGUuCj4gPgo+
ID4gV2l0aG91dCB0aGlzIHBhdGNoLCBvbiBSSzMyODgsIHRoZXJlIHdpbGwgYmUgSERNSSBhdWRp
byBvbiBzb21lIG1vbml0b3JzCj4gPiBpZiBpMnMgd2FzIHBsYXllZCB0byBoZWFkcGhvbmUgd2hl
biB0aGUgbW9uaXRvciB3YXMgcGx1Z2dlZC4KPiA+IEFDRVIgSDI3N0hVIGFuZCBBU1VTIFBCMjc4
IGFyZSB0d28gb2YgdGhlIG1vbml0b3JzIHNob3dpbmcgdGhpcyBpc3N1ZS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNocm9taXVtLm9yZz4KPiA+IFNp
Z25lZC1vZmYtYnk6IERhbmllbCBLdXJ0eiA8ZGprdXJ0ekBjaHJvbWl1bS5vcmc+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZYWtpciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+Cj4gPiAtLS0KPiA+ICBD
aGFuZ2UgZnJvbSB2MSB0byB2MjoKPiA+ICAgLSBVc2UgYXVkaW9fbG9jayB0byBwcm90ZWN0IGF1
ZGlvIGNsb2NrLgo+ID4gICAtIEZpeCB0aGUgcGF0Y2ggdGl0bGUuCj4gPgo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMTMgKysrKysrKysrKysrLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiA+IGluZGV4IGFhN2Vm
ZDRkYTFjOC4uNzQ5ZDhlNGM1MzViIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5jCj4gPiBAQCAtMTk4Miw2ICsxOTgyLDE3IEBAIHN0YXRpYyB2b2lk
IGhkbWlfZGlzYWJsZV9vdmVyZmxvd19pbnRlcnJ1cHRzKHN0cnVjdCBkd19oZG1pICpoZG1pKQo+
ID4gICAgICAgICAgICAgICAgICAgSERNSV9JSF9NVVRFX0ZDX1NUQVQyKTsKPiA+ICB9Cj4gPgo+
ID4gK3N0YXRpYyB2b2lkIGR3X2hkbWlfYXVkaW9fcmVzdG9yZShzdHJ1Y3QgZHdfaGRtaSAqaGRt
aSkKPiA+ICt7Cj4gPiArICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ID4gKwo+ID4gKyAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJmhkbWktPmF1ZGlvX2xvY2ssIGZsYWdzKTsKPiA+ICsKPiA+ICsg
ICAgIGhkbWlfZW5hYmxlX2F1ZGlvX2NsayhoZG1pLCBoZG1pLT5hdWRpb19lbmFibGUpOwo+ID4g
Kwo+ID4gKyAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaGRtaS0+YXVkaW9fbG9jaywgZmxh
Z3MpOwo+Cj4gRHVtYiBxdWVzdGlvbiwgd2h5IGlzIHRoaXMgcHJvdGVjdGVkIGJ5IGEgc3Bpbmxv
Y2sgPwo+Cj4gTmVpbAo+CgpIaSBOZWlsLApUaGFua3MgZm9yIHRoZSByZXZpZXcuCkdvb2QgY2F0
Y2guIEkgZm91bmQgdGhhdCB0aGUgc3BpbmxvY2sgYXVkaW9fbG9jayB3YXMgaW50cm9kdWNlZCBp
bgoKYjkwMTIwYTk2NjA4IGRybTogYnJpZGdlL2R3X2hkbWk6IGludHJvZHVjZSBpbnRlcmZhY2Vz
IHRvIGVuYWJsZSBhbmQKZGlzYWJsZSBhdWRpbwoKdG8gcHJvdGVjdCBOL0NUUyB2YWx1ZS4KQWN0
dWFsbHkgaXQgd2FzIG5vdCB1c2VkIHRvIHByb3RlY3QgYXVkaW8gY2xvY2suClNvIHdlIGRvbid0
IG5lZWQgdGhpcyBzcGlubG9jay4KCkhpIERhbmllbCBLdXJ0eiwKSWYgdGhpcyByaW5ncyBhbnkg
YmVsbCBpbiB5b3VyIG1lbW9yeSBhcyBmb3Igd2h5IHRoaXMgaXMgcHJvdGVjdGVkLApwbGVhc2Ug
bGV0IG1lIGtub3cuCkkgd291bGQgbGlrZSB0byByZW1vdmUgdGhpcyBzcGlubG9jayBhbmQgc2lt
cGxpZnkgdGhpcyBwYXRjaCBpbiB2My4KClRoYW5rcyEKCgo+ID4gK30KPiA+ICsKPiA+ICBzdGF0
aWMgaW50IGR3X2hkbWlfc2V0dXAoc3RydWN0IGR3X2hkbWkgKmhkbWksIHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptb2RlKQo+ID4gIHsKPiA+ICAgICAgIGludCByZXQ7Cj4gPiBAQCAtMjA0NSw3
ICsyMDU2LDcgQEAgc3RhdGljIGludCBkd19oZG1pX3NldHVwKHN0cnVjdCBkd19oZG1pICpoZG1p
LCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiA+Cj4gPiAgICAgICAgICAgICAgIC8q
IEhETUkgSW5pdGlhbGl6YXRpb24gU3RlcCBFIC0gQ29uZmlndXJlIGF1ZGlvICovCj4gPiAgICAg
ICAgICAgICAgIGhkbWlfY2xrX3JlZ2VuZXJhdG9yX3VwZGF0ZV9waXhlbF9jbG9jayhoZG1pKTsK
PiA+IC0gICAgICAgICAgICAgaGRtaV9lbmFibGVfYXVkaW9fY2xrKGhkbWksIHRydWUpOwo+ID4g
KyAgICAgICAgICAgICBkd19oZG1pX2F1ZGlvX3Jlc3RvcmUoaGRtaSk7Cj4gPiAgICAgICB9Cj4g
Pgo+ID4gICAgICAgLyogbm90IGZvciBEVkkgbW9kZSAqLwo+ID4KPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
