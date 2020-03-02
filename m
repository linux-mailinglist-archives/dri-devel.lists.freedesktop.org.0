Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00D7176757
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F626E8D2;
	Mon,  2 Mar 2020 22:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616F66E8EB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z12so831485wmi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qrzOvBm0c0mr5VF5cRbEH4SW7uLVC05ozvo8RRlTBns=;
 b=HQWG49zBZI1qH5ugMqTgaPg6PkxAsgsjFz7UDp+x3HXe9hT+ypxG8mLdV7XpSa0tLJ
 fwTi31rH5rutXWem5G60Uw1hLqiMfuS3ShFO+v/UocRDZrA/7onEAMO2EzH/qYTlGIFX
 Y/jQQI7Pg7TOF8fkVg6R6gu+tvoowNYxLyLqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qrzOvBm0c0mr5VF5cRbEH4SW7uLVC05ozvo8RRlTBns=;
 b=sXH1hm2K7BeRdD9Or1oD4J1e7Lt/pm/qc1zOfP+1yOWyZK9r/jACgKjUlkLEGNUthl
 JFIjbSG7fcCluUMjKDMmMPKiRbrOKm/hGl610ES2ATelKLMvt0vEmG8i4f/dNmY4q7Ag
 rlxIINdzJd5ZCyLP+alkX2Iah0aQSJ2lYeogUj3RWJyQbBh9B+hDSYOfeySZZI55pK7N
 MECw4kueTEVbpyvJxQOMc1k/oVlAdhHuwYMagSoDOIcKzqgx2BEcAAKiIRoPYr325CP7
 WIR4lgB0h/HB99yq/TuC8r540tihpCFs1I6zyc9SOUlROHLtsi3GfqpuqXvrWhe+2laa
 foqA==
X-Gm-Message-State: ANhLgQ0eoALNl/zcwLuNXoGGEfK/3WPz1WA7q32XYxuD2Yeq59vVAvHE
 BPber4LWaweNWtcD1NVBad28Lzzk/Ww=
X-Google-Smtp-Source: ADFU+vtbgNudXdHleHztlRzFif7QdppKxc8bltqa8aHhUCrZ0P5U/kidGn3lg3xxARNvWEYNtZDOMA==
X-Received: by 2002:a1c:a384:: with SMTP id m126mr530176wme.84.1583188062638; 
 Mon, 02 Mar 2020 14:27:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:42 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 50/51] drm/udl: drop drm_driver.release hook
