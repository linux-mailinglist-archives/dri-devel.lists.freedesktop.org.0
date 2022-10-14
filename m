Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF6C5FF1CD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 17:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5943910E9DC;
	Fri, 14 Oct 2022 15:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B4410E9DC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 15:55:10 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0E2B08456E;
 Fri, 14 Oct 2022 17:55:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665762908;
 bh=GEygdaddZpsNERyRA6lIWFWbABSuMh/AdnYnKuGZefM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=KwhE/b4nOt+iSWfBb/PEW2sQsQXo/A/l9ljHa/qyHG+bBMV5E9cCDBh7qQ8NP6qnH
 qOEwsGmjVPFOKq2o4zKAmY4rQbDsAYiR7tAeUyZzYFaD5KecSjdZ3DzQepct+7kHcc
 ouGsOJX59D86b8/XPIFyR9zUdB4UrRkcZgBpCpwEMzcJ85wvBYy5aRv1FUiiHru9Np
 C2EvGjpSx25ZHiQgQzikHVpYMDS+MpTb8V5AU6H9v6Dovj5kqY9Z2HXKDky0rKkiiP
 3qB5E6gVcKjAvrfY2otQIwnoLRhN3xVmUZbDDj//KSwEnRVvAI02+PsmqzuBWPcfOQ
 Z+Pd0tARRimGg==
Message-ID: <e7593ac2-fa0a-18ff-d286-2f4080bd5b86@denx.de>
Date: Fri, 14 Oct 2022 17:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] drm/stm: Fix resolution bitmasks
Content-Language: en-US
To: Yannick FERTRE <yannick.fertre@foss.st.com>,
 dri-devel@lists.freedesktop.org
References: <20221011231048.505967-1-marex@denx.de>
 <93a77911-e9b2-d2e1-4fff-41f63c87376b@foss.st.com>
 <3ce425c7-978f-64e7-0630-b9aa5d1af55c@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3ce425c7-978f-64e7-0630-b9aa5d1af55c@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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

On 10/14/22 15:42, Yannick FERTRE wrote:
> Hi Marek,

Hello Yannick,

> The genmask of regsiter SSCR, BPCR & others were setted accordly to the 
> chipset stm32f4.

So that means:
F4 -> 2048x2048 framebuffer
H7/MP1 -> 4096x4096 framebuffer
?

We should then also update STM_MAX_FB_WIDTH/STM_MAX_FB_HEIGHT per SoC type ?

> You can see more details on page 493 of reference manual RM0090:
> 
> https://www.st.com/resource/en/reference_manual/DM00031020-.pdf
> 
> With future hardware, all of these registers will aligned on 16bits.
> 
> I would like to know if you use a display which resolution exceed 2048.

Not at all, 480x640 .

The display is just flaky and I'm trying to figure out what's wrong with 
it, so I'm checking all over the place and noticed this discrepancy.
