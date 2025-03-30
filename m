Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFBDA759DB
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 13:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C27C10E064;
	Sun, 30 Mar 2025 11:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="YcqHw1od";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC6710E064
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:57:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743335828; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DuSl4+qCOKE3JF+Zg174Rj3JYGI9kf5tcyleWoBOVIdzcih9Ls5FoHLUiKLn3wblwrX6JmAaMOvMgPQre0ZF0NQZuEk7ROZDhKCMntckBxQNSw+dTfOCSnMArWWmlXV04uHwYEQVqnyNXanF+l5CtAmnsrEQ3DtVNkwkX4QjPXU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743335828;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4kGf3FTZbbYSC5HWkTh3/IjO/s5h36uAN/Ah3VwiMkQ=; 
 b=O/hyFbj8yqgFQyVxMAP8mmNLPDaK1HB5+l1Gw6rqypoe4gQKGGKtrbWijdrOuT2Yjz3m9mXH3ZU/PnvwTYbFUd9vmCNm8jFfDJVlNMJiZrfjAM3/YxmtYts3A3t9AW1D99AsbuAsOqaYqmecsTltengatiibMFVEQOVNoC6NVso=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743335828; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=4kGf3FTZbbYSC5HWkTh3/IjO/s5h36uAN/Ah3VwiMkQ=;
 b=YcqHw1odaLW38o1RFeAuVz10NJvoObkWxfPPDJUlPzU23ZArnWGCtP8zVhqjgLsN
 cv3PMh8sftOUq9RiBZ+AH+JbJ5Rs2uOFn2eoNrLdqtcEk4XK+YiUyb3a8McmIfQVsZ4
 cc5P88iYIF8bdEvgwn/lWNo86u4MP/ioEgA1je5g=
Received: by mx.zohomail.com with SMTPS id 1743335825438253.6892868535216;
 Sun, 30 Mar 2025 04:57:05 -0700 (PDT)
Message-ID: <4b749976-9589-491c-995e-36cfbd02cd61@collabora.com>
Date: Sun, 30 Mar 2025 14:57:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] virtio-gpu api: add blob userptr resource
To: Demi Marie Obenour <demiobenour@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250228053650.393646-1-honglei1.huang@amd.com>
 <20250228053650.393646-2-honglei1.huang@amd.com>
 <cd9f85a5-0d99-4007-bba2-d792ac9d84da@gmail.com>
 <c2d1334f-6f5a-493f-bbf0-3e92789f128a@amd.com>
 <85470439-3c03-4787-be91-b6b680a5aca5@collabora.com>
 <42048a80-a736-4ccc-953b-924d1e640cd0@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <42048a80-a736-4ccc-953b-924d1e640cd0@gmail.com>
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

On 3/29/25 22:50, Demi Marie Obenour wrote:
> On 3/26/25 10:46 AM, Dmitry Osipenko wrote:
>> On 3/6/25 13:51, Huang, Honglei1 wrote:
>>>
>>> On 2025/3/1 5:21, Demi Marie Obenour wrote:
>>>> On 2/28/25 12:36 AM, Honglei Huang wrote:
>>>>> From: Honglei Huang <Honglei1.Huang@amd.com>
>>>>>
>>>>> Add a new resource for blob resource, called userptr, used for let
>>>>> host access guest user space memory, to acquire buffer based userptr
>>>>> feature in virtio GPU.
>>>>>
>>>>> - The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,
>>>>> in this series patches only HSAKMT context can use the userptr
>>>>> feature. HSAKMT is a GPU compute library in HSA stack, like
>>>>> the role libdrm in mesa stack.
>>>>
>>>> Userptr should not be limited to HSMKMT contexts.  Userptr can
>>>> accelerate shm buffers by avoiding a copy from guest to host, and
>>>> it can be implemented using grant tables on Xen.
>>>
>>> Yes, I totally agree userptr can accelerate shm buffers, but I currently
>>> don't know if there are any other projects working on similar features,
>>> or if maintainers have any opinions or better ways to implement them, so
>>> I temporarily limit this feature to HSAKMT context only.
>>>
>>> I am waiting for everyone's opinions, please provide your thoughts.
>>
>> USERPTR should be relevant for anything Vulkan-related, like Venus and
>> native contexts. I expect that this new feature will work universally
>> good for all context types.
>>
>> In order to merge USERPTR support upstream, we at least will need to
>> prototype the guest USERPTR in one of native context driver to know that
>> it works. You'll need to post the whole set of host/guest USERPTR
>> patches including QEMU and etc, not just the kernel patches.
> 
> Does the user-mode VMM need to be QEMU or would patches to
> another open-source VMM, such as crosvm, be sufficient?

General-purpose features should be made supported by QEMU when possible.
Testing feedback for other VMMs will be very valuable too.

-- 
Best regards,
Dmitry
