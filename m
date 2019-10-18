Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EACDDDD13E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 23:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B612589DE6;
	Fri, 18 Oct 2019 21:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BBD89DE6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 21:34:28 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-g8g-wFFjPWCnRun0aA_fZg-1; Fri, 18 Oct 2019 17:34:23 -0400
Received: by mail-qk1-f200.google.com with SMTP id r17so6830498qkm.16
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 14:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=VdWdMfn/TnRP80rsqbYwzDvvrKkg3slgtPf3O7XKPck=;
 b=o7VGdg+AauhbTQ9hj5s8rD9LCU5ZZ17DjDpnIHflIIOAJjeSlvRoplYZnGkrxxcHn+
 Pn4KXyDml2UVucXK83nCarPWFjFzkgkq9ij2dKKJq+0Yz+UrFuDE1KRTx5XZVaeM8LV6
 aa0ejDFOdh7DFExgZRwudTEPWUTnV3hJV9XwBGQ2BXVuBCWM+E8PyptZRRROOASpmJb6
 weJr6G2SP8ucucwFwJ0xvOdmeiRHlx5FdeNtbBqWAJS4tHe8/+KipFpA1Z1xMNHXlH1R
 9o7T6I2nvgdiube7HNVW7C9hmBLwoJulI0PqOvlseJUUygoicA+gh73CqGWTHxIX/4CR
 LZMA==
X-Gm-Message-State: APjAAAUf+V+H2bqOZDyG4mh5ATTGiSs4+Q/TRjQT0fOUX8see1OjJTby
 70puqLZV/DfH9XjBuzl/eQaYeI2MkQt/vC3Fh/HfqLn5C+Uu1K2mXnm0iB0S/UHfcZDvv6kA20a
 xXPr1UfbGc8SjY9Py7Wrb5KGFrbJL
X-Received: by 2002:a37:4d8e:: with SMTP id
 a136mr10649440qkb.109.1571434462806; 
 Fri, 18 Oct 2019 14:34:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfhui9c78ThC08XeaaZnZlB2M3ymVOksm9YLXiUkymK8wJfl260gfmspP1GE6I82DkedUv/g==
X-Received: by 2002:a37:4d8e:: with SMTP id
 a136mr10649424qkb.109.1571434462506; 
 Fri, 18 Oct 2019 14:34:22 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id l7sm3863982qke.67.2019.10.18.14.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 14:34:21 -0700 (PDT)
Message-ID: <930362634acd2351b4f69049f842b2dc9f78f34b.camel@redhat.com>
Subject: Re: [PATCH 09/15] drm/dp: Add helper to get post-cursor adjustments
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Oct 2019 17:34:20 -0400
In-Reply-To: <20191015143509.1104985-10-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-10-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: g8g-wFFjPWCnRun0aA_fZg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571434468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htk9W77GiIQ9nRoA7ZXM+mxiaRf5lLixAI619tlQk+w=;
 b=a5XuaweSWNWaIKDht8mbb8xf0DfYApHB0dzvbwRmqSqztke/B8V4AgGTJ2K+PDvSkSAxQk
 YjhAzhhLrzNVWzoj5czX7cYxf+xBLacn8ad1QQtv9gNWewR3DGEqozTVBi2faiz1MF1Q2n
 pbg/KRLPp4oV0IqpMRp0nkGpMFmXErI=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUdWUsIDIwMTkt
