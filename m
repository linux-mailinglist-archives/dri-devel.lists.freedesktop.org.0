Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0597D213A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BDA6EAA4;
	Thu, 10 Oct 2019 06:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806D26E994;
 Wed,  9 Oct 2019 21:34:59 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id i32so2244152pgl.10;
 Wed, 09 Oct 2019 14:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=93XeND10daxMH10mUwFpx+iBqyMkuxVptnzWDGZ5rAE=;
 b=SBUQik1ftxZa84Wxsi5lqclOhNVQNoOhxDdxvM+42h0LtcorxSlg5Hvwp1nAhfbiBr
 Q6xWYjbdoE8cv9cBqtD9d8Cm7DgW3tHXYPhmkPGCYiOyj6pgDpP1J/BRf5Zl1J/K/WQM
 zTo2tHfpKUbLE2yKH6k30fBsiLKeDQ6W0tPrmLVVRmiMOHP24IBFe/lQkBBmczYfo93/
 vR0Q/rKV8GPd2oPhuYKwalLRmm6UuqTRC3mjK3bPZlRf2rRzP28uWiJzhN4lIoOBCDZc
 xQvQYSdutPMKCEThv8LUazy3iyvexqpgEANogN44l0uPw7Y3PHcRKV1/M+fr5WGr558k
 CFKA==
X-Gm-Message-State: APjAAAUlEIJBuBZ6F8txFbF7GF217QXN+KB1u8fyFZDbFUn/aLmI13YU
 CQpSv0iWIiJ22g84EIyPhKc=
X-Google-Smtp-Source: APXvYqwrTT1N5CbtoW7bGcow975hWrDFM7VA+ZKxMMKBQH74XTjBbjGPFN7q5ngTfy00REM0jSRMPA==
X-Received: by 2002:a63:734a:: with SMTP id d10mr4055370pgn.334.1570656898956; 
 Wed, 09 Oct 2019 14:34:58 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id h4sm3336017pfg.159.2019.10.09.14.34.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 14:34:58 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/msm/dsi: Implement reset correctly
