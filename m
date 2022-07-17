Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDC657770D
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 17:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AEB8F13A;
	Sun, 17 Jul 2022 15:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D5A8F13A
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658071494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggJJhj6z9FjNRQKXIwP87QT09TGuW+KkdDrUhWIYzLk=;
 b=UL09gpwJMP63rtrt7/6dhu5CthxjUW1w7IBNp/F6GsW5I3rvxsLQEp2w5v6fhZ4blNeb0Z
 Nribds6500E2WLCFsOcglU+70B59azzQSWjRcx7XPGZTO4x9MFMToPEWBgNqNRrKotNv5S
 5urgUkwXLq2XYSkozQAMRNPRHbDuZCg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-E9M7BHFtMJ6UmWEL_XxGjA-1; Sun, 17 Jul 2022 11:24:53 -0400
X-MC-Unique: E9M7BHFtMJ6UmWEL_XxGjA-1
Received: by mail-wm1-f70.google.com with SMTP id
 c126-20020a1c3584000000b003a02fa133ceso4437903wma.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ggJJhj6z9FjNRQKXIwP87QT09TGuW+KkdDrUhWIYzLk=;
 b=LZTaWqvZdqDFWrn6tYMROyHDwuOJ7Zd4g+pK/1pqOvWf2w3xr92vAkZdD3lYaTFSCt
 yJozvOM+i6x4OxH7rQiQW31LgVUAa+NeCIopnVQplteJP/s5OylQfWWfXDUfuF2sHRxm
 Cm5pduLwG6Cnyp8w576Qc7nAIsQwAJj5zNvCfEWXXlN4XdQlVoRB0zZ3AGrPA8OBJsP3
 UKUd5UItL6wnJ2RBEBd054zqZekkDwqMYKGeuf8G6WNNPgdmrbrVqg5GUXhJb66fRT79
 m6kZd7RnThp8ejcdxES1P+mQ8GXE2s6wOzGBkKVq2SrTr6VMMTFYdKo41Si2VgoAJZps
 iPGw==
X-Gm-Message-State: AJIora9EYe6rk7eyw3z+iIo0meI9fva6rm1hURySMA0e+UpxtPjy3K94
 ZHaIrPUCMUg3wosoONhbpLUawhR5QyMBeDJvHNAdASgfF99a/lrYHaLUJMC+Mz3qSdtSaZ6wtnD
 UQZ8LctkwQ/EhA9XdLStVMt1lXE/Q
X-Received: by 2002:a05:6000:1f19:b0:21d:a50f:212d with SMTP id
 bv25-20020a0560001f1900b0021da50f212dmr19850083wrb.578.1658071492132; 
 Sun, 17 Jul 2022 08:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v7OL/cFHhy7wufJ+10+AI2MtFM9Oi0CqUGqK5vC2JCi8v+caji0UqZwMN52r8b8on4XA2Ekw==
X-Received: by 2002:a05:6000:1f19:b0:21d:a50f:212d with SMTP id
 bv25-20020a0560001f1900b0021da50f212dmr19850077wrb.578.1658071491967; 
 Sun, 17 Jul 2022 08:24:51 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m6-20020a7bcb86000000b003a2d6f26babsm12125756wmi.3.2022.07.17.08.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 08:24:51 -0700 (PDT)
Message-ID: <9b945766-7926-0025-1091-6f70ea2ce2e3@redhat.com>
Date: Sun, 17 Jul 2022 17:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 07/11] drm/sis: Move the sis driver to drm/dri1/
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-8-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-8-sam@ravnborg.org>
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

