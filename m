Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99845EF6D4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082AC10EA7E;
	Thu, 29 Sep 2022 13:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F07910EA7E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664459078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHNsCykgAa1JQxmqworACiATLTy2P3UpVVbe/oIjkDE=;
 b=Kk4aZgkJXGmrzMTn5+nTK5hpZKUtWujQ4fkUKn/5D7gX9wt8kKnVq7GQ4GCarXQPmiu7+6
 736hrh60rhfWiaUMUETeXq7YsEBP57//G1/UMqVe2SbYLnUra6lTSvFQP+VMhKhLf2/hrR
 1Lkjo3YRTE1UiKmwXW+Btj7Innvb1+g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-8txBreEMOeOEBeYPlbXuqg-1; Thu, 29 Sep 2022 09:44:37 -0400
X-MC-Unique: 8txBreEMOeOEBeYPlbXuqg-1
Received: by mail-wr1-f69.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so555837wrg.21
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RHNsCykgAa1JQxmqworACiATLTy2P3UpVVbe/oIjkDE=;
 b=rjiRAc7apS3I+mN6XIIsujgNh1pyYPdIHN75ZJx5D0MRSbozygFHisFIaAosgtBEyx
 YM2JNavi1G6A6QXDWPhyGtnGsXbpKmRcy1X73nGqRiFZ0VocMXESbziUYMUbkd5UbhYQ
 U8l9i9jwAB5C2Juh6FS3XTjVWZYoYTo3M+SvMU8+XuIrtWwxXRQ3NtDBPyxAqeao50Gf
 FHo0W9iKZB4nVFMO4XNpEONQm9E7acYwVqyldco28o+Hiq+BNv35SD0KdelsICoSO/Jr
 ZJ9HyzaGZB+Q+mEJbL89jcTy6Syi70ihVTNCSnniCEwgwmONJVNU4VFuU62ZFH0r0CpJ
 d9wA==
X-Gm-Message-State: ACrzQf2d4xhchj7kPNO+BWmS5Rjmu3r32ujhTHn9z+bTwgRNbHoI3f6c
 EVEN3CCpduKOSMn4uAzcF8JlbnPzTr67rCY8L1V4PjLH+u47GF973h7OAlwUwHMFTi0sMbUuEpP
 n9lBqsbJXBQNOA8rmAfHJcmhGrRBg
X-Received: by 2002:a5d:5b18:0:b0:22b:1c7:6f8 with SMTP id
 bx24-20020a5d5b18000000b0022b01c706f8mr2407989wrb.502.1664459075855; 
 Thu, 29 Sep 2022 06:44:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pfQGfn9dTVNQ0MZSR3UAEkfaKblmbqvxv5oYla9n5C/yhxaZLZCUAJidFm0EuBcFhXKMF9Q==
X-Received: by 2002:a5d:5b18:0:b0:22b:1c7:6f8 with SMTP id
 bx24-20020a5d5b18000000b0022b01c706f8mr2407968wrb.502.1664459075500; 
 Thu, 29 Sep 2022 06:44:35 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c15-20020a5d4ccf000000b0022b315b4649sm2043254wrt.26.2022.09.29.06.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 06:44:35 -0700 (PDT)
Message-ID: <b8afe143-3963-2342-c499-da5a04fdacd7@redhat.com>
Date: Thu, 29 Sep 2022 15:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 04/16] drm/udl: Various improvements to the connector
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-5-tzimmermann@suse.de>
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

On 9/19/22 15:03, Thomas Zimmermann wrote:
> Add style fixes, better error handling and reporting, and minor
> clean-up changes to the connector code before moving the code to
> the rest of the modesetting pipeline.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

