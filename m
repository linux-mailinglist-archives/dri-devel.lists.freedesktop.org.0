Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A76CAA9CC0
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 21:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBC310E036;
	Mon,  5 May 2025 19:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="j0bb/Bpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAF910E29A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 19:46:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746474394; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VavbiBt7vCpbeBlM2CyN97VptNYOjyRgF7nlcSw7AKxXN5J2Gs4QACziaCxSOU96WZCvBAaC458qjCvXuS6A8eFZg5ofi2Fan4gFXhoDyeoPpmrhNpLG/A8TOGwO/Yunl+tc109UrBde6OPWQM7ehpcU7CbfefuD0rIySFFM/3Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746474394;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=7LLlWKpP2i6/4+9KhGv+Oo3fPClHJlLgrjoQlZYv5CI=; 
 b=lYf5zLJepebmdmSzdx0dF/4bq6m90w+AKzU6UaUhWmZwFgE2+JcmiCb54I+6qTaJaOPyaHxako2f08JQlqUoJvTmWI9kgWZOd1wFiDXbXp0RZfrnXo1PA7PTE/aETQ8e/38nGK0DmMW6eVp0VEpgIkNQfugFZU3Ap9Hel/9f7rg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746474394; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=7LLlWKpP2i6/4+9KhGv+Oo3fPClHJlLgrjoQlZYv5CI=;
 b=j0bb/BpzzpW2nM9UF9rCmkBPjWyyg/24rBPCevrJuH4HXSdOek/P07NLk+rrnBKo
 2HMXzo6Tiw6u2nfBowbizi41CPrKOgW2H9X3OtsZ1Hv8qcPYO4sGaXaRdBojY+F70YT
 9YOTENxdo0va7mqdb6IamYPPeH/MknyJwTVgfCL0=
Received: by mx.zohomail.com with SMTPS id 1746474392398391.2983910104631;
 Mon, 5 May 2025 12:46:32 -0700 (PDT)
Message-ID: <28584e91-6320-431d-afae-9f10e1eca86d@collabora.com>
Date: Mon, 5 May 2025 22:46:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Virtio-GPU suspend and resume
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20250418232949.1032604-1-dongwon.kim@intel.com>
 <7f334c99-fe86-4e53-86d6-e8473c76ff3e@collabora.com>
 <PH8PR11MB6879A6238EAD527704B8C994FA8E2@PH8PR11MB6879.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <PH8PR11MB6879A6238EAD527704B8C994FA8E2@PH8PR11MB6879.namprd11.prod.outlook.com>
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

On 5/5/25 22:38, Kim, Dongwon wrote:
>> I tried to apply your kernel patches and then suspend/resume guest kernel, it
>> doesn't work:
>>
>> virtio_gpu_transfer_to_host_2d: no backing storage 2
>> [   22.909454] [drm:virtio_gpu_dequeue_ctrl_func] ERROR response
>> 0x1200 (command 0x105)
>> virtio_gpu_transfer_to_host_2d: no backing storage 2
>> [   23.169138] [drm:virtio_gpu_dequeue_ctrl_func] ERROR response
>> 0x1200 (command 0x105)
> [Kim, Dongwon] I will check your failing case more closely. As you know, we use virtio-gpu device
> only for display device, which means I tested this in that specific environment
> although I thought it is generic enough...

I used virtio-gpu when got these errors.

-- 
Best regards,
Dmitry
