Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEC2B252A1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2541110E025;
	Wed, 13 Aug 2025 17:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="AQ2BoV+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDDE10E025
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 17:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1755107798; x=1755712598; i=markus.elfring@web.de;
 bh=6A6owKl0e8HWDp37m50TwvyylqFVijy9Z30GbhwAZb8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AQ2BoV+YykwYv0odO6vRbs9iYehYqcDoeeO9ZIlEzp/OoF6HV2tm+Y0AqwcGwIV0
 pE+fg1WxuTwzKUzaXcUVt2fJBiJgFOGoIx7tYCd54Pq4ozJLSWb6BYUgdiWBySe5j
 bq9FVHR+t8w1+oYh1jWrkqM0MuGFHnGwLHROxVdbCmGijOdOIDWXWPKa2S8wwZw2A
 8c2iL+FXAHgqMMzx+KnAgty+EXXNvgLiKNhySbsG73jM8zEpSoeafwIVcynfW8Imh
 09AQfRaUWkyfymMzp16tC1qpp/1fu1qgG96JmxBWnvJzRYw0TWsKEwRwUPAAg29JM
 ravbKxL9gRSM6g80Vg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.246]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Myv70-1uQa7r44eo-00tYwd; Wed, 13
 Aug 2025 19:56:38 +0200
Message-ID: <65769f0a-af9f-4e96-93d4-8594e76d8e73@web.de>
Date: Wed, 13 Aug 2025 19:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brigham Campbell <me@brighamcampbell.com>,
 dri-devel@lists.freedesktop.org, lkp@intel.com
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall
 <julia.lawall@inria.fr>, Oded Gabbay <ogabbay@kernel.org>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
References: <20250813-rocket-free-fix-v1-1-51f00a7a1271@brighamcampbell.com>
Subject: Re: [PATCH] accel/rocket: Fix usages of kfree() and sizeof()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250813-rocket-free-fix-v1-1-51f00a7a1271@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mRvjSfon63yuuB/07VHtw2H1/p8sOLnrIfgzT18KftjfuzYvOtK
 Qc67yoFo8LZ68Bzyt3TxqpVMSPVDIBxmdmaxrBvU971gzpzMkA81w8uZ0Xt6X32hZSKftBk
 RxhdcuHqYPJ9CF5yAKxobSnpym7N4NtTCn50G5bqlm1skpe8SDZU0mNDAOUGDNzZNY7aT3G
 mK/1afhl9MeIAw0MowcsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LjSYrUWW7Ac=;lpTIpvNzL+AYk1dUMlMj5NtlhEP
 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
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

> Replace usages of kfree() with kvfree() for pointers which were
> allocated using kvmalloc(), as required by the kernel memory management
> API.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc1#n145


> Use sizeof() on the type that a pointer references instead of =E2=80=A6

Would it be helpful to offer desirable changes by separate update steps?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc1#n81

Regards,
Markus
