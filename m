Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9C86D699
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 23:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026F96E37F;
	Thu, 18 Jul 2019 21:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE356E37F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 21:41:50 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id p184so13194374pfp.7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 14:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXkPzSZf/fna3v9Du6552FbVJUMqyGEVvH1pVYvIMY4=;
 b=YKh4l6+p8GYu+FmJBTlMLl78MtkS6jMxRQBeEgZExwxlUUJ6XHEXrpFnMjrdpkGkGu
 N4abpVH3qVL2Rbk0Zhb8hVQ2efQLGa8ZggslsOjRld0FO/aJRW+EOMi5sK1y1uknZ0+x
 aMb0KeYGIvurQ/0Iir3BE0mgsa8RbxFv61xbhlpm0ZMBb3bRfmCUA+2JXHKX8Srk6oQN
 LEI5G6hKe2oeQY4XdAY39KObjHgz9e6nqxnJ1BDVOc4CRXo6UdzDncqRmeokG87ifRXo
 Awzz738akEThuEagd3f/Pi3rgVl+2bYq0+spGnxohy/vV1COhpJ7msiEYWNbrqzOpM1U
 bBhg==
X-Gm-Message-State: APjAAAVyNhLjXGMWWJ64K7nDvHiyq301pC92BkT3AFlO6QCe1ZyDgjjF
 fzKYLFk7kVN0M6VigaaLX+NETA==
X-Google-Smtp-Source: APXvYqyHVzz82WKLnz3eIxpxYsyXxPYr1dGo2TBVXXV3yFi26z+3ibdtZ3ZK/+C5B+QnidGKJlAWOQ==
X-Received: by 2002:a63:f456:: with SMTP id p22mr23401451pgk.45.1563486109760; 
 Thu, 18 Jul 2019 14:41:49 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id e17sm16860239pgm.21.2019.07.18.14.41.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 14:41:49 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the internal
 I2C controller
Date: Thu, 18 Jul 2019 14:41:35 -0700
Message-Id: <20190718214135.79445-1-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXkPzSZf/fna3v9Du6552FbVJUMqyGEVvH1pVYvIMY4=;
 b=V5STNS/qoo+hoVZ84al1gz5fifOhZXi5TNLkAQyzXqvCHDez69Q42Gc1XWjzaNNbwG
 N7LT6lGx8NtDTUhplToKtR5wwYE6ctQpODx/wBZoo5gu5HBfYvoV6pcDfJt2GkeMitc3
 NQse+pSPY+bAuwZMPQRQ1+RWkkLvdMU80lmc4=
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEREQy9DSSBwcm90b2NvbCBpbnZvbHZlcyBzZW5kaW5nIGEgbXVsdGktYnl0ZSByZXF1ZXN0
IHRvIHRoZQpkaXNwbGF5IHZpYSBJMkMsIHdoaWNoIGlzIHR5cGljYWxseSBmb2xsb3dlZCBieSBh
IG11bHRpLWJ5dGUKcmVzcG9uc2UuIFRoZSBpbnRlcm5hbCBJMkMgY29udHJvbGxlciBvbmx5IGFs
bG93cyBzaW5nbGUgYnl0ZQpyZWFkcy93cml0ZXMgb3IgcmVhZHMgb2YgOCBzZXF1ZW50aWFsIGJ5
dGVzLCBoZW5jZSBEREMvQ0kgaXMgbm90CnN1cHBvcnRlZCB3aGVuIHRoZSBpbnRlcm5hbCBJMkMg
Y29udHJvbGxlciBpcyB1c2VkLiBUaGUgSTJDCnRyYW5zZmVycyBjb21wbGV0ZSB3aXRob3V0IGVy
cm9ycywgaG93ZXZlciB0aGUgZGF0YSBpbiB0aGUgcmVzcG9uc2UKaXMgZ2FyYmFnZS4gQWJvcnQg
dHJhbnNmZXJzIHRvL2Zyb20gc2xhdmUgYWRkcmVzcyAweDM3IChEREMpIHdpdGgKLUVPUE5PVFNV
UFAsIHRvIG1ha2UgaXQgZXZpZGVudCB0aGF0IHRoZSBjb21tdW5pY2F0aW9uIGlzIGZhaWxpbmcu
CgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDggKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5jCmluZGV4IDA0NWIxYjEzZmQwZS4uZTQ5NDAyZWJkNTZmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMzUsNiArMzUsNyBA
QAogCiAjaW5jbHVkZSA8bWVkaWEvY2VjLW5vdGlmaWVyLmg+CiAKKyNkZWZpbmUgRERDX0kyQ19B
RERSCQkweDM3CiAjZGVmaW5lIEREQ19TRUdNRU5UX0FERFIJMHgzMAogCiAjZGVmaW5lIEhETUlf
RURJRF9MRU4JCTUxMgpAQCAtMzIyLDYgKzMyMywxMyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJj
X3hmZXIoc3RydWN0IGkyY19hZGFwdGVyICphZGFwLAogCXU4IGFkZHIgPSBtc2dzWzBdLmFkZHI7
CiAJaW50IGksIHJldCA9IDA7CiAKKwlpZiAoYWRkciA9PSBERENfSTJDX0FERFIpCisJCS8qCisJ
CSAqIFRoZSBpbnRlcm5hbCBJMkMgY29udHJvbGxlciBkb2VzIG5vdCBzdXBwb3J0IHRoZSBtdWx0
aS1ieXRlCisJCSAqIHJlYWQgYW5kIHdyaXRlIG9wZXJhdGlvbnMgbmVlZGVkIGZvciBEREMvVkNQ
LgorCQkgKi8KKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJZGV2X2RiZyhoZG1pLT5kZXYsICJ4
ZmVyOiBudW06ICVkLCBhZGRyOiAlI3hcbiIsIG51bSwgYWRkcik7CiAKIAlmb3IgKGkgPSAwOyBp
IDwgbnVtOyBpKyspIHsKLS0gCjIuMjIuMC42NTcuZzk2MGU5MmQyNGYtZ29vZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
