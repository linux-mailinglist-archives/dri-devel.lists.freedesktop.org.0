Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9EC9F6BD7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 18:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3D310EC2A;
	Wed, 18 Dec 2024 17:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HMLl7Dcu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B083310EC2A;
 Wed, 18 Dec 2024 17:04:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aabfb33aff8so128609266b.0; 
 Wed, 18 Dec 2024 09:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734541497; x=1735146297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O9h31TDmJEfXzLmI8JagrSx6Gp6jjuEe99oznl0Cmdc=;
 b=HMLl7DcuHGl1J4ftuwVtOqd4rqCAOBA3xPbQqG3RDT8lcd8aYOOceD8VT2ZgF+gka2
 H44Y9nfF1FCo8im/Tf+ZE2jydneemAqNFDBPpALTjPygrieteoEdUSB0jw0Eug6I0DXM
 XK16ti/gw/yKPPgGepvUALeYjDSi9mgf5sDFP6425NHgORf8+sYX8ANOEl66c3e53Ffc
 OqTOdWJpSnxMvj6+jFAqeB+iZdViBsbiBRBjnuDdaEt8CYt8f6VFPKj5wqeFddKuahn/
 j6+R2WaGp/fO8lE6S4+DwVoo9QF0vEjSYY2p9HBxARWJmrGDbFoYVYLK4NzrX65qgHM/
 OK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734541497; x=1735146297;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O9h31TDmJEfXzLmI8JagrSx6Gp6jjuEe99oznl0Cmdc=;
 b=S1E988FEb/PaPpnMqoWzG0lJ2V07TDgG00R9I6Rgyz50PZCSzkWAOlJxvamHVpj3eg
 mFkoCXaf22GkIoJQxkWU84s3sOfFQ9BAHk0xNpm6+Y91dZBaL+CVyWTOo1Wx7seAzgf5
 vCRsZPWEiN523NiAUxcgoB3LQ2ZwnegNfbmjj0Gqj2Av6CZQ1uMBfoxFpZI/YlQbpRfF
 M3ZXyEO/2gqx3zplbO/Z21oS+zHe1DrzUpY9E6v+1lMBYKCIcqxLUrnOCPr08HxM2RAg
 6Ecy1eBj87mYJxRXZnXzfl9NkZpGNcULMy3yim3/I20LzJszizd3yAOIAUC8UEGk+Ikn
 cb6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdwamJHV0PAP6+3lRhp63b8bweGOsi5b0YKrVTQmCsnpOFqpr1y3JxYGmBy9LXfvPztNskOzAt@lists.freedesktop.org,
 AJvYcCWuwq3vXiXHcPXEvo3TIeiXsOk6ctBTEXZMsSMWfDhu9ZwKgI1HImbk23Di+ItMyyMiNPJkTVrPCmZM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYr0WLu5tRvCSj9sjtsfIKN9BoDu1T1/Zp3SrQC9V8JXCx5aAj
 Pu5GUdz3uJ7/d3vrWdl+H4m9WLcbvd0p5+Ov/PYc79y6HpVET/PL
X-Gm-Gg: ASbGncuMDXynsJy1T0/WC6Ev+WoMtjtJlTcR2lVApKM9QokUdA+56F7fPivvNgSepo+
 Sfr12P3EVhg2yI6/GvKRY3s6M6IlphP1CILTuRjmpAcSVuit0F4CWi2oGMJT8a6cTv/MipmWy0/
 qkj66Z98p6YyAe526Ud+YO1OVDidqC2cpcEfpP0CDLNVFVvYK5TPsxGXZ0/uvwcvRAItiGp+GR1
 MNEbvh7J29ta6BVg04uVkhUq5GIxWchHl4he1ph38xHfqw9ggafD5DYX/6fbNsg/+9D0Ijpj8Kr
 iRXMtQ==
X-Google-Smtp-Source: AGHT+IHvMJdo2YuwAJK4IzVo/6bAOk5K0/SxZO/UXu9/V6Y93MfRo8ti3kWFfUdw7eoMODvnJCfqHQ==
X-Received: by 2002:a17:907:7716:b0:aab:ef03:6d46 with SMTP id
 a640c23a62f3a-aac08112b74mr5226866b.4.1734541496716; 
 Wed, 18 Dec 2024 09:04:56 -0800 (PST)
