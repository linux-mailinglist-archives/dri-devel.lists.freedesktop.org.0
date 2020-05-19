Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0AF1D97B3
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 15:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047AF6E342;
	Tue, 19 May 2020 13:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED6F89DB8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 13:28:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e1so15926989wrt.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 06:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hM5OXAptbKPP/8+yKuT4RVgcPXCSJuvxjvItOcy5Ch4=;
 b=JUB9zXMhx3IM69uNuCaGPLpgNhM5ZRwyVZ5kb0gbG6jKM48juOC5th7p4u10t6jVoO
 YfTIxKkevTaESlEO462+goKgJtOvUNl34FxAkta5T0Nsb9E9KujbymSahURdiNV6u8ls
 BacBPl5XG/yx7XZo7SlEHPm6RYXO2+gzLmayU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hM5OXAptbKPP/8+yKuT4RVgcPXCSJuvxjvItOcy5Ch4=;
 b=JDAVxeyEGCuZhZ4l1OT8kzYuO80OKrZAVL88NYhSebxnxN+ijoTl7mNxrXg9g254bb
 93V3+jbHj5DYeiv4i1kilPRcNoB/bewBT9gu6zjBvopcLbUmPnqrn03yAdEezaaH7l5P
 +LWk6jcUEMfw6NZjbjmk8WxJ+3XcJ2cYuB7arw2GLoAPOD6URqajXrAlvrMgZkUGNgyJ
 MGbIKuu7e0kRcSzK2yzKL/k24TgooxUFds/8pzA/20l9btTgFmSeNZlOU+zewMT3WdWT
 ZigaEEa1Xh3hRFVbYhtl7eV5g2RXBtf7XtBqfjqjvXplsHlm1F/9c/1VU7cnMBDK6vSZ
 amfg==
X-Gm-Message-State: AOAM532gulbm4KS3N2eONphLcYw7Fo5qTks4VGWrdI02Hz9+JZCCcldk
 FHWGZRQHC2R8NnarTUP1ifas4Hh4hWU=
X-Google-Smtp-Source: ABdhPJzSWGtPCk2INREnYHV0P2JSQYvdRopa+WJ/sS5YMlaRPcHSE74y7pbs0cpiCamKX4cFMl9Z/Q==
X-Received: by 2002:adf:8b98:: with SMTP id o24mr26575236wra.156.1589894883485; 
 Tue, 19 May 2020 06:28:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n9sm4092620wmj.5.2020.05.19.06.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 06:28:02 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] dma-fence: add might_sleep annotation to _wait()
