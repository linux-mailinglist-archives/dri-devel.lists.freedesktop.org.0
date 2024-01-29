Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B638840669
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 14:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC1B10E9CE;
	Mon, 29 Jan 2024 13:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CF810E9CE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706533934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tg/RTki1YiWMWeWeiVLm15dTG+VCsEe0JZ4GfZ9Mero=;
 b=Nwa/t1BXf8MfUQxN0DyHblnfJNl9J4VOIGqJANjY6kVvuWZLt1ZggMgghqTcffa1Q0lhs+
 z7UPGY8tmGDne/+bchPECk6pfSTQDYSTjKmJiRjTp+ulMUKqFH5MBGZrZLpDLq+OBikxoS
 s8CbBJkR+owd+M8LFwuYQ2tiWxk6m10=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-9Hrdv-pcPCyrUHmu0OU_KQ-1; Mon, 29 Jan 2024 08:12:13 -0500
X-MC-Unique: 9Hrdv-pcPCyrUHmu0OU_KQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-68c3ad8c59eso6256586d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 05:12:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706533932; x=1707138732;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tg/RTki1YiWMWeWeiVLm15dTG+VCsEe0JZ4GfZ9Mero=;
 b=gzXKm36+5zOxIOeAy8yEOMMccWiNizjtkLmw4dbTlAhjcKunl9mwGZu4X7jaC0RfAS
 CzrEqr+L0Y85N5MluPZ8wlnhuVBCbY2FvZEkt3uukMFFvqpvV+ya6g18PkydYDipJtd/
 j1ljJqIxn9y+WI9dSgWg0NXUKh4HadnG50I9YTzQmCgjhoJLRRHb/q38KLwU/fVtGyde
 FUL6DuMNMFVMUxyHjDYG0yfvhn+oYz0gSW6WTFjO/ksL7ls70PZUf51IMK31F/OyLgIq
 LW4yNpfJUsweraXy+nokuklL9Q2+zZWaZf+wSA/cAPNRZGkab45xsoRL4GHKRohc5mzF
 ikyw==
X-Gm-Message-State: AOJu0Ywa+VTK8fjAA5feBwYMQQaXe6EwmisjnqMnUMkwEDettebeW123
 7SYVLw486bffZEqelf1ZbSiZOdieFfGeQW5TVGU+0qyxYnJPso6BAvng0lbz93n+ggIj2zNDDya
 MF0YV6kCEKMTZ4DKj6QrotgUi4bRamTOFoGHYWCAa8xebzPknUSAUzOaGZuI3y1NviA==
X-Received: by 2002:a05:6214:4019:b0:685:aa1e:7cec with SMTP id
 kd25-20020a056214401900b00685aa1e7cecmr8171070qvb.0.1706533932683; 
 Mon, 29 Jan 2024 05:12:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWDNbI/jHDMtAqqYCfjMSp2/DuPBUeXxgboABgVwrapdaantFbhMu7SKWdHGPapU6evDhguw==
X-Received: by 2002:a05:6214:4019:b0:685:aa1e:7cec with SMTP id
 kd25-20020a056214401900b00685aa1e7cecmr8171042qvb.0.1706533932380; 
 Mon, 29 Jan 2024 05:12:12 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 op32-20020a05621445a000b0068c4917df76sm1482033qvb.130.2024.01.29.05.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 05:12:11 -0800 (PST)
Message-ID: <82e7ac1c879d66b3aa931b36a18189ac30255735.camel@redhat.com>
Subject: Re: [PATCH v2 10/10] drm/vboxvideo: fix mapping leaks
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas
 <bhelgaas@google.com>, Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Date: Mon, 29 Jan 2024 14:12:08 +0100
