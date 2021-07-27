Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D063D3D8328
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 00:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B68E6EB13;
	Tue, 27 Jul 2021 22:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B976EB13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 22:41:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627425669; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6DcCd5EYEZOUZCyIy2EtvdlY8R0MtDfk5lZlOKcio4E=;
 b=EcmRayQmJ1KAYYiImfMZjEp167EXbdRxO7xL47IS7HvCNY61yLBPXXPZEnUJKYADBRH+wFLS
 xkHIdOZA4YiB1lKj/fv5/0phBKt0ZBcE7jE8yGv3Bm45omtkHjsowMXj923mXNBP8jMncRnN
 2TWprtFMtSDvFUtHwKCG0YfwLMw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61008b8296a66e66b2084019 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Jul 2021 22:41:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2E3DAC43143; Tue, 27 Jul 2021 22:41:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 59874C433F1;
 Tue, 27 Jul 2021 22:41:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 27 Jul 2021 15:41:04 -0700
From: khsieh@codeaurora.org
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix return code on sideband message failure
In-Reply-To: <79c5a60fc189261b7a9ef611acd126a41f921593.camel@redhat.com>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com> <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
 <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
 <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
 <79c5a60fc189261b7a9ef611acd126a41f921593.camel@redhat.com>
Message-ID: <696a009e2ab34747abd12bda03c103c7@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: rnayak@codeaurora.org, tzimmermann@suse.de, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 aravindh@codeaurora.org, sean@poorly.run, rsubbia@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-27 12:21, Lyude Paul wrote:
> On Thu, 2021-07-22 at 15:28 -0700, khsieh@codeaurora.org wrote:
>> 
>> It looks like this patch is good to go (mainlined).
>> Anything needed from me to do?
>> Thanks,
> 
> Do you have access for pushing this patch? If not let me know and I can 
> go
> ahead and push it to drm-misc-next for you.
no, I do not have access to drm-misc-next.
Please push it for me.
Thanks a lots.
