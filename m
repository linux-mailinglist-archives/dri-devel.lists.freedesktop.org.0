Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F471F8FAB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362386E0D6;
	Mon, 15 Jun 2020 07:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1446E0D8
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 12:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1592137013;
 bh=3uPeZr7YUtp8oPBanX8wpWVmN5bEN92MxWCaDMklPvQ=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=APf6tsCZ9Q1T1q4LZeI/S86C/NAzHLWwSkuLCdfntkhlHxb5JW5ZF2DRVGrItTPxf
 TupY7NZhrpk8Uqx9t2sZPo5Pbo93xNxX2W4PfkC6MnuR0hwcfsdL5B1GLJ713dDO/q
 PSlKc9pSJSms4/wnkOioBMqtdt1Oj5IC07Da3GGA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.103.145]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MS2LO-1jLoEg3AUM-00TGVa; Sun, 14
 Jun 2020 14:16:52 +0200
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/vc4: fix ref count leak in vc4_dsi_encoder_enable
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a81cacf1-88e5-18d1-9d01-8e8d32f6f0a7@web.de>
Date: Sun, 14 Jun 2020 14:16:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:g7WsRZns8wK5DeP8vMqrf1sr3VIsyatiqyKyZOtsG8Fwee6lCiJ
 tcE2gFd3gFNCOhU4MVba6g8qpkQQnmE9RhWRgDTbP1jXY9AfMgjOGdCZI9xqATkC6l+a/gd
 Fhh+9/gI+5+x/v+BQOogOi1EVi2BOxATnDA78sHjOeCPUWJxsHDrQYblS5dq9yLN7M1O8WA
 OcMcExBpmezB7wlmpiG1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yHXBjf+SAZM=:7G1iR+qf8bpnXx7LjxfqT4
 t1O0mcP90xvonwfqwq9Q87uw7FXXzZ48LD0xNuaH6Dy2xe3e3SwWhaQmc74/fuQdoDm7f+/T+
 4VkWggaCk5nAT4AVCvbce9cyOcqeMBqeXWMfYUZcA17PGFNYn55FhY2KQNCxLiRMAfhYD+yTO
 SfsgXX1cXSbvkESaNrv8VNwhbHOq7Y2J+5oyG0xRW7662IF9Ggwl3dNyVaVdbs1PmuYhFF6NL
 IkxfVdG5n/Y2BHXpMIc6rCYFwWE9yTq0PUurTdiKd1AxrmObiMEGiG9N7NfQVx+lXQk+iBSQ+
 YFexzfZli66RqaMAVwK+7Sz34skMN9Qav5AUABNmdjhKp1yF7bBmhhH9P/OSUra4hC3gPAQ+1
 uWXL5YgcP+OSnVb628FwOstRt0qOV6rzYk8gwtbAe1XBIMrpLxtfaMT5FhilRUg6BZImUVL87
 F3RuFARVB1SRoE/vErptN9/ssRytqeC2Y5PIUROqklgLtUVLz/wINN0udBWmGzGVzFHtBbIr8
 lbiy3MaGbdfdjFOano99jjUBwMKezQ1FkYIKsfqmRFz/ktS2Ga9HNf3WUu7EMjrdD37FpSv28
 XOQ7/wHlNjoYA1YDAzR23SwHlu7zSJ6vZtxu6ui5hXHxWVSJdzJXEQ/YX2KC69gv/0qFPpnSA
 jqkSTNGa6t2limdTJ7KtRsbSh17myv123SX41mONhPZLWZ16FnnkTgUE5o6SH9A5WDsx89YoP
 s2f4vVbBMFVIy2dk9H+w0GmEtCLiz6o/uAfG6cxwkb4SpEFViSmynI6jJnXKNUWNNlz/jYvvC
 1PHejOSUcQvhPjjxmhLksigIVGbVziqF4jG2T+YOXrjky9mLfDb9KuopDBv8N4fzm0IYxLskv
 ZB9q+wns5/Rm7E1Z7X//yhOu2wlJERQXJ1NZAHrcKskTWtyip2dZ84lYud8wtpGTk6A0zPylI
 aoSdOxjQCWJ8CD7jvLR6celNKo/9iRmucj58XBEhffG3mjJjecYMDWp/h7L5MnU04BwTpoQcb
 GL35oO/nCR/qkReWx5IZgwqfOPvauJK05P43Qjk9wbYxY0nJ43Q3k2MhYHN0JfUM6G5GeFGa+
 1WtLWb3fD8yZwfyPG1+BSiNLZzAJQaOADx5BQDjnGP+MrTOgvcPDswYHRG29D9PwiwMDQmky6
 gj52eY4K+k55i0EN9JmXjoSspUtbgO4dcJEVByXJZyYoIJKIDb3UDxZzQ3GpadhSA3c+vLidS
 JsEZT1aBlqj578coA
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Qiushi Wu <wu000273@umn.edu>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
 linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBpbiB2YzRfZHNpX2VuY29kZXJfZW5hYmxlLCB0aGUgY2FsbCB0byBwbV9ydW50aW1lX2dldF9z
