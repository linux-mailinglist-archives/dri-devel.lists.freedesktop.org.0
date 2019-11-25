Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BF5108B41
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462316E109;
	Mon, 25 Nov 2019 09:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE626E0D6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:59:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y5so15151065wmi.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:59:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RytT+Xlg2zwjd5/rWVHWfbTDAmStLDWv3M1yjnojE3U=;
 b=ljAGpyHPqv6bq0QUk9sUFad98mwdheyIK0kW+Ila8QGLEEcMowFuIFhmoZpqrhNpX/
 xkOaQ/nGJrMc95jSTIOeTGM/RlBKwpRfB6JZZftMjfvVrIRx0dFR0NBfhTdSW2XppqFe
 GY5X6i7XS+lbTB9JEQHybJCg9BxHdDUk8jMWZ+edWzRj1A2t4kKjypkVnIpZAjCQ/mvC
 Sml9pRY5n2v3GQNqNd8wgRNAW8/kqT67rljedhxof1nNy6q4rlT8Rf9PAU29WGt0TfcM
 lRPPh2Fu2Xou8KtTxw0lJ/e+wIEI8yVB4uUfSvx4WyG7TMmbSf9ZHScm60XhqR9oKOkK
 bgYQ==
X-Gm-Message-State: APjAAAWu6up2pj+7dwa9mklGdYF1oqXDp165r2MmyKd1S2FIC9eUEyjU
 6WWE5DX+4JDhxZrdLw8KIORJO2Ailic=
X-Google-Smtp-Source: APXvYqzLDTJrNEwQ/ZrVL7+V6EZkvZPN4om4OnDUZ9ha6jvddPlXuAMyayJY8OMea5W5SSGJyj5MvA==
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr27068564wml.47.1574675939137; 
 Mon, 25 Nov 2019 01:58:59 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z7sm7722026wma.46.2019.11.25.01.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 01:58:58 -0800 (PST)
