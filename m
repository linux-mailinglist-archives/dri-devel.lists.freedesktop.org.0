Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002FB2C22E6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 11:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C755D6E20B;
	Tue, 24 Nov 2020 10:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971686E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 10:28:40 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a186so1946875wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 02:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RwUy1fNeibgQmYo6Awy3BlHbLwEGW2ZCC3VGxsMlMyE=;
 b=Es1uQ3xzadh4hACyzIcJ+oDdIfUSYvAyGz0HBkTYe6qmlZB8DEBlgEltYnfm7/xGLr
 eh2wcHMGTFyKnlSo6SgAHLYYsV+DAZMnEbmXOlV3RGzwdGIHAuw3oaeq5MwcCYmnGxyh
 RqZMhaszKZXj8878t7aSsQjjcHYsOVG4VkXejdBqF5dExhPXXUhQdK+sKQXDbH8JVyeq
 uBxqrF7KhdHPHsSWf4d9mHaORf5nBbBLvmBIi1Zm5kJexcdepgk3tr1RSHXsxi/EX/JQ
 AObANnDbkOiyEd4/UP6kDCaLlyhnqkFxWtf0A/NB1kGLnmZbo7dZkEKZVTs9pOwA5HXM
 kl/A==
X-Gm-Message-State: AOAM531UiGtSQhLFLQLNW1U48zl7mPJamgnXHOIfFGiXaTapAKoKnAY+
 D47fQ6SJNBuUVNHtNrX7pME=
X-Google-Smtp-Source: ABdhPJwOmd9u4DoGyLUfSdgBmDUzqvUTJdpLbXxoHCerpn4QKmHOaWn0OsP6MgihJk58FlDoGEKEyw==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr3656173wmb.175.1606213719208; 
 Tue, 24 Nov 2020 02:28:39 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 36sm25404427wrf.94.2020.11.24.02.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 02:28:38 -0800 (PST)
Date: Tue, 24 Nov 2020 10:28:37 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH] video: hyperv_fb: Directly use the MMIO VRAM
Message-ID: <20201124102837.ap7puuqtvyeusbjl@liuwe-devbox-debian-v2>
References: <20201121014547.54890-1-decui@microsoft.com>
 <20201121145411.GG3025@boqun-archlinux>
 <MW2PR2101MB1801841901E659E60502EB86BFFB0@MW2PR2101MB1801.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW2PR2101MB1801841901E659E60502EB86BFFB0@MW2PR2101MB1801.namprd21.prod.outlook.com>
User-Agent: NeoMutt/20180716
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
Cc: "wei.liu@kernel.org" <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Wei Hu <weh@microsoft.com>, KY Srinivasan <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 08:33:32AM +0000, Dexuan Cui wrote:
> Hi Wei Liu,
> Please do not pick up this patch, because actually MMIO VRAM can not work
> with fb_deferred_io.
> 

No problem. Thanks for the heads-up.

Wei.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
