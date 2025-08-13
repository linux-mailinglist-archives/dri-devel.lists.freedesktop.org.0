Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB14B24977
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 14:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2C710E703;
	Wed, 13 Aug 2025 12:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ItPeKBE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BB510E4F5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 12:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1755087802; x=1755692602; i=markus.elfring@web.de;
 bh=fFCdGCqwYIBKBI9DweXmHAL7W7na2k0tYFkPZX6daGU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ItPeKBE2FudtGr0WkPpe/9oc3U1SFRB9vrXin1evCyI59xsnM8iKc/ZJahu0J0YT
 AftFCd5ugqxcyVqeaXRCXLzf606Pe0pehURKEoKKbT1u+zVYXe2aVN5w4P1tivRgv
 t5iWwjXc422eY8LUqMLnCWMrnNBfyZKryGD/y5qKH8E/hfJ966kGjVmE9o8l306vi
 XRRqMqgAqX05w2RGcnbBPQXJTdAmU0+y2o5ygZvbYLv9M2KH4o35y/tHN1FiJ07Cd
 n+eR2DkkOcxP/4VgkYUIDMIwAYdVlp1Z7+LvUYLLpOjUyLxqcq/qtek5trM9fb5da
 s/1j7QWLkORWAEboqw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.246]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdfCH-1uD6fw3grR-00g95N; Wed, 13
 Aug 2025 14:23:21 +0200
Message-ID: <75e25786-600b-49e3-bc03-6b62d1d23ef4@web.de>
Date: Wed, 13 Aug 2025 14:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qianfeng Rong <rongqianfeng@vivo.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>
References: <20250811091910.404659-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250811091910.404659-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:vED6NZO1Em0A0dUJgJZsiujF3/bIxGPgJ4pmYr47rwYfB10yGSW
 01//eUgphrnK4sQC56fbargPkcAeWAP3YlaqHc9UAgOfwiowGPvxdszaBkhrbqsmdEXgUao
 6L8gazl4ldw7GroIyOM4so2CMCa4D/t9Vw9TKV6WLVRKqeAMOJHmcl8LPw4g1mCsqOwXm0c
 Q91H64qRm3NdUNnVr2/ow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NENXP/kkywc=;Q1BqIjlF8A4K1rK+bcwolMW/03z
 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
 fg==
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

> Replace kfree() with kvfree() for memory allocated by kvmalloc().

* Would you like to improve the exception handling by using another goto chain?

* How do you think about to increase the application of scope-based resource management?
  https://elixir.bootlin.com/linux/v6.16/source/include/linux/slab.h#L1081


Regards,
Markus
