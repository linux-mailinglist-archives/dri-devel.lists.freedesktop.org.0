Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FE0C92D6F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 18:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8E410E195;
	Fri, 28 Nov 2025 17:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="UPqTOA1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EE110E195
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 17:51:10 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8b1bfd4b3deso154598985a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1764352270; x=1764957070; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=onvIyaErE1aWYQFo6OqnWugBaON3BpZ7ThoIRVAF+KQ=;
 b=UPqTOA1bzLElwe6ux2Nv3OW2j5Ee/hej3TabuxSKzA23Ygkyyo1+Qaz2YPgTJHi0FR
 O3+3Qcu2BBGhswetGL7lCvjiU3HnaVsKSDyvTalNkl2mRzlpR6FNpBjJEyoE+if/J1NP
 LhOSHmkPEzEZwTpPxNVnn2dR3OHKvGQxu5y3tIjrJlqJvU4bTnh6g8o33hsEejJyk3KF
 gMYr0Qb16uLPvBpVfQv6YsV3alI+Sw/TzPx0pntCwi4bhYswR0oUYvUYIlvwARZ1GPmZ
 6r96cSg/N7kwp/nKn2L9FcX/qCNE+ohfbIwllHskNxFJnz0eOZtTlGhonZA1ziZ6uP3h
 oQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764352270; x=1764957070;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onvIyaErE1aWYQFo6OqnWugBaON3BpZ7ThoIRVAF+KQ=;
 b=S3pEkhPLGzd5OqhpazMcZt7CkupVVuBcPWjMyR9zKBmtoHG4C3RiVJLuMd3+bqRt+n
 XFpLnjWIITUtwZmv9yZdbNIXjRNkpW0sYt3mmPQ6TxY76DjoKY52WKlRdmbYqqzztMfG
 tuqvionn3JIcJpTDGEuqGzLVcoV1HmYPq2NtJK+6UgjWN18rogICAQRODFYyd9QF3VSg
 /BvnZN0MsKagLk7Lon9lq+2alAk1v2eyrhcAot6NRBaHd6w2QauwsCP+q2trjimvc60B
 DoaJZwQsN9bypA/nV8Olg2pbcZVgvHYlbhsE9S6Ha6C05Oy+WNaKNGuXcyWzN5dw8X2V
 mIMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR88ZHIWRTGPYX1MvfeFY4VTXMyx2lTBsQGNtVRmi8q7/4TjjrSzuYaayVYZPIPMXDMmlRTTuEvO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsSF6aQmTUqQld7qMhf3So9E/MdAL/R9C+GM6x018Lw+qZzHIX
 WXH4naK+jk6Qz1VTLYePLcebgbI/IobChMBysUrPyE2NTfNKcufSJng5Tx6v8cPh1T8=
X-Gm-Gg: ASbGncvGfzEFNbnFo3jKqAZyP4l2Dm88yKlhXBrHfoXh7E3vhf+R/+5yw7CcTQZNHuw
 sVBzmgysPLtKKwN16XfxwSVSLJkW6gzpsbvAbDIPhoKIOfzehLOCBsspKPXLAgX/KxhfMqQkkJT
 zbI0xphiLIfQvHjVa0DHF+qVN+vaPg/+vAIFxUUvYyXmkAguXGSZ2rPh6ZQHdML+Dt+Ubm5EQyU
 mg7xrR6jl1SqQ+xYJiqcJKUWEeXdPy3gLmmwkOneKdxRbP01Tern0eUlud7zvmJ78Bj5o8JGQcO
 stHngN2PLapZjNrmNNjwFQLx9VWkWbDozJ/vuzeUTmyXrM2x3FqCFXVR2MsusW7JKQxm72NIakO
 HupsDEvmXh+3jviNgi9Eq1NPsB/4uIxXP4gWvQqguUTMijq3PMQqO25ybEKFTEQi1kqBxY0ZUOJ
 q/PhPV8ybTWBKQ4Rd3Q5xBl7BwD/5Sqn1A0Llu4NlgAFwmMLQ+yFlEORLW
X-Google-Smtp-Source: AGHT+IHclx5WylmmMrcpXz3ZKtKlEIx7+f5j0jNJSK6KrFbXt341r2JXB7z5MW1Se7zpnvrWbmNCuw==
X-Received: by 2002:a05:620a:45ab:b0:8b2:ef70:64f5 with SMTP id
 af79cd13be357-8b33d269cc2mr3759648085a.48.1764352269876; 
 Fri, 28 Nov 2025 09:51:09 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b52a1b7d99sm342498985a.28.2025.11.28.09.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 09:51:09 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vP2ce-00000003Vf9-1jsT;
 Fri, 28 Nov 2025 13:51:08 -0400
Date: Fri, 28 Nov 2025 13:51:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, ziy@nvidia.com,
 apopple@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 rcampbell@nvidia.com, mpenttil@redhat.com, willy@infradead.org
Subject: Re: [RFC PATCH 6/6] mm: Remove device private pages from the
 physical address space
Message-ID: <20251128175108.GG812105@ziepe.ca>
References: <20251128044146.80050-1-jniethe@nvidia.com>
 <20251128044146.80050-7-jniethe@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128044146.80050-7-jniethe@nvidia.com>
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

On Fri, Nov 28, 2025 at 03:41:46PM +1100, Jordan Niethe wrote:
> Introduce helpers:
> 
>   - device_private_page_to_offset()
>   - device_private_folio_to_offset()
> 
> to take a given device private page / folio and return its offset within
> the device private address space (this is essentially a PFN within the
> device private address space).

It would be nice if we rarely/never needed to see number space outside
the pte itself or the internal helpers..

Like, I don't think there should be stuff like this:

>  					entry = make_writable_migration_device_private_entry(
> -								page_to_pfn(page));
> +								device_private_page_to_offset(page));

make_writable_migration_device_private_entry() should accept the
struct page as the handle?

If it really is needed I think it should have its own dedicated type
and not be intermixed with normal pfns..

Jason
