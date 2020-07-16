Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA8B2222DC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 14:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574296EC4D;
	Thu, 16 Jul 2020 12:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A859B6E2EC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:50:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g75so10178302wme.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1SAi4Xd/ZXR54tvMv3FYZTkx7/klE43gbWDWEE/9jug=;
 b=JQRw1fRAk9imiYIcU7A7j2XJCexw9NYXVzageLL9TkXjz9vHt2FZ+T1B5wYCCMbZ24
 lMm+w4NY/0HTDLbW6ylHy/rN5JVjF0IRLX0B2A64dVHMYRCKhN/mxxoSmDD3MMpzwnGZ
 Q5ew8e3FCoFyxsPYZ604M74XLjeLkz7LGl7IXtvJLInj1zZdrHiVEqF0TLX0Ym8qxkiG
 ThvSoo7LXk0tYEpLCNA8SZOvNCkcB9htdfUVZg7af1xc6/j4iY54gb846OQG7ERq7xuV
 VQeWsGZC85qkeMg3jnDCiQlyzg3OAFCXcqhQe0/mpD1I9uMgqnnJqgCWp4GtD8tGbiUy
 sF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1SAi4Xd/ZXR54tvMv3FYZTkx7/klE43gbWDWEE/9jug=;
 b=iAdavjYaFTra7+Jo+bD2XMnPx0NCegeFkhG9kscvCyajEDNBwGMzehF5RcyLjZCblo
 iDcyySX/X3KFMt6+A6oHL+3Pka3jJngD8RF4d2ruBWfbIBEkM614hxe+/poDTH0R6xeq
 wEK6uLT/GTWwMgK2ELo+1uG2vjKWwXbfT1tB6vgvV6bcpmndGFUe+QTWQv9O3zvEy7r+
 JSU2UeN7NnjekOlG/PGRctyA3+hbEx1LTENg4i+yab4YQS5hIQCIzMPOIuJiWR4JwiE4
 wLzHO1LmVp+gOQdGUDy9cO0EkXOxIhTdb2/jG4kPD1Rw96TvP5xHQw0DdN8OlUuSB2TA
 X9sw==
X-Gm-Message-State: AOAM531AYCp3cvpHx5KkfOqkrKbkw/PI4dxGt4VyXlh/AaBwCwG/Hoyr
 BChhQvVaL0f0vh7P035NZZDy3IRL
X-Google-Smtp-Source: ABdhPJz7aY0OIYGnSn0RE0TUdN6jjEivF0cblK13/pJHpx0mL6FhhJihwbxT1/vZDTUXR7I0t2NRZQ==
X-Received: by 2002:a7b:c746:: with SMTP id w6mr4440375wmk.171.1594903843162; 
 Thu, 16 Jul 2020 05:50:43 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:efc1:eb01:18eb:bff2])
 by smtp.gmail.com with ESMTPSA id z25sm7669872wmk.28.2020.07.16.05.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 05:50:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/nouveau: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Date: Thu, 16 Jul 2020 14:50:34 +0200
Message-Id: <20200716125037.67437-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716125037.67437-1-christian.koenig@amd.com>
References: <20200716125037.67437-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBkb2Vzbid0IGV4cG9zZSBhbnkgbm90LW1hcGFibGUgbWVtb3J5IHJlc291cmNl
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgfCAxMyArKysr
Ky0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwppbmRleCA3ODgzMzQxZjhjODMuLjRj
Y2Y5MzdkZjBkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9i
by5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtNjU1LDEz
ICs2NTUsMTIgQEAgbm91dmVhdV9ib19pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LCB1aW50MzJfdCB0eXBlLAogCiAJc3dpdGNoICh0eXBlKSB7CiAJY2FzZSBUVE1fUExf
U1lTVEVNOgotCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKKwkJbWFu
LT5mbGFncyA9IDA7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNI
SU5HOwogCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKIAkJYnJl
YWs7CiAJY2FzZSBUVE1fUExfVlJBTToKLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdf
RklYRUQgfAotCQkJICAgICBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFOworCQltYW4tPmZsYWdz
ID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRDsKIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRU
TV9QTF9GTEFHX1VOQ0FDSEVEIHwKIAkJCQkJIFRUTV9QTF9GTEFHX1dDOwogCQltYW4tPmRlZmF1
bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX1dDOwpAQCAtNjkwLDEyICs2ODksMTIgQEAgbm91dmVh
dV9ib19pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0
eXBlLAogCQkJbWFuLT5mdW5jID0gJnR0bV9ib19tYW5hZ2VyX2Z1bmM7CiAKIAkJaWYgKGRybS0+
YWdwLmJyaWRnZSkgewotCQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7
CisJCQltYW4tPmZsYWdzID0gMDsKIAkJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExf
RkxBR19VTkNBQ0hFRCB8CiAJCQkJVFRNX1BMX0ZMQUdfV0M7CiAJCQltYW4tPmRlZmF1bHRfY2Fj
aGluZyA9IFRUTV9QTF9GTEFHX1dDOwogCQl9IGVsc2UgewotCQkJbWFuLT5mbGFncyA9IFRUTV9N
RU1UWVBFX0ZMQUdfTUFQUEFCTEU7CisJCQltYW4tPmZsYWdzID0gMDsKIAkJCW1hbi0+YXZhaWxh
YmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwogCQkJbWFuLT5kZWZhdWx0X2NhY2hp
bmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7CiAJCX0KQEAgLTE0MzcsNyArMTQzNiw2IEBAIG5vdXZl
YXVfYm9fdmVyaWZ5X2FjY2VzcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBzdHJ1Y3Qg
ZmlsZSAqZmlscCkKIHN0YXRpYyBpbnQKIG5vdXZlYXVfdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVj
dCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV9yZWcgKnJlZykKIHsKLQlzdHJ1
Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bcmVnLT5tZW1fdHlwZV07
CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2JkZXYoYmRldik7CiAJc3RydWN0
IG52a21fZGV2aWNlICpkZXZpY2UgPSBudnh4X2RldmljZSgmZHJtLT5jbGllbnQuZGV2aWNlKTsK
IAlzdHJ1Y3Qgbm91dmVhdV9tZW0gKm1lbSA9IG5vdXZlYXVfbWVtKHJlZyk7CkBAIC0xNDQ3LDgg
KzE0NDUsNyBAQCBub3V2ZWF1X3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwgc3RydWN0IHR0bV9tZW1fcmVnICpyZWcpCiAJcmVnLT5idXMuc2l6ZSA9IHJlZy0+
bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQ7CiAJcmVnLT5idXMuYmFzZSA9IDA7CiAJcmVnLT5idXMu
aXNfaW9tZW0gPSBmYWxzZTsKLQlpZiAoIShtYW4tPmZsYWdzICYgVFRNX01FTVRZUEVfRkxBR19N
QVBQQUJMRSkpCi0JCXJldHVybiAtRUlOVkFMOworCiAJc3dpdGNoIChyZWctPm1lbV90eXBlKSB7
CiAJY2FzZSBUVE1fUExfU1lTVEVNOgogCQkvKiBTeXN0ZW0gbWVtb3J5ICovCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
