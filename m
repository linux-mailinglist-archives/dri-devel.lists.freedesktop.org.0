Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4A1518ED9
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 22:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62F710F3B9;
	Tue,  3 May 2022 20:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F0B10F3B9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 20:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=syat7YMhuZsVmWB5UU3BjXsEYQfynCb0liib1ovne74=;
 b=OieS2+Cv+Qy/KDYIoALAkRaPXEW3abN9DeDc/bMj2s4wPqxxpYb+irF3juIoB0cX3eohaJ
 vhOCA+P7PcN9Vn4C8jFxv1wa9z2aR5vwMNgBfOqQUlSlfkDSa+DT37FB3rmRoaBMLsiEUE
 I+mwkrzLorkdtl4vu5Xw0Qmm6X7p+PQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-b5iLuOtUMziAraPt-Vv0uQ-1; Tue, 03 May 2022 16:10:36 -0400
X-MC-Unique: b5iLuOtUMziAraPt-Vv0uQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso1834079wma.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 13:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=syat7YMhuZsVmWB5UU3BjXsEYQfynCb0liib1ovne74=;
 b=vFMqX/U6ywK08oF3rvYh4Ij/fOgY54FEhDYvPcoqzrOoDpnkVYK/58hBHXdHD7bXdn
 V9iuKj+wJDj6rSVEod1LxRHFJTo0w7v9A60H9DRc3Cj3BQ8XIvvmEE8hvPoLPHtt0B11
 smwXlIcXnVNYurRR0UaV/QDGf8dG0Kze+0QbVo1mqA90XEhFrUM1ntvARjAJ+Ii2T0J7
 4qpx2Lnd4bzh5ZDCQ9A55n/F3KQAMPaJV3y484nQWJFw3xK7VmLhPcrA3+FS7kkvnJVM
 ZU0KekF6XqAWqnviWkbHOqLRRsFK6GZiZAyZdCRoKKG6hkJ019CiazvSLkq+2MjI4kJa
 736A==
X-Gm-Message-State: AOAM532UvyvBU36QHILIb79jE2RDj4PWhPCsb+JSqNtlap6nKVN31x+Q
 pfjsPTGcjSUXHCQVmCuGePdUkA+KujKL2MxBS9hWyoavWzU71oW1kSIDpV/HdXRsFtGKwE7JP44
 v+Gk/9Cld85iMJr3B+4ob40GYDWOB
X-Received: by 2002:a5d:64c1:0:b0:20c:6ff9:3a61 with SMTP id
 f1-20020a5d64c1000000b0020c6ff93a61mr5677530wri.709.1651608634855; 
 Tue, 03 May 2022 13:10:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxplYC3nN3AU/qbF7B/q23G6fIYuctdgY1cqefQA5M02QsqpsEPVQ8d3IifAGDcAdL4PT0raA==
X-Received: by 2002:a5d:64c1:0:b0:20c:6ff9:3a61 with SMTP id
 f1-20020a5d64c1000000b0020c6ff93a61mr5677518wri.709.1651608634651; 
 Tue, 03 May 2022 13:10:34 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l3-20020adfbd83000000b0020aca418f26sm10156318wrh.1.2022.05.03.13.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:10:34 -0700 (PDT)
Message-ID: <9907fa2f-807d-f07c-152b-e09d35afa332@redhat.com>
Date: Tue, 3 May 2022 22:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] fbdev: Use helper to get fb_info in all file operations
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220503164616.663796-1-javierm@redhat.com>
 <YnFi2nrK0I7893S2@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnFi2nrK0I7893S2@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Junxiao Chang <junxiao.chang@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On 5/3/22 19:14, Sam Ravnborg wrote:
> Hi Javier,
> 

[snip]

>>  
>>  int fb_deferred_io_fsync(struct file *file, loff_t start, loff_t end, int datasync)
>>  {
>> -	struct fb_info *info = file->private_data;
>> +	struct fb_info *info = fb_file_fb_info(file->private_data);
> This looks wrong. I assume you wanted to write:
>> +	struct fb_info *info = fb_file_fb_info(file);

Right I did. Thanks for pointing out.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

