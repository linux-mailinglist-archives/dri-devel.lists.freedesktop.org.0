Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4B223BDC8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 18:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3608D6E483;
	Tue,  4 Aug 2020 16:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799D56E483
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596557365;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TOZI/E+BsRvqjNsmDqX3uA6qiqbuGX8gbX4xv94uh60=;
 b=JT1obodsIUNTqb7Z2WMc9d1WgVIAjniv3gnMDMwcCthN6ha/uhOe/1QLpeYRxXZka0FiLQ
 pg4Le06a+KYi3smAeoLFn4aCBQb0/Ietxydh0AfUe+RVN/IfFJbux+uANOdkJsxi+gfrGB
 gtp/wT9Qs8T3YQk4sQ+hTSpT2XG0cFY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-2oaaxYRVP6WQE40WxqYOJA-1; Tue, 04 Aug 2020 12:09:23 -0400
X-MC-Unique: 2oaaxYRVP6WQE40WxqYOJA-1
Received: by mail-qv1-f69.google.com with SMTP id e6so28834660qva.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 09:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=TOZI/E+BsRvqjNsmDqX3uA6qiqbuGX8gbX4xv94uh60=;
 b=RrmP4o++XmuLJiAd1snFGFcX271fA/ycFKy0r1dw6XbW90yH1wvZlwfz7/qToYTofs
 f2EYltgVVdb2K5Qt+4D1SzE5zSoZehu0SmL4dorUJoV9rX/SD4SKDUSBxIrbUxZveExI
 ARRqkq8UcOyNBvSkcPZYToGSZTYEzDkCHxDDVeX97nF/fCNj34lMKQUmRvNhKi437Fis
 bB3ds9iEQw1Udacf4XOJ6GGLgtISMtFUpPFcwj1WF17z0ptxVXIWtP2LjledPzJ3sJI9
 IW/dSfdUiBXx/dih8i9ANz/h6C0N8B0dAPwEHMnEP6+xesqmQNli5HGfzQ9y+N/H7O95
 MIWA==
X-Gm-Message-State: AOAM530Q433HskW6YlCjn6R5fTyRurFBDiFdi+JEo/7p0Rum4GaXFEDX
 z3hM2QQ4ilw8+uc96MuNWImwk9m9uZRXS/lqDt0HGBNALQgIZXrUSL7yVIkl1/Ly2Gb4/e3crnB
 TBGUIevFd/CzO83j0Jn5mx+AKyDT6
X-Received: by 2002:ad4:44f2:: with SMTP id p18mr22615989qvt.137.1596557363007; 
 Tue, 04 Aug 2020 09:09:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg1lwYfJiUKDd9A7sOq/yUBkUA9nvcJIWHNxakoYrfXE1SbGb9q/0d7jCgk4FUC+Zw2TTYww==
X-Received: by 2002:ad4:44f2:: with SMTP id p18mr22615957qvt.137.1596557362713; 
 Tue, 04 Aug 2020 09:09:22 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id h13sm24414469qtu.7.2020.08.04.09.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 09:09:21 -0700 (PDT)
Message-ID: <69429828565406cca0134b45f98b1879676f0371.camel@redhat.com>
Subject: Re: [PATCH] drm: fix drm_dp_mst_port refcount leaks in
 drm_dp_mst_allocate_vcpi
