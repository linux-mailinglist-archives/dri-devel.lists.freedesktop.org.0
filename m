Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E90F71089C3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0865C89F6F;
	Mon, 25 Nov 2019 08:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AF36E421
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 17:44:00 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id q1so7669555ile.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 09:44:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h56fbOK3LHFOKb7PeCUiHytHW+/rGe2pqRatOmUTizE=;
 b=brDuI+dVPenv1ajPCg6nlaQGJdfNEUCOfmaq+KgiHdUWvyQ7XYfZ6yf75FXlqm4Y98
 bY2ox6nVIO3X+HbXAFCA6z7jbrU6QpHQY/XAURiTokSDsEH7/snvAsNkPVLxMqZZ6lQU
 h7RN3HsXgxRts1PofQxIzrjl0stvjRqLEQLKOFGhIn0xKzWjcChDf6oFiNH/eOTgGsk0
 zFZriB1zhp0LaX2XX9x0qDwd3UVQS1Ofn3exjIC0zHqkOoelN7tsH6PULJN77fCPCirI
 k77q5Dj36Zo6bHcRIbqkFCTT/gFpFJ8Dwh+58izwsqURW5l+cWlYOmp4EKrk72+n6cnm
 l1Yw==
X-Gm-Message-State: APjAAAX3ggb8BY2RCeD6/Saf8njWIGsXmEzNIRR/bHstUpdvPcw1oX1G
 7fpYQBgPQ+iCUGKCOHzed+Zijsl/uhyr3LbHnO4=
X-Google-Smtp-Source: APXvYqxzFpQ6pRsKd5kK7vHYgkg7tAi4FAri6/7IjJHemZSmhcn2nnbMvZcqGvxWpgXjKAsyLm4J4dz/lukT/Cw6jng=
X-Received: by 2002:a92:3b0c:: with SMTP id i12mr16763619ila.190.1574444639533; 
 Fri, 22 Nov 2019 09:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <CAEkB2EQGCcwBO4iZBiHthUAJUeprw2Q09932GATd6XVyXqukzw@mail.gmail.com>
 <20191122072239.dhbhi2uawoqsclwy@pengutronix.de>
