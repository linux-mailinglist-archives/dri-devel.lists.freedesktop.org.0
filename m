Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C60310CC67
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 17:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE036E0D9;
	Thu, 28 Nov 2019 16:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D492C6E0D9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 16:03:18 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b11so11434161wmj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 08:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uucM1tKJc5jWqCc67DTWheZ6n5xnlGm793Fj7re5sec=;
 b=dzAj+JLPRo2tCS3nfQ26HslWYcfl7ASm317Awtgry2NZyJEzLu/+DwwLrfbsY/mOZp
 KKAVHRufkYmM4Pg6Veqx50cOSKWUFwoJE7T/34DJd3uMOybx8KGRmBFIdSntqLz2e4WE
 qoJ3vG/7zs1cW6Nnxb4GGyKwfIzon63E6fCCTUUMWO5QSwmCXm6iv+Dimgn5mOY3Ijqj
 NSFc7UA/Fxc/oMM4H62t5RRH0g9qn1NM2Ey+5Fb824OBJXr5io/LCgTKILPTq/3z0c/y
 s1DJbsGMrn1sDKWjRYJwdO3T9XlRsMNqTHn+02r3AkQmpgt6lxk7N88Yz2ncqLjWbtO8
 VVjA==
X-Gm-Message-State: APjAAAU8MBIkHe0QbV8w9wmLzPwFkNJiTc1AUJs6iUsj877fRQ3cl9Oe
 WSWQhYBVsRfmvZnL6sb5+DE=
X-Google-Smtp-Source: APXvYqwWg14hIzEy7xtKUoZNjVc9x68LHyXjjnN6zGyvic3/XoEZKRwAtefKiOcnBebLDi3JrYU0wg==
X-Received: by 2002:a1c:a548:: with SMTP id o69mr10148533wme.31.1574956997396; 
 Thu, 28 Nov 2019 08:03:17 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id a64sm12210356wmc.18.2019.11.28.08.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 08:03:16 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/2] PM / runtime: Allow drivers to override runtime PM
 behaviour on sleep
