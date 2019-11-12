Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D4F8D16
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E526EB09;
	Tue, 12 Nov 2019 10:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547346EB09
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:43:28 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-JmRQ4R2GO4S0sMcOw9sByg-1; Tue, 12 Nov 2019 05:43:25 -0500
Received: by mail-wr1-f70.google.com with SMTP id p4so5793589wrw.15
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 02:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kme6VSnMy8rUI6wpP6tUkhrAQZjUXGsLSgokSoEz3u0=;
 b=YOqjZHTitEGrhxkiH9OjmDLeuUI0GXznPGuuLzL7nDrLsPWIe1lp5DZs/FL4f/P1xx
 aQfhBRhqF4ycSKQfXcozanNVst1hRCiHzeQfKturvLJoSkkIsYJkU+r0ArEnc6pDSKZa
 Zf2kfBA96MCdldUWO8/VF84ORbaR0ro5nJUNEmENIEl8BZT7UCWaaswXxXoNi9oni4Fl
 q35vzW6tvRBkH7YaYKOqZlvPEtzy+adXB2I6j7nKli624p9jA7cHDUsSWpQNAeoNCiaN
 WSSN3gjLnGwbh6sKhMNNq/wVBQzHyR63iar4uBQ0K69DTh2diqyR+hWZw/3CNFNK/Thu
 WGDw==
X-Gm-Message-State: APjAAAW3/LSbaVESJ0jKabxT2O3si0RnipSG9if4ElIDyR0cGgC+tv5F
 VDOPY4GF1ZibjxHIiAxLATq1NzDthfY/OQCjLcEyPkKIuznPTOS0TPUzd+RX4EOi7PwXkcY6bZ+
 gmLu1tV1yx2tCQXPPMx9+fmFTD+II
X-Received: by 2002:a1c:41c2:: with SMTP id o185mr3090905wma.34.1573555403856; 
 Tue, 12 Nov 2019 02:43:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwCQM6wp7bUDBbI9aZDAjtTTdsaTRZNxqv+k6pwjmluV/aKlkkGlD6kXkUIylpzY6uFERshnA==
X-Received: by 2002:a1c:41c2:: with SMTP id o185mr3090888wma.34.1573555403684; 
 Tue, 12 Nov 2019 02:43:23 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id b3sm3683104wmh.17.2019.11.12.02.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2019 02:43:23 -0800 (PST)
Subject: Re: [PATCH 12/12] drm/connector: Hookup the new drm_cmdline_mode
 panel_orientation member
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191110154101.26486-1-hdegoede@redhat.com>
 <20191110154101.26486-13-hdegoede@redhat.com>
 <20191112094712.GH23790@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <13ce5629-045a-7d70-ecfa-7acdfada9d1f@redhat.com>