In-Reply-To: <20191122072239.dhbhi2uawoqsclwy@pengutronix.de>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Fri, 22 Nov 2019 11:43:48 -0600
Message-ID: <CAEkB2EQAgmZwGSRyo2XC-1+Ls2MDdm-fxLY5P1SRAjyhNeUiXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/imx: fix memory leak in imx_pd_bind
To: Marco Felsch <m.felsch@pengutronix.de>
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=h56fbOK3LHFOKb7PeCUiHytHW+/rGe2pqRatOmUTizE=;
 b=BAjnLsTnSFBrVpp7SbyUz3Wk9Is7kL28zcQMGo2DO7JYFVPuoJBIHxIG1/OubuirXN
 Mu71/CxnBI1G0V+RFU9nkxqlM2Tai34cHtWlnP/GgBN8qmEOTPbOfAqz586TaKblpcsN
 XqBFi33fpuTJB+gHo82418deD2vILz1OKzqMRIBcjdKtt8T55P8Hc8T5F5OTkAivenPq
 5852UBtaEqRqJXOhqu4eTtlPMzFEK08llX6LHvDiUCF2dsMATTIOMPuCxqRUupwRb/5+
 dyzqwFOzXIVUJBbH1sJFcD4/RYl/zp72F0dGnF+XxsjpjIt5uTI4QyGUj9iMUGvZuB2V
 /Hqw==
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Navid Emamdoost <emamd001@umn.edu>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgdXBkYXRlLgoKT24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMToyMiBBTSBN
YXJjbyBGZWxzY2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEhpIE5hdmlk
LAo+Cj4gT24gMTktMTEtMjEgMTI6MzEsIE5hdmlkIEVtYW1kb29zdCB3cm90ZToKPiA+IE9uIEZy
aSwgT2N0IDQsIDIwMTkgYXQgMjowOSBQTSBOYXZpZCBFbWFtZG9vc3QKPiA+IDxuYXZpZC5lbWFt
ZG9vc3RAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSW4gaW14X3BkX2JpbmQsIHRoZSBk
dXBsaWNhdGVkIG1lbW9yeSBmb3IgaW14cGQtPmVkaWQgdmlhIGttZW1kdXAgc2hvdWxkCj4gPiA+
IGJlIHJlbGVhc2VkIGluIGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZSBvciBpbXhfcGRfcmVn
aXN0ZXIgZmFpbC4KPiA+ID4KPiA+ID4gRml4ZXM6IGViYzk0NDYxMzU2NyAoImRybTogY29udmVy
dCBkcml2ZXJzIHRvIHVzZSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UiKQo+ID4gPiBGaXhl
czogMTkwMjJhYWFlNjc3ICgic3RhZ2luZzogZHJtL2lteDogQWRkIHBhcmFsbGVsIGRpc3BsYXkg
c3VwcG9ydCIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5hdmlkIEVtYW1kb29zdCA8bmF2aWQuZW1h
bWRvb3N0QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPgo+ID4gV291bGQgeW91IHBsZWFzZSByZXZp
ZXcgdGhpcyBwYXRjaD8KPiA+Cj4gPiBUaGFua3MsCj4KPiBJIGN1cnJlbnRseSB3b3JrIG9uIHRo
ZSBkcm0vaW14IGRyaXZlcihzKSB0byBhdm9pZCBlcnJvcnMgbGlrZSBbMV0uCj4gSG9wZWZ1bGx5
IEkgaGF2ZSBhIHdvcmtpbmcgdmVyc2lvbiB0aWxsIG5leHQgd2Vlay4gVGhlcmUgSSBmaXhlZCB0
aGlzCj4gaXNzdWUgYnkgdXNpbmcgdGhlIGRldm1fa21lbWR1cCgpIGFuZCBkcm9wcGVkIHRoZSBl
eHBsaWNpdCBrZnJlZSgpCj4gd2l0aGluIHVuYmluZCgpLgo+Cj4gWzFdIGh0dHBzOi8vd3d3LnNw
aW5pY3MubmV0L2xpc3RzL2RyaS1kZXZlbC9tc2cxODkzODguaHRtbAo+Cj4gUmVnYXJkcywKPiAg
IE1hcmNvCj4KPiA+Cj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXku
YyB8IDggKysrKysrLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14
L3BhcmFsbGVsLWRpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxh
eS5jCj4gPiA+IGluZGV4IGU3Y2UxNzUwM2FlMS4uOTUyMmQyY2IwYWQ1IDEwMDY0NAo+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYwo+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYwo+ID4gPiBAQCAtMjI3LDE0ICsy
MjcsMTggQEAgc3RhdGljIGludCBpbXhfcGRfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiA+ID4KPiA+ID4gICAgICAgICAvKiBwb3J0
QDEgaXMgdGhlIG91dHB1dCBwb3J0ICovCj4gPiA+ICAgICAgICAgcmV0ID0gZHJtX29mX2ZpbmRf
cGFuZWxfb3JfYnJpZGdlKG5wLCAxLCAwLCAmaW14cGQtPnBhbmVsLCAmaW14cGQtPmJyaWRnZSk7
Cj4gPiA+IC0gICAgICAgaWYgKHJldCAmJiByZXQgIT0gLUVOT0RFVikKPiA+ID4gKyAgICAgICBp
ZiAocmV0ICYmIHJldCAhPSAtRU5PREVWKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBrZnJlZShp
bXhwZC0+ZWRpZCk7Cj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiArICAg
ICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICBpbXhwZC0+ZGV2ID0gZGV2Owo+ID4gPgo+ID4gPiAg
ICAgICAgIHJldCA9IGlteF9wZF9yZWdpc3Rlcihkcm0sIGlteHBkKTsKPiA+ID4gLSAgICAgICBp
ZiAocmV0KQo+ID4gPiArICAgICAgIGlmIChyZXQpIHsKPiA+ID4gKyAgICAgICAgICAgICAgIGtm
cmVlKGlteHBkLT5lZGlkKTsKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+
ICsgICAgICAgfQo+ID4gPgo+ID4gPiAgICAgICAgIGRldl9zZXRfZHJ2ZGF0YShkZXYsIGlteHBk
KTsKPiA+ID4KPiA+ID4gLS0KPiA+ID4gMi4xNy4xCj4gPiA+Cj4gPgo+ID4KPiA+IC0tCj4gPiBO
YXZpZC4KPiA+Cj4gPgo+Cj4gLS0KPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+IFN0ZXVlcndhbGRlciBT
dHIuIDIxICAgICAgICAgICAgICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUv
ICB8Cj4gMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAgICAgICAgICAgICAgICAgIHwgUGhvbmU6
ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKPiBBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4
NiAgICAgICAgICAgfCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTU1NTUgfAoKCgotLSAKTmF2aWQu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
