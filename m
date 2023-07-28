Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD67766574
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5D910E663;
	Fri, 28 Jul 2023 07:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BFF10E662
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 07:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690529826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pOI0z7LnTpyG7jPoyvDfXDP5Z4kyRvlUJFULDJXf+I=;
 b=HeZp1n+RjHQ5rAlsZYc8nVYKl9hxrsStljQxQxu/7d4wmx3biAImx/McY8m8z43vMts7Cx
 52cc3SMymds7dq8Y99RvLpjD5mkkf09yuCOvv4kNK5Mun2JYZX3KcKo098hL9tZIKu1tJJ
 CeYsLo03ciaRw4C/JSH7QBvEk9hnx/U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-DUnP37h_Oa2VPrt8CD7GNQ-1; Fri, 28 Jul 2023 03:37:05 -0400
X-MC-Unique: DUnP37h_Oa2VPrt8CD7GNQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbab56aac7so10275065e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 00:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690529824; x=1691134624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7pOI0z7LnTpyG7jPoyvDfXDP5Z4kyRvlUJFULDJXf+I=;
 b=NzwsjCKe4ZUqoWTDpEF7xGg02RtCGkIvdOQyVskZlZqW/uVv9CjypOApLjqnuotrbj
 cAdownW/Gh8qTMPASAZ9V3R5w1FigdF0ivW8OlOE4WiImjFl9VAFicdHDrMyK3X+rCSQ
 kgS5i6AoXxKHdPI5YSk68PuzxeFgMLRtflOUqPjG38oaCXFffom5S6Zkp3JYx6a5XTHt
 dP1yGy6YzdS1Lq/sbFw6AUxHnmtl6uOAWKAcw0GsM4lbIDFDUhXLrrB3jzwHCi+F/cBq
 RFS/rkGn+mZwA/o9LEyADsXo+S8bl97PWeqQAp9aqSEZTvhLo7ydLkT+R+ZbnzJ/DxSY
 l/bQ==
X-Gm-Message-State: ABy/qLY+1PyUCbye/yW421035eMALEWgs/yII7hyf3x5xLTrgKgi0zy9
 4My1jNzPfDMrljLyTTWAg1D48jqzk+GhHjXHdPJc0juu3TD0nda8SzXWFbybPOkjje2NwtFYa2w
 /XuonWpcTm3BXdFgwRTPLOX67npw8
X-Received: by 2002:a05:600c:2809:b0:3fa:9767:c816 with SMTP id
 m9-20020a05600c280900b003fa9767c816mr1032040wmb.39.1690529824479; 
 Fri, 28 Jul 2023 00:37:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF5xbjUAB2Ylmsj0w0mJ5VN/uIZn5tqdalIxCe2UVff9V6ngd1AA7ugQdNvV6vIPuwMQ7MOvA==
X-Received: by 2002:a05:600c:2809:b0:3fa:9767:c816 with SMTP id
 m9-20020a05600c280900b003fa9767c816mr1032026wmb.39.1690529824143; 
 Fri, 28 Jul 2023 00:37:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a7bcd0e000000b003fba94c9e18sm3578446wmj.4.2023.07.28.00.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 00:37:03 -0700 (PDT)
Message-ID: <197543a1-f052-9c77-9dd0-adfcc8bde945@redhat.com>
Date: Fri, 28 Jul 2023 09:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
To: Roger Sewell <roger.sewell@cantab.net>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727182416.4485@revelation.broadband>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230727182416.4485@revelation.broadband>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2023 19:24, Roger Sewell wrote:
> 
> Thomas,
> 
>> Could you provide us with the Xorg logs from /var/log/Xorg.0.log ,
>> please?
>>
>> Specifically, I'd be interested in different logs from combinations of
>> the old and new kernel and the old and new userspace.
> 
> I've managed to do six of the eight possible combinations of kernel,
> mgag200 module, and userspace. The attached archive contains all the
> corresponding Xorg logs as well as a detailed notes file.

Thanks for running all the tests.
> 
> I couldn't do the remaining two combinations because I couldn't get the
> new mgag200 module to compile for the old kernel.
> 
> My previous theory was wrong, but hopefully the attached logs will help
> you work out why the old kernel permitted the high bandwidth mode I
> always use (despite returning MODE_BAD) and the new kernel doesn't.
> 
> (The "old" kernel is 9.1, i.e. 5.14.0-162.6.1.el9_1.0.1, and "new"

For the drm/mgag200 part, it correspond to upstream v5.18 + 3 patches 
(which shouldn't impact the mode check):
c48a36301634 drm/mgag200: Optimize damage clips
3064debaf55e drm/mgag200: Add FB_DAMAGE_CLIPS support
c577b2f43e80 drm/mgag200: Enable atomic gamma lut update

> kernel is 9.2, i.e. 5.14.0-284.18.1.el9_2 .)

And this is equivalent to v6.0


> 
> Best wishes,
> Roger.
> 

