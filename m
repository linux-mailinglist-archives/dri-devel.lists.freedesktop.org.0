Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA6A50601
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 18:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FEF10E816;
	Wed,  5 Mar 2025 17:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="L76yi27o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A4310E816
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1741194541; x=1741799341; i=markus.elfring@web.de;
 bh=YaS7Vw61tpQIxWBhHvbHuS/DKddYZcONhrC4ZkkXjrE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=L76yi27oBcT7j0UHkfzV8BEww0ObdYF4xYtqm/n/lkFEtavF8Tly6AGTymodmoUE
 hs8lqZ0xyZzF4P8HhHD2TS1YjxmIX2DPPr2UA+yKI5Slt6yF1ZVH4q72AXqi9NDRo
 CCmH1D1PmU8wTQrv4trt0UFCZVdwQvIT0d6Z+zh77BMnSsKgIGj8Yxtv+1HaaKUfR
 khz00VN2JfEyKOSKRtHeO8EFtuIMzfmC6xJI3dOsTJUzoMUVswYSMNe3LsTKs3x4x
 o08hZnuz7H4cD984gZexT98aiOdGu6e7bEHiWrcGwrH0u7EOwJdjxZiELAf5GzkbI
 ZvRha1ll/N36pae7gQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.10]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlLE7-1tOYE43K61-00kWWL; Wed, 05
 Mar 2025 18:09:01 +0100
Message-ID: <851bef96-245b-4f5c-8390-ab94dbc04063@web.de>
Date: Wed, 5 Mar 2025 18:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, virtualization@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>, Chia-I Wu <olvaffe@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Uladzislau Rezki <urezki@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20250305152555.318159-2-ryasuoka@redhat.com>
Subject: Re: [PATCH drm-next 1/2] vmalloc: Add atomic_vmap
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250305152555.318159-2-ryasuoka@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:vEp7fO8OsXvltY+7oiG0U4Qokb3J1idWk083MmpQMlGUeIwHTKL
 jRh7hs+24rFyD+jl09lH+ncvGeCwbtWg961JToNhl4VKePRb7+aYCgPFENm1vRX8pbHDA4i
 zxnOW+aDPcsXlw3NruQ/sLB2XxT7g5LpG8UHpGYjNpIoMcPvKStEF6y8FzzgWuO0EICoJKb
 vXAbMLOSUS+c/O6ilBHGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YxuzAM20H38=;gHkRljwq/KV5WGk1op49fkFicqc
 9+hDF7PwhqCqW2f4kk5i/KcpduA11TJaBjXWyLI4L3VpqOzUiHb0XPmfXJCVmm7I+3fQmHoP9
 DDnopOS6pVWYYhLTpJOL9Y/GMavuuRRvCio5xTqQLKw+WzCFxa2r2kgj4ptckTwDu8I5dOokT
 BjkuEjAB8Stv2pLpATxO64dtcZSQ0LIZdpevZXtonOkZKTdMp3QemYaudoA+dD92uRF7h2Hs1
 ijSZhc9apGr3TirahGb3XO1jnLgb9HIz3I/L1Q8T82JLKCb94hBs5a34lVWmuG6IC45ajiS/W
 QXsIn2Qn1IkIDTik6ZpLzMq7wBIrMUeYuhx7GIPbe9nRuLzWGPzgbtw9UcuBXCiyAb7LHYSYo
 /JsqOTvvJ9uCVvcjBK45KWxXqfz+fg2wa+OM48FfL3bd9O3N37+BgtGONVz87jkoH8ZVDx3P8
 /EUJo4g4x8buFuGXnIq+dO5lNNRzfgs3l7QZnAt9PjlEPIP5LffA0kj+TqYLhge1Nl6qhyA6V
 NXHOjPYArqM1zOkmjLmj2GfLwvxhpbrWEBlVFcetLW737LEASU2EBCKKLkTkncL7kCWbCHBeC
 rf5TQD0sE+J2Faqq4hU0u6XBP4q4Uxaeyo3hLULVzFLHvJQQSU/f+iN2RLowoTxYk5q4V2qBV
 xt10vUJahfgn3zh3C1ZCxPydJt5vPVOsqEAHOJ2tJ9h8KLgBzvhTnJUYpXDmi5QYfLxDu7eNb
 67xd0Qii2mwZxGLJ2QLdAMH/8ep0o28WvNEchYkqgEUFf7Vy18Yxg3b7dkpazHS/+vlJNR1fx
 C//4EctTNRkqW5SJohwa6tSR6r2yZe+BmPzR1glbxoxiXLVI6emBXs+66x8/XVCFgKqzttxZe
 dDpP1CV7fKQEF2UNNrzPTjCECsPQImiQNBjW4vmeioM2/Il3M+lC2MiBB7GTRTx2+DaQq/dDZ
 jhx/N3t9ITztPm2Mbi1diyRRd8iRt+CaSkPbH6AwJUjH/eCVlZwNy/cqT7vgMkOa4Ys5JpIp3
 A5bFO+O1DKofWhyf7vhJ+QcJ9SbHZqwQ2fiYB8HS5KirYR3kN8hXSelgRQcYDr7nHafgc8dsn
 D/NOp/0wwL5OnO9FuABzFnHWIZr5UMkRDVJJPL9qDYD8fs1BhL5gI640Lv+PiEk8iczDhgRBM
 JsHuPXZ5dmII8/gulPYM9EDdJdGOkE8zoPNZljZ4n8PtOJ3P0WYlApOLCFbZzbhCeL66vNxLy
 bQ2gWuCZfKwyWhCNEtUmUtBY3m9dcwIDB4OBhbxh5q0/C+Njt/cq7dYONtJJFNZqVaOvnZxlL
 n/Hem3o5coHPuAH0UUSCz+WpXNpOoyCm+WpnzYJYplznBNhMSZDWMoWOINx2w+l+7sevpSShH
 MoyxcTY+fRffbMemiXvtoU0Ny+AcsrQ0SrYWJjm6E3cA7xr2+qAXLbJn8rmENw87JXrsIOgTc
 3hNdO/NPSGU+8NUDlEtV1UdHFCro=
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

> Some drivers can use vmap in drm_panic, however, vmap is sleepable and
> takes locks. Since drm_panic will vmap in panic handler, atomic_vmap
> requests pages with GFP_ATOMIC and maps KVA without locks and sleep.

See also:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14-rc5#n94

Regards,
Markus
