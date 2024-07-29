Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC50093FECF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 22:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312E210E47F;
	Mon, 29 Jul 2024 20:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="NXkfHptj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C1210E47E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 20:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1722283780; x=1722888580; i=deller@gmx.de;
 bh=HnJEGVdpy4sBdFdXLPGxMdC9r0+LnK1pBEvpWWt9Dmk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NXkfHptjY3CjBjdDvNVe5TOZ7dkSZojj/vU2SI3uyq/RXzXVtKLGoF3qwcQMsUBk
 cmeG9TybrzdtyyuRkySyvHKO8cQMfzTV7pRyziRutb6kcLOwt9tndYwrSdE1487pk
 5S9WdKDMXOtv8r0OrVNhZsFdXIAoK08qQBo5q0dvNzpnCqNn4ta3miaj35OKqmf/d
 J2HL0GQXpCP7Pzuazi+Q1hoWJMTduT+BKBFhA6HcjRxFvF+aNjP1UZxLszH9Ecok7
 N5UreWOPI7w4ah06DEiRhR3vVdXtv5Pza/KLI5SCCzfBxcmBbhzw7IUcChKs/ODTT
 jTO5Psdu5lOwplnd+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.33]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhlGq-1s3Zem0ILo-00iYU7; Mon, 29
 Jul 2024 22:09:40 +0200
Message-ID: <9dbb2b52-4fc9-4bbf-a6a2-ab6ec32adb8f@gmx.de>
Date: Mon, 29 Jul 2024 22:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/hpfb: Fix an error handling path in hpfb_dio_probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <dc4fe3d857849ac63131c5620f1bacf1a3d7172e.1722191367.git.christophe.jaillet@wanadoo.fr>
 <698958fb-4fc8-4288-b067-5843c651b093@gmx.de>
 <ac4c6712-c47b-4414-9640-3018bf09e8fa@suswa.mountain>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ac4c6712-c47b-4414-9640-3018bf09e8fa@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sINRL4xYNGf1c3r5Kk7UX+Rrmy9DIgVOE9kxCq30DHYdt/0e27T
 jhFuqu4Hhj74KOeEP5yWHJTDknALVaNrgbb0YNK/XeNw+7IO/LD1t1wd+0BfP0y6NWrMa8y
 NkPGhv0Z1UUq+pdzzlsAM1Q/7EZUe9k7yF+0aBcq3M2yyBEv4YWnJvhy/m75zDtcxgxZWHM
 lRI3tC1RXAfLnnywKm7Mw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IlWY2nqOzfs=;innPIYSA7343BsmVdz3p7CEzc99
 1sG8eVujQA/RPREQ92D3QuLnkOooikwMbGfJnNHZ3DopGgj11UA5wNqOqrd3ZhrQtVl4eZCI1
 Z5RTzSNOzMjZGDpZwk9ptsVex8Z69oV6fRMiJkV3MsjdMFWONodNZHgZ7kf9ZFCpTDv9Xn/t0
 dXqPWQILFZ2AgzFLkoMkUqOsCPqDgoJQcUpQDArQwfb3+duNT5H6KIj8w755Yaod+A8rv03qq
 h7/pJ+qmu9k7Eb/13FkAu/CQOrn84GA4veQ9ZvdVUX+B5fsuIaoJVM/h/pRbYw/iq0CKcMwiR
 7x7b983FfSDESdgaADWGKZsDfJKYJ7e7HY3UGhMYLxnee5bY9nP0WxcxYGcasmOqX4wWqLGHx
 LkEw/sLo7Sz9b6UywuIgiUkLUXSoSzUZSBZy9MlBVm8He1A64IEcnXADsFtUThBe+bGAel8Iz
 iw0o0qFPe7EPK1Cre+P7iMHUpMH/iJ950hb0Gmv+IqqotQnLaci7zeS2epf7eSpJ4HGtbyS/N
 yk6GUvFwOftHpX4iallULSkbh+E2C8ViwWy6yc0wZUsGLtSORzC5HXsX1XsSy6T/+HCZVyoNi
 7eL1WyvaKmsnmTYSZ+dMgo8zQtWzeE52erNxuh8yNwrM56rqd7fPZGSNj2DqESqjMwiGSodqx
 QJAHRHxIdQ2vCdMWJ+v8OteTtGiyatkI9ptVaknFA2kPl+XdlooD8oWGb7zEu7jDb87K0mUSx
 tWFFofQTiUF+wtaYkoaZBU3x77IhyajJKVXpKt3gp8D3QA9FbYuGvus7LF5ggEI2Gm1cTL38P
 oreP7PSO3aMDmdLW3CJVRUFA==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/24 17:59, Dan Carpenter wrote:
> On Mon, Jul 29, 2024 at 10:13:17AM +0200, Helge Deller wrote:
>> On 7/28/24 20:29, Christophe JAILLET wrote:
>>> If an error occurs after request_mem_region(), a corresponding
>>> release_mem_region() should be called, as already done in the remove
>>> function.
>>
>> True.
>>
>>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>
>> I think we can drop this "Fixes" tag, as it gives no real info.
>
> If we're backporting patches then these tags really are useful.  As
> I've been doing more and more backporting, I've come to believe this
> more firmly.

Sure, "Fixes" tags are useful, but only if they really refer
to another patch which introduced the specific issue.

But the tag 1da177e4c3f4 ("Linux-2.6.12-rc2") isn't useful, as it's
just the initial git commit. It has no relation to why release_mem_region(=
)
might have been initially missed. See:

  commit 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 (tag: v2.6.12-rc2)
Author: Linus Torvalds <torvalds@ppc970.osdl.org>
Date:   Sat Apr 16 15:20:36 2005 -0700

     Linux-2.6.12-rc2

     Initial git repository build. I'm not bothering with the full history=
,
     even though we have it. We can create a separate "historical" git
     archive of that later if we want to, and in the meantime it's about
     3.2GB when imported into git - space that would just make the early
     git days unnecessarily complicated, when we don't have a lot of good
     infrastructure for it.

Helge
