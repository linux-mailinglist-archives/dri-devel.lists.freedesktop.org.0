Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C9675605F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 12:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573F510E225;
	Mon, 17 Jul 2023 10:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B138D10E225
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 10:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689589623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QcjXX5GWlegc91aegHozDG5ys9NXk4J7QfyGnNAR82g=;
 b=XrpZPjAsl8mA7ZAChOz1BPW2utDsrTt6W0f0wLIkGDy7RKO8FekuySZ6xmU+/0l2b/WrdZ
 UbDp1rDD2Ylm2q5KuxrTEwqeHD3q0mvKAOj3Vqf2Aqfhw9UT8z5BAoZAEHiY2fMGnK29HR
 ZktIiR5/LJDY0BS79YUN8cln1t31U0w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-kHVPZAhYMV6JDwlf7a1m_A-1; Mon, 17 Jul 2023 06:27:02 -0400
X-MC-Unique: kHVPZAhYMV6JDwlf7a1m_A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f2981b8364so2678256f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 03:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689589621; x=1692181621;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QcjXX5GWlegc91aegHozDG5ys9NXk4J7QfyGnNAR82g=;
 b=Yg6msAVt/iWJ6S+kwlCeHGmWCL7B06Urf1AkomfMr4hYv+hk0BL/00yNJhc8Z12aRK
 SHx+kejAmjoNdNJ/p1wxExwOs1UY/Hel+cm1nNGaxOc4S96S4SlohAx0T1R885fTNzqw
 D3pSWoyZ9CEOc5DbGAJCeWlRlrdnsoT+g3SG5CnnaXSh7be6//flCdgo2k4YgBRE+wid
 op5ji4YpqzRNkpN/cpKldB+L9wkOtlLyUevtbMjTtCbZCH3FSda6StmfkrbsXEqRH23H
 Qe12CCfgVDAaiR6SIaFcMT3ng6m34A9nCUBdzCf/gb/8XQAb5n7XAd6/2Y8RXjvtIxHd
 sJCw==
X-Gm-Message-State: ABy/qLaa9UjBVJuZm6P0ohG6YdKWnS3UVUEQGAWfj5mO/jGv+XVVX5ku
 hceMVuQuNcfOXpCNbM2JFSydbT2D7/nX2NJ7O+YNeDC6J+vaztZA8DgMHGlTgyK3sA6JblLBh13
 R6fjXRVQXGjxcG9rX3iiPY9LWjj7S
X-Received: by 2002:a5d:6a49:0:b0:314:2c17:d921 with SMTP id
 t9-20020a5d6a49000000b003142c17d921mr10297827wrw.38.1689589621623; 
 Mon, 17 Jul 2023 03:27:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHg4QSrt7ASwOV1fEBcNK4Q/NKk0aYoKscyfvU06BxfjAob7ZBV5ewkV0pAvLD46ImkfH0r8w==
X-Received: by 2002:a5d:6a49:0:b0:314:2c17:d921 with SMTP id
 t9-20020a5d6a49000000b003142c17d921mr10297812wrw.38.1689589621295; 
 Mon, 17 Jul 2023 03:27:01 -0700 (PDT)
Received: from ?IPV6:2003:cb:c735:400:2501:5a2e:13c6:88da?
 (p200300cbc735040025015a2e13c688da.dip0.t-ipconnect.de.
 [2003:cb:c735:400:2501:5a2e:13c6:88da])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d4b10000000b003143be36d99sm18839549wrq.58.2023.07.17.03.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 03:27:00 -0700 (PDT)
Message-ID: <4a7feeb3-0c9e-0dba-1023-4f0ae1bfe471@redhat.com>
Date: Mon, 17 Jul 2023 12:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/5] mm: introduce vma_is_stack() and vma_is_heap()
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230712143831.120701-1-wangkefeng.wang@huawei.com>
 <20230712143831.120701-2-wangkefeng.wang@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230712143831.120701-2-wangkefeng.wang@huawei.com>
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
Cc: selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.07.23 16:38, Kefeng Wang wrote:
> Introduce the two helpers for general use.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   include/linux/mm.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 1462cf15badf..0bbeb31ac750 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -926,6 +926,18 @@ static inline bool vma_is_anonymous(struct vm_area_struct *vma)
>   	return !vma->vm_ops;
>   }
>   
> +static inline bool vma_is_heap(struct vm_area_struct *vma)
> +{
> +       return vma->vm_start <= vma->vm_mm->brk &&
> +		vma->vm_end >= vma->vm_mm->start_brk;
> +}
> +
> +static inline bool vma_is_stack(struct vm_area_struct *vma)
> +{
> +       return vma->vm_start <= vma->vm_mm->start_stack &&
> +	       vma->vm_end >= vma->vm_mm->start_stack;
> +}
> +
>   static inline bool vma_is_temporary_stack(struct vm_area_struct *vma)
>   {
>   	int maybe_stack = vma->vm_flags & (VM_GROWSDOWN | VM_GROWSUP);

Looking at the comments in patch #3, should these functions be called

vma_is_initial_heap / vma_is_initial_stack ?

-- 
Cheers,

David / dhildenb

