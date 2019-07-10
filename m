Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D67B6526E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6425F6E13B;
	Thu, 11 Jul 2019 07:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1300B6E0D6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 12:59:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p17so2009479ljg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 05:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z7ylOxfLdhUvUzU0fEvFs37rFjaeIPMVCihg4Np+yiM=;
 b=jVuanT2YX2mo4sSZvSus2WkMJv3lfA6GoHeECL2BFtGno/syWk/x1j1K13KZW14iTm
 0BGAc/xi4Em2iw6/RiSlgq/+jqg4qMsr3Gh3p93kSevptxvvH3jBgeU5yGwkUfUVCEZy
 E/hlbUIK9QDMTj6O7o+neZGCoqYrOwhZlGOYR58gKuwsX4yOMzPymTppkAT6ugL00ewx
 R6vlwcJhsKUn4XsO45GS+Hh+4CqE3JxKLDPadZ7JYEln6Z+0941jyHBg6gd0SkkUqvWx
 LqEq2c+/XpCiot4RT7fibTKqOepW4qpU5aVr+tKLs5wfRg7X/ThjweQXSSYfZGOaBxJj
 rvkQ==
X-Gm-Message-State: APjAAAVt7ZqLVD4rcQGa3l1LzqIqvPqT3d6TNrlfDwtr1Z9dXzWPrZQ+
 2WMgr5P+e/eDoAgV3KDM5Wk=
X-Google-Smtp-Source: APXvYqyAyHtKzYMLhhmkEVzL6+xprN6WUNXA9HHsaLCcX60VB8Jr0lUDrhqT1ogbtvOM4mRgykGpIg==
X-Received: by 2002:a2e:9e81:: with SMTP id f1mr17744867ljk.29.1562763596585; 
 Wed, 10 Jul 2019 05:59:56 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id f24sm380661lfk.72.2019.07.10.05.59.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 05:59:55 -0700 (PDT)
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710101229.54ufuhmh22dfxclr@flea>
 <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
 <20190710125552.qvmnh6qs63ikiu2k@flea>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f530844d-70f2-c3cc-d5f6-b435f1dbdfd2@gmail.com>
Date: Wed, 10 Jul 2019 15:59:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710125552.qvmnh6qs63ikiu2k@flea>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z7ylOxfLdhUvUzU0fEvFs37rFjaeIPMVCihg4Np+yiM=;
 b=bZMHBsxJ8aQL5q16//D1P0Kakf6jjGLqfBX3KWpIqnfbjKhyhGk4JFP5Zh8yrBtV9D
 yFUwyD214OB4RhTTE1FwWKvcdaWQFSiw86DE44C9ki+NtX3vZ0L3n77ohnZcsGRbsLx2
 M7HVjLcUUKFUpTgouNnuV+cpmxk0P7YjuMLW0/N8mx4Ggi7R+tqniIOBgEA4u/cgrblq
 aDn/4dTj+lxZlnpniTeuTTdPwa67iIphdYc7aORIUU8JiWyp2ja2P9RBa5qlptkddm9Z
 DWOORKvuDKvLSMm5CGF6djJsk40gY/vrBl5yfI0zEcmeqIErTzHb7DpDyrelEQROElba
 VIeQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTAuMDcuMjAxOSAxNTo1NSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IE9uIFdlZCwgSnVs
