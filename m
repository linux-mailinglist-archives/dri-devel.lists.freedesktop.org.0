Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034A09D02E1
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 11:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E7810E255;
	Sun, 17 Nov 2024 10:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="g+oUauBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFD510E255
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 10:12:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1731838362; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZyczvdXt27uh8PUxu6O8q1jXGx4ZLmNBfCAnmwpv4WUs5QX3I5CL4pkvnXM92pGZUWl7jyhaNMCvp7kHrxMgSyLbFYrUZp9H0uFtklUkiSPOgt6OsoD/Jugdgjsxu/f8UpBUd7eaOWRJHc0iERsbbQA4LHJBr+0PB50I4TsXyj4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1731838362;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NyxhRCsognRghJgqS/SCBGOjSPC/p2cFFkjhxwiJBwo=; 
 b=dDepkeOcFxx58tpeHhyY8wzyuuGFmWgZP4f40aFcxZSDeGJvSjrO/fPRbnGaLHwAeRDaOqxguXQ0EPXa6+n9q7RqUw+D/2CM+UXw+mYbYzWTJ6DGNLq6AWUuB6wKuhmd/7zMN8bu0i5u+ywzXKv8DZ327mcjCptPOt67lsEjUsM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731838362; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NyxhRCsognRghJgqS/SCBGOjSPC/p2cFFkjhxwiJBwo=;
 b=g+oUauBfMxozbA15jbrurUOtFlfc9Q/FkLvfb2Nj8apqpjRnJz93RcKqzabAmZM6
 +hU31mb8FH1DTOgk6rkdmffbBm+ZPgflRUlRaDyRfkUK74UYhD2HAsmYGrK1DxHX9cX
 gQVM/ZoWcMqyPBqBh2yxiHecIOmiDqqfN/aXz/sA=
Received: by mx.zohomail.com with SMTPS id 173183836006315.941452786053674;
 Sun, 17 Nov 2024 02:12:40 -0800 (PST)
Message-ID: <f8f28746-bc6e-4c0f-a130-271e8535ae8f@collabora.com>
Date: Sun, 17 Nov 2024 13:12:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/virtio: Use drm_gem_plane_helper_prepare_fb()
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Kim Dongwon <dongwon.kim@intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20241020230803.247419-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20241020230803.247419-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 10/21/24 02:08, Dmitry Osipenko wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
> 
> Use drm_gem_plane_helper_prepare_fb() helper for explicit framebuffer
> synchronization. We need to wait for explicit fences in a case of
> Venus and native contexts when guest user space uses explicit fencing.
> 
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> [dmitry.osipenko@collabora.com>: Edit commit message]
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
>  1 file changed, 4 insertions(+)

I'll apply this patchset tomorrow if nobody has more comments to add.

-- 
Best regards,
Dmitry
