Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5682C109ABB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 10:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142E789D2E;
	Tue, 26 Nov 2019 09:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B97689C54;
 Tue, 26 Nov 2019 09:08:39 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id r131so6606072ywh.2;
 Tue, 26 Nov 2019 01:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=/VSIiOQ1WfoN0uZvogW5c7J+w9KXtU7Y1W1QIRR23cU=;
 b=p/4ZrvAnxJ6r5gebvSfTVLH9Ly+QQPDSbXurm2StKcGb3XaW0N6qGX+EnZt3SdsnS2
 hMbxoAT4oJLEfHfY1niRxVoW11tp8oCbRJGwYfgJEvIelPQd6QLGgbnMMazK6g1lLAMe
 ZmsyCjRsTpP+hteVshEVZ2rc0GqnXSOssR23XT8v1a74rr23C8DrtwthQ8bZ425GaiC6
 EArB1fL/zM5ZjRChHgho3gjA1/2bohAWW+tgNMQ2xN6zwn/hLmsev9QFyjl/YAXd2HPo
 mUJi2U+HHUfyqS5tXYZjeGwBwSTcDCKOMdqAik7E1P5BOnaf+oocKHv8rcKjCYNwiTKc
 oU9w==
X-Gm-Message-State: APjAAAVBevWYsSka/19J2RJ09jAGvm7Jf1i3lfCdrHxpizKJ1VqEkJN1
 HH/+XzCQcgitoAPo5AJ0U08=
X-Google-Smtp-Source: APXvYqyTo7wwjOX/+spf1JEZW/ViE0GduMiqxJcL7HIlyuYhmnCM+m4SYQJTxgtwxgNu/9SKm0lsLg==
X-Received: by 2002:a0d:e607:: with SMTP id p7mr24726195ywe.103.1574759318698; 
 Tue, 26 Nov 2019 01:08:38 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r23sm4973773ywa.44.2019.11.26.01.08.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Nov 2019 01:08:38 -0800 (PST)
Subject: Re: [PATCH v3 1/2] drm/sched: Avoid job cleanup if sched thread is
 parked.
To: Steven Price <steven.price@arm.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1574691041-5499-1-git-send-email-andrey.grodzovsky@amd.com>
 <93c692cb-5306-e024-57f1-463402cb2c44@arm.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c75aff45-2fc6-47da-34e0-a179f1ce5e9a@gmail.com>
