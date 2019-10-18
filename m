Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365CEDCE40
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504596EBC9;
	Fri, 18 Oct 2019 18:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E906E0F6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 04:41:58 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 80773C2B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 04:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5PgGe7ru09t for <dri-devel@lists.freedesktop.org>;
 Thu, 17 Oct 2019 23:41:57 -0500 (CDT)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 5D08CC3C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 23:41:57 -0500 (CDT)
Received: by mail-io1-f70.google.com with SMTP id g126so7118043iof.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 21:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KZJ0qgGHHAivbnxIOZfhWtlIHuWG04Vj3FxHQ3w/GEE=;
 b=GtGYlpnHyQlSzIeqDcxRPGMc0vLFwWHU8ma95lFY2HAx1ZOGNuIE8MuvSWwZkgeAMo
 mPSi6VKeiLbcCOrbxtV4sfCNjlw3vqVj5IkisRYZX7gdOCP8BmDgfR8mflwazAm2Z+/k
 DoSXmAPeZPGsLZFp5YOjKaNpUALS2VC1PszOtGc8IHxs5bKjxB7k5GEE4bx9u7DPRTuD
 EqQORTcShLwrm6W+qjH4geHOfqlAFi4UQ7z83mSJGu8ESWHlCoumxHgFq+hUpTydUKeg
 rZ4fqcduRqtcm2jL5hdhLZ2AVzoDOwac1K+2TS/jByrygRFVreN0jtOchbbQ7XjHyM4E
 Vquw==
X-Gm-Message-State: APjAAAWuUlPHb2A4RuVzalFaBjpRmG10QX1VLbaT9HGISMBWTDFixdRR
 qnif1zkedy4OSHsFLORij/RZgWhiAWtfUF09hoyLnhK1XLYq2uPD3QSmxUGd6EdWqCiQH1KEISm
 dQlu8ImT7qSzHqc4iSG7usxkuJir9tJXU
X-Received: by 2002:a92:8941:: with SMTP id n62mr7842856ild.20.1571373716852; 
 Thu, 17 Oct 2019 21:41:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyoJ/tH4b5jxVJp8nBGw2QY5zm9BMxuCAeD6/be5zL/8OGhFhhi/R6r6p196AViBR8ZnBWC9Q==
X-Received: by 2002:a92:8941:: with SMTP id n62mr7842836ild.20.1571373716551; 
 Thu, 17 Oct 2019 21:41:56 -0700 (PDT)
Received: from bee.dtc.umn.edu (cs-bee-u.cs.umn.edu. [128.101.106.63])
 by smtp.gmail.com with ESMTPSA id w68sm2042093ili.59.2019.10.17.21.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 21:41:55 -0700 (PDT)
From: Kangjie Lu <kjlu@umn.edu>
To: kjlu@umn.edu
Subject: [PATCH] drm/gma500: fix memory disclosures due to uninitialized bytes
Date: Thu, 17 Oct 2019 23:41:50 -0500
Message-Id: <20191018044150.1899-1-kjlu@umn.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=KZJ0qgGHHAivbnxIOZfhWtlIHuWG04Vj3FxHQ3w/GEE=;
 b=LNjzhGzWitDO6Aa3bHfiAIwrG2rfKBT+UuuKAqLWwQm9ZoUQBg/dJQlS+sbtMORRxa
 QLu+0EGyNHvfahcj4E5lZBPcYiQeACpKJETL3bb1hsWZjgcDjONw8wofFojapCsbneaC
 ULB9gI3Il9/kfr5+o8P39xuoixmebvksqeWje76HFyiQ0g0Br6H8VZykRZcOqRaTNOIG
 h7qRv1ptesw4P5E4PaW+nlmq9splbvENohVJpFPRat3KB2/gZxXc4o+BG3oGInvbnQJ0
 lmcGmT4wOWpSiJoR8UlRP3zZYkYoGllHW7vJor/uZZRincMS4LUiDd2Pb6ljf1C34SM8
 H1dw==
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

ImNsb2NrIiBtYXkgYmUgY29waWVkIHRvICJiZXN0X2Nsb2NrIi4gSW5pdGlhbGl6aW5nIGJlc3Rf
Y2xvY2sKaXMgbm90IHN1ZmZpY2llbnQuIFRoZSBmaXggaW5pdGlhbGl6ZXMgY2xvY2sgYXMgd2Vs
bCB0byBhdm9pZAptZW1vcnkgZGlzY2xvc3VyZXMgYW5kIGluZm9ybWFpdG9uIGxlYWtzLgoKU2ln
bmVkLW9mZi1ieTogS2FuZ2ppZSBMdSA8a2psdUB1bW4uZWR1PgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvb2FrdHJhaWxfY3J0Yy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfY3J0
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9jcnRjLmMKaW5kZXggMTY3YzEw
NzY3ZGQ0Li45MDBlNTQ5OTI0OWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAv
b2FrdHJhaWxfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfY3J0
Yy5jCkBAIC0xMjksNiArMTI5LDcgQEAgc3RhdGljIGJvb2wgbXJzdF9zZHZvX2ZpbmRfYmVzdF9w
bGwoY29uc3Qgc3RydWN0IGdtYV9saW1pdF90ICpsaW1pdCwKIAlzMzIgZnJlcV9lcnJvciwgbWlu
X2Vycm9yID0gMTAwMDAwOwogCiAJbWVtc2V0KGJlc3RfY2xvY2ssIDAsIHNpemVvZigqYmVzdF9j
bG9jaykpOworCW1lbXNldCgmY2xvY2ssIDAsIHNpemVvZihjbG9jaykpOwogCiAJZm9yIChjbG9j
ay5tID0gbGltaXQtPm0ubWluOyBjbG9jay5tIDw9IGxpbWl0LT5tLm1heDsgY2xvY2subSsrKSB7
CiAJCWZvciAoY2xvY2subiA9IGxpbWl0LT5uLm1pbjsgY2xvY2subiA8PSBsaW1pdC0+bi5tYXg7
CkBAIC0xODUsNiArMTg2LDcgQEAgc3RhdGljIGJvb2wgbXJzdF9sdmRzX2ZpbmRfYmVzdF9wbGwo
Y29uc3Qgc3RydWN0IGdtYV9saW1pdF90ICpsaW1pdCwKIAlpbnQgZXJyID0gdGFyZ2V0OwogCiAJ
bWVtc2V0KGJlc3RfY2xvY2ssIDAsIHNpemVvZigqYmVzdF9jbG9jaykpOworCW1lbXNldCgmY2xv
Y2ssIDAsIHNpemVvZihjbG9jaykpOwogCiAJZm9yIChjbG9jay5tID0gbGltaXQtPm0ubWluOyBj
bG9jay5tIDw9IGxpbWl0LT5tLm1heDsgY2xvY2subSsrKSB7CiAJCWZvciAoY2xvY2sucDEgPSBs
aW1pdC0+cDEubWluOyBjbG9jay5wMSA8PSBsaW1pdC0+cDEubWF4OwotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
