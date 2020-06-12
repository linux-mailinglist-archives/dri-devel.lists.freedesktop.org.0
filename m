Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5971F82BC
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BD76E450;
	Sat, 13 Jun 2020 10:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93C36E905;
 Fri, 12 Jun 2020 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591954655;
 bh=kuWFZ8oSr+pwcbI4QywrW6/nLWqzxloT2RQ5wBq9vTc=;
 h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
 b=SRdxiHa/fkKEof8XVkQMTzGXd5AtUqvJFmnKfXa/u04g16tLDh3vaC4ZrAq5nm/fY
 n0YussoWJlIaFtjBjKO1AeKTXtkn+QzQ9CRLPZRE9UJHYpelm6h/LgwaG5gY4bN2jQ
 t3i1TFVB/ulEvcFc0ECblztWft0CdSkUsFypbYNM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.95.40]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MtyA2-1iwEja3NQy-00uCmn; Fri, 12
 Jun 2020 11:37:34 +0200
Subject: Re: [PATCH] drm/msm: Fix memory leak in msm_submitqueue_create()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 opensource.kernel@vivo.com
Message-ID: <acd53f06-845b-75e0-24c5-40c751d12945@web.de>
Date: Fri, 12 Jun 2020 11:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:qaXAm6Q9wV9VhMqjFLP6tY0gcA2He1dT9KWiGh6g8sxPdYxPSS+
 xAG61gafXJblj4/iONwtirdhDf1sg2OPviJqUGaVn29vgp038pDESbJ18EFQz3qh+yyrJss
 /CTCQ+1LyeB4JKPuMYPiz5UD8CLt/xOcWxDJ4xT2+JusNTaI/QuGqKDbrrb19WtlqFaRhst
 iOS8dSnVKNGE/zMNQwLRA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ScQ2l+7H0Ok=:RJnBEIvtOBFJMuQa2CT6qU
 J3ur9yzgD2xZ4pBWXVGIUBg3qLPn6vIYKAca8ovyVG0TkSbaGX53H1T4GAW928u1RlyWJ1s2G
 XRPz1G2f+syD17kjPICMrJiSMcCVQNGYtYgD/JYZiPRMa+SriTrOcx3YPDp6rMHmCX9pyCqap
 QfbZyZF8NynxrGZJOOcObebUndNO3xzdT07H+pF7RXqGjB3sM5b4AEtxImjZTekCBN/dXsYyX
 S/ZGx3EvZiyPPGBM55vsv9RqyrViXKtPABfhdQ9w/Bb36AH+BSIaiw/o4U1fSbj3LGEWvZNW5
 xqRpW/9WDasDf0fZRbupErewIk0jkrO7UGsgfMjDxDUEclKj+T8dJvwUQyyn4fIZs0mEFw8qU
 gEMvmWf2RDd6mTxaAo23KJu0s+G5D+EGnoMuiR+y/3EZ9Wjx3E5x1wgaXkLKQ/Y1eKdb1RWc7
 oOfNyAYzzxW1kVxTQMlgAscueLHAjzZp/XieBdDQfUVUsj8Q1D0YdxMk7Y0H/5pQQOXS8xR2G
 Pe/3gW8/aRxX0Ot9vsrNUhInJvnobMSklKvyXXw3uyaoUYOgdihSidjsjpEyxoba0N09mE1fx
 IJ07zZHnkbSLR3PDLyf9061XY4baqGzRzkpBEVQgR7uSAkKrCTjo9N5LzaArsW7DkXreXtued
 nUzlnqW6HssjDlC43PHIh9Yt5XzuoOqtLSs4afZK0731cLfL/PvtpT3n5v6ZRFu2SCHgt3LQm
 dG2zizpV0iYurNiZ423Red36qB/lQiEPD8FSecQYhn2Y2XHuWDTB/HDAV+/r8FfD/+tzfzKcp
 LcAgXoUpKuqBdl8x1G6fvaAnyol4HOdeVxq9X78VEmyPNOC6k0m52yCynOab1luhpKN+z0+4F
 2k+Wk2ErrVN8025/0d4frS25RI6cXeAXb5hyOgLZf0aEMPLmbKTTwGiqRVofiohk4lU0HEjOK
 WULOiT+v4W+/7HAznesqfRSHRMdirnx4MS0xO27aVOlWL2Xk+o9lO3RuqlHOSc5X5ckzhOBew
 7kN5OG3d6aHq0xXUAvGNUE6y3P+fv7WufHwIhnDii5Uds7ncgcMl6r5jT22mRh4bdmmf2sres
 L7NU09bd45FyvkJWhlTun3N8xUTkdNMcUL7DrFU3oFRCf7GMjuobAKXKAhUZh91FCFj9dB85J
 pD2cXCXYdTAA+E47XUY7j7+p/8o04NTAWhZkYeHRVxre/iUk3LlVw+57dVuMdEmRWoaFXAP1S
 YvQ6wMIyIaT1rc1EW
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJbiBmdWNudGluIG1zbV9zdWJtaXRxdWV1ZV9jcmVhdGUsIHRoZSBxdWV1ZSBpcyBhIGxvY2Fs
Cj4gdmFyaWFibGUsIGluIHJldHVybiAtRUlOVkFMIGJyYW5jaCwgcXVldWUgZGlkbmB0IGFkZCB0
byBjdHhgcwo+IGxpc3QgeWV0LCBhbmQgYWxzbyBkaWRuYHQga2ZyZWUsIHRoaXMgbWF5YmUgYnJp
bmcgaW4gcG90ZW50aWFsCj4gbWVtbGVhay4KCkkgc3VnZ2VzdCB0byBpbXByb3ZlIGFsc28gdGhp
cyBjaGFuZ2UgZGVzY3JpcHRpb24uCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgYSB3b3JkaW5nIHZh
cmlhbnQgbGlrZSB0aGUgZm9sbG93aW5nPwoKICAgUmVsZWFzZSB0aGUgR1BVIHN1Ym1pc3Npb24g
cXVldWUgb2JqZWN0IGFmdGVyIGFuIGlucHV0IHBhcmFtZXRlciB2YWxpZGF0aW9uIGZhaWxlZC4K
CgpXb3VsZCB5b3UgbGlrZSB0byBhZGQgdGhlIHRhZyDigJxGaXhlc+KAnSB0byB0aGUgY29tbWl0
IG1lc3NhZ2U/Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5n
LXBhdGNoZXMucnN0P2lkPWI3OTFkMWJkZjkyMTJkOTQ0ZDc0OWE1YzdmZjZmZWJkYmEyNDE3NzEj
bjE4MwoKCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gcmVvcmRlciBhbnkgc3RhdGVtZW50cyBm
b3IgdGhpcyBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbj8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
