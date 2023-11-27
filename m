Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F05D7FAAAA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 20:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0156C10E0AB;
	Mon, 27 Nov 2023 19:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1685E10E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701114895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+viejdGrXzmIzPjCsTE2dERIUwjgFpRXidRJ+El7Zb0=;
 b=BknhSvk1bgLbumk0hFUIZx6/dCZScvUq0ppNkgOP8+Kjoa4UndPU5ibEyDauHailES6FqK
 zJchlVl8npR7LM1NoLOr4AQzEmi8kZbyWDg17xMlGfToc82Xz5J9nkE543bFXSFVNLGvdk
 7IHLQnNLpU3z4TdjLAzZUiiPuV7qc1k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-W2nEyyFEPWyLOHqIwYZZNg-1; Mon, 27 Nov 2023 14:54:54 -0500
X-MC-Unique: W2nEyyFEPWyLOHqIwYZZNg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a114f099bebso68760566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 11:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701114893; x=1701719693;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+viejdGrXzmIzPjCsTE2dERIUwjgFpRXidRJ+El7Zb0=;
 b=Q4U/A3yzNnHKxB1Am0Kx/5RzxPPC/31tiwePrE1SVnsxvR6HYkMdLdGFmhTfv4o4gr
 9LLJGgq9Yo5rI/T9emuFEQeHVHWu5QLc20gQKB414yVY9yvHGAr7/uEoNicMYsSS8eAy
 VUU7vL5Na4zZOSi6M5JPeYp06dHMu6IOyQzNsyjBkase2hEusNVWTo/LmfGvxcHEOUB3
 tG5Xk3lJuBKtvM0PGVwQFWB+4N2X4T7bm1CRuOhFjkAy6dqUiNb0Js/h8IdMjmzPG0Eh
 fdWGBtmPEAhNpbajMnaLw0PpfUamUeMxT79ThgejFzjqfI3v5Ee8eMGTSqN30rR9U4t7
 NU6A==
X-Gm-Message-State: AOJu0YwVvD7CWmifOZlHPgS7Dy9OaiFZXEjVEsTpZDA6I4OU7tDea1QD
 5BV+D6CZQnlKZcFnTbKCKQWaRIMZjBGvHImczBM8yRhG4r8zrZODRqWZnU2GeRb8VYkqF7ag9Nx
 nquoUkZBh66In8rC+qqamnDLcbOVc
X-Received: by 2002:a17:907:c708:b0:9b2:d78c:afe9 with SMTP id
 ty8-20020a170907c70800b009b2d78cafe9mr12510216ejc.49.1701114893230; 
 Mon, 27 Nov 2023 11:54:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqsjQCsAPoPOd6g0Qn1BKTS65cz8ECHJlGNLkABKEDrEEApBu5Jji0dCbisefe04GfKIqPgw==
X-Received: by 2002:a17:907:c708:b0:9b2:d78c:afe9 with SMTP id
 ty8-20020a170907c70800b009b2d78cafe9mr12510207ejc.49.1701114892974; 
 Mon, 27 Nov 2023 11:54:52 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a1709062c1b00b009fda627abd9sm5988845ejh.79.2023.11.27.11.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 11:54:52 -0800 (PST)
Message-ID: <6a30b834-fa29-41aa-bf91-4ab887dc2a56@redhat.com>
Date: Mon, 27 Nov 2023 20:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] Documentation/gpu: VM_BIND locking document
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20231121104046.3201-1-thomas.hellstrom@linux.intel.com>
 <20231121145619.7e7cb541@collabora.com>
 <574ec6bd-22ff-ec66-0bfe-35b51b7142f6@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <574ec6bd-22ff-ec66-0bfe-35b51b7142f6@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oak Zeng <oak.zeng@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/22/23 08:49, Thomas Hellström wrote:
> 
> On 11/21/23 14:56, Boris Brezillon wrote:
>> On Tue, 21 Nov 2023 11:40:46 +0100
>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>
>>> Add the first version of the VM_BIND locking document which is
>>> intended to be part of the xe driver upstreaming agreement.
>>>
>>> The document describes and discuss the locking used during exec-
>>> functions, evicton and for userptr gpu-vmas. Intention is to be using the
>>> same nomenclature as the drm-vm-bind-async.rst.
>>>
>>> v2:
>>> - s/gvm/gpu_vm/g (Rodrigo Vivi)
>>> - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
>>>    (Rodrigo Vivi)
>>> - Adjust commit message accordingly.
>>> - Add SPDX license header.
>>>
>>> v3:
>>> - Large update to align with the drm_gpuvm manager locking
>>> - Add "Efficient userptr gpu_vma exec function iteration" section
>>> - Add "Locking at bind- and unbind time" section.
>>>
>>> v4:
>>> - Fix tabs vs space errors by untabifying (Rodrigo Vivi)
>>> - Minor style fixes and typos (Rodrigo Vivi)
>>> - Clarify situations where stale GPU mappings are occurring and how
>>>    access through these mappings are blocked. (Rodrigo Vivi)
>>> - Insert into the toctree in implementation_guidelines.rst
>>>
>>> v5:
>>> - Add a section about recoverable page-faults.
>>> - Use local references to other documentation where possible
>>>    (Bagas Sanjaya)
>>> - General documentation fixes and typos (Danilo Krummrich and
>>>    Boris Brezillon)
>>> - Improve the documentation around locks that need to be grabbed from the
>>>    dm-fence critical section (Boris Brezillon)
>>> - Add more references to the DRM GPUVM helpers (Danilo Krummrich and
>>>    Boriz Brezillon)
>>> - Update the rfc/xe.rst document.
>>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Still have a few comments (see below), and in general, I find some
>> sentences very long, which has the tendency of confusing me (always
>> trying to figure out what was the main point, what the pronouns are
>> referring to, etc). Anyway, I think it's better to have something
>> imperfect than nothing at all, so here is my
>>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora>
>>
>> Feel free to add it even if you decide to ignore my comments.
> 
> Thanks for reviewing, Boris!
> 
> I'll make a final version incorporating much of the comments and suggestions, much appreciated.
> 
> I still think, though, that in principle the referral between gpuvm and this document should be the other way around, or it should all sit in gpuvm. In any case this is an initial version and as more comments and suggestions land, we can certainly update.

I think if we agree that GPUVM should be the common component that we recommend
drivers to use, we should reference to GPUVM whenever possible. However, I'm not
sure whether we'd want to dedicate *all* documentation to GPUVM. Since the topic
is rather complex, I can see that it might be beneficial to do both, discuss it
from a more abstract point of view and document the corresponding common component.

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> 
> Thanks,
> 
> Thomas
> 