IDEwLCAyMDE5IGF0IDAzOjQyOjI4UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4g
MTAuMDcuMjAxOSAxMzoxMiwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+Pj4gT24gVHVlLCBK
dWwgMDksIDIwMTkgYXQgMDU6NTE6NTFQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+
Pj4+IFRoZSBuYW1lZCBtb2RlIGNvdWxkIGJlIGludmFsaWQgYW5kIHRoZW4gY21kbGluZSBwYXJz
ZXIgbWlzc2VzIHRvIHZhbGlkYXRlCj4+Pj4gbW9kZSdzIGRpbWVuc2lvbnMsIGhhcHBpbHkgYWRk
aW5nIDB4MCBtb2RlIGFzIGEgdmFsaWQgbW9kZS4gT25lIGNhc2Ugd2hlcmUKPj4+PiB0aGlzIGhh
cHBlbnMgaXMgTlZJRElBIFRlZ3JhIGRldmljZXMgdGhhdCBhcmUgdXNpbmcgZG93bnN0cmVhbSBi
b290bG9hZGVyCj4+Pj4gd2hpY2ggYWRkcyAidmlkZW89dGVncmFmYiIgdG8gdGhlIGtlcm5lbCdz
IGNtZGxpbmUgYW5kIHRodXMgdXBzdHJlYW0gVGVncmEKPj4+PiBEUk0gZHJpdmVyIGZhaWxzIHRv
IHByb2JlIGJlY2F1c2Ugb2YgdGhlIGludmFsaWQgbW9kZS4KPj4+Pgo+Pj4+IEZpeGVzOiAzYWVl
YjEzZDg5OTYgKCJkcm0vbW9kZXM6IFN1cHBvcnQgbW9kZXMgbmFtZXMgb24gdGhlIGNvbW1hbmQg
bGluZSIpCj4+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwu
Y29tPgo+Pj4KPj4+IEFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC1maXhlcwo+Pj4KPj4+IFRoYW5r
cyBmb3IgZmlndXJpbmcgdGhpcyBvdXQhCj4+Cj4+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ghIFNvIHRo
ZSBkcml2ZXIgbm93IGRvZXNuJ3QgZmFpbCB0byBwcm9iZSBiZWNhdXNlCj4+IG9mIHRoZSBjbWRs
aW5lLCBidXQgd2hhdCBlbHNlIEkgbm90aWNlZCBpcyB0aGF0IHRoZSBmcmFtZWJ1ZmZlcgo+PiBj
b25zb2xlIGlzIG5vdyByb3RhdGVkIGJ5IDkwwrAgb24gYSA4MDB4MTI4MCBwYW5lbCwgd2hpbGUg
ZGlzcGxheSBpbgo+PiBYb3JnIGlzIHZlcnRpY2FsIGFzIGl0IHdhcyBiZWZvcmUuIFNlZW1zIHNv
bWV0aGluZyBlbHNlIGlzIHN0aWxsCj4+IG1pc3NpbmcsIHJldmVydGluZyAiZHJtL21vZGVzOiBS
ZXdyaXRlIHRoZSBjb21tYW5kIGxpbmUgcGFyc2VyIgo+PiByZXR1cm5zIHRoZSBmcmFtZWJ1ZmZl
cidzIGNvbnNvbGUgb3JpZW50YXRpb24gaW50byB0aGUgb3JpZ2luYWwKPj4gc3RhdGUuCj4gCj4g
V2hhdCBpcyB0aGUgd2hvbGUgY29tbWFuZCBsaW5lIHBhc3NlZCBieSB0aGUgYm9vdGxvYWRlciA/
Cgp0ZWdyYWlkPTMwLjEuMy4wLjAgbWVtPTEwMjJNQDIwNDhNIGFuZHJvaWQuY29tbWNoaXA9MCB2
bWFsbG9jPTUxMk0gYW5kcm9pZGJvb3Quc2VyaWFsbm89MDE1ZDNmMThjOTA4MTIxMCB2aWRlbz10
ZWdyYWZiIG5vX2NvbnNvbGVfc3VzcGVuZD0xIGNvbnNvbGU9bm9uZQpkZWJ1Z191YXJ0cG9ydD1o
c3BvcnQgdXNiY29yZS5vbGRfc2NoZW1lX2ZpcnN0PTEgbHAwX3ZlYz04MTkyQDB4YmRkZjkwMDAg
dGVncmFfZmJtZW09ODE5NTIwMEAweGFiZTAxMDAwIGNvcmVfZWRwX212PTAgYXVkaW9fY29kZWM9
cnQ1NjQwIGJvYXJkX2luZm89ZjQxOmEwMDoxOjQ0OjIKcm9vdD0vZGV2L3NkYTEgcncgcm9vdHdh
aXQgdGVncmFib290PXNkbW1jIGdwdCBncHRfc2VjdG9yPTYxMDc5NTUxIGFuZHJvaWRib290LmJv
b3Rsb2FkZXI9NC4yMyBhbmRyb2lkYm9vdC5iYXNlYmFuZD0xMjMxXzAuMTguMF8wNDA5Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
