Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50FB215323
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60866E369;
	Mon,  6 Jul 2020 07:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671066E409
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f139so36540035wmf.5
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dEvAV3WC8gjOi8/db5UgonIFrnz7oP9M+fD1t4PD98A=;
 b=u895AsqnI++nW+ATsCD6BM53ooaKE7DfxiT5p2rrbYNdSijhTa2fQojXDTEIR7jYPF
 eDuyVN7haX4f7btL7FsYhYPvf+qtegwUjvvWWxU2a+3rlGHRajWGZnXWwldaiRQqcO/B
 6cwLMKgC4aChrc/tG8Z2LdbCLvM1pN4OOfieirBaNfQULsq97lAy3uSGUYI0zExf/EMg
 /wEbPOoKEenrXogE201dj1V7BdCaolqxGGhSyJ1iuPRWAyWxco+8y7t9Zu17E/orMXei
 NVGn3grc7xb4aECQK6M7VAlQ2ylCejDxl//pNzxVP/BRXfjaXSD9afGlg/5+0dsGcO4q
 PdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dEvAV3WC8gjOi8/db5UgonIFrnz7oP9M+fD1t4PD98A=;
 b=Gvjf+zuQgyi6RUyWMTPyEoYg7wDh+IdZbJ/t5TSjpTQ6lEtTq+YD2t2QNgEAcIwivQ
 Anb/G+TPlwMlWAh/NGEVZc7EsC9MP5pduGgqd+7tXILJXTnhM4vqZT/2DWlffPms7ue7
 sfVaVty9KQIwkh9Pfi/nZCNJkKH3ntGpKgR4rTbZSg/Ir8ZmgBezKudx53xlyN1rCidf
 huwx1x/GHbSHGJ2KQPLsMstIqIVniK6Mk7PzA4HB9rUFQOkiaAelyhCrJQfWyBoFCQRq
 /WLWv+IP8/bjifUrKICqqIBJprsnHdzDifoAm1fdu+8kpVnIKHqvKYqGb9xfPfpmZXIc
 Typw==
X-Gm-Message-State: AOAM532EFXwHECvm3dPX2+pwYxoFS80zie+xXAFxXLmF+sM4cgZYvKuQ
 HRxKFXTGCmDtYLK5EFZBbUA=
X-Google-Smtp-Source: ABdhPJxPyjX8E1s13IMa5BpsRPWoAPS1pYxySTMxZT0pEmMWQ3CcE7UVh59cuHmumr5QkfbuhHRayw==
X-Received: by 2002:a1c:18e:: with SMTP id 136mr10189686wmb.93.1593858352040; 
 Sat, 04 Jul 2020 03:25:52 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:51 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 09/14] drm/panfrost: dynamically alloc regulators
