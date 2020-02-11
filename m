Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C7159024
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 14:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28126EA63;
	Tue, 11 Feb 2020 13:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8326EA61;
 Tue, 11 Feb 2020 13:41:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t2so12466115wrr.1;
 Tue, 11 Feb 2020 05:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=aLTztAKkbiINClh1/1dtfsKqGpvUdnYEQYdommfKl2g=;
 b=UBZcnIrSqe2YgQbhrA2MeXR+Kl5wNYB4TzvGgxCjc5Jztarvzl6Q/VlnNvm7twsJ99
 SyJjawJE3hMWiy38MH2Bv6XuGCqWRP/4nmoH4BdWb7fg+KD3XhVqESceGlpizsR4p+MN
 N/MqRXUPDYzhZ8qP0BoYQVUv7KUE4WPjmYv1PdjmTmcEZnkBfW79r6a7FIzmSztWo6Ri
 OgC1phGk/tDcaVsPXzhzUANQ2CF7RVi3z6ZBRE2l4gLvYJZQiYw3q7pVblyXyjAUb2Vl
 0ijZEvCw1jVNcpbMLLn8g69UkQx0YatHGJ3NYGR93O+a/v2BB5Qq6sefhysGZmxUjA6U
 fEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=aLTztAKkbiINClh1/1dtfsKqGpvUdnYEQYdommfKl2g=;
 b=qSmpPCbNHKk3Ipak4RwhFyKoxmbvi5f2J3JaCGIeOtVORjAc5Y2bEqVot1Uul/hT4C
 5out99QqWncR8hxna/5WWQVTgjEWuXWpiO7xKrSg51Ga69De2EHI49m/LZ4YBAXXxedn
 WhUOa2AR6vgeuI+4/ogVWTLojb7WRXDpwPHUwtzDTGzfadaZTbcdnj/dcFTO+cGk7s2Q
 XrMUJhqUEosNCXBqWwlfTgYp9IfeyLxO4weeGYJPrNP+47JQF5A2E54wYPs3LXquFBYb
 8+M5QRaI3ckw+Dw4hqibq/HylFlBlWjOdOlX2GrWXgTC1g3qPFk4J7cwlyGif0xbzF6Z
 Xfzg==
X-Gm-Message-State: APjAAAWiZ/ek2PVWx4/baS6v1ICAsQvP9lAiteVhGiImTrnGRIYsLoon
 idPGKDO7NUb2AH04+syuyE6QUUKI
X-Google-Smtp-Source: APXvYqxnSNrWsOGcb4NZESPQHzopVnS53basUptDy6YbgBIQL/oQswl6qfQXQW+t3TUSsy2ehMhd1Q==
X-Received: by 2002:a5d:494f:: with SMTP id r15mr8951251wrs.143.1581428515208; 
 Tue, 11 Feb 2020 05:41:55 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b17sm5558921wrp.49.2020.02.11.05.41.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Feb 2020 05:41:54 -0800 (PST)
Subject: Re: [PATCH 4/6] drm/ttm: rework BO delayed delete.
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <20200210150907.20616-1-christian.koenig@amd.com>
 <20200210150907.20616-5-christian.koenig@amd.com>
 <865D83C5-2752-4D2C-B0F8-66CA0B1B0203@amd.com>
 <4C763419-ABC5-4890-BFE4-02DDAD89C0BA@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <40bbab73-7258-0d89-cf41-5a57fba6015f@gmail.com>
Date: Tue, 11 Feb 2020 14:41:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4C763419-ABC5-4890-BFE4-02DDAD89C0BA@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[SNIP]
>>> +		/*
>>> +		 * Make NO_EVICT bos immediately available to
>>> +		 * shrinkers, now that they are queued for
>>> +		 * destruction.
>>> +		 */
>>> +		if (bo->mem.placement & TTM_PL_FLAG_NO_EVICT) {
>>> +			bo->mem.placement &= ~TTM_PL_FLAG_NO_EVICT;
>>> +			ttm_bo_move_to_lru_tail(bo, NULL);
>> [xh] this should be under lru lock.

Ah, yes good point.

>>
>>> +	BUG_ON(bo->mem.mm_node != NULL);
>>> +	ttm_tt_destroy(bo->ttm);
>> [xh] already destroy it in ttm_bo_cleanup_memtype_use.

Fixed as well.

Going to send that out with those two fixed in a minute.

Thanks,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
