Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88662779559
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F5E10E6C0;
	Fri, 11 Aug 2023 16:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9889110E6C0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:56:16 +0000 (UTC)
Received: from [172.17.30.35] (unknown [5.151.124.206])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F678660724E;
 Fri, 11 Aug 2023 17:56:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691772974;
 bh=ARy4+7SKaqKKiqjLDamlTgewLXRauJBKFOXdY1UwCFM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CugRXQMM3ffOvZLvZGT8ciqHzDocXqurIBm/vTK2gnLWCen1U7n38JuMuacIGkm8l
 omDs9iiIbbEIj3cgsbFZbSbyjmM/FSuDtws8phJEsdH4vvM3ZuysW9nzCW3i5rHL/p
 gYY4f5ep1AT3OqzQ4fPbFMJJT6XvijXn5AROXcZrrkPAk3RbWk+8hgULrbHDqBQR4F
 wniG/4EOpcBTTRGtRdvPWVyD2OKTTppzBSuxCeUCWp8UoIOJNyOHU+6BMwS/6U5mYx
 ThUnVDXXUgKZmrBa130j7DJC8otC9+CMQwIzELNA5wL8e1LbB8Y/rjUymYE82LNAcf
 y4LXN6DxHr5aw==
Message-ID: <fa757894-f501-4114-ba7c-e46c59904300@collabora.com>
Date: Fri, 11 Aug 2023 17:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] drm/panthor: Allow driver compilation
To: Robin Murphy <robin.murphy@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-14-boris.brezillon@collabora.com>
 <abed970e-db59-9eef-c4b6-dee49718f582@arm.com>
Content-Language: en-US
From: Daniel Stone <daniels@collabora.com>
In-Reply-To: <abed970e-db59-9eef-c4b6-dee49718f582@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/08/2023 17:35, Robin Murphy wrote:
> On 2023-08-09 17:53, Boris Brezillon wrote:
>> +obj-$(CONFIG_DRM_PANTHOR) += panthor.o
>
> FWIW I still think it would be nice to have a minor 
> directory/Kconfig/Makefile reshuffle and a trivial bit of extra 
> registration glue to build both drivers into a single module. It seems 
> like it could be a perpetual source of confusion to end users where 
> Mesa "panfrost" is the right option but kernel "panfrost" is the wrong 
> one. Especially when pretty much every other GPU driver is also just 
> one big top-level module to load for many different generations of 
> hardware. Plus it would mean that if someone did want to have a go at 
> deduplicating the resource-wrangling boilerplate for OPPs etc. in 
> future, there's more chance of being able to do so meaningfully.

It might be nice to point it out, but to be fair Intel and AMD both have 
two (or more) drivers, as does Broadcom/RPi. As does, err ... Mali.

I can see the point, but otoh if someone's managed to build all the 
right regulator/clock/etc modules to get a working system, they'll 
probably manage to figure teh GPU side out?

Cheers,

Daniel