Date: Sat,  4 Jul 2020 12:25:30 +0200
Message-Id: <20200704102535.189647-10-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102535.189647-1-peron.clem@gmail.com>
References: <20200704102535.189647-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugd2lsbCBsYXRlciBpbnRyb2R1Y2UgcmVndWxhdG9ycyBtYW5hZ2VkIGJ5IE9QUC4KCk9ubHkg
YWxsb2MgcmVndWxhdG9ycyB3aGVuIGl0J3MgbmVlZGVkLiBUaGlzIGFsc28gaGVscCB1c2UKdG8g
cmVsZWFzZSB0aGUgcmVndWxhdG9ycyBvbmx5IHdoZW4gdGhleSBhcmUgYWxsb2NhdGVkLgoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KUmV2aWV3
ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIHwgMTQgKysrKysrKysrLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCB8ICAzICstLQogMiBmaWxl
cyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwppbmRleCA0NjRkYTE2NDYzOTguLjBiMGZi
NDVhZWU4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwpA
QCAtOTAsOSArOTAsMTEgQEAgc3RhdGljIGludCBwYW5mcm9zdF9yZWd1bGF0b3JfaW5pdChzdHJ1
Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIHsKIAlpbnQgcmV0LCBpOwogCi0JaWYgKFdBUk4o
cGZkZXYtPmNvbXAtPm51bV9zdXBwbGllcyA+IEFSUkFZX1NJWkUocGZkZXYtPnJlZ3VsYXRvcnMp
LAotCQkJIlRvbyBtYW55IHN1cHBsaWVzIGluIGNvbXBhdGlibGUgc3RydWN0dXJlLlxuIikpCi0J
CXJldHVybiAtRUlOVkFMOworCXBmZGV2LT5yZWd1bGF0b3JzID0gZGV2bV9rY2FsbG9jKHBmZGV2
LT5kZXYsIHBmZGV2LT5jb21wLT5udW1fc3VwcGxpZXMsCisJCQkJCSBzaXplb2YoKnBmZGV2LT5y
ZWd1bGF0b3JzKSwKKwkJCQkJIEdGUF9LRVJORUwpOworCWlmICghcGZkZXYtPnJlZ3VsYXRvcnMp
CisJCXJldHVybiAtRU5PTUVNOwogCiAJZm9yIChpID0gMDsgaSA8IHBmZGV2LT5jb21wLT5udW1f
c3VwcGxpZXM7IGkrKykKIAkJcGZkZXYtPnJlZ3VsYXRvcnNbaV0uc3VwcGx5ID0gcGZkZXYtPmNv
bXAtPnN1cHBseV9uYW1lc1tpXTsKQEAgLTExNyw4ICsxMTksMTAgQEAgc3RhdGljIGludCBwYW5m
cm9zdF9yZWd1bGF0b3JfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAogc3Rh
dGljIHZvaWQgcGFuZnJvc3RfcmVndWxhdG9yX2Zpbmkoc3RydWN0IHBhbmZyb3N0X2RldmljZSAq
cGZkZXYpCiB7Ci0JcmVndWxhdG9yX2J1bGtfZGlzYWJsZShwZmRldi0+Y29tcC0+bnVtX3N1cHBs
aWVzLAotCQkJcGZkZXYtPnJlZ3VsYXRvcnMpOworCWlmICghcGZkZXYtPnJlZ3VsYXRvcnMpCisJ
CXJldHVybjsKKworCXJlZ3VsYXRvcl9idWxrX2Rpc2FibGUocGZkZXYtPmNvbXAtPm51bV9zdXBw
bGllcywgcGZkZXYtPnJlZ3VsYXRvcnMpOwogfQogCiBzdGF0aWMgdm9pZCBwYW5mcm9zdF9wbV9k
b21haW5fZmluaShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaAppbmRleCAyZWZhNTljOWQxYzUuLjk1M2Y3NTM2
YTc3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rldmlj
ZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaApAQCAt
MjIsNyArMjIsNiBAQCBzdHJ1Y3QgcGFuZnJvc3Rfam9iOwogc3RydWN0IHBhbmZyb3N0X3BlcmZj
bnQ7CiAKICNkZWZpbmUgTlVNX0pPQl9TTE9UUyAzCi0jZGVmaW5lIE1BWF9SRUdVTEFUT1JTIDIK
ICNkZWZpbmUgTUFYX1BNX0RPTUFJTlMgMwogCiBzdHJ1Y3QgcGFuZnJvc3RfZmVhdHVyZXMgewpA
QCAtODEsNyArODAsNyBAQCBzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlIHsKIAl2b2lkIF9faW9tZW0g
KmlvbWVtOwogCXN0cnVjdCBjbGsgKmNsb2NrOwogCXN0cnVjdCBjbGsgKmJ1c19jbG9jazsKLQlz
dHJ1Y3QgcmVndWxhdG9yX2J1bGtfZGF0YSByZWd1bGF0b3JzW01BWF9SRUdVTEFUT1JTXTsKKwlz
dHJ1Y3QgcmVndWxhdG9yX2J1bGtfZGF0YSAqcmVndWxhdG9yczsKIAlzdHJ1Y3QgcmVzZXRfY29u
dHJvbCAqcnN0YzsKIAkvKiBwbV9kb21haW5zIGZvciBkZXZpY2VzIHdpdGggbW9yZSB0aGFuIG9u
ZS4gKi8KIAlzdHJ1Y3QgZGV2aWNlICpwbV9kb21haW5fZGV2c1tNQVhfUE1fRE9NQUlOU107Ci0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