Date: Mon,  2 Mar 2020 23:26:30 +0100
Message-Id: <20200302222631.3861340-51-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBvbmx5IHR3byBmdW5jdGlvbnMgY2FsbGVkIGZyb20gdGhhdDoKZHJtX2ttc19oZWxw
ZXJfcG9sbF9maW5pKCkgYW5kIHVkbF9mcmVlX3VyYl9saXN0KCkuIEJvdGggb2YgdGhlc2UgYXJl
CmFsc28gY2FsbGVkIGZyb20gdGhlIHVic19kcml2ZXItPmRpc2Nvbm5lY3QgaG9vaywgc28gZW50
aXJlbHkKcG9pbnRsZXNzIHRvIGRvIHRoZSBzYW1lIGFnYWluIGluIHRoZSAtPnJlbGVhc2UgaG9v
ay4KCkZ1cnRoZXJtb3JlIGJ5IHRoZSB0aW1lIHdlIGNsZWFuIHVwIHRoZSBkcm1fZHJpdmVyIHdl
IHJlYWxseSBzaG91bGRuJ3QKYmUgdG91Y2hpbmcgaGFyZHdhcmUgYW55bW9yZSwgc28gc3RvcHBp
bmcgdGhlIHBvbGwgd29ya2VyIGFuZCBmcmVlaW5nCnRoZSB1cmIgYWxsb2NhdGlvbnMgaW4gLT5k
aXNjb25uZWN0IGlzIHRoZSByaWdodCB0aGluZyB0byBkby4KCk5vdyBkaXNjb25uZWN0IHN0aWxs
IGNsZWFucyB0aGluZ3MgdXAgYmVmb3JlIHVucmVnaXN0ZXJpbmcgdGhlIGRyaXZlciwKYnV0IHRo
YXQncyBhIGRpZmZlcmVudCBpc3N1ZS4KCnYyOiBVc2UgX2ZpbmksIG5vdCBfZGlzYWJsZSBpbiB1
bnBsdWcsIG1vdGl2YXRlZCBieSBkaXNjdXNzaW9ucyB3aXRoClRob21hcy4gX2Rpc2FibGUvX2Vu
YWJsZSBhcmUgZm9yIHN1c3BlbmQvcmVzdW1lLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRo
YXQuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+CkNjOiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4K
Q2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogIk5vcmFsZiBUcsO4bm5l
cyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX2Rydi5jICB8ICA4ICstLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCAg
fCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMgfCAxMCAtLS0tLS0tLS0tCiAz
IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX2Rydi5jCmluZGV4IGI0NDdmYjA1M2U3OC4uMWNlMmQ4NjVjMzZkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3Vk
bF9kcnYuYwpAQCAtMzQsMTQgKzM0LDggQEAgc3RhdGljIGludCB1ZGxfdXNiX3Jlc3VtZShzdHJ1
Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlKQogCiBERUZJTkVfRFJNX0dFTV9GT1BTKHVkbF9k
cml2ZXJfZm9wcyk7CiAKLXN0YXRpYyB2b2lkIHVkbF9kcml2ZXJfcmVsZWFzZShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KQotewotCXVkbF9maW5pKGRldik7Ci19Ci0KIHN0YXRpYyBzdHJ1Y3QgZHJt
X2RyaXZlciBkcml2ZXIgPSB7CiAJLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9BVE9NSUMgfCBE
UklWRVJfR0VNIHwgRFJJVkVSX01PREVTRVQsCi0JLnJlbGVhc2UgPSB1ZGxfZHJpdmVyX3JlbGVh
c2UsCiAKIAkvKiBnZW0gaG9va3MgKi8KIAkuZ2VtX2NyZWF0ZV9vYmplY3QgPSB1ZGxfZHJpdmVy
X2dlbV9jcmVhdGVfb2JqZWN0LApAQCAtMTIwLDcgKzExNCw3IEBAIHN0YXRpYyB2b2lkIHVkbF91
c2JfZGlzY29ubmVjdChzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlKQogewogCXN0cnVj
dCBkcm1fZGV2aWNlICpkZXYgPSB1c2JfZ2V0X2ludGZkYXRhKGludGVyZmFjZSk7CiAKLQlkcm1f
a21zX2hlbHBlcl9wb2xsX2Rpc2FibGUoZGV2KTsKKwlkcm1fa21zX2hlbHBlcl9wb2xsX2Zpbmko
ZGV2KTsKIAl1ZGxfZHJvcF91c2IoZGV2KTsKIAlkcm1fZGV2X3VucGx1ZyhkZXYpOwogCWRybV9k
ZXZfcHV0KGRldik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCBi
L2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oCmluZGV4IDFkZTdlYjFiNmFhYy4uMjY0MmY5
NGE2M2ZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaApAQCAtNzYsNyArNzYsNiBAQCBpbnQgdWRsX3N1
Ym1pdF91cmIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IHVyYiAqdXJiLCBzaXplX3Qg
bGVuKTsKIHZvaWQgdWRsX3VyYl9jb21wbGV0aW9uKHN0cnVjdCB1cmIgKnVyYik7CiAKIGludCB1
ZGxfaW5pdChzdHJ1Y3QgdWRsX2RldmljZSAqdWRsKTsKLXZvaWQgdWRsX2Zpbmkoc3RydWN0IGRy
bV9kZXZpY2UgKmRldik7CiAKIGludCB1ZGxfcmVuZGVyX2hsaW5lKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIGludCBsb2dfYnBwLCBzdHJ1Y3QgdXJiICoqdXJiX3B0ciwKIAkJICAgICBjb25zdCBj
aGFyICpmcm9udCwgY2hhciAqKnVyYl9idWZfcHRyLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jCmluZGV4
IDUzODcxODkxOTkxNi4uZjVkMjdmMmE1NjU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9tYWluLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jCkBAIC0z
NTEsMTMgKzM1MSwzIEBAIGludCB1ZGxfZHJvcF91c2Ioc3RydWN0IGRybV9kZXZpY2UgKmRldikK
IAl1ZGxfZnJlZV91cmJfbGlzdChkZXYpOwogCXJldHVybiAwOwogfQotCi12b2lkIHVkbF9maW5p
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCi17Ci0Jc3RydWN0IHVkbF9kZXZpY2UgKnVkbCA9IHRv
X3VkbChkZXYpOwotCi0JZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKGRldik7Ci0KLQlpZiAodWRs
LT51cmJzLmNvdW50KQotCQl1ZGxfZnJlZV91cmJfbGlzdChkZXYpOwotfQotLSAKMi4yNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
