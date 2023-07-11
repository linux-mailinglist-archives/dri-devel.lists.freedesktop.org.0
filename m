Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A455674FBC4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 01:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1348310E461;
	Tue, 11 Jul 2023 23:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3274D10E460;
 Tue, 11 Jul 2023 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LFHQzkFS9wSPjknxSFQJfKSFRQvdUVhns9NnhJvkFr4=; b=L9RqovJsZckhw6FiUQoaWDpXn+
 dsm13nkF8awVzv72RC+745Zx0OfiQ2AAWt9UrFNwCL1Q28sg47MBN5u+bolzkt+mFfB1Xso2WacG3
 7tnx9S3UAq0gxne7OuMsq/1udBh+EvFPUwSFiBqVsGd970edKZR/oxjO5AQf9Xj7ieq0a77HT9E19
 6AvjN+SCRz44pw5NobIRoO25iQ59BZ8it7ze9Jqdbtf8SKRjlZ7/O7OsLxuusruULlsMFZFiE7NlR
 9O0MejeyrTAZAUdWu2u/dCInymE7nW2x4UNnAZHKLdUGYQfC+znNRO9ruM1UDdUzNnp7lRFRE4yWd
 EcXy7t/A==;
Received: from 201-27-237-219.dsl.telesp.net.br ([201.27.237.219]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qJMa2-00CnWw-Ak; Wed, 12 Jul 2023 01:15:38 +0200
Message-ID: <3e4892a5-f8a8-805b-aaf9-c9aec64d9607@igalia.com>
Date: Tue, 11 Jul 2023 20:15:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max
 selectors unconditionally for DCN1+"
Content-Language: en-US
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, alexander.deucher@amd.com
References: <20230702164407.6547-1-gpiccoli@igalia.com>
 <54092b91-a9c6-7276-1633-13b83a92524d@amd.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <54092b91-a9c6-7276-1633-13b83a92524d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, cristian.ciocaltea@collabora.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/07/2023 15:22, Aurabindo Pillai wrote:
> [...]
> Hi,
> 
> Sorry for the delayed response, this patch went unnoticed. This revert would break asics. Could you try the attached patch without reverting this one ?

Hi Aurabindo, thanks for your response!

I've tried kernel 6.5-rc1, and it seems the issue is present, due to the
patch being merged on Linus tree [as 1598fc576420 ("drm/amd/display:
Program OTG vtotal min/max selectors unconditionally for DCN1+")].

Then, I tried both your attached patches on top of that, and
unfortunately, the behavior is the same: Steam Deck doesn't boot with
graphics, and we can see the single error "amdgpu 0000:04:00.0: [drm]
*ERROR* [CRTC:67:crtc-0] flip_done timed out" on dmesg.

Do you / Alex think we could get this revert for 6.5-rc2, so at least we
could boot mainline there while the issue is handled? It would be an
intermediate fix. You mentioned it breaks some asics, but did they work
until now, without your patch?

Thanks,


Guilherme
