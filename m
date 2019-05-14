Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FDC1E511
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 00:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFEC89330;
	Tue, 14 May 2019 22:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A1A89330
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 22:21:15 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d8so396367lfb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 15:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+OtVSd1FrmNxy/p+usEzY6aM34Bbr0LTU+BRLFlaof8=;
 b=jx279GR7Rlrb0ICv4DmcI5jo4L5gD3wpxE5zvwiCtmTAv0LnmZxW2bnWbABkg49wgJ
 N6yN6JMaLfDjyKCLJBQNi0ONV94LForQnfP2vhy57KdAzHoWALUyCsFsuQH9Fk5M2uVY
 3JVj9wbpI9tKzpIwBqpFfOg0M18aKJKb766nUz4es9ffCje/iTSTZFZwdCwHOsy8GiMY
 hhjDOpTjKr2AIIXae00KaLZ9zWh//dZP8qNKaXY4s/IJQeJJq/REwh+4fBvdoDZsNFAP
 VvAZE6IIHymD9NcI62pgoZRqR6FJP1UN3iW51zaQjXc7r8jDlw/IgBniVlKSlBBQDmnm
 yWTA==
X-Gm-Message-State: APjAAAUIrWtRN/8Inm0ebOqrn8BCiGaseZlsCgk7oC1JdCK4CYtiLJNU
 nJK6bvPSd4gv3mXPn7u13zQe5xHRiTgoZFoBVFse1Q==
X-Google-Smtp-Source: APXvYqy/twYJjwOZb9r2coc1PSAOIHnTXmlPVJwyk16KaXlluPVNflawmyg268sdqFyk/N7+Hg2wii5gdmVnRAqQBio=
X-Received: by 2002:ac2:5621:: with SMTP id b1mr19146942lff.27.1557872471369; 
 Tue, 14 May 2019 15:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <1557758781-23586-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1557758781-23586-1-git-send-email-linux@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 May 2019 00:20:59 +0200
