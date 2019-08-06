Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78738830EC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 13:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF1D89D5F;
	Tue,  6 Aug 2019 11:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F3489D5F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 11:46:05 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id j11so34347909otp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 04:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+2GLuom5LkEzk75iKp/W/dLLzktwu1z9FB3lzR1vH88=;
 b=gzmKLG9h/xPgEoKapR94IfhzTGCuXxm4JVvRwcBMc6RMRGFHPT7WRtDGvE0sHIZUJS
 J3v2oFMxDpdlRDBIKk4h6VwvfBN6gyngsYxw7akNqcjgVb/ijb1aTzfzDrd7OYImYy0K
 li9w+I6qKcFuT3VZrqycXO8zXpQ/UcridqfmVcdwzXJP/mIXzB0OsdcZpx2nWdWHIDYi
 WRlKDSEJUlGIT0q35awnm9L7tSeINhX+aCXgQhkclZrfQ9TpirdqYJ+XmbxyazCG7Kz8
 OaiMgrSzO0SQ3O9C+teTd5Bz4xSpZjLrRPIk9yV7FxRbec3v5x7QARmy2r7Huo+G2Jvb
 LkYg==
X-Gm-Message-State: APjAAAUDFRRwJ7DX3DU9fzHxUe5MPsMcT0SMgEl/RapRi4Ydv9y/9IbH
 iuQ2AlokXv0L4fw6b1o6th/9IX6hc9hEiip69/TTLQ==
X-Google-Smtp-Source: APXvYqxsVgZsi3QItTRxougIwHgd9GmIH1aNgoPdpOjOudg5TAf9holb/8M8flURvPkrOcwY2yoQJMmlqESNr+y2wz0=
X-Received: by 2002:a9d:590d:: with SMTP id t13mr2946119oth.281.1565091964657; 
 Tue, 06 Aug 2019 04:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190806091233.GX7444@phenom.ffwll.local>
 <20190806104835.26075-1-brian.starkey@arm.com>
In-Reply-To: <20190806104835.26075-1-brian.starkey@arm.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 6 Aug 2019 13:45:53 +0200
Message-ID: <CAKMK7uHjz=t2dCVwCbEf5qUkcEcyUSqL=hjsHb-ZJ0pD2w7rvQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/crc-debugfs: Add notes about CRC<->commit
 interactions
