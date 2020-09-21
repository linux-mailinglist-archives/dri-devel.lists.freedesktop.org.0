Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E462728FA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 16:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B044A6E46C;
	Mon, 21 Sep 2020 14:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3D06E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 14:49:05 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k18so13023500wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 07:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v+cROOhuZaDFRVA6j8/5w93Y3+CkZHk7GMcxWGhE4s0=;
 b=kfySjzn22kr1PjhbnFOVgkA6eb+o5TBAWiIKqNsE09Tn2IYvmFqHcDk9+fqDTZwJG8
 zfjhHOH77/GcCzXa0ehnL9sf7Tv0Zol5zO4xaTfxir38R+841pRkBPjZm5YuE/PWOHXa
 t7BGKPGJNk51JvPGfuS3A7vhqoAWktX999UMmP1VU049AZ61iNZp1Nc1lHmJPz+gHHqC
 mrRsDWBNtelQwIY0ViNmQPb0TRai7LhCTNothf90x+vlK+OiVmoVlb/cXlJ7cmqWTLW8
 lnQMqSgeoVYfarLO2mcaHXaFF/6gDanlrOp4j/C3f1peMK6vkv3+y7KBnOtvxVCogeRj
 c9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v+cROOhuZaDFRVA6j8/5w93Y3+CkZHk7GMcxWGhE4s0=;
 b=RyOaBnSHsNW5jxlyy1RYoxrrIKcCONGZojKiT3YsZjfqsIfrDtt2QJZBtHike/MsP5
 rmKys3QiMlDw3FFmrNfjBKaYHe6qYzJoWuLwi1uL/ahmjxHYNpQ8+5F8vzeKXzHFVRCo
 GUeJkx+7f4iJVqYddSyiPwo55fsBGj7xJnH2ytXuclEtkk4w8kFiXkDocUlaGVw74kz8
 cTJHjy/UnspzN1FrGgHdkJuZUx9dNgDebX5r0w+hUUWoEXmvJyvB6UXmxqs1tMhlXx2G
 rXpLax9AMJDk9EbUz4Zo/NsJIgjiFaLrLoWDm0I6UxwIJCRwpc+D4Buo7GFdGpiefHhh
 AJWg==
X-Gm-Message-State: AOAM5336GDt7MyQ0KPjEsuSq2rj70J5EnG9OjxLRwozD/h4QsrvBIQSI
 JMavk1ReR2ugkMOcD/eny4CLnuYKve4=
X-Google-Smtp-Source: ABdhPJxnpRnVBhaGaswqTpBYFIBqzS8bQW9g8UEtgdVItWdwAetexWOc4lfd7HYUdb7JxZ2E+7jJJw==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr43397wmj.80.1600699744305;
 Mon, 21 Sep 2020 07:49:04 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3482:3104:ab8c:3ac2])
 by smtp.gmail.com with ESMTPSA id i6sm23480992wra.1.2020.09.21.07.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 07:49:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, airlied@gmail.com, tzimmermann@suse.de,
 bskeggs@redhat.com, kraxel@redhat.com, airlied@redhat.com,
 sroland@vmware.com
