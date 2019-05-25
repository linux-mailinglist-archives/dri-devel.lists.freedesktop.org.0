Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 700752B400
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2028F89A62;
	Mon, 27 May 2019 12:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBAF6E169;
 Sat, 25 May 2019 17:54:32 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id c6so7184328pfa.10;
 Sat, 25 May 2019 10:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=DEpuhQuBsGwiHo827HWHBFzX5NQZPFzzYlkuA72/SiA=;
 b=Zru8cnvPNMaUh88cjLGbE0lr5JB3GY/V2YU9PA5s51r8KMQV+rjdKYAQabHcgIg2vT
 FUfpTry9/gi9Vja6I+OAofMMO0upwQqbeJLA31ll7V+Yd+GpLQnPiMWtNak25Tl3d/C3
 Aud9/JMFXUp8YfzOkkAYqtziFv2A3KSUetCXLKUz1t+ESmYS9WpsE3JCzPMn+kI4UsCF
 H/FiOVf8eeFOIdzdg89oRjFu5GANIRbboCb2hGyrwxGDgKwD9bycsognYJvy26MVxdPU
 nAJJCpZjGibAcfGfpoWJ5VP/5pAdGa/7loC6nO+ASz4i5AYlz0etZ8MXmXEmAe88GSfY
 LlHQ==
X-Gm-Message-State: APjAAAV8EOzxK0U2vHiqnNwBceAeblNXnM2FbD9LRZrPjIUBMyWj5dgq
 CE/usSVx4YPRH2wsl36BAmo=
X-Google-Smtp-Source: APXvYqzAWlK2XPpvnHqjfejsJLvRg/XDSSsH8LlOZKQ8J+6/TfVO6G+fL/q7U6zjHi3hCRZ4ZIuOLQ==
X-Received: by 2002:a63:2f47:: with SMTP id v68mr28837402pgv.251.1558806871591; 
 Sat, 25 May 2019 10:54:31 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
 by smtp.gmail.com with ESMTPSA id p90sm16977127pfa.18.2019.05.25.10.54.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 10:54:29 -0700 (PDT)
Date: Sat, 25 May 2019 23:24:23 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Charlene Liu <charlene.liu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Ken Chalmers <ken.chalmers@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: fix  possible condition with no effect (if
 == else)
Message-ID: <20190525175423.GA27834@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=DEpuhQuBsGwiHo827HWHBFzX5NQZPFzzYlkuA72/SiA=;
 b=WjLdOQG9mrCp0ELu/bt3O7UbVIAvTh0Vx7MQoek6qs57GO34xUppozMYwVWZmRFIwT
 G5iGj3R3oNgfcluvs8nU/wSndGgci99HUZxy8+HkvbtYyDpHGCjuEebjCP8qncM+xKgF
 xDW+dw2o1phUBlNvLqik6tZMYK3B0ORF6g/NFvFJXgMaUFZLv28GTtjhPmeLLgE5LMPd
 iDFiFUGCrEY4iSjXKSJ4lDquw57Dp30z62mB0tFiefEICYvHXaw6SiOaMuBwmtwrBO0U
 19B1NlFFf50I5VPVxRePkMRGabg3CBp0upUgpaqdsP6qxFPRjA9RmRLaWx+pW1mBFOY7
 F6GA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zml4IGJlbG93IHdhcm5pbmcgcmVwb3J0ZWQgYnkgY29jY2ljaGVjawoKLi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmM6MTM2NDozLTU6IFdBUk5JTkc6CnBv
c3NpYmxlIGNvbmRpdGlvbiB3aXRoIG5vIGVmZmVjdCAoaWYgPT0gZWxzZSkKClNpZ25lZC1vZmYt
Ynk6IEhhcmlwcmFzYWQgS2VsYW0gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyB8IDggKy0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMKaW5kZXgg
ZjNhYTdiNS4uMDcwNmNlZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NhbGNzL2RjZV9jYWxjcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jYWxjcy9kY2VfY2FsY3MuYwpAQCAtMTM2MSwxMyArMTM2MSw3IEBAIHN0YXRpYyB2b2lkIGNh
bGN1bGF0ZV9iYW5kd2lkdGgoCiAJLyppZiBzdHV0dGVyIGFuZCBkcmFtIGNsb2NrIHN0YXRlIGNo
YW5nZSBhcmUgZ2F0ZWQgYmVmb3JlIGN1cnNvciB0aGVuIHRoZSBjdXJzb3IgbGF0ZW5jeSBoaWRp
bmcgZG9lcyBub3QgbGltaXQgc3R1dHRlciBvciBkcmFtIGNsb2NrIHN0YXRlIGNoYW5nZSovCiAJ
Zm9yIChpID0gMDsgaSA8PSBtYXhpbXVtX251bWJlcl9vZl9zdXJmYWNlcyAtIDE7IGkrKykgewog
CQlpZiAoZGF0YS0+ZW5hYmxlW2ldKSB7Ci0JCQlpZiAoZGNlaXAtPmdyYXBoaWNzX2xiX25vZG93
bnNjYWxpbmdfbXVsdGlfbGluZV9wcmVmZXRjaGluZyA9PSAxKSB7Ci0JCQkJZGF0YS0+bWF4aW11
bV9sYXRlbmN5X2hpZGluZ1tpXSA9IGJ3X2FkZChkYXRhLT5taW5pbXVtX2xhdGVuY3lfaGlkaW5n
W2ldLCBid19tdWwoYndfZnJjX3RvX2ZpeGVkKDUsIDEwKSwgZGF0YS0+dG90YWxfZG1pZm1jX3Vy
Z2VudF9sYXRlbmN5KSk7Ci0JCQl9Ci0JCQllbHNlIHsKLQkJCQkvKm1heGltdW1fbGF0ZW5jeV9o
aWRpbmcoaSkgPSBtaW5pbXVtX2xhdGVuY3lfaGlkaW5nKGkpICsgMSAvIHZzcihpKSAqIGhfdG90
YWwoaSkgLyBwaXhlbF9yYXRlKGkpICsgMC41ICogdG90YWxfZG1pZm1jX3VyZ2VudF9sYXRlbmN5
Ki8KLQkJCQlkYXRhLT5tYXhpbXVtX2xhdGVuY3lfaGlkaW5nW2ldID0gYndfYWRkKGRhdGEtPm1p
bmltdW1fbGF0ZW5jeV9oaWRpbmdbaV0sIGJ3X211bChid19mcmNfdG9fZml4ZWQoNSwgMTApLCBk
YXRhLT50b3RhbF9kbWlmbWNfdXJnZW50X2xhdGVuY3kpKTsKLQkJCX0KKwkJCWRhdGEtPm1heGlt
dW1fbGF0ZW5jeV9oaWRpbmdbaV0gPSBid19hZGQoZGF0YS0+bWluaW11bV9sYXRlbmN5X2hpZGlu
Z1tpXSwgYndfbXVsKGJ3X2ZyY190b19maXhlZCg1LCAxMCksIGRhdGEtPnRvdGFsX2RtaWZtY191
cmdlbnRfbGF0ZW5jeSkpOwogCQkJZGF0YS0+bWF4aW11bV9sYXRlbmN5X2hpZGluZ193aXRoX2N1
cnNvcltpXSA9IGJ3X21pbjIoZGF0YS0+bWF4aW11bV9sYXRlbmN5X2hpZGluZ1tpXSwgZGF0YS0+
Y3Vyc29yX2xhdGVuY3lfaGlkaW5nW2ldKTsKIAkJfQogCX0KLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
