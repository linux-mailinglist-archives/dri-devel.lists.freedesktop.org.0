Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D021FC72B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A3E6E260;
	Wed, 17 Jun 2020 07:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80F56E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 11:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1592306597;
 bh=huDFMMsaa4Ulh6re2u+THK4NQNIrYFu1wKCsPaanNcM=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=Ey/eP+F7vsba1bVvyKJC8mENAyNDplQXjlkXgKabpnbfnW0BpMGM115ImE3VWG+5M
 WqhXL66l3ZtEntzbw+U25TexoPFq1T8SBVKd+t9OUtKUzn/LcSQS2sTpItR7Kaaud6
 iLsE02qH2rAMyUortMH2RdhZI2C+BIhPcSWlwE4c=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.138.51]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MJZLX-1jjli21DK7-0031rk; Tue, 16
 Jun 2020 13:23:17 +0200
To: Chen Tao <chentao107@huawei.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/amdgpu/debugfs: fix memory leak when
 pm_runtime_get_sync failed
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <ae59e47a-f981-9ae6-840d-1912c01b53cd@web.de>
Date: Tue, 16 Jun 2020 13:23:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:u3t9Od09Vu4D12ZCx29gsAzxYzsjg+REFMWz/C0rnIBfRWDnG16
 oCHAw26d3DReAZJDCVikivyrZ7WiXD6ncPwZw6cOBHfh2TxXzp5qUR/1gCa4yODW5cDUJwd
 mA0dWsBdL7C3WC66C8BZfc5E8ovylJZkEhgs9Rs0FlenEn6KAVa7qUtvvtpIuieH4RdqpgN
 hS43LquQ+vKn9wj+nj1WQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IFof/In4pzc=:yNZPNihtX14YaPGTC+8LPW
 7Ed1vUNwMHb6b46KiLVzfhNcXMQlzQNqbXPxy/8hzASTcYLIR8jnhkcW1+Bg8kY1UTBelc3yT
 /M228TgWyjBCeb7Y/E5CGJrQA+t8XGs036bg57PE+CxxVKJXESwHFom2X/Nk2WWn3ZPK71DBU
 8cYaAIEKBRYIl2wgMsdDF/kP2bUeUJYA7LH6PnnCNwbdmIsPPsCvFPpkIj9h4TYvxIWlbB5+f
 YNhMKxfueQvGPN4gGKbqEVvbTzhvqeILtlnuZeBWIOCOrDh4ArFMz5aXVoDrDjDH+Jj1ZiVg1
 rYbSkF0wQb9D2zUALmkU7FqPNe2QlMR+raubI9OVNsDQS6WInyVQS2esvl4pYpnEx/jpAJUIh
 tuVexgjzKHEhzlzhE/Tum4NnZdFSrKCp3UaqAbeP5uhciW3lYDXJbZM4LtMU6CP5CxPssmJbY
 0cxfDnDTair6cmyqmo8X4KF0VVo2/31fcxy0QsVVCzgqcvvu/NnUl/HYucoEgu0cMi0g2RIGy
 bUVemsr+6/1pS2XFq01xDi3zOEl+82nqItW69xEvecEJ440iyUxp2N0pWqzxdMhpbUC7itRUg
 gebAC1j5VdR0g8WKtnWa5/d5CaYXXYAAbvQa+9E6bYPwn80z++/u1pdHGFrpAn0KyqOiyBDzh
 plQCAyRzu2iWbqu3saihRRq46slDFkzAsjAbd40qfbu0OXWijiydn6ypXP8EXEYHphVri+xTz
 4d5Bd84E6vO11JKB1yK1rzXzr9ghpZnQdky1r1//+CWca4XOIz33+fJMyTaWXeFp2j7T9G0mu
 8PQK+b26RQK0jkr3X7Fwo4juwPdVXcFKXr5+fZNVn36lqtzSnffbsFkpP3L4zMKCy+v/fM1sa
 P8fjPOEohcJfh7zKwBQ169LpS3mslN63wxJ9QvY++dLZ7C+M3vawnKgo95E7pcDW8VJTvc9y0
 wLRSiURE0awdXt9cyqEyoh5vRz8xn+IwLxoLT0KZVnLHYrL50YZpAp5hcVBtEC6aYp9G0KTLF
 n1Lx54sQZ6WUY6EBl3IbKcO2CSu6UAPH1pTgOXMTPZXcg35Zd6SqD1XT1x7ehuLO0jofCDmYx
 Yi00e47Cb8XVutZigQfl7Jk8Yi0vvoupcFuDCSK9sj8DKuVVEWzaCjgITtCPPpSN2ELpCASAV
 pBAtim2Qa1TPUtFJVeYK8Yz4Pu4lBOpfAOoYOxVe4EIFGgLEE0UPClwd1tXnz0ZUZkzCXH9CX
 +9KAbziy35qizn15B
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Navid Emamdoost <emamd001@umn.edu>, Qiushi Wu <wu000273@umn.edu>,
 Aditya Pakki <pakki001@umn.edu>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGaXggbWVtb3J5IGxlYWsgaW4gYW1kZ3B1X2RlYnVnZnNfZ3ByX3JlYWQgbm90IGZyZWVpbmcg
ZGF0YSB3aGVuCj4gcG1fcnVudGltZV9nZXRfc3luYyBmYWlsZWQuCgoqIFdvdWxkIHlvdSBsaWtl
IHRvIGltcHJvdmUgdGhlIGV4Y2VwdGlvbiBoYW5kbGluZyBhbnkgbW9yZSBmb3IgdGhpcyBzb2Z0
d2FyZSBtb2R1bGU/CgoqIEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgY2FsbGluZyB0aGUgZnVuY3Rp
b24g4oCccG1fcnVudGltZV9wdXRfbm9pZGxl4oCdPwoKUmVnYXJkcywKTWFya3VzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
