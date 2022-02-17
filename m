Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B021B4BAC49
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 23:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACAF10E85A;
	Thu, 17 Feb 2022 22:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE19B10E85A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 22:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645135631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuzbAgfBUs+GGmcDHk1SP5I1OwA60aRZofQ/Aft7sBE=;
 b=fZVUQ3eyzPQReKXf42E81f3c2NgcAZULeYkr9L5gCOhu2WkLgvJ5bqEDWA3F24m8w7W3tH
 gGRdP7LUBLJUikDvrQsms7yMI3JhsZHiI91+zqbr3BNdP/puBKH+lMp0YZP56HoPWq8Dfl
 qtau+Ar8DroskkinhGgU20DBjECtGr0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-UEfNl8OyOg68Fqz4n1KEbA-1; Thu, 17 Feb 2022 17:07:10 -0500
X-MC-Unique: UEfNl8OyOg68Fqz4n1KEbA-1
Received: by mail-wr1-f69.google.com with SMTP id
 q21-20020adfab15000000b001e57c9a342aso2877188wrc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 14:07:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xuzbAgfBUs+GGmcDHk1SP5I1OwA60aRZofQ/Aft7sBE=;
 b=vX44EjlTI9pmxqOxKwjgRaZ1SKB3C9ws8BbrOX5i63pfMw0yLA8K+F6SqQ1j/NgVNV
 JzqrbB3oFKYt2eXoxA7muvVgUgLP1OSZWYS8gO0Y7uSbcEHGm0CCBhLp225HDAZ+JhOE
 C8SOAu2/MfopMcWPDjxEB6DKdZ9E7W2samo5F1UEQj/7SicjXrPVCNyJSesZ25SyVLRK
 yPFdqlE+Boe/K+TYdqiNkZ4V94BPyJf89Lddc9H0l5g99UDJYTy7PoXdJO+zC4ZiKDFQ
 EJ+y1JrlmDaRG3fnrEvMzi9U5TzlZrtz4yuSSba1QSLHw228ecedyEPDcQgjGbkw5P+H
 R0aQ==
X-Gm-Message-State: AOAM533ZG8zweYfmiRLeNINy6JLGOecoLbRNu6784FTZEMYJXdCWyvAn
 4chjiauuFMW0B0MXGuQmvFShRALSayOfs6Hcg3KRuo8v124uwa4vIcK6oyimfiZgf9WaMsO5m/R
 wq9XGyImpd9eXXViF83WoI3u3u3wi
X-Received: by 2002:adf:812c:0:b0:1e1:f5e2:b9d4 with SMTP id
 41-20020adf812c000000b001e1f5e2b9d4mr3709152wrm.543.1645135629031; 
 Thu, 17 Feb 2022 14:07:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdFHmAgPNbeSaTHEGXJ51lym1nNwRWWPJBAFPGQDqTV8gLklBlQcV+qx43T3o5xK4Q+lCWgA==
X-Received: by 2002:adf:812c:0:b0:1e1:f5e2:b9d4 with SMTP id
 41-20020adf812c000000b001e1f5e2b9d4mr3709142wrm.543.1645135628861; 
 Thu, 17 Feb 2022 14:07:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id k28sm2789703wms.23.2022.02.17.14.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 14:07:08 -0800 (PST)
Message-ID: <e884992b-967f-4e57-72c9-70c50f259cc8@redhat.com>
Date: Thu, 17 Feb 2022 23:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [drm] *ERROR* mstb 0000000057b5b857 port 1: DPCD read on addr
 0x4b0 for 1 bytes NAKed
To: Lyude Paul <lyude@redhat.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel.daenzer@mailbox.org>
References: <47101f87-48d7-0c93-adbf-9b84cd3754a3@redhat.com>
 <4c5c5325-3e6d-d1a7-bc4d-c38ad769701a@mailbox.org>
 <302fe05b0ef4739a131fd6cc7d33272014d4b6bd.camel@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <302fe05b0ef4739a131fd6cc7d33272014d4b6bd.camel@redhat.com>
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
Cc: Richard Hughes <rhughes@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2022 19:15, Lyude Paul wrote:
> Hi! Sorry for the late reply, I had to take some time off work unexpectedly.
> This is normal (although not great TBH, I'm not sure we should be printing an
> error message for that), it's the result of fwupd trying to probe the MST hub
> to see if it's a specific Dell dock that can receive updates over DP aux, but
> it's not smart enough to know it doesn't need to poke the DP aux ranges of
> downstream branches or non-MST ports in general.
I think MST topology is not exposed to userspace, so it would be hard 
for fwupd to be smarter than that.

> 
> Would definitely accept patches to make this a non-error, or at least make
> this a non-error when the read/writes come from userspace

I will try to provide a patch for this.

Thanks,

-- 

Jocelyn

