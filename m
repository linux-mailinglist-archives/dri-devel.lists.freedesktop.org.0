Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0670918BE27
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 18:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBEC6EA43;
	Thu, 19 Mar 2020 17:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07BF6EA43
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584639349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aa2Nquow2GgqfoiAqwvn8s6KexFuEkXSqwxaHybwlmA=;
 b=LFZgP6CL/fs/Q71RwLB8xOlnZGhHPLk1L6Prwvy+SI3HaCG4gqHGKF7AegMFGPO50QfN04
 KY0DiAWpcYRnPcgCupOPWqQq3sM2w9aidP892ATVmj/IdV4bnr6VnlbrkcXW9XbCej20fN
 Bwg7uBefr+ZmtFOtEn/F1AWQ1S663Qs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-Ilo8HdtpObipnBAtxiY0LA-1; Thu, 19 Mar 2020 13:35:43 -0400
X-MC-Unique: Ilo8HdtpObipnBAtxiY0LA-1
Received: by mail-qk1-f198.google.com with SMTP id e10so3106381qkg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Aa2Nquow2GgqfoiAqwvn8s6KexFuEkXSqwxaHybwlmA=;
 b=fMI/TqZtlH7o3BaE0zVepUBVMki5OLZGhCcNRbJQ3ov1RwjiROg2FlI2uioR214LFI
 FnlxHhjlYkAiydMCP4epVOHjmbDas9m61V6BvfspojlGZ3LIZECOPdKBZt/wkY7v/uHd
 Mu/WwclTR3x0mcIiAVPSnkJUdGmfvqpeg/b+VQfOFDildNrLfjO+ubW3yH1BYkj/eJvr
 ZWlcQ2kttLnSbp0FE1UMgfyeaIyadAC2hSFzDocj10LSpdu0CMwcjpRWYeVSdyByEanb
 tSPz8ML1lwRn/n7e1+sU3/5P443ANaFdqYOxLNVVMeIkzAusftyVHKbkE9M+y1VWjVCo
 4sjA==
X-Gm-Message-State: ANhLgQ1W5ZgZj1an4ff3aIuXWguRzbERQAM3vI5TMrhB5YG8hZjMZNBv
 eV2K5Ry10z2ATkogpl0bwvlUESaOWMYCNGmDiZS/T4Yi5sDKi6NHDydto0OiTvUnk+lSt/sMWi6
 0S5S7vwIkfxkawxoKAGjS2y1R+5wq
X-Received: by 2002:ae9:e403:: with SMTP id q3mr3834417qkc.241.1584639342536; 
 Thu, 19 Mar 2020 10:35:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsWS5TZK4rIcgSpi2IET6t81dsp9OUaDeA4gdJbfuAXKJGisme8AOHspbkK5fnlxr1PCKKU6g==
X-Received: by 2002:ae9:e403:: with SMTP id q3mr3834394qkc.241.1584639342266; 
 Thu, 19 Mar 2020 10:35:42 -0700 (PDT)
Received: from desoxy (c-24-61-245-152.hsd1.ma.comcast.net. [24.61.245.152])
 by smtp.gmail.com with ESMTPSA id n6sm1956181qkh.70.2020.03.19.10.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 10:35:41 -0700 (PDT)
Message-ID: <9accce765c96452fe41d7769cced3b3370554f36.camel@redhat.com>
Subject: Re: [PATCH v2 2/2] drm: error out with EBUSY when device has
 existing master
From: Adam Jackson <ajax@redhat.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Date: Thu, 19 Mar 2020 13:35:40 -0400
In-Reply-To: <20200319172930.230583-2-emil.l.velikov@gmail.com>
References: <20200319172930.230583-1-emil.l.velikov@gmail.com>
 <20200319172930.230583-2-emil.l.velikov@gmail.com>
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-03-19 at 17:29 +0000, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> As requested by Adam, provide different error message for when the
> device has an existing master. An audit of the following projects, shows
> that the errno is used only for printf() purposes.
> 
> xorg/xserver
> xorg/drivers/xf86-video-ati
> xorg/drivers/xf86-video-amdgpu
> xorg/drivers/xf86-video-intel
> xorg/drivers/xf86-video-tegra
> xorg/drivers/xf86-video-freedreno
> xorg/drivers/xf86-video-nouveau
> xorg/drivers/xf86-video-vmwgfx
> 
> qt/kwin/plasma
> gtk/mutter/gnomeshell
> efl/enlightment
> 
> Cc: Adam Jackson <ajax@redhat.com>
> Suggested-by: Adam Jackson <ajax@redhat.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>

Delightful! Series is:

Reviewed-by: Adam Jackson <ajax@redhat.com>

- ajax

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
