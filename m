Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B673A74822
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67ED6E674;
	Thu, 25 Jul 2019 07:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493B56E5BC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 14:48:55 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id m24so90203559ioo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 07:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HwPqXIBxuHIER7tZJnlecipE0woOms8twNHrVL6AxIQ=;
 b=Pxah47FT/I0z8pMkJVeVlFHSWwCriQ15t+uAObt3DDlh4PFAmjHtaDvfLX7D0jOAAB
 yyrJzZux53LBcX4EPGKLLS48A5CtqaI+NrAiogEnaSIXqtqeWjzjK3/QjOviZinmNO/d
 QHpprqhl6eP1zelg2gnCs2xO2MpimCAviNl84HvIWqlb0Eky8YYwL3c3YCqoTixnPTKo
 kn68CHnBj1XqptllqnzUTAikt/e26pT7TIUukz3nlOSJTHLHeikHTMFuwQ1ETmOj1gyv
 il0vXKV0hHI+ojfSjEfDfpQwIcnO5yMdW3+LkF65wBE6OVs55kNZpsXBG3yK8WfzQd1v
 SU8A==
X-Gm-Message-State: APjAAAXyIOLqjZRqSIOdim1fSIi7csnawj17ZtAAXq1HnnWwZEu+HGwz
 ZKk2VhRn1uwVZPji+/UMEeg=
X-Google-Smtp-Source: APXvYqybxf0p/pRKzwGgO28J2Y6iMki/RDBF//ojjPz80URKoUjc81TTfDxmFdfx6YAwy9bj8g8P4Q==
X-Received: by 2002:a5e:a712:: with SMTP id b18mr75486828iod.220.1563979734599; 
 Wed, 24 Jul 2019 07:48:54 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id e26sm39596961iod.10.2019.07.24.07.48.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 07:48:54 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: sam@ravnborg.org
Subject: [PATCH] drm/panel: check failure cases in the probe func
Date: Wed, 24 Jul 2019 09:48:44 -0500
Message-Id: <20190724144845.4791-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190724051700.GA22730@ravnborg.org>
References: <20190724051700.GA22730@ravnborg.org>
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HwPqXIBxuHIER7tZJnlecipE0woOms8twNHrVL6AxIQ=;
 b=ccqbYRrVXkWfyYKmh7Upb9MbsCYPBan3zydRkRaUhEuI5q6tIR1OzPPTtiWL1m/Sk6
 VVlxwoUUxsSWzk7Ocec0lrH4P+knZmoHlZ28dnYxtdP6208JaloU2ZgabooDnZc++gUq
 mKQ2OOVqz4iwFU7dOb6lfzOFILxwYUIYjrsmdGb3xl2ZNtkglK9bXsqZdbr///lbzOnY
 5ieqzTE6od5Wha1JVuKZL42DmPA1XuEUe7bzOYdEiPNhTSml/7UmuqVSLYFK4vt3V3wy
 tD/Cr7ZXVjLRxzIpELo3KZHP576woP4R/lg5T2yMv6VA5ZJAJ25HeBzdn2jkPEfsWpzF
 mkaQ==
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
Cc: secalert@redhat.com, David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, smccaman@umn.edu,
 Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZvbGxvd2luZyBmdW5jdGlvbiBjYWxscyBtYXkgZmFpbCBhbmQgcmV0dXJuIE5VTEwsIHNv
IHRoZSBudWxsIGNoZWNrCmlzIGFkZGVkLgpvZl9ncmFwaF9nZXRfbmV4dF9lbmRwb2ludApvZl9n
cmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50Cm9mX2dyYXBoX2dldF9yZW1vdGVfcG9ydAoKU2ln
bmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5j
IHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4u
YyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5j
CmluZGV4IDI4YzA2MjBkZmUwZi4uOTQ4NGZkYjYwZjY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4uYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4uYwpAQCAtMzk5LDcg
KzM5OSwxMyBAQCBzdGF0aWMgaW50IHJwaV90b3VjaHNjcmVlbl9wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqaTJjLAogCiAJLyogTG9vayB1cCB0aGUgRFNJIGhvc3QuICBJdCBuZWVkcyB0byBwcm9i
ZSBiZWZvcmUgd2UgZG8uICovCiAJZW5kcG9pbnQgPSBvZl9ncmFwaF9nZXRfbmV4dF9lbmRwb2lu
dChkZXYtPm9mX25vZGUsIE5VTEwpOworCWlmICghZW5kcG9pbnQpCisJCXJldHVybiAtRU5PREVW
OworCiAJZHNpX2hvc3Rfbm9kZSA9IG9mX2dyYXBoX2dldF9yZW1vdGVfcG9ydF9wYXJlbnQoZW5k
cG9pbnQpOworCWlmICghZHNpX2hvc3Rfbm9kZSkKKwkJcmV0dXJuIC1FTk9ERVY7CisKIAlob3N0
ID0gb2ZfZmluZF9taXBpX2RzaV9ob3N0X2J5X25vZGUoZHNpX2hvc3Rfbm9kZSk7CiAJb2Zfbm9k
ZV9wdXQoZHNpX2hvc3Rfbm9kZSk7CiAJaWYgKCFob3N0KSB7CkBAIC00MDgsNiArNDE0LDkgQEAg
c3RhdGljIGludCBycGlfdG91Y2hzY3JlZW5fcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYywK
IAl9CiAKIAlpbmZvLm5vZGUgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnQoZW5kcG9pbnQpOwor
CWlmICghaW5mby5ub2RlKQorCQlyZXR1cm4gLUVOT0RFVjsKKwogCW9mX25vZGVfcHV0KGVuZHBv
aW50KTsKIAogCXRzLT5kc2kgPSBtaXBpX2RzaV9kZXZpY2VfcmVnaXN0ZXJfZnVsbChob3N0LCAm
aW5mbyk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
