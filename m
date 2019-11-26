Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA1510A0EB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 16:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058BE6E160;
	Tue, 26 Nov 2019 15:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403ED6E135
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 15:02:10 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id b11so3546750wmj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 07:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Eds29OjUfSPXSvjNz82SaWfwB6i48CoSCGFNE5t56zc=;
 b=gtFQQXJVPWbr9kSJRRPIkA2d2JWa2SZD/o54D5sCuBVt/0Blv8cPtmNesVLlyY4Oey
 uaMMkwOD8lJyixu38Vec5SE6zihf84sYfrceTyE/jAriciQBu/vr0MbfuDF/WrB3hudg
 SOfT966KtkPQBwPcTG4clA6FQANTXLCkvrpIAmcYgBmbCZtQ+0QLcJf0AaNM/wefFCAQ
 xtnduFIXiTLFJqw/zXWjuxha4smhLtQMCkvDXqz4I/lIZ3bNO16NuDfkcUWml16y2W7M
 +eNjWz8MiWwVcMJDRxwfpDSRaATXtCeEfF4cyQKzjUyx4L1Z1MM+dp2Ob7IOUIgIVjbn
 HlXQ==
X-Gm-Message-State: APjAAAVyW1wNkOV8g1V1f6yd1L7HEJZWy/WiPPyJAVfqAxU4R2fvnqhL
 OAn339Lb2ommOWPdTpdpsN7YBQ==
X-Google-Smtp-Source: APXvYqz34pwd7WuLruJaphXYqgRN/pvrAIX+0Jbhszdl92uYIqzf/Kdiixpg2IBGjhr7wlaWfl8lyg==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr4589757wmj.94.1574780528793; 
 Tue, 26 Nov 2019 07:02:08 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b2sm15460373wrr.76.2019.11.26.07.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 07:02:08 -0800 (PST)
