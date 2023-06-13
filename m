Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904AA72E592
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 16:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE6E10E25F;
	Tue, 13 Jun 2023 14:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF3B10E25F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 14:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686666049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZEUY4eFrIiW2hJOSDRcVK2BXCKkst+J0Ig7f66lGys=;
 b=QrVA9CcEA+1n+uKHqPsnafyLOSX1jWhvrvdsh34JXlqLlyXdm2/g3zfF3/Lk6W3Sz6dGjV
 /HJexiVtPBqzOeTn8XklyfQbZzzeZKppan8WfT/owm4seEUd50uoI7Umo2RNmL+LOYfnRv
 q38TBQfQYx85BY9mXRez6USt9WIDTQU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-O7pHRE3WMaCR1FIo9EwYAg-1; Tue, 13 Jun 2023 10:20:47 -0400
X-MC-Unique: O7pHRE3WMaCR1FIo9EwYAg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-977cb73efe8so606476666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686666044; x=1689258044;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cZEUY4eFrIiW2hJOSDRcVK2BXCKkst+J0Ig7f66lGys=;
 b=NMXd4hm7Dj3Ns272yOYG9lxzKSJuxkoBMW/BpWHgfPcKZftUkEPz75KIuOYkwE0H9d
 b0msKjH6p/nxi/hd0bSOthB3xO0EEjS0dO7rSUdkqI3PMZvDK9KgWv0LVlX72pG+v99X
 ujDDm03TxwwxiNzrVkIOqobPmlCIe9XxwKXTsgY+MA8vI/W+frSI5d28JwTeFPKInpZO
 bGn3xNn2qHorH710C1Gag39gEK34wG4WMmufQWlrCe+n6Ewa+bmkeqG2iPNrgmm4vQAT
 62s5XYpNHjrJFL33UZuwxDlwYYXgMFE8AWhdFFukvWeln31Rps1XrznlOmKT5uHtYwoQ
 /SdQ==
X-Gm-Message-State: AC+VfDynnVKf4mzoxh6cu8nhgOcn3kb8H0RSxC1lMWRneYBfFNllYK/X
 yAoJxlXPtiFcA3sz8nvWw7y+LIAUq4InuFmOqeblmcbEISfLXU19dta9Syb+HLV5M5LL+ExUOch
 O2B86sB3zJqICT0jDNCATJPDZFtcy
X-Received: by 2002:a17:907:809:b0:977:cbaf:bc56 with SMTP id
 wv9-20020a170907080900b00977cbafbc56mr13671264ejb.43.1686666044426; 
 Tue, 13 Jun 2023 07:20:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ad5nom20kLaHoCm86c18wBjHdHRHf+yMBQw0AQn5oLgUB+K/pfcP4C4uj6QCUmqL4FWtcyQ==
X-Received: by 2002:a17:907:809:b0:977:cbaf:bc56 with SMTP id
 wv9-20020a170907080900b00977cbafbc56mr13671233ejb.43.1686666044074; 
 Tue, 13 Jun 2023 07:20:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a170906081800b009786c8249d6sm6855650ejd.175.2023.06.13.07.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 07:20:43 -0700 (PDT)
Message-ID: <67ffef18-fae4-cb84-ff75-c4eed92a8755@redhat.com>
Date: Tue, 13 Jun 2023 16:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH drm-next v4 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
To: Donald Robson <Donald.Robson@imgtec.com>
References: <20230606223130.6132-1-dakr@redhat.com>
 <f5723444623b41d58f93c3f0ab662e9b37105765.camel@imgtec.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f5723444623b41d58f93c3f0ab662e9b37105765.camel@imgtec.com>
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Donald,

On 6/9/23 13:56, Donald Robson wrote:
> On Wed, 2023-06-07 at 00:31 +0200, Danilo Krummrich wrote:
>>
>> Christian König (1):
>>    drm: execution context for GEM buffers v4
>>
>> Danilo Krummrich (13):
>>    maple_tree: split up MA_STATE() macro
>>    drm: manager to keep track of GPUs VA mappings
> 
> I have tested the drm GPUVA manager as part of using it with our new
> driver.  The link below shows use of the drm_gpuva_sm_[un]map()
> functions.  I think this is based on the v3 patches, but I have also
> tried it locally using v4 patches.  We will be submitting this
> driver for review soon.

That's awesome - thank your for taking the effort!

> 
> https://gitlab.freedesktop.org/sarah-walker-imgtec/powervr/-/blob/dev/v3/drivers/gpu/drm/imagination/pvr_vm.c
> 
> In a previous incarnation, I used the drm_gpuva_insert() and
> drm_gpuva_remove() functions directly.  In some now abandoned work I
> used the drm_gpuva_sm_[un]map_ops_create() route.
> 
> The only problem I encountered along the way was the maple tree init
> issue already reported by Boris and fixed in v4.  One caveat - as
> our driver is a work in progress our testing is limited to certain
> Sascha Willem tests.
> 
> I did find it quite difficult to get the prealloc route with
> drm_gpuva_sm_[un]map() working.  I'm not sure to what degree this
> reflects me being a novice on matters DRM, but I did find myself
> wishing for more direction, even with Boris's help.

I'm definitely up improving the existing documentation. Anything in 
particular you think should be described in more detail?

- Danilo

> 
> Tested-by: Donald Robson <donald.robson@imgtec.com>
> 
>>    drm: debugfs: provide infrastructure to dump a DRM GPU VA space
>>    drm/nouveau: new VM_BIND uapi interfaces
>>    drm/nouveau: get vmm via nouveau_cli_vmm()
>>    drm/nouveau: bo: initialize GEM GPU VA interface
>>    drm/nouveau: move usercopy helpers to nouveau_drv.h
>>    drm/nouveau: fence: separate fence alloc and emit
>>    drm/nouveau: fence: fail to emit when fence context is killed
>>    drm/nouveau: chan: provide nouveau_channel_kill()
>>    drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
>>    drm/nouveau: implement new VM_BIND uAPI
>>    drm/nouveau: debugfs: implement DRM GPU VA debugfs
>>

