Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B426855F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8046E1F1;
	Mon, 14 Sep 2020 07:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C776E051
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Sep 2020 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1599987610;
 bh=JUguRZJVZwfTJxpL/oe8SVe/2eOlKC9J80EmdMdXYJQ=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=aYibM8siJkmaU5760F6ao1CMmKrWVg4VVWWwH02fsei2ACqogm2RH+yC3YETxLOHO
 X63MdiPA6OhvehB+6qHrb6AizHIcjN73GYkiSw9pFo9r8GLIgMlRMjLOg8ijCIQGxf
 kBf8irJRRdsnIAkuddf9JS0uUnsNQUhtuw6hsxR0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.189.215]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MKJAE-1kGpN13BjC-001f8d; Sun, 13
 Sep 2020 11:00:09 +0200
To: Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: Fix a size determination in
 a6xx_get_indexed_registers()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <011d0e32-3ccd-b294-2ccf-8c2baed1b8db@web.de>
Date: Sun, 13 Sep 2020 11:00:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:5mIBa5TX3MqNgHAZrVgo/iiqzB6PPlm6s0hZXjGLitLJapATymf
 2q0fOy4cQOMqgLfwO5gtNILuCeaOQjXUMp7Ri5jQy3fQXkyDsTQiN7YAKQtHCGHAhBFEBpr
 iOl49C26BBzfrelwi+tF2AFmCgs4KRwEeCeojvXljvVijIcjZmPfn6HuMukXQc/cDOs60Uw
 A+nVm2jp/73CFF0s0KyJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J5eWBEQmaNY=:W8OiQD5fP11bynweJHKvFb
 bDuXmO59lgNqcsudjT3rbCe3nTYXAJcb4wtObkq7tfJr3cG8076J66wAArqso5S3K5IVW5j8c
 gIR2WYbg2NSH6uuO10NiObhLFkxdwaNQSsIhy0Ae0T19EGuD7K1OZ38SZGpv/xWZD+AOf8S05
 xM6bPQvOEWeSuaEuc5u2Z84kEEEcRqKCjlFrzVCF3D3ORJDzn9RCl5wCyVLiHiijMBXr48Gin
 locRY1Txrr8Dz4a2MFwqxiOvrak3moX56kQPJ4sWuGrgLi6XNWKJTzGItyhYkikxIH00mvWwz
 Sh36mPRo/e0GsLUZ03rqB9VSaKG0HcLjK0joN+aDiit1sxu4x4p1d0wEDpuwW9nJ6OAfvKuOT
 YWWtAz3x+ZSjB7zexpKjXRbycVN4Il+gsBgB2R6LMzymLHyoTwJU7WPWcpc/Ylr/khtiqBUiG
 j4qERnxshXWHi72OdsSv7BoaPPCu9p77CzgR4vfg+A4buxDy7F7nRwrs9D8sYkLOQSd39R1uP
 aPwAae+e2MAUObr9EGqxTVH+oYb+aPCVcyq1oiB1+qPRIgRBrSa1wN+Myu+iKfOmrhPs5+xib
 G7gmEouetYJcm3jg+dZ/2FDV4PcKYwwoktYHjSrDP/QgSgnMiC07fq/7Xs/2a36xjSaRvv+H0
 ffR2PN/7+Ac62us1d1myjSP631k2mceslk3mL+MVqdIBy/UeKWOEgkc0bPR3AJkVV/oGiWxD2
 7fYIJI4KBAGKKnszBYuLiUIryhiNAPBruGf7QpN/RGeBflC6cLmEOmh/6fDJffta7pdI4cRvb
 Yiaq75soSCLSfZn0FK91k0N6/dklRsLfJiJTWhih4EWGjYfkvURQfIKHouo54Znj++Ze/Mile
 yzVFWIbepEi9Z6837mSNumMVjyiod3QbiKhrZvJLNiD8mbp6M0XD5bB/mW7J2kRg2qaNV2gOF
 4WWAJw9xZr60ykIUgW47D3IqCI06fsf3qRkdSmLaW/UTZ5GMgfVm4jaEPg/UrG3Ix/+ooUqhy
 OACIrqAXsvjRvnD/8I8pxEPdz+PksvbKXLPONR5CcryVZfGiNUvhY2fHmwX6YrhFooZYTFaso
 zAIyGnLQxuEMynbAM8F4kJS+DncdzgQYfAzyvyl6B1sPSs0xomdMW+FtXDFw6I4gEHjRSEzCz
 nHblqBI5fcWa3Qmv7ayq+veOB9+ezzK24E5bwTEkTKgOkcsRD3rWnd2jaRpymzRH0pBjejVwn
 7lzvsOeJzn4Te4RyXCi6wHPpzDgD43BopZ1YqUA==
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Sharat Masetty <smasetty@codeaurora.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJdCdzIGFsbG9jYXRpbmcgYW4gYXJyYXkgb2YgYTZ4eF9ncHVfc3RhdGVfb2JqIHN0cnVjdHVy
ZSByYXRob3IgdGhhbgo+IGl0cyBwb2ludGVycy4KCiogUGxlYXNlIGF2b2lkIGEgdHlwbyBoZXJl
LgoKKiBXb3VsZCBhbiBvdGhlciBpbXBlcmF0aXZlIHdvcmRpbmcgYmVjb21lIGhlbHBmdWwgZm9y
IHRoZSBjaGFuZ2UgZGVzY3JpcHRpb24/CgoKPiBUaGlzIHBhdGNoIGZpeCBpdC4KClBsZWFzZSBy
ZXBsYWNlIHRoaXMgc2VudGVuY2UgYnkgdGhlIHRhZyDigJxGaXhlc+KAnSBmb3IgYSBiZXR0ZXIg
Y29tbWl0IG1lc3NhZ2UuCgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
