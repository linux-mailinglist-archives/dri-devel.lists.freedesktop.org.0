Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E2CACC842
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047D310E614;
	Tue,  3 Jun 2025 13:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="iQsAye+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDCE10E6E8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:48:46 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6f0c30a1ca3so55273366d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748958525; x=1749563325; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=;
 b=iQsAye+J/6i5S8dvswa8vIidcStrhdRx4TK+W53NFtouU6tq+ah9l9lusenpqRuJBE
 M/5lcSZbCvxO3I6cjiY64rkcXJxBwFXEAvfyPRpnQgEym5pR7wdbnWCmCrUTipaHujAc
 2ja4C6o9ZDc4F9SqP0uf1icngkOdsrkk6xIHiQonxpNIMDUuYGa/zU0iZDSreTKmBPSA
 6F/JM2dQMuxmIivvRk5a2M7CezLjhIVcXp3x5WnrhbqX77t3+zpJxOypXy72/s9FH0i8
 jPTf/VC93WuEBSfwZThNVtxM2e7PTLbDi3/MItHRmLFC6xGsB1Td0gCXugYvOrhkjV10
 s3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748958525; x=1749563325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=;
 b=jDTPjPpVQ+Ks7D/X9PjRmIuFAaXdu4r6Aq96p9qCvT8Gs+6L9d/zYCugu8HpVrnTLt
 cQ/DIDk8ho5XiJ1MYoF7k2XCUgojDgwWU7VXZugpTgaL7LVBsL//b6XHtGzRd3hGr/1z
 ES0v+vlyWvG+T3MYluhUumrFewt3Kjip1v2NBugY/w+o6fsZ9QkHwJZkYUxFzVnGpW/I
 usCn7iumGL1DYdlJfltM5CXUf8k7oBHQulrPy4dWC+0+Fau1fzI+MeMDB+b/aBNaAZKu
 r86Bsh2brQcBEl09WcHxKHEYJNpXha3gp/zWOc9GMQXU0r9skHZFwO0AP57RObB3+hO3
 gipA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSgBumzSr6t6aPz4OvuOOPjlc4yuB+ndnh9EoUkefb4Gg+Ko0YPhPRcTohXaJaOytNxL/6IewYeH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNjzD/FVVT6zTsjj8eRPm5tBCirJqABw5yvPPcTZowQlgxj+Fq
 RPDWrpXpKPJsDWOSu4AMwOeiG6FPyThNmKpnoGfTb5/C7WJsnwCvl3wMzm4Qr5eU7+0=
X-Gm-Gg: ASbGncshwo2hNbYnAkaRn8DGul9ZPkkmGlCNCCKGeuB1YL70aq2NIL+k098kxawB2MW
 7UvkeXeZIG6+coL+0jvdz4agwG+yAvx3kS8xl1DiInlUF76U2Pm5Pln69Ah8tV6JnsaSuFspLgR
 S8OhA3j2NYzH4aeKNB+7NtplTVLSRUIeJMMU/r3sTl2pl63jN3zqrUNWKmY4zHNLVSg+lmcXrah
 Y5v3EVLjiuG6iAtdBA6BiPl6GryWg7/oil5daAy9s3EbQq6BNfVgTrgoADZyqLvZDzAlGzsyEFI
 IdpimxRQtlqoyXv9OZ6GAUyYbA4D5z6a3+o9RFkHfL1HWsWl2XQ15K3v1lHfejs2/dA1ejobnXD
 Qh2VInAwJqw1atLaai7gc914VtjU=
X-Google-Smtp-Source: AGHT+IH3Vn4y24ccOnNjvyrMKRdXMvoXmINXxWtKUHHRDjsnlypx2qCEJce143rhCfMATkU1PKi1PQ==
X-Received: by 2002:a05:6214:27cb:b0:6fa:acc1:f077 with SMTP id
 6a1803df08f44-6facebef794mr265266426d6.35.1748958525108; 
 Tue, 03 Jun 2025 06:48:45 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a10e844sm842209085a.49.2025.06.03.06.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:48:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMS0S-00000001hBt-0o7d;
 Tue, 03 Jun 2025 10:48:44 -0300
Date: Tue, 3 Jun 2025 10:48:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 08/12] mm/khugepaged: Remove redundant pmd_devmap() check
Message-ID: <20250603134844.GI386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
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

On Thu, May 29, 2025 at 04:32:09PM +1000, Alistair Popple wrote:
> The only users of pmd_devmap were device dax and fs dax. The check for
> pmd_devmap() in check_pmd_state() is therefore redundant as callers
> explicitly check for is_zone_device_page(), so this check can be dropped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/khugepaged.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
