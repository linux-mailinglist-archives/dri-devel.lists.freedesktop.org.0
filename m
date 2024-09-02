Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD194968BA9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 18:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E31E10E341;
	Mon,  2 Sep 2024 16:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="dk3v4ddq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C48E10E341
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1725293365; x=1725898165; i=markus.elfring@web.de;
 bh=KMmYQS/7ZWS7BkK51oztGFjFJOQWg3j7Kq7b8VXcAto=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dk3v4ddqLwtFIcOOuHQ9RPzCsrwU7qNiCLsHYMcNwi9QEjeYgrG49LD68BS9O2HI
 +NKTbtZUs/VRD4ba/8CahUeGTrommqwtsWJMKRW8Hy5dnrZi4Ps68Ihi0eLkzz3ev
 bZaWdMpSdhlD8OZ8em51VbDplUJXAkmrCnXs/4K4t0MTqkT3QZkLVX9kXSx74diQB
 SB+WzTFOdnD+ESe4DqA7EZ++q2DsR9Ai/FTnjWVg3b3WLlqtmrv9kSVCo9ksKzYbw
 fyfGZCewcPQA7mQIeLFY/CQAspXGd7k1Rew9hX5zChrd6Xw4Q1NuKi3yqQ10MRcqu
 KTqJa7P0DqZ87IKEmQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCXZh-1suBtO184J-00Gfls; Mon, 02
 Sep 2024 18:09:25 +0200
Message-ID: <8d30da7f-7a12-4052-b846-66fad0ccb392@web.de>
Date: Mon, 2 Sep 2024 18:09:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matt Coster <Matt.Coster@imgtec.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sarah Walker <sarah.walker@imgtec.com>
References: <ea4ec650-d858-42c2-ab59-e17824069ba9@imgtec.com>
Subject: Re: [PATCH -next v2] drm/imagination: Use memdup_user() helper
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ea4ec650-d858-42c2-ab59-e17824069ba9@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2IP641OvAqySSsQCSeno5LeZ0c8/U6wHIWmAl0Jl1s1cnFAkVuh
 s2Zf3eSI5p2YDKoFk+o6qoMkVH+ZeKPiMgeF8+aLwNQD1xE9kL41LH8GhvYTOsJoS3brU2e
 IJmAtthSCiVzjy5jy66xuQjdjAfs4sh+ojKU6CINmx6LRoJSz12VsZlW3xJwruK0vn0gaj4
 x0HFi2UfHi1rxxVwMse6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:quvIM9LSWoE=;zatZvy5PHOFpPDYXB4g0J1t/uib
 CMX60/faYt1H0s1MkAaYi+iAaR0EW5lRJSEJosfepws58A+lM1jwT+2k3Usz/LYhmVBqbTLB+
 3yXhNzxhsYTQ6QTs+KQlQgbTwHM8bHL+NlvwNnvIBMe3Fkg1RLbzsiFWv43I1JdF60fk0XilG
 lED+TYt9oAJNHWS67QNFzBQFFx5+1IE5pqyXSC6g5yFJnspOrxz9m0EtYUUfPqsDxMiybWetC
 gbAVgEJotb914mAZHojqR7bItOjqQW7tts8V83jO53MQH6gq4ACsRMmzMVyMIZTpaMKsIgl1h
 pIx5xj3b4iSbaTJqSqpFjYeh9ZjpAePIek8JYz5L1Bd2C+VZlkla5lklVuUxcFhNoNqL0u/LP
 B0TDpXgJGNTg2Ez8DzA0DHW1AmKE1/AHtWHJiASh04S3mzE4JOoqy6FKx8Nzz2Gd6/PGCNGnE
 5Vo2yy6NSeV7giMgOgY5kSSbxxYaPKCyxFU4wd1iVkKiJ4ilw2m4F+xzuFvETGwXCak+9f0E/
 ymcBbjcWDeV2jSQMzg8GR86P9upRyomTZf8InvBIVG0nwHd3M46ADM+U6rENWsnW8aqKEm3zN
 G4Dwaplfow8wNnmXWLtwuNwNmFPkaqtNO9w5LSHqcJi33INsJ3adj768NMHN/DKpe0HPW27uC
 NYsYD0vKlL7ID8enS25w0Ke/UZLBbHejYKrBz9+YmU3o8W+7g2BKAmL4qX9HQoKp36HX6Pt6B
 3TobWqCGcj7+zTmDg4NNrBVRiu+x94Z6dTr2dqnOs5uDJ+3Z5PBQdNr/+xSOqvGErtC1W+45y
 1caZHVQRfBNfLSWNQmS8mbpQ==
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

> > Switching to memdup_user(), which combines kmalloc() and copy_from_use=
r(),
> > and it can simplfy code.
>
> Applied, thanks!
>
> [1/1] drm/imagination: Use memdup_user() helper
>       commit: 2872a57c7ad427d428c6d12e95e55b32bdc8e3b8

Do you find any previous contributions still similarly interesting?

Example:
[PATCH] drm/imagination: Use memdup_user() rather than duplicating its imp=
lementation
https://lore.kernel.org/r/c07221ed-8eaf-490e-9672-033b1cfe7b6e@web.de
https://lkml.org/lkml/2024/1/28/438

Regards,
Markus
