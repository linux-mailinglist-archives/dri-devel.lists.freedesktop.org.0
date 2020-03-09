Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9610317F1B6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174166E83D;
	Tue, 10 Mar 2020 08:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Mon, 09 Mar 2020 19:41:25 UTC
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D14089718;
 Mon,  9 Mar 2020 19:41:25 +0000 (UTC)
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Mar 2020 12:35:21 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
 by ironmsg01-sd.qualcomm.com with ESMTP; 09 Mar 2020 12:35:20 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
 id 86E3E4973; Mon,  9 Mar 2020 12:35:20 -0700 (PDT)
From: Guru Das Srinagesh <gurus@codeaurora.org>
To: linux-pwm@vger.kernel.org
Subject: [PATCH v7 02/13] drm/i915: Use 64-bit division macros for period and
 duty cycle
Date: Mon,  9 Mar 2020 12:35:05 -0700
Message-Id: <eef99b87cd71e8442b944d547d73079b900d24d8.1583782035.git.gurus@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1583782035.git.gurus@codeaurora.org>
References: <cover.1583782035.git.gurus@codeaurora.org>
In-Reply-To: <cover.1583782035.git.gurus@codeaurora.org>
References: <cover.1583782035.git.gurus@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVjYXVzZSBwZXJpb2QgYW5kIGR1dHkgY3ljbGUgYXJlIGRlZmluZWQgaW4gdGhlIFBXTSBmcmFt
ZXdvcmsgc3RydWN0cwphcyBpbnRzIHdpdGggdW5pdHMgb2YgbmFub3NlY29uZHMsIHRoZSBtYXhp
bXVtIHRpbWUgZHVyYXRpb24gdGhhdCBjYW4gYmUKc2V0IGlzIGxpbWl0ZWQgdG8gfjIuMTQ3IHNl
Y29uZHMuIFJlZGVmaW5pbmcgdGhlbSBhcyB1NjQgdmFsdWVzIHdpbGwKZW5hYmxlIGxhcmdlciB0
aW1lIGR1cmF0aW9ucyB0byBiZSBzZXQuCgpBcyBhIGZpcnN0IHN0ZXAsIHByZXBhcmUgZHJpdmVy
cyB0byBoYW5kbGUgdGhlIHN3aXRjaCB0byB1NjQgcGVyaW9kIGFuZApkdXR5X2N5Y2xlIGJ5IHJl
cGxhY2luZyBkaXZpc2lvbiBvcGVyYXRpb25zIGludm9sdmluZyBwd20gcGVyaW9kIGFuZCBkdXR5
IGN5Y2xlCndpdGggdGhlaXIgNjQtYml0IGVxdWl2YWxlbnRzIGFzIGFwcHJvcHJpYXRlLiBUaGUg
YWN0dWFsIHN3aXRjaCB0byB1NjQgcGVyaW9kCmFuZCBkdXR5X2N5Y2xlIGZvbGxvd3MgYXMgYSBz
ZXBhcmF0ZSBwYXRjaC4KCldoZXJlIHRoZSBkaXZpZGVuZCBpcyA2NC1iaXQgYnV0IHRoZSBkaXZp
c29yIGlzIDMyLWJpdCwgdXNlICpfVUxMCm1hY3JvczoKLSBESVZfUk9VTkRfVVBfVUxMCi0gRElW
X1JPVU5EX0NMT1NFU1RfVUxMCi0gZGl2X3U2NAoKV2hlcmUgdGhlIGRpdmlzb3IgaXMgNjQtYml0
IChkaXZpZGVuZCBtYXkgYmUgMzItYml0IG9yIDY0LWJpdCksIHVzZQpESVY2NF8qIG1hY3JvczoK
LSBESVY2NF9VNjRfUk9VTkRfQ0xPU0VTVAotIGRpdjY0X3U2NAoKQ2M6IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5s
YWh0aW5lbkBsaW51eC5pbnRlbC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6ICJWaWxsZSBTeXJqw6Rsw6QiIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKClNpZ25lZC1vZmYtYnk6IEd1
cnUgRGFzIFNyaW5hZ2VzaCA8Z3VydXNAY29kZWF1cm9yYS5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wYW5lbC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9wYW5lbC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9wYW5lbC5jCmluZGV4IGJjMTRlOWMuLjg0M2NhYzEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3BhbmVsLmMKQEAgLTE4NjgsNyArMTg2OCw3IEBAIHN0YXRp
YyBpbnQgcHdtX3NldHVwX2JhY2tsaWdodChzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0
b3IsCiAKIAlwYW5lbC0+YmFja2xpZ2h0Lm1pbiA9IDA7IC8qIDAlICovCiAJcGFuZWwtPmJhY2ts
aWdodC5tYXggPSAxMDA7IC8qIDEwMCUgKi8KLQlwYW5lbC0+YmFja2xpZ2h0LmxldmVsID0gRElW
X1JPVU5EX1VQKAorCXBhbmVsLT5iYWNrbGlnaHQubGV2ZWwgPSBESVZfUk9VTkRfVVBfVUxMKAog
CQkJCSBwd21fZ2V0X2R1dHlfY3ljbGUocGFuZWwtPmJhY2tsaWdodC5wd20pICogMTAwLAogCQkJ
CSBDUkNfUE1JQ19QV01fUEVSSU9EX05TKTsKIAlwYW5lbC0+YmFja2xpZ2h0LmVuYWJsZWQgPSBw
YW5lbC0+YmFja2xpZ2h0LmxldmVsICE9IDA7Ci0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBD
ZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgdGhlIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4
IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
