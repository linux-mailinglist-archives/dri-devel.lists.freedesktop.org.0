Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CB33F0E40
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 00:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C90389E14;
	Wed, 18 Aug 2021 22:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35A089E14
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 22:36:34 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id x16so3661262pfh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 15:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2sMII5G/YrPb+0dkZspyZPS9+RZRKOtmg2+pJ+lOQh8=;
 b=zCeTW3J0K5np3tXoG1IVSEAaPhRTsp6E7FG40JMxEKemO8ZOHARazqIQmpKFIcs6Sd
 N+GcdWyWkTcutczTnN4sOyyVCxvFWCYptMFPsGfhg09eZke8WGMWE7X323gqAUdPsHGt
 GJI+Q1n5sJHSiu6jvMoqplSND0vhS0iaBcT4D21x/nhiQ6MHkY+ruWt2EXdQpfM96zjC
 hi5+qOD40TDeOvrQRR206d0ujvibZUy7wKb/uB+gerRXWqa6ZBPhLTAUkWQOL5fPGNzE
 UiSjQoQgCCbD822O9dBlOBwzl+Vg8GmLowbUkm3Fma27sj5ipvOpNTGfxjNlZImQucyY
 2hBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2sMII5G/YrPb+0dkZspyZPS9+RZRKOtmg2+pJ+lOQh8=;
 b=bGSogOAIQwTbd4v5YVxDzFJY8npt746hyBel3oRR+s7QP3iZZwtHEmVzPizqscpi3c
 XiObaRJddogJP1zS5pmOEX9mPx+KB4QIXTnO2CU6YVFBaBzbx2LwfpaPINKjy0Vlk4/J
 fz085OCWRhTq3/BuNu01u3JBOgWYLHEnAphjUq59JdTNE5+wOmKyUXUWdoCehIQFUdY6
 EvLcxO8IG6nyuCKle16X7mKLDm6s1lxlmSNBvsm+LEJlKU8Vq1aIzbSGuRKsc57Sed52
 SqLSc/8qgcFLy+mwE6Fhh4u5AtTmQa+yi4ENC7Q5k3uJmxfs3mk/BmUX7INfZrwr7pEQ
 YHJg==
X-Gm-Message-State: AOAM533WkwbxCdMPqfnr0W95Eb8EDDtXp25xqTKB+I2cnLy4OEdI7ure
 srE+PPZE4o3voYuKszer8N/c69bDqHQ005+NcnMzmA==
X-Google-Smtp-Source: ABdhPJx62hXsE0+fSTYrXfKzc8DzxmmvkPKOdI5TBxPP7euaOB9l5vqd5XytOvYvOyAB9vVojNAO4JW+D+jXmEpzsAs=
X-Received: by 2002:a63:dd0e:: with SMTP id t14mr9405083pgg.279.1629326194463; 
 Wed, 18 Aug 2021 15:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-7-keescook@chromium.org>
In-Reply-To: <20210818060533.3569517-7-keescook@chromium.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 18 Aug 2021 15:36:23 -0700
Message-ID: <CAPcyv4hZUOENLxUgqXrzpv0rhHp-TP_EkTaBKjvrsFLjy3-1Vw@mail.gmail.com>
Subject: Re: [PATCH v2 06/63] cxl/core: Replace unions with struct_group()
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Ben Widawsky <ben.widawsky@intel.com>,
 linux-cxl@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linux Wireless List <linux-wireless@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Aug 17, 2021 at 11:06 PM Kees Cook <keescook@chromium.org> wrote:
>
> Use the newly introduced struct_group_typed() macro to clean up the
> declaration of struct cxl_regs.
>
> Cc: Alison Schofield <alison.schofield@intel.com>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Ben Widawsky <ben.widawsky@intel.com>
> Cc: linux-cxl@vger.kernel.org
> Suggested-by: Dan Williams <dan.j.williams@intel.com>

Looks good and tests ok here:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
