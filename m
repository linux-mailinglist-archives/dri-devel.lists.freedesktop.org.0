Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DECE2EAC25
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 14:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64706E10F;
	Tue,  5 Jan 2021 13:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDDC6E108;
 Tue,  5 Jan 2021 13:44:12 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m5so36178734wrx.9;
 Tue, 05 Jan 2021 05:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4uTZYuSmoeTiRu33iHMIlMouIHVooiXnKLwMhzI2plk=;
 b=YLVW6yaz4t2tTxAlT7N9+bLCR18/eFsvPFiFFdhF+38gMYzmjR9uWvyDt1FUjqrDad
 qZuW6FjBp/2HVZt8h4Fkkefp2Z11UWNrqrHGBwOe2dldv5E7bWG1qBlrMggcCpneniSF
 /pQvB4U1bPCcEXQRT2jBVYhggUF+v299sxZxzraG6Fl0EJsbYU+VfOt7MpIXpzNYrDBs
 r99ADcF1Kce/XRWO4273uOPAFoB5DQSeRzn4tONPK/02cyNvLmrTaQMLL3euKvHHBvBw
 sjh8tDthm968s1bUEtRspTUxVY5XpkYhPeoqHgPbqSvqo9qAAiT9EY2KgbPPQv59svE/
 4u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4uTZYuSmoeTiRu33iHMIlMouIHVooiXnKLwMhzI2plk=;
 b=iQZ8H2fWLJfu6srEAoM3g4ApU8DPdWK0tR8WDzegLcwi2jB2OJcmba0NUfwl27xrQo
 a7vah8Jg3K3XCddAzzYHTfHT8YOsqk/ek9Wl+iE4l4IwZg8d/kzEURYP7tJnc+lPGbCj
 0HWvdrWre8jB3VP3YmmPzBZfdO99GR+s/3rSsR+lT9akb6YxzbGPWMllplsz7cTrzunT
 BGTcfbXXkI1SfJvr8Qb66E77xeBAc9ErklnzwgkECw920GfiNi3ZFO+FMsDrfLNTJI+P
 NCucCY3iKDumbmaBhYJvUO0G+vUh2MKVkdYnNcxUCorTMKJ7woR9asS9mCIFbHNnXIT6
 i27A==
X-Gm-Message-State: AOAM531IN6x3QqiNPUmL1UE8N+9KINiJ12pVN99ZqpD3vnnb3lkoCrWk
 uYm1s4vAQob1gOXZyNfxDXLq3cvpqFU=
X-Google-Smtp-Source: ABdhPJz5gt/7ovBihzHlh30pzyKlkA2e3I28sjv3mvtpk/2hFlTNoNgDQDk+RVB3ef2kI+uYHLqrBA==
X-Received: by 2002:adf:f344:: with SMTP id e4mr85434282wrp.25.1609854251240; 
 Tue, 05 Jan 2021 05:44:11 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3137:60b9:8d8f:7f55])
 by smtp.gmail.com with ESMTPSA id l20sm102191243wrh.82.2021.01.05.05.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 05:44:10 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bhelgaas@google.com
Subject: [PATCH 3/4] amdgpu: resize BAR0 to the maximum available size,
 even if it doesn't cover VRAM (v6)