Message-ID: <CACRpkdb6EEchXBSnO5SckGq7MY0z26Fq-=y+uJR=2_SCMC0q+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/pl111: Initialize clock spinlock early
To: Guenter Roeck <linux@roeck-us.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+OtVSd1FrmNxy/p+usEzY6aM34Bbr0LTU+BRLFlaof8=;
 b=W/JH7bf1mRDquIegV2HHEy4q8VzdjuBFV4xy4Dmop/7ucj5+uG3LzXwOBs7jcB+QCY
 OlPN2V+hSjGpnv7LjMhfeDdzLypPCGFb/uCq6Awe/GX/y26kN/E5W8T6MEGJnR72WM/9
 jcaxAEk3lLlQgwbM43n9Qo9mFrkgMfc7Z96GoHZKhNpWLfVLaOkbewgny7oYSJezrpVr
 zSceu2oFk7PJAgb6ro/LNUDGHsDGu9L1pUOaBDBq7eFPDwAbPQnmT8QiAvFPQmz8RTr0
 AHYrc71tqvsExK6e09Y1CwIquCVpzkH+HXd3lHwg+SpKqKXdD54eIchI+o5AONeADMiK
 OhJg==
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgNDo0NiBQTSBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vj
ay11cy5uZXQ+IHdyb3RlOgoKPiBUaGUgZm9sbG93aW5nIHdhcm5pbmcgaXMgc2VlbiBvbiBzeXN0
ZW1zIHdpdGggYnJva2VuIGNsb2NrIGRpdmlkZXIuCj4KPiBJTkZPOiB0cnlpbmcgdG8gcmVnaXN0
ZXIgbm9uLXN0YXRpYyBrZXkuCj4gdGhlIGNvZGUgaXMgZmluZSBidXQgbmVlZHMgbG9ja2RlcCBh
bm5vdGF0aW9uLgo+IHR1cm5pbmcgb2ZmIHRoZSBsb2NraW5nIGNvcnJlY3RuZXNzIHZhbGlkYXRv
ci4KPiBDUFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIgTm90IHRhaW50ZWQgNS4xLjAtMDk2OTgt
ZzFmYjNiNTIgIzEKPiBIYXJkd2FyZSBuYW1lOiBBUk0gSW50ZWdyYXRvci9DUCAoRGV2aWNlIFRy
ZWUpCj4gWzxjMDAxMWJlOD5dICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8YzAwMGViYjg+XSAo
c2hvd19zdGFjaysweDEwLzB4MTgpCj4gWzxjMDAwZWJiOD5dIChzaG93X3N0YWNrKSBmcm9tIFs8
YzA3ZDNmZDA+XSAoZHVtcF9zdGFjaysweDE4LzB4MjQpCj4gWzxjMDdkM2ZkMD5dIChkdW1wX3N0
YWNrKSBmcm9tIFs8YzAwNjBkNDg+XSAocmVnaXN0ZXJfbG9ja19jbGFzcysweDY3NC8weDZmOCkK
PiBbPGMwMDYwZDQ4Pl0gKHJlZ2lzdGVyX2xvY2tfY2xhc3MpIGZyb20gWzxjMDA1ZGUyYz5dCj4g
ICAgICAgICAoX19sb2NrX2FjcXVpcmUrMHg2OC8weDIxMjgpCj4gWzxjMDA1ZGUyYz5dIChfX2xv
Y2tfYWNxdWlyZSkgZnJvbSBbPGMwMDYwNDA4Pl0gKGxvY2tfYWNxdWlyZSsweDExMC8weDIxYykK
PiBbPGMwMDYwNDA4Pl0gKGxvY2tfYWNxdWlyZSkgZnJvbSBbPGMwN2Y3NTVjPl0gKF9yYXdfc3Bp
bl9sb2NrKzB4MzQvMHg0OCkKPiBbPGMwN2Y3NTVjPl0gKF9yYXdfc3Bpbl9sb2NrKSBmcm9tIFs8
YzA1MzZjOGM+XQo+ICAgICAgICAgKHBsMTExX2Rpc3BsYXlfZW5hYmxlKzB4ZjgvMHg1ZmMpCj4g
WzxjMDUzNmM4Yz5dIChwbDExMV9kaXNwbGF5X2VuYWJsZSkgZnJvbSBbPGMwNTAyZjU0Pl0KPiAg
ICAgICAgIChkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfbW9kZXNldF9lbmFibGVzKzB4MWVjLzB4
MjQ0KQo+Cj4gU2luY2UgY29tbWl0IGVlZGQ2MDMzYjRjOCAoImRybS9wbDExMTogU3VwcG9ydCB2
YXJpYW50cyB3aXRoIGJyb2tlbiBjbG9jawo+IGRpdmlkZXIiKSwgdGhlIHNwaW5sb2NrIGlzIG5v
dCBpbml0aWFsaXplZCBpZiB0aGUgY2xvY2sgZGl2aWRlciBpcyBicm9rZW4uCj4gSW5pdGlhbGl6
ZSBpdCBlYXJsaWVyIHRvIGZpeCB0aGUgcHJvYmxlbS4KPgo+IEZpeGVzOiBlZWRkNjAzM2I0Yzgg
KCJkcm0vcGwxMTE6IFN1cHBvcnQgdmFyaWFudHMgd2l0aCBicm9rZW4gY2xvY2sgZGl2aWRlciIp
Cj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBTaWduZWQt
b2ZmLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+CgpBcHBsaWVkIHRvIGRy
bS1taXNjLW5leHQtZml4ZXMgYW5kIHB1c2hlZC4KCk91dCBvZiBjdXJpb3NpdHk6IGRvIHlvdSBo
YXZlIGEgInJlYWwiIEludGVncmF0b3IvQ1Agb3IgaXMgdGhpcwpRRU1VPwoKWW91cnMsCkxpbnVz
IFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
