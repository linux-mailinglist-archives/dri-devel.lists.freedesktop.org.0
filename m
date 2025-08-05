Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422B0B1B1C0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 12:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DA210E25D;
	Tue,  5 Aug 2025 10:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b8jWIwV3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD9810E00D;
 Tue,  5 Aug 2025 10:10:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 401A45C1858;
 Tue,  5 Aug 2025 10:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E900AC4CEF0;
 Tue,  5 Aug 2025 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754388614;
 bh=7pQk1iFFbNlUBBZjYXpLBBqP7Ym383++EsWDKlWE6qw=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=b8jWIwV3WICqjBWlvKJXq5UsQrBhXWR6ZHfJ44PdkkEgBX5cMaEv1koofnrINGUUb
 3JbFQm0324CeOEC4DtmyPEVdZihm30DCd+s3mDH5VqYi+Udy6G6IrSpGKDnheU9lyk
 qGOUXtdAxw0PB1m9LeAGgB/vYTK7KE+3UW0NwfS+9ubk/NIk3T851lZ2iK2qdyFxeX
 niaY1qr9yxszzni05TBPERLKUTVFm3nifIHoJtbkmajPtmoVdlpAJ/HEjkLfC0PGGE
 vejn+kYWPIXo280ItRWt1jNlThpLsW0fuRefyf/DmjR13VMqtvminNow6m4xsyHbqT
 Zc9u77Oz5XC2w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 12:10:11 +0200
Message-Id: <DBUEUXL9KTUK.E54ZVQIZ6IEP@kernel.org>
Subject: Re: [PATCH v5 01/25] drm/gpuvm: Pass map arguments through a struct
Cc: "Matthew Brost" <matthew.brost@intel.com>,
 <intel-xe@lists.freedesktop.org>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Danilo Krummrich" <dakr@redhat.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, "Caterina Shablia"
 <caterina.shablia@collabora.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
 <aJGA4BPLJRs0RLfz@lstrano-desk.jf.intel.com>
 <cb5e582f-7c85-4de6-8039-5c62d1ce5950@intel.com>
In-Reply-To: <cb5e582f-7c85-4de6-8039-5c62d1ce5950@intel.com>
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

On Tue Aug 5, 2025 at 7:24 AM CEST, Himal Prasad Ghimiray wrote:
> On 05-08-2025 09:26, Matthew Brost wrote:
>> Also I believe Danilo's suggestion here was to define drm_gpuvm_map_req
>> as the argument and then embed drm_gpuva_op_map within
>> drm_gpuvm_map_req. So in patch [1], flags would be added to
>> drm_gpuvm_map_req rather than drm_gpuva_op_map.
>>=20
>> Matt
>>=20
>> [1] https://patchwork.freedesktop.org/patch/666211/?series=3D149550&rev=
=3D5
>
> Hi Matt,
>
> Thanks for the review. Initially, I considered using drm_gpuvm_map_req=20
> struct instead of passing drm_gpuva_op_map directly to the gpuvm layer,=
=20
> allowing it to handle split/merge decisions independently.

Generally, we should only have the flags field on struct drm_gpuva_op_map i=
f we
need to let GPUVM pass flags for (re)map operations to drivers.

> However, the upcoming patch [1] relies on this flag to determine=20
> driver-side behavior. So at the end drm_gpuva_op_map and=20
> drm_gpuvm_map_req might end up identical. Based on that=E2=80=94and Danil=
o=E2=80=99s=20
> feedback on this patch [2] I thought It will be better to keep a single=
=20
> op_map struct with the flag included.

Let's leave this to the upcoming patches, we can always adjust. For now, le=
t's
go with what Matt summarized above please.

> Boris, could you please confirm if the flag will be useful on the driver=
=20
> side [1]?
>
> [1] https://patchwork.freedesktop.org/patch/662832/?series=3D151264&rev=
=3D2
> [2] https://patchwork.freedesktop.org/patch/662819/?series=3D151264&rev=
=3D2
