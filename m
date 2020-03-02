Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C271176755
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23ABF6E8D4;
	Mon,  2 Mar 2020 22:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E586A6E8E9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a5so861077wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjyBTLQHMzApL/+V+s8z3cSntFbpgC6vVvCg13TdqCo=;
 b=jNDm/p+PFQp/xfTMERDDI3Z4M9/Az25fj+09ErQ7RTjYrBQbfDPY1oFn2IQX8dnvsG
 vqFkz11QHrwDEeR4wQ7Fh44ISdGAsOIdHYhjtEE5CV+CDy/JRjGsPhUTCh9XiPbna92K
 /PWpdPZpq3EOn9+5r1rE/CTJ7vHXgB2pDSYXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjyBTLQHMzApL/+V+s8z3cSntFbpgC6vVvCg13TdqCo=;
 b=Xywi69PCidzzY34f7gdl+yIM6s2wx7dIP+BunwBv2Naa7Ej408ZnWE6S0psn8tdRWw
 4qnJh5K+RPT0sZ4iENDIhdgtTDugg5VyhL5IBoZ1FUzOFt6QCguDrV34BC4hSKQKMWuE
 FeBRq3c0a5iVWWdg3C9VkEZHPbL3qfXWN8CzrHjflqpGM9/MTwDou/M5FllD+vL1yArG
 BxD+nbpFFNwr+WB+UnDWrkSR+OJGFHd9RoRN/yDL9pZ2iejONNimKMb9R0h7lYqpDH8H
 Tlx+gCSyGhhdviicR4YIAHpbmGiiMGdsKiVqteipa1avoGIhfl+Vp6b7ekwmBBMyYZK8
 nO5A==
X-Gm-Message-State: ANhLgQ1WNaiN6xceYAB271u2BFaA/szFobMXg9nviUNSQLRUktRgoyqV
 OMdman1snuZL+4BnPxuoepOTb/ryf10=
X-Google-Smtp-Source: ADFU+vtbIvzrWzJnJg+9iWpC0Vv8AoBTGTvnciVQkAXpX38gg01p2R2bFi623LbXU2WTcNQwmeJ/qg==
X-Received: by 2002:a1c:2b81:: with SMTP id r123mr521258wmr.33.1583188061280; 
 Mon, 02 Mar 2020 14:27:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:40 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 49/51] drm/udl: Drop explicit drm_mode_config_cleanup call
