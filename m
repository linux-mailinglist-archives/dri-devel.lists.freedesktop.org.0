Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC38A58FEC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ABF10E3D5;
	Mon, 10 Mar 2025 09:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MrnyraWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E22110E3D5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:42:25 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2240b4de10eso8402945ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 02:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741599745; x=1742204545; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7VWz2km1p8A5Qrb528dwkKrCW4fkTzMxBmqo/9LnHk4=;
 b=MrnyraWt4UhS5DSx8OVd4tKM/QMGHtyu8hw/yynNHeFVm4KS4jQ1WlyZfy+XKOrc6d
 VB+svOsr4d2J7sNNSy4h20PPHXllpOC2hdl6jpgWCcR7jN1w/eFR0cQ1NonCVShmEp8Q
 AO9qhrYS8aNJXSyqjAf5ZRbU50EjWq3Y6jeftxf89oYmYVLqgA8qTkFaBeMxWg/8On58
 2k9jLM7zdSwdTt7N9w9ZWrW6n4US/8+DGkKys905tI8/c4g93wYofQST54f0XwpdZdmJ
 WNV2SQo9OvDHqL5R+y6Y09/mp2U2YgJOO4kkNyGoxwHU4yRmdhf910tH9b2dqVp9Mdnr
 QJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741599745; x=1742204545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7VWz2km1p8A5Qrb528dwkKrCW4fkTzMxBmqo/9LnHk4=;
 b=nbE3GtUF4lkopbO4VqKO0MsImpo+sOBJTj+A3I8X7K0zLkNvTh8YX4XxwqvI6+P5PJ
 kPMHj6nCmegM9fOOL72/O50bbJHTNLFq1hpcQ9/4yEtuEvDjM6KADZrWfssPRSrcFjhA
 zsWPNV7gGuK5Bdgo0SB6PFEioZ5iD+SsTRFdn9z3ztsqFinhTMG9s58jp/r5zHQvesSK
 9v/o3rlO4ZNa1NPwUy7wlo+vB01nyeqVhkYSpUkE6I1o2mTFRbgM0Tvc67OI64XT/Cks
 d73Woyqxpw6MOJ8d6SAKxCuMSrKzE/YXwlWUUkyk5nuAHnzQ2rsfDK7a97kKdS1gwpLg
 1DDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzAdGITJdRYjRVoOKxqYbdyivpMTtzQ1OCBUQW7qBxrOu+98d0UCUJRCa/Y7xUa9Mz6pZ4P3TlL1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwBAMqcN630iyv7LbT7dRyG52akDEZ7rhu5yEw7iYBRLkQGIFv
 x/IfnVRzpedj+Nc/lO1h6lrOp+G643n2xkJFFpHhOEEqsuuhX8k3
X-Gm-Gg: ASbGncsbmSdgBAtkX7aA0jUAuyc2icfk5a9fghrhOg5M1Hv11dJ/z+Qrj4ovpEwjSX1
 OaIJG1s83RIQggvvdtbVoTHbFL7wKwEb3uP8HAy4mrYrQ6J4ijOm4/0NjGQncnV5TgVfcfS/Os5
 HflnDiyjPMihGCTTBoB6tIJzqSiBhsQhtC6kLlElImhTJqxazKmeT00TmoY1qD5OOZLm5LbxLI6
 p42hduoZfaPmvog+0ky8TLPUpG3kjz3gaR4+nG2v4JwL0aYgajzgJL2Fjxe+Ad8dM061Gmbkxd6
 GaQYUDur4dL+pM+fz58AfafO+qtvdVcmDle4RqOW4n8ULhlWBeAWHTNNllQ7NA==
X-Google-Smtp-Source: AGHT+IFo0zr5IznfFqV/6Ax1xUdw01T8Ui1VTflInlSacqsAlrf5cMCvN4QODRufJlVGOpwF2k+jhA==
X-Received: by 2002:a17:903:2302:b0:224:1212:7da1 with SMTP id
 d9443c01a7336-225422a8e8emr49856275ad.13.1741599744843; 
 Mon, 10 Mar 2025 02:42:24 -0700 (PDT)
Received: from localhost.localdomain ([182.148.13.253])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410a91971sm73285915ad.165.2025.03.10.02.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 02:42:23 -0700 (PDT)
From: Qianyi Liu <liuqianyi125@gmail.com>
To: phasta@mailbox.org
Cc: airlied@gmail.com, ckoenig.leichtzumerken@gmail.com, dakr@kernel.org,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liuqianyi125@gmail.com,
 maarten.lankhorst@linux.intel.com, matthew.brost@intel.com,
 mripard@kernel.org, phasta@kernel.org, stable@vger.kernel.org,
 tzimmermann@suse.de
Subject: [PATCH V3] drm/sched: Fix fence reference count leak
Date: Mon, 10 Mar 2025 17:42:16 +0800
Message-Id: <20250310094216.3821893-1-liuqianyi125@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a5f389b1c08847fb658f4120b205521e4a8ea0c1.camel@mailbox.org>
References: <a5f389b1c08847fb658f4120b205521e4a8ea0c1.camel@mailbox.org>
MIME-Version: 1.0
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

> Sorry for the delay
>
> On Wed, 2025-02-26 at 17:05 +0800, Qianyi Liu wrote:
>> From: qianyi liu <liuqianyi125@gmail.com>
>>
>> The last_scheduled fence leaked when an entity was being killed and
>> adding its callback failed.
>
> s/leaked/leaks
>
> s/was being/is being
>
> s/its callback/the cleanup callback
>
> s/failed/fails

>>
>> Decrement the reference count of prev when dma_fence_add_callback()
>> fails, ensuring proper balance.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and
>> fini")
>> Signed-off-by: qianyi liu <liuqianyi125@gmail.com>
>> ---
>> v2 -> v3: Rework commit message (Markus)
>> v1 -> v2: Added 'Fixes:' tag and clarified commit message (Philipp
>> and Matthew)
>> ---
>>  drivers/gpu/drm/scheduler/sched_entity.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 69bcf0e99d57..1c0c14bcf726 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -259,9 +259,12 @@ static void drm_sched_entity_kill(struct
>> drm_sched_entity *entity)
>>  		struct drm_sched_fence *s_fence = job->s_fence;
>>
>>  		dma_fence_get(&s_fence->finished);
>> -		if (!prev || dma_fence_add_callback(prev, &job-
>> >finish_cb,
>> -
>> drm_sched_entity_kill_jobs_cb))
>> +		if (!prev ||
>> +		    dma_fence_add_callback(prev, &job->finish_cb,
>> +
>> drm_sched_entity_kill_jobs_cb)) {
>> +			dma_fence_put(prev);
>
> Please add a little comment about the dma_fence_put()'s purpose. Sth
> like "Adding callback above failed. dma_fence_put() checks for NULL."
>
> Then we should be good I think
>
> Thx

OK, thank you for your detailed feedback.

Best regards.
QianYi.
