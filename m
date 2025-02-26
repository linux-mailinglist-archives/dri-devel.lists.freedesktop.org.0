Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7DCA466B4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 17:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DBF10E958;
	Wed, 26 Feb 2025 16:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="GXGPsD2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2D810E958
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1740587711; x=1741192511; i=deller@gmx.de;
 bh=fuuE49JHLgQEu5mMmTcwf6ZCS4XM300JbrdHN5kwniE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=GXGPsD2rhqFBfns3lY1nOHvMreYkcZw7NuRFlb+99qm24P1yW5Hr0HEAjq2Im2rZ
 wBo0fkRznbrn7NBi8hDKWKnrDf7TUj/eWDNwP4Cfl+EqRSCauE1He8GkQ1y5u4Tke
 2zaTXe0nq+NbK5tlfvh9lKUSa4YUE3T3FyrvHRNBBPQvSExPMKdhLM6fjKrJss3CJ
 BS/a1KNZcCr53l3Z8M1KspxFetWJYmgJCyhX9VU3LzikEIaqtXqqPpjJBniIFFaJr
 7ImR50kb5hQe3i9NrTypkdZ6bUI7rwDWlo6AJlsNZm6BWKHiKJxpiURjInJgiDGqU
 HdhV+2nOO8rZSs+wcQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsYux-1tSmPt46v5-00rIsU; Wed, 26
 Feb 2025 17:35:11 +0100
Message-ID: <963bba53-2200-4899-b1fd-2cc650990d87@gmx.de>
Date: Wed, 26 Feb 2025 17:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dummycon: only build module if there are users
To: Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250225164436.56654-1-arnd@kernel.org>
 <4d047af3-fd30-4fa4-aa3d-c0359856d750@suse.de>
 <a2c0e681-2cdf-4dc9-82fc-be35f54ff795@app.fastmail.com>
 <29ecc7c4-2887-4989-a1d3-aa76b44c0387@suse.de>
 <79d35e3b-9a0d-41a5-ab07-797bfa1e19cb@app.fastmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <79d35e3b-9a0d-41a5-ab07-797bfa1e19cb@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WlwvLQn6df8JcLdlvcWq7rno/4sg4CpGNOv4Y382KCAq3uQQ55a
 xC88qCSAj92I4gZnmiVVc7MWtUNIxkGivdkN5HijJ4ZWECoh7JY7xGLUsrz4V6jUAPQ2OHd
 m9KY7Y3cL3rhoCNz+JgYRGR2wu2mSQuGjUxYN01xCmN/xqSRT1Acm+kJtqkNjpSFlzLoz7u
 x2VdWNSMJYjZWPtVw419g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KrTJI3/m7BQ=;cC3w3XecgT8H0f8Xku0kj2e6Km4
 i1f6zfqL+TE9PbOEzRQY/j+FG9G3/j1kl5REfAh6pXOeGFz011yhd892xGaB1pmlaG+UeCBBK
 2B7RFNSZF3rUKHHRlunOxfdLnEcuRO8FQ4wQFUZfY6SMJrt0/ayDBNHaZ5iRFgv2XXRd1ZZ+w
 fq51H0e3vpd+6jdil25dWn5l33KB45DX8AlyN726YCeXstDP4ReLgACmXZmGDTIVwszWU9S1F
 TshsoIkUnj6c+heuAqrFwlc04kmmKnpIL1X5vN0kLHX686Ae4DI4wQcTWZ9qR8tZhoIF522Xv
 Xa9dzIs3Bidn/la/W6oR68kGdUDgSltWCWDFqbUj/LDX/9NQvu6P+WfuyCeuzZ3vVgoz2JHwI
 QZqbXSBLzAucaIpWKeBCqdHjMMc0jZ5Ocm/yOrKkAcDwRRheSFcBbIgIRaUr3CYF9tl4sc4gI
 Gsc0gO08EdL+aoAgJ/iExCXqice3D1zWzKXUFUf2YqXLRSJ+b107ssq+SOgdrUvn5YBonFP5N
 IACK+dv7b6HAF5BekpsSDRGjA/7spgsjwGOBd9Y3cC3NteBVOMI6ncGKzYXuV3O7F5U8Jst/C
 T/zB+IpKtQeotSdikrxp3cFb4vKAL3KmJp5dSiy7vC/g+h7QjuAkfSjW8jPl6AzexnWRi2uOv
 lsyqb98Ue3FJZFpLSSdoDH51G151KaFXCoh/hpgw0f5OWWtwKmWDLHwUXgPEgY5pnb8pNSKy8
 RmU7aemYfObL+24gOBmBO8lT9vVSWxdIKc/tgxBweqpF3YesdT7jJtj8fBl9h81AkTRXLQCz7
 l2nL8M6tCVorRRsgIhWLNkMDeVJsWuwJsGBvijGNZBnimPuVQo9+3g4z56iITn54x21XwZ6Rt
 prsW/HWKwP3s1/Ni8UYVg5avkee2RFb4LLEZt8TE5c9um+yEWynl9vsfAm9/saVMzzqVhqfLM
 eCzQPYnQj35j+bKvvIbDQXzxFJWydVHxTWJXHHdUR/JU21r3fKUvsijDySxo6xw/JHffX+Ol6
 K/TFdTIX2i5N1wxfwmzAb4zOgDA86Co/1xfo2MM2kCNSo0Or7XdxfaexK7m0NE+HNa7Zd1jau
 2KC+qnQPetiCKDORIj2CTUujxipZLbfyWqYDb8uuX3Aa7TGI5d6j+aBJj051Ia5zLZWzsL4KS
 YH0qlJEdpeFQ0M3j6tOTQTIONvVBM8/4JzVy+yuPeBWhULnAogQ3qUAzWJ+QaA0AN1NO1aud/
 jAbXvfaeNdpLBn88QPW0vWGdvNT4Pp3izYGc2MuNbkAvyxwPSQ4R4CivFBNdmD5NGYzRBB2QC
 j8RaM3VeeeaOdeeVjzKQAxltXz3/oqYXIRzl2pjBWLofolDuUrjhfEOJ66GJSYTua6jIzbpQu
 btE7/HMSUyFavYTjzH/o264jF9ir6rShVDNKl9HkpYaqtqL8CNIdpgYkuC
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