Date: Tue, 26 Nov 2019 16:02:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 3/4] drm/rect: Keep the clipped dst rectangle in place
Message-ID: <20191126150206.GA29965@phenom.ffwll.local>
References: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
 <20191122175623.13565-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122175623.13565-4-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Eds29OjUfSPXSvjNz82SaWfwB6i48CoSCGFNE5t56zc=;
 b=CMYbMBjdXqC2q0BSbbwtMFfCTxOcFD3z4OMGY3QUOk8OD4sKELBikHG9vZjlVblLB6
 gn1B5sRBw76QXs1z735A1t4cPFOepXmSxWk/s7Hulz25LV/wlN5AnIuwEz2472THcPAD
 XnSRf2kFuJxk0z8YTsjqa/xsFxTuYmdMNks+M=
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
Cc: intel-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDc6NTY6MjJQTSArMDIwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IE5vdyB0aGF0IHdlJ3ZlIGNvbnN0cmFpbmVkIHRoZSBjbGlwcGVkIHNvdXJjZSBy
ZWN0YW5nbGUgc3VjaAo+IHRoYXQgaXQgY2FuJ3QgaGF2ZSBuZWdhdGl2ZSBkaW1lbnNpb25zIGRv
aW5nIHRoZSBzYW1lIGZvciB0aGUKPiBkc3QgcmVjdGFuZ2xlIHNlZW1zIGFwcHJvcHJpYXRlLiBT
aG91bGQgYXQgbGVhc3QgcmVzdWx0IGluCj4gdGhlIGNsaXBwZWQgc3JjIGFuZCBkc3QgcmVjdGFu
Z2xlcyBiZWluZyBhIGJpdCBtb3JlIGNvbnNpc3RlbnQKPiB3aXRoIGVhY2ggb3RoZXIuCj4gCj4g
Q2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+Cj4gQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX3JlY3QuYyB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVj
dC5jCj4gaW5kZXggYTljN2Y5MDgzNmYzLi4xZTFlMjEwMTAwN2EgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9yZWN0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3Qu
Ywo+IEBAIC01Miw3ICs1Miw3IEBAIGJvb2wgZHJtX3JlY3RfaW50ZXJzZWN0KHN0cnVjdCBkcm1f
cmVjdCAqcjEsIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqcjIpCj4gIH0KPiAgRVhQT1JUX1NZTUJP
TChkcm1fcmVjdF9pbnRlcnNlY3QpOwo+ICAKPiAtc3RhdGljIHUzMiBjbGlwX3NjYWxlZCh1MzIg
c3JjLCB1MzIgZHN0LCB1MzIgY2xpcCkKPiArc3RhdGljIHUzMiBjbGlwX3NjYWxlZChpbnQgc3Jj
LCBpbnQgZHN0LCBpbnQgKmNsaXApCgpNaWxkIHNjYXJlIGFib3V0IHRoaXMgb25lIGhlcmUsIGJ1
dCBJIHRoaW5rIHdlJ3ZlIGNsYW1wZWQgZXZlcnl0aGluZwpzdWZmaWNpZW50bHkgbm93IHRoYXQg
c2lsbHkgc3R1ZmYgY2FuJ3QgaGFwcGVuIGFueW1vcmUuIEFuZCBldmVyeXRoaW5nIGluCmhlcmUg
c2VlbXMgdG8gY2FzdCB0byBzdWZmaWNpZW50bHkgYmlnIHR5cGVzIChhbmQgd2Ugc2hvdWxkbid0
IGhhdmUKbmVnYXRpdmUgdmFsdWVzIGhlcmUgSSBob3BlKS4gSSdsbCBzZWUgaG93IHJlYWxpc3Rp
YyB0aGF0IGFzc3VtcHRpb24gaXMKd2hlbiBsb29raW5nIGF0IHRoZSBzZWxmdGVzdHMuIEZvciB0
aGlzOgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cgo+ICB7Cj4gIAl1NjQgdG1wOwo+ICAKPiBAQCAtNjAsOSArNjAsOSBAQCBzdGF0aWMgdTMyIGNs
aXBfc2NhbGVkKHUzMiBzcmMsIHUzMiBkc3QsIHUzMiBjbGlwKQo+ICAJCXJldHVybiAwOwo+ICAK
PiAgCS8qIE9ubHkgY2xpcCB3aGF0IHdlIGhhdmUuIEtlZXBzIHRoZSByZXN1bHQgYm91bmRlZC4g
Ki8KPiAtCWNsaXAgPSBtaW4oY2xpcCwgZHN0KTsKPiArCSpjbGlwID0gbWluKCpjbGlwLCBkc3Qp
Owo+ICAKPiAtCXRtcCA9IG11bF91MzJfdTMyKHNyYywgZHN0IC0gY2xpcCk7Cj4gKwl0bXAgPSBt
dWxfdTMyX3UzMihzcmMsIGRzdCAtICpjbGlwKTsKPiAgCj4gIAkvKgo+ICAJICogUm91bmQgdG93
YXJkIDEuMCB3aGVuIGNsaXBwaW5nIHNvIHRoYXQgd2UgZG9uJ3QgYWNjaWRlbnRhbGx5Cj4gQEAg
LTk1LDM0ICs5NSwzNCBAQCBib29sIGRybV9yZWN0X2NsaXBfc2NhbGVkKHN0cnVjdCBkcm1fcmVj
dCAqc3JjLCBzdHJ1Y3QgZHJtX3JlY3QgKmRzdCwKPiAgCWRpZmYgPSBjbGlwLT54MSAtIGRzdC0+
eDE7Cj4gIAlpZiAoZGlmZiA+IDApIHsKPiAgCQl1MzIgbmV3X3NyY193ID0gY2xpcF9zY2FsZWQo
ZHJtX3JlY3Rfd2lkdGgoc3JjKSwKPiAtCQkJCQkgICAgZHJtX3JlY3Rfd2lkdGgoZHN0KSwgZGlm
Zik7Cj4gKwkJCQkJICAgIGRybV9yZWN0X3dpZHRoKGRzdCksICZkaWZmKTsKPiAgCj4gIAkJc3Jj
LT54MSA9IHNyYy0+eDIgLSBuZXdfc3JjX3c7Cj4gLQkJZHN0LT54MSA9IGNsaXAtPngxOwo+ICsJ
CWRzdC0+eDEgKz0gZGlmZjsKPiAgCX0KPiAgCWRpZmYgPSBjbGlwLT55MSAtIGRzdC0+eTE7Cj4g
IAlpZiAoZGlmZiA+IDApIHsKPiAgCQl1MzIgbmV3X3NyY19oID0gY2xpcF9zY2FsZWQoZHJtX3Jl
Y3RfaGVpZ2h0KHNyYyksCj4gLQkJCQkJICAgIGRybV9yZWN0X2hlaWdodChkc3QpLCBkaWZmKTsK
PiArCQkJCQkgICAgZHJtX3JlY3RfaGVpZ2h0KGRzdCksICZkaWZmKTsKPiAgCj4gIAkJc3JjLT55
MSA9IHNyYy0+eTIgLSBuZXdfc3JjX2g7Cj4gLQkJZHN0LT55MSA9IGNsaXAtPnkxOwo+ICsJCWRz
dC0+eTEgKz0gZGlmZjsKPiAgCX0KPiAgCWRpZmYgPSBkc3QtPngyIC0gY2xpcC0+eDI7Cj4gIAlp
ZiAoZGlmZiA+IDApIHsKPiAgCQl1MzIgbmV3X3NyY193ID0gY2xpcF9zY2FsZWQoZHJtX3JlY3Rf
d2lkdGgoc3JjKSwKPiAtCQkJCQkgICAgZHJtX3JlY3Rfd2lkdGgoZHN0KSwgZGlmZik7Cj4gKwkJ
CQkJICAgIGRybV9yZWN0X3dpZHRoKGRzdCksICZkaWZmKTsKPiAgCj4gIAkJc3JjLT54MiA9IHNy
Yy0+eDEgKyBuZXdfc3JjX3c7Cj4gLQkJZHN0LT54MiA9IGNsaXAtPngyOwo+ICsJCWRzdC0+eDIg
LT0gZGlmZjsKPiAgCX0KPiAgCWRpZmYgPSBkc3QtPnkyIC0gY2xpcC0+eTI7Cj4gIAlpZiAoZGlm
ZiA+IDApIHsKPiAgCQl1MzIgbmV3X3NyY19oID0gY2xpcF9zY2FsZWQoZHJtX3JlY3RfaGVpZ2h0
KHNyYyksCj4gLQkJCQkJICAgIGRybV9yZWN0X2hlaWdodChkc3QpLCBkaWZmKTsKPiArCQkJCQkg
ICAgZHJtX3JlY3RfaGVpZ2h0KGRzdCksICZkaWZmKTsKPiAgCj4gIAkJc3JjLT55MiA9IHNyYy0+
eTEgKyBuZXdfc3JjX2g7Cj4gLQkJZHN0LT55MiA9IGNsaXAtPnkyOwo+ICsJCWRzdC0+eTIgLT0g
ZGlmZjsKPiAgCX0KPiAgCj4gIAlyZXR1cm4gZHJtX3JlY3RfdmlzaWJsZShkc3QpOwo+IC0tIAo+
IDIuMjMuMAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
