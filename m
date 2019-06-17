Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F0E4911E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5226E0A1;
	Mon, 17 Jun 2019 20:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D674F6E0A5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:13:45 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id p15so12424884qtl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fDopIqI87NuKfsetWNyXbj/fkfbEd9K2X1YOScDx9RI=;
 b=YMPG71i7+zCysb7Y9G0+pI5Xe2eGU4wfWyfX8wqFqvbJ62xVJFWhhbkPgId/hdcbCA
 44K4cUo2MX+eDKZyq3tJyx5IQlrRuiviLWGSOI5Lc6UCQfAt+ydnuEF+QOw/TAyzc9O8
 dLZS1NbUcxD59JH8J+IdfgC3b7LcshwsRKy7UIpfm9w9mqWY8Ms9D7cmFUi4UrBLlFgm
 fXU8yp2d9V1/cmNHDa+PQmpQUZJIIUJKwaUnQvoy4ixMS2Pru74JAGJrX6NjOhiGwiuD
 4DHFd/K6+EVLxw6o7whRWRMSlp6oLwF2X2lOwuuxUVdV2krDVnywRzprjRyImYsxfnfY
 iCrQ==
X-Gm-Message-State: APjAAAUzYbukVWcXhi0F5jPEacc5V0Kwu33wT2jdyWmaqkwo8OGnO1K/
 GDQ7R5+8eH1fS6qu/JYQJR0eR7kB41A=
X-Google-Smtp-Source: APXvYqy1jTG2HR3hZvPT0PMKE5ePTuohZtRekInTF8heouwOGhe6MshqztZzlb/5YEpiIIyEVpP2KQ==
X-Received: by 2002:a0c:ee29:: with SMTP id l9mr23210987qvs.43.1560802424979; 
 Mon, 17 Jun 2019 13:13:44 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:13:44 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 12/13] drm/msm/dsi: Move dsi panel init into modeset init path
Date: Mon, 17 Jun 2019 16:12:57 -0400
Message-Id: <20190617201301.133275-9-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fDopIqI87NuKfsetWNyXbj/fkfbEd9K2X1YOScDx9RI=;
 b=JPWAGxKksuKYU8RDsDDM4EUum72rinZkJzX8ksj/hS6MtLwM93Dq9MD1dhV/pZ690v
 wcT8tW5WKLwDCa+GcSlLgFLAC8bVOP/SDUNsvLrWknjSOR8RGqd/iDOfm3t4MN4DXpw3
 uS0qZBhoZ88UUCd1IabRJ8KzNcTjWgybF3IQZtG8DYJl1WxRXqXZVP0kWmms7s5vt85n
 sUiXOXJK5pl5Rq67Pgzc1ScZXrpKcr72YEbvMfBvC7HunKOJHpcQTnji9kRG31UGktqC
 gNiXOpfwmBps9Fukc03SvQRw7GpYeArH1RExjUUCjSUuNOHlIc5HZX4zzGf47o9Iw49X
 edtw==
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpTaW5jZSBkZWZlcnJlZCBw
cm9iZSBmcm9tIHRoZSBtb2Rlc2V0IGluaXQgcGF0aCBub3cgd29ya3MsIHdlIGNhbiBtb3ZlCnRo
ZSBwYW5lbCBpbml0aWFsaXphdGlvbiBmcm9tIGRldGVjdCgpIGludG8gY29ubmVjdG9yIGluaXQu
IFRoaXMKYXZvaWRzIGRvaW5nIHdvcmsgaW4gZGV0ZWN0KCkgYW5kIGhvcGVmdWxseSB3aWxsIHJl
c3VsdCBpbiBhIG1vcmUKZGV0ZXJtaW5pc3RpYyBib290IHNlcXVlbmNlIGJldHdlZW4gZGV2aWNl
cyB3aXRoIGEgZHNpIHBhbmVsLCBhbmQgdGhvc2UKd2l0aCBhbiBleHRlcm5hbCBicmlkZ2UuCgpT
aWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jIHwgMTcgKysrKysrKysrKy0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jCmluZGV4IDYwMjk1M2I5MGNhYi4uNWRiNDNjN2Zm
YWZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9tYW5hZ2VyLmMKQEAgLTMxMiwxMyArMzEy
LDYgQEAgc3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgZHNpX21ncl9jb25uZWN0b3Jf
ZGV0ZWN0KAogCWludCBpZCA9IGRzaV9tZ3JfY29ubmVjdG9yX2dldF9pZChjb25uZWN0b3IpOwog
CXN0cnVjdCBtc21fZHNpICptc21fZHNpID0gZHNpX21ncl9nZXRfZHNpKGlkKTsKIAotCURCRygi
aWQ9JWQiLCBpZCk7Ci0JaWYgKCFtc21fZHNpLT5wYW5lbCkgewotCQlpbnQgcmV0ID0gbXNtX2Rz
aV9tYW5hZ2VyX3BhbmVsX2luaXQoY29ubmVjdG9yLCBpZCk7Ci0JCWlmIChyZXQpCi0JCQlyZXR1
cm4gY29ubmVjdG9yX3N0YXR1c19kaXNjb25uZWN0ZWQ7Ci0JfQotCiAJcmV0dXJuIG1zbV9kc2kt
PnBhbmVsID8gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQgOgogCQljb25uZWN0b3Jfc3RhdHVz
X2Rpc2Nvbm5lY3RlZDsKIH0KQEAgLTYzMSw3ICs2MjQsMTcgQEAgc3RydWN0IGRybV9jb25uZWN0
b3IgKm1zbV9kc2lfbWFuYWdlcl9jb25uZWN0b3JfaW5pdCh1OCBpZCkKIAogCWRybV9jb25uZWN0
b3JfYXR0YWNoX2VuY29kZXIoY29ubmVjdG9yLCBtc21fZHNpLT5lbmNvZGVyKTsKIAorCXJldCA9
IG1zbV9kc2lfbWFuYWdlcl9wYW5lbF9pbml0KGNvbm5lY3RvciwgaWQpOworCWlmIChyZXQpIHsK
KwkJRFJNX0RFVl9FUlJPUihtc21fZHNpLT5kZXYtPmRldiwgImluaXQgcGFuZWwgZmFpbGVkICVk
XG4iLCByZXQpOworCQlnb3RvIGZhaWw7CisJfQorCiAJcmV0dXJuIGNvbm5lY3RvcjsKKworZmFp
bDoKKwljb25uZWN0b3ItPmZ1bmNzLT5kZXN0cm95KG1zbV9kc2ktPmNvbm5lY3Rvcik7CisJcmV0
dXJuIEVSUl9QVFIocmV0KTsKIH0KIAogYm9vbCBtc21fZHNpX21hbmFnZXJfdmFsaWRhdGVfY3Vy
cmVudF9jb25maWcodTggaWQpCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29n
bGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