On 2/26/25 12:46, Arnd Bergmann wrote:
> On Wed, Feb 26, 2025, at 09:16, Thomas Zimmermann wrote:
>> Am 26.02.25 um 08:55 schrieb Arnd Bergmann:
>> Here's another general question. vgacon and fbcon only seem usable with
>> CONFIG_VT=3Dy. Wouldn't it make sense to have them depend on CONFIG_VT=
=3Dy?
>> dummycon could then be implemented as part of the vt code, maybe even
>> become a vt-internal thing. The console code is complex, so I'm probabl=
y
>> missing something here?
>
> I think in theory one may have a system use fbcon purely to get the
> boot logo, but not actually support VT.  I had also assumed there might
> be a way to use fbcon as the console (i.e. printk) but not register
> the tty, but it looks like the console code still requires vt.
>
> After I looked at the vt and conswitchp code some more, I wonder
> if we could go the other way and instead of integrating it more
> make the conswitchp logic optional: most of the complexity here
> deals with switching between text console and fbcon dynamically,
> but having any text console support is getting very rare (vga
> on alpha/mips/x86-32, newport on mips-ip22, sti on parisc).

Yes, it's rare. But on parisc, if no supported fbdev or drm
graphic card is found, it needs to stays on sticon (which always works).
Otherwise - if a card was found - the kernel switches dynamically to fbcon=
.

> If we do this, the conswitchp code could be merged with dummycon
> in drivers/video/console, with the simpler alternative just
> calling into fbcon functions.

As mentioned above, that should be optional then.

> I'm not sure if we can already drop
> vgacon from normal x86-64 distro configs, i.e. if there are cases
> that are not already covered by any of efi-earlycon, efifb,
> vga16fb, vesafb/uvesafb or a PCI DRM driver.

Helge
