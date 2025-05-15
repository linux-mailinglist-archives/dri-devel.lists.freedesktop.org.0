Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B34AB905B
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 21:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FA910E953;
	Thu, 15 May 2025 19:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=leandro.ribeiro@collabora.com header.b="fqcJMFHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509610E953;
 Thu, 15 May 2025 19:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747339165; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nvlv6xnlJoDgRfLIHOAipOToMF/YSEpecVBgTaLD+kDsN2BVNIDdg2tPTNdGlyt12q+sp2VXef7SHsJmTrJt5wsRfWaMGo9eSTkaK/sksDwfamivDuii1w2WWDZm+sFYRyzAU88uq7RLNxaPj2LPfnvrM00FYbwg2YPAYMPMFDA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747339165;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vOSMcnf9uOjbrEUaXsExY71mh+tkMHw3FuQ3PB7hzTs=; 
 b=cvtX4le/Jb8hAXNerl7bAcJClkHvZPtU8qUUFIvGD/DfR/MjrRtTJxY+JIhpS1VXrdbMyQ9HMnt5uQYQ0PTUQb/caCW2qQF9xAJDWXzh8RwVj+gZdLxp/dJWYpQt+bwiIEZq2UWKMMrzuhJ1e91h9wRh76UcLeb6jlk80vBlRDM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=leandro.ribeiro@collabora.com;
 dmarc=pass header.from=<leandro.ribeiro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747339165; 
 s=zohomail; d=collabora.com; i=leandro.ribeiro@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vOSMcnf9uOjbrEUaXsExY71mh+tkMHw3FuQ3PB7hzTs=;
 b=fqcJMFHj142HjhPzbIH9Ut71s/atlF+UWShAxVU+LocDoPwEW1QPXEPnyYzbH8uV
 WPc4J0Y3cSW2Dv8Rsr+P2rFH+M1n5B4xRIQbv0c/aNe9cOhoMoHVAPnxLCex7AsDNhi
 6vQncVp1itE8O/kGPP9iULiu0yX4ppHSH/Hm7p44=
Received: by mx.zohomail.com with SMTPS id 1747339162654100.60362466798995;
 Thu, 15 May 2025 12:59:22 -0700 (PDT)
Message-ID: <5921076d-0150-4e0f-a3ef-1b8dec021630@collabora.com>
Date: Thu, 15 May 2025 16:59:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
To: Daniel Stone <daniel@fooishbar.org>,
 Harry Wentland <harry.wentland@amd.com>
Cc: Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
 Misyl Toad <misyl@froggi.es>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <o4MtjqyDUjuFR4Y9Q1IEZlvVQ7Nkggq0v-KtBcH0aM3pTvEq8UcSoUDxefSBVdTmLj_1_a6GmbjU_mRSFinOb44B4bu1u3mMIckuQhhZWCc=@emersion.fr>
 <3bbd4bd7-7217-4a14-b7bb-383226f44f55@amd.com>
 <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
 <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
 <CAPj87rMbcZKy2ARe_tp_-+-tMu3FpS0C9R1BHVzjsUpOsU9M4g@mail.gmail.com>
Content-Language: en-US
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
In-Reply-To: <CAPj87rMbcZKy2ARe_tp_-+-tMu3FpS0C9R1BHVzjsUpOsU9M4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <5921076d-0150-4e0f-a3ef-1b8dec021630@collabora.com>+zmo_0_leandro.ribeiro@collabora.com
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



On 5/15/25 15:39, Daniel Stone wrote:
> Hi,
> 
> On Thu, 15 May 2025 at 19:02, Harry Wentland <harry.wentland@amd.com> wrote:
>> On 2025-05-15 13:19, Daniel Stone wrote:
>>> Yeah, the Weston patches are marching on. We've still been doing a
>>> little bit of cleanup and prep work in the background to land them,
>>> but we also can't land them until the kernel lands. None of that work
>>> is material to the uAPI though: as said previously, the uAPI looks
>>> completely solid and it's something we can definitely beneficially use
>>> in Weston. (Even if we do need the obvious follow-ons for
>>> post-blending as well ...)
>>
>> We can't merge kernel uAPI without canonical userspace that uses it.
>> To move forward we'll need a userspace to at least publish a branch
>> that shows the use of this new uAPI.
>>
>> Do you have a public branch for the Weston work for this?
> 
> Yeah, https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1702
> has been around for a little while now. There are some driver bugs
> that Leandro commented on, but they don't seem material to the uAPI as
> such?

Hello,

Yes, there's nothing related to the API that is blocking us. It seemed
very flexible and easy to use. The bugs that I've spotted are probably
internal to AMD driver.

I'd say that the Weston patches are converging nicely, we just need time
to get them fully reviewed. We had a few preparation MR's to land
before !1702, and now there's only one left (!1617).

Thanks,
Leandro
> 
> Cheers,
> Daniel

