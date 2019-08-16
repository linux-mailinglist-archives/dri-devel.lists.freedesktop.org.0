Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473449014B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 14:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0B66E332;
	Fri, 16 Aug 2019 12:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7456E332
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 12:22:39 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F12857E;
 Fri, 16 Aug 2019 14:22:37 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] video: omapfb2: Make standard and custom panel drivers
 mutually exclusive
Date: Fri, 16 Aug 2019 15:22:27 +0300
Message-Id: <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565958157;
 bh=rjvp1RmWK0sVe6TK+0PvZMWdlnGItJJESJFP4zbkC6I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fuwke+78VZyndblNAB+2m5ezCDRs95ZPpZMRtjYpRVrDTAWdGmC6UyyPrsmMMAEkw
 N0PLcYrWR+P3rRs+C7/y5EBLtilj95NZXp4UNPsRd4il/MEzjQWdCHtuoRX3hBSOBF
 A6sZZ/x6w67SSnohjZMfEpJx69gMDKHdPgZat0WE=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RhbmRhcmQgRFJNIHBhbmVsIGRyaXZlcnMgZm9yIHNldmVyYWwgcGFuZWxzIHVzZWQgYnkgb21h
cGZiMiBhcmUgbm93CmF2YWlsYWJsZS4gVGhlaXIgbW9kdWxlIG5hbWUgY2xhc2hlcyB3aXRoIHRo
ZSBtb2R1bGVzIGZyb20KZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvLCBwYXJ0IG9m
IHRoZSBkZXByZWNhdGVkIG9tYXBmYjIgZmJkZXYKZHJpdmVyLiBBcyBvbWFwZmIyIGNhbiBvbmx5
IGJlIGNvbXBpbGVkIHdoZW4gdGhlIG9tYXBkcm0gZHJpdmVyIGlzCmRpc2FibGVkLCBhbmQgdGhl
IERSTSBwYW5lbCBkcml2ZXJzIGFyZSB1c2VsZXNzIGluIHRoYXQgY2FzZSwgbWFrZSB0aGUKb21h
cGZiMiBwYW5lbHMgZGVwZW5kIG9uIHRoZSBzdGFuZGFyZCBEUk0gcGFuZWxzIGJlaW5nIGRpc2Fi
bGVkIHRvIGZpeAp0aGUgbmFtZSBjbGFzaC4KClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9LY29uZmlnIHwgNSArKysrKwogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYv
b21hcDIvb21hcGZiL2Rpc3BsYXlzL0tjb25maWcgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAy
L29tYXBmYi9kaXNwbGF5cy9LY29uZmlnCmluZGV4IDhjMWM1YTRjZmUxOC4uNzQ0NDE2ZGM1MzBl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9L
Y29uZmlnCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL0tj
b25maWcKQEAgLTQ5LDYgKzQ5LDcgQEAgY29uZmlnIEZCX09NQVAyX1BBTkVMX0RTSV9DTQogY29u
ZmlnIEZCX09NQVAyX1BBTkVMX1NPTllfQUNYNTY1QUtNCiAJdHJpc3RhdGUgIkFDWDU2NUFLTSBQ
YW5lbCIKIAlkZXBlbmRzIG9uIFNQSSAmJiBCQUNLTElHSFRfQ0xBU1NfREVWSUNFCisJZGVwZW5k
cyBvbiBEUk1fUEFORUxfU09OWV9BQ1g1NjVBS00gPSBuCiAJaGVscAogCSAgVGhpcyBpcyB0aGUg
TENEIHBhbmVsIHVzZWQgb24gTm9raWEgTjkwMAogCkBAIC02MSwxOCArNjIsMjEgQEAgY29uZmln
IEZCX09NQVAyX1BBTkVMX0xHUEhJTElQU19MQjAzNVEwMgogY29uZmlnIEZCX09NQVAyX1BBTkVM
X1NIQVJQX0xTMDM3VjdEVzAxCiAJdHJpc3RhdGUgIlNoYXJwIExTMDM3VjdEVzAxIExDRCBQYW5l
bCIKIAlkZXBlbmRzIG9uIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UKKwlkZXBlbmRzIG9uIERSTV9Q
QU5FTF9TSEFSUF9MUzAzN1Y3RFcwMSA9IG4KIAloZWxwCiAJICBMQ0QgUGFuZWwgdXNlZCBpbiBU
SSdzIFNEUDM0MzAgYW5kIEVWTSBib2FyZHMKIAogY29uZmlnIEZCX09NQVAyX1BBTkVMX1RQT19U
RDAyOFRURUMxCiAJdHJpc3RhdGUgIlRQTyBURDAyOFRURUMxIExDRCBQYW5lbCIKIAlkZXBlbmRz
IG9uIFNQSQorCWRlcGVuZHMgb24gRFJNX1BBTkVMX1RQT19URDAyOFRURUMxID0gbgogCWhlbHAK
IAkgIExDRCBwYW5lbCB1c2VkIGluIE9wZW5tb2tvLgogCiBjb25maWcgRkJfT01BUDJfUEFORUxf
VFBPX1REMDQzTVRFQTEKIAl0cmlzdGF0ZSAiVFBPIFREMDQzTVRFQTEgTENEIFBhbmVsIgogCWRl
cGVuZHMgb24gU1BJCisJZGVwZW5kcyBvbiBEUk1fUEFORUxfVFBPX1REMDQzTVRFQTEgPSBuCiAJ
aGVscAogCSAgTENEIFBhbmVsIHVzZWQgaW4gT01BUDMgUGFuZG9yYQogCkBAIC04MCw2ICs4NCw3
IEBAIGNvbmZpZyBGQl9PTUFQMl9QQU5FTF9ORUNfTkw4MDQ4SEwxMQogCXRyaXN0YXRlICJORUMg
Tkw4MDQ4SEwxMSBQYW5lbCIKIAlkZXBlbmRzIG9uIFNQSQogCWRlcGVuZHMgb24gQkFDS0xJR0hU
X0NMQVNTX0RFVklDRQorCWRlcGVuZHMgb24gRFJNX1BBTkVMX05FQ19OTDgwNDhITDExID0gbgog
CWhlbHAKIAkgIFRoaXMgTkVDIE5MODA0OEhMMTEgcGFuZWwgaXMgVEZUIExDRCB1c2VkIGluIHRo
ZQogCSAgWm9vbTIvMy8zNjMwIHNkcCBib2FyZHMuCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5j
aGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