eW5jIGluY3JlbWVudHMKPiB0aGUgY291bnRlciBldmVuIGluIGNhc2Ugb2YgZmFpbHVyZSwgbGVh
ZGluZyB0byBpbmNvcnJlY3QKPiByZWYgY291bnQuIEluIGNhc2Ugb2YgZmFpbHVyZSwgZGVjcmVt
ZW50IHRoZSByZWYgY291bnQgYmVmb3JlIHJldHVybmluZy4KCiogQ2FuIHRoZSB0ZXJtIOKAnHJl
ZmVyZW5jZSBjb3VudOKAnSBiZWNvbWUgcmVsZXZhbnQgYWxzbyBmb3IgdGhpcyBjb21taXQgbWVz
c2FnZQogIGJlc2lkZXMgb3RoZXIgcG9zc2libGUgYWRqdXN0bWVudHM/CgoqIENhbiBpdCBiZSBu
aWNlciB0byBjb21iaW5lIHByb3Bvc2VkIHVwZGF0ZXMgZm9yIHRoaXMgc29mdHdhcmUgbW9kdWxl
CiAgYXMgYSBwYXRjaCBzZXJpZXMgKHdpdGggYSBjb3ZlciBsZXR0ZXIpPwoKKiBXb3VsZCB5b3Ug
bGlrZSB0byBhZGQgdGhlIHRhZyDigJxGaXhlc+KAnT8KCgrigKYKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdmM0L3ZjNF9kc2kuYwrigKYKPiBAQCAtMTA4OCw2ICsxMDg4LDggQEAgIHN0YXRpYyB2
b2lkIHZjNF9kc2lfZW5jb2Rlcl9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+
ICAJCWRldl9pbmZvKCZkc2ktPnBkZXYtPmRldiwgIkRTSSByZWdzIGFmdGVyOlxuIik7Cj4gIAkJ
ZHJtX3ByaW50X3JlZ3NldDMyKCZwLCAmZHNpLT5yZWdzZXQpOwo+ICAJfQo+ICtvdXQ6Cj4gKwlw
bV9ydW50aW1lX3B1dChkZXYpOwo+ICB9CuKApgoKKiBQZXJoYXBzIHVzZSB0aGUgbGFiZWwg4oCc
cHV0X3J1bnRpbWXigJ0gaW5zdGVhZD8KCiogRG8geW91IHByb3Bvc2UgdG8gcGVyZm9ybSBhbiBh
ZGRpdGlvbmFsIGZ1bmN0aW9uIGNhbGwgYWx3YXlzCiAgKGFuZCBub3Qgb25seSBhY2NvcmRpbmcg
dG8gZmFpbHVyZSBjYXNlcyk/CgoqIEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgY2FsbGluZyB0aGUg
ZnVuY3Rpb24g4oCccG1fcnVudGltZV9wdXRfbm9pZGxl4oCdPwoKUmVnYXJkcywKTWFya3VzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
