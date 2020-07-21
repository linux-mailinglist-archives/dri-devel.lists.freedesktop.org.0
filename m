Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE2A227988
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 09:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834C66E4AB;
	Tue, 21 Jul 2020 07:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F3D6E4A1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:32:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r12so20036131wrj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1SAi4Xd/ZXR54tvMv3FYZTkx7/klE43gbWDWEE/9jug=;
 b=kzrPlrNsb8v+wdix/GJwWCarZWy8s9hh2IW1W3rKNisQFiZE4/MVeUhoOuukbmqb4+
 TZRMD0sVTJKUnobkApxH96u1868TiKWT2SZvpf91O0opbaVzlFuItvQSPV+Gmf7m2KXG
 7AG3EUn8aX8u8vhvTk9inLLgnhaS2Cf2ZAUUUMTLvQFGtw/Pt/t/xtqPpShTz0kEW6HE
 PckTAj+AuM6KlCS2YCfzC8/5PSPCpPva21l/AG2xhXEN4d89LR/DwGs4fCmuEKWbslaP
 oHGaf6uszSr+FQCWu2yxSsmwLEPFtAXhTHO3qIExYsOnXdlptwd1/a01p8ffXVzmcnZ9
 BxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1SAi4Xd/ZXR54tvMv3FYZTkx7/klE43gbWDWEE/9jug=;
 b=ZByTv82m2f9rxFL7TMM6yzXv9ed2dmPhPnQ6AmuMShREiH7gLPQrThp4jpofmxXzXC
 ++16SqHCK5EKQ7s/P40Vb7ucDjv0hg7iHPFGTv9WxZGeVfTGqbHlASsU2365kw2cfyLX
 dDE/TWJoxjCzkfP+mHL5O9Yk9Pv1PUtEHGVVo+AQb8sXU6YwsdEEG7MG1oAeHoijd9rQ
 2aplNS4srICQ0QIz9SrSJ7UA1xcrbSg16YxZOeZBBbzKkMAVuvAe47oBvQWB4M7c5LRJ
 UJoeDCfL65scBvfxZBy0D4eTblhr3lHHdfQ8K95d0fctpVJOee7FYv6MVNfJdGgQX3C6
 ZomQ==
X-Gm-Message-State: AOAM533MmyN/h8Zq7GyxJIB1Ac3eq/DEVagE6/w7bBRguM2EYaukKPtj
 7uu3JClPYNGX6CWCZ1s42oU66qWS
X-Google-Smtp-Source: ABdhPJzuPR92didZE30cK57qCScTV6ImvpNoFPoBQOQvRjloHgvwAaoNjAdZxbVaDdZNQsX8OZfTWA==
X-Received: by 2002:adf:c386:: with SMTP id p6mr13010413wrf.344.1595316775222; 
 Tue, 21 Jul 2020 00:32:55 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5eb1:eb29:dadc:7fc5])
 by smtp.gmail.com with ESMTPSA id s4sm29740896wre.53.2020.07.21.00.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 00:32:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/11] drm/nouveau: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Date: Tue, 21 Jul 2020 09:32:43 +0200
Message-Id: <20200721073245.2484-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721073245.2484-1-christian.koenig@amd.com>
References: <20200721073245.2484-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de
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
