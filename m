Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FB6E4550
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413836E8EE;
	Fri, 25 Oct 2019 08:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25726E40D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 13:35:16 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id g21so18070010lfh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 06:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FbgSAKuKivrD7KWCdkROt8M8bJsyR6G6H0hxiq2O7bk=;
 b=lD13J8qxMMypTZ8oqzaF3VZH3/yJ8h6lO343B0Fv6ikT3jrtA788Q++X7G5StRqyir
 uJLgP+TMdpAH8bJOexxEOYktkadsbKhMT/OKBXupd4UsZZY123w4RXFaxCGXGTWtPs+e
 P8Zqa/XDBPhqyoMRkWsxSD44MgvoV3O2CK0BW9AEli/yuUQpkrzd6A7JQV29Q/N4M/Ms
 0wfdNx7wiTbR9m/9LW8IX73p/+tIjtTZc/lxAMiDmboCtKaXorPHjektModsdnDvwuvx
 313v/MD9OEd+GduXQhwBgaWiqp6haBklxk/DJnPSCaiJWHaIjEhNvT0WqHX2XlkhBWu+
 kPNg==
X-Gm-Message-State: APjAAAW5WE5WGIb++MrI+qLE9tBHo54NrK2bGR0SZ71yeZJL7P2+GtWz
 T0vaLwh8j5Dwsalmh7GCfxg=
X-Google-Smtp-Source: APXvYqxCvQZdvyAvyjHYR+MpDh+LS9bfFYAbqrYzDsS0aWHkIORftxUxo45a+NeXjvZM3uXh8pwr5A==
X-Received: by 2002:a19:f813:: with SMTP id a19mr11362936lff.33.1571924115321; 
 Thu, 24 Oct 2019 06:35:15 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id 90sm8577433ljc.0.2019.10.24.06.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 06:35:14 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on
 client's registration
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20191024115016.GA2924027@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <55ab29ad-da9b-c178-4480-dc6edb09b3e4@gmail.com>
Date: Thu, 24 Oct 2019 16:35:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024115016.GA2924027@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FbgSAKuKivrD7KWCdkROt8M8bJsyR6G6H0hxiq2O7bk=;
 b=VE/cvgYHp6gvvcOXN1zR/dYQvbhcECqSyiTlHl7nLxyvhGUKom/dSx4G4GzZ04FDns
 7pwG3mD0oWht3y2FvM71zTDpODrY7yySgxc/54I+TJnN/ell2D8I/xFEDSXMU9D9peC5
 8KZwkIlmdFQExFpiR7pEOuukXh+40S5XUXSDbiGCS0pZIyQUXL5LemXxSzMvU+6G11T3
 dzc+bFVR/zt6ZCaPlgIhA79/U+rRt400ptD3Ox5jPYhUZBRQuowsgSORr9cdVljjK01a
 TZV+mdwR7jbVY2vGsfKwlp7j+5DwwQyK8ihjtVMSt3EQJ047cRY6Eh4V1v5vOfFWQza5
 U9yQ==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjQuMTAuMjAxOSAxNDo1MCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBTdW4sIEp1
biAyMywgMjAxOSBhdCAwODozNzo0MVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IE9uIEFSTTMyIHdlIGRvbid0IHdhbnQgYW55IG9mIHRoZSBjbGllbnRzIGRldmljZSB0byBiZSBi
YWNrZWQgYnkgdGhlCj4+IGltcGxpY2l0IGRvbWFpbiwgc2ltcGx5IGJlY2F1c2Ugd2UgY2FuJ3Qg
YWZmb3JkIHN1Y2ggYSB3YXN0ZSBvbiBvbGRlcgo+PiBUZWdyYSBTb0NzIHRoYXQgaGF2ZSB2ZXJ5
IGZldyBkb21haW5zIGF2YWlsYWJsZSBpbiB0b3RhbC4gVGhlIHJlY2VudCBJT01NVQo+PiBzdXBw
b3J0IGFkZGl0aW9uIGZvciB0aGUgVmlkZW8gRGVjb2RlciBoYXJkd2FyZSB1bmNvdmVyZWQgdGhl
IHByb2JsZW0KPj4gdGhhdCBhbiB1bmZvcnR1bmF0ZSBkcml2ZXJzIHByb2JlIG9yZGVyIHJlc3Vs
dHMgaW4gdGhlIERSTSBkcml2ZXIgcHJvYmUKPj4gZmFpbHVyZSBpZiBDT05GSUdfQVJNX0RNQV9V
U0VfSU9NTVU9eSBkdWUgdG8gYSBzaG9ydGFnZSBvZiBJT01NVSBkb21haW5zCj4+IGNhdXNlZCBi
eSB0aGUgaW1wbGljaXQgYmFja2luZy4gVGhlIGhvc3QxeF9jbGllbnRfcmVnaXN0ZXIoKSBpcyBh
IGNvbW1vbgo+PiBmdW5jdGlvbiB0aGF0IGlzIGludm9rZWQgYnkgYWxsIG9mIHRoZSByZWxldmFu
dCBEUk0gZHJpdmVycyBkdXJpbmcgdGhlaXJzCj4+IHByb2JlIGFuZCBoZW5jZSBpdCBpcyBjb252
ZW5pZW50IHRvIHJlbW92ZSB0aGUgaW1wbGljaXQgYmFja2luZyB0aGVyZSwKPj4gcmVzb2x2aW5n
IHRoZSBwcm9ibGVtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0
eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jIHwgMTkgKysr
KysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPiAK
PiBJIGRvbid0IHJlYWxseSB3YW50IHRvIGRvIHRoaXMgaW4gYSBjZW50cmFsIHBsYWNlIGxpa2Ug
dGhpcy4gSWYgd2UKPiByZWFsbHkgZG8gbmVlZCB0aGlzLCB3aHkgY2FuJ3Qgd2UgZG8gaXQgaW4g
dGhlIGluZGl2aWR1YWwgZHJpdmVycz8KCldoeSBkbyB5b3Ugd2FudCB0byBkdXBsaWNhdGUgdGhl
IHNhbWUgYWN0aW9uIGZvciBlYWNoIGRyaXZlciBpbnN0ZWFkIG9mCmRvaW5nIGl0IGluIGEgc2lu
Z2xlIGNvbW1vbiBwbGFjZT8KCj4gd2UgYWxyZWFkeSBjYWxsIGhvc3QxeF9jbGllbnRfaW9tbXVf
YXR0YWNoKCkgZnJvbSBhbGwgdGhlIGRyaXZlcnMgYW5kCj4gdGhhdCBkZXRhY2hlcyBmcm9tIHRo
ZSBJT01NVSBhcyB3ZWxsLiBTbyBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoeQo+IHRoaXMg
aXMgbmVlZGVkLgoKV2lzaCB5b3UgY291bGQgYXNrIHRoYXQgY291cGxlIG1vbnRocyBhZ28uIEkn
bGwgdHJ5IHRvIHJlZnJlc2ggdGhlIGRldGFpbHMuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
