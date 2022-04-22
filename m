Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9E050B726
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 14:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD8110F628;
	Fri, 22 Apr 2022 12:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E5710F628
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650630052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRKnbppmAOmbkwcpiNvJ3BHwVLgfnRqXGZWl72oScEk=;
 b=PHILYEQ2MtXp1/ltqoCcMJ7MAyXuVN5kQrSiV9bFgplS1h7kbVKRPONcKBWKr7wVA9UEyB
 cg1ZGfOzRhgtZsLntgqHaM/5IkJu3zlaY0D52zjgMOWv6bCIgk7LHCkhydqihj15dz94su
 hNajkJ5O0C/n5dreDVy0r1IqPTsoR74=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-k0HluTa2ONOl3h-sigDexw-1; Fri, 22 Apr 2022 08:20:49 -0400
X-MC-Unique: k0HluTa2ONOl3h-sigDexw-1
Received: by mail-wr1-f70.google.com with SMTP id
 e13-20020adf9bcd000000b0020aa78ef365so1867260wrc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 05:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QRKnbppmAOmbkwcpiNvJ3BHwVLgfnRqXGZWl72oScEk=;
 b=E7PSE9zbhyJtljRzlY7zqCIfeUkLWuGc1EQtQYnckRfPEx0TKjYRhWsI42R/OMnxMw
 kB8mkde85pyodq9oGnI+uDZVOzVNEb7di192JdeShXyJh8F0E/tlBuRVcCWU1AFxBSPg
 q6xpCF5y28se8p+1TzmSTCSB9+COG9SjllmPGUQiJ5frKYuAT59HJ4DTykY8DKT65Z8K
 wJ1Cv9sicsFJJen46OHPO1Bh5HTENkBbV3Mq2IFBwKHkhBJBP5LOtdrrTHxLLrjPb3cF
 5fftIRYNVF3d/0jm/n0MH0zVNFbrCQtXREALVry1n2yUXXcKDNcnfi3pFTe8s9vTNyVY
 hbgw==
X-Gm-Message-State: AOAM533OI+ycTtVXeWdh8m6gk3ieXWMwKOE8aeFsMF+RIhdBP1ilFVv6
 yddUBOW3bgbsXHrW5nTO/FtWPa0D9lMzuf0Y5ffpG8i4FHYG69h13N197ugbhwee7RBoSskc79Z
 TNpdz691+XVz8dU7k/VSuDRwpF3Wh
X-Received: by 2002:a1c:3b87:0:b0:38e:ae26:87c3 with SMTP id
 i129-20020a1c3b87000000b0038eae2687c3mr3981544wma.117.1650630047944; 
 Fri, 22 Apr 2022 05:20:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6AQzO0c0BlD9lU5lrP2/rxBPtAzTAzwFhtGkq5YSXxil7kF0pc+ACRC6Q8yEgiY4mRk11lA==
X-Received: by 2002:a1c:3b87:0:b0:38e:ae26:87c3 with SMTP id
 i129-20020a1c3b87000000b0038eae2687c3mr3981524wma.117.1650630047654; 
 Fri, 22 Apr 2022 05:20:47 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b00392ae97b948sm4217102wmo.15.2022.04.22.05.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:20:47 -0700 (PDT)
Message-ID: <e1a5c451-0b8c-6368-61e0-63975cf38709@redhat.com>
Date: Fri, 22 Apr 2022 14:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/3] drm/format-helper: Print warning on missing format
 conversion
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tiwai@suse.com, tamara.schmitz@suse.com
References: <20220421181722.13936-1-tzimmermann@suse.de>
 <20220421181722.13936-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220421181722.13936-2-tzimmermann@suse.de>
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

Hello Thomas,

On 4/21/22 20:17, Thomas Zimmermann wrote:
> Not all possible format conversions are supported yet. Print a
> warning on unsupported combinations.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

