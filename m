Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C8CB1E5A7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 11:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0074010E8F3;
	Fri,  8 Aug 2025 09:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nJV414fc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08D110E8F3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 09:34:51 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-459dfbece11so10382195e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 02:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754645690; x=1755250490;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=YYkMx8ADKhGpGkjuRp5FqtovFr4yOpPONayGZhPUNBU=;
 b=nJV414fcHOQ2eeWrVRFvmgwsNgoouHHjRYbJmhDuldQIUAFl++WtFYy72VLttXCRDY
 +P7nKEkVnOL0kBV9Ee5rG5J2pZKCLqIMhtpPNq8Hfez0HLRfZcLhQiOxjo6uzWbZdUCE
 QnNrUFVim4WbgCMspoiXeP+gL2IAFWbb228INGzSsE263s2/SAHi5pb5l6lLgEUtA/il
 bzgpxh2NhHPDlq45eVgFkbvxkIcuIU87LGjSg78LplCvl5PP3ZazD+5w0/Hth2QLd7Mf
 HfNy2fQqdVb6bVybsCQlkvxIh6mNIO+KaBvfXuuIH+c7Tf+kHXr0GWLQfEmnILVINveL
 Ue0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754645690; x=1755250490;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YYkMx8ADKhGpGkjuRp5FqtovFr4yOpPONayGZhPUNBU=;
 b=LQZT2jcfqcEnmydp5Fq74viXjC8OFuzSc7V6hbp5k0fuET4Ncnoq3gLrRS2oGpoLn1
 8ZVXRDQlsaC9Mj+aSL1krDfZfiT6amFmLS8A2elNkKP+UE9dfVWnPwScXoaWs0csnF8v
 /2kJo7ZIRuXqw+TIfrcCMOoX4kROi3btmcKfMwE+pFSKnfdR9T24t8zKaQOkPTLIPlz/
 jJ7lwCgx834TltC4xqCVKnIGGjzl+GtYpJvhwDO3H+9VUeWEufpaHzt5ON6jUkxBMZO6
 8wIBlBInFhbYv2RLMDIPPnvRPC3yqVmTc4o9xX716iW8FxDgm0z+gWE8ppTDm045giOi
 iL4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3vua09rulqVmQaWQSDDQOoBpVzPxX/JWfPK4hvLXyNmV+BDeH6tLiyT71/vEq9WYg6lwFWFQl2qQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1LeyHn3QsJvcfXsBMGjh3MpUlTzbOAiVW+Gvw49gLqYVkUmaU
 mE0JrZqnSoOfeZLKa9VGzmU8SgiGvRgAuBlTT3o1DfYjuhoaU7NOBtAK1/EhzGtCEjbFqNA/zKi
 CONdmTH4tliZKUk3r0w==
X-Google-Smtp-Source: AGHT+IH3+rM6hXHoprf8Xvht1QN7pVj5PS6FczrhzCDU/jMYaWSRvqq931K1nkAPnx48Q7OlBFFFSItWoCXVROQ=
X-Received: from wmbdv14.prod.google.com
 ([2002:a05:600c:620e:b0:458:ba61:fc2e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3584:b0:456:1a69:94fd with SMTP id
 5b1f17b1804b1-459f8e1c662mr6743955e9.0.1754645689799; 
 Fri, 08 Aug 2025 02:34:49 -0700 (PDT)
Date: Fri, 8 Aug 2025 09:34:48 +0000
In-Reply-To: <20250808092432.461250-1-dakr@kernel.org>
Mime-Version: 1.0
References: <20250808092432.461250-1-dakr@kernel.org>
Message-ID: <aJXEuAeoEv0lbMh4@google.com>
Subject: Re: [PATCH] MAINTAINERS: entry for DRM GPUVM
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: boris.brezillon@collabora.com, matthew.brost@intel.com, 
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 08, 2025 at 11:20:49AM +0200, Danilo Krummrich wrote:
> GPUVM deserves a bit more coordination, also given the upcoming Rust
> work for GPUVM, hence add a dedicated maintainers entry for DRM GPUVM.
>=20
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>