Received: from [192.168.178.20] (dh207-43-57.xnet.hr. [88.207.43.57])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab963913edsm575357366b.168.2024.12.18.09.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 09:04:56 -0800 (PST)
Message-ID: <35055563-5280-4f57-ad9c-27f47d94f54a@gmail.com>
Date: Wed, 18 Dec 2024 18:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] btrfs: replace kmalloc() and memcpy() with
 kmemdup()
To: Mark Harmstone <maharmstone@meta.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chris Mason <clm@meta.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
 <20241217225811.2437150-6-mtodorovac69@gmail.com>
 <2b4d265c-0efe-43b4-890e-dbab59d9d7b0@meta.com>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <2b4d265c-0efe-43b4-890e-dbab59d9d7b0@meta.com>
Content-Type: text/plain; charset=UTF-8
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

Hi,

Yes, I see you have the prior work and I have duplicated your work.

Apology for the inconvenience.

Best regards,
Mirsad Todorovac

On 12/18/24 11:32, Mark Harmstone wrote:
> There's a fix for this already in the for-next branch:
> https://github.com/btrfs/linux/commit/1a287050962c6847fa4918d6b2a0f4cee35c6943
> 
> On 17/12/24 22:58, Mirsad Todorovac wrote:
>>>
>> The static analyser tool gave the following advice:
>>
>> ./fs/btrfs/ioctl.c:4987:9-16: WARNING opportunity for kmemdup
>>
>>     4986                 if (!iov) {
>>   → 4987                         iov = kmalloc(sizeof(struct iovec) * args.iovcnt, GFP_NOFS);
>>     4988                         if (!iov) {
>>     4989                                 unlock_extent(io_tree, start, lockend, &cached_state);
>>     4990                                 btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
>>     4991                                 ret = -ENOMEM;
>>     4992                                 goto out_acct;
>>     4993                         }
>>     4994
>>   → 4995                         memcpy(iov, iovstack, sizeof(struct iovec) * args.iovcnt);
>>     4996                 }
>>
>> Replacing kmalloc() + memcpy() with kmemdump() doesn't change semantics.
>> Original code works without fault, so this is not a bug fix but proposed improvement.
>>
>> Link: https://urldefense.com/v3/__https://lwn.net/Articles/198928/__;!!Bt8RZUm9aw!4OVzQmIUbyH-UGdUwMAL582hR4Q-7HN2fn9IpyxeA1T8qrcC8RdBVz4xuL4m35_kksUllAi6OmdbRehcFpwfHw$
>> Fixes: 34310c442e175 ("btrfs: add io_uring command for encoded reads (ENCODED_READ ioctl)")
>> Cc: Chris Mason <clm@fb.com>
>> Cc: Josef Bacik <josef@toxicpanda.com>
>> Cc: David Sterba <dsterba@suse.com>
>> Cc: linux-btrfs@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
>> ---
>>   v1:
>> 	initial version.
>>
>>   fs/btrfs/ioctl.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
>> index 3af8bb0c8d75..c2f769334d3c 100644
>> --- a/fs/btrfs/ioctl.c
>> +++ b/fs/btrfs/ioctl.c
>> @@ -4984,15 +4984,13 @@ static int btrfs_uring_encoded_read(struct io_uring_cmd *cmd, unsigned int issue
>>   		 * undo this.
>>   		 */
>>   		if (!iov) {
>> -			iov = kmalloc(sizeof(struct iovec) * args.iovcnt, GFP_NOFS);
>> +			iov = kmemdup(iovstack, sizeof(struct iovec) * args.iovcnt, GFP_NOFS);
>>   			if (!iov) {
>>   				unlock_extent(io_tree, start, lockend, &cached_state);
>>   				btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
>>   				ret = -ENOMEM;
>>   				goto out_acct;
>>   			}
>> -
>> -			memcpy(iov, iovstack, sizeof(struct iovec) * args.iovcnt);
>>   		}
>>   
>>   		count = min_t(u64, iov_iter_count(&iter), disk_io_size);
> 

