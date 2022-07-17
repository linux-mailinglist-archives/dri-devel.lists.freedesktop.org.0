Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4215557770A
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 17:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2F690FBF;
	Sun, 17 Jul 2022 15:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2EA90FBF
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658071400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggJJhj6z9FjNRQKXIwP87QT09TGuW+KkdDrUhWIYzLk=;
 b=Ts+naABPd4cDGBjBpM77isc/xGyQxw+cBQ3YikvxmVmE3Bm71MGA4YTkiLMhxNJPWpU6cX
 8DADz6DvQp7T6Zi0nR+aDYaR+YFI+bGuQ1io9d4od+ZAjNFKeZGHMSQZioBbkeHdr1fxVz
 HPjenVvZn9bOejky3PSaYWXH7hG2WwI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-mTkQROghN4S0yOjt_jmc6g-1; Sun, 17 Jul 2022 11:23:13 -0400
X-MC-Unique: mTkQROghN4S0yOjt_jmc6g-1
Received: by mail-wm1-f69.google.com with SMTP id
 h65-20020a1c2144000000b003a30cae106cso3929913wmh.8
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ggJJhj6z9FjNRQKXIwP87QT09TGuW+KkdDrUhWIYzLk=;
 b=l8dzxeJ09FNXq8IyFwnXkWJab/iry7Sy59dPk1XyUAcxtqNFqQF2Fm7+8y2d0IXWpM
 /lRjH2wQZuZCxFAVgZq34851Y6Ddo6NSX5fh42HmFmgd9I2cDFqip4aSp9BzGcyZZphY
 MWOJVcicDl1f6rEvE/uPS0hO2dgrqHh7NLjEN3rsicEuTOr11LOiXfZRJudr1DWKM6Ca
 DeaZ8cKhyy35nZUmNjiTW5eD4YQxK258oJpHXWKkMG1QkiyrQEaFjEDJtcVkI+LMaeMp
 Zpb/O67SqYa6Cc6l4sN3p8kD+Ehj333XupolLjhQ8riHcXLhXCibhEMUnXXhxHY0Obzo
 wkdA==
X-Gm-Message-State: AJIora96QZOCO8xD1RHxJ2PTYSqCoIQjqxuLFLvf7miBJ8QPbdcvMA/k
 Zazt4tZtu39LIoRtjK3Py65oFr6QndVUtvFkKkPF8RjWuV6F2c6YhazKP25aMeONBlat/UxTKCT
 DbB7LxsxiY9Av99ll600WVRocbs36
X-Received: by 2002:a05:6000:1446:b0:21d:cfe1:67a0 with SMTP id
 v6-20020a056000144600b0021dcfe167a0mr9949092wrx.91.1658071392676; 
 Sun, 17 Jul 2022 08:23:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ukhFutNfCzgHL1igMDHQGSoqomU3h2hQL4WIDZthBxyBbVSUhJdt17p4QSO8BMBxun657fqA==
X-Received: by 2002:a05:6000:1446:b0:21d:cfe1:67a0 with SMTP id
 v6-20020a056000144600b0021dcfe167a0mr9949081wrx.91.1658071392463; 
 Sun, 17 Jul 2022 08:23:12 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h7-20020adffd47000000b0021d650e4df4sm8631099wrs.87.2022.07.17.08.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 08:23:12 -0700 (PDT)
Message-ID: <ee059fec-2680-fcb4-f400-09f0222ec24c@redhat.com>
Date: Sun, 17 Jul 2022 17:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 06/11] drm/mga: Move the mga driver to drm/dri1/
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-7-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-7-sam@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/22 20:17, Sam Ravnborg wrote:
> drm/dri1 is the new home for all the legacy DRI1 drivers.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

