Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B48DB1027ED
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 16:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AC26E980;
	Tue, 19 Nov 2019 15:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6246E982
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 15:18:36 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-WfxXZp1-MWuD2QExxvJkuA-1; Tue, 19 Nov 2019 10:18:33 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C03541804975;
 Tue, 19 Nov 2019 15:18:30 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-49.ams2.redhat.com
 [10.36.117.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B0A81001B35;
 Tue, 19 Nov 2019 15:18:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 3/3] drm/i915: DSI: select correct PWM controller to use based
 on the VBT
Date: Tue, 19 Nov 2019 16:18:18 +0100
Message-Id: <20191119151818.67531-4-hdegoede@redhat.com>
In-Reply-To: <20191119151818.67531-1-hdegoede@redhat.com>
References: <20191119151818.67531-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: WfxXZp1-MWuD2QExxvJkuA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574176715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1xgbYHwGV/X4qOujvrB+x8YaMZaSCqcczgDWtCSP8s=;
 b=PMKsychZszZ405ZmwQTZmcxi/yhKG83GvCC3JGbP95uGd1M6+2LkZMdmbblpR0UVaZLIUz
 lsqUmyVxp/SIpd1xvbNVmQhX39g/q9YUPUWjJ9yqyY7XL6qgGTGCnYPVSuAa9hgxx7Vavg
 jQlFoM7slHAJjknrqxcH+DdAbqPj9HA=
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
Cc: linux-acpi@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXQgbGVhc3QgQmF5IFRyYWlsIChCWVQpIGFuZCBDaGVycnkgVHJhaWwgKENIVCkgZGV2aWNlcyBj
YW4gdXNlIDEgb2YgMgpkaWZmZXJlbnQgUFdNIGNvbnRyb2xsZXJzIGZvciBjb250cm9sbGluZyB0
aGUgTENEJ3MgYmFja2xpZ2h0IGJyaWdodG5lc3MuCkVpdGhlciB0aGUgb25lIGludGVncmF0ZWQg
aW50byB0aGUgUE1JQyBvciB0aGUgb25lIGludGVncmF0ZWQgaW50byB0aGUKU29DICh0aGUgMXN0
IExQU1MgUFdNIGNvbnRyb2xsZXIpLgoKU28gZmFyIGluIHRoZSBMUFNTIGNvZGUgb24gQllUIHdl
IGhhdmUgc2tpcHBlZCByZWdpc3RlcmluZyB0aGUgTFBTUyBQV00KY29udHJvbGxlciAicHdtX2Jh
Y2tsaWdodCIgbG9va3VwIGVudHJ5IHdoZW4gYSBDcnlzdGFsIENvdmUgUE1JQyBpcwpwcmVzZW50
LCBhc3N1bWluZyB0aGF0IGluIHRoaXMgY2FzZSB0aGUgUE1JQyBQV00gY29udHJvbGxlciB3aWxs
IGJlIHVzZWQuCgpPbiBDSFQgd2UgaGF2ZSBiZWVuIHJlbHlpbmcgb24gb25seSAxIG9mIHRoZSAy
IFBXTSBjb250cm9sbGVycyBiZWluZwplbmFibGVkIGluIHRoZSBEU0RUIGF0IHRoZSBzYW1lIHRp
bWU7IGFuZCBhbHdheXMgcmVnaXN0ZXJlZCB0aGUgbG9va3VwLgoKU28gZmFyIHRoaXMgaGFzIGJl
ZW4gd29ya2luZywgYnV0IHRoZSBjb3JyZWN0IHdheSB0byBkZXRlcm1pbmUgd2hpY2ggUFdNCmNv
bnRyb2xsZXIgbmVlZHMgdG8gYmUgdXNlZCBpcyBieSBjaGVja2luZyBhIGJpdCBpbiB0aGUgVkJU
IHRhYmxlIGFuZApyZWNlbnRseSBJJ3ZlIGxlYXJuZWQgYWJvdXQgMiBkaWZmZXJlbnQgQllUIGRl
dmljZXM6ClBvaW50IG9mIFZpZXcgTU9CSUkgVEFCLVA4MDBXCkFjZXIgU3dpdGNoIDEwIFNXNS0w
MTIKCldoaWNoIHVzZSBhIENyeXN0YWwgQ292ZSBQTUlDLCB5ZXQgdGhlIExDRCBpcyBjb25uZWN0
ZWQgdG8gdGhlIFNvQy9MUFNTClBXTSBjb250cm9sbGVyIChhbmQgdGhlIFZCVCBjb3JyZWN0bHkg
aW5kaWNhdGVzIHRoaXMpLCBzbyBoZXJlIG91ciBvbGQKaGV1cmlzdGljcyBmYWlsLgoKVGhpcyBj
b21taXQgZml4ZXMgdXNpbmcgdGhlIHdyb25nIFBXTSBjb250cm9sbGVyIG9uIHRoZXNlIGRldmlj
ZXMgYnkKY2FsbGluZyBwd21fZ2V0KCkgZm9yIHRoZSByaWdodCBQV00gY29udHJvbGxlciBiYXNl
ZCBvbiB0aGUKVkJUIGRzaS5jb25maWcucHdtX2JsYyBiaXQuCgpOb3RlIHRoaXMgaXMgcGFydCBv
ZiBhIHNlcmllcyB3aGljaCBjb250YWlucyAyIG90aGVyIHBhdGNoZXMgd2hpY2ggcmVuYW1lcwp0
aGUgUFdNIGxvb2t1cCBmb3IgdGhlIDFzdCBTb0MvTFBTUyBQV00gZnJvbSAicHdtX2JhY2tsaWdo
dCIgdG8KInB3bV9wbWljX2JhY2tsaWdodCIgYW5kIHRoZSBQV00gbG9va3VwIGZvciB0aGUgQ3J5
c3RhbCBDb3ZlIFBNSUMgUFdNCmZyb20gInB3bV9iYWNrbGlnaHQiIHRvICJwd21fcG1pY19iYWNr
bGlnaHQiLgoKU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3BhbmVsLmMgfCAxNiAr
KysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3BhbmVsLmMKaW5k
ZXggYmMxNGU5YzAyODVhLi5kZGNmMzExZDExMTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX3BhbmVsLmMKQEAgLTE4NDAsMTMgKzE4NDAsMjIgQEAgc3RhdGljIGludCBw
d21fc2V0dXBfYmFja2xpZ2h0KHN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAkJ
CSAgICAgICBlbnVtIHBpcGUgcGlwZSkKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY29u
bmVjdG9yLT5iYXNlLmRldjsKKwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0
b19pOTE1KGRldik7CiAJc3RydWN0IGludGVsX3BhbmVsICpwYW5lbCA9ICZjb25uZWN0b3ItPnBh
bmVsOworCWNvbnN0IGNoYXIgKmRlc2M7CiAJaW50IHJldHZhbDsKIAotCS8qIEdldCB0aGUgUFdN
IGNoaXAgZm9yIGJhY2tsaWdodCBjb250cm9sICovCi0JcGFuZWwtPmJhY2tsaWdodC5wd20gPSBw
d21fZ2V0KGRldi0+ZGV2LCAicHdtX2JhY2tsaWdodCIpOworCS8qIEdldCB0aGUgcmlnaHQgUFdN
IGNoaXAgZm9yIERTSSBiYWNrbGlnaHQgYWNjb3JkaW5nIHRvIFZCVCAqLworCWlmIChkZXZfcHJp
di0+dmJ0LmRzaS5jb25maWctPnB3bV9ibGMgPT0gUFBTX0JMQ19QTUlDKSB7CisJCXBhbmVsLT5i
YWNrbGlnaHQucHdtID0gcHdtX2dldChkZXYtPmRldiwgInB3bV9wbWljX2JhY2tsaWdodCIpOwor
CQlkZXNjID0gIlBNSUMiOworCX0gZWxzZSB7CisJCXBhbmVsLT5iYWNrbGlnaHQucHdtID0gcHdt
X2dldChkZXYtPmRldiwgInB3bV9zb2NfYmFja2xpZ2h0Iik7CisJCWRlc2MgPSAiU29DIjsKKwl9
CisKIAlpZiAoSVNfRVJSKHBhbmVsLT5iYWNrbGlnaHQucHdtKSkgewotCQlEUk1fRVJST1IoIkZh
aWxlZCB0byBvd24gdGhlIHB3bSBjaGlwXG4iKTsKKwkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gZ2V0
IHRoZSAlcyBQV00gY2hpcFxuIiwgZGVzYyk7CiAJCXBhbmVsLT5iYWNrbGlnaHQucHdtID0gTlVM
TDsKIAkJcmV0dXJuIC1FTk9ERVY7CiAJfQpAQCAtMTg3Myw2ICsxODgyLDcgQEAgc3RhdGljIGlu
dCBwd21fc2V0dXBfYmFja2xpZ2h0KHN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvciwK
IAkJCQkgQ1JDX1BNSUNfUFdNX1BFUklPRF9OUyk7CiAJcGFuZWwtPmJhY2tsaWdodC5lbmFibGVk
ID0gcGFuZWwtPmJhY2tsaWdodC5sZXZlbCAhPSAwOwogCisJRFJNX0lORk8oIlVzaW5nICVzIFBX
TSBmb3IgTENEIGJhY2tsaWdodCBjb250cm9sXG4iLCBkZXNjKTsKIAlyZXR1cm4gMDsKIH0KIAot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