Date: Tue, 26 Nov 2019 10:08:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <93c692cb-5306-e024-57f1-463402cb2c44@arm.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/VSIiOQ1WfoN0uZvogW5c7J+w9KXtU7Y1W1QIRR23cU=;
 b=uOjbMHbpIU319EpdCn3cXWnWKJoo1znLS7Omm1OAHONujH4FJx3YxF94ZovTOipY5a
 aS4EIG0JeiGBfHZbo2Juon8LquRSVTbFrZrWkfxRJ1vNkn7XtSQZ3HdvIx+kWlva/AhI
 Rwlxrg5+F7NaYHr/qXXDIre7pGlEgcDT7WBwfRbnWvZ0WzkhKEfgFI7EPGUjJLmBvL4S
 3gsR1lkjN4Eu5x2qPoymu+7gK4Girg+dbAHf6y6qaSYCUZ5h81OLjC7UYA5vuON03KVP
 RJQ8UAFP+jZDqTQRl1DSucJZOMJx0Y7wND6GCgBX4HOFfFkiPmUURKFkGJfdkL76hhCM
 puIg==
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
Cc: Emily.Deng@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Christian.Koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMTEuMTkgdW0gMTc6NTEgc2NocmllYiBTdGV2ZW4gUHJpY2U6Cj4gT24gMjUvMTEvMjAx
OSAxNDoxMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+IFdoZW4gdGhlIHNjaGVkIHRocmVh
ZCBpcyBwYXJrZWQgd2UgYXNzdW1lIHJpbmdfbWlycm9yX2xpc3QgaXMKPj4gbm90IGFjY2Vzc2Vk
IGZyb20gaGVyZS4KPiBGV0lXIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBuZWNlc3NhcnkuIGt0aHJl
YWRfcGFyaygpIHdpbGwgd2FpdCB1bnRpbCB0aGUKPiB0aHJlYWQgaXMgcGFya2VkLCBhdCB3aGlj
aCBwb2ludCB0aGUgdGhyZWFkIGlzIHN0dWNrIGluIGt0aHJlYWRfcGFya21lKCkKPiB1bnRpbCB1
bnBhcmtlZC4KPgo+IFNvIGFsbCB0aGlzIGRvZXMgaXMgYXZvaWQgd2FpdGluZyBmb3IgYW55IGNs
ZWFudXAgam9icyBiZWZvcmUgcGFya2luZyAtCj4gd2hpY2ggbWlnaHQgYmUgYSByZWFzb25hYmxl
IGdvYWwgaW4gaXRzZWxmLCBidXQgaWYgc28gbGV0cyBhdCBsZWFzdAo+IGRvY3VtZW50IHRoYXQu
CgpOb3cgdGhhdCB5b3UgbWVudGlvbiBpdCB0aGF0IGlzIGluZGVlZCB3cm9uZy4KClRoZSByZWFs
IHByb2JsZW0gaXMgdGhhdCBpbiB0aGUgbWFpbiB0aHJlYWQgd2UgbWFuZ2xlZCB0aGUgY2FsbCB0
byAKa3RocmVhZF9wYXJrbWUoKSBpbnRvIGRybV9zY2hlZF9ibG9ja2VkKCkgd2hpY2ggY2FuIGJl
IGNhbGxlZCBpbiBhdG9taWMgCmNvbnRleHQuCgpJIHN1Z2dlc3QgdG8gcmV3b3JrIHRoaXMgc28g
dGhhdCB0aGUga3RocmVhZF9zaG91bGRfcGFyaygpIGFuZCAKa3RocmVhZF9zaG91bGRfc3RvcCgp
IHRlc3QgaW4gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkgY29tZSBmaXJzdCBhbmQgCnRoZW4g
Y2FsbCBrdGhyZWFkX3BhcmttZSgpIG91dHNpZGUgb2YgdGhlIHdhaXRfZXZlbnRfaW50ZXJydXB0
aWJsZSgpLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IFN0ZXZlCj4KPj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+IFJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IC0t
LQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMTAgKysrKysr
Ky0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
YyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+IGluZGV4IGQ0Y2M3
MjguLjY3NzQ5NTUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
Cj4+IEBAIC02MzUsOSArNjM1LDEzIEBAIGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2Ioc3RydWN0
IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPj4gICAJc3RydWN0IGRybV9zY2hlZF9qb2IgKmpv
YjsKPj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gICAKPj4gLQkvKiBEb24ndCBkZXN0cm95
IGpvYnMgd2hpbGUgdGhlIHRpbWVvdXQgd29ya2VyIGlzIHJ1bm5pbmcgKi8KPj4gLQlpZiAoc2No
ZWQtPnRpbWVvdXQgIT0gTUFYX1NDSEVEVUxFX1RJTUVPVVQgJiYKPj4gLQkgICAgIWNhbmNlbF9k
ZWxheWVkX3dvcmsoJnNjaGVkLT53b3JrX3RkcikpCj4+ICsJLyoKPj4gKwkqIERvbid0IGRlc3Ry
b3kgam9icyB3aGlsZSB0aGUgdGltZW91dCB3b3JrZXIgaXMgcnVubmluZyAgT1IgdGhyZWFkCj4+
ICsJKiBpcyBiZWluZyBwYXJrZWQgYW5kIGhlbmNlIGFzc3VtZWQgdG8gbm90IHRvdWNoIHJpbmdf
bWlycm9yX2xpc3QKPj4gKwkqLwo+PiArCWlmICgoc2NoZWQtPnRpbWVvdXQgIT0gTUFYX1NDSEVE
VUxFX1RJTUVPVVQgJiYKPj4gKwkgICAgICFjYW5jZWxfZGVsYXllZF93b3JrKCZzY2hlZC0+d29y
a190ZHIpKSB8fAo+PiArCSAgICAgX19rdGhyZWFkX3Nob3VsZF9wYXJrKHNjaGVkLT50aHJlYWQp
KQo+PiAgIAkJcmV0dXJuIE5VTEw7Cj4+ICAgCj4+ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hl
ZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwo+Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
