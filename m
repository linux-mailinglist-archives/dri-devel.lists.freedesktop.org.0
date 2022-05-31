Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E3D538B61
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 08:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5971129B2;
	Tue, 31 May 2022 06:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365441129B2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 06:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=content-transfer-encoding:from:mime-version:subject:date:
 message-id:references:cc:in-reply-to:to;
 bh=q0Ly3VYEbjYqQhjsAGdFo317POmXxxJct8nswHWSNRc=;
 b=Crq9x9JaUkBocQegHBPU2uNvvPdzl7EqK4zJYsHxWYYL5HcLcVQKBQhr
 9tKuFo4YEJfEvBXWsmN1GfpzCc9ktKDJvTauHuIUpWxwmBLsgMis++m5C
 Ba6RU42SUSSqvNgQInV27Hpf6StFB0/GJyvwCR0C7IBQj6mFE9YtEzGyK c=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,264,1647298800"; d="scan'208";a="38688098"
Received: from 193.92-254-62.static.virginmediabusiness.co.uk (HELO
 [172.16.3.59]) ([62.254.92.193])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 08:26:55 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Julia Lawall <Julia.Lawall@inria.fr>
Mime-Version: 1.0 (1.0)
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
Date: Tue, 31 May 2022 07:26:53 +0100
Message-Id: <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
In-Reply-To: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: iPhone Mail (17A860)
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, SoC Team <soc@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On 30 May 2022, at 15:27, Arnd Bergmann <arnd@arndb.de> wrote:
>=20
> =EF=BB=BFOn Mon, May 30, 2022 at 4:08 PM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>>> On Mon, 30 May 2022, Arnd Bergmann <arnd@arndb.de> wrote:
>>> struct my_driver_priv {
>>>       struct device dev;
>>>       u8 causes_misalignment;
>>>       spinlock_t lock;
>>>       atomic_t counter;
>>> } __packed; /* this annotation is harmful because it breaks the atomics *=
/
>>=20
>> I wonder if this is something that could be caught with coccinelle. Or
>> sparse. Are there any cases where this combo is necessary? (I can't
>> think of any, but it's a low bar. ;)
>>=20
>> Cc: Julia.
>=20
> I think one would first have to make a list of data types that are not
> meant to be in a packed structure. It could be a good start to
> search for any packed aggregates with a pointer, atomic_t or spinlock_t
> in them, but there are of course many more types that you won't
> find in hardware structures.
>=20
>>> or if the annotation does not change the layout like
>>>=20
>>> struct my_dma_descriptor {
>>>     __le64 address;
>>>     __le64 length;
>>> } __packed; /* does not change layout but makes access slow on some
>>> architectures */
>>=20
>> Why is this the case, though? I'd imagine the compiler could figure this
>> out.
>=20
> When you annotate the entire structure as __packed without an
> extra __aligned() annotation, the compiler has to assume that the
> structure itself is unaligned as well. On many of the older architectures,=

> this will result in accessing the values one byte at a time. Marking
> the structure as "__packed __aligned(8)" instead would be harmless.
>=20
> When I have a structure with a few misaligned members, I generally
> prefer to only annotate the members that are not naturally aligned,
> but this approach is not very common.

Searching for specific types in a packed structure would be easy.

Coccinelle could duplicate the structure without the packed and see if any o=
ffsets change, using build bug on, but that would be architecture specific s=
o maybe not useful.

Julia



>         Arnd

