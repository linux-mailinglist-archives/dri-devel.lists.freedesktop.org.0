Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7090516987C
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2020 16:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DA86E091;
	Sun, 23 Feb 2020 15:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316FA6E091;
 Sun, 23 Feb 2020 15:45:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b17so6823419wmb.0;
 Sun, 23 Feb 2020 07:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=inzn9KgooBAx5M8NGIgtozNP6e9nFtoEVn58fHfHS9U=;
 b=hYw76MzTFFctGmd2sCZFPBrCelb2cowVUlYA/AM1Mvij3bAAMGhlNYI0rXUyDABN1Z
 3xnZU9YMt1g+8dxTLcHslrSYtN5qhEKRhjfGJjKacSGiPP2zDpUV6GpuaBsjENJ5rp55
 0avPNo7K+rwCSa4uwE970DBGcopjfo26u+SjVLwGhH7MMCFk9TzZNgGma7wEJ07pI0L7
 0Kln0X7vwiTJduenaOPAj0ddeX47KooxkTj5sNpoZLc5xD5l+sK34dEtrWWnL+II+aaT
 bu5X7itzmxjo3NBXoW1/JcihM6tqGVze2sSaY8eNYVgJ7JP2g1QLDt6FRNZqVMGHqZ48
 04ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=inzn9KgooBAx5M8NGIgtozNP6e9nFtoEVn58fHfHS9U=;
 b=qgmbYe5EYCKlnZci1sn88sbWSH2kerhtnEJlFkbO99BTiGv7stFGWWVuNSBf6iwjfr
 oRIe8Vh7vP3dq8o5AcYqMG+xOMujTtWeo9I9mL09U2Kg+TI0xtNzdoQYzy1aRb6PZXI+
 K6Z1+wkpf56S3jwKLxALLWzJVJEjg0jwhgs7l6mZ/W2XqPASvsBP9R6ayRY8wNTDREPZ
 8KiIHzmGpSbvXUAvUoQFffaoz6d1kxtHeYUQmKv5qgoSHg2RDhoUoIlM432bSElpOdF5
 fULDywGO2DrWg2SpD/d6FKvT1x1/yvGCwvi934fIlXxVWlzpiRzAy2C3X0cFkbZhWH7A
 NApQ==
X-Gm-Message-State: APjAAAXzlOdNGxrtQ8unYZ7uBy71wkQoXs6Q9TCN8DmQJcCxhborGcQY
 rQ4d7nodvStvjYigIOLpmLM=
X-Google-Smtp-Source: APXvYqxhJh1O9a4M4aCqcycel5moNklWx8r/xJq6nuMHEP0zx83oOzF3CBVTxvvIT9/L5THTkiHlGw==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr16451275wmi.58.1582472716864; 
 Sun, 23 Feb 2020 07:45:16 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w7sm13097479wmi.9.2020.02.23.07.45.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Feb 2020 07:45:16 -0800 (PST)
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
References: <20200217154509.2265-6-christian.koenig@amd.com>
 <20200217175518.GL2363188@phenom.ffwll.local>
 <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
 <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
 <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
 <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
 <20200220200831.GA2363188@phenom.ffwll.local>
 <501bf409-e4fe-a318-17b4-d5d050b09529@shipmail.org>
 <20200221171217.GD2363188@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com>
Date: Sun, 23 Feb 2020 16:45:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200221171217.GD2363188@phenom.ffwll.local>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.02.20 um 18:12 schrieb Daniel Vetter:
> [SNIP]
> Yeah the Great Plan (tm) is to fully rely on ww_mutex slowly degenerating
> into essentially a global lock. But only when there's actual contention
> and thrashing.

Yes exactly. A really big problem in TTM is currently that we drop the 
lock after evicting BOs because they tend to move in again directly 
after that.

 From practice I can also confirm that there is exactly zero benefit 
from dropping locks early and reacquire them for example for the VM page 
tables. That's just makes it more likely that somebody needs to roll 
back and this is what we need to avoid in the first place.

Contention on BO locks during command submission is perfectly fine as 
long as this is as lightweight as possible while we don't have trashing. 
When we have trashing multi submission performance is best archived to 
just favor a single process to finish its business and block everybody else.

Because of this I would actually vote for forbidding to release 
individual ww_mutex() locks in a context.

Regards,
Christian.

> -Daniel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
