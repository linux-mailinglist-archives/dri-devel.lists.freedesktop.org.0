Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290B02A740
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 00:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA8A6E192;
	Sat, 25 May 2019 22:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1365F6E180;
 Sat, 25 May 2019 22:41:54 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id o2so12512749qkb.3;
 Sat, 25 May 2019 15:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+yKyBBW3VlIp68lvhpwOuf/tvlXYJWdEHBcOUHyH3L8=;
 b=rUlCnFAGfLN7FIzrMZh8mpurk748zCLQaa1V43tVlgBmTGcd4O6XPSlWDrQ7s4JJuJ
 nptCij3lBBS2uMoHrhZrKJGk7FNMXLcZH1Odw/OaNXrRMFgSSoH8oBT8C39fhnfE1QzL
 vuOe7NbXQw78b2PSke02OCQY2BMqOmQgyahUKAkgKFGNX3nRX+afl4kF/1d4RCma1PWV
 W8pzaJ6emPg4TAqeZRisVq3eo45h0I0uAgfLLGNHZvvHlEWJTmXVfBSbeXscHrrmN+WB
 YwPzsA0qP3BeMW2LUicGGxFxNU0FW7PcWxG++SQLkKKcL0S/vmlHmTmnBJL5LRwlBcl6
 ybhQ==
X-Gm-Message-State: APjAAAVQQZjOKBLyhS4N5wURVoolUQ/1y9TopbYoX/stPEpBBNYXitO7
 CejYDqoAMN0Sks8Dw+kI9lw=
X-Google-Smtp-Source: APXvYqyR2hJBL8RrfPHWNAlmBTd4V3743jcZhSsXO0CI3/1EpoVynqfPX/fV99SqKSTPL9dmAW8jrw==
X-Received: by 2002:a05:620a:624:: with SMTP id 4mr5068222qkv.15.1558824113184; 
 Sat, 25 May 2019 15:41:53 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id 102sm1576876qte.52.2019.05.25.15.41.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 15:41:52 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: bskeggs@redhat.com
Subject: [PATCH 1/2] drm/nouveau/disp/nv50-: force scaler for any non-default
 LVDS/eDP modes
Date: Sat, 25 May 2019 18:41:48 -0400
Message-Id: <20190525224149.4652-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+yKyBBW3VlIp68lvhpwOuf/tvlXYJWdEHBcOUHyH3L8=;
 b=Ug8Rqv0ud7UW/ILBmlrQnFX1docQ0cd0d+jL2kC7mi485joZSK9GPXL0iOUiPXstmj
 iVU4B8km4KyCH9eYA+hoXK6q1km7wsUe1CNKNsTr7dpJcdY0b8Ks8WukLXkb7or1Hn85
 igcCWyxUlFGsy7iYpJYX/ezG0SSdJvAF35cJ/3OqprhCdlosmktgnCrGLGkI84NEQIhw
 wD30SaeNOTfLdDkkSs08M3b7o8oVie4JVOaG2eKb9olnMqAwZrT7xc9KJ94wCWo5HXuY
 ViKoAXvER04DghJTEnbtgkFA2ZRDY03ES1zIVL92C4aivF9dkAbMGz07+5Yv2lsptNmV
 ntDw==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGlnaGVyIGxheWVycyB0ZW5kIHRvIGFkZCBhIGxvdCBvZiBtb2RlcyBub3QgYWN0dWFsbHkgaW4g
dGhlIEVESUQsIHN1Y2gKYXMgdGhlIHN0YW5kYXJkIERNVCBtb2Rlcy4gQ2hhbmdpbmcgdGhpcyB3
b3VsZCBiZSBleHRyZW1lbHkgaW50cnVzaXZlIHRvCmV2ZXJ5b25lLCBzbyBqdXN0IGZvcmNlIHRo
ZSBzY2FsZXIgbW9yZSBvZnRlbi4gVGhlcmUgYXJlIG5vIHByYWN0aWNhbApjYXNlcyB3ZSdyZSBh
d2FyZSBvZiB3aGVyZSBhIExWRFMvZURQIHBhbmVsIGhhcyBtdWx0aXBsZSByZXNvbHV0aW9ucwpl
eHBvc2VkLCBhbmQgaTkxNSBhbHJlYWR5IGRvZXMgaXQgdGhpcyB3YXkuCgpCdWd6aWxsYTogaHR0
cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEwNjYwClNpZ25lZC1v
ZmYtYnk6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4KLS0tCgpVbnRlc3RlZCBm
b3Igbm93LCBob3BpbmcgdGhhdCB0aGUgYnVnemlsbGEgZmlsZXIgd2lsbCB0ZXN0IGl0IG91dC4g
U2VlbXMKb2J2aW91cyB0aG91Z2guCgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAv
ZGlzcC5jIHwgOSArKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52
NTAvZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCmluZGV4
IDEzNDcwMWE4MzdjOC4uZWY4ZDdhNzE1NjRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvZGlzcC5jCkBAIC0zMjIsOCArMzIyLDEzIEBAIG52NTBfb3V0cF9hdG9taWNfY2hlY2tf
dmlldyhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJCXN3aXRjaCAoY29ubmVjdG9yLT5j
b25uZWN0b3JfdHlwZSkgewogCQljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTOgogCQljYXNl
IERSTV9NT0RFX0NPTk5FQ1RPUl9lRFA6Ci0JCQkvKiBGb3JjZSB1c2Ugb2Ygc2NhbGVyIGZvciBu
b24tRURJRCBtb2Rlcy4gKi8KLQkJCWlmIChhZGp1c3RlZF9tb2RlLT50eXBlICYgRFJNX01PREVf
VFlQRV9EUklWRVIpCisJCQkvKiBEb24ndCBmb3JjZSBzY2FsZXIgZm9yIEVESUQgbW9kZXMgd2l0
aAorCQkJICogc2FtZSBzaXplIGFzIHRoZSBuYXRpdmUgb25lIChlLmcuIGRpZmZlcmVudAorCQkJ
ICogcmVmcmVzaCByYXRlKQorCQkJICovCisJCQlpZiAoYWRqdXN0ZWRfbW9kZS0+aGRpc3BsYXkg
PT0gbmF0aXZlX21vZGUtPmhkaXNwbGF5ICYmCisJCQkgICAgYWRqdXN0ZWRfbW9kZS0+dmRpc3Bs
YXkgPT0gbmF0aXZlX21vZGUtPnZkaXNwbGF5ICYmCisJCQkgICAgYWRqdXN0ZWRfbW9kZS0+dHlw
ZSAmIERSTV9NT0RFX1RZUEVfRFJJVkVSKQogCQkJCWJyZWFrOwogCQkJbW9kZSA9IG5hdGl2ZV9t
b2RlOwogCQkJYXN5Yy0+c2NhbGVyLmZ1bGwgPSB0cnVlOwotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