Date: Thu, 28 Nov 2019 17:03:12 +0100
Message-Id: <20191128160314.2381249-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uucM1tKJc5jWqCc67DTWheZ6n5xnlGm793Fj7re5sec=;
 b=ScUb3/Nie1rHzq0BskCOA9h4NfcMr0F3zMYSBP6ux5FKBJrjKCq6xrw7dTVdXSpxx6
 boXBSHDFKbdNVaY0UEIYFxoLOxQgBmIRwmEf7YAPHNY8EAEWPgBHQTTckOAlCK5GsDVT
 I2ydTL4+YjQME5K/Td+A27GPDACteFoDCNluHZaJIQSJwfVDLbkymJkL6a/kBuDORq0v
 2CwaOueAfH7P3jiwihGD+ujJxF/063K0Qi3ltXxkNi6IwV0fnx7YA7a4tFWv2FyGl+CZ
 9jelOAZUls0n71h/qXNZD9LHfe1E8zpYixdWpBvdk/dWt/MeDlqDlAGt4XxTucLXSwqm
 9kRA==
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
Cc: Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoaXMgaXMgYSByZXN1
bHQgb2YgbG9va2luZyBpbnRvIGEgbW9yZSBmb3JtYWwgd2F5IG9mIGRvaW5nIHdoYXQgd2FzCnBy
b3Bvc2VkIGhlcmU6CgoJaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3BhdGNoLzExNDUzNjMv
CgpUaGUgVGVncmEgRFJNIGRyaXZlciBpcyB3cml0dGVuIHN1Y2ggdGhhdCBydW50aW1lIFBNIGNv
bnRyb2xzIGFsbAphc3BlY3RzIG9mIGJyaW5naW5nIHVwIGFuZCBzaHV0dGluZyBkb3duIHRoZSBo
YXJkd2FyZSBhc3NvY2lhdGVkIHdpdGggYQpkaXNwbGF5IHBpcGVsaW5lLiBUaGlzIHdvcmtzIHZl
cnkgbmljZWx5IHdpdGggdGhlIERSTS9LTVMgYXRvbWljIG1vZGUtCnNldHRpbmcgZnJhbWV3b3Jr
IHRoYXQgaGFzIHZlcnkgcmlnb3JvdXMgY2FsbCBzZXF1ZW5jZXMuIFRoZXJlIGFyZSBhbHNvCnN1
c3BlbmQvcmVzdW1lIGhlbHBlcnMgZm9yIHN5c3RlbSBzbGVlcCB0aGF0IGFyZSBidWlsdCBvbiB0
b3Agb2YgdGhlc2UKZ2VuZXJpYyBoZWxwZXJzIGFuZCB0aGF0IGNhdXNlIHRoZSBzYW1lIGNvZGUg
c2VxdWVuY2VzIHRvIGJlIHJ1biBhcyBpZgp1c2VycyBoYWQgc2ltcGx5IGNob3NlbiB0byBkaXNh
YmxlIGFsbCBkaXNwbGF5IHBpcGVsaW5lcyBhdCBub3JtYWwKcnVudGltZS4KClRoZSBjdXJyZW50
IGJlaGF2aW91ciBvZiB0aGUgUE0gY29yZSB0byBkaXNhbGxvdyBydW50aW1lIHN1c3BlbmQvcmVz
dW1lCmR1cmluZyBzeXN0ZW0gc2xlZXAgZ2V0cyBpbiB0aGUgd2F5IG9mIHRoaXMgYmVjYXVzZSB0
aGUgZGV2aWNlcyBkbyBub3QKaW4gZmFjdCBydW50aW1lIHN1c3BlbmQvcmVzdW1lIGR1cmluZyB0
aGF0IHRpbWUuIE1vc3Qgb2YgdGhlIHRpbWUgdGhpcwpjYXVzZXMgZGlzcGxheSBvdXRwdXRzIHRv
IG1hbGZ1bmN0aW9uIHVwb24gcmVzdW1lLgoKTm93LCB0aGVyZSBhcmUgZ29vZCByZWFzb25zIGZv
ciBwcmV2ZW50aW5nIHJ1bnRpbWUgc3VzcGVuZCBkdXJpbmcgc3lzdGVtCnNsZWVwLCBhcyBnaXZl
biBpbiBjb21taXQgZWVhM2ZjMDM1N2ViICgiUENJIC8gUE06IERldGVjdCBlYXJseSB3YWtldXAK
aW4gcGNpX3BtX3ByZXBhcmUoKSIpIHRoYXQgb3JpZ2luYWxseSBpbnRyb2R1Y2VkIHRoaXMgbWVj
aGFuaXNtLiBUaGVyZQpjYW4sIGhvd2V2ZXIsIGFsc28gYmUgY2FzZXMsIGxpa2UgdGhlIG9uZSBk
ZXNjcmliZWQgYWJvdmUsIHdoZXJlIGl0IGlzCnNhZmUgdG8gYWxsb3cgdGhpcy4gQWRkIGEgZmxh
ZyBhbmQgYSBzZXQgb2YgaGVscGVycyB0byBzZXQgb3IgY2xlYXIgdGhhdApuZXcgZmxhZyBzbyB0
aGF0IGRyaXZlcnMgdGhhdCBrbm93IGl0IHdpbGwgYmUgc2FmZSB0byBydW50aW1lIHN1c3BlbmQg
YQpkZXZpY2UgYXQgc3lzdGVtIHNsZWVwIHRpbWUgY2FuIG1hcmsgdGhlIGRldmljZSBhcyBzdWNo
LgoKSWYgYSBkZXZpY2UgaGFzIHRoZSBmbGFnIHNldCwgdGhlIFBNIGNvcmUgd2lsbCBubyBsb25n
ZXIgdGFrZSBhIHJ1bnRpbWUKUE0gcmVmZXJlbmNlIGZvciBpdCwgdGh1cyBhbGxvd2luZyB0aGUg
ZGV2aWNlIHRvIHJ1bnRpbWUgc3VzcGVuZCBhdCB0aGUKZXhwZWN0ZWQgdGltZS4KClRoaWVycnkK
ClRoaWVycnkgUmVkaW5nICgyKToKICBQTSAvIHJ1bnRpbWU6IEFsbG93IGRyaXZlcnMgdG8gb3Zl
cnJpZGUgcnVudGltZSBQTSBiZWhhdmlvdXIgb24gc2xlZXAKICBkcm0vdGVncmE6IEFsbG93IHJ1
bnRpbWUgc3VzcGVuZCBvbiBzeXN0ZW0gc2xlZXAKCiBkcml2ZXJzL2Jhc2UvcG93ZXIvbWFpbi5j
ICAgIHwgIDYgKysrKy0tCiBkcml2ZXJzL2Jhc2UvcG93ZXIvcnVudGltZS5jIHwgMTYgKysrKysr
KysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgICB8ICAxICsKIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kc2kuYyAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5j
IHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5jICB8ICAxICsKIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9zb3IuYyAgfCAgMSArCiBpbmNsdWRlL2xpbnV4L3BtLmggICAgICAgICAgIHwg
IDEgKwogaW5jbHVkZS9saW51eC9wbV9ydW50aW1lLmggICB8ICAyICsrCiA5IGZpbGVzIGNoYW5n
ZWQsIDI4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
