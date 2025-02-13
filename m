Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF60A34BD5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C74310EB56;
	Thu, 13 Feb 2025 17:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="frXdMR4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459BB10EB56
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739467530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CK2csrO5H6mC3WrzH5IFyM8cqNr3G9UFtb3V48/7ZM=;
 b=frXdMR4k9oGO5f83Aj+85rAqTp2OR3UZsR9rAW6MPNt+tw3MHdsHcqdL2WI0HOlpB6PYhB
 03hKLl9b5FVGMoLrPgT1HpZgG5umKUs3mBPSbgIdspiDswGEUkGU7MuOVkpaedjhLDvQt1
 BFQXr4cdfPphucn/5/oaEyA9MHMOiF0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-UWJG-xtTP2aDXsTs1EMcuw-1; Thu, 13 Feb 2025 12:25:28 -0500
X-MC-Unique: UWJG-xtTP2aDXsTs1EMcuw-1
X-Mimecast-MFC-AGG-ID: UWJG-xtTP2aDXsTs1EMcuw_1739467528
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ab76f438dddso168234566b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739467527; x=1740072327;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6CK2csrO5H6mC3WrzH5IFyM8cqNr3G9UFtb3V48/7ZM=;
 b=biyPpjjTYlQEufQn1NYwKDy17zJ53IRadh2qu4+DqHosjP2L2dDV9XH6bRbTrmnuT2
 19UvQ5RP0CYaOXxkIQwaZO5C1JCnfMrO/pFf4u7X9+52lKvzLMqNnnX6r3atTPTZ6dWU
 vW0CpXVo6B23CnNDD4lCHka0zgvY3/CCA3ZnH7tZFuAGTwQV6aKYskbzqhscNBgdFDgg
 3+T63LormQPn5qYFAr04IWDJdJhpi6CGABQZhDN4My+mzSxjQOo+Zf5AQG1vFunolV4q
 W3bJvbLKv9LOBCB0sJBtTA4O0sm7lsCTFgVZcpNeabfjNGuySTrxIBoX1ekVEQuyFe9h
 htrg==
X-Gm-Message-State: AOJu0YxNuU0Q26Ao1Y0AQZtIDVXmuqv9zmj/xj9tIRvuoiFz7HOPwqMv
 0Ox6VtQTcWY3yvxRAmyhIfK6e9hXt3StmX6snn0L5EtQDFTHHZPgFAbhcioZ061iRDDguD3eb8v
 qYHz5xSgIXvBlhbKH+GcDxJtX6/yMGmHLl2A3vbGiWteG7nSNluqZsx7MYwdy5Bu6GbIuLNiB4w
 ==
X-Gm-Gg: ASbGncv4QhH/ll/Nm10Dm7Veyi6hLH4RPj4yqGc7okWR2xipC8OIRcuyHok0ydBlBy2
 S6qZaO5dcdNZfovmzdp88e6xRZ3DKByC4vl/dXpRFtfZeBaWXnmFOxn5qG+RZdKwjNB8lePg/i9
 A7nBN0qfM4rLNMv+u4Kv3oKXoqsKtBO6qno0a4LcOQI3hS2EXNPEiBBq0gqyGsUq6vY85kLmBL2
 LeR1p3zbIPxqjyy2S/AcA7S882NpFpat2eqHOD25ikpnF97E1fSiJqcjTwIpurBKE+secbx71Vm
 XKXn4SQfB8o8vUJmfI//uC+GWK/91OK2nmyMCwexy72k
X-Received: by 2002:a17:906:478a:b0:ab7:e234:526b with SMTP id
 a640c23a62f3a-ab7f334ac6cmr931457866b.3.1739467527254; 
 Thu, 13 Feb 2025 09:25:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUkchj4sicMxOpeKshB/bSA/fpqMST3phpX2JSgz9PiYGXPyoXW0PkMToLqwqUjdufm2ujHw==
X-Received: by 2002:a05:600c:4e8d:b0:439:4a1f:cf85 with SMTP id
 5b1f17b1804b1-439580e532amr94391815e9.0.1739467516751; 
 Thu, 13 Feb 2025 09:25:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a056151sm54789315e9.16.2025.02.13.09.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 09:25:16 -0800 (PST)
Message-ID: <44b8b1c1-4d1f-4ae7-b8c0-fba185164c83@redhat.com>
Date: Thu, 13 Feb 2025 18:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/ast regression, when upgrading from v6.3 to v6.6
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jammy Huang <jammy_huang@aspeedtech.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <17831399-4442-433d-a525-723871cbf15c@redhat.com>
 <68c229b5-d435-4a8d-b301-cae913e544e4@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <68c229b5-d435-4a8d-b301-cae913e544e4@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sWGAYyEVOs-UmxMhHaQTopxoxNCl7ST5e1WPkmjDJSw_1739467528
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2025 15:01, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.02.25 um 14:33 schrieb Jocelyn Falempe:
>> Hi Thomas and Jammy,
>>
>> I've got a regression report, and it's caused by https:// 
>> patchwork.freedesktop.org/patch/540015/
>> On this ast2600 server, the firmware says it has a DP output, but 
>> physically, there is only one VGA output.
>> Before this commit, "ast->tx_chip_types |= BIT(AST_TX_ASTDP)" means it 
>> will have both VGA and DP configured, but after this changed to "ast- 
>> >tx_chip_types = AST_TX_ASTDP_BIT" and the VGA connector disappear.
> 
> Having multiple outputs (besides the virtual BMC) was never really 
> supported. DRM userspace also doesn't really support it. You likely 
> remember that we had problems when the BMC was a separate output.
> 
>> The EDID of the VGA monitor is not read anymore, and a wrong 
>> resolution is setup causing a blank screen.
>>
>> Of course fixing the firmware would be the best solution, it's not 
>> always possible.
>>
>> I'm considering different options:
>> - Add a kernel module parameter to override the tx_chip_types, 
>> something like "ast.output=vga"
> 
> No parameters please. If we give people parameters, they will configure 
> the hell out of them and then complain if it doesn't work. And we never 
> get rid of parameters, because "there's users".
> 
>> - Add a DMI quirk, to force vga on this particular motherboard.
> 
> That could work.
> 
>>
>> What do you think?
> 
> I think I saw another bit in the HW docs that hints towards a VGA 
> output, but I cannot find it anymore. Still, I have VGA and DP on my 
> test board. There's gotta be a way of switching between them.
> 
> Unless something else shows up, let's to the DMI quirk. It should also 
> be easy to  backport.

Ok, I will try to make something. DMI quirk is less flexible, but the 
regression is a bit old, so I hope there won't be much other hardware 
affected.

Best regards,

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
>>
>> Best regards,
>>
> 

