Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C14E38C3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55A06E503;
	Thu, 24 Oct 2019 16:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B160F6E503
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c22so3283699wmd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xnrmAgjd57yL7bQcusoIEkE1OASAQ02Qykb8fz3n31M=;
 b=BYUQlftp3pMgA9oABhTtCe5VLC7S5/2G98S/qA59HmkJk+SyYYXBx6XJu/fruSf8HM
 kH9hvqcDRnGiHjt/VC689OvhG54kH6Ufy/tRTo6mnGU0CpZcyATRk1HOyp8FQr6tFdue
 QTp2LXgBzgW4KZJp0GXeJZ8m/nbv4lqeBQgxvt3BGOBEEsh1gVsKaVn7rKzNJbQ1p0sq
 V6Maz+k7LcUgA1XZODktoXJzAwIPKqM3rJF5cauQYhyB9vrQw+Xyn/s/vc4lqm4d6v+g
 ggbRKj+K3JpcdbBX2k2zGgDx6AOJZZxWbzq5/hVeWy/RkHrq1a0vNH4brH3iL5A9BvCk
 iICw==
X-Gm-Message-State: APjAAAVBkaDjz9SpRQBEv3oZSgG+O2sJqbRfBrZyMxWmbqaOGn6XNx67
 TJgOf+a64Hs1ijWuWV1DRM8=
X-Google-Smtp-Source: APXvYqxZAXDPe/3JAnophhlvR/u4XCDRfpFhlc7VbOFvIhyKwORNTsCUZIjGYdNT3RJd3uUhy+9foQ==
X-Received: by 2002:a1c:9d07:: with SMTP id g7mr5813102wme.53.1571935604846;
 Thu, 24 Oct 2019 09:46:44 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id d202sm2793119wmd.47.2019.10.24.09.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 30/32] drm/tegra: sor: Avoid timeouts on unplug events
Date: Thu, 24 Oct 2019 18:45:32 +0200
Message-Id: <20191024164534.132764-31-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xnrmAgjd57yL7bQcusoIEkE1OASAQ02Qykb8fz3n31M=;
 b=MZvBicSw9zipfnsTLsDJjAQ+KeqkoZ0fMDPFBlaj+HgXTCOnugmEXur/eBCIIsyCw4
 /ts6A+LhkwqzykJWglYVjSj5RdrSg8WHX4ubiqyi7sxQPuMLxHVQSx/PiNAs/15Epflp
 nBJkwpsjNeDFSXmsCScMgWHRM4VwPTk096pjfwn5dr55yLDwPJUio3oNDXy3DQ8Vqe7n
 RyegAq2wyWdH40gOFovFJlVPjxC+cOjHsa0TkUf6m8yVMUb+u2bYGmP9rap5bC1awJOY
 hJXf63FZVrHHE3L1WZbo2cgOSdi+sECp5G6OLOLmcsUArsCuS6RoDgdMEJ+cKq2j0kg2
 wozQ==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gdGhlIFNPUiBp
cyBkaXNhYmxlZCBpbiBEUCBtb2RlIGFzIHBhcnQgb2YgYW4gdW5wbHVnIGV2ZW50LCBkbyBub3QK
YXR0ZW1wdCB0byBwb3dlciB0aGUgRFAgbGluayBkb3duLiBQb3dlcmluZyBkb3duIHRoZSBsaW5r
IHJlcXVpcmVzIHRoZQpEUEFVWCB0byB0cmFuc21pdCBBVVggbWVzc2FnZXMgd2hpY2ggb25seSB3
b3JrcyBpZiB0aGVyZSdzIGEgY29ubmVjdGVkCnNpbmsuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5
IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9z
b3IuYyB8IDEzICsrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwppbmRleCA2MzgzMWMzN2FkMzUuLmI4MWU2
ZDM5YWEzMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwpAQCAtMjY2Myw5ICsyNjYzLDE2IEBAIHN0YXRpYyB2
b2lkIHRlZ3JhX3Nvcl9kcF9kaXNhYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIAlp
ZiAob3V0cHV0LT5wYW5lbCkKIAkJZHJtX3BhbmVsX2Rpc2FibGUob3V0cHV0LT5wYW5lbCk7CiAK
LQllcnIgPSBkcm1fZHBfbGlua19wb3dlcl9kb3duKHNvci0+YXV4LCAmc29yLT5saW5rKTsKLQlp
ZiAoZXJyIDwgMCkKLQkJZGV2X2Vycihzb3ItPmRldiwgImZhaWxlZCB0byBwb3dlciBkb3duIGxp
bms6ICVkXG4iLCBlcnIpOworCS8qCisJICogRG8gbm90IGF0dGVtcHQgdG8gcG93ZXIgZG93biBh
IERQIGxpbmsgaWYgd2UncmUgbm90IGNvbm5lY3RlZCBzaW5jZQorCSAqIHRoZSBBVVggdHJhbnNh
Y3Rpb25zIHdvdWxkIGp1c3QgYmUgdGltaW5nIG91dC4KKwkgKi8KKwlpZiAob3V0cHV0LT5jb25u
ZWN0b3Iuc3RhdHVzICE9IGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkKSB7CisJCWVyciA9
IGRybV9kcF9saW5rX3Bvd2VyX2Rvd24oc29yLT5hdXgsICZzb3ItPmxpbmspOworCQlpZiAoZXJy
IDwgMCkKKwkJCWRldl9lcnIoc29yLT5kZXYsICJmYWlsZWQgdG8gcG93ZXIgZG93biBsaW5rOiAl
ZFxuIiwKKwkJCQllcnIpOworCX0KIAogCWVyciA9IHRlZ3JhX3Nvcl9kZXRhY2goc29yKTsKIAlp
ZiAoZXJyIDwgMCkKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
