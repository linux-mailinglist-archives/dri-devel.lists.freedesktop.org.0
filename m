Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F62310C03
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FBD6F421;
	Fri,  5 Feb 2021 13:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 561 seconds by postgrey-1.36 at gabe;
 Fri, 05 Feb 2021 13:18:14 UTC
Received: from antares.kleine-koenig.org (antares.kleine-koenig.org
 [94.130.110.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A27C6E284
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 13:18:14 +0000 (UTC)
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
 id D67A7AED6A1; Fri,  5 Feb 2021 14:08:50 +0100 (CET)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] coresight: etm4x: Fix merge resolution for amba rework
Date: Fri,  5 Feb 2021 14:08:47 +0100
Message-Id: <20210205130848.20009-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Feb 2021 13:42:56 +0000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Mike Leach <mike.leach@linaro.org>, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3YXMgbm9uLXRyaXZpYWwgdG8gZ2V0IHJpZ2h0IGJlY2F1c2UgY29tbWl0cwpjMjNiYzM4
MmVmMGUgKCJjb3Jlc2lnaHQ6IGV0bTR4OiBSZWZhY3RvciBwcm9iaW5nIHJvdXRpbmUiKSBhbmQK
NTIxNGI1NjM1ODhlICgiY29yZXNpZ2h0OiBldG00eDogQWRkIHN1cHBvcnQgZm9yIHN5c3JlZyBv
bmx5IGRldmljZXMiKQpjaGFuZ2VkIHRoZSBjb2RlIGZsb3cgY29uc2lkZXJhYmx5LiBXaXRoIHRo
aXMgY2hhbmdlIHRoZSBkcml2ZXIgY2FuIGJlCmJ1aWx0IGFnYWluLgoKRml4ZXM6IDA1NzNkM2Zh
NDg2NCAoIk1lcmdlIGJyYW5jaCAnZGV2ZWwtc3RhYmxlJyBvZiBnaXQ6Ly9naXQuYXJtbGludXgu
b3JnLnVrL35ybWsvbGludXgtYXJtIGludG8gY2hhci1taXNjLW5leHQiKQpTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dXdlQGtsZWluZS1rb2VuaWcub3JnPgotLS0KT24gRnJpLCBG
ZWIgMDUsIDIwMjEgYXQgMTI6MDc6MDlQTSArMDEwMCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3Rl
Ogo+IE9uIEZyaSwgRmViIDA1LCAyMDIxIGF0IDExOjU2OjE1QU0gKzAxMDAsIFV3ZSBLbGVpbmUt
S8O2bmlnIHdyb3RlOgo+ID4gSSBkaWRuJ3QgY29tcGlsZSB0ZXN0LCBidXQgSSdtIHdpbGxpbmcg
dG8gYmV0IHlvdXIgcmVzb2x1dGlvbiBpcyB3cm9uZy4KPiA+IFlvdSBoYXZlIG5vIHJldHVybiBz
dGF0ZW1lbnQgaW4gZXRtNF9yZW1vdmVfZGV2KCkgYnV0IGl0cyByZXR1cm4gdHlwZSBpcwo+ID4g
aW50IGFuZCBldG00X3JlbW92ZV9hbWJhKCkgc3RpbGwgcmV0dXJucyBpbnQgYnV0IHNob3VsZCBy
ZXR1cm4gdm9pZC4KPiAKPiBDYW4geW91IHNlbmQgYSBwYXRjaCB0byBmaXggdGhpcyB1cD8KClN1
cmUsIGhlcmUgaXQgY29tZXMuIEFzIEknbSB1bnN1cmUgaWYgeW91IHdhbnQgdG8gc3F1YXNoIGl0
IGludG8gdGhlCm1lcmdlIG9yIHdhbnQgdG8ga2VlcCBpdCBzZXBhcmF0ZSBJIGNyYWZ0ZWQgYSBj
b21taXQgbWVzc2FnZS4gSWYgeW91CnByZWZlciBzcXVhc2hpbmcgZmVlbCBmcmVlIHRvIGRvIHNv
LgoKVGhpcyBjaGFuZ2UgY29ycmVzcG9uZHMgdG8gdGhlIG1lcmdlIHJlc29sdXRpb24gSSBzdWdn
ZXN0ZWQgYmVmb3JlLgoKQmVzdCByZWdhcmRzClV3ZQoKIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVz
aWdodC9jb3Jlc2lnaHQtZXRtNHgtY29yZS5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHd0
cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtNHgtY29yZS5jIGIvZHJpdmVycy9od3RyYWNp
bmcvY29yZXNpZ2h0L2NvcmVzaWdodC1ldG00eC1jb3JlLmMKaW5kZXggYmM1NWIyNjFhZjIzLi5j
OGVjZDkxZTI4OWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jl
c2lnaHQtZXRtNHgtY29yZS5jCisrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jl
c2lnaHQtZXRtNHgtY29yZS5jCkBAIC0xOTA2LDE1ICsxOTA2LDE2IEBAIHN0YXRpYyBpbnQgX19l
eGl0IGV0bTRfcmVtb3ZlX2RldihzdHJ1Y3QgZXRtdjRfZHJ2ZGF0YSAqZHJ2ZGF0YSkKIAljcHVz
X3JlYWRfdW5sb2NrKCk7CiAKIAljb3Jlc2lnaHRfdW5yZWdpc3RlcihkcnZkYXRhLT5jc2Rldik7
CisKKwlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBfX2V4aXQgZXRtNF9yZW1vdmVfYW1iYShz
dHJ1Y3QgYW1iYV9kZXZpY2UgKmFkZXYpCitzdGF0aWMgdm9pZCBfX2V4aXQgZXRtNF9yZW1vdmVf
YW1iYShzdHJ1Y3QgYW1iYV9kZXZpY2UgKmFkZXYpCiB7CiAJc3RydWN0IGV0bXY0X2RydmRhdGEg
KmRydmRhdGEgPSBkZXZfZ2V0X2RydmRhdGEoJmFkZXYtPmRldik7CiAKIAlpZiAoZHJ2ZGF0YSkK
LQkJcmV0dXJuIGV0bTRfcmVtb3ZlX2RldihkcnZkYXRhKTsKLQlyZXR1cm4gMDsKKwkJZXRtNF9y
ZW1vdmVfZGV2KGRydmRhdGEpOwogfQogCiBzdGF0aWMgaW50IF9fZXhpdCBldG00X3JlbW92ZV9w
bGF0Zm9ybV9kZXYoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKLS0gCjIuMjkuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
