Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28CCAD802F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 03:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C9B10E0C8;
	Fri, 13 Jun 2025 01:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="hGHoMLUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 358 seconds by postgrey-1.36 at gabe;
 Fri, 13 Jun 2025 01:18:43 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B682A10E0C8;
 Fri, 13 Jun 2025 01:18:43 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com
 [159.100.248.207])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 4F0ED22393;
 Fri, 13 Jun 2025 01:12:44 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id C57FC265CD;
 Fri, 13 Jun 2025 01:12:39 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 021413E8B6;
 Fri, 13 Jun 2025 01:12:30 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 by nf1.mymailcheap.com (Postfix) with ESMTPSA id 9E57C40078;
 Fri, 13 Jun 2025 01:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1749777149; bh=mzLaYBl+Y/d7BQANb7I+GDNo+dl/a7Akffi+nhcQ84s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hGHoMLUZOLZCVgdW8cq0dvyersBeAz3xkHIZ2Omj7r5z+HuEW/pPNfTDO8K0Wrsxy
 PaFq534iNvtvMVkds2hnrsbyeuvgvQ1VD72sjrEnooOrYdKWIsbh3LCCSoX7Uq4NJ5
 mQuhUKNKnd4AYL5C3TFHvzaRDPGNyi6nx0e1X6nE=
Received: from [19.191.1.9] (unknown [223.76.243.206])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id ED8D5411D6;
 Fri, 13 Jun 2025 01:12:20 +0000 (UTC)
Message-ID: <60cb6d5e-45f1-45a1-b142-22e3dfd203f9@aosc.io>
Date: Fri, 13 Jun 2025 09:12:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm/xe: enable driver usage on non-4KiB kernels
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Francois Dugast
 <francois.dugast@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mateusz Naklicki <mateusz.naklicki@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Kexy Biscuit <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 Wenbin Fang <fangwenbin@vip.qq.com>, Haien Liang <27873200@qq.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Shirong Liu <lsr1024@qq.com>,
 Haofeng Wu <s2600cw2@126.com>
References: <20250604-upstream-xe-non-4k-v2-v2-0-ce7905da7b08@aosc.io>
 <yyzxfqydczvfxddfsa4ebi7kyj5ezl2v4wbl5fopkdz6qwvjrg@fnhpcvfsp2dm>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <yyzxfqydczvfxddfsa4ebi7kyj5ezl2v4wbl5fopkdz6qwvjrg@fnhpcvfsp2dm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 9E57C40078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.10 / 10.00]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_COUNT_ONE(0.00)[1];
 ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[28];
 MID_RHS_MATCH_FROM(0.00)[]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPFBL_URIBL_EMAIL_FAIL(0.00)[ce7905da7b08.aosc.io:server fail];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,intel.com,gmail.com,ffwll.ch,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,aosc.io,qq.com,vip.qq.com,126.com];
 FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com,qq.com,vip.qq.com];
 TO_DN_SOME(0.00)[]
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

Hi Lucas

在 2025/6/13 08:13, Lucas De Marchi 写道:
> For some reason this patch series didn't make it to any mailing
> list... it only shows the b4-sent and stable:
> https://lore.kernel.org/intel-xe/20250604-upstream-xe-non-4k-v2-v2-0- 
> ce7905da7b08@aosc.io/
> 
> Could you resend this series?

That's strange... I have just resent the series.

Best Regards,
Mingcong Bai
