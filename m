Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A77C3ECF71
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 09:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2A389935;
	Mon, 16 Aug 2021 07:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFBB892AE;
 Mon, 16 Aug 2021 07:33:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x12so22112349wrr.11;
 Mon, 16 Aug 2021 00:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XamX6v+EalXddhvYZkaQV9/qUDz3UjOhi9dIB7KzCSs=;
 b=PkEOUtH5InhTNH9ehMjQl20qf1T04HXrhUa/Yzm/fNVILgWgtRxcNLDYLgH/Ruv37D
 Axuonw4Rz5/fa/wJebnZGSCd+IOMGLtSdT6xFxGOuzN3idHI4ET+X5YQcENpJtDp3mgX
 YPzE5vrKoVq+uubotMIDm62W8KHIpjwrpg1MMc30DqsxGbQKXB2Ns6MpzUD5ZYwDRJ7B
 IC/NC5idN9cZtyD6Cthbbi7SW59wEWH8n1Pe/C3nOClpWeUmqm+fB5RPRxGgUMgrGbil
 Bj4QvAn0LzFBWJjwYfutKh76jR0gQ9GbL4Y25V1anX/Jo3P3M06w98PVHf3NLxeS/Mzy
 iKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XamX6v+EalXddhvYZkaQV9/qUDz3UjOhi9dIB7KzCSs=;
 b=pM7bbLF6SFq7AG0KrnsxBluZeBDfDEW6uDLOYMkcKgMKgMLl/kBQ2NeOD2H6IKNtOf
 3ZRosBwZLrfkHc8C692g7BJ+5yThZDLJChwIcfqq/Rt+gZze6S4rweuGWiS3fmmmVUnE
 v87VSaodkViIjWS/NXnU1HeDztBtR6SIGuK9mMcLT4oqzwQiFLUks950vLgYDgZ5ly0v
 NS12lYLSUV9AFsSwNIr9JXayfC1e7Su2a3zXE8YsXG2ljNP7oEjpUsDiCWVOOdR3ZYx4
 n5t+rbuszhutE3tQ1C7AHBViCPETX7OYtJUPYuSExvihEYdkvukvenmlg7qYif9wbDFD
 rBEQ==
X-Gm-Message-State: AOAM532vuXEj7nAXJxSds/CFlshTQWxbdO6JghbiUD+/isS2zcUAu0qE
 RJSNN+8euGiZiU9K1H9Or7hiaDqIbHA=
X-Google-Smtp-Source: ABdhPJxFvkDLLsJoPrP+lhjy9E96awhLx9z9IHlJvOTDprFo03cIYj0MGRo0PgRMs1ljywcnFlCVPA==
X-Received: by 2002:a5d:6d0f:: with SMTP id e15mr16732874wrq.373.1629099183216; 
 Mon, 16 Aug 2021 00:33:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7d83:fd8:eb16:8605?
 ([2a02:908:1252:fb60:7d83:fd8:eb16:8605])
 by smtp.gmail.com with ESMTPSA id l2sm9572019wme.28.2021.08.16.00.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 00:33:02 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210811165211.6811-2-michel@daenzer.net>
 <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>
 <DM6PR12MB26196DF7D33462060FC4F607E4F99@DM6PR12MB2619.namprd12.prod.outlook.com>
 <MN2PR12MB3775E6C1ECA915283108E6D783F99@MN2PR12MB3775.namprd12.prod.outlook.com>
 <aebae00c-4b7b-552f-accb-e51d151ecb43@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <13639c8e-d9b7-6eee-f5a3-8460d1fba7da@gmail.com>
Date: Mon, 16 Aug 2021 09:33:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <aebae00c-4b7b-552f-accb-e51d151ecb43@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 12.08.21 um 10:11 schrieb Michel Dänzer:
> On 2021-08-12 7:55 a.m., Koenig, Christian wrote:
>> Hi James,
>>
>> Evan seems to have understood how this all works together.
>>
>> See while any begin/end use critical section is active the work should not be active.
>>
>> When you handle only one ring you can just call cancel in begin use and schedule in end use. But when you have more than one ring you need a lock or counter to prevent concurrent work items to be started.
>>
>> Michelle's idea to use mod_delayed_work is a bad one because it assumes that the delayed work is still running.
> It merely assumes that the work may already have been scheduled before.
>
> Admittedly, I missed the cancel_delayed_work_sync calls for patch 2. While I think it can still have some effect when there's a single work item for multiple rings, as described by James, it's probably negligible, since presumably the time intervals between ring_begin_use and ring_end_use are normally much shorter than a second.
>
> So, while patch 2 is at worst a no-op (since mod_delayed_work is the same as schedule_delayed_work if the work hasn't been scheduled yet), I'm fine with dropping it.

Yeah, I think that would be much better.

>> Something similar applies to the first patch I think,
> There are no cancel work calls in that case, so the commit log is accurate TTBOMK.
>
> I noticed this because current mutter Git main wasn't able to sustain 60 fps on Navi 14 with a simple glxgears -fullscreen. mutter was dropping frames because its CPU work for a frame update occasionally took up to 3 ms, instead of the normal 2-300 microseconds. sysprof showed a lot of cycles spent in the functions which enable/disable GFXOFF in the HW.
>
>
>> so when this makes a difference it is actually a bug.
> There was certainly a bug though, which patch 1 fixes. :)

Agreed, just wanted to note that this is most likely not the right 
solution since Alex was already picking it up.

Going to reply separately on the new patch as well.

Regards,
Christian.
