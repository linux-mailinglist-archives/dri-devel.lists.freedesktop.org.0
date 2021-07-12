Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD953C6202
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 19:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF6F89D60;
	Mon, 12 Jul 2021 17:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0289D60
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 17:32:42 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:e464:19d5:3655:dde7] (unknown
 [IPv6:2a02:810a:880:f54:e464:19d5:3655:dde7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 36EE51F41E3C;
 Mon, 12 Jul 2021 18:32:40 +0100 (BST)
Subject: Re: Aw: Re: [PATCH] soc: mediatek: mmsys: fix HDMI output on
 mt7623/bananapi-r2
To: Frank Wunderlich <frank-w@public-files.de>
References: <20210710132431.265985-1-linux@fw-web.de>
 <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
 <trinity-02bc17fc-b458-4d17-baca-8afe30e4c92c-1626110171249@3c-app-gmx-bs28>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <dbe23d2a-cd29-0782-1b7d-bcb5c6683607@collabora.com>
Date: Mon, 12 Jul 2021 19:32:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-02bc17fc-b458-4d17-baca-8afe30e4c92c-1626110171249@3c-app-gmx-bs28>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12.07.21 19:16, Frank Wunderlich wrote:
> Hi,
> 
> it turns out that problem is the read+or of the new value
> 
> i reverted my patch and changed
> 
> reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
> writel_relaxed(reg, mmsys->regs + routes[i].addr);
> 
> to
> 
> writel_relaxed(routes[i].val, mmsys->regs + routes[i].addr);
> 
> and it works too, but maybe it breaks other platforms

Interesting, I can test if it fix that similar bug on mt8173 when resume from suspend.

Thanks,
Dafna

> 
> regards Frank
> 
