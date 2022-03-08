Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4094D1F31
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 18:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F5110E414;
	Tue,  8 Mar 2022 17:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623EC10E454
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 17:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646760995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWLYdwevdepBzx0X1glUvwId31sNoQVYJST0iSmDSu4=;
 b=eTCK28cnD/1qZMjI3+wPWzI2YYxf8qFTuhiZno+3kjto/VnAkXCa4GrOVMA/TC/PbMnize
 Daymjp9u/QGxCr9nMYJb6Te/YyoVacLs7t6aD5eIW1y/cZbL5nEqPFlS0I1zxJoMra4dK0
 PEH+g/O5CHQ5x+hsImqqKXLoaYQxXrE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-wQi4lDvZMkSiJ16wbkIXkw-1; Tue, 08 Mar 2022 12:36:34 -0500
X-MC-Unique: wQi4lDvZMkSiJ16wbkIXkw-1
Received: by mail-wm1-f72.google.com with SMTP id
 10-20020a1c020a000000b0037fae68fcc2so1436768wmc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 09:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TWLYdwevdepBzx0X1glUvwId31sNoQVYJST0iSmDSu4=;
 b=bBj8gqFG+2XWHsF+0Ib4oHpmBNYaXL403XsSbUrQlR+ACOkA1pJ6JQjqJjbTrvy8yI
 J8D6UC/uYUCYvrEMcJuf1Ks9x9Tp6l61/Je6Pez2m5oYaJL2R1LbgxQEOm232TaoQOhT
 rNt/OXrup/2OC48CyaaC1XWZpb/+UbYbc+Up/NUdBVpPoE/hlHcKfpCbTGh2bPZWhS34
 M6en5bSKfe+iBjXHBS36Gzykwf1Nb1HatCyS6bFgvy0n310uTJ2UYUXBsf0fXWYfyIc4
 ftijR8IaGuO3fcFTZBFXuf0SKOZyuvlzhTSOv9wLdnO0/IRcYcxrbah+GBp1ETIm77vL
 T62g==
X-Gm-Message-State: AOAM531FtQwhEZYqp4LBDPcV5rvoLmwspfR5bc2/79UTSUYT3lszwYvB
 Bljg15S9FLzXjxhqWHEx3hpV+DFd3qSft6Mt+piWwiNIQrczwrO2D5wMrHSJCXea7oCtpTk/yKm
 wQnVUqV+R2/oaHPAokeJgfT3eFG9T
X-Received: by 2002:adf:a341:0:b0:1f0:1a12:8920 with SMTP id
 d1-20020adfa341000000b001f01a128920mr13798454wrb.100.1646760992901; 
 Tue, 08 Mar 2022 09:36:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxun/q4GEh8tpJ7AT1flRZIvX5efklF9A8vrPY/7OjKPozKYFDpKU61OhOKqIuRAHEieRC8Pw==
X-Received: by 2002:adf:a341:0:b0:1f0:1a12:8920 with SMTP id
 d1-20020adfa341000000b001f01a128920mr13798437wrb.100.1646760992722; 
 Tue, 08 Mar 2022 09:36:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d5985000000b001f0122f63e1sm9408127wri.85.2022.03.08.09.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 09:36:32 -0800 (PST)
Message-ID: <45beb705-57f2-8574-32b2-7ffe8300d990@redhat.com>
Date: Tue, 8 Mar 2022 18:36:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/mgag200: Fix PLL setup for g200wb and g200ew
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220308171111.220557-1-jfalempe@redhat.com>
 <YieS530V0nGYydGa@kroah.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <YieS530V0nGYydGa@kroah.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
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
Cc: dri-devel@lists.freedesktop.org, michel@daenzer.net, tzimmermann@suse.de,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/03/2022 18:31, Greg KH wrote:
> On Tue, Mar 08, 2022 at 06:11:11PM +0100, Jocelyn Falempe wrote:
>> commit f86c3ed55920ca1d874758cc290890902a6cffc4 ("drm/mgag200: Split PLL
>> setup into compute and update functions") introduced a regression for
>> g200wb and g200ew.
> 
> No need for all those digits in the sha1, see below:
> 
>> The PLLs are not set up properly, and VGA screen stays
>> black, or displays "out of range" message.
>>
>> MGA1064_WB_PIX_PLLC_N/M/P was mistakenly replaced with
>> MGA1064_PIX_PLLC_N/M/P which have different addresses.
>>
>> Patch tested on a Dell T310 with g200wb
>>
>> Fixes: f86c3ed55920ca1d874758cc290890902a6cffc4
> 
> As per the documentation that line should read:
> 
> Fixes: f86c3ed55920 ("drm/mgag200: Split PLL setup into compute and update functions")

Sorry, I will send a v2 shortly.
> 
> thanks,
> 
> greg k-h
> 

