Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F8E7457E7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 11:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0642E10E1DD;
	Mon,  3 Jul 2023 09:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E8710E1DD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 09:02:57 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7347886195;
 Mon,  3 Jul 2023 11:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688374974;
 bh=qDM0JbzYxau2kn161vFWXoKxmRtuATehwG4m3sFO1Bg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JHLgWO6ChXh2Apu/5WftTp8dB1fMW+BNkuggDIXQAEqSapGZhAwU1EVe1+OF6KI8P
 +jlNCb7tmrlWHINg0hU1/XVrUhOKW1mDUM2vlZmTHqVN9eFJdvVgXMrd85N3U9AZWx
 /s6y6DFbV4ghjAzoPo7Ct+cdr/DXQSIMwIx06hOeVfZ5FwjM1q2kRohmLSzNRoOYJQ
 gkJI9oAAYHK4yW/HYGqgnBjXa8YHQZWP2qwS1qSBzJ4I2Inhmtqm1RtdzTXUx4SaaD
 FpVUVK+wLBopku8JcFcIqOkKwejdwchAlQxRPQmOa1Sy72/3nto/kDBakHrZHKPzJR
 tteCITk8LLcfA==
Message-ID: <eaf0c55d-b6d6-ac09-a532-cdb5c5e65f08@denx.de>
Date: Mon, 3 Jul 2023 10:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Drain command transfer FIFO
 before transfer
To: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org
References: <20230615201511.565923-1-marex@denx.de>
 <27b5e807-72e2-4709-de4b-90e025516fd5@linaro.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <27b5e807-72e2-4709-de4b-90e025516fd5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/3/23 09:27, Neil Armstrong wrote:
> On 15/06/2023 22:15, Marek Vasut wrote:
>> Wait until the command transfer FIFO is empty before loading in the next
>> command. The previous behavior where the code waited until command 
>> transfer
>> FIFO was not full suffered from transfer corruption, where the last 
>> command
>> in the FIFO could be overwritten in case the FIFO indicates not full, but
>> also does not have enough space to store another transfer yet.
>>
> 
> I think you should add a Fixes tag since it solves a bug.

I'm afraid that is no longer possible, I already applied it to 
drm-misc-next. I'll make a note to ping Greg when it hits Linus tree.
