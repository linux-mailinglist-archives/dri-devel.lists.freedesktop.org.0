Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B74E29B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 11:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B9C6E82F;
	Fri, 21 Jun 2019 09:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD776E83F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:04:20 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w13so9063680eds.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 02:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=U2b/yBDUn2uxWh84cUIQKg+GqhT7DNRX+9D0eV4BYx0=;
 b=stnYmKcUa44KcFSrlhVnm7vs3bik2f/nPEgqpDBh+55Nxl731kzM91YjC/22V/nb6U
 1y3AkmSX+55FmPgNqtekoWpJKAXpZK5o140T45TWinzDJrCYBfHrrMBY9H8pKz+H2zd8
 YuQ/5wfaYCeoX3HltNhJCiMaRauvRgKcxvkhhWKAgEJ1/FtN4I85ZT4bLkpm3Mzaqiaj
 nnXeNHiL2np8Lke2JI/dHuH5+9SOltg9V5Od/DN5hsJj2cADS0R6r6FQy3MURF9ArNHD
 J4YH9/8Y3Lq/lO+32NN/crgGhHPb0843K+5OGVu9IB4MXjEYkX/uKWAM4oekuHjnQnH4
 /vfQ==
X-Gm-Message-State: APjAAAXZBJoXkArOI3s9N1OBW42np+SbhPpx4kb0Cs3KhRqRfEU+RZyx
 HX2BM2DsiKmwNlV+twSX/b8zNw==
X-Google-Smtp-Source: APXvYqzqBoWvjvXM4lrIaSCxZfX9YLrVK1oWpzeuauWLMJPPlPE+IUOZ9YVWpg82mA+3sRhl0+KeQA==
X-Received: by 2002:a17:906:6c19:: with SMTP id
 j25mr45383796ejr.21.1561107859109; 
 Fri, 21 Jun 2019 02:04:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j30sm654087edb.8.2019.06.21.02.04.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 02:04:18 -0700 (PDT)
Date: Fri, 21 Jun 2019 11:04:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/2] DRM: Add KMS driver for the Ingenic JZ47xx SoCs
Message-ID: <20190621090411.GY12905@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
References: <20190603152331.23160-1-paul@crapouillou.net>
 <20190603152331.23160-2-paul@crapouillou.net>
 <20190619122622.GB29084@ravnborg.org>
 <1561040159.1978.0@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561040159.1978.0@crapouillou.net>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=U2b/yBDUn2uxWh84cUIQKg+GqhT7DNRX+9D0eV4BYx0=;
 b=hXCUBy0vJZx/iaLqA18XGnONO5xU0CBUctQ9kVsR+JlFuzMPmjyatmNwL7y3Je4J3B
 NZd7KNNLq0qD0brieEut21alVmiz2awz3K38YaDoe6x/nbnhz/mkhTOAn9nogfGlixvA
 DAvioi8fkMHMxT1Eh9fLjg3ytJibj/3a/mwK4=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 Artur Rojek <contact@artur-rojek.eu>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMDQ6MTU6NTlQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiAKPiAKPiBMZSBtZXIuIDE5IGp1aW4gMjAxOSDDoCAxNDoyNiwgU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPiBhIMOpY3JpdCA6Cj4gPiBIaSBQYXVsLgo+ID4gCj4gPiBPbiBN
