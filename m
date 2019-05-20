Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A041B23F40
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 19:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAED8924C;
	Mon, 20 May 2019 17:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5580189238;
 Mon, 20 May 2019 17:41:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f10so157198wre.7;
 Mon, 20 May 2019 10:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SaB/HyT6/oED/ncLmyVItIP9zgJopLUDhT4V1Cn8C8s=;
 b=GSWbfOm9hLTUR/s3fSHYHno4DlEcLezcdC7nYU/Ks1cOfvr+7SBAWFkX+Fu0FS6ThY
 gWTughjDQsw7cWQrc39aaRdqf7RhX8+saIhOlcnF11g3MYuX+HGdyyQk+4Bi3Stmcu1D
 Rqww5X1OV3BCrdJ4EZk7SPVS/mKfPAhEvZNpe31EJTdFIJGasO9QRIb8YT0wHmIV5P4R
 01kjWd9s+o85PjotybHlrJZceAiY33jJr57eO4E/AamOwZCIHCEdk20Qn8Ug8gAwFNEf
 xna9CQ/GPKC1iDQ1lGFFXmoNmiY4aITbsvtTsunQ+/TNcu1wqQRFm6Lep61TY7DAMiqL
 e0fg==
X-Gm-Message-State: APjAAAWca1YDf/41HfUwvWMFbytFcCQRo6yHso3v1x1KBzp4uWR1yBC8
 SDeANpyfG76n7/bIIth0sWUrE+v88C3tXLuvt0Y=
X-Google-Smtp-Source: APXvYqyui4f360e+bz+pu+lDAMTcDkxzvL/eUGo/Z3wwpdBtjdZ27UVuZkcz1Sle0DqxtjFl+Arr1JSFuBerydhsTUw=
X-Received: by 2002:adf:8bc5:: with SMTP id w5mr3818759wra.132.1558374073011; 
 Mon, 20 May 2019 10:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