Date: Wed,  9 Oct 2019 14:34:54 -0700
Message-Id: <20191009213454.32891-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=93XeND10daxMH10mUwFpx+iBqyMkuxVptnzWDGZ5rAE=;
 b=t9EwRTa0xVN+CnzMK1VtNToY63kjkFdBHNGmDJKvSh5OpWOkXi73cg74gjLP3/zpE9
 8hDObmZpCkDo7ajMaDTaC0YqBqm/gLqP/YWhIZtuNWsiIUm4xXYrryOSGFhNh+4sEfcJ
 YrzNkCeLcHwbWrDTGSE02GDGEfL6uYCHwZYH0Bnx7cedasuYNHoYp8tEsYkW8LOrUeR8
 qs0gVgJeN1yLXWsHHBJgI6UBnJAZOTMAwEjaNQoClUyj5wg4SX9ZXiJoQ2HcsgDqG/mK
 VyQ+caX2EITecNehpw8oXyriS+EHejuw9GUEOLGzfH7reWdxnj16hHMXmhKKJSep448w
 QJFg==
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gbXNtODk5OCwgdmJsYW5rIHRpbWVvdXRzIGFyZSBvYnNlcnZlZCBiZWNhdXNlIHRoZSBEU0kg
Y29udHJvbGxlciBpcyBub3QKcmVzZXQgcHJvcGVybHksIHdoaWNoIGVuZHMgdXAgc3RhbGxpbmcg
dGhlIE1EUC4gIFRoaXMgaXMgYmVjYXVzZSB0aGUgcmVzZXQKbG9naWMgaXMgbm90IGNvcnJlY3Qg
cGVyIHRoZSBoYXJkd2FyZSBkb2N1bWVudGF0aW9uLgoKVGhlIGRvY3VtZW50YXRpb24gc3RhdGVz
IHRoYXQgYWZ0ZXIgYXNzZXJ0aW5nIHJlc2V0LCBzb2Z0d2FyZSBzaG91bGQgd2FpdApzb21lIHRp
bWUgKG5vIGluZGljYXRpb24gb2YgaG93IGxvbmcpLCBvciBwb2xsIHRoZSBzdGF0dXMgcmVnaXN0
ZXIgdW50aWwgaXQKcmV0dXJucyAwIGJlZm9yZSBkZWFzc2VydGluZyByZXNldC4KCndtYigpIGlz
IGluc3VmZmljaWVudCBmb3IgdGhpcyBwdXJwb3NlIHNpbmNlIGl0IGp1c3QgZW5zdXJlcyBvcmRl
cmluZywgbm90CnRpbWluZyBiZXR3ZWVuIHdyaXRlcy4gIFNpbmNlIGFzc2VydGluZyBhbmQgZGVh
c3NlcnRpbmcgcmVzZXQgb2NjdXJzIG9uIHRoZQpzYW1lIHJlZ2lzdGVyLCBvcmRlcmluZyBpcyBh
bHJlYWR5IGd1YXJhbnRlZWQgYnkgdGhlIGFyY2hpdGVjdHVyZSwgbWFraW5nCnRoZSB3bWIgZXh0
cmFuZW91cy4KClNpbmNlIHdlIHdvdWxkIGRlZmluZSBhIHRpbWVvdXQgZm9yIHBvbGxpbmcgdGhl
IHN0YXR1cyByZWdpc3RlciB0byBhdm9pZCBhCnBvc3NpYmxlIGluZmluaXRlIGxvb3AsIGxldHMg
anVzdCB1c2UgYSBzdGF0aWMgZGVsYXkgb2YgMjAgbXMsIHNpbmNlIDE2LjY2NgptcyBpcyB0aGUg
dGltZSBhdmFpbGFibGUgdG8gcHJvY2VzcyBvbmUgZnJhbWUgYXQgNjAgZnBzLgoKRml4ZXM6IGE2
ODk1NTRiYTZlZCAoZHJtL21zbTogSW5pdGlhbCBhZGQgRFNJIGNvbm5lY3RvciBzdXBwb3J0KQpT
aWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KLS0t
CgpSb2IgZXQgYWwsIGlzIGl0IHBvc3NpYmxlIGZvciB0aGlzIHRvIGdvIGludG8gYSA1LjQtcmM/
CgogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
ZHNpX2hvc3QuYwppbmRleCA2NjNmZjlmNGZhYzkuLjY4ZGVkOWI0NzM1ZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9kc2lfaG9zdC5jCkBAIC05ODYsNyArOTg2LDcgQEAgc3RhdGljIHZvaWQgZHNpX3N3
X3Jlc2V0KHN0cnVjdCBtc21fZHNpX2hvc3QgKm1zbV9ob3N0KQogCXdtYigpOyAvKiBjbG9ja3Mg
bmVlZCB0byBiZSBlbmFibGVkIGJlZm9yZSByZXNldCAqLwogCiAJZHNpX3dyaXRlKG1zbV9ob3N0
LCBSRUdfRFNJX1JFU0VULCAxKTsKLQl3bWIoKTsgLyogbWFrZSBzdXJlIHJlc2V0IGhhcHBlbiAq
LworCW1zbGVlcCgyMCk7IC8qIG1ha2Ugc3VyZSByZXNldCBoYXBwZW4gKi8KIAlkc2lfd3JpdGUo
bXNtX2hvc3QsIFJFR19EU0lfUkVTRVQsIDApOwogfQogCkBAIC0xMzk2LDcgKzEzOTYsNyBAQCBz
dGF0aWMgdm9pZCBkc2lfc3dfcmVzZXRfcmVzdG9yZShzdHJ1Y3QgbXNtX2RzaV9ob3N0ICptc21f
aG9zdCkKIAogCS8qIGRzaSBjb250cm9sbGVyIGNhbiBvbmx5IGJlIHJlc2V0IHdoaWxlIGNsb2Nr
cyBhcmUgcnVubmluZyAqLwogCWRzaV93cml0ZShtc21faG9zdCwgUkVHX0RTSV9SRVNFVCwgMSk7
Ci0Jd21iKCk7CS8qIG1ha2Ugc3VyZSByZXNldCBoYXBwZW4gKi8KKwltc2xlZXAoMjApOwkvKiBt
YWtlIHN1cmUgcmVzZXQgaGFwcGVuICovCiAJZHNpX3dyaXRlKG1zbV9ob3N0LCBSRUdfRFNJX1JF
U0VULCAwKTsKIAl3bWIoKTsJLyogY29udHJvbGxlciBvdXQgb2YgcmVzZXQgKi8KIAlkc2lfd3Jp
dGUobXNtX2hvc3QsIFJFR19EU0lfQ1RSTCwgZGF0YTApOwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