b24sIEp1biAwMywgMjAxOSBhdCAwNToyMzozMVBNICswMjAwLCBQYXVsIENlcmN1ZWlsIHdyb3Rl
Ogo+ID4gPiAgQWRkIGEgS01TIGRyaXZlciBmb3IgdGhlIEluZ2VuaWMgSlo0N3h4IGZhbWlseSBv
ZiBTb0NzLgo+ID4gPiAgVGhpcyBkcml2ZXIgaXMgbWVhbnQgdG8gcmVwbGFjZSB0aGUgYWdpbmcg
ano0NzQwLWZiIGRyaXZlci4KPiA+ID4gCj4gPiA+ICBUaGlzIGRyaXZlciBkb2VzIG5vdCBtYWtl
IHVzZSBvZiB0aGUgc2ltcGxlIHBpcGUgaGVscGVyLCBmb3IgdGhlCj4gPiA+IHJlYXNvbgo+ID4g
PiAgdGhhdCBpdCB3aWxsIHNvb24gYmUgdXBkYXRlZCB0byBzdXBwb3J0IG1vcmUgYWR2YW5jZWQg
ZmVhdHVyZXMgbGlrZQo+ID4gPiAgbXVsdGlwbGUgcGxhbmVzLCBJUFUgaW50ZWdyYXRpb24gZm9y
IGNvbG9yc3BhY2UgY29udmVyc2lvbiBhbmQKPiA+ID4gdXAvZG93bgo+ID4gPiAgc2NhbGluZywg
c3VwcG9ydCBmb3IgRFNJIGRpc3BsYXlzLCBhbmQgVFYtb3V0IGFuZCBIRE1JIG91dHB1dHMuCj4g
PiA+IAo+ID4gPiAgU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxv
dS5uZXQ+Cj4gPiA+ICBUZXN0ZWQtYnk6IEFydHVyIFJvamVrIDxjb250YWN0QGFydHVyLXJvamVr
LmV1Pgo+ID4gPiAgLS0tCj4gPiA+IAo+ID4gPiAgTm90ZXM6Cj4gPiA+ICAgICAgdjI6IC0gUmVt
b3ZlIGN1c3RvbSBoYW5kbGluZyBvZiBwYW5lbC4gVGhlIHBhbmVsIGlzIG5vdwo+ID4gPiBkaXNj
b3ZlcmVkIHVzaW5nCj4gPiA+ICAgICAgCSAgdGhlIHN0YW5kYXJkIEFQSS4KPiA+ID4gICAgICAJ
LSBMb3RzIG9mIHNtYWxsIHR3ZWFrcyBzdWdnZXN0ZWQgYnkgdXBzdHJlYW0KPiA+ID4gCj4gPiA+
ICAgICAgdjM6IC0gVXNlIGRldm1fZHJtX2Rldl9pbml0KCkKPiA+ID4gICAgICAJLSBVcGRhdGUg
Y29tcGF0aWJsZSBzdHJpbmdzIHRvIC1sY2QgaW5zdGVhZCBvZiAtZHJtCj4gPiA+ICAgICAgCS0g
QWRkIGRlc3Ryb3koKSBjYWxsYmFja3MgdG8gcGxhbmUgYW5kIGNydGMKPiA+ID4gICAgICAJLSBU
aGUgaW5nZW5pYyxsY2QtbW9kZSBpcyBub3cgcmVhZCBmcm9tIHRoZSBicmlkZ2UncyBEVCBub2Rl
Cj4gPiA+IAo+ID4gPiAgICAgIHY0OiBSZW1vdmUgaW5nZW5pYyxsY2QtbW9kZSBwcm9wZXJ0eSBj
b21wbGV0ZWx5LiBUaGUgdmFyaW91cwo+ID4gPiBtb2RlcyBhcmUgbm93Cj4gPiA+ICAgICAgCWRl
ZHVjZWQgZnJvbSB0aGUgY29ubmVjdG9yIHR5cGUsIHRoZSBwaXhlbCBmb3JtYXQgb3IgdGhlIGJ1
cwo+ID4gPiBmbGFncy4KPiA+ID4gCj4gPiA+ICAgICAgdjU6IC0gRml4IGZyYW1lYnVmZmVyIHNp
emUgaW5jb3JyZWN0bHkgY2FsY3VsYXRlZCBmb3IgMjRicHAKPiA+ID4gZnJhbWVidWZmZXJzCj4g
PiA+ICAgICAgCS0gVXNlIDMyYnBwIGZyYW1lYnVmZmVyIGluc3RlYWQgb2YgMTZicHAsIGFzIGl0
J2xsIHdvcmsgd2l0aAo+ID4gPiBib3RoCj4gPiA+ICAgICAgCSAgMTYtYml0IGFuZCAyNC1iaXQg
cGFuZWwKPiA+ID4gICAgICAJLSBHZXQgcmlkIG9mIGRybV9mb3JtYXRfcGxhbmVfY3BwKCkgd2hp
Y2ggaGFzIGJlZW4gZHJvcHBlZAo+ID4gPiB1cHN0cmVhbQo+ID4gPiAgICAgIAktIEF2b2lkIHVz
aW5nIGRybV9mb3JtYXRfaW5mby0+ZGVwdGgsIHdoaWNoIGlzIGRlcHJlY2F0ZWQuCj4gPiBJbiB0
aGUgZHJtIHdvcmxkIHdlIGluY2x1ZGUgdGhlIHJldmlzaW9uIG5vdGVzIGluIHRoZSBjaGFuZ2Vs
b2cuCj4gPiBTbyBJIGRpZCB0aGlzIHdoZW4gSSBhcHBsaWVkIGl0IHRvIGRybS1taXNjLW5leHQu
Cj4gPiAKPiA+IEZpeGVkIGEgZmV3IHRyaXZpYWwgY2hlY2twYXRjaCB3YXJuaW5ncyBhYm91dCBp
bmRlbnQgdG9vLgo+ID4gVGhlcmUgd2FzIGEgZmV3IHRvby1sb25nLWxpbmVzIHdhcm5pbmdzIHRo
YXQgSSBpZ25vcmVkLiBGaXhpbmcgdGhlbQo+ID4gd291bGQgaGF2ZSBodXJ0IHJlYWRhYmlsaXR5
Lgo+IAo+IFRoYW5rcy4KPiAKPiA+IEkgYXNzdW1lIHlvdSB3aWxsIG1haW50YWluIHRoaXMgZHJp
dmVyIG9ud2FyZHMgZnJvbSBub3cuCj4gPiBQbGVhc2UgcmVxdWVzdCBkcm0tbWlzYyBjb21taXQg
cmlnaHRzIChzZWUKPiA+IGh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy93aWtpL0FjY291bnRS
ZXF1ZXN0cy8pCj4gPiBZb3Ugd2lsbCBuZWVkIGEgbGVnYWN5IFNTSCBhY2NvdW50Lgo+IAo+IEkg
cmVxdWVzdGVkIGFuIGFjY291bnQgaGVyZToKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvZnJlZWRlc2t0b3AvZnJlZWRlc2t0b3AvaXNzdWVzLzE2MgoKVGhpcyA0MDRzIGZvciBtZS4g
RGlkIHlvdSBzZXQgdGhlIGlzc3VlIHRvIHByaXZhdGUgYnkgYW55IGNoYW5jZT8gT3IKZGVsZXRl
ZCBhbHJlYWR5IGFnYWluPwotRGFuaWVsCgo+IAo+ID4gQW5kIHlvdSBzaG91bGQgZmFtaWxpYXJp
emUgeW91cnNlbGYgd2l0aCB0aGUgbWFpbnRhaW5lci10b29sczoKPiA+IGh0dHBzOi8vZHJtLnBh
Z2VzLmZyZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL2luZGV4Lmh0bWwKPiA+IAo+ID4g
Rm9yIG15IHVzZSBJIHVzZSAiZGltIHVwZGF0ZS1icmFuY2hlczsgZGltIGFwcGx5OyBkaW0gcHVz
aAo+ID4gU28gb25seSBhIHNtYWxsIHN1YnNldCBpIG5lZWRlZCBmb3Igc2ltcGxlIHVzZS4KPiA+
IAo+ID4gCVNhbQo+IAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
