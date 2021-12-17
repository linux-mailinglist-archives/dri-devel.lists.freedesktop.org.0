Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A33DE4785A2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 08:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A37510ECC3;
	Fri, 17 Dec 2021 07:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59EF10ECC3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 07:38:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id BB8611F46B4D
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639726717; bh=wWTzV69Nd7kiuFOBZFv++x3g4sTgnUDuale4jH7vLWI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eNtr1qQZHtLgwc2Oxslm9zg9EnJA46y2+Z5vA+7iKglwuY/pOMye9mJ04ZA3ehT9n
 vCBMBl9r+KRD38hacah5FudqUfSHAvi/wDlLXzFMniGii663knI/4NkSWUGJ4LbQ8v
 cJ0l7kixTdK8pfk4b8FSLBLIUWPO750SHyP6B9mPJWRwBLRsDWDo4h+WSXoUGue6uq
 CbRqgy8AmuONvSbZ18cuZzRpqhVqbOHZKyaYwZwJ0/TARwmVWWpUu23Q0rZmpmduWj
 MU8NFU0WbOpQ7ZqL2eWEOAmviJa9OTWEaWQjPXOK8zNdFDvsKsk9hDW7urILhVjZve
 pPn4buWikhxUg==
Subject: Re: [PATCH] drm/panfrost: Avoid user size passed to kvmalloc()
To: Alyssa Rosenzweig <alyssa@collabora.com>,
 Steven Price <steven.price@arm.com>
References: <20211216161603.983711-1-steven.price@arm.com>
 <Ybt8QWEAooP++R7a@maud>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <aa7be5e4-591f-b7df-12e3-1eff77e53741@collabora.com>
Date: Fri, 17 Dec 2021 08:38:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <Ybt8QWEAooP++R7a@maud>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/16/21 6:49 PM, Alyssa Rosenzweig wrote:
>> This provides an easy method for user
>> space to trigger the OOM killer (by temporarily allocating large amounts
>> of kernel memory)
> 
> panfrost user space has a lot of easy ways to trigger to the OOM killer
> unfortunately .... if this is something we want to fix there are a lot
> more patches coming :(

What are you thinking of, Alyssa?

My understanding is that the problem are kernel allocations that aren't 
accounted per userspace process. I would expect shmem-backed BOs to be 
taken into account by the OOM killer, so the offending process would be 
terminated without affecting the other processes in the system.

Cheers,

Tomeu
