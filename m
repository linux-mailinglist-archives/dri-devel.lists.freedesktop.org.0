Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2923A8254B3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 14:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5892D10E5FC;
	Fri,  5 Jan 2024 13:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFBF10E5FC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 13:53:43 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dae7cc31151so1341874276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 05:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704462822; x=1705067622;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFOCDfiRNVhSwkgtjGZQjnuXOXWIEEACwgomsYksHic=;
 b=S6S5xQgMUoS9ztF2a6VVUPqR65Yj+RfFlIbOG/XswfjtR/BIXc4r3DRxAWk7CSCETD
 TQRAfpEBT6CQdOqJam3wutY+8iIYT4zHaxRRvKsbji8lgBFfnrlk+qb9ifAnVso1Iv3O
 IufnuPQUZuoh5uxh3+tx3FRlPAhbSWQnb6qoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704462822; x=1705067622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFOCDfiRNVhSwkgtjGZQjnuXOXWIEEACwgomsYksHic=;
 b=Yna3A8LN+tOheSz8c6z6bKvJxSwvlJZKNJO1Gy+fxceMTlmTn2VwC7YnJ8rP3sQfk8
 UxWfbthYi8Cse9lE3kaF1sHSL+asvrL3Oy9+1+n10oCfublfqwVW9PIrf9NvQLToypbn
 AOPcwE6h2xJj7odRuHIxLX/evI0EvOphad62GIsnc7mBJkK6HldTDqB5dc8W85DIagtk
 k6M8ue7hq2ThhlyVMBhd9JF3uDOg0NNuTlR08mWUaGMwuZ5UL0ZDkYv5GAVjCVfjS2/B
 vvDX98wjlTBWkBz3BnFro+9cluF7WCKgajZYSAgmuXaCDIztnLJeyxM/ScXhxIMzMNu/
 WwWA==
X-Gm-Message-State: AOJu0YyPRX05ofkoD9HQGJcNLR6MSqFbwKmgN65FK8vvepoE1SLrpQRN
 2GbrpQlnwDy8wfzN9ffoo7PXnB8YH1g+IcmwXxu/0GfPxr1+rIb358Aq/U8=
X-Google-Smtp-Source: AGHT+IFwllAGuSzxfiNvJYq5HVd8LA4btV4STKM9+hWWoy2AfS19e9FrTfrglCtGtoFOE4WJjIZPhnxKC2RbUI9hZPg=
X-Received: by 2002:a5b:b43:0:b0:d9b:3ed:41a5 with SMTP id
 b3-20020a5b0b43000000b00d9b03ed41a5mr1899489ybr.21.1704462822423; 
 Fri, 05 Jan 2024 05:53:42 -0800 (PST)
MIME-Version: 1.0
References: <2b5648aa-f83d-d8f7-b0fd-39c859f32f33@linux.intel.com>
 <20240105135105.1921947-1-zack.rusin@broadcom.com>
In-Reply-To: <20240105135105.1921947-1-zack.rusin@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 5 Jan 2024 08:53:31 -0500
Message-ID: <CABQX2QOK8yKqREbnuRy0bZwYBssS3Cmec+wV3Lq0MNZGFgsA1Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/ttm: Make sure the mapped tt pages are decrypted
 when needed
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 5, 2024 at 8:51=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com>=
 wrote:
>
> Some drivers require the mapped tt pages to be decrypted. In an ideal
> world this would have been handled by the dma layer, but the TTM page
> fault handling would have to be rewritten to able to do that.
>
> A side-effect of the TTM page fault handling is using a dma allocation
> per order (via ttm_pool_alloc_page) which makes it impossible to just
> trivially use dma_mmap_attrs. As a result ttm has to be very careful
> about trying to make its pgprot for the mapped tt pages match what
> the dma layer thinks it is. At the ttm layer it's possible to
> deduce the requirement to have tt pages decrypted by checking
> whether coherent dma allocations have been requested and the system
> is running with confidential computing technologies.
>
> This approach isn't ideal but keeping TTM matching DMAs expectations
> for the page properties is in general fragile, unfortunately proper
> fix would require a rewrite of TTM's page fault handling.
>
> Fixes vmwgfx with SEV enabled.
>
> v2: Explicitly include cc_platform.h
> v3: Use CC_ATTR_GUEST_MEM_ENCRYPT instead of CC_ATTR_MEM_ENCRYPT to
> limit the scope to guests and log when memory decryption is enabled.

Sorry, this also got a bit lost during the s/VMware/Broadcom/
transition. It seems to be pretty safe in general now. I wasn't able
to find a really clean way of adding a warn_once when pte's don't
match as suggested by Thomas, but I did add a quick log to at least
point out in the logs that we've enabled memory decryption in tt.

z
