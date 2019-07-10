Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730F96526F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805CB6E149;
	Thu, 11 Jul 2019 07:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92736E104
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:05:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t28so2428757lje.9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 08:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=plj7Pya5YTb4+cAp/1kpLYGyDPb7au0yoFGuKe+7qFY=;
 b=DB36qfx6QO6FhzZvv9rl7JN1sGcef9wU6w4tlCwi1BhMqoOWWhmayaXFphcst1atBl
 bn9JRQu9l0RFP4qmpQ1nNfiXpIyz5HUj8v47cl580/jQ/etl7h7on0QBPCeVAdX/apW7
 l+dzfXjfRuGzytYHRmmd8xGGDYT/0qE9m2rqTfSGx8axQIEDBxlLD5ouYzYMnTBDWaLg
 jaqlo3zLVtXZ1HfjCuSxajoJcTN4arW2V/GNacCPMDQ80oqqgnCcJH+GLLV81gUUvmIG
 kORf/VfxhLngE90aUYEiVEKmXJC69EquBp1ZzxAFlmIwE9Mt3u7n0yAbJqGgj0AubDLO
 3TJQ==
X-Gm-Message-State: APjAAAWT6XAmXrRH8KnxzfpiH84gUjmO8IKz6hs56X2djRg76txlLfCd
 5iLSzCD7v9UHLNl8gWAZIeU=
X-Google-Smtp-Source: APXvYqyE3tu3WfUYC8HKZAgmJ8SO73hKeBP5o5kHfZaJXhL6Y/c0NQz/jCvjk3O3RopNPtYNbJJP5w==
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr17934150ljm.180.1562771121206; 
 Wed, 10 Jul 2019 08:05:21 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id u17sm393025lfq.69.2019.07.10.08.05.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 08:05:19 -0700 (PDT)
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710101229.54ufuhmh22dfxclr@flea>
 <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
 <20190710125552.qvmnh6qs63ikiu2k@flea>
 <f530844d-70f2-c3cc-d5f6-b435f1dbdfd2@gmail.com>
 <20190710130615.gvi2jwgr2cds66xr@flea>
 <75719cad-c65c-7ebc-3ea8-98134f86ddc3@gmail.com>
 <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
 <20190710140504.t5lsk36gnn5cdn6b@flea>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e7d78307-4a48-45b1-ffbe-bc397fec0e40@gmail.com>
Date: Wed, 10 Jul 2019 18:05:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710140504.t5lsk36gnn5cdn6b@flea>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=plj7Pya5YTb4+cAp/1kpLYGyDPb7au0yoFGuKe+7qFY=;
 b=dn1ffGe6dth9Oa2U3ErOvNerY11cGz6vSJElqa5YXlbDwn30Ve3ooVZEXWn4IUU6Bs
 lCd4gQbTwemMSWty9NBDGmwbHsUYE3SYt3Q5RV8UKmx8O138s11CuV12EnV9F+6IpHAb
 BC0Brhev7dXYSCFMTz1QEuWxB2Xfo2dha2glR6d3oEAN3ws7f0FMV4pUfG89QFFEldk6
 bwqBAcgMOdy2IJcN3zGmbusThrE1zwx+jZfXZdb1Xdw/cYIqz7r8I5N6Wqtp9dal1XgZ
 QZL0oVaomRXUvUQQTu/Av76U3o4gWyuwRR03ThcHSdG0j8xI4LYEXFpxfoXFlxDKr4cM
 7hYg==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTAuMDcuMjAxOSAxNzowNSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IE9uIFdlZCwgSnVs
