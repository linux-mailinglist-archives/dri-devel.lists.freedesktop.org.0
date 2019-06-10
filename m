Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10783BE34
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 23:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9667E8912B;
	Mon, 10 Jun 2019 21:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB178912B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 21:18:17 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id j2so6006373pfe.6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 14:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m0QdMbKNLVs0T8bKlIwsAC6CTJBWav9NlL0ckO7DwlA=;
 b=Zx4XFQGpEHKNqFDcqy0FboUe3ayoh3qAkXA2ElaibvvKoBvXq+UDZEHR01aNgEaZkr
 0OxvkfKts2NPaqyXH/WE7vY8uYyp6h5JN3Bfi8xMfR0ri2Iek/Bn4qEI8ra/08BdczGa
 QuXw55S0zdHQ08O0h1pq7DtlHmzm0gtGrgjuQncouKXcaEc5mxKqNgfl0CkSGUhSN68B
 YkXG8STN9xYRlY/J1Hn/7MRCp7UC7LoejTsb1wHVse3Bo9NOS5Ec56nAYniS+U8XRVVK
 yUEK0kgSrDibXjV2AEpiIMW3jUkU0/QhsTy6/PaZzqSlt3KS0+lAX7D1jzIEqhN+++ls
 euAg==
X-Gm-Message-State: APjAAAXldGm4amazjHl7ghQ3sKroPgfskYNk8xOmyVfg276x5drdWS95
 xWh33+fLzg8bMsRBBT1dqL8XdQ==
X-Google-Smtp-Source: APXvYqwnWc4Rkv1HzFVoZjhnGWJK4oUgbCaO10e5+E+NJPsLfANZDbIWyiAzXN7RiRLG8EjciU0zmg==
X-Received: by 2002:a62:5c84:: with SMTP id
 q126mr50065148pfb.247.1560201497375; 
 Mon, 10 Jun 2019 14:18:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id p43sm427645pjp.4.2019.06.10.14.18.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 14:18:16 -0700 (PDT)
From: davidriley@chromium.org
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v2 0/4] drm/virtio: Ensure cached capset entries are valid
 before copying.
Date: Mon, 10 Jun 2019 14:18:06 -0700
Message-Id: <20190610211810.253227-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190605234423.11348-1-davidriley@chromium.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m0QdMbKNLVs0T8bKlIwsAC6CTJBWav9NlL0ckO7DwlA=;
 b=aXsWgQ9MISu7GVEUvnuqIx+fsqGjVQgLb+MZC1mkE1EKEL+Yw+ZR7o/wgZr5NWOk4A
 rFulQA7GH29PRBa/ecTRG3Ylp+faYI3nHqeOr5anX/cH/RqXZ+YLWjGA9z9XBIcv2mjy
 W2vI8mfwM7dgPo9C1Xs9WYcMsCWOWMGOU8GJM=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0ub3JnPgoKCnYyOiBVcGRhdGVk
IGJhcnJpZXJzLgoKRGF2aWQgUmlsZXkgKDQpOgogIGRybS92aXJ0aW86IEVuc3VyZSBjYWNoZWQg
Y2Fwc2V0IGVudHJpZXMgYXJlIHZhbGlkIGJlZm9yZSBjb3B5aW5nLgogIGRybS92aXJ0aW86IFdh
a2UgdXAgYWxsIHdhaXRlcnMgd2hlbiBjYXBzZXQgcmVzcG9uc2UgY29tZXMgaW4uCiAgZHJtL3Zp
cnRpbzogRml4IGNhY2hlIGVudHJ5IGNyZWF0aW9uIHJhY2UuCiAgZHJtL3ZpcnRpbzogQWRkIG1l
bW9yeSBiYXJyaWVycyBmb3IgY2Fwc2V0IGNhY2hlLgoKIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9pb2N0bC5jIHwgIDYgKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfdnEuYyAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKy0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDI4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wLnJjMi4zODMu
Z2Y0ZmJiZjMwYzItZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
