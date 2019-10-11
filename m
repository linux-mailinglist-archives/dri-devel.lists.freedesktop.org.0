Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE1D45CA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 18:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C926E6EC6A;
	Fri, 11 Oct 2019 16:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D0F6EB3D;
 Fri, 11 Oct 2019 13:39:45 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c3so4505072plo.2;
 Fri, 11 Oct 2019 06:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qGkUWDkWuy9rCgnYrcxxUjy8YGrJ1whz/5MzqghbV70=;
 b=E73Ce50egW7z7bsjF7nggrII4lZbFxYZUzfqS6UmY+hlHMY9FLR5SHLmK4qdrGrsp0
 W0IPXQXxp5jhGh/DjYx4zr2/wgJnPFMIaX04AS6FYXmmWToMWwkTJW30bHxuCC1oh8to
 VGRg8vZSwFFJFHjGROYPp0/CFlCBThtAEtmpO2f/wxGlaDtpq9GqbLJs9r+Cu4avxGCx
 Ggef+dRkHB6N8sjCY3UhVqJkY9LNj9643cp5vJExpBotEu+3ru9GekTg/A3Fhxerp4Ss
 Uzx82gMXkRHO+XFMyoqGQH6Ghco8GrcRet5gk09qewisID6/OTk7WGylrfkd1fRg6esr
 J0DA==
X-Gm-Message-State: APjAAAXJDqzJ00/V3VAJqKqh58YsVNgxlRfcDW14j5bwaZQhAXvBj89K
 sVxKPoy1AyfERl1mqVAI/G0=
X-Google-Smtp-Source: APXvYqzeKH3l7K1RGHl7x8YfH51uO/BfgM5UGC2UadrBOkHc4M/Qz6TjJKWUTWI/gQ0YBexfLEapqg==
X-Received: by 2002:a17:902:d909:: with SMTP id
 c9mr15296242plz.216.1570801184611; 
 Fri, 11 Oct 2019 06:39:44 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id n2sm11961743pgg.77.2019.10.11.06.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:39:43 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2] drm/msm/dsi: Implement reset correctly
Date: Fri, 11 Oct 2019 06:39:39 -0700
Message-Id: <20191011133939.16551-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 11 Oct 2019 16:52:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qGkUWDkWuy9rCgnYrcxxUjy8YGrJ1whz/5MzqghbV70=;
 b=NBk7HErwPAcy77r0BblRtX/FoKDf2xjanp1mb1ZicXMdBKqGs5cEf1d7iE96FH7akP
 gKHm4cPXwNja+OJ9wpWO5FctGJPduKDGTPyNHifr9IfLDlbHJgQziStyDnJh6oZ5nvBZ
 P2NNw1hCrejdrWxN+NATA5AKvvdq47YXCu0BkvDbmW9icN7/1TdjjH8MjK2B1Ck++djP
 WUew6Fo/9SDjaafj3VvjUN4G0VbT0/yTIkuFHDoPdEEb7WwjqMdjOHbj+Fn7HHwth1Lf
 UuKH66p+BcF0DJGdS/qiI+HBgFFhNfXim9fSmvYApTfdzOKiPEhRikzCLsjApt3Tv6S5
 84QA==
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
aWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KUmV2
aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgotLS0KCnYyOgotbWFrZSBhIERF
RklORSBmb3IgdGhlIGRlbGF5CgogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyB8
IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCmluZGV4IDY2M2ZmOWY0ZmFjOS4uOWE4MTcw
NTMwMWM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMKQEAgLTI2LDYgKzI2LDggQEAK
ICNpbmNsdWRlICJkc2lfY2ZnLmgiCiAjaW5jbHVkZSAibXNtX2ttcy5oIgogCisjZGVmaW5lIFJF
U0VUX0RFTEFZIDIwCisKIHN0YXRpYyBpbnQgZHNpX2dldF92ZXJzaW9uKGNvbnN0IHZvaWQgX19p
b21lbSAqYmFzZSwgdTMyICptYWpvciwgdTMyICptaW5vcikKIHsKIAl1MzIgdmVyOwpAQCAtOTg2
LDcgKzk4OCw3IEBAIHN0YXRpYyB2b2lkIGRzaV9zd19yZXNldChzdHJ1Y3QgbXNtX2RzaV9ob3N0
ICptc21faG9zdCkKIAl3bWIoKTsgLyogY2xvY2tzIG5lZWQgdG8gYmUgZW5hYmxlZCBiZWZvcmUg
cmVzZXQgKi8KIAogCWRzaV93cml0ZShtc21faG9zdCwgUkVHX0RTSV9SRVNFVCwgMSk7Ci0Jd21i
KCk7IC8qIG1ha2Ugc3VyZSByZXNldCBoYXBwZW4gKi8KKwltc2xlZXAoUkVTRVRfREVMQVkpOyAv
KiBtYWtlIHN1cmUgcmVzZXQgaGFwcGVuICovCiAJZHNpX3dyaXRlKG1zbV9ob3N0LCBSRUdfRFNJ
X1JFU0VULCAwKTsKIH0KIApAQCAtMTM5Niw3ICsxMzk4LDcgQEAgc3RhdGljIHZvaWQgZHNpX3N3
X3Jlc2V0X3Jlc3RvcmUoc3RydWN0IG1zbV9kc2lfaG9zdCAqbXNtX2hvc3QpCiAKIAkvKiBkc2kg
Y29udHJvbGxlciBjYW4gb25seSBiZSByZXNldCB3aGlsZSBjbG9ja3MgYXJlIHJ1bm5pbmcgKi8K
IAlkc2lfd3JpdGUobXNtX2hvc3QsIFJFR19EU0lfUkVTRVQsIDEpOwotCXdtYigpOwkvKiBtYWtl
IHN1cmUgcmVzZXQgaGFwcGVuICovCisJbXNsZWVwKFJFU0VUX0RFTEFZKTsJLyogbWFrZSBzdXJl
IHJlc2V0IGhhcHBlbiAqLwogCWRzaV93cml0ZShtc21faG9zdCwgUkVHX0RTSV9SRVNFVCwgMCk7
CiAJd21iKCk7CS8qIGNvbnRyb2xsZXIgb3V0IG9mIHJlc2V0ICovCiAJZHNpX3dyaXRlKG1zbV9o
b3N0LCBSRUdfRFNJX0NUUkwsIGRhdGEwKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
