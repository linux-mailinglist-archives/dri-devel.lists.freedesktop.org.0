Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E87411E921
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38256E823;
	Fri, 13 Dec 2019 17:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3CD6E823
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:26:19 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d16so235969wre.10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nGbXcqHerJGBeBzW1jOtcyX0eHMlFdu8ptwtjM6IAGs=;
 b=cTqGuMWf3lcXJE3yyfN1xzAVUxEAqMUALHS8265gtqOrAHneylVktnsDn3fCGXvvH8
 quPYHWh7eChpHSg5CePqbwnCjBaPfj35YvykuolmaxK/EL7URUmPHMv3b9sSjm9UShC3
 gs5RXerv0sB6byEH0E3f/Uim6dUPPzdW7S32c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nGbXcqHerJGBeBzW1jOtcyX0eHMlFdu8ptwtjM6IAGs=;
 b=itHJqtL1vXcbVqGYUVDLMVKQXvWSsPSwsRhicWa9BM7SzYiIV93IYxXuNJGAtlWPlN
 thU8DJdxrj5F1ZxIZk9tE1yOZn4VQbsWnNMeXhXMEWWMEljNEl4+LQNYaUDZeYm0jrbd
 /vY3IAfzAOhV3rcCuquP9RMuLvTofOZ0p+gttQKGVrujjSDtOG8emRBg+F4TuC/J+nJR
 MHArP5LwTERwvAgrKDDqTRSaFJmZkCsXZzSPl2B4vvUsv+f1kMzk4jCGlg8qBPPvFD4N
 BeblA+M9Jjq6teZjah6sBodjMsneovlXxGcn1zWTF6Yo0xkelmLRx1xO1rOweap2Z+q8
 RDsA==
X-Gm-Message-State: APjAAAVJskls4gfyjZf+i5aEJ2yWrXI6ZTVBL3sxciksG7zyWf09ZOo0
 N6PI/BPV6XzO67lKcS+OSwW2HJz7Sys=
X-Google-Smtp-Source: APXvYqx9y5Ex+KchS9HHfZNCLtRuFR8Lg7zSLNI3N6LTLXS7SFOtp5AZKNdobiJ13vR4HHMQZ1vA4A==
X-Received: by 2002:adf:ef4e:: with SMTP id c14mr14293375wrp.142.1576257978051; 
 Fri, 13 Dec 2019 09:26:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q15sm10689669wrr.11.2019.12.13.09.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:26:17 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/10] drm/todo: Add item for the plane->atomic_check confusion
Date: Fri, 13 Dec 2019 18:26:03 +0100
Message-Id: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBmcmFua2x5IGEgbWVzcywgYW5kIHRoZSBjb25mdXNpb24gYXJvdW5kIHBsYW5lX3N0YXRl
LT5jcnRjL2ZiCnRoYXQgSSBmaXhlZCB1cCBpbiB0aGlzIHNlcmllcyBpcyB0aGUgbGVhc3Qgb2Yg
dGhlIHByb2JsZW1zLiBBZGQgYQp0b2RvIGFzIGEgZnV0dXJlIG5vdGUgb2YgaG93IHRoaXMgY291
bGQgYmUgZG9uZSBhIGxvdCBiZXR0ZXIsIGFuZCB3aXRoCmEgbG90IGxlc3MgZHJpdmVyIGNvbmZ1
c2lvbi4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwu
Y29tPgotLS0KIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgMjIgKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cmlu
ZGV4IDJkODVmMzcyODRhMS4uNjNiNjU3ZWNjOWNlIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2dwdS90b2RvLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdApAQCAtNzIsNiAr
NzIsMjggQEAgQ29udGFjdDogVmlsbGUgU3lyasOkbMOkLCBEYW5pZWwgVmV0dGVyLCBkcml2ZXIg
bWFpbnRhaW5lcnMKIAogTGV2ZWw6IEFkdmFuY2VkCiAKK0ltcHJvdmUgcGxhbmUgYXRvbWljX2No
ZWNrIGhlbHBlcnMKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworQXNpZGUg
ZnJvbSB0aGUgY2xpcHBlZCBjb29yZGluYXRlcyByaWdodCBhYm92ZSB0aGVyZSdzIGEgZmV3IHN1
Ym9wdGltYWwgdGhpbmdzCit3aXRoIHRoZSBjdXJyZW50IGhlbHBlcnM6CisKKy0gZHJtX3BsYW5l
X2hlbHBlcl9mdW5jcy0+YXRvbWljX2NoZWNrIGdldHMgY2FsbGVkIGZvciBlbmFibGVkIG9yIGRp
c2FibGVkCisgIHBsYW5lcy4gQXQgYmVzdCB0aGlzIHNlZW1zIHRvIGNvbmZ1c2UgZHJpdmVycywg
d29yc3QgaXQgbWVhbnMgdGhleSBibG93IHVwCisgIHdoZW4gdGhlIHBsYW5lIGlzIGRpc2FibGVk
IHdpdGhvdXQgdGhlIENSVEMuIFRoZSBvbmx5IHNwZWNpYWwgaGFuZGxpbmcgaXMKKyAgcmVzZXR0
aW5nIHZhbHVlcyBpbiB0aGUgcGxhbmUgc3RhdGUgc3RydWN0dXJlcywgd2hpY2ggaW5zdGVhZCBz
aG91bGQgYmUgbW92ZWQKKyAgaW50byB0aGUgZHJtX3BsYW5lX2Z1bmNzLT5hdG9taWNfZHVwbGlj
YXRlX3N0YXRlIGZ1bmN0aW9ucy4KKworLSBPbmNlIHRoYXQncyBkb25lLCBoZWxwZXJzIGNvdWxk
IHN0b3AgY2FsbGluZyAtPmF0b21pY19jaGVjayBmb3IgZGlzYWJsZWQKKyAgcGxhbmVzLgorCist
IFRoZW4gd2UgY291bGQgZ28gdGhyb3VnaCBhbGwgdGhlIGRyaXZlcnMgYW5kIHJlbW92ZSB0aGUg
bW9yZS1vci1sZXNzIGNvbmZ1c2VkCisgIGNoZWNrcyBmb3IgcGxhbmVfc3RhdGUtPmZiIGFuZCBw
bGFuZV9zdGF0ZS0+Y3J0Yy4KKworQ29udGFjdDogRGFuaWVsIFZldHRlcgorCitMZXZlbDogQWR2
YW5jZWQKKwogQ29udmVydCBlYXJseSBhdG9taWMgZHJpdmVycyB0byBhc3luYyBjb21taXQgaGVs
cGVycwogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
