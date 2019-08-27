Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8699EFEB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 18:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC6F89B70;
	Tue, 27 Aug 2019 16:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F55689B70
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 16:16:42 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g24so4782061edu.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=/4vkB4jsz3HMn/y1OvFa0QtMWaVVKUXYtk7xoXQcR1Q=;
 b=NKAG20DEf5Q0R9DZvIkl77tZO9Cg2RdP8ZQiyV6fscjrztS0sR/3ioxxlHP4Rj8JUU
 zwBmlrxv3rSmo++wy7xOfPt4uoWuQNRUo5dK8JoN2CwaQMXBnbE1mTh6YVq5aNK3dQUO
 qwFbzDrMBxDyi/CAN90blpyh2rhfVmkXJx3fUaivAwGcl3FDTMeLzazo6gD9Tcjv/E5S
 aRqlca849JdZR1dq6hZjUhgU1lfnZqHWSvpprmLmYt7qEyzJZ1hDV0Wtw7Tb+QtX+YKV
 8rV6u4/HvVnfyCwYW18/1fdg5s/s1QvxOD4ZZ4kCG3rzq5FthxjRW1FKkNl5P0NFuA0x
 J0Kw==
X-Gm-Message-State: APjAAAU1zG/Ckn3L9VZlJQY/tILOcxnBW4tud8zkmrAmveUa0iq2gZzk
 CIj7GJfJF7sjCGGiKyrgsBfRpQ==
X-Google-Smtp-Source: APXvYqy35QyWP0tugDh45Pcrj95ojvkirbBJRhnC4o+YTHQ+nHmoDWdP74SYgYSAtZoBVAidYWl6YA==
X-Received: by 2002:a17:906:b29a:: with SMTP id
 q26mr22076728ejz.144.1566922601045; 
 Tue, 27 Aug 2019 09:16:41 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l26sm3559267ejg.70.2019.08.27.09.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 09:16:40 -0700 (PDT)
Date: Tue, 27 Aug 2019 18:16:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 01/26] drm/dp_mst: Move link address dumping into a
 function
Message-ID: <20190827161637.GB2112@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, Juston Li <juston.li@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <hwentlan@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org
References: <20190718014329.8107-1-lyude@redhat.com>
 <20190718014329.8107-2-lyude@redhat.com>
 <20190808195318.GQ7444@phenom.ffwll.local>
 <5d44346ecb6ab13d9f01142f33d4ff1029054067.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d44346ecb6ab13d9f01142f33d4ff1029054067.camel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=/4vkB4jsz3HMn/y1OvFa0QtMWaVVKUXYtk7xoXQcR1Q=;
 b=eb9Lr5VWWi7xb+OTFQHRxQ6sGLIQJtep/LHzUK62vSCqq5y5DlKsE/gbuGBgVjzT/U
 N1FTZm7i8hATAp9oRTsWbh8zPj3ZFe3QCVfH+yumMMw+fBu9uFSUFoyW0VxYaYa/g+cY
 VXheIz2v1+pW9d7Zm5weWQvsypsXnZLd6DbhE=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDU6NTE6MjZQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiAqc2lnaCogZmluYWxseSBoYXZlIHNvbWUgdGltZSB0byBnbyB0aHJvdWdoIHRoZXNlIHJl
