Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60236B22E3B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 18:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924A810E61C;
	Tue, 12 Aug 2025 16:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XbUHCNGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FB110E61C;
 Tue, 12 Aug 2025 16:51:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6DCF8A57737;
 Tue, 12 Aug 2025 16:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBE0C4CEF0;
 Tue, 12 Aug 2025 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755017476;
 bh=nKoG5s9KE5VuYOww9nWFvxIiz2+ngkmQWq3/VFPjcOs=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=XbUHCNGU+yoat9PLyUb6JCiitWvNxnEmybXW3iAbGdWKd0EQgfRzggDWQcz04yFeu
 meStvHN6QLRALvX85L9cbiDvFoMmEvcdMKnL+8qOSl/x6wRf6KPht23ahvXgI6cspa
 PlVpqOjV885/q9hq1bIlVrMcunIksPq5xcx87wvZqPZ7QNVPvLD7hdReOc21sG+SKg
 o/j4bd0+MhhCinPttaOhKRUSSx5aOMNNED2ei7DXzXLmSfOYtfJ/8uw4kzJudYbu8z
 PqpcJNF09qeU/ewfXUuTkQas3DnwsdKgNvMbETQHEKG9rGpoa5tjwxKJG9W2L3Ohp4
 MWyC53cFFGc2g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 18:51:12 +0200
Message-Id: <DC0LRSHVGYYQ.JY2VS78B5EMM@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 01/26] drm/gpuvm: Pass map arguments through a struct
Cc: <intel-xe@lists.freedesktop.org>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Brendan King" <Brendan.King@imgtec.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, "Caterina Shablia"
 <caterina.shablia@collabora.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250807164338.1832254-2-himal.prasad.ghimiray@intel.com>
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

On Thu Aug 7, 2025 at 6:43 PM CEST, Himal Prasad Ghimiray wrote:
> @@ -2102,17 +2106,16 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void =
*priv,
>  static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		   const struct drm_gpuvm_ops *ops, void *priv,
> -		   u64 req_addr, u64 req_range,
> -		   struct drm_gem_object *req_obj, u64 req_offset)
> +		   const struct drm_gpuvm_map_req *req)
>  {
>  	struct drm_gpuva *va, *next;
> -	u64 req_end =3D req_addr + req_range;
> +	u64 req_end =3D req->op_map.va.addr + req->op_map.va.range;

Forgot to add, please extract all previous values from req, such that the b=
elow
diff is minimal and the code remiains easier to read..