Date: Tue, 12 Nov 2019 11:43:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191112094712.GH23790@phenom.ffwll.local>
Content-Language: en-US
X-MC-Unique: JmRQ4R2GO4S0sMcOw9sByg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573555407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xNiqyGgU8HKdnDOQW70dK23k6F4XCgpdnBdRXMdYvO4=;
 b=AZdf+wP+Co+kZhGpEsbGqjrnfnD2p8yXWbbqg6c96IcD/URR4IkuYRw1xsky+UWulfNf6d
 Py3bkPyh4kIgfjCYA/W8L2O1qcjhQheNA922zBFh3dUDpPEYIJSsZUqoXstWSQJVDstlE/
 +t2eYYVM0y+II8dnsbIzzKBud7yFAqQ=
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Mathieu_Alexandre-T=c3=a9treault?= <alexandretm@amotus.ca>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMi0xMS0yMDE5IDEwOjQ3LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFN1biwg
Tm92IDEwLCAyMDE5IGF0IDA0OjQxOjAxUE0gKzAxMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+
IElmIHRoZSBuZXcgdmlkZW89Li4uIHBhbmVsX29yaWVudGF0aW9uIG9wdGlvbiBpcyBzZXQgZm9y
IGEgY29ubmVjdG9yLCBob25vcgo+PiBpdCBhbmQgc2V0dXAgYSBtYXRjaGluZyAicGFuZWwgb3Jp
ZW50YXRpb24iIHByb3BlcnR5IG9uIHRoZSBjb25uZWN0b3IuCj4+Cj4+IEJ1Z0xpbms6IGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9wbHltb3V0aC9wbHltb3V0aC9tZXJnZV9yZXF1ZXN0
cy84Mwo+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29t
Pgo+IAo+IERvbid0IHdlIG5lZWQgb25lIG1vcmUgcGF0Y2ggaGVyZSB0byBjcmVhdGUgdGhlIHBh
bmVsIG9yaWVudGF0aW9uIHByb3BlcnR5Cj4gaWYgdGhlIGRyaXZlciBkb2Vzbid0IGRvIGl0PyBP
dGhlcndpc2UgdGhpcyB3b24ndCBoYXBwZW4sIGFuZCB1c2Vyc3BhY2UKPiBjYW4ndCBsb29rIGF0
IGl0IChvbmx5IHRoZSBpbnRlcm5hbCBmYmRldiBzdHVmZiwgd2hpY2ggaGFzIGl0J3Mgb3duCj4g
bGltaXRhdGlvbnMgd3J0IHJvdGF0aW9uKS4KClRoYXQgaXMgd2hhdCBwYXRjaCAxMS8xMiBpcyBm
b3IsIHRoYXQgcGF0Y2ggcmVuYW1lcyBkcm1fY29ubmVjdG9yX2luaXRfcGFuZWxfb3JpZW50YXRp
b24KdG8gZHJtX3NldF9wYW5lbF9vcmllbnRhdGlvbiBhbmQgbWFrZXMgaXQgYm90aCBzZXQsIGlu
aXQgYW5kIGF0dGFjaCB0aGUgcHJvcGVydHkKKHVubGVzcyBjYWxsZWQgd2l0aCBEUk1fTU9ERV9Q
QU5FTF9PUklFTlRBVElPTl9VTktOT1dOIGluIHdoaWNoIGNhc2UgaXQgaXMgYSBuby1vcCkuCgpQ
YXRjaCAxMS8xMiBhbHNvIG1ha2VzIGRybV9zZXRfcGFuZWxfb3JpZW50YXRpb24gZG8gdGhlIHNl
dCBvbmx5IG9uY2UsIHdoaWNoIGlzIHdoeQp0aGUgb3JpZW50YXRpb24gdG8gc2V0IGlzIG5vdyBw
YXNzZWQgaW5zdGVhZCBvZiBzdG9yZWQgZGlyZWN0bHkgaW4gdGhlIGNvbm5lY3RvciwKc28gdGhh
dCBhIHNlY29uZCBzZXQgY2FsbCAocGFuZWxfb3JpZW50YXRpb24gb2YgdGhlIGNvbm5lY3RvciBh
bHJlYWR5ICE9CkRSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV04pIGNhbiBiZSBza2lw
cGVkLCBzbyB0aGF0IHRoZSBjbWRsaW5lIG92ZXJyaWRlcwpkcml2ZXIgZGV0ZWNpb24gY29kZSBm
b3IgdGhpcy4KClJlZ2FyZHMsCgpIYW5zCgoKCj4gLURhbmllbAo+IAo+PiAtLS0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgNyArKysrKysrCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPj4gaW5kZXgg
NDBhOTg1YzQxMWE2Li41OTE5MTRmMDFjZDQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fY29ubmVjdG9yLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3Iu
Ywo+PiBAQCAtMTQwLDYgKzE0MCwxMyBAQCBzdGF0aWMgdm9pZCBkcm1fY29ubmVjdG9yX2dldF9j
bWRsaW5lX21vZGUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPj4gICAJCWNvbm5l
Y3Rvci0+Zm9yY2UgPSBtb2RlLT5mb3JjZTsKPj4gICAJfQo+PiAgIAo+PiArCWlmIChtb2RlLT5w
YW5lbF9vcmllbnRhdGlvbiAhPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9VTktOT1dOKSB7
Cj4+ICsJCURSTV9JTkZPKCJzZXR0aW5nIGNvbm5lY3RvciAlcyBwYW5lbF9vcmllbnRhdGlvbiB0
byAlZFxuIiwKPj4gKwkJCSBjb25uZWN0b3ItPm5hbWUsIG1vZGUtPnBhbmVsX29yaWVudGF0aW9u
KTsKPj4gKwkJZHJtX2Nvbm5lY3Rvcl9zZXRfcGFuZWxfb3JpZW50YXRpb24oY29ubmVjdG9yLAo+
PiArCQkJCQkJICAgIG1vZGUtPnBhbmVsX29yaWVudGF0aW9uKTsKPj4gKwl9Cj4+ICsKPj4gICAJ
RFJNX0RFQlVHX0tNUygiY21kbGluZSBtb2RlIGZvciBjb25uZWN0b3IgJXMgJXMgJWR4JWRAJWRI
eiVzJXMlc1xuIiwKPj4gICAJCSAgICAgIGNvbm5lY3Rvci0+bmFtZSwgbW9kZS0+bmFtZSwKPj4g
ICAJCSAgICAgIG1vZGUtPnhyZXMsIG1vZGUtPnlyZXMsCj4+IC0tIAo+PiAyLjIzLjAKPj4KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
