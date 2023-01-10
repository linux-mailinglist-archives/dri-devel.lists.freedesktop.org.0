Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF56B663D95
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18DA10E587;
	Tue, 10 Jan 2023 10:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40D610E58A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673345484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ksSvI6tffvqfkT2KgiYhPjAggw+4IOeouLwXWNniZWo=;
 b=eQYtw3yBpfBBxhI8zkWTp5BgVovu3wa2UXt4c5b59pk9yVDfB8qTSWqZdYOKdHFlG5WvsC
 aRrniuS3VSCjeKg9b58+nfI0h/O4qfd0c/Tx4ocHAIrIkRJhIjSKl7qJIhl/hdIY1JrkXv
 hFfEmdUnGk+mUn0TQgSXlZVPLqgbukk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-9EIQbPm6M4GLXfUXfiyDNw-1; Tue, 10 Jan 2023 05:11:23 -0500
X-MC-Unique: 9EIQbPm6M4GLXfUXfiyDNw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c66-20020a1c3545000000b003d355c13229so8799832wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 02:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ksSvI6tffvqfkT2KgiYhPjAggw+4IOeouLwXWNniZWo=;
 b=eouUshden+L0cIXJQGcF7O/S3STvTL9yGgMVMJEyMOG1CBxWMeDOd6tBOW/fipqaK3
 G+j5MgHJdE5oLVwlTz2rbaMXQ3JqAmlRHqte6uamjwe/bgwDNosHPVdbAZWFUf3yPfz9
 QnjYp9YEoww+QkqcQ8dmu0Is2Pt8iHBfg2Cog2hWlJFk982CU+aOXalsy31ACDE+KZ8t
 2Dqs9bMpH2qGCSkTdO3rOuloLvZ1Hy6mcH16j9LztCT62GXyjXd/gK2Wq3bge7/6XHoT
 ub7U0Y/o5sd/V/wzdUpvmFyEsI7No9IPRWcxXn6W1FbBL2zugbLI3lw4Ty1bwmI2pZ4B
 NZQw==
X-Gm-Message-State: AFqh2kpJ0q1OJN/NjkCvWdD4e/TvcQAmBCmUgmZPGQ7b/Qm8AsRQQ4XH
 iHrvDLshMq7Q9ev7JwFqQD3tQg8W3qwNR4FkN+Q2JDztLPoTATA9EXdDsd3Rp5TsgOOAUrw6O0x
 mcYi5WOPS7uKz/ZbzfHKmb7+sF9O9
X-Received: by 2002:a05:600c:1e18:b0:3d2:5e4e:701 with SMTP id
 ay24-20020a05600c1e1800b003d25e4e0701mr48749919wmb.31.1673345482604; 
 Tue, 10 Jan 2023 02:11:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtwdRe0FzupWB3fiAxpuXEJ0H5IbmAGHCSf95dKcrh3YBxCSYr7tLCXwN6KMl3SEALYVsCSjw==
X-Received: by 2002:a05:600c:1e18:b0:3d2:5e4e:701 with SMTP id
 ay24-20020a05600c1e1800b003d25e4e0701mr48749904wmb.31.1673345482430; 
 Tue, 10 Jan 2023 02:11:22 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z25-20020a1c4c19000000b003d1e1f421bfsm18584114wmf.10.2023.01.10.02.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:11:22 -0800 (PST)
Message-ID: <d2315ac5-2129-feed-d7c5-8dec5c5da4e2@redhat.com>
Date: Tue, 10 Jan 2023 11:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 040/606] drm/i2c/tda9950: Convert to i2c's .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Peter Rosin <peda@axentia.se>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-41-uwe@kleine-koenig.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-41-uwe@kleine-koenig.org>
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
Cc: kernel@pengutronix.de,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/22 23:36, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> --
I've pushed this to drm-misc (dri-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

