Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190BCCB0887
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 17:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF4410E1F3;
	Tue,  9 Dec 2025 16:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="EW/Pgq6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9BA10E203
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 16:19:57 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6496a8dc5a7so50148a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 08:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1765297195; x=1765901995; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xVyrlxodk/OOen9w71e8Zvycvs4Xi92LKzEoIfo8TUA=;
 b=EW/Pgq6gnlXMoWgGz/qYKMUoFi7dlMze1ZFZLAig0tRQHCn6FZ6P7uN8A3/Z9Kjwq3
 7HiyMkOd4ripd7iladRLDgU29SVzgyNqdGEQ66SsbEMjPWbLQOSKbRt3mhEowbasuJt/
 nQmp6UmxA5KrA2/+loNs9Bym/fmZ4Et5+SjxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765297195; x=1765901995;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVyrlxodk/OOen9w71e8Zvycvs4Xi92LKzEoIfo8TUA=;
 b=GmbPz4iI3kSfcNQ7eaCKJbOGjW2AkctGstp7aq0m790jHDgN1omPkmhgEoTOjNTqXH
 RbvQzjk1uPU+EFr3Dx7W38fZ85SxcZc8JVvGLveSXFWrwGRttzrZ8EC3MosWWBK+mSil
 xIfiJj/GHONbtj+VSWiBUU9rZOm4/5QHRE2E8cit6qTu/eal1oLNuGeheMV/+Yt4GKrr
 NWSae6zXrBd6qjQ806qRGuhg7GXKTp7+5agHpzkzmGWeD1PK3S5W7PunJe66bPUiETXI
 CaA80QAZBLNeihTXFfe/7489KQlRgm4SEDs18jud5Kt90C3vQlcue8Dq6q0MNjGxTe3a
 9uDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYV5NW0ySrlqXWmKgvSstx1Y7J69sDzdcB0xhBBEA5oTL6muzyMTQ7BBtFDKwBTr6sxaBuVSElFuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZPdZ/tXkMZDMYJ+SiNMkkxOWUjBBxGNbcBhW3CXq0l+dmZwxi
 wJero3oim/KAFFMbJsO1u+IvBftnBDEROus3bKCjtyif+SYBGLKwgH8dnsJw+/H0s0Y=
X-Gm-Gg: ASbGncvuZRjYyNFIA9kjzFCf3Atb5f+fjGdRt0uPyMUTsOANyKhFvdwqtoGQfGwrvIy
 L5gHv+0NtxYFS5oTSy9UuN26fE38fXUZaHIQyKidHbK9jOXvsX2nP47jvcbOWq/uQsQVtIHCEmF
 IzqxZuTZWygzCWKrdGPISjtwzHYndWt04WdofcAPPNtd8ZhIPnPZHv0X1ExJFU1GOGV45VJeSl4
 MshuNffadUkjPje9dJKd9eZu6AJS4xqeKmx1Se2LrNvaTD5l+FD9C/TAw+/5nzAyOMYhNlrkHwc
 FiKsRSVtQvcK3oyJSSjAhJUYrgqKiHS4AM50WtVzcYTUOI98zBwvDPOYgNBBvDtvTLNTYyeOeEW
 1EGP98KF70taoDY4f4oRCazrLUN/9wSCmCd70ZYnLUTltYy0MLghttFxKVONGqy+XRUKSK6xdIH
 sGyyI9bSBglL+zUpugeRCyOec=
X-Google-Smtp-Source: AGHT+IH09cOD9g4Rb+TeLYvT5nWBfoENbBWFBWDsrHpNmD/+KuJFid0McTCz7eg3aDlZMqf2FMtGtg==
X-Received: by 2002:a05:6402:518c:b0:640:7529:b8c7 with SMTP id
 4fb4d7f45d1cf-6491a2d0516mr8830628a12.1.1765297195479; 
 Tue, 09 Dec 2025 08:19:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ec319csm14440217a12.3.2025.12.09.08.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 08:19:54 -0800 (PST)
Date: Tue, 9 Dec 2025 17:19:52 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update Xe driver maintainers
Message-ID: <aThMKObVFAMWqkva@phenom.ffwll.local>
Mail-Followup-To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251204193403.930328-2-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251204193403.930328-2-rodrigo.vivi@intel.com>
X-Operating-System: Linux phenom 6.17.10+deb14-amd64 
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

On Thu, Dec 04, 2025 at 02:34:04PM -0500, Rodrigo Vivi wrote:
> Add Matt Brost, one of the Xe driver creators, as maintainer.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7774cacab5f6..254649de9c26 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12517,6 +12517,7 @@ F:	include/drm/intel/
>  F:	include/uapi/drm/i915_drm.h
>  
>  INTEL DRM XE DRIVER (Lunar Lake and newer)
> +M:	Matthew Brost <matthew.brost@intel.com>
>  M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
>  M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
>  L:	intel-xe@lists.freedesktop.org
> -- 
> 2.51.1
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