Date: Tue, 19 May 2020 15:27:56 +0200
Message-Id: <20200519132756.682888-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
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
Cc: amd-gfx@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG8gaXQgdW5jb250aW9uYWxseSwgdGhlcmUncyBhIHNlcGFyYXRlIHBlZWsgZnVuY3Rpb24gd2l0
aApkbWFfZmVuY2VfaXNfc2lnbmFsbGVkKCkgd2hpY2ggY2FuIGJlIGNhbGxlZCBmcm9tIGF0b21p
YyBjb250ZXh0LgoKdjI6IENvbnNlbnN1cyBjYWxscyBmb3IgYW4gdW5jb25kaXRpb25hbCBtaWdo
dF9zbGVlcCAoQ2hyaXMsCkNocmlzdGlhbikKCkZ1bGwgYXVkaXQ6Ci0gZG1hLWZlbmNlLmg6IFVz
ZXMgTUFYX1NDSEVEVUxFX1RJTU9VVCwgZ29vZCBjaGFuY2UgdGhpcyBzbGVlcHMKLSBkbWEtcmVz
di5jOiBUaW1lb3V0IGFsd2F5cyBhdCBsZWFzdCAxCi0gc3QtZG1hLWZlbmNlLmM6IFNhdmUgdG8g
c2xlZXAgaW4gdGVzdGNhc2VzCi0gYW1kZ3B1X2NzLmM6IEJvdGggY2FsbGVycyBhcmUgZm9yIHZh
cmlhbnRzIG9mIHRoZSB3YWl0IGlvY3RsCi0gYW1kZ3B1X2RldmljZS5jOiBUd28gY2FsbGVycyBp
biB2cmFtIHJlY292ZXIgY29kZSwgYm90aCByaWdodCBuZXh0CiAgdG8gbXV0ZXhfbG9jay4KLSBh
bWRncHVfdm0uYzogVXNlIGluIHRoZSB2bV93YWl0IGlvY3RsLCBuZXh0IHRvIF9yZXNlcnZlL3Vu
cmVzZXJ2ZQotIHJlbWFpbmluZyBmdW5jdGlvbnMgaW4gYW1kZ3B1OiBBbGwgZm9yIHRlc3RfaWIg
aW1wbGVtZW50YXRpb25zIGZvcgogIHZhcmlvdXMgZW5naW5lcywgY2FsbGVyIGZvciB0aGF0IGxv
b2tzIGFsbCBzYWZlIChkZWJ1Z2ZzLCBkcml2ZXIKICBsb2FkLCByZXNldCkKLSBldG5hdml2OiBh
bm90aGVyIHdhaXQgaW9jdGwKLSBoYWJhbmFsYWJzOiBhbm90aGVyIHdhaXQgaW9jdGwKLSBub3V2
ZWF1X2ZlbmNlLmM6IGhhcmRjb2RlZCAxNSpIWiAuLi4gZ2xvcmlvdXMKLSBub3V2ZWF1X2dlbS5j
OiBoYXJkY29kZWQgMipIWiAuLi4gc28gbm90IGV2ZW4gc3VwZXIgY29uc2lzdGVudCwgYnV0CiAg
dGhpcyBvbmUgZG9lcyBoYXZlIGEgV0FSTl9PTiA6LS8gQXQgbGVhc3QgdGhpcyBvbmUgaXMgb25s
eSBhCiAgZmFsbGJhY2sgcGF0aCBmb3Igd2hlbiBrbWFsbG9jIGZhaWxzLiBNYXliZSB0aGlzIHNo
b3VsZCBiZSBwdXQgb250bwogIHNvbWUgd29ya2VyIGxpc3QgaW5zdGVhZCwgaW5zdGVhZCBvZiBh
IHdvcmsgcGVyIHVuYW1wIC4uLgotIGk5MTUvc2VsZnRlc3RzOiBIYXJkZWNvZGVkIEhaIC8gNCBv
ciBIWiAvIDgKLSBpOTE1L2d0L3NlbGZ0ZXN0czogR29pbmcgdXAgdGhlIGNhbGxjaGFpbiBsb29r
cyBzYWZlIGxvb2tpbmcgYXQKICBuZWFyYnkgY2FsbGVycwotIGk5MTUvZ3QvaW50ZWxfZ3RfcmVx
dWVzdHMuYy4gV3JhcHBlZCBpbiBhIG11dGV4X2xvY2sKLSBpOTE1L2dlbV9pOTE1X2dlbV93YWl0
LmM6IFRoZSBpOTE1LXZlcnNpb24gd2hpY2ggaXMgY2FsbGVkIGluc3RlYWQKICBmb3IgaTkxNSBm
ZW5jZXMgYWxyZWFkeSBoYXMgYSBtaWdodF9zbGVlcCgpIGFubm90YXRpb24sIHNvIGFsbCBnb29k
CgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogTHVjYXMg
U3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CkNjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAbGludXguaW50ZWwuY29tPgpDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5A
bGludXguaW50ZWwuY29tPgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29t
PgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogIlZNd2FyZSBHcmFwaGlj
cyIgPGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4KQ2M6IE9kZWQgR2FiYmF5
IDxvZGVkLmdhYmJheUBnbWFpbC5jb20+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcK
Q2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpDYzogbGludXgtcmRtYUB2Z2VyLmtl
cm5lbC5vcmcKQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMg
Yi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKaW5kZXggOTBlZGYyYjI4MWIwLi42NTZlOWFj
MmQwMjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYworKysgYi9kcml2
ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKQEAgLTIwOCw2ICsyMDgsOCBAQCBkbWFfZmVuY2Vfd2Fp
dF90aW1lb3V0KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlLCBib29sIGludHIsIHNpZ25lZCBsb25n
IHRpbWVvdXQpCiAJaWYgKFdBUk5fT04odGltZW91dCA8IDApKQogCQlyZXR1cm4gLUVJTlZBTDsK
IAorCW1pZ2h0X3NsZWVwKCk7CisKIAl0cmFjZV9kbWFfZmVuY2Vfd2FpdF9zdGFydChmZW5jZSk7
CiAJaWYgKGZlbmNlLT5vcHMtPndhaXQpCiAJCXJldCA9IGZlbmNlLT5vcHMtPndhaXQoZmVuY2Us
IGludHIsIHRpbWVvdXQpOwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
