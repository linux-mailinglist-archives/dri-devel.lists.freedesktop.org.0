Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85115DCE3C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434F66EBB3;
	Fri, 18 Oct 2019 18:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Fri, 18 Oct 2019 04:35:09 UTC
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008D76E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 04:35:09 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4DEE9CB6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 04:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7hHmjTpdYE8 for <dri-devel@lists.freedesktop.org>;
 Thu, 17 Oct 2019 23:30:02 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 252F25EA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 23:30:01 -0500 (CDT)
Received: by mail-io1-f72.google.com with SMTP id f5so6906066iob.17
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 21:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=S+ExY7RtG2HqIxYagBLe/T94lp0xElb1mK1Anml9C8I=;
 b=PJ1iEGlJnibKalR6HMWQXUCB9/iVZOJB79wJqz7Uz4kv42DrndvMD+f+4+0tJVvSbQ
 2HimgUnwHGu2r/JvY5NF5AYC69EaL2lmLUpwPq7B4eLFukDt04E+2PWJQ/jnJ7pRQJgP
 +jpZxVsB/4eXx77OArOK4ur4Du09r9pyAhELKRQ36IaU6TiFNAbBk5gJol1qYbN2v8/a
 A4PloM5o8GRRd0v69ephLOPDIRGnWaqRp1WtwKYVBCUEu53MWiAS+Al1PnYwrRIuK/QI
 52ydD1ctRp8k1zmjC0l3iUIGKCoTM2XYVjIy9mtkvOHfcVjs78WalNyi940tGZe8IR0j
 ukpQ==
X-Gm-Message-State: APjAAAV07t0559I114h/ppQSnE7ZvrhmulumiEQTWMwbALCHHj4D2A2f
 VPg0QdQUBvR6FpT/9YC37rYoAGz3ZlLnSv0ZBGqU14FYUqF5HEOSRRXnEbYAz3XuX63t7oUv1us
 H9RGjkJ5ewbdQ/X783qi9f2qnOq/5ILW7
X-Received: by 2002:a92:8bca:: with SMTP id i193mr8102480ild.136.1571373000721; 
 Thu, 17 Oct 2019 21:30:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVhwgtJqw281TwokvjEpYKzpFxY3mjcnKghYUQJtb90u5SQgULX83RETrMAXvH1tZvYPo8ZA==
X-Received: by 2002:a92:8bca:: with SMTP id i193mr8102457ild.136.1571373000345; 
 Thu, 17 Oct 2019 21:30:00 -0700 (PDT)
Received: from bee.dtc.umn.edu (cs-bee-u.cs.umn.edu. [128.101.106.63])
 by smtp.gmail.com with ESMTPSA id d14sm1698308ilm.15.2019.10.17.21.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 21:29:59 -0700 (PDT)
From: Kangjie Lu <kjlu@umn.edu>
To: kjlu@umn.edu
Subject: [PATCH] gma/gma500: fix a memory disclosure bug due to uninitialized
 bytes
Date: Thu, 17 Oct 2019 23:29:53 -0500
Message-Id: <20191018042953.31099-1-kjlu@umn.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=S+ExY7RtG2HqIxYagBLe/T94lp0xElb1mK1Anml9C8I=;
 b=jOgX/6IAAce6fxtFdSpduVfsmh5bsIHnA+8VVZ0mbnCPUCT+tzRAGa3T5u7u6FNRXs
 pTJMp7STs6Wf/JPbaLXY8YXbz5sf/WtjaBPRLva6TWdHgmtZxwQ/5HXd2OPWsXVFm7au
 OA2DAJJJ67vhacDjOwXzwHbZxSTjr7XHqrav28tCL6Tov8x/wkXSUIenG91dU3laGTuw
 CDqGtzgXShdroBwoiixulNlnaiH329FsYYLzbA2GgMEZ4nm+uXNUc4ZYlhS2UR/3nR5x
 MR4Gr5pQyqmv7MeK5wZkVyEprVQeCh54BeulCAYlSOWTitR72M8+eEMycBQqIRS3oqMA
 D1Jw==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YGJlc3RfY2xvY2tgIGlzIGFuIG9iamVjdCB0aGF0IG1heSBiZSBzZW50IG91dC4gT2JqZWN0IGBj
bG9ja2AKY29udGFpbnMgdW5pbml0aWFsaXplZCBieXRlcyB0aGF0IGFyZSBjb3BpZWQgdG8gYGJl
c3RfY2xvY2tgLAp3aGljaCBsZWFkcyB0byBtZW1vcnkgZGlzY2xvc3VyZSBhbmQgaW5mb3JtYXRp
b24gbGVhay4KClNpZ25lZC1vZmYtYnk6IEthbmdqaWUgTHUgPGtqbHVAdW1uLmVkdT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9kaXNwbGF5LmMgfCAyICsrCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dt
YTUwMC9jZHZfaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZfaW50
ZWxfZGlzcGxheS5jCmluZGV4IGY1Njg1MmE1MDNlOC4uOGI3ODQ5NDdlZDNiIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9kaXNwbGF5LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxfZGlzcGxheS5jCkBAIC00MDUsNiArNDA1LDggQEAg
c3RhdGljIGJvb2wgY2R2X2ludGVsX2ZpbmRfZHBfcGxsKGNvbnN0IHN0cnVjdCBnbWFfbGltaXRf
dCAqbGltaXQsCiAJc3RydWN0IGdtYV9jcnRjICpnbWFfY3J0YyA9IHRvX2dtYV9jcnRjKGNydGMp
OwogCXN0cnVjdCBnbWFfY2xvY2tfdCBjbG9jazsKIAorCW1lbXNldCgmY2xvY2ssIDAsIHNpemVv
ZihjbG9jaykpOworCiAJc3dpdGNoIChyZWZjbGspIHsKIAljYXNlIDI3MDAwOgogCQlpZiAodGFy
Z2V0IDwgMjAwMDAwKSB7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
