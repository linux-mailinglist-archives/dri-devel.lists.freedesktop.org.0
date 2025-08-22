Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693F3B31C69
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6820C10E149;
	Fri, 22 Aug 2025 14:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="prVLOj6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303AF10EB36;
 Fri, 22 Aug 2025 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vSFv5P6r6uHHcex7ev876TgGrB/iNFOS7oWEm1S6nnQ=; b=prVLOj6tIf2BBGWGGiayhD06yA
 GYxNwgN5pme3d6hgrfjMu0qUnG2Q9n2WU2+tIWno7zP6C7orjXKwdHv5fvkw4xnXxm2SWjiNSvReb
 7oXPkGOfigh/hxx4MH9PSAmTm7tZCvoUyCoFEK/C9Pp/tBk9Fa6w10yMw8VVvCbsfNIlG5djSpHDy
 iqBpIvyLavfkQLp5vtdjEWT+rBA/+7byB/sUayTN0L1iA67c8JK716HU9Clnprf/R7kPbJj/gq3Z1
 CWFkhZiWM9RQJPegHO6eFrMDmNDovPJB2J7Kc+mu+Rh+BYVi+HvTrtvzxbQh21nZuQgLHOCQzmqu4
 An3DpnYg==;
Received: from [152.250.7.37] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1upT1j-00091Z-7q; Fri, 22 Aug 2025 16:45:59 +0200
Message-ID: <0e6b2725-427a-438a-a0e5-c182abaf2909@igalia.com>
Date: Fri, 22 Aug 2025 11:45:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm: re-allow no-op changes on non-primary planes in
 async flips
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: chris@kode54.net, naveen1.kumar@intel.com, ville.syrjala@linux.intel.com, 
 mdaenzer@redhat.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexdeucher@gmail.com, arun.r.murthy@intel.com
References: <20250808232208.7764-1-xaver.hugl@kde.org>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250808232208.7764-1-xaver.hugl@kde.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xaver,

Thanks for the patch and sorry for the delay.

Em 08/08/2025 20:22, Xaver Hugl escreveu:
> Commit fd40a63c63a1 unintentionally disallowed no-op changes on non-primary
> planes that the driver doesn't allow async flips on. This broke async flips
> for compositors that disable the cursor plane in every async atomic commit.
> This changes drm_atomic_set_property to again only run atomic_async_check
> if the plane would actually be changed by the atomic commit.

Small nit: kernel commit messages goes in the imperative form:

"Change drm_atomic_set_property to again only run atomic_async_check..."

> 
> Fixes: fd40a63c63a1 ("drm/atomic: Let drivers decide which planes to async flip")
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4263
> 
> Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
> ---

Reviewed-by: André Almeida <andrealmeid@igalia.com>
