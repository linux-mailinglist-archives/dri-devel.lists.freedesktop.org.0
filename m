Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AD9ACE4CD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 21:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368BE10E7C5;
	Wed,  4 Jun 2025 19:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nppct.ru header.i=@nppct.ru header.b="fF3nz9wg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B583810E7DE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 19:30:53 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id B2A1A1C2AAF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 22:30:48 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:content-language:references:to:subject:subject
 :user-agent:mime-version:date:date:message-id; s=dkim; t=
 1749065448; x=1749929449; bh=Gg4+j6kG5vpIL8UZkk4QRzLW0dUz+cf8IvG
 GK2ypGtE=; b=fF3nz9wg0GPoDxZEwvly4B9Y8BiiWaWmCPMzN3eTIKv/UwGDxRs
 sUGAjVl0Fl8oeI8Ug9DcHcVbq9FN9mrsEOOqoBORYb+dXflxlenK8XuYcWZzqHtp
 Y7pgpguizGqVI3HQ+GJ8wWNxEzQQgqu46JB9Ul28NOKRUymXVFF65ocw=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id J7859z8HKZ4g for <dri-devel@lists.freedesktop.org>;
 Wed,  4 Jun 2025 22:30:48 +0300 (MSK)
Received: from [192.168.1.67] (unknown [46.72.98.152])
 by mail.nppct.ru (Postfix) with ESMTPSA id 9DEAA1C0D75;
 Wed,  4 Jun 2025 22:30:43 +0300 (MSK)
Message-ID: <bee381b3-305b-46e5-ae59-d816c491fce5@nppct.ru>
Date: Wed, 4 Jun 2025 22:30:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix NULL dereference in gfx_v9_0_kcq() and
 kiq_init_queue()
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, Jiadong Zhu <Jiadong.Zhu@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org
References: <20250524055546.1001268-1-sdl@nppct.ru>
 <CADnq5_MyV_C-XJCQEiXKLQhhEGErq7SnvhqFE1AauQPJvt5aYw@mail.gmail.com>
Content-Language: ru
From: SDL <sdl@nppct.ru>
In-Reply-To: <CADnq5_MyV_C-XJCQEiXKLQhhEGErq7SnvhqFE1AauQPJvt5aYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


> On Sat, May 24, 2025 at 2:14 AM Alexey Nepomnyashih <sdl@nppct.ru> wrote:
>> A potential NULL pointer dereference may occur when accessing
>> tmp_mqd->cp_hqd_pq_control without verifying that tmp_mqd is non-NULL.
>> This may happen if mqd_backup[mqd_idx] is unexpectedly NULL.
>>
>> Although a NULL check for mqd_backup[mqd_idx] existed previously, it was
>> moved to a position after the dereference in a recent commit, which
>> renders it ineffective.
> I don't think it's possible for mqd_backup to be NULL at this point.
> We would have failed earlier in init if the mqd backup allocation
> failed.
>
> Alex
In scenarios such as GPU reset or power management resume, there is no 
strict
guarantee that amdgpu_gfx_mqd_sw_init() (via ->sw_init()) is invoked before
gfx_v9_0_kiq_init_queue(). As a result, mqd_backup[] may remain 
uninitialized,
and dereferencing it without a NULL check can lead to a crash.

Most other uses of mqd_backup[] in the driver explicitly check for NULL,
indicating that uninitialized entries are an expected condition and 
should be handled
accordingly.

Alexey
