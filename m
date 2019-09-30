Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F069C1D33
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 10:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB1C6E21A;
	Mon, 30 Sep 2019 08:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B886E1EC;
 Mon, 30 Sep 2019 08:32:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r3so10188159wrj.6;
 Mon, 30 Sep 2019 01:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ACOHCDuYFQlr/efx5zKJZnXxl/6Z7fHovupYOMS7TFs=;
 b=pdLle9l+OSUJVqp43cZ+szekN3DVht5/n7j3U40Uz7bTVTm8c54DR6XXwSE4ET0kS8
 6659I0XsTusnOZOmhymRCDHixpqQAoBmrgofEFKzJwgs93G2zZw4RWcGx76XzdfkqXdF
 gDypdaa8RYmYDOItjMXC4JDbRYZnl/gmPK5Xlu51uIuVEmuomn/fYiu5a816aRzFfRbi
 LDKo20sOPw5j7EfQB/0xkOgG8VzeHWtC9wroSvc5BFNDe1hiJQsDiXF6bHzGB34TXXAi
 Y3Ebz4MLLpthZGQkKbx7rggkKSp4OvNnDrVzra/ebz0h6dPUGEy8nbloxAAtwzB1oRRM
 xaWw==
X-Gm-Message-State: APjAAAVsSA8MRYzK/VPg9B2ut7+SJQCXH8eoRJQl+cqu4gD2SeOJKqlb
 uPlcBKdMz6hqY2U9RyKbOpvJO4PK
X-Google-Smtp-Source: APXvYqy+KsvIHKcJQGIWHKziUzS/a4M8F6C60DWyF5BtX7m/zYqcqxbtbFEQDGmUIoT9TiUWGC3lAw==
X-Received: by 2002:adf:e4ce:: with SMTP id v14mr12294750wrm.15.1569832364399; 
 Mon, 30 Sep 2019 01:32:44 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v4sm17423633wrg.56.2019.09.30.01.32.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Sep 2019 01:32:44 -0700 (PDT)
