Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBBC812BF4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 10:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A88110E06D;
	Thu, 14 Dec 2023 09:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A945610E06D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 09:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702547330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aac/fS+HABTTdTt9Tjp0/ej5UaiGQ4YUyORo11HpcO0=;
 b=F4xp4/2I9DPL5e0cnrcWGagZNB3xkuv8HqlAFnoECAO2Wk/Ma2nklUVXuigh6C0+uv17kq
 vMbEFzszGtF5Ai721kT+AeQPEP+Om63JS+X8OuhadQB165Voghs/lptiGAYd8UAn1v4rjo
 IaWytgFVNSiIvw3vqFm7TKZeE3DYfKI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-ht0tVaufMCeqygl7YoQdPg-1; Thu, 14 Dec 2023 04:48:48 -0500
X-MC-Unique: ht0tVaufMCeqygl7YoQdPg-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-551da4f37baso1226235a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 01:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702547328; x=1703152128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aac/fS+HABTTdTt9Tjp0/ej5UaiGQ4YUyORo11HpcO0=;
 b=sv21QZFSanmFUPBnw3zdS1CoAG88ox2FgGxOi3/2+qteitVMsxd1b+lm9wAD3tY/nk
 QiEBGfsvtVkxak2TQNyE/dc8BZAqwX5c2f6JSihNDhb3xiVdC3cr1veXI/0H1yNJ0ilz
 94SOYUEtKGlLECGuuZ0kHq0EY/ZSQRhHH0ppHpilkMDhH9yvgRo1cMEoCeu8zW1OXLrT
 zp00TifskJbyWL/EwYUetbSU9E8zwa2Y3MTlNtJWsyC7kRBiAXv8iX9ekAWKIaYI0CXM
 XpdZHEgS6GpAUoHZ8ki7wQPJYt3p90XzfGxOQ6RIg/PVw67nymdsB1dzWrIxXx6hez5F
 CFBw==
X-Gm-Message-State: AOJu0YzIiyWrXiP8fVFH9caJT7/vSeCmGjJ1oINsPMqPupxmxwmPqr8u
 XH6f7sp85I7qdMzho3UCo3qVoiMPs2WF/uYMKblZX6sez9FXezf/MHA++XYg0Eg0bq5PpKsVfV6
 X3FsF2z8wVEGmeWXnUSIclLz679+Y
X-Received: by 2002:a50:d692:0:b0:551:e5ea:cd32 with SMTP id
 r18-20020a50d692000000b00551e5eacd32mr1623886edi.23.1702547327863; 
 Thu, 14 Dec 2023 01:48:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfAPTl0ZBTHUgp9clExLMwVaQJM4BXpD6DoX/3U7sXNMttZ5MP+uupqGj8TWjV6I+QQzg05Q==
X-Received: by 2002:a50:d692:0:b0:551:e5ea:cd32 with SMTP id
 r18-20020a50d692000000b00551e5eacd32mr1623879edi.23.1702547327612; 
 Thu, 14 Dec 2023 01:48:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a50cb8d000000b0054cc7a4dc4csm6427998edi.13.2023.12.14.01.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 01:48:46 -0800 (PST)
Message-ID: <a65ca848-20cc-4794-9731-c84eaa295fbc@redhat.com>
Date: Thu, 14 Dec 2023 10:48:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/simplefb: change loglevel when the power domains
 cannot be parsed
To: Brian Masney <bmasney@redhat.com>, deller@gmx.de
References: <20231212195754.232303-1-bmasney@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231212195754.232303-1-bmasney@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, treding@nvidia.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/12/23 20:57, Brian Masney wrote:
> When the power domains cannot be parsed, the message is incorrectly
> logged as an info message. Let's change this to an error since an error
> is returned.
> 
> Fixes: 92a511a568e4 ("fbdev/simplefb: Add support for generic power-domains")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Thank you for your patch. I have pushed this to drm-misc-next now.

Regards,

Hans



> ---
>  drivers/video/fbdev/simplefb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index 6f58ee276ad1..028a56525047 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -470,7 +470,7 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
>  		if (err == -ENOENT)
>  			return 0;
>  
> -		dev_info(dev, "failed to parse power-domains: %d\n", err);
> +		dev_err(dev, "failed to parse power-domains: %d\n", err);
>  		return err;
>  	}
>  

