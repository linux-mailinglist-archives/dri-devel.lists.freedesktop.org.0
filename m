Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A239F7F7106
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB1810E7D7;
	Fri, 24 Nov 2023 10:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D17310E7CD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700820918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TTq8+kCBsRfezDZUZNy6OCUhutJdQNVSX6U8E7Z+Kf8=;
 b=H8SXOa1DZZrG4peNW1udGd6J1/1yVoM/VXhGpTWXfyW7P2P04cKxDwd3MlzjWLv37/IUNV
 cL9j95QSFw9iKLNFnBI4adDWjNslv16iMGojyg3MZn78msSLb2Jo36qosQst3NXG2XKIFU
 oO1ciD50bXExse8KAPfCUZ2MwsS34uE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-_eGOq4ysPau3u0q6PtI9Kw-1; Fri, 24 Nov 2023 05:15:16 -0500
X-MC-Unique: _eGOq4ysPau3u0q6PtI9Kw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-77d7bfcceaaso77994185a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 02:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700820916; x=1701425716;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TTq8+kCBsRfezDZUZNy6OCUhutJdQNVSX6U8E7Z+Kf8=;
 b=ncoQJc4M1xC1gX3r8plR/P6UrPncsMByS1SrsG9lloSpPovwnuLxS8Rlr6FUkH8iYZ
 hIPGQy27jvYGj4iKS9NZkpicaJ4OD7pjiJKpz5FcERwB69adm9c+4yIKNLKF3rXGieSB
 OfbqwICQPxt4eHXEF8+sNELOcCbnAQtWgvb8bFNuvJWLTdiLDJ89hJ73nX0NiKH3Helv
 yvzYUOo7zGWsPpSmh3+pwa5e5kflI/WBuNuU/QzDBmPIExoGXJb4lGJ/3uCMtahbdlw4
 SYeaNS9CljKlYCYnaTn3af2tyPAnAtbhk3fUL6s3lcF0OranuIvHccW8H608tWvMxBJ3
 CwIw==
X-Gm-Message-State: AOJu0YwAluCaUnA5yxxZgTVUzdr9sbKz5jE4lw0BcwKTMpl94uFLPglt
 5SemYTywTfeXirIKaVcGRhSgVXdlsik06BzdfBvWubZzh9ryUqRd6gEIKVdRZQLDTbLS6mnt3Qg
 1b664ABQircnpZgPSlY7u8cdRU+8=
X-Received: by 2002:a05:620a:294b:b0:774:d3f:c78c with SMTP id
 n11-20020a05620a294b00b007740d3fc78cmr2910555qkp.72.1700820916433; 
 Fri, 24 Nov 2023 02:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3RJxpHx9XF5gTOs5+1q6RlhTFoQIQfE2hazERkN73qvfSSfainOz1S68urbbGGyVvjNRErA==
X-Received: by 2002:a05:620a:294b:b0:774:d3f:c78c with SMTP id
 n11-20020a05620a294b00b007740d3fc78cmr2910528qkp.72.1700820916165; 
 Fri, 24 Nov 2023 02:15:16 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-24-178.cust.vodafonedsl.it.
 [2.34.24.178]) by smtp.gmail.com with ESMTPSA id
 b20-20020a05620a0cd400b00774830b40d4sm1131051qkj.47.2023.11.24.02.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 02:15:15 -0800 (PST)
Message-ID: <9fb1cd9d-89cb-4f45-9d0c-9f0102e000e6@redhat.com>
Date: Fri, 24 Nov 2023 11:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/test: add a test suite for GEM objects backed by
 shmem
To: Maxime Ripard <mripard@kernel.org>
References: <20231123100147.212645-1-marpagan@redhat.com>
 <dkh6t5cya7tw4wz5aqrgvnqqnyzzgvbyvezxexy6pyspju5qbd@cdl4vvs7kvnt>
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <dkh6t5cya7tw4wz5aqrgvnqqnyzzgvbyvezxexy6pyspju5qbd@cdl4vvs7kvnt>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Christian Koenig <christian.koenig@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-24 09:49, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Nov 23, 2023 at 11:01:46AM +0100, Marco Pagani wrote:
>> +static int drm_gem_shmem_test_init(struct kunit *test)
>> +{
>> +	struct device *dev;
>> +	struct fake_dev {
>> +		struct drm_device drm_dev;
>> +	} *fdev;
>> +
> 
> [...]
> 
>> +
>> +	/*
>> +	 * The DRM core will automatically initialize the GEM core and create
>> +	 * a DRM Memory Manager object which provides an address space pool
>> +	 * for GEM objects allocation.
>> +	 */
>> +	fdev = drm_kunit_helper_alloc_drm_device(test, dev, struct fake_dev,
>> +						 drm_dev, DRIVER_GEM);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdev);
> 
> Sorry I missed it earlier, but you don't need the intermediate structure
> if you use
> 
> struct drm_device *drm;
> 
> drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_GEM);
> KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
>

I prefer to use drm_kunit_helper_alloc_drm_device() with the intermediate
structure. It makes the code clearer, in my opinion. Initially, when
developing the suite, I was using __drm_kunit_helper_alloc_drm_device()
as most test suites do, but I feel the list of arguments including
"sizeof(*drm), 0," is less straightforward to understand.

Thanks,
Marco