IDEwLCAyMDE5IGF0IDA0OjI5OjE5UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4g
VGhpcyB3b3JrczoKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50
X21vZGVzZXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwo+PiBpbmRl
eCA1NmQzNjc3OWQyMTMuLmU1YTJmOWM4ZjQwNCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xp
ZW50X21vZGVzZXQuYwo+PiBAQCAtMTgyLDYgKzE4Miw4IEBAIGRybV9jb25uZWN0b3JfcGlja19j
bWRsaW5lX21vZGUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPj4gICAgICAgICBt
b2RlID0gZHJtX21vZGVfY3JlYXRlX2Zyb21fY21kbGluZV9tb2RlKGNvbm5lY3Rvci0+ZGV2LCBj
bWRsaW5lX21vZGUpOwo+PiAgICAgICAgIGlmIChtb2RlKQo+PiAgICAgICAgICAgICAgICAgbGlz
dF9hZGQoJm1vZGUtPmhlYWQsICZjb25uZWN0b3ItPm1vZGVzKTsKPj4gKyAgICAgICBlbHNlCj4+
ICsgICAgICAgICAgICAgICBjbWRsaW5lX21vZGUtPnNwZWNpZmllZCA9IGZhbHNlOwo+IAo+IEht
bW0sIGl0J3Mgbm90IGNsZWFyIHRvIG1lIHdoeSB0aGF0IHdvdWxkbid0IGJlIHRoZSBjYXNlLgo+
IAo+IElmIHdlIGNvbWUgYmFjayB0byB0aGUgYmVnaW5uaW5nIG9mIHRoYXQgZnVuY3Rpb24sIHdl
IHJldHJpZXZlIHRoZQo+IGNtZGxpbmVfbW9kZSBidWZmZXIgZnJvbSB0aGUgY29ubmVjdG9yIHBv
aW50ZXIsIHRoYXQgd2lsbCBwcm9iYWJseQo+IGhhdmUgYmVlbiBwYXJzZWQgYSBmaXJzdCB0aW1l
IHVzaW5nIGRybV9tb2RlX2NyZWF0ZV9mcm9tX2NtZGxpbmVfbW9kZQo+IGluIGRybV9oZWxwZXJf
cHJvYmVfYWRkX2NtZGxpbmVfbW9kZS4KPiAKPiBOb3csIEknbSBndWVzc2luZyB0aGF0IHRoZSBp
c3N1ZSBpcyB0aGF0IGluCj4gZHJtX21vZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0
b3IsIGlmIHdlIGhhdmUgYSBuYW1lZCBtb2RlLCB3ZQo+IGp1c3QgY29weSB0aGUgbW9kZSBvdmVy
IGFuZCBzZXQgbW9kZS0+c3BlY2lmaWVkLgo+IAo+IEFuZCB3ZSB0aGVuIG1vdmUgb3ZlciB0byBk
byBvdGhlciBjaGVja3MsIGFuZCB0aGF0J3MgcHJvYmFibHkgd2hhdAo+IGZhaWxzIGFuZCByZXR1
cm5zLCBidXQgb3VyIGRybV9jbWRsaW5lX21vZGUgd2lsbCBoYXZlIGJlZW4gbW9kaWZpZWQuCj4g
Cj4gSSdtIG5vdCBlbnRpcmVseSBzdXJlIGhvdyB0byBkZWFsIHdpdGggdGhhdCB0aG91Z2guCj4g
Cj4gSSBndWVzcyB3ZSBjb3VsZCBhbGxvY2F0ZSBhIGRybV9jbWRsaW5lX21vZGUgc3RydWN0dXJl
IG9uIHRoZSBzdGFjaywKPiBmaWxsIHRoYXQsIGFuZCBpZiBzdWNjZXNzZnVsIGNvcHkgb3ZlciBp
dHMgY29udGVudCB0byB0aGUgb25lIGluCj4gZHJtX2Nvbm5lY3Rvci4gVGhhdCB3b3VsZCBhbGxv
dyB1cyB0byBvbmx5IGNoYW5nZSB0aGUgY29udGVudCBvbgo+IHN1Y2Nlc3MsIHdoaWNoIGlzIHdo
YXQgSSB3b3VsZCBleHBlY3QgZnJvbSBzdWNoIGEgZnVuY3Rpb24/Cj4gCj4gSG93IGRvZXMgdGhh
dCBzb3VuZD8KCkkgbm93IHNlZSB0aGF0IHRoZXJlIGlzIERSTV9NT0RFX1RZUEVfVVNFUkRFRiBm
bGFnIHRoYXQgaXMgYXNzaWduZWQgb25seQpmb3IgdGhlICJjbWRsaW5lIiBtb2RlIGFuZCBkcm1f
Y2xpZW50X3JvdGF0aW9uKCkgaXMgdGhlIG9ubHkgcGxhY2UgaW4KRFJNIGNvZGUgdGhhdCBjYXJl
cyBhYm91dCB3aGV0aGVyIG1vZGUgaXMgZnJvbSBjbWRsaW5lLCBoZW5jZSBsb29rcyBsaWtlCml0
IHdpbGwgYmUgbW9yZSBjb3JyZWN0IHRvIGRvIHRoZSBmb2xsb3dpbmc6CgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCmIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jbGllbnRfbW9kZXNldC5jCmluZGV4IDU2ZDM2Nzc5ZDIxMy4uZTViM2JlOWVkNjg5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCkBAIC04MjUsNiArODI1LDcgQEAgYm9vbCBk
cm1fY2xpZW50X3JvdGF0aW9uKHN0cnVjdCBkcm1fbW9kZV9zZXQKKm1vZGVzZXQsIHVuc2lnbmVk
IGludCAqcm90YXRpb24pCiB7CiAgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciA9IG1vZGVzZXQtPmNvbm5lY3RvcnNbMF07CiAgICAgICAgc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUgPSBtb2Rlc2V0LT5jcnRjLT5wcmltYXJ5OworICAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9t
b2RlICptb2RlID0gbW9kZXNldC0+bW9kZTsKICAgICAgICBzdHJ1Y3QgZHJtX2NtZGxpbmVfbW9k
ZSAqY21kbGluZTsKICAgICAgICB1NjQgdmFsaWRfbWFzayA9IDA7CiAgICAgICAgdW5zaWduZWQg
aW50IGk7CkBAIC04NTksNyArODYwLDcgQEAgYm9vbCBkcm1fY2xpZW50X3JvdGF0aW9uKHN0cnVj
dCBkcm1fbW9kZV9zZXQKKm1vZGVzZXQsIHVuc2lnbmVkIGludCAqcm90YXRpb24pCiAgICAgICAg
ICogc2ltcGxlIFhPUiBiZXR3ZWVuIHRoZSB0d28gaGFuZGxlIHRoZSBhZGRpdGlvbiBuaWNlbHku
CiAgICAgICAgICovCiAgICAgICAgY21kbGluZSA9ICZjb25uZWN0b3ItPmNtZGxpbmVfbW9kZTsK
LSAgICAgICBpZiAoY21kbGluZS0+c3BlY2lmaWVkKSB7CisgICAgICAgaWYgKG1vZGUtPmZsYWdz
ICYgRFJNX01PREVfVFlQRV9VU0VSREVGKSB7CiAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
Y21kbGluZV9yZXN0LCBwYW5lbF9yZXN0OwogICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGNt
ZGxpbmVfcm90LCBwYW5lbF9yb3Q7CiAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc3VtX3Jv
dCwgc3VtX3Jlc3Q7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
