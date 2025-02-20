Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D0DA3DAA2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 14:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBAD10E053;
	Thu, 20 Feb 2025 13:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ujs3U6IB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB26510E192;
 Thu, 20 Feb 2025 13:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1740056451; x=1740661251; i=markus.elfring@web.de;
 bh=sU1XHE9KFAlc92izSS4V5NV97DtDuepbnguI4jYS71U=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ujs3U6IBH3U1iEkzFEXb2IrHDrjTO7bnnlsuDC8FoO/cs328dJ0VRBwIlFQVI/v+
 p94gX6JIhKbfBKlaoodtQQLOaICkdkBQpZAA0nDSJBg9WdDGMzw/bAyRqMXd93l5z
 1keGIui/Z5Vgs51bQAvsMReB9Ov07lW0LvSNNf53zLiMEdmYK+VbZDuHsUp5nNv0r
 ig7xCrvLA/J8haNcUbm+dX8F91wJWWWajYbkbBeVXq+pNm5IMgt5uD0jOhIxy3DOv
 KQlhOqGnzK612Cii3y7tgnSj4EPRYvQj16p0ZzsCNYezWROs0UroxpzPvO2ptDcxS
 HVm93ZNRhq3IEWdZiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.25]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MuVKI-1tT9Zx21mk-013Cx5; Thu, 20
 Feb 2025 14:00:51 +0100
Message-ID: <731c6ba8-f165-4ee5-80be-514fc32c8475@web.de>
Date: Thu, 20 Feb 2025 14:00:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xinhui Pan <Xinhui.Pan@amd.com>
References: <20250220064244.733-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v2?] drm/radeon: Add error handlings for r420 CP errata
 initialization
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250220064244.733-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DTCVMAzRcbXDsDaWrsjoQpRHRWy8WC4va94OF+pvpJwvN9EipS4
 Kk0u6da2VtyehCQrLHfr6nKqncDZIugJ3xjTfi+UDfX4pDx4k9eoZboZjwCGr+nsuRjJ4mO
 pZxXHWP7HjQRkFB5Ta3ENRVuNBR0fU2tFxZCHE/CyRYfp93ueRUbcFTSZLINKp/ykhS1kjI
 foI1RQ6pJPjszMXSJuc+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ss8rG+UxAxc=;w0c9oGegRzOmROzOzwreyUWufmH
 LmCUCyxqoXi8BCTW/sAkHwGNtkI8VKYlDdcXioRp7//EHBVeNSZcKoEUpf1A0I5ALX3cCm51Z
 BWq1/pBge7CoynZeMG+uFkwm2GOW9vCmJg9cH4Oak2w8wizqkWCdWnJBnlKyGWzm6kAyrOeew
 fc7tFQyJ1kU7PVzzSu4eQ/hOpGUkl+JwGMr+gXxiSsUGQrvDVWaYvNjGb8i1tyF+A9OK6viYK
 JspDd0j97jvP8GcM0WN2dQdwp2m7Sev8DK5ZM2XKjebR3JyQ9orkvuRXI7PZS18rCIg8h0BZD
 EEZhuKq9r1leRcddliuouVhJUb6J8mcw1R56hUumYXA9VxAIXU/2OJP6H+UsXRva3AeSKa5gv
 PlT5Whm8OfLQrbg7fQ7WLDncu4xZzRa2LTHsXEaDgUOmCWyadSjtDhvgMMXj9m8wDX1GDUdDn
 7kpg7bhM7hkvsoWSeVrAbdkl0IxtXVDel9LBUJootAS6jCPiekbqQyO6ACh2zTXNG4is/SXg+
 Wu5kMvBUI+MrfNU9q37NTwGtIQm8Ckn2fxc2DxKOIdQ2t9Ogiez+iudY79jgLkN/BluVTt4wq
 a+0xwPIKMXiH4vY73oJhzZ/KtPUFgzb/OnZAs0BNTGT7t70uanvoCYSTmobqXppYb3Ps3f4J0
 Yx+6Xp326eeWvNdq1pE5X7aRQYiJhlfzFEOhyvEj+iYZvYXf9jfGLCOs0jwwn8/vzIiYRluxM
 jwM1vOz20G7t3OwMlExP0nt6QkqZuyz4W+iGKuaidGvdO/KR8KRGDE4e0TSlaPQeI35jcDkPc
 qTXnwvaPr0ngyxk8R4yWI416ER/A56eBoCEZYfC4ED4RSk1UklNsbhtQus5oUivB7AioJhzcy
 uTxhL4N8eD+Oym72Fcm2B6rY5uObACqHQA8rlWrdT8oDftk2Fs8ItWQR2zJ1ljR45cunjWhdz
 ceB7/5DpuB5Pi5RbTKYTGOjg6kc6DhywAdGZN7rwd1vJKtHHTKdN6FkAvpAz/16wkBkblQvBL
 EhngzdueEnxbpmwEnRG3WgBhthnDELuZas/M7HrXhNOWOQSMnt/uZs0MW/F2jk/GAR47cpqPw
 /WK3RrCmDY0+lct9cj/1aDk9D/Zk+ewsOgabkz27qtJjkK7yG05gI6gFM4+8RmKKGek2vxW8h
 M5ivuY3883rcvS45emSAmz84aHFS6VZGoG4MmBgZeh4ZUz1Q4RHD5DQdW8sz3wza4t4L2ecAU
 2ZMPe6z7hgJE22c8uHMNDvn7v/uHhYX4cTtnsxRvtYITVTebGBwG9oA1UIsuG6/9s35tEtiSD
 3XwPTy1gmsOaql2U4/LXuPCGFJYR3UgUJaXl1CSanihubV3pYpzA+oeXMdNSs7aMG07osD/zF
 Xnd6Mga5rUs4Lb+ZKGvsBTA73pODd5GcUe4mtVfhFZCY3IyxTJhG6smTNnl/bwvKc3/46GEQ2
 8Fip25jyYkR9vO0V785oqVBvFjgg=
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

=E2=80=A6
> ---
>  drivers/gpu/drm/radeon/r420.c | 15 +++++++++++----
=E2=80=A6

How do you think about to improve your version management?
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc3#n780

Regards,
Markus
