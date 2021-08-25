Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F47A3F7A75
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 18:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B61A6E3C6;
	Wed, 25 Aug 2021 16:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA826E3C6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 16:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629908771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=81MH9LvvmF94Xq/fdROYPDvLqRHwmN8vJwPNmh3G3RI=;
 b=A4pdS+tI5EX/Q9qrSjTc58IP9TetBOaA7z+6Q9tmGS6wtS34jli55hOM2yXbiAhQ+njUCB
 U6SyAQcjKwfAuccaX14X8bjGmNFk01Qj35uvKPaXC2BesM7r0QMfsOQgzLMSc2nU2rneRg
 w8ShmhQxOJidX58Flw+ZuUDpiXqvQIA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-cQcm-NpKMPiTifJvTchHRA-1; Wed, 25 Aug 2021 12:26:07 -0400
X-MC-Unique: cQcm-NpKMPiTifJvTchHRA-1
Received: by mail-qt1-f199.google.com with SMTP id
 v28-20020a05622a189cb029028e697f617dso12956528qtc.20
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 09:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=81MH9LvvmF94Xq/fdROYPDvLqRHwmN8vJwPNmh3G3RI=;
 b=kkKunyRg1LuhjKtOLvOl0QSnoNHcvy+B3wEz7OteSrjfWSuhZVSRZBoV2GvG0BAAt2
 Br7iuuKm0cEgDRcDYcZQ4EoB5kVSQ8AVWgT+0SHebkakUXOimdi1ovyy/Bu5o3YnJjO3
 3ql3nmUrCELTk4Jf8l07+8K2MgqQytZU1Nmi/GxyTJJiCVLTrDPhG+F6XG5g3kD0uz+X
 YY5GWIFKUWJyKe1Y0REcEOBjzYXFVkhREfx+WT7Kp5fUVjiTPiR1qrF0banKeA40Py97
 S0Tjoyc3Ewgg97Dz/Erh5lpoiyuHiU0n0k/Tsb3g7r43blI+9uQesZhfljabFRISvOZO
 TEsA==
X-Gm-Message-State: AOAM533HPtTxjpZD9L5+m0086dQ+pYyC4iZX6aw+70E48ZCy7zVjqDl/
 SGzVcnW5KnRToAGsxtWgsBQdyUKArb1En3F1KDyy3ajJ9zsV/f8EIN7vfmDVguo1X3diairN8qe
 wflqr0bRWVvlzIS5W9h2kPDhSQ980
X-Received: by 2002:a05:620a:cd0:: with SMTP id
 b16mr33236674qkj.136.1629908766847; 
 Wed, 25 Aug 2021 09:26:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2hbGvq6X6Eeo1e/X0RrlLiDx0IZFm+v9074G6Af3gBq7QNBz9w7hpyaUv9eJGkjMTtQrdGg==
X-Received: by 2002:a05:620a:cd0:: with SMTP id
 b16mr33236646qkj.136.1629908766609; 
 Wed, 25 Aug 2021 09:26:06 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id c68sm327240qkf.48.2021.08.25.09.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:26:06 -0700 (PDT)
Message-ID: <88b5fbe60c95bcdf42353bec9f8c48aefa864a31.camel@redhat.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix return code on sideband message failure
From: Lyude Paul <lyude@redhat.com>
To: khsieh@codeaurora.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, robdclark@gmail.com, 
 sean@poorly.run, swboyd@chromium.org, abhinavk@codeaurora.org, 
 aravindh@codeaurora.org, rsubbia@codeaurora.org, rnayak@codeaurora.org, 
 freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Aug 2021 12:26:03 -0400
In-Reply-To: <64049ef6c598910c1025e0e5802bb83e@codeaurora.org>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com>
 <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
 <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
 <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
 <79c5a60fc189261b7a9ef611acd126a41f921593.camel@redhat.com>
 <696a009e2ab34747abd12bda03c103c7@codeaurora.org>
 <e725235a77935184cd20dab5af55da95b28d9e88.camel@redhat.com>
 <64049ef6c598910c1025e0e5802bb83e@codeaurora.org>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

The patch was pushed yes (was part of drm-misc-next-2021-07-29), seems like it
just hasn't trickled down to linus's branch quite yet.

On Wed, 2021-08-25 at 09:06 -0700, khsieh@codeaurora.org wrote:
> On 2021-07-27 15:44, Lyude Paul wrote:
> > Nice timing, you literally got me as I was 2 minutes away from leaving 
> > work
> > for the day :P. I will go ahead and push it now.
> > 
> Hi Lyude,
> 
> Had you pushed this patch yet?
> We still did not see this patch at msm-nex and v5.10 branch.
> Thanks,
> 
> 
> > BTW - in the future I recommend using dim to add Fixes: tags as it'll 
> > add Cc:
> > to stable as appropriate (this patch in particular should be Cc:
> > stable@vger.kernel.org # v5.3+). will add these tags when I push it
> > 
> > On Tue, 2021-07-27 at 15:41 -0700, khsieh@codeaurora.org wrote:
> > > On 2021-07-27 12:21, Lyude Paul wrote:
> > > > On Thu, 2021-07-22 at 15:28 -0700, khsieh@codeaurora.org wrote:
> > > > > 
> > > > > It looks like this patch is good to go (mainlined).
> > > > > Anything needed from me to do?
> > > > > Thanks,
> > > > 
> > > > Do you have access for pushing this patch? If not let me know and I
> > > > can
> > > > go
> > > > ahead and push it to drm-misc-next for you.
> > > no, I do not have access to drm-misc-next.
> > > Please push it for me.
> > > Thanks a lots.
> > > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

