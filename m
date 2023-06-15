Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD818731DDC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 18:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D263410E0A4;
	Thu, 15 Jun 2023 16:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C158110E0A4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686846730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8prCxNwHYsAASYpnEixZIiXJnat1jStC3yPASEgEOY=;
 b=BBtLvqKVVyiW0km2jvqAxtp/J7Vo6qJLT/J9kycXZwXwQm6yW5CVCe15BF1OXUR7UWr/dw
 rnHr5LsmSEccbyuhPC7CsY6g680A75vgMXqL0/3JpScO8dY+Dke8nS6UqMGCEshTH0PR/a
 GytHedEiIskrv9Fpa/HCyJb+2r7Xmbw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-LAFhG_ZkPAG5ThvS4cz2CQ-1; Thu, 15 Jun 2023 12:32:00 -0400
X-MC-Unique: LAFhG_ZkPAG5ThvS4cz2CQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9835bf83157so6599566b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686846719; x=1689438719;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P8prCxNwHYsAASYpnEixZIiXJnat1jStC3yPASEgEOY=;
 b=R8oJPm4qmRoIhyD5c6gkl6Mw6n8dUrJ51EuC7ClxXT0cyZsXN0aMiCcAEdiV0IW5/e
 PAOM77tmmBXmO00kVnDetIDvHzDmYq/JWIgCnQsAPt92VsbkVKIRSbeER0lqlPkEHWJ3
 Bbg+QFMTPK1ga9ejVhUcTh7J1iCAU1vmb2VRs4fksD3u/b5crN1yjDxdylL8CVu0zXYv
 YF51vwuRTotzexVTsKefo3yPTSg2Wwy/MeR7s/w24wHQyn3vjZyQyKZ36SBR4yhRF5om
 ii1UVwy8BkbhZwTlQ16nDL/raYddzBHLgj/d4reEheAo3AFCfHalTut7dQZqW6CwH5/P
 NO9A==
X-Gm-Message-State: AC+VfDxJdfm7h0Nme5D3mIhmFaR1115BE4yDcDCn8qz34mR5QktYBJjb
 ZQ9d55pUlb4ip4iO5zgmmog5f+XZDzq1NXvVIaEHqxKvGrO6RSyRgaa8zCDrlDiPnbiPK6267t9
 f6KzIwOFRijo6G0az7W3Hylw0lR2b
X-Received: by 2002:a17:907:36c3:b0:973:9f60:c57e with SMTP id
 bj3-20020a17090736c300b009739f60c57emr19336043ejc.2.1686846719146; 
 Thu, 15 Jun 2023 09:31:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5+R8RzzvJRBN02oNH7VD/7mlr9HZ1UXhQY/4JOFMYjuMwKKZwmGEwfZjYH1RFjjAHfmir7Fw==
X-Received: by 2002:a17:907:36c3:b0:973:9f60:c57e with SMTP id
 bj3-20020a17090736c300b009739f60c57emr19335996ejc.2.1686846718666; 
 Thu, 15 Jun 2023 09:31:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a17090612cd00b0096f7cf96525sm9642613ejb.146.2023.06.15.09.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 09:31:58 -0700 (PDT)
Message-ID: <27b46c9e-0ebb-74d2-c22e-3f7fc7addbdc@redhat.com>
Date: Thu, 15 Jun 2023 18:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH drm-next v4 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
To: Donald Robson <Donald.Robson@imgtec.com>
References: <20230606223130.6132-1-dakr@redhat.com>
 <f5723444623b41d58f93c3f0ab662e9b37105765.camel@imgtec.com>
 <67ffef18-fae4-cb84-ff75-c4eed92a8755@redhat.com>
 <1cee380fb31e1a2f499e50e6b8771d86a68c1b16.camel@imgtec.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <1cee380fb31e1a2f499e50e6b8771d86a68c1b16.camel@imgtec.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "corbet@lwn.net" <corbet@lwn.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/14/23 09:58, Donald Robson wrote:
> On Tue, 2023-06-13 at 16:20 +0200, Danilo Krummrich wrote:
> 
>> I'm definitely up improving the existing documentation. Anything in
>> particular you think should be described in more detail?
>>
>> - Danilo
> 
> Hi Danilo,
> 
> As I said, with inexperience it's possible I missed what I was
> looking for in the existing documentation, which is highly detailed
> in regard to how it deals with operations, but usage was where I fell
> down.
> 
> If I understand there are three ways to use this, which are:
> 1) Using drm_gpuva_insert() and drm_gpuva_remove() directly using
>     stack va objects.

What do you mean with stack va objects?

> 2) Using drm_gpuva_insert() and drm_gpuva_remove() in a callback
>     context, after having created ops lists using
>     drm_gpuva_sm_[un]map_ops_create().
> 3) Using drm_gpuva_[un]map() in callback context after having
>     prealloced a node and va objects for map/remap function use,
>     which must be forwarded in as the 'priv' argument to
>     drm_gpuva_sm_[un]map().

Right, and I think it might be worth concretely mentioning this in the 
documentation.

> 
> The first of these is pretty self-explanatory.  The second was also
> fairly easy to understand, it has an example in your own driver, and
> since it takes care of allocs in drm_gpuva_sm_map_ops_create() it
> leads to pretty clean code too.
> 
> The third case, which I am using in the new PowerVR driver did not
> have an example of usage and the approach is quite different to 2)
> in that you have to prealloc everything explicitly.  I didn't realise
> this, so it led to a fair amount of frustration.

Yeah, I think this is not entirely obvious why this is the case. I 
should maybe add a comment on how the callback way of using this 
interface is motivated.

The requirement of pre-allocation arises out of two circumstances.
First, having a single callback for every drm_gpuva_op on the GPUVA 
space implies that we're not allowed to fail the operation, because 
processing the drm_gpuva_ops directly implies that we can't unwind them 
on failure.

I know that the API functions the documentation guides you to use in 
this case actually can return error codes, but those are just range 
checks. If they fail, it's clearly a bug. However, I did not use WARN() 
for those cases, since the driver could still decide to use the 
callbacks to keep track of the operations in a driver specific way, 
although I would not recommend doing this and rather like to try to 
cover the drivers use case within the regular way of creating a list of 
operations.

Second, most (other) drivers when using the callback way of this 
interface would need to execute the GPUVA space updates asynchronously 
in a dma_fence signalling critical path, where no memory allocations are 
permitted.

> 
> I think if you're willing, it would help inexperienced implementers a
> lot if there were some brief 'how to' snippets for each of the three
> use cases.

Yes, I can definitely add some.

> 
> Thanks,
> Donald

