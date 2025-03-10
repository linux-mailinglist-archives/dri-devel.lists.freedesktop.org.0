Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4309AA5A2AE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 19:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBFA899A3;
	Mon, 10 Mar 2025 18:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ElmbqlGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFD7890D2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 18:22:55 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso2497432f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741630974; x=1742235774; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IM67112e6aVWPb0y1+A+iibMGJnbZ9dK5fhRXopQ0Rg=;
 b=ElmbqlGzeOnAA5zbu5fQDaZtK+C5Y6WFEddEd9UJZdfrlQJGYbQh7eb/PtRKL1NkQ4
 6CdwPCRVdpNhPLrrRMFXqJV8MQ4+iZHbXkGwaZKNSM39IzuGv3e97x1zEsIHzAAjzlqo
 ELgcqpQjFHq7uin/hvJxfvTMzqjgxgaJWhpsfbONPz0+o9tchlAI3t9BtgbP302XJbv3
 Ath6rQ+zBTGZLpNP/6XKxecGker+BPsePzp3Jwz+/GLAi0kn5jcoZUwgk4fE19eE0ihF
 0iGtPWoFWGYj/eXzVBH6PKRIfkzj2ucH4caHsP1JagQuEExTdzkiMr9wtWbMKb6we97B
 TeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741630974; x=1742235774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IM67112e6aVWPb0y1+A+iibMGJnbZ9dK5fhRXopQ0Rg=;
 b=VA1najfnR2ndDXbNjvdAI+gwRI0BjY1FFkrIOk8pP6QYBeS1knA1OwggnvVMtUaw8U
 R5lUANqPqxFlHZNPvWOWQCFBsA3yUffZwAyG2sGexHzfaNu7cRCroZshBxqrm/WhGHTV
 v82T5IX2pi5LTWnwsvCeqAvOgNIMaOKTh7xIP/wo2FRrBT0TYG7JjmS2KtbaX9HR1XuS
 SBSRjI/DqzD9o8S7/tJO6Kcnq+wGC0MJtNf6813DtokPwzkXrhB7aFixOVE7pZHVkx8k
 Jpkwc1t9y3YZ6x5MFglWjDAWdudZm+5Pq2z+gQzQ0OHln6/SASk2l8fGRKFv7Hh9y4Cf
 QPUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5h04959UD0eSzMZI2roO77xuIeN8fZGYifU3Ys8qw56R4zseYTL4FkwO9V1jorS1vgi3qxxvrRW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQAE9clX12KiYj1vBOi7fZt+z7B7C9n8Xmck3kXA9bu+DXi5g3
 i3X1leVuYInZd6So1OczpBoGCdgwzYzIlmPivyTvwDqOrATP65H5NofqPMHIEX8=
X-Gm-Gg: ASbGncuvm3HIr9vG0DfzJK9wYyhJTVyEXID9v5L3OYOjkRnqXFqpdB1ztIjbdlH+Iba
 TxuM2GjBj5NH09PitJUAwREsAkJlbBZDzdExxj0rgbDB6GUQ+OFFomwRCQrg2ycPJDNZECRH89i
 +Qt9zYrGO+QwE2beld8zX72SyR2/EfQAZpWNGxOb3CX9FgN0Gkm5Uw7VCvocdUp6jmWh7sy4aQA
 8X/xv/zisECGufkEMh7FZFJ4KAQIHh3syMmMMqSjo8bfn+SK1W+ngc1+4wQZ1ERKeNxB0fSSpB0
 XBQzDAn9OY360IAKIeZPG3YJUyeFVdCdp38KlMVXGewexh4t0g==
X-Google-Smtp-Source: AGHT+IFPPRTmEdhJHKxLy8Tag7aJ8MCR6K5N/RY9rHYVd+ENG21KhflHXXSPp3UiTZ2sQh+jQtPtYA==
X-Received: by 2002:a5d:584f:0:b0:391:ffc:2413 with SMTP id
 ffacd0b85a97d-39132da08b4mr9411995f8f.40.1741630974330; 
 Mon, 10 Mar 2025 11:22:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c015c2csm15382176f8f.49.2025.03.10.11.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 11:22:53 -0700 (PDT)
Date: Mon, 10 Mar 2025 21:22:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/xe: Fix uninitialized variable in
 xe_vm_bind_ioctl()
Message-ID: <95a4da90-dfa0-4033-aba5-276b3d9a1824@stanley.mountain>
References: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
 <Z88ZzoFA5KpQTLmH@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z88ZzoFA5KpQTLmH@intel.com>
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

On Mon, Mar 10, 2025 at 12:56:46PM -0400, Rodrigo Vivi wrote:
> On Mon, Mar 10, 2025 at 01:48:00PM +0300, Dan Carpenter wrote:
> > The error handling assumes that vm_bind_ioctl_check_args() will
> > initialize "bind_ops" but there are a couple early returns where that's
> > not true.  Initialize "bind_ops" to NULL from the start.
> 
> It is not a couple, but only the one goto put_vm where this bind_ops
> gets actually initialized, or not...
> 

I'm on linux-next.  I'm not seeing the goto put_vm...  I think we're
looking at different code.

  3063  static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
  3064                                      struct drm_xe_vm_bind *args,
  3065                                      struct drm_xe_vm_bind_op **bind_ops)
  3066  {
  3067          int err;
  3068          int i;
  3069  
  3070          if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
  3071              XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
  3072                  return -EINVAL;

One.

  3073  
  3074          if (XE_IOCTL_DBG(xe, args->extensions))
  3075                  return -EINVAL;

Two.

  3076  
  3077          if (args->num_binds > 1) {
  3078                  u64 __user *bind_user =
  3079                          u64_to_user_ptr(args->vector_of_binds);
  3080  
  3081                  *bind_ops = kvmalloc_array(args->num_binds,

Initialized.

  3082                                             sizeof(struct drm_xe_vm_bind_op),
  3083                                             GFP_KERNEL | __GFP_ACCOUNT |
  3084                                             __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
  3085                  if (!*bind_ops)
  3086                          return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
  3087  
  3088                  err = __copy_from_user(*bind_ops, bind_user,
  3089                                         sizeof(struct drm_xe_vm_bind_op) *
  3090                                         args->num_binds);
  3091                  if (XE_IOCTL_DBG(xe, err)) {
  3092                          err = -EFAULT;
  3093                          goto free_bind_ops;
  3094                  }
  3095          } else {
  3096                  *bind_ops = &args->bind;
  3097          }

> but perhaps the order in the exit is wrong and we should move the
> kvfree(bind_ops) upper to the end of put_exec_queue?
> 
> Matt, thoughts on the order here?
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

I feel like ideally vm_bind_ioctl_check_args() would clean up after
itself on failure and, yes, it should be in reverse order from how
it was allocated.

regards,
dan carpenter

