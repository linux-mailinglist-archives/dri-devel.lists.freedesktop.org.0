Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059FF84212D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6C110F881;
	Tue, 30 Jan 2024 10:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A3B112F13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706610234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jt4gc9cNMGeGEZd3+mcsp9v3Xj41BvVXchDqDl7Wcr8=;
 b=PF3niMbaSF87Eu9H6KNcUuFTiiLdHjOW/Lda7yruCIqERod0p4HuhP0QwFt6pjaYdInl/Z
 s4bIZTc1nZefFg4dd4dilhTYtzwdtIb4osjVWUM6wIT8WO5rMAbqDRCDMjN7P5T0dGN4U2
 L5hoMpunhVOxTLz7aIiL9sKGgXgvWH8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-8ERTvClqNrqsu5atnXwmvQ-1; Tue, 30 Jan 2024 05:23:52 -0500
X-MC-Unique: 8ERTvClqNrqsu5atnXwmvQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-33aef86413eso774229f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 02:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706610231; x=1707215031;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jt4gc9cNMGeGEZd3+mcsp9v3Xj41BvVXchDqDl7Wcr8=;
 b=gjx3amceA6t5/nQVADSMtr80o2fIzbB0dzublTPyBGNty5l64Tp062FHtVI/ONm0L3
 bGQQQWYvKokuKwfYzmldAAtucsT/Q0IjNGZdcLQ5EjO9uMJsrrj6LjIJ701NfvtkX6vl
 ydMK73x3C8mngyRUeGYKqZQU7zEjkEoZ2Ir3PAkDOqM2CH4OVeWXQ7G0eOWgOoDWKtuy
 VZ+pRC3+KGeBwMjB8t0DXydpSqubhwp34u5+w4ohnkiLEgZTVwwUDYL4k6rmgS1oPluO
 sW7dHUkluHHH25eukvuBxfcIMCR5UHPdPxnk2S3vxC04EDRiRtFM7moQ9tCi/U/0lWL0
 yrhg==
X-Gm-Message-State: AOJu0YyS24UJ+5kKoatFehoI0Y7m3O+2teFayl1vj5m0J5pEksy4a7LF
 Yb7g6w2x1W5y6J7OUZqlO60yRYxyHIB5msnu7njzNyEf9EE5JwCiPRUd0NuKBllVzYLdXKPe14B
 s/aH1plVpr7AKR8OW/zIt50kgjWQtRV5R3kMeCD+QymuvUk2dbaLdyJJK6Aiz7PmI+w==
X-Received: by 2002:adf:ead2:0:b0:337:c730:d7e3 with SMTP id
 o18-20020adfead2000000b00337c730d7e3mr5555567wrn.57.1706610231611; 
 Tue, 30 Jan 2024 02:23:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF70eoaY+VIa4GGUoctQafkQSI2W9UAxj/xfOjdA+e8CALa0W7RU/iiJwjoHpdQk0U/hsjOhw==
X-Received: by 2002:adf:ead2:0:b0:337:c730:d7e3 with SMTP id
 o18-20020adfead2000000b00337c730d7e3mr5555558wrn.57.1706610231331; 
 Tue, 30 Jan 2024 02:23:51 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bu9-20020a056000078900b0033af35a024csm3694820wrb.12.2024.01.30.02.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 02:23:51 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Subject: Re: [PATCH 2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
In-Reply-To: <7c33dd4c-d178-4b46-b859-f228391e4d44@suse.de>
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-3-tzimmermann@suse.de>
 <87ttmwv1ry.fsf@minerva.mail-host-address-is-not-set>
 <7c33dd4c-d178-4b46-b859-f228391e4d44@suse.de>
Date: Tue, 30 Jan 2024 11:23:50 +0100
Message-ID: <877cjrunk9.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 29.01.24 um 12:04 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>>> Add screen_info_get_pci_dev() to find the PCI device of an instance
>>> of screen_info. Does nothing on systems without PCI bus.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>> 
>> [...]
>> 
>>> +struct pci_dev *screen_info_pci_dev(const struct screen_info *si)
>>> +{
>>> +	struct resource res[SCREEN_INFO_MAX_RESOURCES];
>>> +	size_t i, numres;
>>> +	int ret;
>>> +
>>> +	ret = screen_info_resources(si, res, ARRAY_SIZE(res));
>>> +	if (ret < 0)
>>> +		return ERR_PTR(ret);
>>> +	numres = ret;
>>> +
>> 
>> I would just drop the ret variable and assign the screen_info_resources()
>> return value to numres. I think that makes the code easier to follow.
>
> The value of ret could be an errno code. We would effectively return 
> NULL for errors. And I just noticed that the function docs imply this. 
> But NULL is also a valid value if there is no PCI device. I'd prefer to 
> keep the errno-pointer around.
>

Yes. I meant making numres an int instead of size_t (SCREEN_INFO_MAX_RESOURCES
is only 3 after all). That way you could just return ERR_PTR(numres) if is < 0.

No strong preference, just think that the code is easier to read in that case.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

