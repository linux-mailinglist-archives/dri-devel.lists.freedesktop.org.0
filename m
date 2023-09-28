Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A9A7B1EA2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 15:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C2810E663;
	Thu, 28 Sep 2023 13:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C122510E65F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 13:37:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RxF0G0h5Tz9spq;
 Thu, 28 Sep 2023 15:37:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1695908254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1BMLvfin+hhelcAUDECynT792cOg0Q+TnEeHNrzaKpA=;
 b=a+kCmGt9d8lqyWNozmKE/TerV7fdOdr1zs7UGdoRoLjHPkNK55k5Bu0jiCp36ZQhlhKFbO
 VC9zkjk1jy1Y2Kdllfjv9yqF5LmIIe9sskXOwNE7yJzuVePQX6HnGo3nu/PgT+uFXMf6zg
 NrL0ydTAtstjK6otQ6KQ9ymbw4qtrymtuA/PYJYLcDzPIHwfLfsc8zwFLLhklVPfI92JCL
 46bW673H7A19Hwo30Nhw37UUiJFPQNDD9gzUhvntyKvFC0AwHb/ql53yQD+A5AcTZ3Z3Q9
 F4KAf12iW7slkz6LHxn+35+ElRqV8Auq/wOcpbg4YW4s6XHe/AB1WWn1Wyzkwg==
Message-ID: <806ab015-215d-4b45-1702-429e39d6edc5@mailbox.org>
Date: Thu, 28 Sep 2023 15:37:31 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: de-CH-frami, en-CA
To: Ray Strode <halfline@gmail.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
 <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
 <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
 <dbed4fe6-e99b-a31e-5715-7bd594fc22fb@mailbox.org>
 <CAA_UwzLpRsNHK7yFWP3tzLFgeZMMpq_AiWBEHW5Om6hfBxyYbA@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAA_UwzLpRsNHK7yFWP3tzLFgeZMMpq_AiWBEHW5Om6hfBxyYbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 426748dd95549b92ff1
X-MBO-RS-META: nxw785e6weeugp3z8cn3e6b16nutderd
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@redhat.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/23 14:59, Ray Strode wrote:
> On Thu, Sep 28, 2023 at 5:43 AM Michel Dänzer
> <michel.daenzer@mailbox.org> wrote:
>>>>> When it's really not desirable to account the CPU overhead to the
>>>>> process initiating it then you probably rather want to use an non
>>>>> blocking commit plus a dma_fence to wait for the work to end from userspace.
>>>> Well, first I don't think that's very convenient. You're talking about
>>>> a per-plane property, so there would need to be a separate file
>>>> descriptor allocated for every plane, right? and user-space would have
>>>> to block on all of them before proceeding?
>>
>> OUT_FENCE_PTR is a per-CRTC property, not per-plane.
> 
> Okay, sure.
> 
>> Also, at least in this particular case, a single sync file (not dma_fence) for any CRTC might suffice.
> 
> I don't see how we could rely on that given the provided api and
> multitude of drivers. It might work and then break randomly.

If it's supposed to work from the KMS API PoV, any bugs to the contrary should be fixed.

I'm not really seeing the big difference between using a single fence or multiple, anyway.


I do wonder if there might be a time window where the out fences have signalled, but the atomic commit ioctl will still fail with EBUSY. If there is though, I'd expect it to affect the flip completion events as well.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

