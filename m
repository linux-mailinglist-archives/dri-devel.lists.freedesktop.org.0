Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA5E9C572B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 13:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E18010E136;
	Tue, 12 Nov 2024 12:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SudYCVL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806C010E136
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 12:00:25 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d41894a32so3224794f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 04:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731412823; x=1732017623; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yXF5+Io1TyCymcK5X0/2nxmWKhdM4G43mylC4UIXsQU=;
 b=SudYCVL19zvIcQZ0UZleUE7YawHXUFrQLdYydzsUwNIkKzKBc+weDV+0Fb0vw2Bqp8
 sL1090AwJL4VNvVcIiSe97svcHkC1ZoVuQ+Hj/r7vM3gWerMdIMYKn+aKdbBrnHkSyhL
 tsBTnatGVNZDXjzwLzDRa75fGU5LC25Ic3WX0cgbBd2sNWXdJ5i5njDzRqk9jJvOwhID
 PCO4gC1vNNCsxYzk8fy/pBwz1tdtT03uskg/QknniG9Ea8/i64+FQInAu95AmX5eZQAb
 SXpTZbISbvcOkyUV3QHFTDgLmwBufWPjMDxCF7pTRhEtckAq7tfaI8J8h6PhJDKK/4YM
 h/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731412823; x=1732017623;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yXF5+Io1TyCymcK5X0/2nxmWKhdM4G43mylC4UIXsQU=;
 b=HVdpJ8OMhcJ/Xdah4wP7mH6tW88pkEhJcPTZg1JlsXP9pMleOd/QitafMHFC50HUgZ
 NyvY4cn8UEJU5bSHgAglvS9Me40j5OvughCI3gLONajwaS4C0EFnQqwaYyDmB0EU4tW/
 Mp5ApXYs3B4LbLMBJ/uuBFZukuVY5ppiPaAgd7S3edpgJTvdQm/KM5ZhMYsXpgnjvQ2b
 T4LzBOCp5M9ncMVihLlxUyoA1KTOBDc7Lvt2WjUfZF2Ps4YOcCR5Ve1rOCppiZwXiCB7
 3zB6QX1kRtqetvPWJsOZ7vdB7dEhX1SMof8AKVWeM2Wod9feQeRSxmEYtujenyKGgc34
 gSJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVVSsXxWsfqVol3CZMpOLwUV4Swiu/T45bfOJ1IBvM7sSzpsj+iWRe2uzh92pZWmT56ut9/UQnJEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFmsCIF5oabck01H5z5oRfOucFHqlUouKqFz1r8XDKkS8KziuQ
 /1Ob3Zfg9/IQ0wi0js3Nca1HOS+3hyT3ZGv9Ph0c3Lw0bBvekW9P
X-Google-Smtp-Source: AGHT+IG4WkrKXOxoqhnsAqTrl0ofgr3nW/5VdPEF0oaW8h9Cc85gwrlzPfVHivR5dR11PIF0ABnSpQ==
X-Received: by 2002:a5d:6484:0:b0:37d:47ef:17d0 with SMTP id
 ffacd0b85a97d-381f1a7e56cmr13709477f8f.13.1731412823160; 
 Tue, 12 Nov 2024 04:00:23 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9ea93esm15043141f8f.66.2024.11.12.04.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 04:00:22 -0800 (PST)
Message-ID: <55169975-0348-4017-9e47-0d17b6cd211f@gmail.com>
Date: Tue, 12 Nov 2024 13:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ensure progress for dma_fence_array
To: Chia-I Wu <olvaffe@gmail.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lionel.g.landwerlin@intel.com,
 dri-devel@lists.freedesktop.org, faith.ekstrand@collabora.com,
 simona@ffwll.ch
References: <20241108094256.3717-1-christian.koenig@amd.com>
 <CAPaKu7SK9X3eDb6EkyXjatFT4YqZUhR949ANuYmOPVnajBU1kQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAPaKu7SK9X3eDb6EkyXjatFT4YqZUhR949ANuYmOPVnajBU1kQ@mail.gmail.com>
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

Am 09.11.24 um 01:32 schrieb Chia-I Wu:
> On Fri, Nov 8, 2024 at 1:43 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Hi guys,
>>
>> as pointed out by Chia-I userspace doesn't see any progress when
>> signaling is not enabled and Boris noted that this is because
>> dma_fence_array_signaled() never returns true in this case.
>>
>> Improve this by fixing the dma_fence_array_signaled() implementation to
>> also return true even if signaling was never explicitely enabled.
> Yeah, this fixes the timeout I was seeing on panvk.

Any objections to add your Tested-by?

>
>> We should probably adjust the documentation as well that when the
>> callback is implemented it should make progess visible even without
>> enabling signaling.
> That would be really nice.  Both dma_fence_is_signaled and
> dma_fence_ops::signaled explicitly state otherwise at the moment.

I have put that on my TODO list, but could take a while until I have 
time for it.

If anybody wants to make suggestions on the wording feel free to make a 
patch.

Thanks,
Christian.

>
>
>
>> Please test and review,
>> Christian.
>>
>>

