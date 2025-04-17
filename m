Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBAAA91AFB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD96910EAD1;
	Thu, 17 Apr 2025 11:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BDL8YtoA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB2F10EAD0;
 Thu, 17 Apr 2025 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iC6UnxHXdxd0SqY8oE6Hc+he0YkkFh27P7lPYCSg3H8=; b=BDL8YtoAZOYVXQFXx1Q0aHL09D
 9rmT/IfWRLvjyp7CKNx/LaJdC6m+wt/bLJ/b+f1s9qtoGPhqlgoU3gtOqpQvrd9hahKMXO0zQ4mM2
 cbEyLWclr8nw5m1C6S6jwSroihDp5AGp+yflciAVoBmANLjEhAZjnBIY5tnvjH7ee7A9qBcIlhuFN
 JGf4E9cfZZ6HASFK3GsYXvL7A8XF7/TzGc6fUowjrKrb63qC8qmt4gPfuRbOROCPvPYnxGiAjc1Cc
 r73xHrEV8GyTlZ5k7B/aiAGSDeO7TbtfVt0fB5YGJepajHrc5bUHvQtj7uwof3s9uovFGPHouyR9i
 eLpkI60A==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u5NTs-000mn5-2L; Thu, 17 Apr 2025 13:32:32 +0200
Message-ID: <e02afb47-8e94-46d8-b0be-f39f5984546a@igalia.com>
Date: Thu, 17 Apr 2025 12:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/radeon: fix the warning for radeon_cs_parser_fini
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417093409.2242506-1-sunil.khatri@amd.com>
 <20250417093409.2242506-2-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250417093409.2242506-2-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/04/2025 10:34, Sunil Khatri wrote:
> Fix the below warning message.
> radeon/radeon_cs.c:418: warning: Excess function parameter 'backoff' description in 'radeon_cs_parser_fini'
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/radeon/radeon_cs.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
> index 64b26bfeafc9..b8e6202f1d5b 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -409,7 +409,6 @@ static int cmp_size_smaller_first(void *priv, const struct list_head *a,
>    * radeon_cs_parser_fini() - clean parser states
>    * @parser:	parser structure holding parsing context.
>    * @error:	error number
> - * @backoff:	indicator to backoff the reservation
>    *
>    * If error is set than unvalidate buffer, otherwise just free memory
>    * used by parsing context.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