In-Reply-To: <e21c0853-d10a-44b5-917a-3f3c08102b87@redhat.com>
References: <20240123094317.15958-1-pstanner@redhat.com>
 <20240123094317.15958-11-pstanner@redhat.com>
 <e21c0853-d10a-44b5-917a-3f3c08102b87@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
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
Cc: linux-pci@vger.kernel.org, stable@kernel.vger.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBNb24sIDIwMjQtMDEtMjkgYXQgMTI6MTUgKzAxMDAsIEhhbnMgZGUgR29lZGUgd3Jv
dGU6Cj4gSGkgUGhpbGlwcCwKPiAKPiBPbiAxLzIzLzI0IDEwOjQzLCBQaGlsaXBwIFN0YW5uZXIg
d3JvdGU6Cj4gPiBXaGVuIHRoZSBQQ0kgZGV2cmVzIEFQSSB3YXMgaW50cm9kdWNlZCB0byB0aGlz
IGRyaXZlciwgaXQgd2FzCj4gPiB3cm9uZ2x5Cj4gPiBhc3N1bWVkIHRoYXQgaW5pdGlhbGl6aW5n
IHRoZSBkZXZpY2Ugd2l0aCBwY2ltX2VuYWJsZV9kZXZpY2UoKQo+ID4gaW5zdGVhZAo+ID4gb2Yg
cGNpX2VuYWJsZV9kZXZpY2UoKSB3aWxsIG1ha2UgYWxsIFBDSSBmdW5jdGlvbnMgbWFuYWdlZC4K
PiA+IAo+ID4gVGhpcyBpcyB3cm9uZyBhbmQgd2FzIGNhdXNlZCBieSB0aGUgcXVpdGUgY29uZnVz
aW5nIGRldnJlcyBBUEkgZm9yCj4gPiBQQ0kKPiA+IGluIHdoaWNoIHNvbWUsIGJ1dCBub3QgYWxs
LCBmdW5jdGlvbnMgYmVjb21lIG1hbmFnZWQgdGhhdCB3YXkuCj4gPiAKPiA+IFRoZSBmdW5jdGlv
biBwY2lfaW9tYXBfcmFuZ2UoKSBpcyBuZXZlciBtYW5hZ2VkLgo+ID4gCj4gPiBSZXBsYWNlIHBj
aV9pb21hcF9yYW5nZSgpIHdpdGggdGhlIGFjdHVhbGx5IG1hbmFnZWQgZnVuY3Rpb24KPiA+IHBj
aW1faW9tYXBfcmFuZ2UoKS4KPiA+IAo+ID4gQWRkaXRpb25hbGx5LCBhZGQgYSBjYWxsIHRvIHBj
aW1fcmVxdWVzdF9yZWdpb24oKSB0byBlbnN1cmUKPiA+IGV4Y2x1c2l2ZQo+ID4gYWNjZXNzIHRv
IEJBUiAwLgo+IAo+IEknbSBhIGJpdCB3b3JyaWVkIGFib3V0IHRoaXMgbGFzdCBjaGFuZ2UuIFRo
ZXJlIG1pZ2h0IGJlCj4gaXNzdWVzIHdoZXJlIHRoZSBwY2ltX3JlcXVlc3RfcmVnaW9uKCkgZmFp
bHMgZHVlIHRvCj4gZS5nLiBhIGNvbmZsaWN0IHdpdGggdGhlIHNpbXBsZWZiIC8gc2ltcGxlZHJt
IGNvZGUuCj4gCj4gVGhlcmUgaXMgYSBkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3Bj
aV9mcmFtZWJ1ZmZlcnMoKQo+IGNhbGwgZG9uZSBiZWZvcmUgaHdfaW5pdCgpIGdldHMgY2FsbGVk
LCBidXQgc3RpbGwgdGhpcwo+IGhhcyBiZWVuIGtub3duIHRvIGNhdXNlIGlzc3VlcyBpbiB0aGUg
cGFzdC4KPiAKPiBDYW4geW91IHNwbGl0IG91dCB0aGUgYWRkaW5nIG9mIHRoZSBwY2ltX3JlcXVl
c3RfcmVnaW9uKCkKPiBpbnRvIGEgc2VwYXJhdGUgcGF0Y2ggYW5kICpub3QqIG1hcmsgdGhhdCBz
ZXBhcmF0ZSBwYXRjaAo+IGZvciBzdGFibGUgPwoKWWVzLCB0aGF0IHNvdW5kcyByZWFzb25hYmxl
LiBJJ2xsIHNwbGl0IGl0IG91dCBhbmQgZGVhbCB3aXRoIGl0IG9uY2UKSSdsbCBzZW5kIHRoZSBv
dGhlciBEUk0gcGF0Y2hlcyBmcm9tIG15IGJhY2tsb2cuCgpHcmVldGluZ3MsClAuCgo+IAo+IFJl
Z2FyZHMsCj4gCj4gSGFucwo+IAo+IAo+IAo+IAo+IAo+ID4gCj4gPiBDQzogPHN0YWJsZUBrZXJu
ZWwudmdlci5vcmc+ICMgdjUuMTArCj4gPiBGaXhlczogODU1OGRlNDAxYjVmICgiZHJtL3Zib3h2
aWRlbzogdXNlIG1hbmFnZWQgcGNpIGZ1bmN0aW9ucyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGls
aXBwIFN0YW5uZXIgPHBzdGFubmVyQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9n
cHUvZHJtL3Zib3h2aWRlby92Ym94X21haW4uYyB8IDI0ICsrKysrKysrKysrKystLS0tLS0tLS0t
Cj4gPiAtCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlv
bnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJv
eF9tYWluLmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21haW4uYwo+ID4g
aW5kZXggNDJjMmQ4YTk5NTA5Li43ZjY4NmEwMTkwZTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfbWFpbi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmJveHZpZGVvL3Zib3hfbWFpbi5jCj4gPiBAQCAtNDIsMTIgKzQyLDExIEBAIHN0YXRpYyBpbnQg
dmJveF9hY2NlbF9pbml0KHN0cnVjdCB2Ym94X3ByaXZhdGUKPiA+ICp2Ym94KQo+ID4gwqDCoMKg
wqDCoMKgwqDCoC8qIFRha2UgYSBjb21tYW5kIGJ1ZmZlciBmb3IgZWFjaCBzY3JlZW4gZnJvbSB0
aGUgZW5kIG9mCj4gPiB1c2FibGUgVlJBTS4gKi8KPiA+IMKgwqDCoMKgwqDCoMKgwqB2Ym94LT5h
dmFpbGFibGVfdnJhbV9zaXplIC09IHZib3gtPm51bV9jcnRjcyAqCj4gPiBWQlZBX01JTl9CVUZG
RVJfU0laRTsKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqB2Ym94LT52YnZhX2J1ZmZlcnMgPSBw
Y2lfaW9tYXBfcmFuZ2UocGRldiwgMCwKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB2Ym94LQo+ID4gPmF2YWlsYWJsZV92cmFtX3NpemUsCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdmJveC0+bnVtX2NydGNzICoKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBWQlZBX01JTl9CVUZGRVJfU0laRSk7Cj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoIXZi
b3gtPnZidmFfYnVmZmVycykKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gLUVOT01FTTsKPiA+ICvCoMKgwqDCoMKgwqDCoHZib3gtPnZidmFfYnVmZmVycyA9IHBjaW1f
aW9tYXBfcmFuZ2UoCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHBkZXYsIDAsIHZib3gtPmF2YWlsYWJsZV92cmFtX3NpemUsCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZib3gtPm51bV9jcnRjcyAqIFZC
VkFfTUlOX0JVRkZFUl9TSVpFKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIodmJveC0+
dmJ2YV9idWZmZXJzKSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
UFRSX0VSUih2Ym94LT52YnZhX2J1ZmZlcnMpOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBm
b3IgKGkgPSAwOyBpIDwgdmJveC0+bnVtX2NydGNzOyArK2kpIHsKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgdmJ2YV9zZXR1cF9idWZmZXJfY29udGV4dCgmdmJveC0+dmJ2YV9p
bmZvW2ldLAo+ID4gQEAgLTExNSwxMiArMTE0LDE1IEBAIGludCB2Ym94X2h3X2luaXQoc3RydWN0
IHZib3hfcHJpdmF0ZSAqdmJveCkKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgRFJNX0lORk8o
IlZSQU0gJTA4eFxuIiwgdmJveC0+ZnVsbF92cmFtX3NpemUpOwo+ID4gwqAKPiA+ICvCoMKgwqDC
oMKgwqDCoHJldCA9IHBjaW1fcmVxdWVzdF9yZWdpb24ocGRldiwgMCwgInZib3h2aWRlbyIpOwo+
ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gcmV0Owo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoC8qIE1hcCBndWVzdC1o
ZWFwIGF0IGVuZCBvZiB2cmFtICovCj4gPiAtwqDCoMKgwqDCoMKgwqB2Ym94LT5ndWVzdF9oZWFw
ID0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoCBwY2lfaW9tYXBfcmFuZ2UocGRldiwgMCwgR1VF
U1RfSEVBUF9PRkZTRVQodmJveCksCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHVUVTVF9IRUFQX1NJWkUpOwo+ID4gLcKgwqDCoMKgwqDC
oMKgaWYgKCF2Ym94LT5ndWVzdF9oZWFwKQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybiAtRU5PTUVNOwo+ID4gK8KgwqDCoMKgwqDCoMKgdmJveC0+Z3Vlc3RfaGVhcCA9
IHBjaW1faW9tYXBfcmFuZ2UocGRldiwgMCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgR1VFU1RfSEVBUF9PRkZTRVQodmJveCksIEdVRVNUX0hFQVBf
U0laRSk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKHZib3gtPmd1ZXN0X2hlYXApKQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBQVFJfRVJSKHZib3gtPmd1
ZXN0X2hlYXApOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqAvKiBDcmVhdGUgZ3Vlc3QtaGVh
cCBtZW0tcG9vbCB1c2UgMl40ID0gMTYgYnl0ZSBjaHVua3MgKi8KPiA+IMKgwqDCoMKgwqDCoMKg
wqB2Ym94LT5ndWVzdF9wb29sID0gZGV2bV9nZW5fcG9vbF9jcmVhdGUodmJveC0+ZGRldi5kZXYs
IDQsCj4gPiAtMSwKPiAKCg==

