Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CE526DB5D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 14:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81756E13B;
	Thu, 17 Sep 2020 12:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52DB6E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 12:20:05 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id j11so3043365ejk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=noHSkXZhEp/9jIAudJb7DDKYs2jm6VdqpaXUz54abiU=;
 b=R9BuleTlFcIXe0WJ7IGLTjsHs0YW+sHPVO06h7S06L/iS6sK97r9elEWzJVMQVBTXk
 SvshpF3aiO6NXJuKLJ7+McdEguurL6HrqiCv5gcBeFy5ifz8S+KFQWToGh0nl5g1dCEE
 8HkmCBiggpyrOVttbHvyp/q3eKm/yqZDxqGri1nY+YQyjpulB9ck5BU7UOq33EX5O8tI
 N/WGJppw4DaFDrR8xfSGwptUQdNJzvu8vgJrG3Lbit9FOzeVyCHqd1Z4RzrlNgZGFY+d
 lPXT0Zm+sgTx4sNPhG2Y1d6Cy1Who0PMIUMIf144W5EEkQRoZq3hcQP172v+hIn8AvO5
 jX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:to:from:subject:message-id:date
 :user-agent:mime-version:content-transfer-encoding:content-language;
 bh=noHSkXZhEp/9jIAudJb7DDKYs2jm6VdqpaXUz54abiU=;
 b=PhZ1ktf1zZFs9FmJi8JWkL7R3rc1+6BdDqg/PewxpGmAmKCP/PGjzsN7H6DUEWkXuQ
 crcCeYZ0euw8H8T/YpxRIrsfUCC6voTlrAASWFYdklMxQe7dkmG9j51SBtpgQOMrRONC
 axo+05/0qVaLwui7YQOSt/Qv6koT8NxcMk9fH7nO4Q0NSBCcrooK/iQUXTn2xmTgXzPJ
 Ed2qIsOlJ4PU+yXH8LpbOAI53kt3iOJR9ZnBJux+Q3wfMJDGuYd2uyWg4ccU0Kmz7rED
 rwgayMbVWxejrfPOhsOYYWZFlRl1F9WXppDoNHTbGKub2nwVdMqqG7e55u/r4NtuDEI0
 /3cQ==
X-Gm-Message-State: AOAM531VCG+AAH8X98nRvAxgstgdGQkyQRWQHrFUMrusaTk+b93FRLLb
 9xDQpuDwNPzD5i4s8DmGOCk=
X-Google-Smtp-Source: ABdhPJwwFrJbxbhLX/mImlwLk0McIs4Yili8rCaapcssfC1XqjVk074DXMyJZqplZOO3uIx9OByOjw==
X-Received: by 2002:a17:906:4a07:: with SMTP id
 w7mr30321020eju.366.1600345204457; 
 Thu, 17 Sep 2020 05:20:04 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m10sm11593095ejx.123.2020.09.17.05.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 05:20:03 -0700 (PDT)
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Why can't ttm_tt_swapout() handle uncached or WC BOs?
Message-ID: <fabf5079-6c39-7c8f-2973-5b32494f852a@gmail.com>
Date: Thu, 17 Sep 2020 14:20:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

Michel once submitted a patch to fix triggering this BUG_ON in 
ttm_tt_swapout():

> BUG_ON(ttm->caching_state != tt_cached);

Now my question is does anybody know why we have that in the first place?

The only problematic thing I can see is calling copy_highpage() and that 
one is just doing a kmap_atomic()/kunmap_atomic() on the source and 
destination.

I can't see why it should be problematic for this temporary mapping to 
be cached instead of uncached or WC?

Does anybody has any idea?

Thanks,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
