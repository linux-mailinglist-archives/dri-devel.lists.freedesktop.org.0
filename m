Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41EA30A418
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 10:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E036E50C;
	Mon,  1 Feb 2021 09:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC81D6E50C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 09:12:01 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id hs11so23182376ejc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 01:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=btINpU5HcXL/etWCMn1yPYxaXZUiSUxibTtLRThV+h4=;
 b=asNbPsb0CqUI950B4JBFHUKrn2W7wtaNO1TpKUlfomnOCZLoJ5jym8T1iorvw4MyCc
 6SDuMbtgWmZnOISe33HCz3ZSm2Vwq1jw8Eg4PUeBbrH9Arc7jThBqEoIQclJybsO7mtf
 sPmEDvdAyFpgB/kbykMjb6Ecw5uV+J3zkeIuh7beesbwOtKdPm+hrKsO6UA9C52l+AmY
 3RPthhhaWvG1SD2ecnBaKfY7gRPzyZBK3Ty49v74k0RdCd4bb5NPSh8nAErMR/TmGkwW
 LYeRnWdvkHs7QECGhnkm2CuhJOa0fGWtOLoa3umw03CTOr71I9Lt83cnDE3KLk5yHdpp
 5INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=btINpU5HcXL/etWCMn1yPYxaXZUiSUxibTtLRThV+h4=;
 b=E2eDYCU9AhMkZ+InVbUM6jBSB0sOyMIDmh6kIjg0mFEMDai+siJjGxqkt7JxfT85M7
 VZuKf8BM8/NjL7ImLgd3Bt3Fa6lzPygrlHYhO4aCfUXfW+VUhFy5oZv3YKZ0Kk3jP1S0
 5FjvJ3R1OF3RNliihbKwhPm+GrAbvTlW9i3AI0lG5Hu21FAF099/6XnYOZ6duRikWIkz
 ZNRfqQn1eaNbAGhu0xzVG0nvtWcZhPC5sHv/VMiu1SMMqwkljUqkl4C1dgHOOE9vuDcg
 /T+9oGdPLxfco3UIbsCF7gnBsAEmkgZOqMjcDSc18nZIxsCSRQh2J8/nRGbXNIlesRQQ
 PGGw==
X-Gm-Message-State: AOAM5311cKZSEvtClSWeX6VxzYBIMT+5NU1ihNDeFpTO7e+PjhXkQd7C
 q7n5bRDIAm6MkusAn1l7B98=
X-Google-Smtp-Source: ABdhPJyVUeqK+Pcc8GO2yWa5gU4CD8oHJGEtNqFtkaMVfEEpPpXR+1r8SrDNZR6IwUAly3xNe7jajg==
X-Received: by 2002:a17:906:408b:: with SMTP id
 u11mr1222037ejj.299.1612170720380; 
 Mon, 01 Feb 2021 01:12:00 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3d31:e37e:e2cc:a5ad])
 by smtp.gmail.com with ESMTPSA id v1sm3259239ejd.3.2021.02.01.01.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 01:11:59 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sfr@canb.auug.org.au, luben.tuikov@amd.com, linux-next@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/v3d/v3d_sched: fix scheduler callbacks return status
