Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E83F7E7625
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A6C10E406;
	Fri, 10 Nov 2023 00:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334EA10E406
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 00:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699577915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ay5zviMbfrXlLdZ/mo3Uv4cTClyhHa2CK/lOIUEUxrg=;
 b=GLmZFcWjvvkPu0Xh/tcmYS4xEA4I2w+ivu/6lCZW27yLVPMpZaRDRv1Uc9ahp+bzv8WbEt
 C20JYdGYY6+RKXACvlHbP/xto2e/NFJ8drzN9xX/zOt7wCWodbDd5lUVBTMzAjKD1WGDop
 iu0zvvZsod9YNsw/Kwme81tBvxyZyok=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-PAY9I_TwNlK7VHIf5GQSlg-1; Thu, 09 Nov 2023 19:58:33 -0500
X-MC-Unique: PAY9I_TwNlK7VHIf5GQSlg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4084d0b171eso17644845e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699577912; x=1700182712;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ay5zviMbfrXlLdZ/mo3Uv4cTClyhHa2CK/lOIUEUxrg=;
 b=iaUA0yG9eNwuDiOjDKxhn8YfhC3lVTfcg5gta0YCeTxyL16rlrlLGd7FZwoCfA7G25
 je+oOkctfIkWg3kzu4ECySzp5deMz3rrI5ftdeqiyKgxtWcrp5f3q91hosEsOpCVabLn
 d4ErebedwwQl6YZBWSgmOKArUBDF3ayPURkJ4EVX2q+ae+NfUqzw6xa+XGaRGzgQn+Ve
 dB7HnAlp9GnhqwqdVwrHWADnpJX2jtZ4E8uKhcapu31uoJvyJbyC3kud8k0pMil9LBWD
 ++HLQ2UwALJ/pmZVkzHM4ipXd4Wc9FBHc6AYKo08NKGjdvhTKvd1hGZA3cRlR5nHZPZl
 KLug==
X-Gm-Message-State: AOJu0YyJNcGg7jxh1O2jBYEa8uRV1UWgD6w0yqhS0EaGoK4c5HSk7ckh
 MuepGdIkj/LyYUR2rVwvqigU0mUmFmynriAPXVdoURQg0j+eieJHatefySGTTeXlenwldSERigv
 2BiNBpSn2Vy7G7kYPzOW2E33fQS1CLRaTfvx1
X-Received: by 2002:a05:600c:4fcb:b0:402:ea8c:ea57 with SMTP id
 o11-20020a05600c4fcb00b00402ea8cea57mr1135185wmq.7.1699577912196; 
 Thu, 09 Nov 2023 16:58:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElRuHR4hciNRf99RIIJYz3hpvmtal3mRHmmhAN5vViavliTkYYbMeU6UzDLahcctVWUv1MVg==
X-Received: by 2002:a05:600c:4fcb:b0:402:ea8c:ea57 with SMTP id
 o11-20020a05600c4fcb00b00402ea8cea57mr1135179wmq.7.1699577911828; 
 Thu, 09 Nov 2023 16:58:31 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c445300b0040813e14b49sm3665501wmn.30.2023.11.09.16.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 16:58:31 -0800 (PST)
Message-ID: <0dbbd47d-9a7c-48c4-b984-ef1cdace1f21@redhat.com>
Date: Fri, 10 Nov 2023 01:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
To: Luben Tuikov <ltuikov89@gmail.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231110002659.113208-2-ltuikov89@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231110002659.113208-2-ltuikov89@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/23 01:27, Luben Tuikov wrote:
> Define pr_fmt() as "[drm] " for DRM code using pr_*() facilities, especially
> when no devices are available. This makes it easier to browse kernel logs.
> 
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> ---
>   include/drm/drm_print.h | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a93a387f8a1a15..e8fe60d0eb8783 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -26,6 +26,20 @@
>   #ifndef DRM_PRINT_H_
>   #define DRM_PRINT_H_
>   
> +/* Define this before including linux/printk.h, so that the format
> + * string in pr_*() macros is correctly set for DRM. If a file wants
> + * to define this to something else, it should do so before including
> + * this header file.

There are a couple occurrences of pr_fmt in drm code, but it seems like
all of those are correctly defined before any includes.

Acked-by: Danilo Krummrich <dakr@redhat.com>

> + *
> + * It is encouraged code using pr_err() to prefix their format with
> + * the string "*ERROR* ", to make it easier to scan kernel logs. For
> + * instance,
> + *   pr_err("*ERROR* <the rest of your format string here>", args).
> + */
> +#ifndef pr_fmt
> +#define pr_fmt(fmt) "[drm] " fmt
> +#endif
> +
>   #include <linux/compiler.h>
>   #include <linux/printk.h>
>   #include <linux/seq_file.h>
> 
> base-commit: f3123c2590005c5ff631653d31428e40cd10c618

