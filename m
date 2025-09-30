Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9296BAE792
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 21:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C84E10E2D3;
	Tue, 30 Sep 2025 19:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="LYOaoTyR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F3010E2D3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 19:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759261645; x=1759866445; i=deller@gmx.de;
 bh=/LhNEC0/nOPOomcwTickZbnZYwPN1QQJigQsh7wmvSs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LYOaoTyRose4GFUoTSOkBaud5XplcqEZbxK9SMovEEASKzJNCOjlUYn+jlBU/KHf
 X1qgfbyuMFDqA6OOZOd3Pf+1cTjimEuBWclgbGTdXWmN9/pbZMAC5yikZwx9qwh9R
 a+4BXeC5Z5/e/Sgt9keI5zfWA7gk5mJnUS56PIw+K4CnfhocLX7/EjqdRhgBR4+I/
 HRTi0/hf7CtsqhnJEBo4YNNGivPSWjq7HurB+kZJWnhbWfgs4nE7t1aV6NCLNA+dG
 VNbhji9aVAxWMzhFenoA6uS/o29wRel7svJnpbi85XlLJ9xudjHFPeZ9fwr0Tot5j
 gDKf2ARQvZ91zGhfzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.4]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79uI-1uE9TM3mt2-013Dqj; Tue, 30
 Sep 2025 21:47:24 +0200
Message-ID: <1f73008b-8a3a-4809-a61b-31b3299dbd62@gmx.de>
Date: Tue, 30 Sep 2025 21:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] fbcon: Pass struct fbcon to callbacks in struct
 fbcon_bitops
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250818104655.235001-1-tzimmermann@suse.de>
 <20250818104655.235001-7-tzimmermann@suse.de>
 <20250905190004.GB361827@ravnborg.org>
 <60f8cfc8-ccc0-4a55-bce5-7ab30c3ae1c1@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <60f8cfc8-ccc0-4a55-bce5-7ab30c3ae1c1@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6/WPY2/fJIqVTMMwgrggmrcX85nyaWFRzilqVaMJwpL4gfzQG+L
 CHeaPrtond3BOyQKuQhfXeO/O37C2UWkjeYweDhfwOQkkT0VAdHYh8kHeqf60yw16z1Z4KK
 p/6wZqi24dXUW3midBMqmyi0j1SgRe0MANflYVyHgTTp8kqytHHQbPkmJ/Jtw9piH0zWRAh
 vge15NsP1KQIySEoE9bzA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qebQ5p1uoCc=;sRddm1IDQv2h3nCiyYvlIxvnoyz
 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
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

On 9/8/25 15:08, Thomas Zimmermann wrote:
> Am 05.09.25 um 21:00 schrieb Sam Ravnborg:
>> On Mon, Aug 18, 2025 at 12:36:41PM +0200, Thomas Zimmermann wrote:
>>> The callbacks in struct fbcon_bitops are for struct fbcon. Pass an
>>> instance to the callbacks; instead of the respective struct fb_info.
>> This looks looks like a pointless change.
>> All the operations requires fb_info and needs to pcik it anyway.
>=20
> Yeah, it's in preparation of a later change. As I already had the
> patch ready, i submitted it. I'll drop it now and re-submit when
> it's required.

Let me know if I should add your series to fbdev for-next git tree to get =
some
testing...

Helge
