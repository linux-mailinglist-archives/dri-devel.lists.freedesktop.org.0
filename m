Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6B31B7EE
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9D189E01;
	Mon, 13 May 2019 14:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC9389DFB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:17:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d12so15457324wrm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 07:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LUYVTvaTIlx0rQAWgKbjY+4Qtx5kTkKPhPOLDQYWNoI=;
 b=LQNakf84j/21N0tyjOS78Cb/+oWSfK0/XwDNbnDpFF9czGNUWeIMfq6tHH4vKhBdtF
 KyzbvTQ2r/DXMz5AKHkrYIAOUjaoL6WMPVpJM1H0PJHyDYqGqgvS2SRU0gcOOilScBOq
 +e4U0LGblkX/f1jjbbDlg1wAwsM+kvS50KTv7HWGfnTKVIo6gnvDoP/SzbiynDxm9SXf
 cR51JpGNbxh1w46MEEHWvaTI30BAwAfgON7TWJeVg6zd4LcHECzQgh3+oyGDvGFNmVTx
 qTSUox9xmS5/011copm2lMvqhAlIbObtL8WGHVRNbPmY6Sm/3Onk/vLNGsOvxKi2EVDZ
 kVNA==
X-Gm-Message-State: APjAAAWITcSMNXhMhbtb+X2mBMxoMRCBUecTcRpWfA30WLiB7YzjhQTX
 TjdfaKPG1rTj3gAYrZ9fOiTJqNU0
X-Google-Smtp-Source: APXvYqwzfbOd9OVUNpofpWRk5zCOLQcjaELkj5hxWU0H5XaZfxOiQSZlhN2lCM4rqS+J4nU8di026Q==
X-Received: by 2002:a5d:4089:: with SMTP id o9mr13876627wrp.6.1557757056427;
 Mon, 13 May 2019 07:17:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m13sm11877020wrs.87.2019.05.13.07.17.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 07:17:35 -0700 (PDT)
Subject: Re: [PATCH 4/4] drm/amdgpu: stop removing BOs from the LRU during CS
To: "Liang, Prike" <Prike.Liang@amd.com>, "Olsak, Marek"
 <Marek.Olsak@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190510141316.1746-1-christian.koenig@amd.com>
 <20190510141316.1746-4-christian.koenig@amd.com>
 <MN2PR12MB3536E593C868F386FC7E2A5BFB0F0@MN2PR12MB3536.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <29313d3a-a669-ffc0-c8e9-fe358d60d323@gmail.com>
Date: Mon, 13 May 2019 16:17:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB3536E593C868F386FC7E2A5BFB0F0@MN2PR12MB3536.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LUYVTvaTIlx0rQAWgKbjY+4Qtx5kTkKPhPOLDQYWNoI=;
 b=UwTwbbO/WnjeezwLv47Tx4y5c3xiHc57wuot2r6eh2mEXAJzShpDzr8XCcwiF3UP+e
 M76kZC27X4awRfv216YHeQHKpJbCsQD6llUTqfENOv3Nk/uIOmjQv8W47t1Avck5KToy
 Y6BnujHd2BA/ZHbWivkmpNJtnzp7OYn/EGAszDwrQ/8T7Hl3GT0eoRxxC4zD+Qn18RxU
 QJDlwMMItbkr5RRE62kd8xUjoc+9KPFhv9/GMNgl/uJSSGkdKlQxJd6ccQ7q3cKcEo0v
 tzi/Pcx6pMcccwjpY1seKkMDstd6befHk9Cs48GzukfX6alDDislGpyaS+pi1fvIhPBV
 1W3Q==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUHJpa2UsCgp1bmZvcnR1bmF0ZWx5IE1hcmVrIGNhbWUgdXAgd2l0aCBhbiBldmVuIGJldHRl
ciB0ZXN0IGNhc2UsIGFuZCB0aGlzIAp1bmZvcnR1bmF0ZWx5IHNvbHZlcyBvbmx5IGFib3V0IDgw
JSBvZiBhbGwgY2FzZXMgd2hlcmUgdGhpcyBwcm9ibGVtIGNhbiAKaGFwcGVuLgoKU28gQWJhcXVz
IG1pZ2h0IHdvcmsgaW4gNCBvZiA1IHJ1bnMsIGJ1dCB0aGVuIHN0aWxsIGZhaWwuIEknbSBjdXJy
ZW50bHkgCndvcmtpbmcgb24gdHJ5aW5nIHRvIGZpeCB0aGUgcmVtYWluaW5nIDIwJS4KCkdpdmUg
bWUgYSBkYXkgb3IgdHdvIHRvIGZpZ3VyZSB0aGluZ3Mgb3V0LApDaHJpc3RpYW4uCgpBbSAxMy4w
NS4xOSB1bSAxNjowMSBzY2hyaWViIExpYW5nLCBQcmlrZToKPiBIaSBDaHJpc3RpYW4g77yMCj4K
PiBUaGUgc2VyaWVzIHBhdGNoIGNhbiByZXNvbHZlIEFiYXF1cyBwaW5uZWQgZmFpbGVkIGlzc3Vl
IC4KPiBXb3VsZCB5b3UgbGlrZSBwdXNoIHRoZSBmb3VyIGZpeCBwYXRjaGVzIHRvIGRybS1uZXh0
IGJyYW5jaCAuCj4KPiBUaGFua3MsCj4gUHJpa2UKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQo+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwu
Y29tPgo+IFNlbnQ6IEZyaWRheSwgTWF5IDEwLCAyMDE5IDEwOjEzIFBNCj4gVG86IE9sc2FrLCBN
YXJlayA8TWFyZWsuT2xzYWtAYW1kLmNvbT47IFpob3UsIERhdmlkKENodW5NaW5nKSA8RGF2aWQx
Llpob3VAYW1kLmNvbT47IExpYW5nLCBQcmlrZSA8UHJpa2UuTGlhbmdAYW1kLmNvbT47IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTdWJqZWN0OiBbUEFUQ0ggNC80XSBkcm0vYW1k
Z3B1OiBzdG9wIHJlbW92aW5nIEJPcyBmcm9tIHRoZSBMUlUgZHVyaW5nIENTCj4KPiBbQ0FVVElP
TjogRXh0ZXJuYWwgRW1haWxdCj4KPiBUaGlzIGF2b2lkcyBPT00gc2l0dWF0aW9ucyB3aGVuIHdl
IGhhdmUgbG90cyBvZiB0aHJlYWRzIHN1Ym1pdHRpbmcgYXQgdGhlIHNhbWUgdGltZS4KPgo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIHwgMiArLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+IGluZGV4IGExZDZhMDcyMWU1My4uODgy
OGQzMGNkNDA5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKPiBA
QCAtNjQ4LDcgKzY0OCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3BhcnNlcl9ib3Moc3RydWN0
IGFtZGdwdV9jc19wYXJzZXIgKnAsCj4gICAgICAgICAgfQo+Cj4gICAgICAgICAgciA9IHR0bV9l
dV9yZXNlcnZlX2J1ZmZlcnMoJnAtPnRpY2tldCwgJnAtPnZhbGlkYXRlZCwgdHJ1ZSwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkdXBsaWNhdGVzLCB0cnVlKTsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkdXBsaWNhdGVzLCBmYWxzZSk7Cj4gICAg
ICAgICAgaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKPiAgICAgICAgICAgICAgICAgIGlmIChyICE9
IC1FUkVTVEFSVFNZUykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJ0dG1f
ZXVfcmVzZXJ2ZV9idWZmZXJzIGZhaWxlZC5cbiIpOwo+IC0tCj4gMi4xNy4xCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
