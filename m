Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4338715AF0A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 18:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D9A6E0BC;
	Wed, 12 Feb 2020 17:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E92489D58;
 Wed, 12 Feb 2020 17:49:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k11so3451558wrd.9;
 Wed, 12 Feb 2020 09:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4Eaih2PdVYHdSmGENYMMSvWX3QyJJ7JrEJNGJH9JEZU=;
 b=ln4kQduxSGiB5upIehVjBRreX39kBmypfJnssW3OR7RBZZNtuWYO3PqGR3+VgMzG1t
 fa9tTXjW/mwmKjAgXpIxVleaxl6QZ4/3q+qO7Ce+c6+XTGL1jyyQI79R1r0j4b7vQgQ/
 0giUrSnhVOczxC/pcXBFkME/GWYYro3bw5H/Du+GSaTXnnBtjd0xXQGMQHYlrrXMiPPL
 Nh9W7/FCigmutz6cmAHrh85TUYtPb6TqSxlBS3lCJwxQtZy/NaOGaVYj54k8cMTS3OTC
 cxzmFp/11lt6qUiJ6PAh9KgGVyxJ4yD2jiibjccYRvnAScTPGzywaKb3RT9C2VgYTfBf
 T5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4Eaih2PdVYHdSmGENYMMSvWX3QyJJ7JrEJNGJH9JEZU=;
 b=DbfVTA3NSZ2bnQ6co01A0/uhMUyJSuF7B7Gh0tHxOJMULHtyb31DGwQJ+wlZbROMsj
 XrHO+jo5MR3fwGDgGBwpYWlIQzPI74IFVesCpmjPtnUWarfDLnxLxb2VxCGhvPYwDKhu
 PS9xb3gK3e32F8msdMKxvKkWdSPstuOklLZvi0pNDA2Nn4kg9+AEnRke+T1ETVeI/nRe
 rrvHF5uSy4id0RmPfFxsCH6Q860Oih5i5JbSNtrmdBgfLxwcl/oMYhhdov1HTFOg+OG6
 iO6ElkXAAZ3xgx4hLYCO0xW4FRhpZDcl1wD/Gfsv2qR2qDnv4HRlPOzBtQRevkGGfyeG
 gCZQ==
X-Gm-Message-State: APjAAAXjL0HGnNA4S0DFx4WRAJqlQWk33AOvCAeYY0WiQDIBKBL4wU/0
 VIiGVcBWd+pcn5Au3hPPC65LkvzHRGuSw3pX+Bk=
X-Google-Smtp-Source: APXvYqx3M86yfLlIgx1VvNO16WAstGtVaFP4WF01P7QzT8uTU/GnS9aP6ymoBfxD6s/TY5Pq13OYRf4QZYzPO33ezTs=
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr17200827wrn.124.1581529740131; 
 Wed, 12 Feb 2020 09:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20200212120759.dokjxbk4cqln55sc@kili.mountain>
 <577d76db-3c2d-545d-6237-1c66f17ec178@amd.com>
In-Reply-To: <577d76db-3c2d-545d-6237-1c66f17ec178@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Feb 2020 12:48:49 -0500
Message-ID: <CADnq5_N7E8RK5AEpRrofv5FpMEt4r21U6Qj2V9yfFtO9MS6KyA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: return -EFAULT if copy_to_user() fails
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Philip Yang <Philip.Yang@amd.com>, Jonathan Kim <Jonathan.Kim@amd.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Tianci.Yin" <tianci.yin@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgNzoxMiBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMTIuMDIuMjAgdW0gMTM6MDcgc2Nocmll
YiBEYW4gQ2FycGVudGVyOgo+ID4gVGhlIGNvcHlfdG9fdXNlcigpIGZ1bmN0aW9uIHJldHVybnMg
dGhlIG51bWJlciBvZiBieXRlcyByZW1haW5pbmcgdG8gYmUKPiA+IGNvcGllZCwgYnV0IHdlIHdh
bnQgdG8gcmV0dXJuIGEgbmVnYXRpdmUgZXJyb3IgY29kZSB0byB0aGUgdXNlci4KPiA+Cj4gPiBG
aXhlczogMDMwZDViOTdhNTRiICgiZHJtL2FtZGdwdTogdXNlIGFtZGdwdV9kZXZpY2VfdnJhbV9h
Y2Nlc3MgaW4gYW1kZ3B1X3R0bV92cmFtX3JlYWQiKQo+ID4gU2lnbmVkLW9mZi1ieTogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+IEFsZXggZG8geW91IHdh
bnQgdG8gcGljayB0aGF0IHVwIG9yIHNob3VsZCBJIGRvIHRoaXM/Cj4KCkFwcGxpZWQuICB0aGFu
a3MhCgpBbGV4Cgo+IFRoYW5rcywKPiBDaHJpc3RpYW4uCj4KPiA+IC0tLQo+ID4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCA2ICsrLS0tLQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiA+IGluZGV4IDE1ZjU0NTFkMzEyZC4uNjYw
ODY3Y2YyNTk3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMKPiA+IEBAIC0yMjgwLDcgKzIyODAsNiBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfdHRtX3Zy
YW1fcmVhZChzdHJ1Y3QgZmlsZSAqZiwgY2hhciBfX3VzZXIgKmJ1ZiwKPiA+ICAgewo+ID4gICAg
ICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBmaWxlX2lub2RlKGYpLT5pX3ByaXZhdGU7
Cj4gPiAgICAgICBzc2l6ZV90IHJlc3VsdCA9IDA7Cj4gPiAtICAgICBpbnQgcjsKPiA+Cj4gPiAg
ICAgICBpZiAoc2l6ZSAmIDB4MyB8fCAqcG9zICYgMHgzKQo+ID4gICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPiA+IEBAIC0yMjk0LDkgKzIyOTMsOCBAQCBzdGF0aWMgc3NpemVfdCBhbWRn
cHVfdHRtX3ZyYW1fcmVhZChzdHJ1Y3QgZmlsZSAqZiwgY2hhciBfX3VzZXIgKmJ1ZiwKPiA+ICAg
ICAgICAgICAgICAgdWludDMyX3QgdmFsdWVbQU1ER1BVX1RUTV9WUkFNX01BWF9EV19SRUFEXTsK
PiA+Cj4gPiAgICAgICAgICAgICAgIGFtZGdwdV9kZXZpY2VfdnJhbV9hY2Nlc3MoYWRldiwgKnBv
cywgdmFsdWUsIGJ5dGVzLCBmYWxzZSk7Cj4gPiAtICAgICAgICAgICAgIHIgPSBjb3B5X3RvX3Vz
ZXIoYnVmLCB2YWx1ZSwgYnl0ZXMpOwo+ID4gLSAgICAgICAgICAgICBpZiAocikKPiA+IC0gICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gcjsKPiA+ICsgICAgICAgICAgICAgaWYgKGNvcHlfdG9f
dXNlcihidWYsIHZhbHVlLCBieXRlcykpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FRkFVTFQ7Cj4gPgo+ID4gICAgICAgICAgICAgICByZXN1bHQgKz0gYnl0ZXM7Cj4gPiAgICAg
ICAgICAgICAgIGJ1ZiArPSBieXRlczsKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
