Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E7203026
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59ED6E22E;
	Mon, 22 Jun 2020 07:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE2E6E02A;
 Sat, 20 Jun 2020 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1592644827;
 bh=gfBo2fIKL1/0B/EQPCDokDjvn4b4GEkaykqPAegO7iQ=;
 h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
 b=KjSQmL30CISuBGSJhVqVS9DqwulwcaxLxERDtHeoaFcMYZ5QRKJnNMPtIDM4QmaBo
 OBLnRjEHWZRaNm10ZEfsj8ORzofJ38hbbz1/OU0l56dVkz9J4srYw5B7bojewsJ+ZS
 nzEILnjorI6Qs63FaYHQjHCD7Ml4R7bhnev8Ywlg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.139.185]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LuuC9-1imX2R3NZZ-0105uE; Sat, 20
 Jun 2020 11:20:26 +0200
Subject: Re: [PATCH v2] drm/amdkfd: Fix memory leaks according to error
 branches
To: Bernard Zhao <bernard@vivo.com>, opensource.kernel@vivo.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0e76e678-94b1-8f69-d52c-2b67608d5ef8@web.de>
Date: Sat, 20 Jun 2020 11:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:oI9vUF5sNNY9wH7ZamHvFCLoBIHgf10ijVy1Rs6xaCXcH0FKH+7
 LCgTYi5PSqyjiqSGjOWxdRgRTlycaxsVEMJBUmUvq+e77D8vbQFViyjYI96O+qek/D7jGdf
 mUnHa394LKR6QnjfnHZAqCK+Uy4MQdD4B0MXc1H/UP6tggDOFD/J1J4sFs4j3jTGEedjg50
 VQ9me/1QVkOak1pTOm2Wg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rYzBPAnsXyg=:JD6n8n8vrq1vBtSerMY+aw
 IHZRU8OCRPNWaItFu1uDLmnKG/kUMrXWLH7hZ9+JDHAQ5L6/I//ubbxfXiD98F/eTmw8XaJwH
 6fqoyX/zW+noKGgiWW0NsmypqGPQmWkyl279r+Iz3Vp2t8cm9AEZU2S9nTtQmKhpB97vNbiX2
 rofS8LwfDRlWksHHZ3f9zSTiYWZcK4F66eOibmCoo6I1so7Glnn051VGJ7hElfKXzaEBZLLEa
 TmNfICpWg6NE8qB6QKrEYKopVdWohi7nB30SLBmBuE6YGgDALdq51AAlFc017DZGnWEoRrmWz
 Y9vqAbst3oakmaa9sItoA/aKJSZUOmPsDDgcL90mAMhYes+cR3i2B7iIiqDGYsKKCLqFqZW2v
 RpnTbxhxQE3s7oysl1C6MXunGuuV1LAY4Q4XyIN1lSqOW5BKsW1dDy3Vjgw9iIGo47TwnR4zw
 7C31vqINPch60UTLSit6UqZE/pZ0KD1TN6tDa+jz6lAGjW4N4x3Qnjbi4VuE3VM10nTQwD8BP
 e5LLjISORNxURfiOWvCkCocz1QNbziazV2/Eyu6gD3vyPqbGpG/BPYJrT36spWManwZabo3HI
 ST0hs+/+KJN7L4QkwKd4PSwWAI7Dq1K9wsdTbfH3jUVfxQglmVouklHjCJzt8YNDcaDipCKjK
 xRD6lVaNEFjAGgoX46JA60EJc7HWa67cqLyUeTz2u4AosATjRweXEitiAoUpEB2bTpmQdFNgS
 jciPUAfI8VEafuE3VW4gVI+IpAUmLlIIa8w6k6jLEfExPgkeKtnEKqETDbMv1ZP9S91tKBURG
 tAOEnXygbxNDV8xoNdc/mHvmTG9qbRRuOsvIMNMl+gXsVAI//Mya6Q806tFRFhtjZEzdFIImI
 JwwGqnRzUrSEXWTdXNXSW/i6A028IEjWE1E9y84uMNQbz6zSEyTTxprIVfDp8qkqvwB6R9VIA
 L5XyV1m8BTPdMOh+VYczhrsJxbGl12v5ZlrijT0zMGAcUls+LZIQnIk2NffpIbmjXco+vtBR5
 hq7qwhP5Fh3E4HKNEJkhXwnVQc7xfz7/rUP4eVs7VFNEC6ECl2bsAcEj37dAcjFztPMNq5xcP
 L9HjKjDjtw7pwJlIa3k4L459XYf/lZ5eUm1/fYTGjtBOFfoz9E4aE92WlInnIF40PIRSXLc6y
 Ww51IYbNQJwEQP9x1YhoAyZuUGP+FlM3hy667ExS8/Gn4x+v4hQNh/J6VJYNl7eM6KJ6Gqp2r
 1uQgV2vz3qeQ4YqBz
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBUaGUgZnVuY3Rpb24ga29iamVjdF9pbml0X2FuZF9hZGQgYWxsb2MgbWVtb3J5IGxpa2U6Cj4g
a29iamVjdF9pbml0X2FuZF9hZGQtPmtvYmplY3RfYWRkX3ZhcmctPmtvYmplY3Rfc2V0X25hbWVf
dmFyZ3MKPiAtPmt2YXNwcmludGZfY29uc3QtPmtzdHJkdXBfY29uc3QtPmtzdHJkdXAtPmttYWxs
b2NfdHJhY2tfY2FsbGVyCj4gLT5rbWFsbG9jX3NsYWIsIGluIGVyciBicmFuY2ggdGhpcyBtZW1v
cnkgbm90IGZyZWUuIElmIHVzZQo+IGttZW1sZWFrLCB0aGlzIHBhdGggbWF5YmUgY2F0Y2hlZC4K
PiBUaGVzZSBjaGFuZ2VzIGFyZSB0byBhZGQga29iamVjdF9wdXQgaW4ga29iamVjdF9pbml0X2Fu
ZF9hZGQKPiBmYWlsZWQgYnJhbmNoLCBmaXggcG90ZW50aWFsIG1lbWxlYWsuCgpJIHN1Z2dlc3Qg
dG8gaW1wcm92ZSB0aGlzIGNoYW5nZSBkZXNjcmlwdGlvbi4KCiogQ2FuIGFuIG90aGVyIHdvcmRp
bmcgdmFyaWFudCBiZSBuaWNlcj8KCiogV2lsbCB0aGUgdGFnIOKAnEZpeGVz4oCdIGJlY29tZSBo
ZWxwZnVsIGZvciB0aGUgY29tbWl0IG1lc3NhZ2U/CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