Date: Tue,  5 Jan 2021 14:44:03 +0100
Message-Id: <20210105134404.1545-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105134404.1545-1-christian.koenig@amd.com>
References: <20210105134404.1545-1-christian.koenig@amd.com>
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
Cc: devspam@moreofthesa.me.uk, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFycmVuIFNhbHQgPGRldnNwYW1AbW9yZW9mdGhlc2EubWUudWs+CgpUaGlzIGFsbG93
cyBCQVIwIHJlc2l6aW5nIHRvIGJlIGRvbmUgZm9yIGNhcmRzIHdoaWNoIGRvbid0IGFkdmVydGlz
ZSBzdXBwb3J0CmZvciBhIHNpemUgbGFyZ2UgZW5vdWdoIHRvIGNvdmVyIHRoZSBWUkFNIGJ1dCB3
aGljaCBkbyBhZHZlcnRpc2UgYXQgbGVhc3QKb25lIHNpemUgbGFyZ2VyIHRoYW4gdGhlIGRlZmF1
bHQuIEZvciBleGFtcGxlLCBteSBSWCA1NjAwIFhULCB3aGljaAphZHZlcnRpc2VzIDI1Nk1CLCA1
MTJNQiBhbmQgMUdCLgoKW3Y2XSAoY2hrKSBSZWR1Y2UgdG8gb25seSB0aGUgbmVjZXNzYXJ5IGZ1
bmN0aW9uYWxpdHkKClt2NV0gRHJvcCB0aGUgcmV0cnkgbG9vcOKApgoKW3Y0XSBVc2UgYml0IG9w
cyB0byBmaW5kIHNpemVzIHRvIHRyeS4KClt2M10gRG9uJ3QgdXNlIHBjaV9yZWJhcl9nZXRfY3Vy
cmVudF9zaXplKCkuCgpbdjJdIFJld3JpdHRlbiB0byB1c2UgUENJIGhlbHBlciBmdW5jdGlvbnM7
IHNvbWUgZXh0cmEgbG9nIHRleHQuCgpTaWduZWQtb2ZmLWJ5OiBEYXJyZW4gU2FsdCA8ZGV2c3Bh
bUBtb3Jlb2Z0aGVzYS5tZS51az4KU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYyB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jCmluZGV4IDcwYWNkNjczZTNmMi4uZGE3ODc0NjE3NGY1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC0xMDg5LDcgKzEwODksNyBAQCB2b2lkIGFt
ZGdwdV9kZXZpY2Vfd2JfZnJlZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIHdiKQog
ICovCiBpbnQgYW1kZ3B1X2RldmljZV9yZXNpemVfZmJfYmFyKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogewotCXUzMiByYmFyX3NpemUgPSBwY2lfcmViYXJfYnl0ZXNfdG9fc2l6ZShhZGV2
LT5nbWMucmVhbF92cmFtX3NpemUpOworCWludCByYmFyX3NpemUgPSBwY2lfcmViYXJfYnl0ZXNf
dG9fc2l6ZShhZGV2LT5nbWMucmVhbF92cmFtX3NpemUpOwogCXN0cnVjdCBwY2lfYnVzICpyb290
OwogCXN0cnVjdCByZXNvdXJjZSAqcmVzOwogCXVuc2lnbmVkIGk7CkBAIC0xMTIwLDYgKzExMjAs
MTAgQEAgaW50IGFtZGdwdV9kZXZpY2VfcmVzaXplX2ZiX2JhcihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAlpZiAoIXJlcykKIAkJcmV0dXJuIDA7CiAKKwkvKiBMaW1pdCB0aGUgQkFSIHNp
emUgdG8gd2hhdCBpcyBhdmFpbGFibGUgKi8KKwlyYmFyX3NpemUgPSBtaW4oZmxzKHBjaV9yZWJh
cl9nZXRfcG9zc2libGVfc2l6ZXMoYWRldi0+cGRldiwgMCkpIC0gMSwKKwkJCXJiYXJfc2l6ZSk7
CisKIAkvKiBEaXNhYmxlIG1lbW9yeSBkZWNvZGluZyB3aGlsZSB3ZSBjaGFuZ2UgdGhlIEJBUiBh
ZGRyZXNzZXMgYW5kIHNpemUgKi8KIAlwY2lfcmVhZF9jb25maWdfd29yZChhZGV2LT5wZGV2LCBQ
Q0lfQ09NTUFORCwgJmNtZCk7CiAJcGNpX3dyaXRlX2NvbmZpZ193b3JkKGFkZXYtPnBkZXYsIFBD
SV9DT01NQU5ELAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
