Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5446A109AD9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 10:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBC289D64;
	Tue, 26 Nov 2019 09:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF9C89D64
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 09:14:23 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f129so2376682wmf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 01:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ihuDbTiRhMB9BQRppfpaD8drxLMhNsgPSX/aj6zLSgA=;
 b=Cnqplp9RugS6/+kFoE5P9pkGx8Z98rYU08k9a+BxfHWROo26x4DENQ3QRfSNokvaMa
 tc9jRwGDNH62DhdoCyJCcpDTdOL8owP3CXPFmaHRZqMVMRsJmCixUTevxXpi26aJ9auK
 4vSsI+yVOKVh93hMGf+Fx3dj31tpqYaAuZaiepazIGft4iFzTTb6gOh4HiQWq+EePnL8
 8wDmNW4Opf6y5ZaYlu37Uo/HpT3E3LwrXrcVgiRD5QHT0HusVJqfpx38ZLgz2zCjMo13
 zQqjX5czrWb7IOvKoQYrSyiDKLtjPyScJk/4p2e7HYorwhF9qIl5FLluRQzfC/DnwJlb
 Z4uQ==
X-Gm-Message-State: APjAAAXtIe18XuuAyMEfOWywLxqST/02araDaRUG2Hf8dtuYFtDYR+fl
 OMQrm3sWusNAoKa6VwYNn+mkrfe2x4U=
X-Google-Smtp-Source: APXvYqy1MTJRwkyKV5ta+9w5dVc6Tx6thg9nt2NJp4lZSAEvvFJm86S68cvFAELAlq/v71UI69xlYQ==
X-Received: by 2002:a7b:c006:: with SMTP id c6mr3302904wmb.52.1574759661689;
 Tue, 26 Nov 2019 01:14:21 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j17sm14167450wrr.75.2019.11.26.01.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 01:14:20 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/fourcc: Fill out all block sizes for P10/12/16
Date: Tue, 26 Nov 2019 10:14:13 +0100
Message-Id: <20191126091414.226070-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ihuDbTiRhMB9BQRppfpaD8drxLMhNsgPSX/aj6zLSgA=;
 b=Fs/YtiVbKpVU0IOAxS43Uc3bYhl8NFbWLO/x1cV7kSUIz+emiVUr13SOB23Fr0bLeA
 qkqc5KwB1rvHj6fQz+L733zxbUsrgtPkHTUIpVF0ugRtLn+HFk3oQSdV5PeBxGXQDwDs
 +WqfMkIbf1dwv/coze4CvLZOXTlDxT4TdsHhw=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Randy Li <ayaka@soulik.info>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Ayan Kumar Halder <ayan.halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MCBtZWFucyAxIGFzIHRoZSBkZWZhdWx0LCBidXQgaXQncyBtaWdodHkgY29uZnVzaW5nIGlmIHRo
