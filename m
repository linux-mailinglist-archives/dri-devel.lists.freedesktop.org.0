Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9CDCF789B
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 10:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBB010E4BF;
	Tue,  6 Jan 2026 09:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="tC4ldA3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8A010E1D1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1767691827; x=1768296627; i=markus.elfring@web.de;
 bh=6dht8SJkC2rzRbuhZR4GkSwtU/MGsqJhcdvKRHb5nIg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tC4ldA3yk1CzIzy4pUu5URMfUmT5E6vEmLnQ22ESLyG3ANSWqdhp7ijODMGVRV/J
 p3aFPvT7dYly2ZZ6GLeDqx1g0Gs6TUba63QzWgHwNkuDOAqh93SxnLvzH2VL7cB8h
 EAzNj6nKmz8GHQB30X4rokzuKcGtjn3tzWQTmZcGDJARok0xbpvHJr+b6aBgqA825
 4a9wPwIuloqgw3xlZveiEh4CU+5FeC1AwGT4IuSvdAP3UZSV8x6GNGh2nMOA+T4fX
 CqUR7kiG4PnQKnfdcbaTRLvueW4EgEyc+NqiLQ/mZbD3+dpd1n45jOsrz6lZKXmlK
 ANjpBf/9FsNSUmyeBA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.180]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MoecF-1wEcG20HIP-00hfos; Tue, 06
 Jan 2026 10:30:27 +0100
Message-ID: <57a9f219-2612-4a64-a9fb-44b04e09ec15@web.de>
Date: Tue, 6 Jan 2026 10:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Felix_K=C3=BChling?=
 <felix.kuehling@amd.com>, Oak Zeng <ozeng@amd.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260106015731.1906738-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH v2] drm/amdkfd: fix a memory leak in
 device_queue_manager_init()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260106015731.1906738-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:27LJ+tSBb4OMp24QRjdLwne1rdlZJUpA7LX3k5d6QKKcEnfp5aA
 gYRNn1vxb7sgau5aF7q5Mr1McPEMf2zY4zNrwLyDGOL3b68CzxCt0ua0v2aDNOjCA6MYpFj
 S+A+uKDP0Ml660z073sj9q8sBYajmj0wAhxkXDrer50QRFoX9gWt9S+gsIV63uD1HiM4ohB
 sGSy+Uq2T/G6Jb9wWHTfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0BgHn/RCNrA=;OEJxKMLYF8w24gJ6seaFk28TAWl
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

=E2=80=A6
> Move deallocate_hiq_sdma_mqd() up to ensure proper function
> visibility at the point of use.

=E2=80=A6
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -2919,6 +2919,14 @@ static int allocate_hiq_sdma_mqd(struct device_qu=
eue_manager *dqm)
>  	return retval;
>  }
> =20
> +static void deallocate_hiq_sdma_mqd(struct kfd_node *dev,
> +				    struct kfd_mem_obj *mqd)
> +{
> +	WARN(!mqd, "No hiq sdma mqd trunk to free");
> +
> +	amdgpu_amdkfd_free_gtt_mem(dev->adev, &mqd->gtt_mem);
> +}

Is there also a need to reconsider the implementation of the applied
null pointer check here?

Regards,
Markus