MTAtMTUgYXQgMTY6MzUgKzAyMDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+IEZyb206IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gCj4gSWYgdGhlIHRyYW5zbWl0dGVyIHN1
cHBvcnRzIHByZS1lbXBoYXNpcyBwb3N0IGN1cnNvcjIgdGhlIHNpbmsgd2lsbAo+IHJlcXVlc3Qg
YWRqdXN0bWVudHMgaW4gYSBzaW1pbGFyIHdheSB0byBob3cgaXQgcmVxdWVzdHMgYWRqdXN0bWVu
dHMgdG8KPiB0aGUgdm9sdGFnZSBzd2luZyBhbmQgcHJlLWVtcGhhc2lzIHNldHRpbmdzLgo+IAo+
IEFkZCBhIGhlbHBlciB0byBleHRyYWN0IHRoZXNlIGFkanVzdG1lbnRzIG9uIGEgcGVyLWxhbmUg
YmFzaXMgZnJvbSB0aGUKPiBEUENEIGxpbmsgc3RhdHVzLgo+IAo+IFJldmlld2VkLWJ5OiBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IFNpZ25lZC1vZmYtYnk6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMgfCAxMCArKysrKysrKysrCj4gIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaCAgICAgfCAxMCArKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gaW5kZXggNGI2NjAxMDc3MWZhLi5k
ZThmZjhkZGI0NDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKPiBAQCAtMTIwLDYgKzEy
MCwxNiBAQCB1OCBkcm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ByZV9lbXBoYXNpcyhjb25zdCB1
OAo+IGxpbmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJCj4gIH0KPiAgRVhQT1JUX1NZTUJPTChk
cm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ByZV9lbXBoYXNpcyk7Cj4gIAo+ICt1OCBkcm1fZHBf
Z2V0X2FkanVzdF9yZXF1ZXN0X3Bvc3RfY3Vyc29yKGNvbnN0IHU4Cj4gbGlua19zdGF0dXNbRFBf
TElOS19TVEFUVVNfU0laRV0sCj4gKwkJCQkJIHVuc2lnbmVkIGludCBsYW5lKQo+ICt7Cj4gKwl1
bnNpZ25lZCBpbnQgb2Zmc2V0ID0gRFBfQURKVVNUX1JFUVVFU1RfUE9TVF9DVVJTT1IyOwo+ICsJ
dTggdmFsdWUgPSBkcF9saW5rX3N0YXR1cyhsaW5rX3N0YXR1cywgb2Zmc2V0KTsKPiArCj4gKwly
ZXR1cm4gKHZhbHVlID4+IChsYW5lIDw8IDEpKSAmIDB4MzsKPiArfQo+ICtFWFBPUlRfU1lNQk9M
KGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3RfcG9zdF9jdXJzb3IpOwo+ICsKPiAgdm9pZCBkcm1f
ZHBfbGlua190cmFpbl9jbG9ja19yZWNvdmVyeV9kZWxheShjb25zdCB1OAo+IGRwY2RbRFBfUkVD
RUlWRVJfQ0FQX1NJWkVdKQo+ICB7Cj4gIAl1bnNpZ25lZCBpbnQgcmRfaW50ZXJ2YWwgPSBkcm1f
ZHBfYXV4X3JkX2ludGVydmFsKGRwY2QpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
ZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiBpbmRleCA2YzEyZGU2
ZjdlNDYuLmUwYjJjMDNmM2NiYiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiBAQCAtNjA4LDYgKzYw
OCwxNCBAQAo+ICAjIGRlZmluZSBEUF9BREpVU1RfUFJFX0VNUEhBU0lTX0xBTkUxX1NISUZUICA2
Cj4gIAo+ICAjZGVmaW5lIERQX0FESlVTVF9SRVFVRVNUX1BPU1RfQ1VSU09SMiAgICAgIDB4MjBj
Cj4gKyMgZGVmaW5lIERQX0FESlVTVF9QT1NUX0NVUlNPUjJfTEFORTBfTUFTSyAgMHgwMwo+ICsj
IGRlZmluZSBEUF9BREpVU1RfUE9TVF9DVVJTT1IyX0xBTkUwX1NISUZUIDAKPiArIyBkZWZpbmUg
RFBfQURKVVNUX1BPU1RfQ1VSU09SMl9MQU5FMV9NQVNLICAweDBjCj4gKyMgZGVmaW5lIERQX0FE
SlVTVF9QT1NUX0NVUlNPUjJfTEFORTFfU0hJRlQgMgo+ICsjIGRlZmluZSBEUF9BREpVU1RfUE9T
VF9DVVJTT1IyX0xBTkUyX01BU0sgIDB4MzAKPiArIyBkZWZpbmUgRFBfQURKVVNUX1BPU1RfQ1VS
U09SMl9MQU5FMl9TSElGVCA0Cj4gKyMgZGVmaW5lIERQX0FESlVTVF9QT1NUX0NVUlNPUjJfTEFO
RTNfTUFTSyAgMHhjMAo+ICsjIGRlZmluZSBEUF9BREpVU1RfUE9TVF9DVVJTT1IyX0xBTkUzX1NI
SUZUIDYKPiAgCj4gICNkZWZpbmUgRFBfVEVTVF9SRVFVRVNUCQkJICAgIDB4MjE4Cj4gICMgZGVm
aW5lIERQX1RFU1RfTElOS19UUkFJTklORwkJICAgICgxIDw8IDApCj4gQEAgLTExMjEsNiArMTEy
OSw4IEBAIHU4IGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3Rfdm9sdGFnZShjb25zdCB1OAo+IGxp
bmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJWkVdLAo+ICAJCQkJICAgICBpbnQgbGFuZSk7Cj4g
IHU4IGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3RfcHJlX2VtcGhhc2lzKGNvbnN0IHU4Cj4gbGlu
a19zdGF0dXNbRFBfTElOS19TVEFUVVNfU0laRV0sCj4gIAkJCQkJICBpbnQgbGFuZSk7Cj4gK3U4
IGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3RfcG9zdF9jdXJzb3IoY29uc3QgdTgKPiBsaW5rX3N0
YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSwKPiArCQkJCQkgdW5zaWduZWQgaW50IGxhbmUpOwo+
ICAKPiAgI2RlZmluZSBEUF9CUkFOQ0hfT1VJX0hFQURFUl9TSVpFCTB4Ywo+ICAjZGVmaW5lIERQ
X1JFQ0VJVkVSX0NBUF9TSVpFCQkweGYKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
