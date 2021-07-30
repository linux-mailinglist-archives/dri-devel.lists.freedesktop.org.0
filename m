Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20863DB19A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 04:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DE06E1A4;
	Fri, 30 Jul 2021 02:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6B06E1A4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 02:57:50 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso12377974pjo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 19:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SFzRUhN6YLmKo+jXursxkunKR479Zn0dAlkG5jiWhjw=;
 b=I1C+DiliccqD2S8FQuIkowtDYfAT8jO6cqdK3I3/Qi0zhAV6FADH1cF9j/dfQ/XyZP
 5/jyEoOev8YimdDZB6eQ2VStXoOaveQujuTJup/ustcoCaeRZZfR/rH9EVy71s7f1Jg+
 fQeQPyONcwx0L2PszWsEh/rPuPRSYU51VxvO7O4/KNayMWsBMKnropT01PChLCh5iVtJ
 NeTcwhxrOewxgKsg2hDmj41BOwrAFUb4XfvmotEc68oUSZB8ttX6PpOjsOyUIWAOVlvT
 uNhToAsfim3PMGaWbHRQJJA9DxfHX2H641jNGjp4872i64dxDjLDhc1rwgKgD+gvpfJf
 dmGg==
X-Gm-Message-State: AOAM531bqUj58IXHkiCNrU435e5an5xGSQ8abDjY94KQ9gnNaG/jsXk0
 l3ILwmBDe1dcLCrNrZyLeEQ=
X-Google-Smtp-Source: ABdhPJzldFKnrfj3e7CDNRZJLltOGnPwYmMzIK1MKjkK0sFTGZWcKCldhGHbW6FmNfgZHfM78rnouA==
X-Received: by 2002:a17:90a:c092:: with SMTP id o18mr691992pjs.3.1627613869863; 
 Thu, 29 Jul 2021 19:57:49 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:3f66:df55:a341:f79d?
 ([2601:647:4000:d7:3f66:df55:a341:f79d])
 by smtp.gmail.com with ESMTPSA id c15sm221003pfl.181.2021.07.29.19.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 19:57:49 -0700 (PDT)
Subject: Re: [PATCH 48/64] drbd: Use struct_group() to zero algs
To: Kees Cook <keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-49-keescook@chromium.org>
 <1cc74e5e-8d28-6da4-244e-861eac075ca2@acm.org>
 <202107291845.1E1528D@keescook>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <0d71917d-967f-beaa-d83e-a60fa254627c@acm.org>
Date: Thu, 29 Jul 2021 19:57:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <202107291845.1E1528D@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Lars Ellenberg <lars.ellenberg@linbit.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/21 7:31 PM, Kees Cook wrote:
> On Wed, Jul 28, 2021 at 02:45:55PM -0700, Bart Van Assche wrote:
>> On 7/27/21 1:58 PM, Kees Cook wrote:
>>> In preparation for FORTIFY_SOURCE performing compile-time and run-time
>>> field bounds checking for memset(), avoid intentionally writing across
>>> neighboring fields.
>>>
>>> Add a struct_group() for the algs so that memset() can correctly reason
>>> about the size.
>>>
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>> ---
>>>   drivers/block/drbd/drbd_main.c     | 3 ++-
>>>   drivers/block/drbd/drbd_protocol.h | 6 ++++--
>>>   drivers/block/drbd/drbd_receiver.c | 3 ++-
>>>   3 files changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
>>> index 55234a558e98..b824679cfcb2 100644
>>> --- a/drivers/block/drbd/drbd_main.c
>>> +++ b/drivers/block/drbd/drbd_main.c
>>> @@ -729,7 +729,8 @@ int drbd_send_sync_param(struct drbd_peer_device *peer_device)
>>>   	cmd = apv >= 89 ? P_SYNC_PARAM89 : P_SYNC_PARAM;
>>>   	/* initialize verify_alg and csums_alg */
>>> -	memset(p->verify_alg, 0, 2 * SHARED_SECRET_MAX);
>>> +	BUILD_BUG_ON(sizeof(p->algs) != 2 * SHARED_SECRET_MAX);
>>> +	memset(&p->algs, 0, sizeof(p->algs));
>>>   	if (get_ldev(peer_device->device)) {
>>>   		dc = rcu_dereference(peer_device->device->ldev->disk_conf);
>>> diff --git a/drivers/block/drbd/drbd_protocol.h b/drivers/block/drbd/drbd_protocol.h
>>> index dea59c92ecc1..a882b65ab5d2 100644
>>> --- a/drivers/block/drbd/drbd_protocol.h
>>> +++ b/drivers/block/drbd/drbd_protocol.h
>>> @@ -283,8 +283,10 @@ struct p_rs_param_89 {
>>>   struct p_rs_param_95 {
>>>   	u32 resync_rate;
>>> -	char verify_alg[SHARED_SECRET_MAX];
>>> -	char csums_alg[SHARED_SECRET_MAX];
>>> +	struct_group(algs,
>>> +		char verify_alg[SHARED_SECRET_MAX];
>>> +		char csums_alg[SHARED_SECRET_MAX];
>>> +	);
>>>   	u32 c_plan_ahead;
>>>   	u32 c_delay_target;
>>>   	u32 c_fill_target;
>>> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
>>> index 1f740e42e457..6df2539e215b 100644
>>> --- a/drivers/block/drbd/drbd_receiver.c
>>> +++ b/drivers/block/drbd/drbd_receiver.c
>>> @@ -3921,7 +3921,8 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
>>>   	/* initialize verify_alg and csums_alg */
>>>   	p = pi->data;
>>> -	memset(p->verify_alg, 0, 2 * SHARED_SECRET_MAX);
>>> +	BUILD_BUG_ON(sizeof(p->algs) != 2 * SHARED_SECRET_MAX);
>>> +	memset(&p->algs, 0, sizeof(p->algs));
>>
>> Using struct_group() introduces complexity. Has it been considered not to
>> modify struct p_rs_param_95 and instead to use two memset() calls instead of
>> one (one memset() call per member)?
> 
> I went this direction because using two memset()s (or memcpy()s in other
> patches) changes the machine code. It's not much of a change, but it
> seems easier to justify "no binary changes" via the use of struct_group().
> 
> If splitting the memset() is preferred, I can totally do that instead.
> :)

I don't have a strong opinion about this. Lars, do you want to comment
on this patch?

Thanks,

Bart.
