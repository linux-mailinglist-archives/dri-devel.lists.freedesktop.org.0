Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D646EE4F6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 17:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D3210E337;
	Tue, 25 Apr 2023 15:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E275F10E76E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682437699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdbfBO9P3dNA5DkFcgzGIbmG69CDWbTOQpd5bSddDV0=;
 b=gVxpB06Eh3s9neQsNFQQ5bzpupASICkL7D7cYX8UGEEqWXvF4XDuQp051BcvGNgcWObotB
 X8/4QXKnKeLfBuQFo3sjtp1C82qGeo0/SYzKsfRZkY8vAsEPGq2LqH4LF/JTu/VBE4C+Na
 r/miQrIRfcSyVjb9ktMrFRNVflF4cqY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-xtlZXWbnNTypdDieuuHESQ-1; Tue, 25 Apr 2023 11:48:18 -0400
X-MC-Unique: xtlZXWbnNTypdDieuuHESQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f16fa91923so32865665e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 08:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682437692; x=1685029692;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZdbfBO9P3dNA5DkFcgzGIbmG69CDWbTOQpd5bSddDV0=;
 b=F/Bp8lYkeKLz94F6QPoGkemr23UnF9/v6OJ0BrWVXNQmIJ9Pyj1Hr6dYV6+9zScwxE
 nGsIO8RgPz+BeMbJ6eFwIFgK9soXepl+Dmo5DQYD3KJQ234hq4kv5LmtkirYyDdznvwJ
 OtkqKsj2oh/vc2xdSdj/9CFuJM+dD22UCTQ207Co3SynezmRjKulpYXkZiuTbknoI5Ma
 WaHp+Q/iBLFJdf1c3390QzFh7VNB6bDOUhswNwaZhOSJ0UVsgzzv/XRNRyRyggB8YKg8
 jVFGXMHkI0UwxNGZv3cjg+suVBl+lr8z/FAkfDTwGIsXP3Xb/9/pQAQpzCgh9DwKn2ek
 fm5A==
X-Gm-Message-State: AAQBX9fA6dOLYNl10HNlJo0cvb9aFHlg1OJ5XknKKvtAkfZ/UtRclZ2D
 vZrN8RoeGQUwE7la5ro/1WZIHmrjaXfYxEHu4a8Y7vMEphUP1nASdrDkRrokF0QeiXJp2YM9vep
 z2KRYAix7W0i1EXFHHBfJJihAI3R5khRnHbXp
X-Received: by 2002:a05:600c:2208:b0:3f1:75a9:5c0d with SMTP id
 z8-20020a05600c220800b003f175a95c0dmr10971879wml.26.1682437692253; 
 Tue, 25 Apr 2023 08:48:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350a2ebJyOhQ86Yx9z2gfk+jG2hn0YREABP7ZUfgejh1DXprAc0icDV2bfWJZ5Ch/UePPyQXivQ==
X-Received: by 2002:a05:600c:2208:b0:3f1:75a9:5c0d with SMTP id
 z8-20020a05600c220800b003f175a95c0dmr10971864wml.26.1682437691910; 
 Tue, 25 Apr 2023 08:48:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:329d:db81:ed0c:c9cd?
 ([2a01:e0a:d5:a000:329d:db81:ed0c:c9cd])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a05600c219a00b003f180d5b145sm15312837wme.40.2023.04.25.08.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 08:48:11 -0700 (PDT)
Message-ID: <8b9243fa-8836-1fb8-4ed6-3d9f611d9c86@redhat.com>
Date: Tue, 25 Apr 2023 17:48:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 07/14] drm/mgag200: Replace simple-KMS with regular atomic
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, kernel@linuxace.com
References: <20220708093929.4446-8-tzimmermann@suse.de>
 <20230425142519.13201-1-kernel@linuxace.com>
 <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/04/2023 17:03, Thomas Zimmermann wrote:
> (cc'ing dri-devel, Jocelyn and Sam)
> 
> Hi Phil,
> 
> I've put dri-devel into cc, which is the developer's mailing list. It's 
> the first time I hear about this bug.

Thanks for pointing this to me, I will take a look at it.

-- 

Jocelyn
> 
> Am 25.04.23 um 16:25 schrieb kernel@linuxace.com:
>> Hi Thomas,
>>
>> I have been trying to track down why we lost console on our Dell 
>> servers since
>> switching to kernel 6.1, and finally narrowed it down to the commit 
>> referenced
>> in the subject (1baf9127c482).  If I boot kernel 1baf9127c482, I will 
>> have
>> no console at all on my servers.  Booting the prior kernel 
>> (4f4dc37e374c) restores
>> console.  The server I am testing on has a G200EH card.
>>
>> There is a bug report about this (not opened by me) here:
>>
>> https://bugzilla.redhat.com/show_bug.cgi?id=2171155
>>
>> but I'm not sure if RedHat bugzilla is the best place to report this.  
>> Any
>> suggestions for a better place?  I'm available for any testing.  I've 
>> already
>> tried simply reverting this commit from 6.1 but it does not reverse 
>> cleanly
>> given all the other MGA changes made after this specific commit.  Any
>> guidance you could provide is appreciated.
> 
> You cannot really revert it, as it's too old already. But could you 
> please try the latest developer tree from
> 
>    git://anongit.freedesktop.org/drm/drm-tip
> 
> The branch is drm-tip. Maybe the bug has been fixed meanwhile. If this 
> also doesn't work, we can take a closer look at the changes.
> 
> Best regards
> Thomas
> 
>>
>> Thanks,
>> Phil
> 

