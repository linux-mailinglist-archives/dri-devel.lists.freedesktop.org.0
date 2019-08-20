Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB994959D6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0235E6E625;
	Tue, 20 Aug 2019 08:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715C96E625
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:41:14 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r3so11486477wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYkJZ7ygqpGVyziIAkPglTpFbYkqx1ZCclLUpHigUPc=;
 b=mr36A/KVvmWnO4MFoAnfljM95/qmRXqf5Tu+fph4k0XnhZZnHw5bbVPcC+Tu316Mnl
 9xMfoIPQAfafWCw0IDku7X7PWE6CAvq9CfM7NZBcs53fxoCarbTAs7/QgATLIkFbbfvA
 V1nKPEKKDV8YISTcM5h0xr1HUg2hPzAZrokPJ8uPG8BNY7PlGmWZuN88+xBo1IpVbecq
 4A4ewqwFQr9Cff2qksanPscS1ADyc/GQnPnjypQS7Y1C/WqW30fK2f2+JRFl4f5gsd4u
 YY0s08xrq6QhzGIITVHHdghc77GjA9j7IlVCuvLTIwa8pjbnBSueRsB5K5ez0YCpuP9M
 xz2w==
X-Gm-Message-State: APjAAAV3i8y8gEy0tsJnBuef3ZT8+P8EZMpkNQPZjgETLmwLantUzDsZ
 mgoEoH/T74hl8niqAZTVGheITQ==
X-Google-Smtp-Source: APXvYqx2KIAs3etJ5JAW81f4A9TpNQ2I/pe1woSnHDb8DN4a16tSMefBVnJ06dg+YaHBCRBfu4g3Uw==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr33798582wrs.88.1566290472758; 
 Tue, 20 Aug 2019 01:41:12 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 00/11] drm/bridge: dw-hdmi: implement bus-format negotiation and
 YUV420 support
Date: Tue, 20 Aug 2019 10:40:58 +0200
Message-Id: <20190820084109.24616-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYkJZ7ygqpGVyziIAkPglTpFbYkqx1ZCclLUpHigUPc=;
 b=bfTxW2jv1ZNeSc5mHCdK2zcQw/vzn63re+UOQJv+x3SzSIXCNj48qza9cBPl33mDur
 fkd7FSvNI6j0nQOMXHlNy2RKNW/OAblqxe7e3Y9a9CD+6+mnxhINF4+inEG08sYdYli7
 yGUF1VmcEwSQh/uY/uOXHL9L0NQfcBmNFYSlnCmY8/bo+nDUXnnXlOpg40jRsU/FCGLY
 syOe1ZtHCv9HilqtHXRrilzK079KfD+/+7J1KnrufjX3RmwISfiIlMZ370rda3isfo//
 A5jasBfjs354i7zIkKR6IdINsDYQsn2ufZj5K52QXgETl25iF1t25rlKXgj7KdQ+QcwA
 TNbQ==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBpcyBiYXNlZCBvbiBCb3JpcydzICJkcm06IEFkZCBzdXBwb3J0IGZvciBi