To: Brian Starkey <brian.starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+2GLuom5LkEzk75iKp/W/dLLzktwu1z9FB3lzR1vH88=;
 b=CGz9N9fIrOmtsbSaHjVpA+Ay5xvmrIhIp710TV/jZE4ebeccflhTltK6pThFqAUoNz
 7SKf/DRH2L8JHnbihzZBeQ/LT11QTkOA0t4JhIY14g/EnqlOH9aKw1VU3CRk0eqOPV4r
 Cm2dLLmSUPy1r41Y9W2+7c5LrJn+g2OfePzZ0=
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxMjo0OCBQTSBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFy
a2V5QGFybS5jb20+IHdyb3RlOgo+Cj4gQ1JDIGdlbmVyYXRpb24gY2FuIGJlIGltcGFjdGVkIGJ5
IGNvbW1pdHMgY29taW5nIGZyb20gdXNlcnNwYWNlLCBhbmQKPiBlbmFibGluZyBDUkMgZ2VuZXJh
dGlvbiBtYXkgaXRzZWxmIHRyaWdnZXIgYSBjb21taXQuIEFkZCBub3RlcyBhYm91dAo+IHRoaXMg
dG8gdGhlIGtlcm5lbGRvYy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIFN0YXJrZXkgPGJyaWFu
LnN0YXJrZXlAYXJtLmNvbT4KCmxndG0sIG15IGVhcmxpZXIgci1iIGhvbGRzLiBXZWxsIG1heWJl
IHNob3VsZCBoYXZlIGEgdjIgaGVyZSBzb21ld2hlcmUKd2l0aCB3aGF0IHlvdSBjaGFuZ2VkLgot
RGFuaWVsCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDE3ICsr
KysrKysrKysrKystLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9jcnRjLmggICAgICAgICAgICB8ICA0
ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwo+IGluZGV4IDdjYTQ4NmQ3NTBlOS4uNzcx
NTliNmU3N2MzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwo+IEBAIC02NSwxMCAr
NjUsMTkgQEAKPiAgICogaXQgc3VibWl0cy4gSW4gdGhpcyBnZW5lcmFsIGNhc2UsIHRoZSBtYXhp
bXVtIHVzZXJzcGFjZSBjYW4gZG8gaXMgdG8gY29tcGFyZQo+ICAgKiB0aGUgcmVwb3J0ZWQgQ1JD
cyBvZiBmcmFtZXMgdGhhdCBzaG91bGQgaGF2ZSB0aGUgc2FtZSBjb250ZW50cy4KPiAgICoKPiAt
ICogT24gdGhlIGRyaXZlciBzaWRlIHRoZSBpbXBsZW1lbnRhdGlvbiBlZmZvcnQgaXMgbWluaW1h
bCwgZHJpdmVycyBvbmx5IG5lZWQgdG8KPiAtICogaW1wbGVtZW50ICZkcm1fY3J0Y19mdW5jcy5z
ZXRfY3JjX3NvdXJjZS4gVGhlIGRlYnVnZnMgZmlsZXMgYXJlIGF1dG9tYXRpY2FsbHkKPiAtICog
c2V0IHVwIGlmIHRoYXQgdmZ1bmMgaXMgc2V0LiBDUkMgc2FtcGxlcyBuZWVkIHRvIGJlIGNhcHR1
cmVkIGluIHRoZSBkcml2ZXIgYnkKPiAtICogY2FsbGluZyBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5
KCkuCj4gKyAqIE9uIHRoZSBkcml2ZXIgc2lkZSB0aGUgaW1wbGVtZW50YXRpb24gZWZmb3J0IGlz
IG1pbmltYWwsIGRyaXZlcnMgb25seSBuZWVkCj4gKyAqIHRvIGltcGxlbWVudCAmZHJtX2NydGNf
ZnVuY3Muc2V0X2NyY19zb3VyY2UuIFRoZSBkZWJ1Z2ZzIGZpbGVzIGFyZQo+ICsgKiBhdXRvbWF0
aWNhbGx5IHNldCB1cCBpZiB0aGF0IHZmdW5jIGlzIHNldC4gQ1JDIHNhbXBsZXMgbmVlZCB0byBi
ZSBjYXB0dXJlZAo+ICsgKiBpbiB0aGUgZHJpdmVyIGJ5IGNhbGxpbmcgZHJtX2NydGNfYWRkX2Ny
Y19lbnRyeSgpLiBEZXBlbmRpbmcgb24gdGhlIGRyaXZlcgo+ICsgKiBhbmQgSFcgcmVxdWlyZW1l
bnRzLCAmZHJtX2NydGNfZnVuY3Muc2V0X2NyY19zb3VyY2UgbWF5IHJlc3VsdCBpbiBhIGNvbW1p
dAo+ICsgKiAoZXZlbiBhIGZ1bGwgbW9kZXNldCkuCj4gKyAqCj4gKyAqIENSQyByZXN1bHRzIG11
c3QgYmUgcmVsaWFibGUgYWNyb3NzIG5vbi1mdWxsLW1vZGVzZXQgYXRvbWljIGNvbW1pdHMsIHNv
IGlmIGEKPiArICogY29tbWl0IHZpYSBEUk1fSU9DVExfTU9ERV9BVE9NSUMgd291bGQgZGlzYWJs
ZSBvciBvdGhlcndpc2UgaW50ZXJmZXJlIHdpdGgKPiArICogQ1JDIGdlbmVyYXRpb24sIHRoZW4g
dGhlIGRyaXZlciBtdXN0IG1hcmsgdGhhdCBjb21taXQgYXMgYSBmdWxsIG1vZGVzZXQKPiArICog
KGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KCkgc2hvdWxkIHJldHVybiB0cnVlKS4gQXMg
YSByZXN1bHQsIHRvIGVuc3VyZQo+ICsgKiBjb25zaXN0ZW50IHJlc3VsdHMsIGdlbmVyaWMgdXNl
cnNwYWNlIG11c3QgcmUtc2V0dXAgQ1JDIGdlbmVyYXRpb24gYWZ0ZXIgYQo+ICsgKiBsZWdhY3kg
U0VUQ1JUQyBvciBhbiBhdG9taWMgY29tbWl0IHdpdGggRFJNX01PREVfQVRPTUlDX0FMTE9XX01P
REVTRVQuCj4gICAqLwo+Cj4gIHN0YXRpYyBpbnQgY3JjX2NvbnRyb2xfc2hvdyhzdHJ1Y3Qgc2Vx
X2ZpbGUgKm0sIHZvaWQgKmRhdGEpCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jcnRj
LmggYi9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oCj4gaW5kZXggMTI4ZDhiMjEwNjIxLi43ZDE0YzEx
YmRjMGEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NydGMuaAo+ICsrKyBiL2luY2x1
ZGUvZHJtL2RybV9jcnRjLmgKPiBAQCAtNzU2LDYgKzc1Niw5IEBAIHN0cnVjdCBkcm1fY3J0Y19m
dW5jcyB7Cj4gICAgICAgICAgKiBwcm92aWRlZCBmcm9tIHRoZSBjb25maWd1cmVkIHNvdXJjZS4g
RHJpdmVycyBtdXN0IGFjY2VwdCBhbiAiYXV0byIKPiAgICAgICAgICAqIHNvdXJjZSBuYW1lIHRo
YXQgd2lsbCBzZWxlY3QgYSBkZWZhdWx0IHNvdXJjZSBmb3IgdGhpcyBDUlRDLgo+ICAgICAgICAg
ICoKPiArICAgICAgICAqIFRoaXMgbWF5IHRyaWdnZXIgYW4gYXRvbWljIG1vZGVzZXQgY29tbWl0
IGlmIG5lY2Vzc2FyeSwgdG8gZW5hYmxlIENSQwo+ICsgICAgICAgICogZ2VuZXJhdGlvbi4KPiAr
ICAgICAgICAqCj4gICAgICAgICAgKiBOb3RlIHRoYXQgImF1dG8iIGNhbiBkZXBlbmQgdXBvbiB0
aGUgY3VycmVudCBtb2Rlc2V0IGNvbmZpZ3VyYXRpb24sCj4gICAgICAgICAgKiBlLmcuIGl0IGNv
dWxkIHBpY2sgYW4gZW5jb2RlciBvciBvdXRwdXQgc3BlY2lmaWMgQ1JDIHNhbXBsaW5nIHBvaW50
Lgo+ICAgICAgICAgICoKPiBAQCAtNzY3LDYgKzc3MCw3IEBAIHN0cnVjdCBkcm1fY3J0Y19mdW5j
cyB7Cj4gICAgICAgICAgKiAwIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9u
IGZhaWx1cmUuCj4gICAgICAgICAgKi8KPiAgICAgICAgIGludCAoKnNldF9jcmNfc291cmNlKShz
dHJ1Y3QgZHJtX2NydGMgKmNydGMsIGNvbnN0IGNoYXIgKnNvdXJjZSk7Cj4gKwo+ICAgICAgICAg
LyoqCj4gICAgICAgICAgKiBAdmVyaWZ5X2NyY19zb3VyY2U6Cj4gICAgICAgICAgKgo+IC0tCj4g
Mi4xNy4xCj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
