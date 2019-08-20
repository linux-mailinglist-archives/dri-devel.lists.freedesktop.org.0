Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3FC96314
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 16:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932AD6E409;
	Tue, 20 Aug 2019 14:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D09C6E402
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 14:53:50 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id x19so6631458eda.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 07:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QMpaIQoW43kGlPxGgVecn0r7XjR1n8nJ+GRx3IgNsdM=;
 b=ZvEcX0ZkZE0H2TPPN4LI5Lt8Krf3BLwsXy5Frd78/BFfgazPAgmePjox3TJIXw9daH
 uHfvhvxdGjjjzbJ54T1mEm/kt7PhBYLjUFZ309qQ5Md6HB4lVME1k9K7wbJl5u5zXPRv
 Cdr81zrBrBgO23/xuewa3r+5khp90rpkBTUnyrVpI8EvZuy2mQlBGyh/BpwFNApDL7+m
 r52fptDCNznEpmalFTZ+bYKWyWzK0LzYpcG7qC/KmqodJENJ3lVS3ycXBTyUxcXhW7N3
 e031NUM0b54zysmzNNi1hxlz6Usec8lWKXEt4p5iQ9+4Jx2lnFn/py01bMtFmYqdJt9/
 8T/g==
X-Gm-Message-State: APjAAAXk0XULoHYYGqiVaZW2WW07iOkRKVO0tTjtY0MXYRulC47FgB/f
 Z/DdnFPiwvp9LQ1D/pp9+48EOS1EYzbg7Q==
X-Google-Smtp-Source: APXvYqyNmupWTg/xatV13K9DulOMvHvrZ+fagFA5JxNB6DiDBuWV0vZMKRxVFxb+WI3GrXFSug84iw==
X-Received: by 2002:a50:a5f3:: with SMTP id b48mr31581942edc.77.1566312828795; 
 Tue, 20 Aug 2019 07:53:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a16sm2644744ejr.10.2019.08.20.07.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 07:53:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] dma_resv: prime lockdep annotations
Date: Tue, 20 Aug 2019 16:53:34 +0200
Message-Id: <20190820145336.15649-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QMpaIQoW43kGlPxGgVecn0r7XjR1n8nJ+GRx3IgNsdM=;
 b=BchFkS4vk6cTyqdCWVOWGNVH0gnJKJLridBiXfaTbJoHxYBeoVOyOdb8L0JPaQpNMi
 2zYWOL960d1tcASiuniPrl4KE9t6+eTZxiBYNl3o7goi0ylUQm5fNHKGC2nThKKX4LBg
 iS7fI1eKKlnB+KZoWtsS6EKLL1mK+xGrrKBGg=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnVsbCBhdWRpdCBvZiBldmVyeW9uZToKCi0gaTkxNSwgcmFkZW9uLCBhbWRncHUgc2hvdWxkIGJl