dmlld3MKCkhleSBpdCB0b29rIG1lIGxvbmdlciB0byBzdGFydCBldmVuIHJldmlld2luZyB0aGlz
LCBhbmQgbm90IGV2ZW4gdGhyb3VnaAo6LSggdGhhbiBpdCB0b29rIHlvdSB0byByZXBseSBoZXJl
LiBTbyBubyB3b3JyaWVzIQoKPiBqZnlpOiBJIHJlYWxpemVkIGFmdGVyIGxvb2tpbmcgb3ZlciB0
aGlzIHBhdGNoIHRoYXQgaXQncyBub3QgYWN0dWFsbHkgbmVlZGVkIC0KPiBJIGhhZCBiZWVuIHBs
YW5uaW5nIG9uIHVzaW5nIGRybV9kcF9kdW1wX2xpbmtfYWRkcmVzcygpIGZvciBvdGhlciB0aGlu
Z3MsIGJ1dAo+IGVuZGVkIHVwIGRlY2lkaW5nIHRvIG1ha2UgdGhlIGZpbmFsIHBsYW4gdG8gdXNl
IHNvbWV0aGluZyB0aGF0IGR1bXBzIGludG8gYQo+IGZvcm1hdCB0aGF0J3MgaWRlbnRpY2FsIHRv
IHRoZSBvbmUgd2UncmUgdXNpbmcgZm9yIGR1bXBpbmcgRE9XTiByZXF1ZXN0cy4gSU1ITwo+IHRo
b3VnaCwgdGhpcyBwYXRjaCBkb2VzIG1ha2UgdGhpbmdzIGxvb2sgbmljZXIgc28gSSdsbCBwcm9i
YWJseSBrZWVwIGl0Lgo+IAo+IEFzc3VtaW5nIEkgY2FuIHN0aWxsIGNvdW50IHlvdXIgci1iIGFz
IHZhbGlkIHdpdGggYSBjaGFuZ2UgdG8gdGhlIGNvbW1pdAo+IGRlc2NyaXB0aW9uPwoKU3VyZS4K
CkNoZWVycywgRGFuaWVsCgo+IAo+IE9uIFRodSwgMjAxOS0wOC0wOCBhdCAyMTo1MyArMDIwMCwg
RGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFdlZCwgSnVsIDE3LCAyMDE5IGF0IDA5OjQyOjI0
UE0gLTA0MDAsIEx5dWRlIFBhdWwgd3JvdGU6Cj4gPiA+IFNpbmNlIHdlJ3JlIGFib3V0IHRvIGJl
IGNhbGxpbmcgdGhpcyBmcm9tIG11bHRpcGxlIHBsYWNlcy4gQWxzbyBpdCBtYWtlcwo+ID4gPiB0
aGluZ3MgZWFzaWVyIHRvIHJlYWQhCj4gPiA+IAo+ID4gPiBDYzogSnVzdG9uIExpIDxqdXN0b24u
bGlAaW50ZWwuY29tPgo+ID4gPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgo+
ID4gPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
PiA+ID4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4gCj4gPiBSZXZpZXdlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IAo+ID4gPiAtLS0K
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAzNSArKysrKysr
KysrKysrKysrKystLS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYwo+ID4gPiBpbmRleCAwOTg0YjlhMzRkNTUuLjk5ODA4MWI5YjIwNSAx
MDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gPiA+IEBA
IC0yMDEzLDYgKzIwMTMsMjggQEAgc3RhdGljIHZvaWQgZHJtX2RwX3F1ZXVlX2Rvd25fdHgoc3Ry
dWN0Cj4gPiA+IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCj4gPiA+ICAJbXV0ZXhfdW5s
b2NrKCZtZ3ItPnFsb2NrKTsKPiA+ID4gIH0KPiA+ID4gIAo+ID4gPiArc3RhdGljIHZvaWQKPiA+
ID4gK2RybV9kcF9kdW1wX2xpbmtfYWRkcmVzcyhzdHJ1Y3QgZHJtX2RwX2xpbmtfYWRkcmVzc19h
Y2tfcmVwbHkgKnJlcGx5KQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBkcm1fZHBfbGlua19hZGRy
X3JlcGx5X3BvcnQgKnBvcnRfcmVwbHk7Cj4gPiA+ICsJaW50IGk7Cj4gPiA+ICsKPiA+ID4gKwlm
b3IgKGkgPSAwOyBpIDwgcmVwbHktPm5wb3J0czsgaSsrKSB7Cj4gPiA+ICsJCXBvcnRfcmVwbHkg
PSAmcmVwbHktPnBvcnRzW2ldOwo+ID4gPiArCQlEUk1fREVCVUdfS01TKCJwb3J0ICVkOiBpbnB1
dCAlZCwgcGR0OiAlZCwgcG46ICVkLCBkcGNkX3JldjoKPiA+ID4gJTAyeCwgbWNzOiAlZCwgZGRw
czogJWQsIGxkcHMgJWQsIHNkcCAlZC8lZFxuIiwKPiA+ID4gKwkJCSAgICAgIGksCj4gPiA+ICsJ
CQkgICAgICBwb3J0X3JlcGx5LT5pbnB1dF9wb3J0LAo+ID4gPiArCQkJICAgICAgcG9ydF9yZXBs
eS0+cGVlcl9kZXZpY2VfdHlwZSwKPiA+ID4gKwkJCSAgICAgIHBvcnRfcmVwbHktPnBvcnRfbnVt
YmVyLAo+ID4gPiArCQkJICAgICAgcG9ydF9yZXBseS0+ZHBjZF9yZXZpc2lvbiwKPiA+ID4gKwkJ
CSAgICAgIHBvcnRfcmVwbHktPm1jcywKPiA+ID4gKwkJCSAgICAgIHBvcnRfcmVwbHktPmRkcHMs
Cj4gPiA+ICsJCQkgICAgICBwb3J0X3JlcGx5LT5sZWdhY3lfZGV2aWNlX3BsdWdfc3RhdHVzLAo+
ID4gPiArCQkJICAgICAgcG9ydF9yZXBseS0+bnVtX3NkcF9zdHJlYW1zLAo+ID4gPiArCQkJICAg
ICAgcG9ydF9yZXBseS0+bnVtX3NkcF9zdHJlYW1fc2lua3MpOwo+ID4gPiArCX0KPiA+ID4gK30K
PiA+ID4gKwo+ID4gPiAgc3RhdGljIHZvaWQgZHJtX2RwX3NlbmRfbGlua19hZGRyZXNzKHN0cnVj
dCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAo+ID4gPiAgCQkJCSAgICAgc3RydWN0IGRy
bV9kcF9tc3RfYnJhbmNoICptc3RiKQo+ID4gPiAgewo+ID4gPiBAQCAtMjAzOCwxOCArMjA2MCw3
IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9zZW5kX2xpbmtfYWRkcmVzcyhzdHJ1Y3QKPiA+ID4gZHJt
X2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiA+ID4gIAkJCURSTV9ERUJVR19LTVMoImxpbmsg
YWRkcmVzcyBuYWsgcmVjZWl2ZWRcbiIpOwo+ID4gPiAgCQl9IGVsc2Ugewo+ID4gPiAgCQkJRFJN
X0RFQlVHX0tNUygibGluayBhZGRyZXNzIHJlcGx5OiAlZFxuIiwgdHhtc2ctCj4gPiA+ID5yZXBs
eS51LmxpbmtfYWRkci5ucG9ydHMpOwo+ID4gPiAtCQkJZm9yIChpID0gMDsgaSA8IHR4bXNnLT5y
ZXBseS51LmxpbmtfYWRkci5ucG9ydHM7IGkrKykKPiA+ID4gewo+ID4gPiAtCQkJCURSTV9ERUJV
R19LTVMoInBvcnQgJWQ6IGlucHV0ICVkLCBwZHQ6ICVkLCBwbjoKPiA+ID4gJWQsIGRwY2RfcmV2
OiAlMDJ4LCBtY3M6ICVkLCBkZHBzOiAlZCwgbGRwcyAlZCwgc2RwICVkLyVkXG4iLCBpLAo+ID4g
PiAtCQkJCSAgICAgICB0eG1zZy0KPiA+ID4gPnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ldLmlu
cHV0X3BvcnQsCj4gPiA+IC0JCQkJICAgICAgIHR4bXNnLQo+ID4gPiA+cmVwbHkudS5saW5rX2Fk
ZHIucG9ydHNbaV0ucGVlcl9kZXZpY2VfdHlwZSwKPiA+ID4gLQkJCQkgICAgICAgdHhtc2ctCj4g
PiA+ID5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5wb3J0X251bWJlciwKPiA+ID4gLQkJCQkg
ICAgICAgdHhtc2ctCj4gPiA+ID5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5kcGNkX3Jldmlz
aW9uLAo+ID4gPiAtCQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9ydHNbaV0u
bWNzLAo+ID4gPiAtCQkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIucG9ydHNbaV0u
ZGRwcywKPiA+ID4gLQkJCQkgICAgICAgdHhtc2ctCj4gPiA+ID5yZXBseS51LmxpbmtfYWRkci5w
b3J0c1tpXS5sZWdhY3lfZGV2aWNlX3BsdWdfc3RhdHVzLAo+ID4gPiAtCQkJCSAgICAgICB0eG1z
Zy0KPiA+ID4gPnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ldLm51bV9zZHBfc3RyZWFtcywKPiA+
ID4gLQkJCQkgICAgICAgdHhtc2ctCj4gPiA+ID5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXS5u
dW1fc2RwX3N0cmVhbV9zaW5rcyk7Cj4gPiA+IC0JCQl9Cj4gPiA+ICsJCQlkcm1fZHBfZHVtcF9s
aW5rX2FkZHJlc3MoJnR4bXNnLT5yZXBseS51LmxpbmtfYWRkcik7Cj4gPiA+ICAKPiA+ID4gIAkJ
CWRybV9kcF9jaGVja19tc3RiX2d1aWQobXN0YiwgdHhtc2ctCj4gPiA+ID5yZXBseS51Lmxpbmtf
YWRkci5ndWlkKTsKPiA+ID4gIAo+ID4gPiAtLSAKPiA+ID4gMi4yMS4wCj4gPiA+IAo+IC0tIAo+
IENoZWVycywKPiAJTHl1ZGUgUGF1bAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