From: Lyude Paul <lyude@redhat.com>
To: Xin Xiong <xiongx18@fudan.edu.cn>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 04 Aug 2020 12:09:20 -0400
In-Reply-To: <20200719154545.GA41231@xin-virtual-machine>
References: <20200719154545.GA41231@xin-virtual-machine>
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVoLCBJIHJlbWVtYmVyIHRoaXMgYmVpbmcgbWVudGlvbmVkIHRvIG1lIHdheSBiYWNrIGJ1dCBj
b21wbGV0ZWx5IGZvcmdvdCB0bwpldmVyIGdvIGZpeCBpdC4gVGhhbmtzIGZvciB0aGUgcGF0Y2gh
CgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClRoaXMgaXMgbWlz
c2luZyBhIEZpeGVzOiB0YWcgdGhvdWdoOgoKICAgRml4ZXM6IDFlNzk3ZjU1NmM2MSAoImRybS9k
cDogU3BsaXQgZHJtX2RwX21zdF9hbGxvY2F0ZV92Y3BpIikKICAgQ2M6IDxzdGFibGVAdmdlci5r
ZXJuZWwub3JnPiAjIHY0LjEyKwoKU28gSSB3aWxsIGdvIGFoZWFkIGFuZCBhZGQgdGhhdCwgdGhl
biBwdXNoIHRoaXMgdG8gZHJtLW1pc2MtbmV4dC1maXhlcy4gVGhhbmtzIQoKT24gU3VuLCAyMDIw
LTA3LTE5IGF0IDIzOjQ1ICswODAwLCBYaW4gWGlvbmcgd3JvdGU6Cj4gZHJtX2RwX21zdF9hbGxv
Y2F0ZV92Y3BpKCkgaW52b2tlcwo+IGRybV9kcF9tc3RfdG9wb2xvZ3lfZ2V0X3BvcnRfdmFsaWRh
dGVkKCksIHdoaWNoIGluY3JlYXNlcyB0aGUgcmVmY291bnQKPiBvZiB0aGUgInBvcnQiLgo+IAo+
IFRoZXNlIHJlZmVyZW5jZSBjb3VudGluZyBpc3N1ZXMgdGFrZSBwbGFjZSBpbiB0d28gZXhjZXB0
aW9uIGhhbmRsaW5nCj4gcGF0aHMgc2VwYXJhdGVseS4gRWl0aGVyIHdoZW4g4oCcc2xvdHPigJ0g
aXMgbGVzcyB0aGFuIDAgb3Igd2hlbgo+IGRybV9kcF9pbml0X3ZjcGkoKSByZXR1cm5zIGEgbmVn
YXRpdmUgdmFsdWUsIHRoZSBmdW5jdGlvbiBmb3JnZXRzIHRvCj4gcmVkdWNlIHRoZSByZWZjbnQg
aW5jcmVhc2VkIGRybV9kcF9tc3RfdG9wb2xvZ3lfZ2V0X3BvcnRfdmFsaWRhdGVkKCksCj4gd2hp
Y2ggcmVzdWx0cyBpbiBhIHJlZmNvdW50IGxlYWsuCj4gCj4gRml4IHRoZXNlIGlzc3VlcyBieSBw
dWxsaW5nIHVwIHRoZSBlcnJvciBoYW5kbGluZyB3aGVuICJzbG90cyIgaXMgbGVzcwo+IHRoYW4g
MCwgYW5kIGNhbGxpbmcgZHJtX2RwX21zdF90b3BvbG9neV9wdXRfcG9ydCgpIGJlZm9yZSB0ZXJt
aW5hdGlvbgo+IHdoZW4gZHJtX2RwX2luaXRfdmNwaSgpIHJldHVybnMgYSBuZWdhdGl2ZSB2YWx1
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBYaXl1IFlhbmcgPHhpeXV5YW5nMTlAZnVkYW4uZWR1LmNu
Pgo+IFNpZ25lZC1vZmYtYnk6IFhpbiBUYW4gPHRhbnhpbi5jdGZAZ21haWwuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFhpbiBYaW9uZyA8eGlvbmd4MThAZnVkYW4uZWR1LmNuPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgNyArKysrLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBpbmRleCAxZTI2Yjg5NjI4ZjkuLjk3YjQ4YjUzMWVj
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC00MjYxLDEx
ICs0MjYxLDExIEBAIGJvb2wgZHJtX2RwX21zdF9hbGxvY2F0ZV92Y3BpKHN0cnVjdAo+IGRybV9k
cF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCj4gIHsKPiAgCWludCByZXQ7Cj4gIAo+IC0JcG9ydCA9
IGRybV9kcF9tc3RfdG9wb2xvZ3lfZ2V0X3BvcnRfdmFsaWRhdGVkKG1nciwgcG9ydCk7Cj4gLQlp
ZiAoIXBvcnQpCj4gKwlpZiAoc2xvdHMgPCAwKQo+ICAJCXJldHVybiBmYWxzZTsKPiAgCj4gLQlp
ZiAoc2xvdHMgPCAwKQo+ICsJcG9ydCA9IGRybV9kcF9tc3RfdG9wb2xvZ3lfZ2V0X3BvcnRfdmFs
aWRhdGVkKG1nciwgcG9ydCk7Cj4gKwlpZiAoIXBvcnQpCj4gIAkJcmV0dXJuIGZhbHNlOwo+ICAK
PiAgCWlmIChwb3J0LT52Y3BpLnZjcGkgPiAwKSB7Cj4gQEAgLTQyODEsNiArNDI4MSw3IEBAIGJv
b2wgZHJtX2RwX21zdF9hbGxvY2F0ZV92Y3BpKHN0cnVjdAo+IGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyICptZ3IsCj4gIAlpZiAocmV0KSB7Cj4gIAkJRFJNX0RFQlVHX0tNUygiZmFpbGVkIHRvIGlu
aXQgdmNwaSBzbG90cz0lZCBtYXg9NjMgcmV0PSVkXG4iLAo+ICAJCQkgICAgICBESVZfUk9VTkRf
VVAocGJuLCBtZ3ItPnBibl9kaXYpLCByZXQpOwo+ICsJCWRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0
X3BvcnQocG9ydCk7Cj4gIAkJZ290byBvdXQ7Cj4gIAl9Cj4gIAlEUk1fREVCVUdfS01TKCJpbml0
aW5nIHZjcGkgZm9yIHBibj0lZCBzbG90cz0lZFxuIiwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
