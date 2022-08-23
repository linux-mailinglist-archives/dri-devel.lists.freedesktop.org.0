Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2CA5A02B4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AC8C77DB;
	Wed, 24 Aug 2022 20:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39604AFEE6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661239200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hs7LaJusbzewq19gjdvDDnrR8mb0KyO4+8e+b1s4GsY=;
 b=h+e8DJnJnvHvQMoTbQz7Z3i4Ep9GMA1Q7KnjkEIjTWlsHClQCNRT3Y63EgImUUBdJcDWI1
 HuYYXjXUM/tcUP+sBihRyC4PomJf2PkRN873A+LQYoUoLn0GNl+UaaNWvOHrQXLYwyCxlG
 mY0IQtX3p9YI8CCyx2jfBfUTTin5Bv4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-0-Lzq519MVyGO_czPDdgzw-1; Tue, 23 Aug 2022 03:19:56 -0400
X-MC-Unique: 0-Lzq519MVyGO_czPDdgzw-1
Received: by mail-wr1-f71.google.com with SMTP id
 t12-20020adfa2cc000000b00224f577fad1so2004724wra.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 00:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc;
 bh=Hs7LaJusbzewq19gjdvDDnrR8mb0KyO4+8e+b1s4GsY=;
 b=l1af6DQrPcaeQpdKfUQl6mztJcYwv3lVYeuA8AQ7pmlW8Pgb9FvGn1514nR3LrKlMN
 XfzFkZsgYx2OFPuHjQzCAVOouIhFQNsXHTesWEkc2mqPv07O/+NnPPt2AWmRWlpPI9DW
 TVymzAquEyrj0RmaEHGuX8rpTjgrRkp/pT1Vd1BJSkoCSG3500c/js8zOU7ZE8zh9Mw1
 LNKiOIPsMAujFDiLc1VaoHR61YZ4qTRgy4moWAPrzCj/thaweFXRbvCQe1k9fq/QYG1T
 SeBOvqGjR0p4tCFsyEdk26bZrHEaLmFbNw8mjrJthLJR6TJE17J6+yMjfFaJHO9cA5Dy
 2CKQ==
X-Gm-Message-State: ACgBeo06yf5893NywEYH87q10XDPgEne2gjW5LGjy1VVj+Icwp1tpB0H
 fGsqO8HqV8qzr2Epx8V2xZD4hwhQsUsS4bIYIRv7p0E9hm76Ks6j6NlAQdgeVoFJu/vm5zlm6h9
 kI5tBTMSc+FarBuCMoBPDmMprceiB
X-Received: by 2002:a05:600c:4e45:b0:3a5:f383:b917 with SMTP id
 e5-20020a05600c4e4500b003a5f383b917mr1191623wmq.61.1661239195844; 
 Tue, 23 Aug 2022 00:19:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7PodDLS/vNSvRNlNhwQt9d+MLAK2dUzwryvTeI3ossUG3lgTEZFazWxtHKJSxP9A6EWrzFAw==
X-Received: by 2002:a05:600c:4e45:b0:3a5:f383:b917 with SMTP id
 e5-20020a05600c4e4500b003a5f383b917mr1191611wmq.61.1661239195612; 
 Tue, 23 Aug 2022 00:19:55 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 bn26-20020a056000061a00b0021d7b41255esm13578498wrb.98.2022.08.23.00.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 00:19:55 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v1 2/4] drm/hyperv: Don't forget to put PCI device when
 removing conflicting FB fails
In-Reply-To: <PH0PR21MB3025F3C8768EB3ADE16E8B9AD7719@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <20220818142508.402273-1-vkuznets@redhat.com>
 <20220818142508.402273-3-vkuznets@redhat.com>
 <PH0PR21MB3025F3C8768EB3ADE16E8B9AD7719@PH0PR21MB3025.namprd21.prod.outlook.com>
Date: Tue, 23 Aug 2022 09:19:54 +0200
Message-ID: <87zgfvwhnp.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Deepak Rawat <drawat.floss@gmail.com>, KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Michael Kelley (LINUX)" <mikelley@microsoft.com> writes:

> From: Vitaly Kuznetsov <vkuznets@redhat.com> Sent: Thursday, August 18, 2022 7:25 AM
>> 
>> When drm_aperture_remove_conflicting_pci_framebuffers() fails, 'pdev'
>> needs to be released with pci_dev_put().
>> 
>> Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> index 46f6c454b820..ca4e517b95ca 100644
>> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> @@ -82,7 +82,7 @@ static int hyperv_setup_gen1(struct hyperv_drm_device *hv)
>>  	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev,
>> &hyperv_driver);
>>  	if (ret) {
>>  		drm_err(dev, "Not able to remove boot fb\n");
>> -		return ret;
>> +		goto error;
>>  	}
>> 
>>  	if (pci_request_region(pdev, 0, DRIVER_NAME) != 0)
>> --
>> 2.37.1
>
> This patch appears to be obsoleted by commit a0ab5abced55
> that was merged into 6.0-rc1.  Of course, it does beg the question of
> why the original function hyperv_setup_gen2(), which is now renamed
> to hyperv_setup_vram(), doesn't check the return value from
> drm_aperture_remove_conflicting_framebuffers().

AFAICT this commit (which I've obviously missed) also solves the worst
issue I'm trying to address with this series: conflict between
framebuffer and SR-IOV VF config space. It would probably still make
sense to reserve the whole FB region on Gen1 first thing and use it
as-is for DRM/FB later (Patches 3-4).

-- 
Vitaly

