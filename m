Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F90E8136F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570EC6E2A9;
	Mon,  5 Aug 2019 07:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC45D89CDE;
 Sun,  4 Aug 2019 22:49:57 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id d1so5848572pgp.4;
 Sun, 04 Aug 2019 15:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rRiJNzkH0bRoPJKYXoQcsROADD9YH4USeXVLEsmAa1E=;
 b=ExZqK+bOpmujp7Khadts5WdCIVqtLElAM/wX9+r6utvLrsy4ZHRJ9Fu3WEHKaguJmp
 krOjlTJvkQvUZEALm3HBbJMSpt24cUgSrMiNYIiBoNCxbnByBSCcqsPpvbUm3V/R/yA2
 PPJEnP/HvqvySxW8XM96ZDrcmZTC4O4uHoOhjWZQnfqNfx1AhCynj2B9njg/ifzFIHgI
 QoDXwHVh1ZOCEZISfJKhS92/zHJckmVpPww3tgUf5JyyrkJeS+1Y9LM0rj9R39518Ude
 v/DlYJ1QOGvS5fq6RgAkrKgdMSTWOHCXlw50ihwzzkkkarwo40350GSAS2JMPug5oFFF
 o/zg==
X-Gm-Message-State: APjAAAVnGUqVQL4CVuh8Vnnr+Vt58yL3pJ4NqXbO6D+sad2QhlqRaktf
 PdCx5VbHXp8tTvOlgwEKKek=
X-Google-Smtp-Source: APXvYqxM1jqqH644LscYZh1fOmR6SQroZ5U0oF421RZK6m1nNZ1H1tDwWIOHK+9da6OAru/hIya3FA==
X-Received: by 2002:a63:61cf:: with SMTP id
 v198mr17505607pgb.217.1564958997274; 
 Sun, 04 Aug 2019 15:49:57 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:56 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 24/34] futex: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:05 -0700
Message-Id: <20190804224915.28669-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rRiJNzkH0bRoPJKYXoQcsROADD9YH4USeXVLEsmAa1E=;
 b=AV7uFQE9YUuDd+D7n/raE3+Vd4+M3WfHMpSGBy7Po/eVbcIBoj8uNAj9DUgT5bKiPy
 NOFpz/m3dZOdwDIxZQeVlxsCTnZ92dZxKMNJ/rR2X1bMUek0j8TGq+u0eAdIPX6nv7Xg
 3xla0EEXNbB0lWncn+d/ABroqlg3T2U7E2b5B9Xg8cDDZKP8nXSMimiXqXtFe+tBDXhV
 ARezJERjiP3GeR4zOW6+cUq9Pz5Hkpr43jELcaC0lfmmiiWVj3OueADfK4ODHerMWl3x
 WKZ0WyFn5raZ50oDfnPOKa2jV6SJBQSgxKSa9LR9P0FGYWA2KC5auYEx1XvMz/0dUJhq
 D/Mg==
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Darren Hart <dvhart@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVk
aGF0LmNvbT4KQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6IERh
cnJlbiBIYXJ0IDxkdmhhcnRAaW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJi
YXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGtlcm5lbC9mdXRleC5jIHwgMTAgKysrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9rZXJuZWwvZnV0ZXguYyBiL2tlcm5lbC9mdXRleC5jCmluZGV4IDZkNTA3Mjhl
ZjJlNy4uNGI0Y2FlNThlYzU3IDEwMDY0NAotLS0gYS9rZXJuZWwvZnV0ZXguYworKysgYi9rZXJu
ZWwvZnV0ZXguYwpAQCAtNjIzLDcgKzYyMyw3IEBAIGdldF9mdXRleF9rZXkodTMyIF9fdXNlciAq
dWFkZHIsIGludCBmc2hhcmVkLCB1bmlvbiBmdXRleF9rZXkgKmtleSwgZW51bSBmdXRleF9hCiAJ
CWxvY2tfcGFnZShwYWdlKTsKIAkJc2htZW1fc3dpenpsZWQgPSBQYWdlU3dhcENhY2hlKHBhZ2Up
IHx8IHBhZ2UtPm1hcHBpbmc7CiAJCXVubG9ja19wYWdlKHBhZ2UpOwotCQlwdXRfcGFnZShwYWdl
KTsKKwkJcHV0X3VzZXJfcGFnZShwYWdlKTsKIAogCQlpZiAoc2htZW1fc3dpenpsZWQpCiAJCQln
b3RvIGFnYWluOwpAQCAtNjc1LDcgKzY3NSw3IEBAIGdldF9mdXRleF9rZXkodTMyIF9fdXNlciAq
dWFkZHIsIGludCBmc2hhcmVkLCB1bmlvbiBmdXRleF9rZXkgKmtleSwgZW51bSBmdXRleF9hCiAK
IAkJaWYgKFJFQURfT05DRShwYWdlLT5tYXBwaW5nKSAhPSBtYXBwaW5nKSB7CiAJCQlyY3VfcmVh
ZF91bmxvY2soKTsKLQkJCXB1dF9wYWdlKHBhZ2UpOworCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsK
IAogCQkJZ290byBhZ2FpbjsKIAkJfQpAQCAtNjgzLDcgKzY4Myw3IEBAIGdldF9mdXRleF9rZXko
dTMyIF9fdXNlciAqdWFkZHIsIGludCBmc2hhcmVkLCB1bmlvbiBmdXRleF9rZXkgKmtleSwgZW51
bSBmdXRleF9hCiAJCWlub2RlID0gUkVBRF9PTkNFKG1hcHBpbmctPmhvc3QpOwogCQlpZiAoIWlu
b2RlKSB7CiAJCQlyY3VfcmVhZF91bmxvY2soKTsKLQkJCXB1dF9wYWdlKHBhZ2UpOworCQkJcHV0
X3VzZXJfcGFnZShwYWdlKTsKIAogCQkJZ290byBhZ2FpbjsKIAkJfQpAQCAtNzAyLDcgKzcwMiw3
IEBAIGdldF9mdXRleF9rZXkodTMyIF9fdXNlciAqdWFkZHIsIGludCBmc2hhcmVkLCB1bmlvbiBm
dXRleF9rZXkgKmtleSwgZW51bSBmdXRleF9hCiAJCSAqLwogCQlpZiAoIWF0b21pY19pbmNfbm90
X3plcm8oJmlub2RlLT5pX2NvdW50KSkgewogCQkJcmN1X3JlYWRfdW5sb2NrKCk7Ci0JCQlwdXRf
cGFnZShwYWdlKTsKKwkJCXB1dF91c2VyX3BhZ2UocGFnZSk7CiAKIAkJCWdvdG8gYWdhaW47CiAJ
CX0KQEAgLTcyMyw3ICs3MjMsNyBAQCBnZXRfZnV0ZXhfa2V5KHUzMiBfX3VzZXIgKnVhZGRyLCBp
bnQgZnNoYXJlZCwgdW5pb24gZnV0ZXhfa2V5ICprZXksIGVudW0gZnV0ZXhfYQogCX0KIAogb3V0
OgotCXB1dF9wYWdlKHBhZ2UpOworCXB1dF91c2VyX3BhZ2UocGFnZSk7CiAJcmV0dXJuIGVycjsK
IH0KIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
