Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9F483D3E1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 06:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD8910ED3B;
	Fri, 26 Jan 2024 05:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403FB10ED3B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 05:11:30 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc6432ee799so248223276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706245829; x=1706850629;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWNKgB2N3DB+66pFOK/0j9b8QzacRkS6VBRUK4oWycI=;
 b=DxxDw2NJusMyuZEzCppqMdq1nGAoYNA7mBntiWYbsKgOFtPhJtSDSKb6+pbxRwnELf
 ZpwnOkJdWF3z5hCAw4Mar6cHkA8wLtMKjo9w6oBynEZ8hPW+Z8a1EtG8Pq7NbTdJjtMY
 /l5qj8NaFKVjwlRw3+jchM13VOKGd09Sp3VO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706245829; x=1706850629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWNKgB2N3DB+66pFOK/0j9b8QzacRkS6VBRUK4oWycI=;
 b=bws+Rv9s3PIR6ceEAr6sPp5nYarVsKOVkBqedAy8Sykp2BCgCB7xjw3kKU5aj8yj52
 GqSwxwZsvJxPkRGqp5TjofCsfWt3cUBGPq1kV+p6C/b/Tgmgf1e7RrLxDMa8Fe5jnSGr
 qe0GZWpmQL7kLCfMI7JBIsz5yEOg+AdT6U/aHO5NVB+rSSCeYRXJ0OqxXGBa3fNVgEJy
 OBrhUEH2EaLoAwelcAnLw9qGAMGwElgK09glp4BQ9OT/rKtzbUqBL3RWM4U6BmT+vy+t
 VWTSKzb5PiQ8TNmdgXfYArTJ4s1CZFHMMMEFJMV7UYwc2r/S94DS8rb4/unFcft69swj
 MitA==
X-Gm-Message-State: AOJu0YyYwT9/nVLm370izW2YYGOz1zRVZ329fCxwxUotsjI4PbIfQO6n
 a5ITlC5UYagTN3K/3LkLUw8vAlA311NB1BEKmUH0l+8H8ogchkre57FqttOGfLkfaKvUc4FnA0e
 0rH3pygA5XfTB/4idOJbdHR4WlC+atxP/MeoxNqkmGEihPvg=
X-Google-Smtp-Source: AGHT+IH0BWVFfOQVB4B3XDw2qmadyX2DJH67AAmoNam42TDVfLbbO4flPb26opFK9plDdXcih/QQcRuXkYkRfRu/MWY=
X-Received: by 2002:a25:ed06:0:b0:dc6:9ea:3d65 with SMTP id
 k6-20020a25ed06000000b00dc609ea3d65mr752301ybh.84.1706245828072; Thu, 25 Jan
 2024 21:10:28 -0800 (PST)
MIME-Version: 1.0
References: <2b5648aa-f83d-d8f7-b0fd-39c859f32f33@linux.intel.com>
 <20240105135105.1921947-1-zack.rusin@broadcom.com>
In-Reply-To: <20240105135105.1921947-1-zack.rusin@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 26 Jan 2024 00:10:16 -0500
Message-ID: <CABQX2QMg4L3oQe4pU4saBgopXw7CKyGrQa_LKE0xtSwyEKacnw@mail.gmail.com>
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

Hi, Christian.

Gentle ping on that one. This is probably the cleanest we can get this
code. Can we land this or is there anything else you'd like to see?

z
