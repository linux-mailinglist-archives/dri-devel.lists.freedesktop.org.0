Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB6A59D1D8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 09:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003EA8F11D;
	Tue, 23 Aug 2022 07:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEEF10F24F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661238957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Il0sasf1rmdUin35WzTgnPhTCMVfyK1Nq9+6f6LdDpI=;
 b=UrF9WkhII1ZdvaAPxNjScCDMVKB2qwS5GC3pr9Kpc9ZU/8om5ESJ8JoBl+iSZIep25LFPd
 1L7ZSKFYTjFQWmAA+fOMyLGNPFrZdnW5KLTLPDlRIuTPIDgCBOVd1evQziQC+w6pJCQVMd
 u6KM+MR7hb3Iz0hak+dWKLeJ9F5OEV4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-ANZ3pkmbOcO8ywA795yoMw-1; Tue, 23 Aug 2022 03:15:55 -0400
X-MC-Unique: ANZ3pkmbOcO8ywA795yoMw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j22-20020a05600c485600b003a5e4420552so9836898wmo.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 00:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc;
 bh=Il0sasf1rmdUin35WzTgnPhTCMVfyK1Nq9+6f6LdDpI=;
 b=sEsXs9o+HLz5IwDob52FTh9AvDuzX7E3DIAUJe2lar42TywXqhjOIFZxwHhflFvf1k
 FkeGKMNZhyL1XBmGpn39u8ngndR/acqvTxMov9J67Y48JLNSEkE7q3HwDH3ahNYxQZ46
 otjygVRt7NqdEVv9ogcxlYTaObqbzAn4IAjMReJlAe/CTDW9Z9I8B4gslV+dWDLkE8Hk
 IDQMGnQd1nqOvhP9sreMl9N1CWxOguGBQJ91fM/zDlfrS1ldYQxrbIJpWA2acjv1xIqE
 n/2IqIhG1b8DWwgEa+iw6NURB2C00sEzTSfgXL1jFkbsuOkKwjNti7xYkk25Kylvy6Vp
 8CzA==
X-Gm-Message-State: ACgBeo3cTrlbTfP9Vxx5quFIA/x3qmWsNam0FCOqmrXhinbe3ImC1+nf
 +cuY+rbu5a2Fkv6P/BHay5w9T3nmmvWZlhNTUdV/zRdbnhCIrnTiafZ+Qn1Xd4vjO1M/g51kSri
 FdwjXk7fhXEbl7kDDOud40ggWPDKo
X-Received: by 2002:a5d:69c3:0:b0:225:221f:25c with SMTP id
 s3-20020a5d69c3000000b00225221f025cmr11871590wrw.49.1661238954612; 
 Tue, 23 Aug 2022 00:15:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5tPE6EDKqWGMRqYwPqG4ws37oKb0chXbAyuDzb6FstQmPHq7WGh3J3UD8GuwtvJu9GhpI8OA==
X-Received: by 2002:a5d:69c3:0:b0:225:221f:25c with SMTP id
 s3-20020a5d69c3000000b00225221f025cmr11871575wrw.49.1661238954351; 
 Tue, 23 Aug 2022 00:15:54 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfff8e000000b0021f0af83142sm13260423wrr.91.2022.08.23.00.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 00:15:53 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v1 1/4] Drivers: hv: Move legacy Hyper-V PCI video
 device's ids to linux/hyperv.h
In-Reply-To: <PH0PR21MB30259340B9E6BA09DED4CEC4D7719@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <20220818142508.402273-1-vkuznets@redhat.com>
 <20220818142508.402273-2-vkuznets@redhat.com>
 <PH0PR21MB30259340B9E6BA09DED4CEC4D7719@PH0PR21MB3025.namprd21.prod.outlook.com>
Date: Tue, 23 Aug 2022 09:15:52 +0200
Message-ID: <8735dnxwev.fsf@redhat.com>
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
>> There are already two places in kernel with PCI_VENDOR_ID_MICROSOFT/
>> PCI_DEVICE_ID_HYPERV_VIDEO and there's a need to use these from core
>> Vmbus code. Move the defines to a common header.
>> 
>> No functional change.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 3 ---
>>  drivers/video/fbdev/hyperv_fb.c         | 4 ----
>>  include/linux/hyperv.h                  | 4 ++++
>>  3 files changed, 4 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> index 4a8941fa0815..46f6c454b820 100644
>> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
>> @@ -23,9 +23,6 @@
>>  #define DRIVER_MAJOR 1
>>  #define DRIVER_MINOR 0
>> 
>> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
>> -#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
>> -
>>  DEFINE_DRM_GEM_FOPS(hv_fops);
>> 
>>  static struct drm_driver hyperv_driver = {
>> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
>> index 886c564787f1..b58b445bb529 100644
>> --- a/drivers/video/fbdev/hyperv_fb.c
>> +++ b/drivers/video/fbdev/hyperv_fb.c
>> @@ -74,10 +74,6 @@
>>  #define SYNTHVID_DEPTH_WIN8 32
>>  #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
>> 
>> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
>> -#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
>> -
>> -
>>  enum pipe_msg_type {
>>  	PIPE_MSG_INVALID,
>>  	PIPE_MSG_DATA,
>> diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
>> index 3b42264333ef..4bb39a8f1af7 100644
>> --- a/include/linux/hyperv.h
>> +++ b/include/linux/hyperv.h
>> @@ -1516,6 +1516,10 @@ void vmbus_free_mmio(resource_size_t start,
>> resource_size_t size);
>>  	.guid = GUID_INIT(0xc376c1c3, 0xd276, 0x48d2, 0x90, 0xa9, \
>>  			  0xc0, 0x47, 0x48, 0x07, 0x2c, 0x60)
>> 
>> +/* Legacy Hyper-V PCI video device */
>> +#define PCI_VENDOR_ID_MICROSOFT 0x1414
>> +#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
>
> I've never looked at this before, but shouldn't these move to
> include/linux/pci_ids.h with all the others?  And we've got
> another #define of PCI_VENDOR_ID_MICROSOFT in
> drivers/net/ethernet/microsoft/mana/gdma_main.c that
> could be deleted.
>

Oh, true, include/linux/pci_ids.h is much better. Let me send an updated
patch (detached from this series).

-- 
Vitaly

