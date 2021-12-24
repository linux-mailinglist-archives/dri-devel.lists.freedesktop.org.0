Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C101547F2CD
	for <lists+dri-devel@lfdr.de>; Sat, 25 Dec 2021 10:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C4710E4B0;
	Sat, 25 Dec 2021 09:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC3989C6C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 08:56:47 +0000 (UTC)
Received: by air.basealt.ru (Postfix, from userid 490)
 id C43D8589823; Fri, 24 Dec 2021 08:56:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
 sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.1
Received: from [10.64.128.149] (unknown [193.43.9.4])
 by air.basealt.ru (Postfix) with ESMTPSA id DB563589548;
 Fri, 24 Dec 2021 08:56:43 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/panfrost: adjusted job affinity for dual core
 group GPUs
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
 <20211223110616.2589851-3-asheplyakov@basealt.ru> <YcSDgIwrmHZ/BC2n@maud>
From: Alexey Sheplyakov <asheplyakov@basealt.ru>
Message-ID: <c94bafaa-3029-fea3-b623-1961b4b5e4cf@basealt.ru>
Date: Fri, 24 Dec 2021 12:56:43 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcSDgIwrmHZ/BC2n@maud>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 25 Dec 2021 09:57:43 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 23.12.2021 18:11, Alyssa Rosenzweig wrote:
>> The kernel driver itself can't guess which jobs need a such a strict
>> affinity, so setting proper requirements is the responsibility of
>> the userspace (Mesa). However the userspace is not smart enough [yet].
>> Therefore this patch applies the above affinity rule to all jobs on
>> dual core group GPUs.
> 
> What does Mesa need to do for this to work "properly"?

I don't know.
The blob restricts affinity of jobs with JD_REQ_COHERENT_GROUP requirement.
In theory jobs without such a requirement can run on any core, but in
practice all jobs in slots 0, 1 are assigned to core group 0 (with workloads
I've run - i.e. weston, firefox, glmark2, perhaps it's also SoC dependent).
So I've forced all jobs in slots 0, 1 to core group 0. Surprisingly this
(and memory attributes adjustment) appeared to be enough to get panfrost
working with T628 (on some SoCs). Without these patches GPU locks up in
a few seconds.

> What are the limitations of the approach implemented here?

Suboptimal performance.

1) There might be job chains which don't care about affinity
   (I haven't seen any of these yet on systems I've got).
2) There might be dual core group GPUs which don't need such a strict affinity.
   (I haven't seen any dual core group T[78]xx GPUs yet. This doesn't mean such
    GPUs don't exist).

> If we need to extend it down the line with a UABI change, what would that look like?

I have no idea. And I'm not sure if it's worth the effort (since most jobs
end up on core group 0 anyway).

Best regards,
   Alexey
