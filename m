Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017D4984079
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A95510E68C;
	Tue, 24 Sep 2024 08:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="WbIEjLIq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC9610E68D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727166424; x=1727771224; i=deller@gmx.de;
 bh=WREGJqGC+hFt0OXhRGhqsxwpXCFO8oIx4yvBC09r5+I=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=WbIEjLIqPJNzfdBtydNQGuWUiY0FNf1YH4/DBIcU7ZuxDSbkHCV0Irg9Zz8Ti5sT
 o7V6z/IJaM31+HawBN8NV+N7QBTM8BcA+G5ol+yZopsAXHOgal6ki3GRl0E6rUg7m
 e+y7dKXkRqI+DMvfEKZWGwy/+pwZJOlux9+b2CAswhXGXhP7IOdlkkAeA1rg6Ojug
 mO3/vLl64iZ6q3S4XzwRdEIWqHIb3FsN1gUvpKUbWUEBNuYyBBhOMb3SfDpuM+mnC
 c8sH7bghpzaK8Sddch/PKmmwA4kHKWnkODMJ8SmoqeJce8/TbDq857//KIUfK+N6E
 kN4VRwMpqnLcKMaYLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZkpb-1sOucR0BcN-00OzGn; Tue, 24
 Sep 2024 10:27:04 +0200
Message-ID: <a6369def-6076-4a9f-b8d8-ff32385235dc@gmx.de>
Date: Tue, 24 Sep 2024 10:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-fbdev@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
 <3e3fac51-ee46-462e-9418-095845b18ccb@gmx.de> <ZvHd8VV6MO4kfLcL@intel.com>
 <93c63567-d183-402e-82e0-f64b97b74ba8@gmx.de>
Content-Language: en-US
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <93c63567-d183-402e-82e0-f64b97b74ba8@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:LXuzfG/Lf4dCwT0Wwv+IYbnyN+x3LOCfbUVvNzMwURBOtGqXW6V
 vxnADtB2rNsPoiL6Yb/SeRx0lv1gJMWZhkWrVWgLXRr16d37fnIkz5OpRpz9qcWAKjk/yk3
 zCh1bxE9P+whr4um7zO/LyjjpnwcSMc0htY4vvy9RIzWD6/JlGiMRedRtco2REhBj5jAQpu
 j4iab0dZFuRO0b24iy1zA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Hem1cbMrRJc=;PPrplJoXMUg/XG3pohO3gYxG7bP
 naYtLGNWllSxJpicidOSUXpZUvSfDGtN/Ye9BXH6P0KlyqMPFeEQoEJF5LSBjSsFdDogyw9zV
 Pp+NgtCLyaM0C4jEz3z+DJjUKAnl0S5/5ik2feoqT7QCuxTmd/Dt2kmeGJ1eE1EgEHKi2jE3G
 m3JvcxW4kHHluizybkiBV7aozpGT3OBCfRYmn56qbz1iR+46xrhY9POVgmJ8k9+gJ4/jqCzli
 61NnG9lil4Hw+UPeGLK8W3KKomBNpsRd6f10b1bThT0rrPGxz3Nu6gIQ5CVJFUhnknIG0PDge
 Lhn8a/cfLXMIh9UiuVAhuFo7XBaEEae6UKqmr8t4WaV+utzZmXNCzXVnrOLC+JL5NxxAUf2Kw
 V6klHfApOsJhuCQZRwTozmMB4bBr+jv/Ywcbh9F1VOCVjjeHBei1VnD7JauqeMLcVHnpcae0/
 Bfbi1YMCitSuI8VhSRyN+kd39pM6tuUTeMDiT4F9RJfPJiTCyFfQpnJdoB4JpZ2Lq+VZcsllg
 mQ/qyp8meFROY9VbAkc8hqQsuEvInaRon3UT8ew2Ukorlnmx6A6c4WHEmjepsjkuXGjPH54L8
 lW9WXDTTSZrDohnbe8vhabulfeooFekzZlWe1MVyEG2iRKuOwXHdEBv/w9nUSAEGYg1UiWYsN
 U2hx6LNtsRoS0+GiYpmTvCjkSSU5pYHoe0XPwBzm8LzsLL9ZdpUyA3dmlca4995vXCY5E58Ir
 0EnQU7BD90M5cZzNSZwAVRfIPtVUQ7mp5Xms5A/V6b8Pet1BxJWv2UpA5ZzASLPpppcIR3kR5
 86elmPKgh84apCvKXcB87Q1w==
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

Ville,

On 9/23/24 23:50, Helge Deller wrote:
> I've added your patch series to the fbdev for-next git tree
> to get some feedback from the autobuilders and testsuites.
> I had to manually adjust patch #4 and #6 (after applying your v2
> patches), so maybe you send a v3 of your whole series at some point.

Your (fixed) patch series was OK. I had to update to latest git head
from Linus to get it applied.

I applied the series again, including Thomas Zimmermanns R-b tag, so
no action needed from your side for now.

Thanks!
Helge
