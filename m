Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 302102C698E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 17:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D9C6EE58;
	Fri, 27 Nov 2020 16:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8C96EE56
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 16:42:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k14so6233085wrn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 08:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WIwM+CgtjulX00So/rnZs3CK8iFlbmt4b5FI8jtD7Z0=;
 b=UsmTBv70+0yVDRoJJ7S15WMQxg6E1LErgv9pqqIkQadtiUgYBrporCiAo60oAloUR0
 hypKZlv6JVJHYO7NbUucNAxekNi/+UcXEeC0lL9RNeCmL4gLXd2f1Uvy8w0ttja7AT3u
 fXbx7NQgScpue4f5z44auD2zsQqryDSerpCHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WIwM+CgtjulX00So/rnZs3CK8iFlbmt4b5FI8jtD7Z0=;
 b=Kk5K+vDvmsMvBC1zL6j1LO1z8ARCcSkzr48z9Dc9JuJ9EcTB6h3NSaaSjwuVGFpJkD
 i/AOE/hMSxit7GBlztmcI25QV8OJTGlOa9erAVPaoDPOIzMeftWvRdMC6AFZbhflK81b
 a/kCKwF0758zZCBAh/4vloQIop44p8U6utgXuLfcn9afCQydMoJPLXSJcoBCOk5kIBhT
 PaiOi4IB0yL9c6HMEJ5P59Qh0DMgeKdOjbPa5sn+NwcI/C1xJgP37xCvlLjUUL8K/7gt
 9OIUIfUNmlGWS0rA7K/28OCB3q7MRePIL58eWEqr6RbUf48RDHEYnPzEN35SH8aqNRVL
 Xv0w==
X-Gm-Message-State: AOAM533Wbvp3O5X9sAKFysvPOfmwI4AkOepexSmqYw1PxZ9a1R+7uV1L
 WDHQOD7kD9mOPFUf97LySsYAs5GN4F1Xug==
X-Google-Smtp-Source: ABdhPJyAXEAYiKOSNg8sjsJugGFFuhRB8ve58iZQChHUSl54iRJGMo2vJlzEY8x9JKPdy66sWXRf8w==
X-Received: by 2002:adf:8284:: with SMTP id 4mr11448134wrc.386.1606495322891; 
 Fri, 27 Nov 2020 08:42:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q12sm14859078wrx.86.2020.11.27.08.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 08:42:02 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 04/17] misc/habana: Use FOLL_LONGTERM for userptr
Date: Fri, 27 Nov 2020 17:41:18 +0100
Message-Id: <20201127164131.2244124-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Pawel Piskorski <ppiskorski@habana.ai>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ofir Bitton <obitton@habana.ai>, linux-mm@kvack.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, Omer Shpigelman <oshpigelman@habana.ai>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Moti Haimovski <mhaimovski@habana.ai>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIHBlcnNpc3RlbnQsIG5vdCBqdXN0IGZvciB0aGUgZHVyYXRpb24gb2YgYSBkbWEg
b3BlcmF0aW9uLgoKUmV2aWV3ZWQtYnk6IE9kZWQgR2FiYmF5IDxvZ2FiYmF5QGtlcm5lbC5vcmc+
ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpD
YzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3Bt
QGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEu
Y29tPgpDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiBKYW4gS2Fy
YSA8amFja0BzdXNlLmN6PgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5j
b20+CkNjOiBsaW51eC1tbUBrdmFjay5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51
eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IE9kZWQgR2FiYmF5IDxvZGVkLmdhYmJheUBnbWFp
bC5jb20+CkNjOiBPbWVyIFNocGlnZWxtYW4gPG9zaHBpZ2VsbWFuQGhhYmFuYS5haT4KQ2M6IE9m
aXIgQml0dG9uIDxvYml0dG9uQGhhYmFuYS5haT4KQ2M6IFRvbWVyIFRheWFyIDx0dGF5YXJAaGFi
YW5hLmFpPgpDYzogTW90aSBIYWltb3Zza2kgPG1oYWltb3Zza2lAaGFiYW5hLmFpPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IEdyZWcgS3JvYWgtSGFydG1h
biA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBQYXdlbCBQaXNrb3Jza2kgPHBwaXNr
b3Jza2lAaGFiYW5hLmFpPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnku
YyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jIGIv
ZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jCmluZGV4IDJjNTlmYTg2OTY4
NC4uMGQyNWFlMWQ1ZjNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21t
b24vbWVtb3J5LmMKKysrIGIvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5j
CkBAIC0xMjk2LDcgKzEyOTYsOCBAQCBzdGF0aWMgaW50IGdldF91c2VyX21lbW9yeShzdHJ1Y3Qg
aGxfZGV2aWNlICpoZGV2LCB1NjQgYWRkciwgdTY0IHNpemUsCiAJaWYgKCF1c2VycHRyLT5wYWdl
cykKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlyYyA9IHBpbl91c2VyX3BhZ2VzX2Zhc3Qoc3RhcnQs
IG5wYWdlcywgRk9MTF9GT1JDRSB8IEZPTExfV1JJVEUsCisJcmMgPSBwaW5fdXNlcl9wYWdlc19m
YXN0KHN0YXJ0LCBucGFnZXMsCisJCQkJIEZPTExfRk9SQ0UgfCBGT0xMX1dSSVRFIHwgRk9MTF9M
T05HVEVSTSwKIAkJCQkgdXNlcnB0ci0+cGFnZXMpOwogCiAJaWYgKHJjICE9IG5wYWdlcykgewot
LSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
