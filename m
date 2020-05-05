Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9C41C5ADA
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 17:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A338E6E7D5;
	Tue,  5 May 2020 15:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCC46E7D4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 15:18:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i10so3189406wrv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 08:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BH08Zd37jgMT5BJkCh3yo4A8owT2Xvzs0j2NLhOEre4=;
 b=hgVE+HNbSGvrlG+Mvk0PLSbaCRStrFUPIZCgURxldl2oKmrWvo4WnDW0iJt0VD0Wqx
 0+JlKqm3PO5chKSXDBdRFr6LgFXJ6+JvYPL42O+0zmYMFDoaWE3R4WlSG/6qtNHQu1U0
 CwxoVDMqhjg6ySlSYbyqFeVhuXII+BeyDEB6gXCcPR/Mch9rhlAHf4bgI//07C/czZ9c
 3GBFdKoPvzcnIOzMzO+Pqns/PwKDnJB2Y3SaJGxw8MqGWV9vT+L8zv4n1nqN/a/a4eNW
 z+oaRROKtF+J53Ix/6KWWRcH2IuZwfxtSChQJGhL7NkGzrLKTLCY3xP9hArywSnVJ2Nd
 un/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BH08Zd37jgMT5BJkCh3yo4A8owT2Xvzs0j2NLhOEre4=;
 b=KHmgSXm244hYlTiJhS6Ag481brgG2CW3I/hc6o7hqs9TK48AO1k2UYZwz/TWkQJA50
 VhMjyyjE38NRt0ru/DW1hFZa+ryauDGF6/36si9O1S7Ak/eRs38IoOvZqK/Lh9sctcu6
 legd/uM7+j1U4WXHpvfRa1psZTLyq1xJQwNC36Vq4qTRU4sFShojrIzJHBq1IdGj3Nlw
 xrYufM3r0XvQsb6bCjdbho1joAKG2CIbxy3XKG/W3FA+W0gUZMZTS4+1jPhhmFdjFIgJ
 S46/F5WtZCnqPvsTVWJXYmmTeV0zHQwl24gpY7mfLFIW5IENay+RXqe0ufK0ZI+lpVFL
 E1sw==
X-Gm-Message-State: AGi0PubqGVeokdStCpD5NF02cbZD9/0XyevCXkzuhfU5ikABSBnR7Tdp
 /Gic2xR3LHWUvF3VffMi9Fp7FQqs
X-Google-Smtp-Source: APiQypJyXLOGfh0t7V+cfgbcXHDLUOsrWVfqwPuqJnmHdXVNzLoAe66UMtnclqS6QrwDItEacgxa7Q==
X-Received: by 2002:adf:decb:: with SMTP id i11mr3223066wrn.172.1588691919615; 
 Tue, 05 May 2020 08:18:39 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id o18sm3662662wrp.23.2020.05.05.08.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 08:18:37 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: vop: call vop_cfg_done() under reg_lock
Date: Tue,  5 May 2020 16:16:13 +0100
Message-Id: <20200505151613.2932456-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: emil.l.velikov@gmail.com, Sandy Huang <hjc@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoZSBmdW5j
dGlvbiB2b3BfY2ZnX2RvbmUoKSBpcyBhIHNpbXBsZSBWT1BfUkVHX1NFVCgpLiBBcyBzdWNoIGl0
IHNob3VsZApiZSBkb25lIHVuZGVyIGEgcmVnX2xvY2suIEEgcXVpY2sgbG9vayB0aHJvdWdoIHRo
ZSBkcml2ZXIgc2hvd3MgdGhhdCBhbGwKb3RoZXIgaW5zdGFuY2VzIChhcGFydCBmcm9tIGRyaXZl
ciBpbml0KSBoYXZlIHRoZSBsb2NrLiBEbyB0aGUgc2FtZSBoZXJlCgpDYzogU2FuZHkgSHVhbmcg
PGhqY0Byb2NrLWNoaXBzLmNvbT4KQ2M6IEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+
ClNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+
Ci0tLQpOb3RpY2VkIHdoaWxlIHNraW1taW5nIHRocm91Z2ggdGhlIGNvZGUgYW5kIHRodXMgdW50
ZXN0ZWQuCi0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5j
IGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwppbmRleCAzMzQ2
M2I3OWEzN2IuLjFkNzY0NTVjYTkzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV92b3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX3ZvcC5jCkBAIC02NDUsMTAgKzY0NSwxMCBAQCBzdGF0aWMgaW50IHZvcF9lbmFi
bGUoc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9zdGF0
ZSkKIAkJcy0+ZW5hYmxlX2FmYmMgPSBmYWxzZTsKIAl9CiAKLQlzcGluX3VubG9jaygmdm9wLT5y
ZWdfbG9jayk7Ci0KIAl2b3BfY2ZnX2RvbmUodm9wKTsKIAorCXNwaW5fdW5sb2NrKCZ2b3AtPnJl
Z19sb2NrKTsKKwogCS8qCiAJICogQXQgaGVyZSwgdm9wIGNsb2NrICYgaW9tbXUgaXMgZW5hYmxl
LCBSL1cgdm9wIHJlZ3Mgd291bGQgYmUgc2FmZS4KIAkgKi8KLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
