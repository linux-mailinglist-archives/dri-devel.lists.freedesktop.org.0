Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9EF642B1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A2D89BFF;
	Wed, 10 Jul 2019 07:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF376E083
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 15:13:44 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g18so16295126qkl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 08:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WHvzwCCcvuwidmEeTSDSKbjZ51f0w3J+bTcRkdflHTQ=;
 b=aMOzuT56lKh6TnIPkfjkdtXPB+LcJdEGhuTI7zheNebtliW7jwsCTfbp0rfxtD3ltn
 mmSfUYcC76st2+XM3Hi25b6fyUGQZcnEpXZDaFWXN/GG0yY8SG1M7KcSCIdDu8EH1tap
 dXmkQtJFRFcUfsO3aYfqseknVCKoovpP5nVa1jCfVtmtuk5ZpVkfjCrrl1TE8KASohXP
 6DqGyRPAf7T1gIM675ht6hYJHvP6vNHlhj4c24m5M2vwGJhkvt4jvDnIPioP1H8BbeVi
 NfzkCKRTnOH3eGuxbx94cNZSXVVuGedSyDz1sNDwySHIcBB/SAECMJ/6Lscv9WXj2e3y
 pwFA==
X-Gm-Message-State: APjAAAUB9FRcAM0VU16ATyQQwyK8qCxocZ5FPM/j8+hisJLdVXFYvG/i
 01npysrXWHmPSbtkYweYnd3gfQ==
X-Google-Smtp-Source: APXvYqyxXEO5ObwdhLEx98Jnglsk7WZ63no55kPV1Lr36Qo6VDYUS0XbtMZ1K1zgeQx7228hhG8x5w==
X-Received: by 2002:ae9:de81:: with SMTP id
 s123mr19043791qkf.339.1562685223713; 
 Tue, 09 Jul 2019 08:13:43 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id a135sm6606670qkg.72.2019.07.09.08.13.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 08:13:42 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: akpm@linux-foundation.org
Subject: [PATCH v3] gpu/drm_memory: fix a few warnings
Date: Tue,  9 Jul 2019 11:13:10 -0400
Message-Id: <1562685190-1353-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=WHvzwCCcvuwidmEeTSDSKbjZ51f0w3J+bTcRkdflHTQ=;
 b=Kk5VH4hWg+nQngt8M3wARa7Aa4RZtgZyR+LKlATJywlzSNp0c3+TqdFsgFRG4GpGwp
 BAZE3L+hS/o687mtHqDpLu46LTqSKryJinawDjomq+2NuZR9VV0t17540i5vjqszvpW0
 wm/l5BJxrDw63hYBEWqlKdCxPEy4SVGTbF3vG+g7PFfgzomOuQoVlV7o/y3VaxMSFu8f
 FV+1fBdha9fUV8C3u/0g7YxKoW9YwAlAwYG33KW6GHzfBzhxqmcIIinacC9qVQUf9lZi
 hmBlm0oRftFePYw3SXxhJ4pVdXO4AOuOisfhQ4PNd2dJqK/WD2pzLCMYGMWmgzM+9SXM
 koOg==
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
Cc: corbet@lwn.net, airlied@linux.ie, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rfontana@redhat.com, Qian Cai <cai@lca.pw>, gregkh@linuxfoundation.org,
 joe@perches.com, linux-spdx@archiver.kernel.org, tglx@linutronix.de,
 sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9wZW5pbmcgY29tbWVudCBtYXJrICIvKioiIGlzIHJlc2VydmVkIGZvciBrZXJuZWwtZG9j
IGNvbW1lbnRzLCBzbwppdCB3aWxsIGdlbmVyYXRlIGEgd2FybmluZyB3aXRoICJtYWtlIFc9MSIu
Cgpkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jOjI6IHdhcm5pbmc6IENhbm5vdCB1bmRlcnN0
YW5kICAqIFxmaWxlCmRybV9tZW1vcnkuYwoKQWxzbywgc2lsZW5jZSBhIGNoZWNrcGF0Y2ggd2Fy
bmluZyBieSBhZGRpbmcgYSBsaWNlbnNlIGlkZW50Zml0ZXIgd2hlcmUKaXQgaW5kaWNhdGVzIHRo
ZSBNSVQgbGljZW5zZSBmdXJ0aGVyIGRvd24gaW4gdGhlIHNvdXJjZSBmaWxlLgoKV0FSTklORzog
TWlzc2luZyBvciBtYWxmb3JtZWQgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXIgdGFnIGluIGxpbmUg
MQoKRml4IGl0IGJ5IGFkZGluZyB0aGUgTUlUIFNQRFggaWRlbnRpZmllciB3aXRob3V0IHRvdWNo
aW5nIHRoZSBib2lsZXJwbGF0ZQpsYW5ndWFnZS4KClN1Z2dlc3RlZC1ieTogVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IFFpYW4gQ2FpIDxjYWlAbGNh
LnB3PgotLS0KCnYzOiBLZWVwIHRoZSBib2lsZXJwbGF0ZSBsYW5ndWFnZS4KdjI6IFJlbW92ZSB0
aGUgcmVkdW5kYW50IGRlc2NyaXB0aW9uIG9mIHRoZSBsaWNlbnNlLgoKIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fbWVtb3J5LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCmluZGV4IDEzMmZlZjhmZjFiNi4uNjgzMDQy
YzhlZTJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMKQEAgLTEsNCArMSw1IEBACi0vKioKKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBNSVQKKy8qCiAgKiBcZmlsZSBkcm1fbWVtb3J5LmMKICAqIE1l
bW9yeSBtYW5hZ2VtZW50IHdyYXBwZXJzIGZvciBEUk0KICAqCi0tIAoxLjguMy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
