Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE28A58EB2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 09:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D9A10E3B9;
	Mon, 10 Mar 2025 08:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gceoq4y4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5C310E3B9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 08:56:56 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2240ff0bd6eso7930075ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741597016; x=1742201816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQKIFIxFqZxWZ1lt/LkcFUZi6FOfsAzOvk94m3KE0RQ=;
 b=Gceoq4y4DJkwi/7/7J5sUTbpDTJpDu9B2zDm8Ri2Fm6x9pcxp7gpgQo5rIiLBxHVfu
 UIfAGIV3KfBkG8kVkr3utXYVHusc+F369otuoDkjnsfyaUezhpmPPldPd3aVd6aszpGs
 FQuJy503qNHio20SUOnhQmYi742i9amPTB+os9KiknX+4j2jRgoz0pLkYZVBob4JMaGB
 G+IpJzJFs1O6rfgPG5e3AzSOpQo5qozZzlsbJ39D429LW/ZxZ1sTJfIIl3SzOpqJ/RKr
 8XpfdyldBM2NYUnOL3a/R8KWoaHSTob/DRj5AatpSfLBu7g9NijrdBUOQoWl1GlTrSRm
 K3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741597016; x=1742201816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CQKIFIxFqZxWZ1lt/LkcFUZi6FOfsAzOvk94m3KE0RQ=;
 b=UIrTQOrBm+S/Qb5mRg86jcJQ6pZ/4RtRvCN3Eh+F+hZAoPugMokC1hbvt8IDJvumBT
 yopuS1Cn+Xig2bZLWdiEWZJH2AaKoQZjsSBzkndMPx3Z4+Z01okhXE+Jmo8HJ1Vh80au
 xSsLitQEl6d1Y/qhn6dWZVhq+DIs+g7Fg36OarNv4QZhBEGvkBUVrca5rSHoPKebACuU
 TLGzEtn1HUcIDz1Wc7wGPGeaQKUUENU4cfaX374WirzlviRXqZxTp95uvH3LdtN6eQIS
 y/ci+ZrgQv03wksv2Glgd+CiwLDeo8b2bHUZF+eQZWCoG6qMw7CLiFczUFjcYyG8oHTt
 9Z5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKUFMhrcxBqGQu2fqFWyQsN7pBxANRkzC3r8oljZ7FDueXoEtEJmc9t3I98D8gxv+LiwyRJU9dQlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA6uSr2dAmQzQKIayme8f4rVe2pzTU8RJczS+TXBR3eW2TQskw
 0QgiRgoODt6H2WsY2BdcNnDc2nwSWead80kkygz74J+BhZFCk4Xh
X-Gm-Gg: ASbGnctQ1hH6CLZEzMBiP3kPD21FM/KLcbfqHaIe5a4J4kAD4G61KVa+wXPWc+QXJUT
 ojUPbcLf6LFiiWOTL8lWcSCNqK8BZuJ8eVVj8WcQF+JglNQ4zEUT+QWKwpmMvG7P7FklHbeiWM/
 1eue89/W99rkEKx/aXZIEwI8tEnnDAaiVq9Q+fbo/fj/ipfDcPjVfoQ5Xrti2I3I1a6ekKCAjW0
 V7XFfEXPfrV4gEdjuKMFbzUZ+UzFSReYgLZpPhR3+NGoma6XMynPZ5BAG8vQam/ubY1/qMAD1b7
 7O1lIS5oNOjREEAOSgo752oP5GOEkWLfCeQXwGJZsrdO8huey6H37kxtH+YrBw==
X-Google-Smtp-Source: AGHT+IHOYlux707LNP93d+bS2pkNRs9Np76eJc3iG7AywtGvurj6ZI1INVjMT2KGGZ9W0oMAHn41GA==
X-Received: by 2002:a05:6a00:4fc7:b0:736:3222:c392 with SMTP id
 d2e1a72fcca58-736becb1adfmr5050059b3a.2.1741597016096; 
 Mon, 10 Mar 2025 01:56:56 -0700 (PDT)
Received: from localhost.localdomain ([182.148.13.253])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736b2da32c6sm5712350b3a.149.2025.03.10.01.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 01:56:55 -0700 (PDT)
From: Qianyi Liu <liuqianyi125@gmail.com>
To: phasta@mailbox.org
Cc: airlied@gmail.com, ckoenig.leichtzumerken@gmail.com, dakr@kernel.org,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liuqianyi125@gmail.com,
 maarten.lankhorst@linux.intel.com, matthew.brost@intel.com,
 mripard@kernel.org, phasta@kernel.org, stable@vger.kernel.org,
 tzimmermann@suse.de
Subject: [PATCH V3] drm/sched: Fix fence reference count leak
Date: Mon, 10 Mar 2025 16:56:48 +0800
Message-Id: <20250310085648.3800601-1-liuqianyi125@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <99a18daf596ca384d38e561675cf3e13a9ed3161.camel@mailbox.org>
References: <99a18daf596ca384d38e561675cf3e13a9ed3161.camel@mailbox.org>
MIME-Version: 1.0
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

>> The last_scheduled fence leaked when an entity was being killed and
>> adding its callback failed.
>>
>> Decrement the reference count of prev when dma_fence_add_callback()
>> fails, ensuring proper balance.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
>> Signed-off-by: qianyi liu <liuqianyi125@gmail.com>
>
>> From: qianyi liu <liuqianyi125@gmail.com>
>>
>> The last_scheduled fence leaked when an entity was being killed and
>> adding its callback failed.
>>
>> Decrement the reference count of prev when dma_fence_add_callback()
>> fails, ensuring proper balance.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and
>> fini")
>> Signed-off-by: qianyi liu <liuqianyi125@gmail.com>
>
> @Matt: since you in principle agreed with this patch, could you give it
> an official RB?
>
> I could then take it [but will probably rephrase some nits in the
> commit message]

Hello,

This patch was submitted a while back but hasn't seen any updates—just a kindly
ping.

Best regards.
QianYi.
