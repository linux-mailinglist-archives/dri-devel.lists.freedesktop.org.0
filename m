Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A241BBE4E78
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C49A10E30A;
	Thu, 16 Oct 2025 17:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="D7SZRzX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B1E10E30A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760636557; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YZvnMhHlWMSUe7BQMT+BAMFlsK3lSpVMBYcjsF0BrPsl3pqXZui7924TL0YJ7UQwfKDAgLn7O2ns8pns0xrqTpG4mtgI0yg/buK/YysOIxXQjUKvbaz/ZA0RvcFNdkn8fPAzshFpHu89Ll8goVTjoUFjf/pDq2kuMCEfOnWSISs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760636557;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VAon2uw2TC2Xj8Z9HG8ujPslg9D4ck6gAgMDw8sLSv0=; 
 b=OQHoAZ2UeW9UhucjTtOkIPXmsH02cqgm9Np/l0Uu6x8pvac7qgvDVsEjGXNRBr0PvSH7pl2nCQnMNVqG8Pz5GGOmmBt9roDzet4cn29AnOsx8hj0ovqTeVIwN1sDxUeptXs2ujtvzSSd4EduoLmjYqjaNso3fdxcOjtdsuTuus4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760636557; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=VAon2uw2TC2Xj8Z9HG8ujPslg9D4ck6gAgMDw8sLSv0=;
 b=D7SZRzX8vLFQxOt9CdBxBhsR2ta+uctTZArVPSi1tjLNWKiZM8VaHx41WIAOwvr4
 cEAMbEUEPWbCaKpRYh+pPmjlPP3UJluKGiMx25GCOF4Ey5x8lWsYuvkWfSMIOYITxRF
 z/Ir+Wv2IamLRwod65nojRW830O5mWRmAHeFIH0g=
Received: by mx.zohomail.com with SMTPS id 1760636554473967.3645907639259;
 Thu, 16 Oct 2025 10:42:34 -0700 (PDT)
Message-ID: <00999b29-fcf0-4855-9c1f-8d62cc2724b0@collabora.com>
Date: Thu, 16 Oct 2025 20:42:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtgpu: Use vblank timer
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20251008130701.246988-1-tzimmermann@suse.de>
 <IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <dd80279d-5469-42db-bfa0-7b9ee3323bc9@suse.de>
 <IA0PR11MB71850152C033B443032AA519F8EFA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <76e2a961-1d3a-411f-9cb3-625be048f4da@suse.de>
 <CH3PR11MB7177EED8239AEBF875AA3389F8EAA@CH3PR11MB7177.namprd11.prod.outlook.com>
 <8fa40ad3-b848-4cf1-8515-7dbe05bb3136@suse.de>
 <CH3PR11MB71771983D6F3A6E567E1904AF8E8A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <2c17fa2d-fca1-4f3b-a7b1-7c07e7d5edee@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <2c17fa2d-fca1-4f3b-a7b1-7c07e7d5edee@suse.de>
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

On 10/16/25 17:56, Thomas Zimmermann wrote:
> Hi,
> 
> for some reason, Dmitry already merged this patch into drm-misc-next. I
> therefore sent out another change to pick the correct handling of vblank
> events depending on the plane's buffer objects. You may want to take a
> look at [1]. Testing is welcome.
> 
> [1] https://lore.kernel.org/dri-devel/20251016145230.79270-1-
> tzimmermann@suse.de/T/#u

This patch fixes a major performance problem with 3d contexts on QEMU
that I was coincidentally investigating at the same time when you posted
the patch. Thanks a lot for fixing the vblank issue. Will test the
updated version.

-- 
Best regards,
Dmitry
