Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2CB2F0FC6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 11:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5259389AFF;
	Mon, 11 Jan 2021 10:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A4F89AFF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 10:13:43 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ce23so23877246ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 02:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=EheHVO6H1PA369vXwQvNpd7u7nXzQGDp7KDWKhw/NYw=;
 b=NymWhk43I5+yNmhpWtTHKGFo/cNbWd0nuglN0ckKLY0eM1k0HHgIlAGzIAl0HESf2R
 rqwCJhIGe5dhOO85Snrl/btAvrlzQpGGMyu4Q8ZYijSo1qXx7mYQwKc13OphqV9r232o
 wE4rukKdOCq9MzfL5nDsTn0J9g3RwXnMCJLC7m5+yI91nlY6ATYc17ykA7Qv8uoy+Lzc
 7cuX4V+rMOTfY1leb23a+LS2FhHMVxKAAVPFxqcvZ7NVR1Y4nh7gGOs/LPl4k9wJDj9T
 1IhohwtXhssjiCrgz5yPKX65lrdyt+9I66oSoPztLy7qEtnfFVKVtGmW6z1Nwe3baEsL
 /Ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=EheHVO6H1PA369vXwQvNpd7u7nXzQGDp7KDWKhw/NYw=;
 b=j0CmSyYu7+GlJmiePab9gZvKAwqYAV1sa8yeqNt/IwVjU/VhME5OfSeppbJPHplz73
 azUYC/gfDYf9/LsAXG/lNXn2eB3VtKltmS7Zxr1MnHsvnxfTMonbmAYaM4tyMWPS9Ws5
 Sp+cX4b3TG4H26PrZAfOFeBp0ayM4seEstCio2IGEc9ZQB7oa4+sC9a0q2Rhwr4zkrxG
 L6X7WVRaR84FOqDdL26+d8cgTGwZ8E977IqdK2v+1kvpS623Hn9G3K5iSnS8PKx1JRs2
 nX23DFF5gQDWj8yeOtKh73clPmPOq0GT9y2dLGSj999MtPOC2kIP8ol2hBS9WGWpylsT
 zGhw==
X-Gm-Message-State: AOAM533PB/NyRJ1tMwG9cGG+sBYpugMg8hk5RZqfhua+/OjxEu5377T6
 Bd6dAG3c39ETwxKftolaVXt82Ul5pho=
X-Google-Smtp-Source: ABdhPJwGHYoBRsc3nDfjfdMEIdFLYI1tET+ULRt5VD7TmQHQ2E4Zfm0VTbv3x9ePOCv6h+EUDe9e9A==
X-Received: by 2002:a17:907:961c:: with SMTP id
 gb28mr9820672ejc.393.1610360022502; 
 Mon, 11 Jan 2021 02:13:42 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z26sm7500909edl.71.2021.01.11.02.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 02:13:42 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: Remove pinned bos from LRU in
 ttm_bo_move_to_lru_tail() v2
To: Mike Lothian <mike@fireburn.co.uk>, Lyude <cpaul@redhat.com>
References: <20210105114505.38210-1-christian.koenig@amd.com>
 <CAHbf0-HnCdsGO9No1Ug+QEaz2WXm12OOJ9VXvhYF1P98_6GU=A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <dca06e12-645c-0801-fbe9-1ee78bc5efde@gmail.com>
Date: Mon, 11 Jan 2021 11:13:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHbf0-HnCdsGO9No1Ug+QEaz2WXm12OOJ9VXvhYF1P98_6GU=A@mail.gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.01.21 um 19:49 schrieb Mike Lothian:
> Hi
>
> This breaks things for me on my Prime system
>
> https://gitlab.freedesktop.org/drm/misc/-/issues/23

This is most likely not correct.

The patch just fixes another bug which would break prime before it hits 
the issue in the i915 driver.

Christian.

>
> Cheers
>
> Mike

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
