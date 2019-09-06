Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E8AABEF4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 19:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9996E326;
	Fri,  6 Sep 2019 17:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBE36E326
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 17:47:37 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v38so7027947edm.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 10:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AXnjF1eMA0qvhNi+oaAvRaU1Op/sm6+LQv/OHFTjjBs=;
 b=BWCFQnPlo34lLBxfMjkSbbpkYJRS2yY8UV32uT8tgCYeTc0FFERN11XXGl812tGi4s
 /beZKq1bhsziOE/YOguBXZIMP7PpyYszz10Os9eAGwQaje7wW7AFL4vkhfF0b/Z75/eJ
 tyOY1y7TTlqastLmmJBUtty6TeJtNWummwtEDzcOaxYOX1xR7vjHhk4RQyncL3no6BAR
 lFA1QOWrYpJb+lmOe3LCEBHN/5aiT7su3RmAF7qM/+XDAUa9gBhJpS2UYo2fA1gauTGG
 X+OVyNyUKijSDDg53ephmO5hSw9nVYzgp6e+AKkbK8CLRA8UrMsEjQk5Ien4WyTgImuy
 QLSw==
X-Gm-Message-State: APjAAAWcEaAeyThZ26XcC/OFRlidKhBlNHEQtkQsccKOQyy/RZkk8JEJ
 nPToUvTCDULthubg4sRFmHy2dg==
X-Google-Smtp-Source: APXvYqyXNSoipVDK3YxyEJ0q0hqumo6vbP/ePP5SeWNLJC+mFFPaXXQumLn2z+pO051A2VuoAWL5CA==
X-Received: by 2002:a17:906:8158:: with SMTP id
 z24mr8426652ejw.54.1567792056188; 
 Fri, 06 Sep 2019 10:47:36 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id m14sm537241edc.61.2019.09.06.10.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 10:47:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] mm,
 notifier: Fix early return case for new lockdep annotations
Date: Fri,  6 Sep 2019 19:47:30 +0200
Message-Id: <20190906174730.22462-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AXnjF1eMA0qvhNi+oaAvRaU1Op/sm6+LQv/OHFTjjBs=;
 b=FRjTuqf9guqExV42vYGxD/fiJVxgZg0XxcBoMZkO3y4QM+JRyu5YDuJcT8dY4cwVtT
 6/DchteyEMWB7Egugye1ennPXOFn5/y55kWgyjVlAxTOzKoAeV3mZZ1vkODIu9aV6ZZ/
 wPg7BapUpyEmLjNdij5gnkTUktJpuxzhSOXy4=
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 syzbot+aaedc50d99a03250fe1f@syzkaller.appspotmail.com,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBtaXNzZWQgdGhhdCB3aGVuIGV4dGVuZGluZyB0aGUgbG9ja2RlcCBhbm5vdGF0aW9ucyB0byB0
aGUKbm9uYmxvY2tpbmcgY2FzZS4KCkkgbWlzc2VkIHRoaXMgd2hpbGUgdGVzdGluZyBzaW5jZSBp
biB0aGUgaTkxNSBtbXUgbm90aWZpZXJzIGlzIGhpdHRpbmcKYSBuaWNlIGxvY2tkZXAgc3BsYXQg
YWxyZWFkeSBiZWZvcmUgdGhlIHBvaW50IG9mIGdvaW5nIGludG8gb29tIGtpbGxlcgptb2RlIDot
LwoKUmVwb3J0ZWQtYnk6IHN5emJvdCthYWVkYzUwZDk5YTAzMjUwZmUxZkBzeXprYWxsZXIuYXBw
c3BvdG1haWwuY29tCkZpeGVzOiBkMmIyMTllZDAzZDQgKCJtbS9tbXVfbm90aWZpZXJzOiBhZGQg
YSBsb2NrZGVwIG1hcCBmb3IgaW52YWxpZGF0ZV9yYW5nZV9zdGFydC9lbmQiKQpDYzogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24u
b3JnPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IFJhbHBo
IENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdn
QHppZXBlLmNhPgpDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgpDYzogTWljaGFs
IEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgpDYzogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vhbi5qLmNocmlzdG9waGVyc29u
QGludGVsLmNvbT4KQ2M6IEplYW4tUGhpbGlwcGUgQnJ1Y2tlciA8amVhbi1waGlsaXBwZUBsaW5h
cm8ub3JnPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvbGludXgvbW11X25vdGlm
aWVyLmggfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggYi9pbmNs
dWRlL2xpbnV4L21tdV9ub3RpZmllci5oCmluZGV4IDVhMDM0MTdlNWJmNy4uNGVkZDk4YjA2ODM0
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCisrKyBiL2luY2x1ZGUv
bGludXgvbW11X25vdGlmaWVyLmgKQEAgLTM1NiwxMyArMzU2LDE0IEBAIG1tdV9ub3RpZmllcl9p
bnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdlKQog
c3RhdGljIGlubGluZSBpbnQKIG1tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X25v
bmJsb2NrKHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdlKQogeworCWludCByZXQgPSAw
OwogCWxvY2tfbWFwX2FjcXVpcmUoJl9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3Rh
cnRfbWFwKTsKIAlpZiAobW1faGFzX25vdGlmaWVycyhyYW5nZS0+bW0pKSB7CiAJCXJhbmdlLT5m
bGFncyAmPSB+TU1VX05PVElGSUVSX1JBTkdFX0JMT0NLQUJMRTsKLQkJcmV0dXJuIF9fbW11X25v
dGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQocmFuZ2UpOworCQlyZXQgPSBfX21tdV9ub3Rp
Zmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHJhbmdlKTsKIAl9CiAJbG9ja19tYXBfcmVsZWFz
ZSgmX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXApOwotCXJldHVybiAw
OworCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyBpbmxpbmUgdm9pZAotLSAKMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