IGNsZWFuIHBlciB0aGVpciBtYWludGFpbmVycy4KCi0gdnJhbSBoZWxwZXJzIHNob3VsZCBiZSBm
aW5lLCB0aGV5IGRvbid0IGRvIGNvbW1hbmQgc3VibWlzc2lvbiwgc28KICByZWFsbHkgbm8gYnVz
aW5lc3MgaG9sZGluZyBzdHJ1Y3RfbXV0ZXggd2hpbGUgZG9pbmcgY29weV8qX3VzZXIuIEJ1dAog
IEkgaGF2ZW4ndCBjaGVja2VkIHRoZW0gYWxsLgoKLSBwYW5mcm9zdCBzZWVtcyB0byBkbWFfcmVz
dl9sb2NrIG9ubHkgaW4gcGFuZnJvc3Rfam9iX3B1c2gsIHdoaWNoCiAgbG9va3MgY2xlYW4uCgot
IHYzZCBob2xkcyBkbWFfcmVzdiBsb2NrcyBpbiB0aGUgdGFpbCBvZiBpdHMgdjNkX3N1Ym1pdF9j
bF9pb2N0bCgpLAogIGNvcHlpbmcgZnJvbS90byB1c2Vyc3BhY2UgaGFwcGVucyBhbGwgaW4gdjNk
X2xvb2t1cF9ib3Mgd2hpY2ggaXMKICBvdXRzaWRlIG9mIHRoZSBjcml0aWNhbCBzZWN0aW9uLgoK
LSB2bXdnZnggaGFzIGEgYnVuY2ggb2YgaW9jdGxzIHRoYXQgZG8gdGhlaXIgb3duIGNvcHlfKl91
c2VyOgogIC0gdm13X2V4ZWNidWZfcHJvY2VzczogRmlyc3QgdGhpcyBkb2VzIHNvbWUgY29waWVz
IGluCiAgICB2bXdfZXhlY2J1Zl9jbWRidWYoKSBhbmQgYWxzbyBpbiB0aGUgdm13X2V4ZWNidWZf
cHJvY2VzcygpIGl0c2VsZi4KICAgIFRoZW4gY29tZXMgdGhlIHVzdWFsIHR0bSByZXNlcnZlL3Zh
bGlkYXRlIHNlcXVlbmNlLCB0aGVuIGFjdHVhbAogICAgc3VibWlzc2lvbi9mZW5jaW5nLCB0aGVu
IHVucmVzZXJ2aW5nLCBhbmQgZmluYWxseSBzb21lIG1vcmUKICAgIGNvcHlfdG9fdXNlciBpbiB2
bXdfZXhlY2J1Zl9jb3B5X2ZlbmNlX3VzZXIuIEdsb3NzaW5nIG92ZXIgdG9ucyBvZgogICAgZGV0
YWlscywgYnV0IGxvb2tzIGFsbCBzYWZlLgogIC0gdm13X2ZlbmNlX2V2ZW50X2lvY3RsOiBObyB0
dG1fcmVzZXJ2ZS9kbWFfcmVzdl9sb2NrIGFueXdoZXJlIHRvIGJlCiAgICBzZWVuLCBzZWVtcyB0
byBvbmx5IGNyZWF0ZSBhIGZlbmNlIGFuZCBjb3B5IGl0IG91dC4KICAtIGEgcGlsZSBvZiBzbWFs
bGVyIGlvY3RsIGluIHZtd2dmeF9pb2N0bC5jLCBubyByZXNlcnZhdGlvbnMgdG8gYmUKICAgIGZv
dW5kIHRoZXJlLgogIFN1bW1hcnk6IHZtd2dmeCBzZWVtcyB0byBiZSBmaW5lIHRvby4KCi0gdmly
dGlvOiBUaGVyZSdzIHZpcnRpb19ncHVfZXhlY2J1ZmZlcl9pb2N0bCwgd2hpY2ggZG9lcyBhbGwg
dGhlCiAgY29weWluZyBmcm9tIHVzZXJzcGFjZSBiZWZvcmUgZXZlbiBsb29raW5nIHVwIG9iamVj
dHMgdGhyb3VnaCB0aGVpcgogIGhhbmRsZXMsIHNvIHNhZmUuIFBsdXMgdGhlIGdldHBhcmFtL2dl
dGNhcHMgaW9jdGwsIGFsc28gYm90aCBzYWZlLgoKLSBxeGwgb25seSBoYXMgcXhsX2V4ZWNidWZm
ZXJfaW9jdGwsIHdoaWNoIGNhbGxzIGludG8KICBxeGxfcHJvY2Vzc19zaW5nbGVfY29tbWFuZC4g
VGhlcmUncyBhIGxvdmVseSBjb21tZW50IGJlZm9yZSB0aGUKICBfX2NvcHlfZnJvbV91c2VyX2lu
YXRvbWljIHRoYXQgdGhlIHNsb3dwYXRoIHNob3VsZCBiZSBjb3BpZWQgZnJvbQogIGk5MTUsIGJ1
dCBJIGd1ZXNzIHRoYXQgbmV2ZXIgaGFwcGVuZWQuIFRyeSBub3QgdG8gYmUgdW5sdWNreSBhbmQg
Z2V0CiAgeW91ciBDUyBkYXRhIGV2aWN0ZWQgYmV0d2VlbiB3aGVuIGl0J3Mgd3JpdHRlbiBhbmQg
dGhlIGtlcm5lbCB0cmllcwogIHRvIHJlYWQgaXQuIFRoZSBvbmx5IG90aGVyIGNvcHlfZnJvbV91
c2VyIGlzIGZvciByZWxvY3MsIGJ1dCB0aG9zZQogIGFyZSBkb25lIGJlZm9yZSBxeGxfcmVsZWFz
ZV9yZXNlcnZlX2xpc3QoKSwgd2hpY2ggc2VlbXMgdG8gYmUgdGhlCiAgb25seSB0aGluZyByZXNl
cnZpbmcgYnVmZmVycyAoaW4gdGhlIHR0bS9kbWFfcmVzdiBzZW5zZSkgaW4gdGhhdAogIGNvZGUu
IFNvIGxvb2tzIHNhZmUuCgotIEEgZGVidWdmcyBmaWxlIGluIG5vdXZlYXVfZGVidWdmc19wc3Rh
dGVfc2V0KCkgYW5kIHRoZSB1c2lmIGlvY3RsIGluCiAgdXNpZl9pb2N0bCgpIGxvb2sgc2FmZS4g
bm91dmVhdV9nZW1faW9jdGxfcHVzaGJ1ZigpIG90b2ggYnJlYWtzIHRoaXMKICBldmVyeXdoZXJl
IGFuZCBuZWVkcyB0byBiZSBmaXhlZCB1cC4KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5j
b20+CkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogRGF2ZSBBaXJsaWUgPGFp
cmxpZWRAcmVkaGF0LmNvbT4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpD
YzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogIlZNd2FyZSBHcmFwaGljcyIg
PGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ry
b20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMg
fCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1h
LXJlc3YuYwppbmRleCA0MmE4ZjNmMTE2ODEuLjNlZGNhMTBkM2ZhZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMK
QEAgLTM0LDYgKzM0LDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4L2RtYS1yZXN2Lmg+CiAjaW5jbHVk
ZSA8bGludXgvZXhwb3J0Lmg+CisjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4KIAogLyoqCiAg
KiBET0M6IFJlc2VydmF0aW9uIE9iamVjdCBPdmVydmlldwpAQCAtMTA3LDYgKzEwOCwxNyBAQCB2
b2lkIGRtYV9yZXN2X2luaXQoc3RydWN0IGRtYV9yZXN2ICpvYmopCiAJCQkmcmVzZXJ2YXRpb25f
c2VxY291bnRfY2xhc3MpOwogCVJDVV9JTklUX1BPSU5URVIob2JqLT5mZW5jZSwgTlVMTCk7CiAJ
UkNVX0lOSVRfUE9JTlRFUihvYmotPmZlbmNlX2V4Y2wsIE5VTEwpOworCisJaWYgKElTX0VOQUJM
RUQoQ09ORklHX0xPQ0tERVApKSB7CisJCWlmIChjdXJyZW50LT5tbSkKKwkJCWRvd25fcmVhZCgm
Y3VycmVudC0+bW0tPm1tYXBfc2VtKTsKKwkJd3dfbXV0ZXhfbG9jaygmb2JqLT5sb2NrLCBOVUxM
KTsKKwkJZnNfcmVjbGFpbV9hY3F1aXJlKEdGUF9LRVJORUwpOworCQlmc19yZWNsYWltX3JlbGVh
c2UoR0ZQX0tFUk5FTCk7CisJCXd3X211dGV4X3VubG9jaygmb2JqLT5sb2NrKTsKKwkJaWYgKGN1
cnJlbnQtPm1tKQorCQkJdXBfcmVhZCgmY3VycmVudC0+bW0tPm1tYXBfc2VtKTsKKwl9CiB9CiBF
WFBPUlRfU1lNQk9MKGRtYV9yZXN2X2luaXQpOwogCi0tIAoyLjIzLjAucmMxCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