Date: Mon,  1 Feb 2021 10:11:59 +0100
Message-Id: <20210201091159.177853-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgbGlrZSB0aGlzIHdhcyBub3QgY29ycmVjdGx5IGFkanVzdGVkLgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpGaXhlczogYTZh
MWYwMzZjNzRlICgiZHJtL3NjaGVkdWxlcjogSm9iIHRpbWVvdXQgaGFuZGxlciByZXR1cm5zIHN0
YXR1cyAodjMpIikKLS0tCiBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jIHwgMTIgKysr
KysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX3NjaGVkLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jCmluZGV4IGVmMjMzOGEyOTRjYS4uY2ViMzNmOGU0Mzc5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS92M2QvdjNkX3NjaGVkLmMKQEAgLTI1OSw3ICsyNTksNyBAQCB2M2RfY2FjaGVf
Y2xlYW5fam9iX3J1bihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQogCXJldHVybiBO
VUxMOwogfQogCi1zdGF0aWMgZW51bSBkcm1fZ3B1X3NjaGVkX3N0YXR1cworc3RhdGljIGVudW0g
ZHJtX2dwdV9zY2hlZF9zdGF0CiB2M2RfZ3B1X3Jlc2V0X2Zvcl90aW1lb3V0KHN0cnVjdCB2M2Rf
ZGV2ICp2M2QsIHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCiB7CiAJZW51bSB2M2Rf
cXVldWUgcTsKQEAgLTI5NCw3ICsyOTQsNyBAQCB2M2RfZ3B1X3Jlc2V0X2Zvcl90aW1lb3V0KHN0
cnVjdCB2M2RfZGV2ICp2M2QsIHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCiAgKiBj
b3VsZCBmYWlsIGlmIHRoZSBHUFUgZ290IGluIGFuIGluZmluaXRlIGxvb3AgaW4gdGhlIENMLCBi
dXQgdGhhdAogICogaXMgcHJldHR5IHVubGlrZWx5IG91dHNpZGUgb2YgYW4gaS1nLXQgdGVzdGNh
c2UuCiAgKi8KLXN0YXRpYyBlbnVtIGRybV90YXNrX3N0YXR1cworc3RhdGljIGVudW0gZHJtX2dw
dV9zY2hlZF9zdGF0CiB2M2RfY2xfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpz
Y2hlZF9qb2IsIGVudW0gdjNkX3F1ZXVlIHEsCiAJCSAgICB1MzIgKnRpbWVkb3V0X2N0Y2EsIHUz
MiAqdGltZWRvdXRfY3RyYSkKIHsKQEAgLTMxMiw3ICszMTIsNyBAQCB2M2RfY2xfam9iX3RpbWVk
b3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IsIGVudW0gdjNkX3F1ZXVlIHEsCiAJ
cmV0dXJuIHYzZF9ncHVfcmVzZXRfZm9yX3RpbWVvdXQodjNkLCBzY2hlZF9qb2IpOwogfQogCi1z
dGF0aWMgZW51bSBkcm1fdGFza19zdGF0dXMKK3N0YXRpYyBlbnVtIGRybV9ncHVfc2NoZWRfc3Rh
dAogdjNkX2Jpbl9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikK
IHsKIAlzdHJ1Y3QgdjNkX2Jpbl9qb2IgKmpvYiA9IHRvX2Jpbl9qb2Ioc2NoZWRfam9iKTsKQEAg
LTMyMSw3ICszMjEsNyBAQCB2M2RfYmluX2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pv
YiAqc2NoZWRfam9iKQogCQkJCSAgICZqb2ItPnRpbWVkb3V0X2N0Y2EsICZqb2ItPnRpbWVkb3V0
X2N0cmEpOwogfQogCi1zdGF0aWMgZW51bSBkcm1fdGFza19zdGF0dXMKK3N0YXRpYyBlbnVtIGRy
bV9ncHVfc2NoZWRfc3RhdAogdjNkX3JlbmRlcl9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hl
ZF9qb2IgKnNjaGVkX2pvYikKIHsKIAlzdHJ1Y3QgdjNkX3JlbmRlcl9qb2IgKmpvYiA9IHRvX3Jl
bmRlcl9qb2Ioc2NoZWRfam9iKTsKQEAgLTMzMCw3ICszMzAsNyBAQCB2M2RfcmVuZGVyX2pvYl90
aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQogCQkJCSAgICZqb2ItPnRp
bWVkb3V0X2N0Y2EsICZqb2ItPnRpbWVkb3V0X2N0cmEpOwogfQogCi1zdGF0aWMgZW51bSBkcm1f
dGFza19zdGF0dXMKK3N0YXRpYyBlbnVtIGRybV9ncHVfc2NoZWRfc3RhdAogdjNkX2dlbmVyaWNf
am9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCiB7CiAJc3RydWN0
IHYzZF9qb2IgKmpvYiA9IHRvX3YzZF9qb2Ioc2NoZWRfam9iKTsKQEAgLTMzOCw3ICszMzgsNyBA
QCB2M2RfZ2VuZXJpY19qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pv
YikKIAlyZXR1cm4gdjNkX2dwdV9yZXNldF9mb3JfdGltZW91dChqb2ItPnYzZCwgc2NoZWRfam9i
KTsKIH0KIAotc3RhdGljIGVudW0gZHJtX3Rhc2tfc3RhdHVzCitzdGF0aWMgZW51bSBkcm1fZ3B1
X3NjaGVkX3N0YXQKIHYzZF9jc2Rfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpz
Y2hlZF9qb2IpCiB7CiAJc3RydWN0IHYzZF9jc2Rfam9iICpqb2IgPSB0b19jc2Rfam9iKHNjaGVk
X2pvYik7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
