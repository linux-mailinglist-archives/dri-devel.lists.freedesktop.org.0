Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C17109CD4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 12:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DA96E2F3;
	Tue, 26 Nov 2019 11:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639AD6E2F3;
 Tue, 26 Nov 2019 11:15:07 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id k206so7303060ybb.5;
 Tue, 26 Nov 2019 03:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=CPxUmxxrz0H0XB9WSkrGE01aU3KDlj9zInkoJCdSrwI=;
 b=qtuJVnkcCoP693T7URd1MgR3QNMPsxMviqYeXAKJZzoKx6jxrUA+Z8E28oOehvMuo6
 CKqrXQrKg7zHd7G4bxqrhsDpPK/NTZmKUkPJi2G6UHktBR+pc6ceD5YXa1PuqTdfKiIH
 JT9wEzpBl7gCeVtZRBSqfOCqafQBioesoiw0y9hKgmb0MKKhWTg1YlyOEd2B7sKLpaFq
 npyD3qgZ9FpW9gyex+tfjBdrLG1qoEyGaj3aYV8cC7Ge/caUjSwG55V2E7PWXs92sM+C
 NLomIRXECTD2vIWJ3TE0w3I95VsT1msb+bv8k9lolRCpUgjRv7xPV9GQCDpX2oCYylja
 +upQ==
X-Gm-Message-State: APjAAAWB+8a8gcF4rDktojK9QaIvequzaYC/pMCPN0yyfJ3fYe9k7pE0
 mmUMolP1UBnJJX7DuhOq/cA=
X-Google-Smtp-Source: APXvYqxUgfCnoVZSg2eIA2nU2DX4ldVW9HvmRj91bucSmqEaPetNMhcHB+9fveyReW4rS6qYnqxGXA==
X-Received: by 2002:a25:258a:: with SMTP id
 l132mr28132474ybl.227.1574766906377; 
 Tue, 26 Nov 2019 03:15:06 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j79sm5064019ywa.100.2019.11.26.03.15.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Nov 2019 03:15:05 -0800 (PST)
Subject: Re: [PATCH v2 2/2] drm: share address space for dma bufs
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20191122063749.27113-1-kraxel@redhat.com>
 <20191122063749.27113-3-kraxel@redhat.com>
 <CAKMK7uFz3hmPT3OE8UtUQwmv+tXsjazUWT2RVHLxAq47X+EaXA@mail.gmail.com>
 <CADnq5_MvOE1Fw7-0g+Fo3Vvvu-c=Z9u+pZUEstv2cVXNKKL2=g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <805a875c-a43f-556d-db72-3af32e3061d6@gmail.com>