Date: Mon,  2 Mar 2020 23:26:29 +0100
Message-Id: <20200302222631.3861340-50-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyByaWdodCBhYm92ZSB0aGUgZHJtX2Rldl9wdXQoKS4KClRoaXMgYWxsb3dzIHVzIHRvIGRl
bGV0ZSBhIGJpdCBvZiBvbmlvbiB1bndpbmRpbmcgaW4KdWRsX21vZGVzZXRfaW5pdCgpLgoKVGhp
cyBpcyBtYWRlIHBvc3NpYmxlIGJ5IGEgcHJlY2VlZGluZyBwYXRjaCB3aGljaCBhZGRlZCBhIGRy
bW1fCmNsZWFudXAgYWN0aW9uIHRvIGRybV9tb2RlX2NvbmZpZ19pbml0KCksIGhlbmNlIGFsbCB3
ZSBuZWVkIHRvIGRvIHRvCmVuc3VyZSB0aGF0IGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKCkgaXMg
cnVuIG9uIGZpbmFsIGRybV9kZXZpY2UKY2xlYW51cCBpcyBjaGVjayB0aGUgbmV3IGVycm9yIGNv
ZGUgZm9yIF9pbml0KCkuCgp2MjogRXhwbGFpbiB3aHkgdGhpcyBjbGVhbnVwIGlzIHBvc3NpYmxl
IChMYXVyZW50KS4KCnYzOiBVc2UgZHJtbV9tb2RlX2NvbmZpZ19pbml0KCkgZm9yIG1vcmUgY2xh
cml0eSAoU2FtLCBUaG9tYXMpCgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpD
YzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkFja2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0
LmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPgpDYzogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+CkNj
OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6ICJOb3JhbGYgVHLDuG5uZXMi
IDxub3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25p
eC5kZT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9kcnYuYyAgICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9k
cnYuaCAgICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgfCAyMSAr
KysrKystLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAx
NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jCmluZGV4IDhiNzhjMzU2YmViNS4uYjQ0
N2ZiMDUzZTc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYwpAQCAtMzcsNyArMzcsNiBAQCBERUZJTkVf
RFJNX0dFTV9GT1BTKHVkbF9kcml2ZXJfZm9wcyk7CiBzdGF0aWMgdm9pZCB1ZGxfZHJpdmVyX3Jl
bGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIHsKIAl1ZGxfZmluaShkZXYpOwotCXVkbF9t
b2Rlc2V0X2NsZWFudXAoZGV2KTsKIH0KIAogc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRyaXZl
ciA9IHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oIGIvZHJpdmVy
cy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgKaW5kZXggZTY3MjI3YzQ0Y2M0Li4xZGU3ZWIxYjZhYWMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2Rydi5oCkBAIC02OCw3ICs2OCw2IEBAIHN0cnVjdCB1ZGxfZGV2aWNl
IHsKIAogLyogbW9kZXNldCAqLwogaW50IHVkbF9tb2Rlc2V0X2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldik7Ci12b2lkIHVkbF9tb2Rlc2V0X2NsZWFudXAoc3RydWN0IGRybV9kZXZpY2UgKmRl
dik7CiBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqdWRsX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpOwogCiBzdHJ1Y3QgdXJiICp1ZGxfZ2V0X3VyYihzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYyBi
L2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYwppbmRleCBkNTllYmFjNzBiMTUuLjhj
YWQwMWYzZDE2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYwpAQCAtNDY4LDcgKzQ2OCw5
IEBAIGludCB1ZGxfbW9kZXNldF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsKIAlpbnQgcmV0OwogCi0JZHJtX21vZGVfY29uZmln
X2luaXQoZGV2KTsKKwlyZXQgPSBkcm1tX21vZGVfY29uZmlnX2luaXQoZGV2KTsKKwlpZiAocmV0
KQorCQlyZXR1cm4gcmV0OwogCiAJZGV2LT5tb2RlX2NvbmZpZy5taW5fd2lkdGggPSA2NDA7CiAJ
ZGV2LT5tb2RlX2NvbmZpZy5taW5faGVpZ2h0ID0gNDgwOwpAQCAtNDgyLDEwICs0ODQsOCBAQCBp
bnQgdWRsX21vZGVzZXRfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCWRldi0+bW9kZV9j
b25maWcuZnVuY3MgPSAmdWRsX21vZGVfZnVuY3M7CiAKIAljb25uZWN0b3IgPSB1ZGxfY29ubmVj
dG9yX2luaXQoZGV2KTsKLQlpZiAoSVNfRVJSKGNvbm5lY3RvcikpIHsKLQkJcmV0ID0gUFRSX0VS
Uihjb25uZWN0b3IpOwotCQlnb3RvIGVycl9kcm1fbW9kZV9jb25maWdfY2xlYW51cDsKLQl9CisJ
aWYgKElTX0VSUihjb25uZWN0b3IpKQorCQlyZXR1cm4gUFRSX0VSUihjb25uZWN0b3IpOwogCiAJ
Zm9ybWF0X2NvdW50ID0gQVJSQVlfU0laRSh1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9mb3JtYXRz
KTsKIApAQCAtNDk0LDE4ICs0OTQsOSBAQCBpbnQgdWRsX21vZGVzZXRfaW5pdChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KQogCQkJCQkgICB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9mb3JtYXRzLAog
CQkJCQkgICBmb3JtYXRfY291bnQsIE5VTEwsIGNvbm5lY3Rvcik7CiAJaWYgKHJldCkKLQkJZ290
byBlcnJfZHJtX21vZGVfY29uZmlnX2NsZWFudXA7CisJCXJldHVybiByZXQ7CiAKIAlkcm1fbW9k
ZV9jb25maWdfcmVzZXQoZGV2KTsKIAogCXJldHVybiAwOwotCi1lcnJfZHJtX21vZGVfY29uZmln
X2NsZWFudXA6Ci0JZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsKLQlyZXR1cm4gcmV0Owot
fQotCi12b2lkIHVkbF9tb2Rlc2V0X2NsZWFudXAoc3RydWN0IGRybV9kZXZpY2UgKmRldikKLXsK
LQlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkZXYpOwogfQotLSAKMi4yNC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
