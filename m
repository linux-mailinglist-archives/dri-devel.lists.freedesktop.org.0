Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8DA1ECA25
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 09:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443696E4E6;
	Wed,  3 Jun 2020 07:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6813F89F43;
 Tue,  2 Jun 2020 11:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591096244;
 bh=wAC4w7GsX0remXYtsz0+/q5r9dTHAJaLyqVIp9ofCno=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=QlA8fN/T8lLIFAz/KZoHWDcAB8p8C5r2Kin+1LZzw2ZjhgrGAFAKqCcDt+goVxMXD
 +cOScROdxHL8MnHmZruJlYgLbXmxEl9dUELAC922wASMXdFW5h3SjHkm4PHs8dWIhi
 WZUy3XaDAwAxoOzTa5PjSIltAh/Q5Af+PrxCZJWI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.186.246]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MODmV-1jMc1K36oz-00OX4F; Tue, 02
 Jun 2020 13:10:43 +0200
Subject: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <20200602102955.GZ30374@kadam>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
Date: Tue, 2 Jun 2020 13:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602102955.GZ30374@kadam>
Content-Language: en-GB
X-Provags-ID: V03:K1:uazG0p1YzHXmf3z0hs6p+NcCmKHj9lldr8B5DAKIx1PI79krr1D
 sRZGw9PeHjCaTXI434td5X6q/9dus1PV6nmoSNWA0z3ez5nPyZj8MvySdQSKJu9jb5M1RUo
 NApQFX05yN04RNeZypU4m1ZNmvM9qOrtxvP3pY3rVP3dIVzlEBe9IJUuUgnRflssNtrmW/e
 8zy62sloEXL1/USkG8qNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DHRVIPzbTBk=:Z3qDqkVgFdZeUH0Nn58AQS
 cjTa4y8p1p5a4NTrIYeuyAHBpFGrPaxV+4fi61cPJaPotu+sJYrnc9PFaI77tkACSCJTnGK89
 OBRpagnHJcJYprT7wC/j/Nq+auXrjwwaHiBE18eYmNRaJah5eLwDsMYdrtgth+OSE8YtyrSL7
 /6x20Cm4YOJb5x8PoxiIJLZu0nROHZF6muaPUSHFslosma1GTAg1alYEAjxe55NPALp0kL1vX
 zflleM1KtXb4DJFLt0IL3vtr+16g/1DnGFyNlUpd2CGiUl3KPkBHvWfVzJgQQOuDrqHfVtMLu
 PJWbU+/6iVLPIGWULCWfnDkq0zXJJ5PXVR7go+9JxLZCYqRYQZP5yYFpjhYQPwPWpPeOfRr6Y
 scpGvNgpe+Z6k7wGER/avMO7VwxbHplTSyvGxwVJJWPixSEVaxnY9SjBspMrREpgqyMk+RKrZ
 MePbAEdF50LCE80L8FjmvzzqjavmJnD4GlVFQ1BKHiuapjbpdsEEPUDSukQRX+pIc+iZH6TX5
 Xdz+nwAsnc8EbjxsCr+CwVPFtHw/zx2SPF/apw3XHzjYDNFcIdDuoI5dJCasivnygBYo7NZIx
 UNoowCt9ARH18aemxL3uCD/ZJbZu4IaTC6pFgtN0X7Lc0la2RyZPj4buCpfP9pNq6oivv5qk4
 00ILbg/vXx3MRoBrPVCWFKR/Htr4obBwGZvSPYwpcBMl3voLCIlbvnqwewHw45HVhDRwnxQRY
 xBqmMYiXh5VPJ4y2I+b7WBHZ6D4TOV1yWDuKiX/OXYOTj9AVnYPRPN9Z+dhjpoUorslLzs/rT
 UFcgqojZ/akhSHcQxP14seAwwGj+q61niX3xJoY6g7BlA2EaRhv8c8plqFXRW82rqDo4uKCv1
 kKgSHHneWFGAHGmVG0Yc7Imzp9XxYigjNqhhufZhbtfaUNcaw9ct/1H4sXhSNtWe/dKoayX8+
 B7g6rJIjnk/0BQUN9WWKncp79iPWj7Ci4WYNkrFy16BNBVaaR0kDvqJK3lebW+rLmegnwh9Dd
 hfjgMtIdSo+Z5Nu2wbZcSeNyNOcky9pNeZE1OeCVEWUk8BXzbTVqofSTCY64lv7HnFDMTxjNQ
 ptfzzMjO8qmSPdVdw35qUiFd3uot4HnHGp7hBfAhkOazhGU7ZGXxzb20kPNjdHX0eyE6W0pzF
 /iG3rlBZop4HGhtSE8merhbpyYjClGI8eFc+B9KTFp7i2CGgU5p7M13UG3M0GQhM5HGRFJfdi
 7+BjU1zzL7RLnP8G9
X-Mailman-Approved-At: Wed, 03 Jun 2020 07:04:29 +0000
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
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBUaGUgb3JpZ2luYWwgcGF0Y2ggd2FzIGJhc2ljYWxseSBmaW5lLgoKSSBwcm9wb3NlIHRvIHJl
Y29uc2lkZXIgdGhlIGludGVycHJldGF0aW9uIG9mIHRoZSBzb2Z0d2FyZSBzaXR1YXRpb24gb25j
ZSBtb3JlLgoKKiBTaG91bGQgdGhlIGFsbG9jYXRlZCBjbG9jayBvYmplY3QgYmUga2VwdCB1c2Fi
bGUgZXZlbiBhZnRlcgogIGEgc3VjY2Vzc2Z1bCByZXR1cm4gZnJvbSB0aGlzIGZ1bmN0aW9uPwoK
KiBIb3cgbXVjaCBkbyDigJxkZXN0cnVjdG9y4oCdIGNhbGxzIG1hdHRlciBoZXJlIGZvciAoc3Vi
KWRldmljZXM/CgoKPiBKdXN0IGFkZCBhIEZpeGVzIHRhZyBhbmQgcmVzZW5kLgoKVGhpcyB0YWcg
Y2FuIGhlbHAgYWxzby4KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
