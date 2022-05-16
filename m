Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F6528576
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD1211232E;
	Mon, 16 May 2022 13:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3F511232D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652708137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKCLBLLziy9Gr3msOGYNq4jdPh1exKDkN3F+S6rGo+U=;
 b=ag6BrjnHgSaf2qc7kw/E41NAQtdb3guVpYF3i8uCWQ0rVEPEiI9/MY8UWgR8tEPedNNA5n
 FAr4RUJsCi3NuJDTk8B1jdl3pa8aVvIYaD6ekf1FmoUvBjr/CPruY4DTihzH/JTtce9DDR
 67VLC1LRM9M00HO1zz7b77YtpA/YIYA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-5wLH94tgM5OxcHGsymDGMQ-1; Mon, 16 May 2022 09:35:35 -0400
X-MC-Unique: 5wLH94tgM5OxcHGsymDGMQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso10372119wma.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 06:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zKCLBLLziy9Gr3msOGYNq4jdPh1exKDkN3F+S6rGo+U=;
 b=q/b3pq4BeujAo2fDNTzuP09fN4XKPuOpQCPEdcw1rsej0yPFFS+jpwUMhF9oZM5+9d
 /5fQsCcpJEIe059P25Cdqn/ALpptcGJzLJq49c1lW9WabVFKYhycyYI0f3xFGBEwA555
 EVQ5p0fPxtixnwUeM6YjUdDdvPDB+or4CYYEVeag50NeA2Eez3v1YzTJDUSyYbMz6eFM
 l7l9arWZ8ooR4H5F0Ja8yiRi6hAXhtSDS32bclcOsRj5bLDmQ+/8NByiNWlzFdRgpgGw
 JGMt9DqFZkRTqUDJf5UcVW/7WnYzqG9Xj5htJzLZSa5wwE2H3O0A66bC+LnvNqtZzNwP
 Xryw==
X-Gm-Message-State: AOAM5325yRmU+vS6OtpesGlY60guG5SXN3i/h+DeFNSUsMm3eF6DnCXm
 WpyzNlhNCAbt9zkhnyH++CHfoqU7c6ctQsqrP3zdnR1fOuTPt5JtP6TkCN/QfT/1kO5Ba7xhlTU
 Ux/Lzs09vcdjnCFj65AUn4rqhdrZ8
X-Received: by 2002:a5d:43cd:0:b0:20c:fdbd:8c11 with SMTP id
 v13-20020a5d43cd000000b0020cfdbd8c11mr7847215wrr.7.1652708130661; 
 Mon, 16 May 2022 06:35:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsS5fLjWjbHFAe9B1P7edwVqgR+0w2Pdgg31xhtEAujTX6OhWSa0YNl1iUmgZp38U3PRNQ8A==
X-Received: by 2002:a5d:43cd:0:b0:20c:fdbd:8c11 with SMTP id
 v13-20020a5d43cd000000b0020cfdbd8c11mr7847196wrr.7.1652708130474; 
 Mon, 16 May 2022 06:35:30 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003942a244ebesm10608762wms.3.2022.05.16.06.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 06:35:30 -0700 (PDT)
Message-ID: <edf3ee7b-9883-b4d9-7bf8-1380300dec28@redhat.com>
Date: Mon, 16 May 2022 15:35:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] drm/gem: Warn on trying to use a non-existing
 framebuffer plane
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, christian.koenig@amd.com
References: <20220509081602.474-1-tzimmermann@suse.de>
 <20220509081602.474-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220509081602.474-5-tzimmermann@suse.de>
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

On 5/9/22 10:16, Thomas Zimmermann wrote:
> Warn if callers of drm_gem_fb_get_obj() try to use a GEM buffer for
> a non-existing or unset plane.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

