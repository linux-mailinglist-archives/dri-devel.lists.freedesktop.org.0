Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9803CBF5C78
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 12:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C47510E2EA;
	Tue, 21 Oct 2025 10:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="PIFfvJg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4D510E2EA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 10:28:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761042525; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QzZZ3fYxaXWfsDAwg+8OTiQQpo0/puoqLHfVuq82iqsSaIoU4MSteisnWKfxnfGXmh9J/fEqnjNYP69PZHQYHnP5OX7eKMBMPIKzQw37/6WXrraK/4uGi1sMlaQz2zrvBKdHuka+8CqVcvtiSr1C6YmImbITT/Rnk4kXfcpF4YY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761042525;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jZuSP7CIv2Yik6596VgKC2i8oP2tWtzljTZtGY/y+NQ=; 
 b=ESAJloMG6mT0kLhUzANTjmi6k4EBH1kDjG8hSgPBwJcWpy78J+j/yDtuXpWXcaOAqiGrGxuql5fCIHNZMVGejEcWccuwK+sPq8wIjgt7zo7r3xotdagGgVXiiYNpmVyQz0unksesnbJ5CNrM5EyeEbIby5I/KIOojoCOup/TY7c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761042525; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=jZuSP7CIv2Yik6596VgKC2i8oP2tWtzljTZtGY/y+NQ=;
 b=PIFfvJg3aDLnwCdt2+4NuVt+4wRtNfCagrlr2wrE7s6cYlQQSbbl4abOieTo0NG3
 RYGeGpDjPLXVblnYRxqntgo5OVfamV9bPm92Gij4+k7CysJMCzHMt1N3rmjgJJzXlTt
 D5jC5HZW74iptngrFjksUGV8D8ahI+x1Z0iOs9ag=
Received: by mx.zohomail.com with SMTPS id 1761042523809409.2792412131598;
 Tue, 21 Oct 2025 03:28:43 -0700 (PDT)
Message-ID: <ee77b9c9-1a28-45b8-9e96-d8c1afb0ac53@collabora.com>
Date: Tue, 21 Oct 2025 13:28:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
 <afc6ba14-cd95-49b9-89f5-e90fd19c8927@collabora.com>
 <a2afbc13-0be6-46ef-a6da-9461fd30376b@collabora.com>
 <126a0b10-a550-430c-a1b3-7e144461a0ff@suse.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <126a0b10-a550-430c-a1b3-7e144461a0ff@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 10/21/25 09:39, Thomas Zimmermann wrote:
> Hi
> 
> Am 19.10.25 um 19:10 schrieb Dmitry Osipenko:
>> On 10/17/25 16:58, Dmitry Osipenko wrote:
>>> Hi,
>>>
>>> On 10/17/25 10:38, Thomas Zimmermann wrote:
>>> ...
>>>> There's little difference between the current event handling and the
>>>> one
>>>> where no vblanks have been set up. I suspect that the vblank timer
>>>> callback interferes with the locking in atomic_flush. That would also
>>>> explain why the fps drop at no clear pattern.
>>>>
>>>> Could you please test the attached patch? It enables/disables the
>>>> vblank
>>>> timer depending on the buffer resources; as you suggested before.  Does
>>>> this make a difference?
>>> The attached patch doesn't work, please see the trace below.
>>>
>>> @Vivek Please clarify whether you only see frames drop with your
>>> multi-gpu guest-blob setup or with a usual virgl too. I haven't noticed
>>> problem with frames pacing for virgl and nctx modes yesterday, will
>>> check again.
>> On a second look, I now see that this RFC (not the attached) patch
>> doesn't work properly with host blobs.
>>
>> I'm getting 100-150fps with this patch applied instead of expected
>> 60fps. Without this RFC patch I'm getting constant 60fps with native
>> context displaying host blobs.
>>
>> Not sure why guest blob would behave differently from the host blob.
>> Suspect something if off with the prime sharing that Vivek uses in the
>> vfio testing setup. I'd suggest to disable vblank timer only for guest
>> blobs if no quick solution will be found.
> 
> After reading your reply and Vivek's new results, I'm confused now. Does
> it work or is there another patch needed?

Didn't work for me, apparently worked for Vivek. Got a black screen,
flashing sometimes, and that error splat.

Now realized that I only tested with enabled virgl 3d context, while in
Vivek's case 3d is disabled. Will test further.

-- 
Best regards,
Dmitry
