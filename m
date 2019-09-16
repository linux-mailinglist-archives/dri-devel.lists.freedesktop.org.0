Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738FB3D3C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 17:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F1389807;
	Mon, 16 Sep 2019 15:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF0889177;
 Mon, 16 Sep 2019 15:04:42 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r9so346548edl.10;
 Mon, 16 Sep 2019 08:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RZY3aYY86vswV3DsXRQ0PWQCaaBbu+iIfN0NPOCttQA=;
 b=I1y/edW+6quIlM8jacDRMASYwSlS8Wu9QX5K9mNMrPAkcizzzAt44laVAr2po5W4+e
 mWF0X3CUwlQq/RnIYF6gHNHM6swrrYAwGdUGhIGT5SwvoLwjP0u4YlenOIwxC2/ORd7X
 iO/pAwAjAU6I3T8LL5lfCXAtBVajURTpiNEEasuhBp0VaxtELCIMztb95GrfAZYAygMO
 0z+IXacpzwJA1wTDHxMglUkDBtrsgiH3WTDXtXv52W8ZGQdRGTZq3nMDynrVgo3xD0XY
 0riAQkLaONagSATOhJxufPoNa5OxGfB67ApY/DvH925bplJjn+vPkpZO4Is1PEZ3cXyr
 qDPQ==
X-Gm-Message-State: APjAAAVOCfDqZvONZWiWwEiw3vQkc5Cbq8+IBHAdpmBMpZ4ax0Px51zL
 jOV7kdGk2a0CnzCehZu3FdE=
X-Google-Smtp-Source: APXvYqzOvpQMxA7hW6uhYAlHtab0KqcMkjyMUpQkYMJ3upTMDg7cRBZjk2h4QS4jlfppgNLZ2NJP6w==
X-Received: by 2002:a17:907:20eb:: with SMTP id
 rh11mr434580ejb.25.1568646280458; 
 Mon, 16 Sep 2019 08:04:40 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 60sm7199923edg.10.2019.09.16.08.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:04:39 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 11/11] arm64: tegra: Enable SMMU for GPU on Tegra186
Date: Mon, 16 Sep 2019 17:04:12 +0200
Message-Id: <20190916150412.10025-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RZY3aYY86vswV3DsXRQ0PWQCaaBbu+iIfN0NPOCttQA=;
 b=QwPkkJxO9Sp92CZsWFb0EAmAZ/YLG8AwPlHC5Ehaz0vUvvSN7lJbwqtX/k8dzz5CX1
 aXi8LAqwc9y8rB46A2LpLq7zOPtJ1X6c0EeUx7FZBH6NZKaClmWx2ruM/f1FDnPqKZuC
 q4167pfy2r4f087ysHpkEg+dej3wbNTm8/E9vNDieNVtP2NhiND8d8DKn7ZomcgQ6lz4
 9Cq8q//b2/HKVkG+TrNbv0sZ8oYOxSrWbrz38TLvi90fn6U4dV/LWn0OQX9nudoA8A4s
 9Itx4M46PCAhb5YZ5tRz/j6+QFr2oGWMBMK2RIe+UgbB0VkQNMagDIJYKkwaQBHWgRXH
 AEVA==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBHUFUgaGFzIGEg
Y29ubmVjdGlvbiB0byB0aGUgQVJNIFNNTVUgZm91bmQgb24gVGVncmExODYsIHdoaWNoIGNhbiBi
ZQp1c2VkIHRvIHN1cHBvcnQgbGFyZ2UgcGFnZXMuIE1ha2Ugc3VyZSB0aGUgR1BVIGlzIGF0dGFj
aGVkIHRvIHRoZSBTTU1VCnRvIHRha2UgYWR2YW50YWdlIG9mIGl0cyBjYXBhYmlsaXRpZXMuCgpT
aWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTg2LmR0c2kgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbnZp
ZGlhL3RlZ3JhMTg2LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL252aWRpYS90ZWdyYTE4Ni5k
dHNpCmluZGV4IDQ3Y2Q4MzFmY2Y0NC4uMTcxZmQ0ZGZhNThkIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL252aWRpYS90ZWdyYTE4Ni5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbnZpZGlhL3RlZ3JhMTg2LmR0c2kKQEAgLTExNzIsNiArMTE3Miw3IEBACiAJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7CiAKIAkJcG93ZXItZG9tYWlucyA9IDwmYnBtcCBURUdSQTE4Nl9QT1dFUl9E
T01BSU5fR1BVPjsKKwkJaW9tbXVzID0gPCZzbW11IFRFR1JBMTg2X1NJRF9HUFU+OwogCX07CiAK
IAlzeXNyYW1AMzAwMDAwMDAgewotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