Subject: Re: [PATCH v4 10/11] drm/amdgpu: job is secure iff CS is secure (v5)
To: "Huang, Ray" <Ray.Huang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <1569742788-22429-1-git-send-email-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6b18d231-761d-26ba-ba32-cf983bc605d5@gmail.com>
Date: Mon, 30 Sep 2019 10:32:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569742788-22429-1-git-send-email-ray.huang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ACOHCDuYFQlr/efx5zKJZnXxl/6Z7fHovupYOMS7TFs=;
 b=JtRNBXcX/tPZ0+xWWrDUcYudtkeRP0oesexvnXuuNekLeHLUvFQQNKLtEFVSOFk+i1
 BGN1zU3dUvpZj5RJ5glLvqgaKyITGwWpQhQWYYQjmicQ31t1SFw0RDCWL9SJtU6HXujW
 ukv9ByO9b94o8hqZU81K4xp5xk6ZOEqUBDfzJ1vyHomqtBbCjOYNaNw6FwZEGaN8PH7t
 IEgGt91Gc13bF/VK7MV9MhsJr4gkgnk7C31gFjxVLtc18NLxocErFBxS+tmHJp8rrrW1
 ryxlWUyjrQ8NYj9peDY/tCG78ND5ieoH9XwMSnwAdsu3fge/yILfNgpUCGCY/WSMvnSA
 /iYw==
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
Reply-To: christian.koenig@amd.com
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMDkuMTkgdW0gMDk6NDAgc2NocmllYiBIdWFuZywgUmF5Ogo+IE1hcmsgYSBqb2IgYXMg
c2VjdXJlLCBpZiBhbmQgb25seSBpZiB0aGUgY29tbWFuZAo+IHN1Ym1pc3Npb24gZmxhZyBoYXMg
dGhlIHNlY3VyZSBmbGFnIHNldC4KPgo+IHYyOiBmaXggdGhlIG51bGwgam9iIHBvaW50ZXIgd2hp
bGUgaW4gdm1pZCAwCj4gc3VibWlzc2lvbi4KPiB2MzogQ29udGV4dCAtLT4gQ29tbWFuZCBzdWJt
aXNzaW9uLgo+IHY0OiBmaWxsaW5nIGNzIHBhcnNlciB3aXRoIGNzLT5pbi5mbGFncwo+IHY1OiBt
b3ZlIHRoZSBqb2Igc2VjdXJlIGZsYWcgc2V0dGluZyBvdXQgb2YgYW1kZ3B1X2NzX3N1Ym1pdCgp
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgo+IENvLWRl
dmVsb3BlZC1ieTogTHViZW4gVHVpa292IDxsdWJlbi50dWlrb3ZAYW1kLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgo+IFJldmlld2VkLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpBdCBzb21lIHBvaW50
IHdlIG5lZWQgdG8gY2xlYW51cCBzdHJ1Y3QgYW1kZ3B1X2pvYiwgYnV0IGZvciBub3cgdGhhdCBp
cyAKcGVyZmVjdGx5IG9rLgoKUGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY3MuYyAgfCAyICsrCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfaWIuYyAgfCA0ICsrLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9qb2IuaCB8IDIgKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9jcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKPiBp
bmRleCA0OWI3NjdiLi5jMThhMTUzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9jcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2NzLmMKPiBAQCAtMjMxLDYgKzIzMSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3BhcnNl
cl9pbml0KHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLCB1bmlvbiBkcm1fYW1kZ3B1X2NzCj4g
ICAJaWYgKHJldCkKPiAgIAkJZ290byBmcmVlX2FsbF9rZGF0YTsKPiAgIAo+ICsJcC0+am9iLT5z
ZWN1cmUgPSBjcy0+aW4uZmxhZ3MgJiBBTURHUFVfQ1NfRkxBR1NfU0VDVVJFOwo+ICsKPiAgIAlp
ZiAocC0+Y3R4LT52cmFtX2xvc3RfY291bnRlciAhPSBwLT5qb2ItPnZyYW1fbG9zdF9jb3VudGVy
KSB7Cj4gICAJCXJldCA9IC1FQ0FOQ0VMRUQ7Cj4gICAJCWdvdG8gZnJlZV9hbGxfa2RhdGE7Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKPiBpbmRleCA5YTZkYmYzLi42ZTBm
OTdhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKPiBAQCAtMjEz
LDcgKzIxMyw3IEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nLCB1bnNpZ25lZCBudW1faWJzLAo+ICAgCWlmIChqb2IgJiYgcmluZy0+ZnVuY3MtPmVtaXRf
Y250eGNudGwpIHsKPiAgIAkJc3RhdHVzIHw9IGpvYi0+cHJlYW1ibGVfc3RhdHVzOwo+ICAgCQlz
dGF0dXMgfD0gam9iLT5wcmVlbXB0aW9uX3N0YXR1czsKPiAtCQlhbWRncHVfcmluZ19lbWl0X2Nu
dHhjbnRsKHJpbmcsIHN0YXR1cywgZmFsc2UpOwo+ICsJCWFtZGdwdV9yaW5nX2VtaXRfY250eGNu
dGwocmluZywgc3RhdHVzLCBqb2ItPnNlY3VyZSk7Cj4gICAJfQo+ICAgCj4gICAJZm9yIChpID0g
MDsgaSA8IG51bV9pYnM7ICsraSkgewo+IEBAIC0yMzIsNyArMjMyLDcgQEAgaW50IGFtZGdwdV9p
Yl9zY2hlZHVsZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVuc2lnbmVkIG51bV9pYnMsCj4g
ICAJfQo+ICAgCj4gICAJaWYgKHJpbmctPmZ1bmNzLT5lbWl0X3RteikKPiAtCQlhbWRncHVfcmlu
Z19lbWl0X3RteihyaW5nLCBmYWxzZSwgZmFsc2UpOwo+ICsJCWFtZGdwdV9yaW5nX2VtaXRfdG16
KHJpbmcsIGZhbHNlLCBqb2IgPyBqb2ItPnNlY3VyZSA6IGZhbHNlKTsKPiAgIAo+ICAgI2lmZGVm
IENPTkZJR19YODZfNjQKPiAgIAlpZiAoIShhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpKQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgKPiBpbmRleCBkYzdlZTkzLi5hYTBl
Mzc1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2Iu
aAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuaAo+IEBAIC02
Myw2ICs2Myw4IEBAIHN0cnVjdCBhbWRncHVfam9iIHsKPiAgIAl1aW50NjRfdAkJdWZfYWRkcjsK
PiAgIAl1aW50NjRfdAkJdWZfc2VxdWVuY2U7Cj4gICAKPiArCS8qIHRoZSBqb2IgaXMgZHVlIHRv
IGEgc2VjdXJlIGNvbW1hbmQgc3VibWlzc2lvbiAqLwo+ICsJYm9vbAkJCXNlY3VyZTsKPiAgIH07
Cj4gICAKPiAgIGludCBhbWRncHVfam9iX2FsbG9jKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCB1bnNpZ25lZCBudW1faWJzLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
