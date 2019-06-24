Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C95F50243
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 08:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961158957B;
	Mon, 24 Jun 2019 06:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74C88957B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 06:26:30 +0000 (UTC)
Received: from localhost (unknown [116.247.127.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BADB821670;
 Mon, 24 Jun 2019 06:26:28 +0000 (UTC)
Date: Mon, 24 Jun 2019 05:23:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 00/28] drivers: Consolidate device lookup helpers
Message-ID: <20190624032348.GA28919@kroah.com>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561357590;
 bh=Y3tO6322kAem1bdW9lZFU/O4PG4zUOyQ61thLFj0Jx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=htFsW7qr6Qj9QwJdRe7RCHfnZ1bTieWWNheSEb5znLJ2xvRAs926/5WkNObf13eOF
 f3OKqYo54tR7NHcQVz9j+FG0XLC9I6A5qk22IxM5o6MLYsUqvAD7GrqdiYxru9PazM
 LqtBNk2+xJkrOZ8sAG0XTIBTwG2p30iIdIpXUqXw=
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
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 rafael@kernel.org, Will Deacon <will.deacon@arm.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, Stefan Schmidt <stefan@datenfreihafen.org>,
 Wolfram Sang <wsa@the-dreams.de>, linux-acpi@vger.kernel.org,
 Doug Ledford <dledford@redhat.com>, Jiri Slaby <jslaby@suse.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Dan Murphy <dmurphy@ti.com>,
 linux-usb@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Joe Perches <joe@perches.com>, linux-wpan@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, "Rafael J . Wysocki " <rjw@rjwysocki.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Len Brown <lenb@kernel.org>, Corey Minyard <minyard@acm.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Oliver Neukum <oneukum@suse.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Thor Thayer <thor.thayer@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-fpga@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Elie Morisse <syniurge@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 David Kershner <david.kershner@unisys.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>, Felipe Balbi <balbi@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@arm.com>,
 Peter Rosin <peda@axentia.se>, Alexander Aring <alex.aring@gmail.com>,
 Sebastian Ott <sebott@linux.ibm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Andreas Noever <andreas.noever@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nehal Shah <nehal-bakulchandra.shah@amd.com>,
 devicetree@vger.kernel.org, Alan Tull <atull@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Takashi Iwai <tiwai@suse.com>,
 Moritz Fischer <mdf@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDY6NTM6NTVQTSArMDEwMCwgU3V6dWtpIEsgUG91bG9z
ZSB3cm90ZToKPiBXZSBoYXZlIGRldmljZSBpdGVyYXRvcnMgdG8gZmluZCBhIHBhcnRpY3VsYXIg
ZGV2aWNlIG1hdGNoaW5nIGEgY3JpdGVyaWEKPiBmb3IgYSBnaXZlbiBidXMvY2xhc3MvZHJpdmVy
LiBpLmUsIHtidXMsY2xhc3MsZHJpdmVyfV9maW5kX2RldmljZSgpIEFQSXMuCj4gVGhlIG1hdGNo
aW5nIGNyaXRlcmlhIGlzIGEgZnVuY3Rpb24gcG9pbnRlciBmb3IgdGhlIEFQSXMuIE9mdGVuIHRo
ZSBsb29rdXAKPiBpcyBiYXNlZCBvbiBhIGdlbmVyaWMgcHJvcGVydHkgb2YgYSBkZXZpY2UgKGUu
ZywgbmFtZSwgZndub2RlLCBvZiBub2RlIHBvaW50ZXIKPiBvciBkZXZpY2UgdHlwZSkgcmF0aGVy
IHRoYW4gYSBkcml2ZXIgc3BlY2lmaWMgaW5mb3JtYXRpb24uIEhvd2V2ZXIsIGVhY2ggZHJpdmVy
Cj4gd3JpdGVzIHVwIGl0cyBvd24gIm1hdGNoIiBmdW5jdGlvbiwgc3BpbGxpbmcgdGhlIHNpbWls
YXIgbWF0Y2ggZnVuY3Rpb25zIGFsbAo+IG92ZXIgdGhlIGRyaXZlciBzdWJzeXN0ZW1zLgo+IAo+
IEFkZGl0aW9uYWxseSB0aGUgcHJvdG90eXBlIGZvciB0aGUgIm1hdGNoIiBmdW5jdGlvbnMgYWNj
ZXB0ZWQgYnkgdGhlIGFib3ZlIEFQSXMKPiBoYXZlIGEgbWludXRlIGRpZmZlcmVuY2Ugd2hpY2gg
cHJldmVudHMgdXMgb3RoZXJ3aXNlIHNoYXJpbmcgdGhlIG1hdGNoIGZ1bmN0aW9ucy4KPiBpLmUs
Cj4gCWludCAoKm1hdGNoKShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpIGZvciB7YnVz
L2RyaXZlcn1fZmluZF9kZXZpY2UoKQo+IAkgIHZzCj4gCWludCAoKm1hdGNoKShzdHJ1Y3QgZGV2
aWNlICpkZXYsIGNvbnN0IHZvaWQgKikgZm9yIGNsYXNzX2ZpbmRfZGV2aWNlKCkKPiAKPiBJZiB3
ZSBwcm9tb3RlIHRoZSBmb3JtZXIgdG8gYWNjZXB0IGEgImNvbnN0IHZvaWQqIiBwYXJhbWV0ZXIs
IHdlIGNvdWxkIHNoYXJlIG9uZQo+IHNpbmdsZSBtYXRjaCBmdW5jdGlvbiBmb3IgYWxsIHRoZSBo
ZWxwZXJzLiBUaGlzIHNlcmllcyBhY2hpZXZlcyB0aGUgZm9sbG93aW5nOgo+IAo+ICBhKSBbUGF0
Y2hlcyAwMy0wNV0gVW5pZnkgdGhlIHByb3RvdHlwZSBmb3IgIm1hdGNoIiBmdW5jdGlvbnMgYWNj
ZXB0ZWQgYnkgdGhlCj4gICAgICBkZXZpY2UgbG9va3VwIEFQSXMuCgpJJ3ZlIGFwcGxpZWQgdGhl
IGZpcnN0IDYgcGF0Y2hlcyBvZiB0aGlzIHNlcmllcyB0byBteSB0cmVlIG5vdy4gIExldCdzCnNl
ZSBob3cgdGhhdCBnb2VzLCBhbmQgdGhpcyBzaG91bGQgZ2l2ZSB5b3UgYSBtb3JlIHNvbGlkIGJh
c2UgdG8gcmVkbwp0aGUgcmVzdCBvZiB0aGUgc2VyaWVzIG9mZiBvZi4KCnRoYW5rcywKCmdyZWcg
ay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