Subject: [PATCH 06/11] drm/vram-helper: switch over to the new pin interface
Date: Mon, 21 Sep 2020 16:48:51 +0200
Message-Id: <20200921144856.2797-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921144856.2797-1-christian.koenig@amd.com>
References: <20200921144856.2797-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RvcCB1c2luZyBUVE1fUExfRkxBR19OT19FVklDVC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMzcgKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiBp
bmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgIHwgIDMgLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmMKaW5kZXggNTBjYWQwZTRhOTJlLi5iZDNkZDE3YWQ4MWQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwpAQCAtMzAxLDcgKzMwMSw3IEBAIHN0YXRp
YyB1NjQgZHJtX2dlbV92cmFtX3BnX29mZnNldChzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAq
Z2JvKQogICovCiBzNjQgZHJtX2dlbV92cmFtX29mZnNldChzdHJ1Y3QgZHJtX2dlbV92cmFtX29i
amVjdCAqZ2JvKQogewotCWlmIChXQVJOX09OX09OQ0UoIWdiby0+cGluX2NvdW50KSkKKwlpZiAo
V0FSTl9PTl9PTkNFKCFnYm8tPmJvLnBpbl9jb3VudCkpCiAJCXJldHVybiAoczY0KS1FTk9ERVY7
CiAJcmV0dXJuIGRybV9nZW1fdnJhbV9wZ19vZmZzZXQoZ2JvKSA8PCBQQUdFX1NISUZUOwogfQpA
QCAtMzEwLDI0ICszMTAsMjEgQEAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fb2Zmc2V0KTsK
IHN0YXRpYyBpbnQgZHJtX2dlbV92cmFtX3Bpbl9sb2NrZWQoc3RydWN0IGRybV9nZW1fdnJhbV9v
YmplY3QgKmdibywKIAkJCQkgICB1bnNpZ25lZCBsb25nIHBsX2ZsYWcpCiB7Ci0JaW50IGksIHJl
dDsKIAlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggY3R4ID0geyBmYWxzZSwgZmFsc2UgfTsKKwlp
bnQgcmV0OwogCi0JaWYgKGdiby0+cGluX2NvdW50KQorCWlmIChnYm8tPmJvLnBpbl9jb3VudCkK
IAkJZ290byBvdXQ7CiAKIAlpZiAocGxfZmxhZykKIAkJZHJtX2dlbV92cmFtX3BsYWNlbWVudChn
Ym8sIHBsX2ZsYWcpOwogCi0JZm9yIChpID0gMDsgaSA8IGdiby0+cGxhY2VtZW50Lm51bV9wbGFj
ZW1lbnQ7ICsraSkKLQkJZ2JvLT5wbGFjZW1lbnRzW2ldLmZsYWdzIHw9IFRUTV9QTF9GTEFHX05P
X0VWSUNUOwotCiAJcmV0ID0gdHRtX2JvX3ZhbGlkYXRlKCZnYm8tPmJvLCAmZ2JvLT5wbGFjZW1l
bnQsICZjdHgpOwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCiBvdXQ6Ci0JKytnYm8t
PnBpbl9jb3VudDsKKwl0dG1fYm9fcGluKCZnYm8tPmJvKTsKIAogCXJldHVybiAwOwogfQpAQCAt
MzY5LDI2ICszNjYsOSBAQCBpbnQgZHJtX2dlbV92cmFtX3BpbihzdHJ1Y3QgZHJtX2dlbV92cmFt
X29iamVjdCAqZ2JvLCB1bnNpZ25lZCBsb25nIHBsX2ZsYWcpCiB9CiBFWFBPUlRfU1lNQk9MKGRy
bV9nZW1fdnJhbV9waW4pOwogCi1zdGF0aWMgaW50IGRybV9nZW1fdnJhbV91bnBpbl9sb2NrZWQo
c3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibykKK3N0YXRpYyB2b2lkIGRybV9nZW1fdnJh
bV91bnBpbl9sb2NrZWQoc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibykKIHsKLQlpbnQg
aSwgcmV0OwotCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7IGZhbHNlLCBmYWxzZSB9
OwotCi0JaWYgKFdBUk5fT05fT05DRSghZ2JvLT5waW5fY291bnQpKQotCQlyZXR1cm4gMDsKLQot
CS0tZ2JvLT5waW5fY291bnQ7Ci0JaWYgKGdiby0+cGluX2NvdW50KQotCQlyZXR1cm4gMDsKLQot
CWZvciAoaSA9IDA7IGkgPCBnYm8tPnBsYWNlbWVudC5udW1fcGxhY2VtZW50IDsgKytpKQotCQln
Ym8tPnBsYWNlbWVudHNbaV0uZmxhZ3MgJj0gflRUTV9QTF9GTEFHX05PX0VWSUNUOwotCi0JcmV0
ID0gdHRtX2JvX3ZhbGlkYXRlKCZnYm8tPmJvLCAmZ2JvLT5wbGFjZW1lbnQsICZjdHgpOwotCWlm
IChyZXQgPCAwKQotCQlyZXR1cm4gcmV0OwotCi0JcmV0dXJuIDA7CisJdHRtX2JvX3VucGluKCZn
Ym8tPmJvKTsKIH0KIAogLyoqCkBAIC00MDYsMTAgKzM4NiwxMSBAQCBpbnQgZHJtX2dlbV92cmFt
X3VucGluKHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8pCiAJcmV0ID0gdHRtX2JvX3Jl
c2VydmUoJmdiby0+Ym8sIHRydWUsIGZhbHNlLCBOVUxMKTsKIAlpZiAocmV0KQogCQlyZXR1cm4g
cmV0OwotCXJldCA9IGRybV9nZW1fdnJhbV91bnBpbl9sb2NrZWQoZ2JvKTsKKworCWRybV9nZW1f
dnJhbV91bnBpbl9sb2NrZWQoZ2JvKTsKIAl0dG1fYm9fdW5yZXNlcnZlKCZnYm8tPmJvKTsKIAot
CXJldHVybiByZXQ7CisJcmV0dXJuIDA7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9nZW1fdnJhbV91
bnBpbik7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCBi
L2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaAppbmRleCA2MmNjNmU2YzNhNGYuLjEy
OGY4ODE3NGQzMiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5o
CisrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaApAQCAtMzUsNyArMzUsNiBA
QCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Q7CiAgKiBAcGxhY2VtZW50OglUVE0gcGxhY2VtZW50IGlu
Zm9ybWF0aW9uLiBTdXBwb3J0ZWQgcGxhY2VtZW50cyBhcmUgXAogCSVUVE1fUExfVlJBTSBhbmQg
JVRUTV9QTF9TWVNURU0KICAqIEBwbGFjZW1lbnRzOglUVE0gcGxhY2VtZW50IGluZm9ybWF0aW9u
LgotICogQHBpbl9jb3VudDoJUGluIGNvdW50ZXIKICAqCiAgKiBUaGUgdHlwZSBzdHJ1Y3QgZHJt
X2dlbV92cmFtX29iamVjdCByZXByZXNlbnRzIGEgR0VNIG9iamVjdCB0aGF0IGlzCiAgKiBiYWNr
ZWQgYnkgVlJBTS4gSXQgY2FuIGJlIHVzZWQgZm9yIHNpbXBsZSBmcmFtZWJ1ZmZlciBkZXZpY2Vz
IHdpdGgKQEAgLTY0LDggKzYzLDYgQEAgc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgewogCS8q
IFN1cHBvcnRlZCBwbGFjZW1lbnRzIGFyZSAlVFRNX1BMX1ZSQU0gYW5kICVUVE1fUExfU1lTVEVN
ICovCiAJc3RydWN0IHR0bV9wbGFjZW1lbnQgcGxhY2VtZW50OwogCXN0cnVjdCB0dG1fcGxhY2Ug
cGxhY2VtZW50c1syXTsKLQotCWludCBwaW5fY291bnQ7CiB9OwogCiAvKioKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
