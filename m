Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764ACB2DC06
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 14:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE75910E714;
	Wed, 20 Aug 2025 12:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fdkjwDr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F08510E140;
 Wed, 20 Aug 2025 12:04:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A241C61430;
 Wed, 20 Aug 2025 12:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9874FC4CEEB;
 Wed, 20 Aug 2025 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755691495;
 bh=/E8c7V580I2/gRQqUxnFdTkr3E+gxiO982o6bFa1zlU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=fdkjwDr5xn3aIoF6fl+/JE9+7/sZqDq82WXMkHlAPNiazHV4p+x+5dInAs7UwI6kM
 A7+/Ghd8GvxyQhTMHHpsnJ42dEaKx3PwYnYKD2LMcz5aWTp3FaBf4tNaN+j3vpZaDL
 KfYhuKDdFd8RPhYxYseZa37bZPp2+STZI9Sw9PwZaa2j3nMhVM2WCUDunDe0GD0O/z
 X+BKL5T3EFJaRmNnBOZ1DDciiJkMtn0tzYPac/yrdr8BVG2mN0CKtVxvDC5Q5Ylu05
 aF66jl9M5OzU3MrWxsf3Tn3pt9DmqXZm+zg+z1iRfkimAhnrJk/M0hNZbYM1Y5BqsI
 f2ZbyiW8ZEoqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 14:04:51 +0200
Message-Id: <DC78OWRRDWEB.2Y6NDT6UGEJ9H@kernel.org>
Subject: Re: [PATCH v8 01/24] drm/gpuvm: Pass map arguments through a struct
Cc: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Brendan King" <Brendan.King@imgtec.com>, "Matt Coster"
 <matt.coster@imgtec.com>, "Boris Brezillon" <bbrezillon@kernel.org>,
 "Caterina Shablia" <caterina.shablia@collabora.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Matthew Brost" <matthew.brost@intel.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
 <20250818215753.2762426-2-himal.prasad.ghimiray@intel.com>
 <20250820135657.19a6bcbc@fedora>
In-Reply-To: <20250820135657.19a6bcbc@fedora>
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

On Wed Aug 20, 2025 at 1:56 PM CEST, Boris Brezillon wrote:
> On Tue, 19 Aug 2025 03:27:30 +0530
> Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
>> +/**
>> + * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops=
_create]()
>> + */
>> +struct drm_gpuvm_map_req {
>> +	/**
>> +	 * @op_map: struct drm_gpuva_op_map
>
> Doc name doesn't match the field name.
>
>> +	 */
>> +	struct drm_gpuva_op_map map;
>
> Nit: not convinced map is a good name for that field, given this is a
> map_req, so we now those are map-related arguments. I would probably
> go for 'op'.

Indeed, thanks for catching this! I thought I was suggesting this name in a
previous version too.
