Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4184BF432
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C6210F396;
	Tue, 22 Feb 2022 08:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954CF10F396
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645520288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFThAOB0om1Crz0H/byAkta7CqdXGPtkBZospf9MuZM=;
 b=XbrkMs9kSjqK+9fcUTxgZ4ZwKh6q+kMDbWo6En83TNfcQftbwzIPKLDHNOX4I7aMds7mCy
 Ep0JsX/4EtOppjJZd049LjGua80EzHsrVd61rs2A4h1mJFqrmlU7ZK1uElzm+nwd4Y5uvq
 fDkHfm+NefFd+pSlfbdZCeswihHqP7k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-CghCtOYXPxaba7oNQOsLkg-1; Tue, 22 Feb 2022 03:58:05 -0500
X-MC-Unique: CghCtOYXPxaba7oNQOsLkg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m21-20020a7bcf35000000b00380e364b5d2so3482wmg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 00:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fFThAOB0om1Crz0H/byAkta7CqdXGPtkBZospf9MuZM=;
 b=YChGVOTWy20+1em8CpA5AZdwiFyeufinrhgH16kroJl3XYsSH7vvBV1HNDw06E4dD5
 /PPKUSUVF44Xlmy+vAQJPlw1LQXZVVNnOYDofBg74NNo7c8/ZO+ULz3IfNTW3RJjKq//
 RwvCX2+1ofiLHnEt39g1aeBFFLDSi3kumUivetZfHFbk+JprAhdeChz8SeLOsLMuqpZY
 DmtkSLRN87fufWIcLGncZxnwtanYhyl0gs23CIAckLERZ3+zeHM4qJGBf/kF4WAihVvQ
 ed0qc+7omiNkSFuMJGw9qfWbU52krxW3XJWkwHrpm/tdA5dAAiHBxmiHzPQheMKYs6KW
 zgrQ==
X-Gm-Message-State: AOAM530C5iL38/Hj7zHuG9s7+acnt/g+kOvTKw6d3q+e8zDpZ4Fxcx7b
 H5ER7JeDCFTlXCUG/21Am9EMH7UjMgsK1yWwbmkuH2MVbf0dfewRo3eQAtVa28/Th7pxOHjddf6
 oNTPDFwU5JXLwV0B4swOvDUFyK580
X-Received: by 2002:a5d:4c50:0:b0:1e4:9e4d:84ad with SMTP id
 n16-20020a5d4c50000000b001e49e4d84admr18660207wrt.305.1645520284209; 
 Tue, 22 Feb 2022 00:58:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOrayZMMZzVoCgCUcLvrKJ7/bZnENYpdZki01c3TcUqtpNh3OSFqxe9MtBhl3gMjO7z3VgFw==
X-Received: by 2002:a5d:4c50:0:b0:1e4:9e4d:84ad with SMTP id
 n16-20020a5d4c50000000b001e49e4d84admr18660188wrt.305.1645520284020; 
 Tue, 22 Feb 2022 00:58:04 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id s7sm23154676wro.104.2022.02.22.00.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 00:58:03 -0800 (PST)
Message-ID: <2e31c34a-ceaa-d18d-b6c9-c07e5c600a8b@redhat.com>
Date: Tue, 22 Feb 2022 09:58:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] drm/i915/vlv_dsi: Add DMI quirk for wrong panel size
 on Lenovo Yoga Tablet 2 series
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20220221220608.12131-1-hdegoede@redhat.com>
 <20220221220608.12131-2-hdegoede@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220221220608.12131-2-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/21/22 23:06, Hans de Goede wrote:
> On the Lenovo Yoga Tablet 2 830 / 1050 the VBT contains a bogus
> 192mm x 120mm size. This is especially a problem on the 8" 830 version
> which uses a 10:16 portrait screen where as the bogus size is 16:10.
> 
> Add a DMI quirk to override the wrong panel size with the correct one.
> Note both the 10" 1050 models as well as the 8" 830 models use the same
> mainboard and thus the same DMI strings. The 10" 1050 uses a 1920x1200
> landscape screen, where as the 8" 830 uses a 1200x1920 portrait screen,
> so the quirk handling uses the display resolution to detect the model.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

