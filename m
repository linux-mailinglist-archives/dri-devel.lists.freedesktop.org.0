Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9810A083
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 15:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C216E406;
	Tue, 26 Nov 2019 14:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0FD6E406
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 14:40:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z10so22660449wrs.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 06:40:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vDlRkpzIOrPRGh5pysj0vN3V4ARniTOU0E64e7Y7I4k=;
 b=RHXVWXTS9zqn5gk2sB8XL67oTNCgYyuH9W7RxH/8rpvaDbkv1YCll4KozsuDuvtJi2
 QMbxRcwq3X3Jpq5iEPwghih06OmnGnOuHTzRL8aXcvgHoysSgf5xcwJSu7LZ4tJbJWs5
 ooQph8um4vZ5Az/5YAAvLM3dDOy8cFJcT22QUhRH+AFxIkKJFHSgD2wzadAX7ybVMtPE
 8KOsixrzqz9SQH65LEgmzhlVTrGkxm+BppYGTDZhXD6gh99F4c+0N15iaHd+nYaFFgum
 UsJU5GkWaH/Vb9K4dK3wXH4gPqgNy1M8sG6pb0s10DfDest6BojcUFcM6gt28/MEvXmN
 vHQg==
X-Gm-Message-State: APjAAAXs7OP6CEdmyZ9qUNZFqoeAUxEfM6yffkXnxUs1SW6T5rfi4QAy
 QaI1VzcsRqo5khNY32Q7pSCbrw==
X-Google-Smtp-Source: APXvYqxUmVBdcCYS7XSP5o8fYGZrhfhKicMhDiOZnyWOiksf2+PAvxuADqC946BHGNEBKb39ApM0Fg==
X-Received: by 2002:a05:6000:12c9:: with SMTP id
 l9mr1904540wrx.304.1574779233142; 
 Tue, 26 Nov 2019 06:40:33 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z26sm1479738wmk.33.2019.11.26.06.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 06:40:32 -0800 (PST)
Date: Tue, 26 Nov 2019 15:40:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 1/4] drm/rect: Avoid division by zero
Message-ID: <20191126144030.GY29965@phenom.ffwll.local>
References: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
 <20191122175623.13565-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122175623.13565-2-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=vDlRkpzIOrPRGh5pysj0vN3V4ARniTOU0E64e7Y7I4k=;
 b=We11rIf9pkSTfvXQfufaU9H4/tUZLZP0zPiq0QyBZx7rXYqB/Lbo00B9w3TyI38XDv
 IhhGUDrIyAjy3QwAIPo/ExlDP8YSHI0593gfyeq7rRfh69HiUpK3fujAH1PdUg1sySIg
 sCASiOk+mxUmzGq9FfOGPhaUbRwd8+9WobLFc=
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDc6NTY6MjBQTSArMDIwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IENoZWNrIGZvciB6ZXJvIHdpZHRoL2hlaWdodCBkZXN0aW5hdGlvbiByZWN0YW5n
bGUgaW4KPiBkcm1fcmVjdF9jbGlwX3NjYWxlZCgpIHRvIGF2b2lkIGEgZGl2aXNpb24gYnkgemVy
by4KPiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVzOiBmOTZiZGY1NjRmM2Ug
KCJkcm0vcmVjdDogSGFuZGxlIHJvdW5kaW5nIGVycm9ycyBpbiBkcm1fcmVjdF9jbGlwX3NjYWxl
ZCwgdjMuIikKPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0
LmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IFRlc3RjYXNlOiBp
Z3Qva21zX3NlbGZ0ZXN0L2RybV9yZWN0X2NsaXBfc2NhbGVkX2Rpdl9ieV96ZXJvCj4gU2lnbmVk
LW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
CkNsYW1waW5nIHNyYyB0byAwIGlmIGRzdCBpcyAwIG1ha2VzIHNlbnNlIHRvIG1lLgoKUmV2aWV3
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYyB8IDcgKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcmVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMKPiBpbmRleCBi
ODM2M2FhYTkwMzIuLjgxODczOGU4M2QwNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3JlY3QuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jCj4gQEAgLTU0LDcg
KzU0LDEyIEBAIEVYUE9SVF9TWU1CT0woZHJtX3JlY3RfaW50ZXJzZWN0KTsKPiAgCj4gIHN0YXRp
YyB1MzIgY2xpcF9zY2FsZWQodTMyIHNyYywgdTMyIGRzdCwgdTMyIGNsaXApCj4gIHsKPiAtCXU2
NCB0bXAgPSBtdWxfdTMyX3UzMihzcmMsIGRzdCAtIGNsaXApOwo+ICsJdTY0IHRtcDsKPiArCj4g
KwlpZiAoZHN0ID09IDApCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJdG1wID0gbXVsX3UzMl91MzIo
c3JjLCBkc3QgLSBjbGlwKTsKPiAgCj4gIAkvKgo+ICAJICogUm91bmQgdG93YXJkIDEuMCB3aGVu
IGNsaXBwaW5nIHNvIHRoYXQgd2UgZG9uJ3QgYWNjaWRlbnRhbGx5Cj4gLS0gCj4gMi4yMy4wCj4g
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
