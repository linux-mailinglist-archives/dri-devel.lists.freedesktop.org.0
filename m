Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C55750A1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DB76E658;
	Thu, 25 Jul 2019 14:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9002B6E658
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:10:39 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0473C21901;
 Thu, 25 Jul 2019 14:10:38 +0000 (UTC)
Date: Thu, 25 Jul 2019 16:10:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v3 0/7] drivers: Add generic device lookup helpers
Message-ID: <20190725141036.GA14950@kroah.com>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723221838.12024-1-suzuki.poulose@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564063839;
 bh=QUqOIOoHSMKGIIsOWkkikVJXINlvu9CZz1Q2Ad7lvLE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zu7+pTjDMCtmazggF8ASNBb5KxzlcUipTBKbi7O3melHNIDQO4WtfRK6MzP1/f92U
 iJIrXb89Q6o4rqqbWNPMJL5vcDHG2OTn7nHV6ZzhH0UMEuizuTURSmDm6wd/VKIX5j
 cnN8aAtpVGyaoRxbAhw/IYKTLAZHb3Z9+8lOVN8U=
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, rafael@kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-fpga@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Elie Morisse <syniurge@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-acpi@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 David Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Stefan Schmidt <stefan@datenfreihafen.org>, Wolfram Sang <wsa@the-dreams.de>,
 Jiri Slaby <jslaby@suse.com>, linux-rockchip@lists.infradead.org,
 Tomas Winkler <tomas.winkler@intel.com>,
 Nehal Shah <nehal-bakulchandra.shah@amd.com>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Alan Tull <atull@kernel.org>,
 Will Deacon <will.deacon@arm.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Peter Rosin <peda@axentia.se>, Mark Brown <broonie@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>, Dan Murphy <dmurphy@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Takashi Iwai <tiwai@suse.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Thor Thayer <thor.thayer@linux.intel.com>,
 linux-usb@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Oliver Neukum <oneukum@suse.com>, Joe Perches <joe@perches.com>,
 Moritz Fischer <mdf@kernel.org>, linux-wpan@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMTE6MTg6MzFQTSArMDEwMCwgU3V6dWtpIEsgUG91bG9z
