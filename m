Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C74EBD7F08
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2EB10E568;
	Tue, 14 Oct 2025 07:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OilukKMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5747510E566
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760427235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2f+TEVmNHcIZWSH2C31Ng9eliwbtMBD5xTQThZ/PZk=;
 b=OilukKMSu42pV46NBFqbnT70tAnBSPt39yYIoREjDrDjti0kgBDOh0yIV/nOnfvaMkI0Uh
 ajmf39v7pWsGLFvz51N1b/n0KAF1fHu23RMdqf6Y4/uN25JS5dU9AieDfJV9B7EwGtce8L
 Bhuwi0MSeep25QnW19JUqRvEGOeF3IQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-TWCPhmrtP06JAujUsh4MUw-1; Tue, 14 Oct 2025 03:33:54 -0400
X-MC-Unique: TWCPhmrtP06JAujUsh4MUw-1
X-Mimecast-MFC-AGG-ID: TWCPhmrtP06JAujUsh4MUw_1760427233
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e3ef2dd66so33271355e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 00:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760427233; x=1761032033;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G2f+TEVmNHcIZWSH2C31Ng9eliwbtMBD5xTQThZ/PZk=;
 b=o3a+oGqglIj7eqAIdFfr6496i32s9nMdg8EuChLbDZPvr9HQUUM2vpTAQY/YM2GTEs
 fnDk2c3zWlgvehXdkJHN3Z7lxsp8ezjNJFmRNkRAtNj2NOGqKvx/AQOLHViSUuT4QRsx
 /JrtI1n9Lh4x+5JFTLmeBlR3R2qjbSPQSgqp4KXHQb5F4kTo56jtRijlOrYBknIedjFN
 ymNrnBBFtweI6Mb+FelZqhpsZsfZDQSbT0dRIcjHqABo0vb1BM3Mf2ZZIVxqUu7avpYP
 5XJlqnnJp/sWYf1RdciYDC+YWGdIZ45WvLRDBNBqAbm0PTBe79+Y8J9d4ge7MSmDvCSU
 5q1A==
X-Gm-Message-State: AOJu0YzYiXzAZj+Xjx+Mx2ZZ/eOMZrZgu/eQhh0AyXgdCIusOGlsP9gm
 mbnFmDjo4UEhgbaCiZobi4QPDJNiAL8mf+nzpFURuKzz1OSY5iQel2hyyfPaEV96l/rFFd6epfA
 JfuGnNfJ53KZxwam4NhmgG2UUzeBaEgOskxcoY05aYJ0R6GBciQxfTt5ic65b9rXe+HpdpQ==
X-Gm-Gg: ASbGncslALkZOVPcLvZ49rLHg3s05TamoClE01bYzZ4f6Eu6rFTewq3nZiozaAcbQOI
 UzuPXEzmWg8qNugwKZRwr+SsJK3Sf7E2hHKFqxGqvlr8iLysMbDXSFwC+8fp4IyOlqcsiWuS8K4
 5t4oyIJnxrCQnwmSqjwms+ScG1s1g1gIsByqT9z8hDIRy/IfcM1notl5roIMv8WKecCClqNBY3T
 2+btuPxvRKVF0Zn11qNMd1zj4+3HhKXd/KDHMKRxCPykSaepOhtFbD/qwIcbhnHaqYTKnBdDLdv
 ke/nFjY8ADzyruC7y3sSdWPY5DUTBLyjYXQoNMrhQ8MUwVbvtDb2ZJHucvG5OC1KNSs0OXUmd+1
 iwUTU
X-Received: by 2002:a05:600c:1277:b0:46c:adf8:cd82 with SMTP id
 5b1f17b1804b1-46fa2952c02mr135681145e9.3.1760427232815; 
 Tue, 14 Oct 2025 00:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBeNo7ZlnJvZO+4tdhdDmG+vIUKT7nCznXOA5q9opUrokbPvd9TwG1AFWjfUcvv1KmWXVDOA==
X-Received: by 2002:a05:600c:1277:b0:46c:adf8:cd82 with SMTP id
 5b1f17b1804b1-46fa2952c02mr135680875e9.3.1760427232370; 
 Tue, 14 Oct 2025 00:33:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489ac60sm230694605e9.16.2025.10.14.00.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 00:33:51 -0700 (PDT)
Message-ID: <335fdb74-6d43-41e0-9774-eb57f425313d@redhat.com>
Date: Tue, 14 Oct 2025 09:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/client: Remove holds_console_lock parameter from
 suspend/resume
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, lyude@redhat.com, dakr@kernel.org,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20251001143709.419736-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251001143709.419736-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _GhNw-89BJcSa0sHQN4TwiqL7F8GMZ-7HXsDbNszh1o_1760427233
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/10/2025 16:37, Thomas Zimmermann wrote:
> No caller of the client resume/suspend helpers holds the console
> lock. The last such cases were removed from radeon in the patch
> series at [1]. Now remove the related parameter and the TODO items.
> 
> v2:
> - update placeholders for CONFIG_DRM_CLIENT=n
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://patchwork.freedesktop.org/series/151624/ # [1]

For drm_log:
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

