Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C9E97EA6B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 13:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACA610E21E;
	Mon, 23 Sep 2024 11:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="TRKAyExS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1663610E21E;
 Mon, 23 Sep 2024 11:03:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727089394; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kDXCxfw/hw6ew8efv8U7Lx97Kex37kmk8+TaliPh7NG6D/gajWv1RylFpdCx7ykjAY3lSqFciNM3hJOUNoiMMVNqPZ9KAAVksn74iQ5CZP0CoXCL4KYnIkPcX2eoorVPAg74UtmBg6eH7DOb42jQVnRy2YcyDnTZedz0j9GiqhI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727089394;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=fE2c7L7xGQoDbOzbpWh4pek0hqhe59oT/bYRFk2jxQA=; 
 b=aOvw8vWWWSYnTRtQi3MCp5VAB9ClshCcwBey9nRo/xGyEL0GOpouufWSYfiZXpx+ns0Pjyk+tNDkyZPI8IiJqjSmyQSwcnfjhlIpxQMtz7Plp/duCABX2QljCVAxgWXzR/N+Y4SyMTzDQEtLpTSW4b/HKYXberaFusnxXa/Sszo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727089394; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=fE2c7L7xGQoDbOzbpWh4pek0hqhe59oT/bYRFk2jxQA=;
 b=TRKAyExSfS6DmryGrf5sAZi8W/cJ9bxEwpISux+jYBM32mzjwP3lSnrVGutwKlgX
 3JheGFh8RhdQc33L/dlB5bmcpOF5HXV0IFVCN5aVajy9gwi+wvyG7nmLCN9Gie2V8sH
 TkBOhOCrX24y+98LHCVG5LnYkjvrCKavmWZSaTuU=
Received: by mx.zohomail.com with SMTPS id 1727089393042996.3802434794034;
 Mon, 23 Sep 2024 04:03:13 -0700 (PDT)
Message-ID: <39ffb244-5264-44ee-9bc9-128d73a87ff2@collabora.com>
Date: Mon, 23 Sep 2024 14:03:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm: add DRM_SET_NAME ioctl
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-2-pierre-eric.pelloux-prayer@amd.com>
 <75f56ed0-206a-4e81-9972-38c29a3e20be@collabora.com>
Content-Language: en-US
In-Reply-To: <75f56ed0-206a-4e81-9972-38c29a3e20be@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 9/23/24 13:28, Dmitry Osipenko wrote:
...
>>  /**
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index 16122819edfe..f5e92e4f909b 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -1024,6 +1024,13 @@ struct drm_crtc_queue_sequence {
>>  	__u64 user_data;	/* user data passed to event */
>>  };
>>  
>> +#define DRM_NAME_MAX_LEN	64
> 
> What about 63, to align data size to 64 bytes including the NULL byte.

On the other hand, the string is copied without NULL byte, so it doesn't
matter.

This leads to another question, why not using strndup_user like it's
done for dma_buf_set_name?

-- 
Best regards,
Dmitry

