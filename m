Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76958281A32
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 19:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F99E6E0A5;
	Fri,  2 Oct 2020 17:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F726E0A5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 17:53:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x14so2703404wrl.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mCTncko5YOfdd1hOhILVAexx/vlJaiXxqeCzAQ94in0=;
 b=FeyUVdPtM4srxB1+dn7I4h3H7Wfi8/fg99I+ABCtisEx3wHtPquZTvZ16RuGWwmZzE
 vz2bLh2sThVwHVg4NCZu/QZBQT8Z+HfU/9rp+qgb6Lzuk41uNLg5YV0/kZAopqb77csM
 ge7J8s4JsvsrgpI2ThI5QqsYkQlmjW4Kii0Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mCTncko5YOfdd1hOhILVAexx/vlJaiXxqeCzAQ94in0=;
 b=UFMEGEh43TgRN+BqFDjEKVZAl6njshjMgBLikb34QoHJaMzNbx88e4cjqmJVxc4FcB
 /sZdg9yoXTBzjem+LZDZT8eQJ9DRvM6r6GCSFRQSKn1CysI0MMVl3pCoD3x5sw2f0huX
 rbJxdJXdb/ZuOh/YVUjSYYe15+QQ2X992cZqXSWRqHbD71yET92o8XtQR1Wtv6v9DjHX
 D/hPVw6iTIuYeCRPrgZtJnY/95zE1vV17MP1a5S5E/s8JP0tvJSH84mPcZdok99D8GVd
 YYOGYgE8Ji8ABXkSh1bGAW7rXmC/KRnYwe7lYqzyz4hv9dz7uiVrwlPSAbibKAGNOewM
 liVA==
X-Gm-Message-State: AOAM530AfJ+UsyujG/CENX8kJ6pYwQ8yupmevLhmAdSGOA/2fLUnZZOR
 W/qC9oOJsdv9E8+dX03K7wstoAM1shy6ogDC
X-Google-Smtp-Source: ABdhPJxqlu8ijgg5+4avDVYjjircN8ixFnEQp9RW1tMzahfcEDBuGAuy7tAthp9rZCHLP+C5s3jDnQ==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr4212688wrq.424.1601661223009; 
 Fri, 02 Oct 2020 10:53:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m10sm2585429wmc.9.2020.10.02.10.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 10:53:42 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Date: Fri,  2 Oct 2020 19:53:03 +0200
Message-Id: <20201002175303.390363-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yICRyZWFzb25zIEkndmUgc3R1bWJsZWQgb3ZlciB0aGlzIGNvZGUgYW5kIEknbSBub3Qgc3Vy
ZSB0aGUgY2hhbmdlCnRvIHRoZSBuZXcgZ3VwIGZ1bmN0aW9ucyBpbiA1NWE2NTBjMzVmZWEgKCJt
bS9ndXA6IGZyYW1lX3ZlY3RvcjoKY29udmVydCBnZXRfdXNlcl9wYWdlcygpIC0tPiBwaW5fdXNl
cl9wYWdlcygpIikgd2FzIGVudGlyZWx5IGNvcnJlY3QuCgpUaGlzIGhlcmUgaXMgdXNlZCBmb3Ig
bG9uZyB0ZXJtIGJ1ZmZlcnMgKG5vdCBqdXN0IHF1aWNrIEkvTykgbGlrZQpSRE1BLCBhbmQgSm9o
biBub3RlcyB0aGlzIGluIGhpcyBwYXRjaC4gQnV0IEkgdGhvdWdodCB0aGUgcnVsZSBmb3IKdGhl
c2UgaXMgdGhhdCB0aGV5IG5lZWQgdG8gYWRkIEZPTExfTE9OR1RFUk0sIHdoaWNoIEpvaG4ncyBw
YXRjaApkaWRuJ3QgZG8uCgpUaGVyZSBpcyBhbHJlYWR5IGEgZGF4IHNwZWNpZmljIGNoZWNrIChh
ZGRlZCBpbiBiN2YwNTU0YTU2ZjIgKCJtbToKZmFpbCBnZXRfdmFkZHJfZnJhbWVzKCkgZm9yIGZp
bGVzeXN0ZW0tZGF4IG1hcHBpbmdzIikpLCBzbyB0aGlzIHNlZW1zCmxpa2UgdGhlIHBydWRlbnQg
dGhpbmcgdG8gZG8uCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+
CkNjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlz
c2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBE
YW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNr
Lm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1z
YW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
ZwotLS0KSGkgYWxsLAoKSSBzdHVtYmxlZCBvdmVyIHRoaXMgYW5kIGZpZ3VyZWQgdHlwaW5nIHRo
aXMgcGF0Y2ggY2FuJ3QgaHVydC4gUmVhbGx5Cmp1c3QgdG8gbWF5YmUgbGVhcm4gYSBmZXcgdGhp
bmdzIGFib3V0IGhvdyBndXAvcHVwIGlzIHN1cHBvc2VkIHRvIGJlCnVzZWQgKHdlIGhhdmUgYSBi
aXQgb2YgdGhhdCBpbiBkcml2ZXJzL2dwdSksIHRoaXMgaGVyZSBpc24ndCByZWFsbHkKcmFsYXRl
ZCB0byBhbnl0aGluZyBJJ20gZG9pbmcuCgpJJ20gYWxzbyB3b25kZXJpbmcgd2hldGhlciB0aGUg
ZXhwbGljaXQgZGF4IGNoZWNrIHNob3VsZCBiZSByZW1vdmVkLApzaW5jZSBGT0xMX0xPTkdURVJN
IHNob3VsZCB0YWtlIGNhcmUgb2YgdGhhdCBhbHJlYWR5LgotRGFuaWVsCi0tLQogbW0vZnJhbWVf
dmVjdG9yLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9tbS9mcmFtZV92ZWN0b3IuYyBiL21tL2ZyYW1lX3ZlY3Rvci5j
CmluZGV4IDVkMzRjOTA0N2U5Yy4uMzUwN2UwOWNiM2ZmIDEwMDY0NAotLS0gYS9tbS9mcmFtZV92
ZWN0b3IuYworKysgYi9tbS9mcmFtZV92ZWN0b3IuYwpAQCAtMzUsNyArMzUsNyBAQCBpbnQgZ2V0
X3ZhZGRyX2ZyYW1lcyh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBpbnQgbnJfZnJhbWVz
LAogewogCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07CiAJc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWE7Ci0JdW5zaWduZWQgaW50IGd1cF9mbGFncyA9IEZPTExfV1JJVEUgfCBG
T0xMX0ZPUkNFOworCXVuc2lnbmVkIGludCBndXBfZmxhZ3MgPSBGT0xMX1dSSVRFIHwgRk9MTF9G
T1JDRSB8IEZPTExfTE9OR1RFUk07CiAJaW50IHJldCA9IDA7CiAJaW50IGVycjsKIAlpbnQgbG9j
a2VkOwotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