ZSB3cm90ZToKPiBXZSBoYXZlIGRldmljZSBpdGVyYXRvcnMgdG8gZmluZCBhIHBhcnRpY3VsYXIg
ZGV2aWNlIG1hdGNoaW5nIGEgY3JpdGVyaWEKPiBmb3IgYSBnaXZlbiBidXMvY2xhc3MvZHJpdmVy
LiBpLmUsIHtidXMsY2xhc3MsZHJpdmVyfV9maW5kX2RldmljZSgpCj4gQVBJcy4gVGhlIG1hdGNo
aW5nIGNyaXRlcmlhIGlzIGEgZnVuY3Rpb24gcG9pbnRlciBmb3IgdGhlIEFQSXMuIE9mdGVuIHRo
ZQo+IGxvb2t1cCBpcyBiYXNlZCBvbiBhIGdlbmVyaWMgcHJvcGVydHkgb2YgYSBkZXZpY2UgKGUu
ZywgbmFtZSwgZndub2RlLCBvZiBub2RlCj4gcG9pbnRlciBvciBkZXZpY2UgdHlwZSkgcmF0aGVy
IHRoYW4gYSBkcml2ZXIgc3BlY2lmaWMgaW5mb3JtYXRpb24uIEhvd2V2ZXIsIGVhY2gKPiBkcml2
ZXIgd3JpdGVzIHVwIGl0cyBvd24gIm1hdGNoIiBmdW5jdGlvbiwgc3BpbGxpbmcgdGhlIHNpbWls
YXIgbWF0Y2ggZnVuY3Rpb25zCj4gYWxsIG92ZXIgdGhlIGRyaXZlciBzdWJzeXN0ZW1zLgo+IAo+
IFRoaXMgc2VyaWVzIGFkZHMgZGV2aWNlIG1hdGNoIGhlbHBlcnMgYnkgZ2VuZXJpYyBkZXZpY2Ug
cHJvcGVydGllcyBvZiBhIGRldmljZS4KPiBVc2luZyB0aGVzZSBnZW5lcmljIG1hdGNoIGZ1bmN0
aW9ucywgaW50cm9kdWNlIHdyYXBwZXJzIHRvIHRoZSBleGlzdGluZwo+ICAqX2ZpbmRfZGV2aWNl
KCkgaGVscGVycyBhbmQgY29udmVydHMgdGhlIGV4aXN0aW5nIHVzZXJzIHRvIHVzZSB0aGUgbmV3
IHdyYXBwZXJzLgo+ICBpLmUsCj4gCXtidXMvY2xhc3MvZHJpdmVyfV9maW5kX2RldmljZV9ieV9u
YW1lKCkKPiAJe2J1cy9jbGFzcy9kcml2ZXJ9X2ZpbmRfZGV2aWNlX2J5X2Z3bm9kZSgpCj4gCXti
dXMvY2xhc3MvZHJpdmVyfV9maW5kX2RldmljZV9ieV9kZXZ0KCkKPiAJe2J1cy9jbGFzcy9kcml2
ZXJ9X2ZpbmRfZGV2aWNlX2J5X2FjcGlfZGV2KCkKPiAKPiBBbHNvIGFkZHMgYSB3cmFwcGVyIGZv
ciBmaW5kaW5nIGEgcGxhdGZvcm0gZGV2aWNlIGJ5IGRyaXZlciwgdG8gYXZvaWQKPiBzcGlsbGlu
ZyB0aGUgcGxhdGZvcm1fYnVzIGludGVybmFscyBpbiB0aGUgaW5kaXZpZHVhbCBkcml2ZXJzLiBB
cHBsaWVzCj4gb24gNS4zLXJjMS4KPiAKPiAgICBbMF0gZ2l0Oi8vbGludXgtYXJtLm9yZy9saW51
eC1za3AuZ2l0IGRyaXZlci1jbGVhbnVwL3YzCj4gUkZDWzFdIGh0dHBzOi8vbWFyYy5pbmZvLz9p
PTE1NTk1NzcwMjMtNTU4LTEtZ2l0LXNlbmQtZW1haWwtc3V6dWtpLnBvdWxvc2VAYXJtLmNvbQo+
IFYxIFsyXSBodHRwczovL21hcmMuaW5mby8/aT0xNTU5NzQ3NjMwLTI4MDY1LTEtZ2l0LXNlbmQt
ZW1haWwtc3V6dWtpLnBvdWxvc2VAYXJtLmNvbQo+IFYyIFszXSBodHRwczovL21hcmMuaW5mby8/
aT0xNTYwNTM0ODYzLTE1MTE1LTEtZ2l0LXNlbmQtZW1haWwtc3V6dWtpLnBvdWxvc2VAYXJtLmNv
bQo+IAo+IENoYW5nZXMgc2luY2UgdjI6Cj4gIC0gTWVyZ2UgdGhlIGRldmljZSBtYXRjaCBoZWxw
ZXIgaW50cm9kdWN0aW9uIHBhdGNoIHdpdGggdGhlIHZhcmlhbnRzCj4gICAgb2YgdGhlIGhlbHBl
cnMsIGZvciBiZXR0ZXIgcmV2aWV3Lgo+ICAtIFVzZSBwbGF0Zm9ybV9maW5kX2RldmljZV9ieV9k
cml2ZXIgZm9yIG1jZGUgZHJtIGRyaXZlci4KClRoaXMgbG9va3MgZ29vZCB0byBtZSBhdCBmaXJz
dCBnbGFuY2UsIHRoYW5rcyBmb3IgZG9pbmcgdGhpcyB3b3JrLgoKSSdsbCB3YWl0IGEgZmV3IGRh
eXMgdG8gY29sbGVjdCBhY2tzIGZyb20gdmFyaW91cyBzdWJzeXN0ZW0gbWFpbnRhaW5lcnMKYmVm
b3JlIHRha2luZyB0aGUgc2VyaWVzIGluIG15IHRyZWUuCgp0aGFua3MsCgpncmVnIGstaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