Date: Tue, 26 Nov 2019 12:15:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_MvOE1Fw7-0g+Fo3Vvvu-c=Z9u+pZUEstv2cVXNKKL2=g@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CPxUmxxrz0H0XB9WSkrGE01aU3KDlj9zInkoJCdSrwI=;
 b=V1luVdUV4XJZz94qiIBz2tJ7QVfajnWgLB+RPf3tuqosIVP4fSEVycsb7IB4jp1+gL
 e6Est8fUOmF044UlBzlpXdMYTwKU8j6IKv/CVD+8vMaLEus1ZXImDoWuh/Fl9fVnLF6q
 6qBxgWSIu7MdvCV+Rr8k227Eb08UChBSMQxyyX5nIeKzdaWetG1tT4QeoiaJ76xZQ5oB
 yhedQCP4+Y09aALzMARk6ZY93ngYyUDx7iCRPRC4HCQ9kh+rVHqW+T+CgOOjUpfAw8LD
 sSrVpC8rQQzzW0uZcyb5o76u3HM/8iSY3GePcHey9MUALWuFbioZ16N4w/oPuDHqI8yj
 79jQ==
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
Reply-To: christian.koenig@amd.com
Cc: David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMTEuMTkgdW0gMTk6MjEgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gT24gRnJpLCBOb3Yg
MjIsIDIwMTkgYXQgNDoxNyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3Rl
Ogo+PiBPbiBGcmksIE5vdiAyMiwgMjAxOSBhdCA3OjM3IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPiB3cm90ZToKPj4+IFVzZSB0aGUgc2hhcmVkIGFkZHJlc3Mgc3BhY2Ugb2Yg
dGhlIGRybSBkZXZpY2UgKHNlZSBkcm1fb3BlbigpIGluCj4+PiBkcm1fZmlsZS5jKSBmb3IgZG1h
LWJ1ZnMgdG9vLiAgVGhhdCByZW1vdmVzIGEgZGlmZmVyZW5jZSBiZXR3ZWVtIGRybQo+Pj4gZGV2
aWNlIG1tYXAgdm1hcyBhbmQgZG1hLWJ1ZiBtbWFwIHZtYXMgYW5kIGZpeGVzIGNvcm5lciBjYXNl
cyBsaWtlCj4+PiBkcm9wcGluZyBwdGVzICh1c2luZyBtYWR2aXNlKERPTlRORUVEKSBmb3IgZXhh
bXBsZSkgbm90IHdvcmtpbmcKPj4+IHByb3Blcmx5Lgo+Pj4KPj4+IEFsc28gcmVtb3ZlIGFtZGdw
dSBkcml2ZXIncyBwcml2YXRlIGRtYWJ1ZiB1cGRhdGUuICBJdCBpcyBub3QgbmVlZGVkCj4+PiBh
bnkgbW9yZSBub3cgdGhhdCB3ZSBhcmUgZG9pbmcgdGhpcyBmb3IgZXZlcnlib2R5Lgo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+PiBSZXZp
ZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPj4KPj4gQnV0
IEkgdGhpbmsgeW91IHdhbnQgYXQgbGVhc3QgYW4gYWNrIGZyb20gYW1kIGd1eXMgZm9yIGRvdWJs
ZSBjaGVja2luZyBoZXJlLgo+PiAtRGFuaWVsCj4gTG9va3MgY29ycmVjdCB0byBtZS4KPgo+IFJl
dmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpSZXZp
ZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPgo+
Cj4+PiAtLS0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYu
YyB8IDQgKy0tLQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgICAgICAgICAgICAg
ICAgIHwgNCArKystCj4+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZG1hX2J1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rt
YV9idWYuYwo+Pj4gaW5kZXggZDViY2RmZWZiYWQ2Li41ODZkYjRmYjQ2YmQgMTAwNjQ0Cj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCj4+PiBAQCAtMzYx
LDEwICszNjEsOCBAQCBzdHJ1Y3QgZG1hX2J1ZiAqYW1kZ3B1X2dlbV9wcmltZV9leHBvcnQoc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpnb2JqLAo+Pj4gICAgICAgICAgICAgICAgICByZXR1cm4gRVJS
X1BUUigtRVBFUk0pOwo+Pj4KPj4+ICAgICAgICAgIGJ1ZiA9IGRybV9nZW1fcHJpbWVfZXhwb3J0
KGdvYmosIGZsYWdzKTsKPj4+IC0gICAgICAgaWYgKCFJU19FUlIoYnVmKSkgewo+Pj4gLSAgICAg
ICAgICAgICAgIGJ1Zi0+ZmlsZS0+Zl9tYXBwaW5nID0gZ29iai0+ZGV2LT5hbm9uX2lub2RlLT5p
X21hcHBpbmc7Cj4+PiArICAgICAgIGlmICghSVNfRVJSKGJ1ZikpCj4+PiAgICAgICAgICAgICAg
ICAgIGJ1Zi0+b3BzID0gJmFtZGdwdV9kbWFidWZfb3BzOwo+Pj4gLSAgICAgICB9Cj4+Pgo+Pj4g
ICAgICAgICAgcmV0dXJuIGJ1ZjsKPj4+ICAgfQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+Pj4gaW5kZXgg
YTk2MzNiZDI0MWJiLi5jM2ZjMzQxNDUzYzAgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3ByaW1lLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+Pj4g
QEAgLTI0MCw2ICsyNDAsNyBAQCB2b2lkIGRybV9wcmltZV9kZXN0cm95X2ZpbGVfcHJpdmF0ZShz
dHJ1Y3QgZHJtX3ByaW1lX2ZpbGVfcHJpdmF0ZSAqcHJpbWVfZnByaXYpCj4+PiAgIHN0cnVjdCBk
bWFfYnVmICpkcm1fZ2VtX2RtYWJ1Zl9leHBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfYnVmX2V4
cG9ydF9pbmZvICpleHBfaW5mbykKPj4+ICAgewo+Pj4gKyAgICAgICBzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaiA9IGV4cF9pbmZvLT5wcml2Owo+Pj4gICAgICAgICAgc3RydWN0IGRtYV9idWYg
KmRtYV9idWY7Cj4+Pgo+Pj4gICAgICAgICAgZG1hX2J1ZiA9IGRtYV9idWZfZXhwb3J0KGV4cF9p
bmZvKTsKPj4+IEBAIC0yNDcsNyArMjQ4LDggQEAgc3RydWN0IGRtYV9idWYgKmRybV9nZW1fZG1h
YnVmX2V4cG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+Pj4gICAgICAgICAgICAgICAgICBy
ZXR1cm4gZG1hX2J1ZjsKPj4+Cj4+PiAgICAgICAgICBkcm1fZGV2X2dldChkZXYpOwo+Pj4gLSAg
ICAgICBkcm1fZ2VtX29iamVjdF9nZXQoZXhwX2luZm8tPnByaXYpOwo+Pj4gKyAgICAgICBkcm1f
Z2VtX29iamVjdF9nZXQob2JqKTsKPj4+ICsgICAgICAgZG1hX2J1Zi0+ZmlsZS0+Zl9tYXBwaW5n
ID0gb2JqLT5kZXYtPmFub25faW5vZGUtPmlfbWFwcGluZzsKPj4+Cj4+PiAgICAgICAgICByZXR1
cm4gZG1hX2J1ZjsKPj4+ICAgfQo+Pj4gLS0KPj4+IDIuMTguMQo+Pj4KPj4KPj4gLS0KPj4gRGFu
aWVsIFZldHRlcgo+PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPj4gKzQx
ICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaAo+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0
Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