In-Reply-To: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 May 2019 13:41:00 -0400
Message-ID: <CADnq5_PE-mvW2zwNeHn6prvTQvh-en9E9F7VE-hCS=a8jJWhAQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: use struct_size() in kmalloc()
To: xiaolinkui <xiaolinkui@kylinos.cn>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SaB/HyT6/oED/ncLmyVItIP9zgJopLUDhT4V1Cn8C8s=;
 b=frcPfBLaCkAw55Tyx6V/dkyb1Dmt0u/f01wtgyBsyWUXbf/vOUNITWX7xPXthtq0xl
 bft0muUuT9iexs2vQ6DlzlFzt4voZf+LvjjC96BVra+o4/eQ/6NNFm6ml2Hf9zFy6YzE
 JDIAM8DK86IRqaDnt4iGFGaI10ic5qzQ4IzjI2HJBMvBq91Im9WWCtGHe/1I5MMDTDuW
 tNJjaUtpCSy+KGiqj8wU1HfSUfMf0FgqnY7t6aySQ/vN+w351CycwNdbRsBZbklhCeW3
 PiQAyp++pVdCmkr8h/Xf6Sx/RdJ37H8FM5mDXNSTsgGvXOIsyd9IntqgI6opnb7PTlAy
 1bkg==
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <xinhui.pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgODo0MyBBTSB4aWFvbGlua3VpIDx4aWFvbGlua3VpQGt5
bGlub3MuY24+IHdyb3RlOgo+Cj4gVXNlIHN0cnVjdF9zaXplKCkgaGVscGVyIHRvIGtlZXAgY29k
ZSBzaW1wbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiB4aWFvbGlua3VpIDx4aWFvbGlua3VpQGt5bGlu
b3MuY24+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8
IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkK
ClRoaXMgcGF0Y2ggcmVzdWx0cyBpbiB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yOgogIERFU0NF
TkQgIG9ianRvb2wKICBDQUxMICAgIHNjcmlwdHMvY2hlY2tzeXNjYWxscy5zaAogIENISyAgICAg
aW5jbHVkZS9nZW5lcmF0ZWQvY29tcGlsZS5oCiAgQ0MgW01dICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLm8KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9saW51
eC9rZXJuZWwuaDoxNSwKICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9saXN0
Lmg6OSwKICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC93YWl0Lmg6NywKICAg
ICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC93YWl0X2JpdC5oOjgsCiAgICAgICAg
ICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvZnMuaDo2LAogICAgICAgICAgICAgICAgIGZy
b20gLi9pbmNsdWRlL2xpbnV4L2RlYnVnZnMuaDoxNSwKICAgICAgICAgICAgICAgICBmcm9tIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYzoyNDoKZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jOiBJbiBmdW5jdGlvbiDigJhhbWRncHVfcmFzX2luaXTi
gJk6Ci4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDoxNjo0NTogZXJyb3I6IG5lZ2F0aXZlIHdp
ZHRoIGluIGJpdC1maWVsZArigJg8YW5vbnltb3VzPuKAmQogI2RlZmluZSBCVUlMRF9CVUdfT05f
WkVSTyhlKSAoc2l6ZW9mKHN0cnVjdCB7IGludDooLSEhKGUpKTsgfSkpCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVy
Lmg6MzQ5OjI4OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8K4oCYQlVJTERfQlVHX09OX1pF
Uk/igJkKICNkZWZpbmUgX19tdXN0X2JlX2FycmF5KGEpIEJVSUxEX0JVR19PTl9aRVJPKF9fc2Ft
ZV90eXBlKChhKSwgJihhKVswXSkpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fgouL2luY2x1ZGUvbGludXgvb3ZlcmZsb3cuaDozMDY6MzA6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZiBtYWNybyDigJhfX211c3RfYmVfYXJyYXnigJkKICAgICAgIHNpemVvZigqKHAp
LT5tZW1iZXIpICsgX19tdXN0X2JlX2FycmF5KChwKS0+bWVtYmVyKSxcCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmM6MTU1NjoxNjogbm90ZTogaW4gZXhwYW5zaW9uIG9mCm1hY3JvIOKAmHN0
cnVjdF9zaXpl4oCZCiAgY29uID0ga21hbGxvYyhzdHJ1Y3Rfc2l6ZShjb24sIG9ianMsIEFNREdQ
VV9SQVNfQkxPQ0tfQ09VTlQpLAogICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4KbWFrZVs0XTog
KioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI3NjoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5vXSBFcnJvciAxCm1ha2VbNF06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlz
aGVkIGpvYnMuLi4uCm1ha2VbM106ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0OTI6IGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1XSBFcnJvciAyCm1ha2VbM106ICoqKiBXYWl0aW5nIGZv
ciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWls
ZDo0OTI6IGRyaXZlcnMvZ3B1L2RybV0gRXJyb3IgMgptYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFr
ZWZpbGUuYnVpbGQ6NDkyOiBkcml2ZXJzL2dwdV0gRXJyb3IgMgptYWtlOiAqKiogW01ha2VmaWxl
OjEwNDI6IGRyaXZlcnNdIEVycm9yIDIKCkFsZXgKCgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYwo+IGluZGV4IDIyYmQyMWUuLjQ3MTdhNjQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4gQEAgLTEzNzUsOCArMTM3NSw3IEBAIGlu
dCBhbWRncHVfcmFzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAgICAgICBp
ZiAoY29uKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPgo+IC0gICAgICAgY29uID0ga21h
bGxvYyhzaXplb2Yoc3RydWN0IGFtZGdwdV9yYXMpICsKPiAtICAgICAgICAgICAgICAgICAgICAg
ICBzaXplb2Yoc3RydWN0IHJhc19tYW5hZ2VyKSAqIEFNREdQVV9SQVNfQkxPQ0tfQ09VTlQsCj4g
KyAgICAgICBjb24gPSBrbWFsbG9jKHN0cnVjdF9zaXplKGNvbiwgb2JqcywgQU1ER1BVX1JBU19C
TE9DS19DT1VOVCksCj4gICAgICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTHxfX0dGUF9a
RVJPKTsKPiAgICAgICAgIGlmICghY29uKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsKPiAtLQo+IDIuNy40Cj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
