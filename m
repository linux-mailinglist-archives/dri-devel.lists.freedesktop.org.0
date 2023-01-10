Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF01663C5A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EF310E56D;
	Tue, 10 Jan 2023 09:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A22210E56D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673341850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWXx46ST0eNXscZuNMexmxZ3GtEyDtW2jwFA0HF6qEQ=;
 b=D57mj4BR6T2lzW8fVSDwyCfSGrfJUTZW+fO0Nlc1iyiZvoeJ1Nc4pxP9+1PNYJDXczbmSc
 vz94ecToE8wwOys1qTwR165tD4GXWVxaYY7Eyz2LODh746QaWlIzVIw144uSzXsXTrRaxL
 4DrZiP0P1mZ2njwDzvRXvZ8udAXwXzM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-450-rWpTi4XpNOucaJjVnVhsJg-1; Tue, 10 Jan 2023 04:10:49 -0500
X-MC-Unique: rWpTi4XpNOucaJjVnVhsJg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m38-20020a05600c3b2600b003d1fc5f1f80so8722302wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yWXx46ST0eNXscZuNMexmxZ3GtEyDtW2jwFA0HF6qEQ=;
 b=L8UmpvFmkp4NsPod4eswNR1IFNV+qZaeKdeamWZ1evq7oIlnfY/YWF2fWDoJkLFfSz
 lMEfnrEJflJp/XIpXzq695Fy9n9YEy8+RZnUTdtqGcytF+2hEtBflVo3zQ8p58THHNxL
 1KIe5QQxC7/9F+Ba741ApYa7AfYOol/8wKfkbmjfgXGmEnZQwECtFtXlnpPT7/KMsJR4
 FnFRPJtVR2B8WYBHwB0ltKREpI/6UioWGQ+5SrnzLcVqbP8R0VN77Y3nr9niaOBR82iL
 WmKH0wSUOf2kUfqrWLmMJ/aMgjZteiKj/g/K9JnYXaiiNQqaKEGGvwwDKWnFWxeo7mTt
 SaEg==
X-Gm-Message-State: AFqh2kpfowhu3Iit3fRmkl3umllAz76rO6exuqexOVi+kJW2niuingHS
 6JRktmLm+ZfwKaYSATtZvfguDeOFDWu2A9Y2f7m34GYKNOHv6R5FWQgsveRPEpsIZ0EBI1CGq24
 PpTsMtlJopM48LhsvTO1OQOC9MxcD
X-Received: by 2002:a05:600c:3d11:b0:3cf:8b22:76b3 with SMTP id
 bh17-20020a05600c3d1100b003cf8b2276b3mr49160601wmb.0.1673341848287; 
 Tue, 10 Jan 2023 01:10:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsxw1W4Slf9AiH0i+Mq5ZqP5Zi07NMRWMijT+CvF5DKIEWYj7uheoX+YrSj17A+rhiHYB0oNA==
X-Received: by 2002:a05:600c:3d11:b0:3cf:8b22:76b3 with SMTP id
 bh17-20020a05600c3d1100b003cf8b2276b3mr49160582wmb.0.1673341848077; 
 Tue, 10 Jan 2023 01:10:48 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q20-20020a7bce94000000b003c6c3fb3cf6sm13902722wmj.18.2023.01.10.01.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 01:10:47 -0800 (PST)
Message-ID: <1b78de44-4bbf-b147-6804-4ce445fc3440@redhat.com>
Date: Tue, 10 Jan 2023 10:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 038/606] drm/i2c/ch7006: Convert to i2c's .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-39-uwe@kleine-koenig.org>
 <20230110090654.ghj6rioikxse33e3@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230110090654.ghj6rioikxse33e3@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, kernel@pengutronix.de,
 Ajay Gupta <ajayg@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wolfram Sang <wsa@kernel.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Uwe,

On 1/10/23 10:06, Uwe Kleine-König wrote:
> Hello,
> 
> I fatfingered my git tooling and got the author of this patch wrong. My
> intention is that the author is
> 
> 	Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>

That's what I thought but good to have a confirmation from you.
 
> and not my other self with my private email address. Tell me if I should
> resend to simplify patch application.
>

No need, I can amend that locally before pushing. Thanks!
 
> Best regards
> Uwe
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