Date: Mon, 25 Nov 2019 10:58:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 01/15] drm/tegra: Map cmdbuf once for reloc processing
Message-ID: <20191125095856.GL29965@phenom.ffwll.local>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118103536.17675-2-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RytT+Xlg2zwjd5/rWVHWfbTDAmStLDWv3M1yjnojE3U=;
 b=KgSNpWPVNIzk8oVGblVDJPIyLV8Tvg3NwMbmRA2iL/fkfjyFbK9mZhINTIKxcq5CRj
 jZqLQAHPsoYm6Y+5NOYrBwIEqCDXWhjU4AcBTegsTfOOTd0MGGd1EdEh7jj52ExTz9tO
 QYgykHpq7NpbW5YDMbppiNWBfYahp2KwNOloY=
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTE6MzU6MjJBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBBIGZldyByZWFzb25zIHRvIGRyb3Aga21hcDoKPiAKPiAtIEZvciBuYXRpdmUgb2Jq
ZWN0cyBhbGwgd2UgZG8gaXMgbG9vayBhdCBvYmotPnZhZGRyIGFueXdheSwgc28gbWlnaHQKPiAg
IGFzIHdlbGwgbm90IGNhbGwgZnVuY3Rpb25zIGZvciBldmVyeSBwYWdlLgo+IAo+IC0gUmVsb2Mt
cHJvY2Vzc2luZyBvbiBkbWEtYnVmIGlzIC4uLiBxdWVzdGlvbmFibGUuCj4gCj4gLSBQbHVzIG1v
c3QgZG1hLWJ1ZiB0aGF0IGJvdGhlciBrZXJuZWwgY3B1IG1tYXBzIGdpdmUgeW91IGF0IGxlYXN0
Cj4gICB2bWFwLCBtdWNoIGxlc3Mga21hcHMuIEFuZCBhbGwgdGhlIG9uZXMgcmVsZXZhbnQgZm9y
IGFybS1zb2MgYXJlCj4gICBhZ2FpbiBkb2luZyBhIG9iai0+dmFkZHIgZ2FtZSBhbnl3YXksIHRo
ZXJlJ3Mgbm8gcmVhbCBrbWFwIGdvaW5nIG9uCj4gICBvbiBhcm0gaXQgc2VlbXMuCj4gCj4gUGx1
cyB0aGlzIHNlZW1zIHRvIGJlIHRoZSBvbmx5IHJlYWwgaW4tdHJlZSB1c2VyIG9mIGRtYV9idWZf
a21hcCwgYW5kCj4gSSdkIGxpa2UgdG8gZ2V0IHJpZCBvZiB0aGF0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBUaGllcnJ5
IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+IENjOiBsaW51eC10ZWdyYUB2Z2Vy
Lmtlcm5lbC5vcmcKClBpbmcgZm9yIHRlc3RpbmcvcmV2aWV3IG9uIHRoZXNlIGZpcnN0IDIgdGVn
cmEgcGF0Y2hlcy4gVGhleSdyZSBob2xkaW5nIHVwCnRoZSBlbnRpcmUgc2VyaWVzLCBhbmQgSSBn
b3QgYWNrcyBmb3IgYWxsIHRoZSBvdGhlciBiaXRzIHN1cnByaXNpbmdseQpmYXN0LiBTbyB3b3Vs
ZCBsaWtlIHRvIGxhbmQgdGhpcyByYXRoZXIgc29vbmVyIHRoYW4gbGF0ZXIuIEknbSBhbHNvCndv
cmtpbmcgb24gYSBsb3QgbW9yZSBkbWEtYnVmIHBhdGNoZXMgLi4uCgpUaGFua3MsIERhbmllbAoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvaG9zdDF4L2pvYi5jIHwgMjEgKysrKysrKy0tLS0tLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ob3N0MXgvam9iLmMgYi9kcml2ZXJzL2dwdS9o
b3N0MXgvam9iLmMKPiBpbmRleCAyNWNhNTRkZThmYzUuLjYwYjJmZWRkMDA2MSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvam9iLmMKPiArKysgYi9kcml2ZXJzL2dwdS9ob3N0MXgv
am9iLmMKPiBAQCAtMjQ0LDggKzI0NCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgcGluX2pvYihz
dHJ1Y3QgaG9zdDF4ICpob3N0LCBzdHJ1Y3QgaG9zdDF4X2pvYiAqam9iKQo+ICAKPiAgc3RhdGlj
IGludCBkb19yZWxvY3Moc3RydWN0IGhvc3QxeF9qb2IgKmpvYiwgc3RydWN0IGhvc3QxeF9qb2Jf
Z2F0aGVyICpnKQo+ICB7Cj4gLQl1MzIgbGFzdF9wYWdlID0gfjA7Cj4gLQl2b2lkICpjbWRidWZf
cGFnZV9hZGRyID0gTlVMTDsKPiArCXZvaWQgKmNtZGJ1Zl9hZGRyID0gTlVMTDsKPiAgCXN0cnVj
dCBob3N0MXhfYm8gKmNtZGJ1ZiA9IGctPmJvOwo+ICAJdW5zaWduZWQgaW50IGk7Cj4gIAo+IEBA
IC0yNjcsMjggKzI2NiwyMiBAQCBzdGF0aWMgaW50IGRvX3JlbG9jcyhzdHJ1Y3QgaG9zdDF4X2pv
YiAqam9iLCBzdHJ1Y3QgaG9zdDF4X2pvYl9nYXRoZXIgKmcpCj4gIAkJCWdvdG8gcGF0Y2hfcmVs
b2M7Cj4gIAkJfQo+ICAKPiAtCQlpZiAobGFzdF9wYWdlICE9IHJlbG9jLT5jbWRidWYub2Zmc2V0
ID4+IFBBR0VfU0hJRlQpIHsKPiAtCQkJaWYgKGNtZGJ1Zl9wYWdlX2FkZHIpCj4gLQkJCQlob3N0
MXhfYm9fa3VubWFwKGNtZGJ1ZiwgbGFzdF9wYWdlLAo+IC0JCQkJCQkgY21kYnVmX3BhZ2VfYWRk
cik7Cj4gKwkJaWYgKCFjbWRidWZfYWRkcikgewo+ICsJCQljbWRidWZfYWRkciA9IGhvc3QxeF9i
b19tbWFwKGNtZGJ1Zik7Cj4gIAo+IC0JCQljbWRidWZfcGFnZV9hZGRyID0gaG9zdDF4X2JvX2tt
YXAoY21kYnVmLAo+IC0JCQkJCXJlbG9jLT5jbWRidWYub2Zmc2V0ID4+IFBBR0VfU0hJRlQpOwo+
IC0JCQlsYXN0X3BhZ2UgPSByZWxvYy0+Y21kYnVmLm9mZnNldCA+PiBQQUdFX1NISUZUOwo+IC0K
PiAtCQkJaWYgKHVubGlrZWx5KCFjbWRidWZfcGFnZV9hZGRyKSkgewo+ICsJCQlpZiAodW5saWtl
bHkoIWNtZGJ1Zl9hZGRyKSkgewo+ICAJCQkJcHJfZXJyKCJDb3VsZCBub3QgbWFwIGNtZGJ1ZiBm
b3IgcmVsb2NhdGlvblxuIik7Cj4gIAkJCQlyZXR1cm4gLUVOT01FTTsKPiAgCQkJfQo+ICAJCX0K
PiAgCj4gLQkJdGFyZ2V0ID0gY21kYnVmX3BhZ2VfYWRkciArIChyZWxvYy0+Y21kYnVmLm9mZnNl
dCAmIH5QQUdFX01BU0spOwo+ICsJCXRhcmdldCA9IGNtZGJ1Zl9hZGRyICsgcmVsb2MtPmNtZGJ1
Zi5vZmZzZXQ7Cj4gIHBhdGNoX3JlbG9jOgo+ICAJCSp0YXJnZXQgPSByZWxvY19hZGRyOwo+ICAJ
fQo+ICAKPiAtCWlmIChjbWRidWZfcGFnZV9hZGRyKQo+IC0JCWhvc3QxeF9ib19rdW5tYXAoY21k
YnVmLCBsYXN0X3BhZ2UsIGNtZGJ1Zl9wYWdlX2FkZHIpOwo+ICsJaWYgKGNtZGJ1Zl9hZGRyKQo+
ICsJCWhvc3QxeF9ib19tdW5tYXAoY21kYnVmLCBjbWRidWZfYWRkcik7Cj4gIAo+ICAJcmV0dXJu
IDA7Cj4gIH0KPiAtLSAKPiAyLjI0LjAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