dXMtZm9ybWF0IG5lZ290aWF0aW9uIiBSRkMgYXQgWzFdCnBhdGNoc2V0IHRvIGltcGxlbWVudCA6
Ci0gYmFzaWMgYnVzLWZvcm1hdCBuZWdvdGlhdGlvbiBmb3IgRFctSERNSQotIGFkdmFuY2VkIEhE
TUkyLjAgWVVWNDIwIGJ1cy1mb3JtYXQgbmVnb3RpYXRpb24gZm9yIERXLUhETUkKCkFuZCB0aGUg
Y291bnRlcnBhcnQgaW1wbGVtZW50YXRpb24gaW4gdGhlIEFtbG9naWMgTWVzb24gVlBVIGR3LWhk
bWkgZ2x1ZSA6Ci0gYmFzaWMgYnVzLWZvcm1hdCBuZWdvdGlhdGlvbiB0byBzZWxlY3QgWVVWNDQ0
IGJ1cy1mb3JtYXQgYXMgRFctSERNSSBpbnB1dAotIFlVVjQyMCBzdXBwb3J0IHdoZW4gSERNSTIu
MCBZVVY0MjAgbW9kZXNldAoKVGhpcyBpcyBhIGZvbGxvdy11cCBmcm9tIHRoZSBwcmV2aW91cyBh
dHRlbXB0cyA6Ci0gImRybS9tZXNvbjogQWRkIHN1cHBvcnQgZm9yIEhETUkyLjAgWVVWNDIwIDRr
NjAiIGF0IFsyXQotICJkcm0vbWVzb246IEFkZCBzdXBwb3J0IGZvciBIRE1JMi4wIDRrNjAiIGF0
IFszXQoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8y
MDE5MDgwODE1MTE1MC4xNjMzNi0xLWJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tClsyXSBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA1MjAxMzM3
NTMuMjM4NzEtMS1uYXJtc3Ryb25nQGJheWxpYnJlLmNvbQpbM10gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzE1NDkwMjI4NzMtNDA1NDktMS1naXQtc2VuZC1l
bWFpbC1uYXJtc3Ryb25nQGJheWxpYnJlLmNvbQoKTmVpbCBBcm1zdHJvbmcgKDExKToKICBmaXh1
cCEgZHJtL2JyaWRnZTogQWRkIHRoZSBuZWNlc3NhcnkgYml0cyB0byBzdXBwb3J0IGJ1cyBmb3Jt
YXQKICAgIG5lZ290aWF0aW9uCiAgZHJtL21lc29uOiB2ZW5jOiBtYWtlIGRybV9kaXNwbGF5X21v
ZGUgY29uc3QKICBkcm0vbWVzb246IG1lc29uX2R3X2hkbWk6IHN3aXRjaCB0byBkcm1fYnJpZGdl
X2Z1bmNzCiAgZHJtL2JyaWRnZTogc3lub3BzeXM6IGR3LWhkbWk6IGFkZCBiYXNpYyBicmlkZ2Vf
YXRvbWljX2NoZWNrCiAgZHJtL2JyaWRnZTogc3lub3BzeXM6IGR3LWhkbWk6IHVzZSBuZWdvY2lh
dGVkIGJ1cyBmb3JtYXRzCiAgZHJtL21lc29uOiBkdy1oZG1pOiBzdG9wIGVuZm9yY2luZyBpbnB1
dF9idXNfZm9ybWF0CiAgZHJtL2JyaWRnZTogZHctaGRtaTogYWxsb3cgeWNiY3I0MjAgbW9kZXMg
Zm9yID49IDB4MjAwYQogIGRybS9icmlkZ2U6IHN5bm9wc3lzOiBkdy1oZG1pOiBhZGQgNDIwIG1v
ZGUgZm9ybWF0IG5lZ29jaWF0aW9uCiAgZHJtL21lc29uOiB2ZW5jOiBhZGQgc3VwcG9ydCBmb3Ig
WVVWNDIwIHNldHVwCiAgZHJtL21lc29uOiB2Y2xrOiBhZGQgc3VwcG9ydCBmb3IgWVVWNDIwIHNl
dHVwCiAgZHJtL21lc29uOiBBZGQgWVVWNDIwIG91dHB1dCBzdXBwb3J0CgogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAgOTcgKysrKysrKysrKysrKysrLQogZHJp
dmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyAgICAgICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgICAgIHwgMTM1ICsrKysrKysrKysrKysrKysr
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgICAgICAgIHwgIDkzICsr
KysrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuaCAgICAgICAg
fCAgIDcgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmMgICAgICAgIHwgICA4
ICstCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5oICAgICAgICB8ICAxMyArKy0K
IGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jX2N2YnMuYyAgIHwgICAzICstCiBpbmNs
dWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAgICAgICB8ICAgMSArCiA5IGZpbGVzIGNo
YW5nZWQsIDI5NSBpbnNlcnRpb25zKCspLCA2OCBkZWxldGlvbnMoLSkKCi0tIAoyLjIyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
