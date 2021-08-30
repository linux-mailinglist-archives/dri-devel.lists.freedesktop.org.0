Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153C03FB960
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 17:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D931898CC;
	Mon, 30 Aug 2021 15:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFF1898CC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 15:56:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630338980; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=U10YrBfczfj2F0eAJkorX2N74cH0fDyM7HdEotnpp4w=;
 b=GICsiM44pNtuVwH7tm8WL2Ja1HG2RYkGMpo6ZXlb+PV7OG1kDL0BOFP8yD5Uf+/whHRX/qQ5
 jF+mT2OpXOQIqXcGxoyYXH8LxYqdvuSwLcOZy7QhrGOKqSTDIu5c6lfss/J79hKpuR8uYKM1
 QIAaJMGiHBE28+hTH360RUiPTUw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 612cff934d644b7d1c20dd0b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Aug 2021 15:56:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 68534C4361A; Mon, 30 Aug 2021 15:56:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 48AA7C43460;
 Mon, 30 Aug 2021 15:56:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 30 Aug 2021 08:56:02 -0700
From: khsieh@codeaurora.org
To: Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, rsubbia@codeaurora.org, rnayak@codeaurora.org,
 freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/dp_mst: Fix return code on sideband message failure
In-Reply-To: <88b5fbe60c95bcdf42353bec9f8c48aefa864a31.camel@redhat.com>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com> <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
 <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
 <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
 <79c5a60fc189261b7a9ef611acd126a41f921593.camel@redhat.com>
 <696a009e2ab34747abd12bda03c103c7@codeaurora.org>
 <e725235a77935184cd20dab5af55da95b28d9e88.camel@redhat.com>
 <64049ef6c598910c1025e0e5802bb83e@codeaurora.org>
 <88b5fbe60c95bcdf42353bec9f8c48aefa864a31.camel@redhat.com>
Message-ID: <f0fcfe7a73e87150a7a1f042269b76a3@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-08-25 09:26, Lyude Paul wrote:
> The patch was pushed yes (was part of drm-misc-next-2021-07-29), seems 
> like it
> just hasn't trickled down to linus's branch quite yet.

Hi Stephen B,

Would you mind back porting this patch to V5.10 branch?
It will have lots of helps for us to support display port MST case.
Thanks,



> 
> On Wed, 2021-08-25 at 09:06 -0700, khsieh@codeaurora.org wrote:
>> On 2021-07-27 15:44, Lyude Paul wrote:
>> > Nice timing, you literally got me as I was 2 minutes away from leaving
>> > work
>> > for the day :P. I will go ahead and push it now.
>> >
>> Hi Lyude,
>> 
>> Had you pushed this patch yet?
>> We still did not see this patch at msm-nex and v5.10 branch.
>> Thanks,
>> 
>> 
>> > BTW - in the future I recommend using dim to add Fixes: tags as it'll
>> > add Cc:
>> > to stable as appropriate (this patch in particular should be Cc:
>> > stable@vger.kernel.org # v5.3+). will add these tags when I push it
>> >
>> > On Tue, 2021-07-27 at 15:41 -0700, khsieh@codeaurora.org wrote:
>> > > On 2021-07-27 12:21, Lyude Paul wrote:
>> > > > On Thu, 2021-07-22 at 15:28 -0700, khsieh@codeaurora.org wrote:
>> > > > >
>> > > > > It looks like this patch is good to go (mainlined).
>> > > > > Anything needed from me to do?
>> > > > > Thanks,
>> > > >
>> > > > Do you have access for pushing this patch? If not let me know and I
>> > > > can
>> > > > go
>> > > > ahead and push it to drm-misc-next for you.
>> > > no, I do not have access to drm-misc-next.
>> > > Please push it for me.
>> > > Thanks a lots.
>> > >
>> 