ZSBibG9jayBzaXplCmZvciB0aGUgZmlyc3QgcGxhbmUgaXMgc3BlbGxlZCBvdXQgZXhwbGljaXRs
eSwgYnV0IG5vdCBmb3IgdGhlIDJuZApwbGFuZS4KCk5vIGNjOiBzdGFibGUgYmVjYXVzZSB0aGlz
IGlzIGp1c3QgY29uZnVzaW9uLCBidXQgMCBmdW5jdGlvbmFsIGlzc3VlLgoKRml4ZXM6IDA1Zjhi
YzgyZmM0MiAoImRybS9mb3VyY2M6IEFkZCBuZXcgUDAxMCwgUDAxNiB2aWRlbyBmb3JtYXQiKQpD
YzogRGFuaWVsIFN0b25lIDxkYW5pZWxAZm9vaXNoYmFyLm9yZz4KQ2M6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBSYW5keSBMaSA8YXlha2FAc291
bGlrLmluZm8+CkNjOiBDbGludCBUYXlsb3IgPGNsaW50b24uYS50YXlsb3JAaW50ZWwuY29tPgpD
YzogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4uaGFsZGVyQGFybS5jb20+CkNjOiBOZWlsIEFybXN0
cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4K
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZm91cmNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jCmluZGV4
IGM2MzAwNjRjY2Y0MS4uZmU3OWNlODU3YzhhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZvdXJjYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKQEAgLTI1Mywx
MyArMjUzLDEzIEBAIGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKl9fZHJtX2Zvcm1hdF9p
bmZvKHUzMiBmb3JtYXQpCiAJCSAgLmNoYXJfcGVyX2Jsb2NrID0geyA4LCAwLCAwIH0sIC5ibG9j
a193ID0geyAyLCAwLCAwIH0sIC5ibG9ja19oID0geyAyLCAwLCAwIH0sCiAJCSAgLmhzdWIgPSAy
LCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlIH0sCiAJCXsgLmZvcm1hdCA9IERSTV9GT1JNQVRf
UDAxMCwgICAgICAgICAgICAuZGVwdGggPSAwLCAgLm51bV9wbGFuZXMgPSAyLAotCQkgIC5jaGFy
X3Blcl9ibG9jayA9IHsgMiwgNCwgMCB9LCAuYmxvY2tfdyA9IHsgMSwgMCwgMCB9LCAuYmxvY2tf
aCA9IHsgMSwgMCwgMCB9LAorCQkgIC5jaGFyX3Blcl9ibG9jayA9IHsgMiwgNCwgMCB9LCAuYmxv
Y2tfdyA9IHsgMSwgMSwgMCB9LCAuYmxvY2tfaCA9IHsgMSwgMSwgMCB9LAogCQkgIC5oc3ViID0g
MiwgLnZzdWIgPSAyLCAuaXNfeXV2ID0gdHJ1ZX0sCiAJCXsgLmZvcm1hdCA9IERSTV9GT1JNQVRf
UDAxMiwJCS5kZXB0aCA9IDAsICAubnVtX3BsYW5lcyA9IDIsCi0JCSAgLmNoYXJfcGVyX2Jsb2Nr
ID0geyAyLCA0LCAwIH0sIC5ibG9ja193ID0geyAxLCAwLCAwIH0sIC5ibG9ja19oID0geyAxLCAw
LCAwIH0sCisJCSAgLmNoYXJfcGVyX2Jsb2NrID0geyAyLCA0LCAwIH0sIC5ibG9ja193ID0geyAx
LCAxLCAwIH0sIC5ibG9ja19oID0geyAxLCAxLCAwIH0sCiAJCSAgIC5oc3ViID0gMiwgLnZzdWIg
PSAyLCAuaXNfeXV2ID0gdHJ1ZX0sCiAJCXsgLmZvcm1hdCA9IERSTV9GT1JNQVRfUDAxNiwJCS5k
ZXB0aCA9IDAsICAubnVtX3BsYW5lcyA9IDIsCi0JCSAgLmNoYXJfcGVyX2Jsb2NrID0geyAyLCA0
LCAwIH0sIC5ibG9ja193ID0geyAxLCAwLCAwIH0sIC5ibG9ja19oID0geyAxLCAwLCAwIH0sCisJ
CSAgLmNoYXJfcGVyX2Jsb2NrID0geyAyLCA0LCAwIH0sIC5ibG9ja193ID0geyAxLCAxLCAwIH0s
IC5ibG9ja19oID0geyAxLCAxLCAwIH0sCiAJCSAgLmhzdWIgPSAyLCAudnN1YiA9IDIsIC5pc195
dXYgPSB0cnVlfSwKIAkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9QMjEwLAkJLmRlcHRoID0gMCwK
IAkJICAubnVtX3BsYW5lcyA9IDIsIC5jaGFyX3Blcl9ibG9jayA9IHsgMiwgNCwgMCB9LAotLSAK
Mi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
