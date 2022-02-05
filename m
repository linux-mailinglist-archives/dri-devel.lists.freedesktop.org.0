Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000A14AA7EB
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 10:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7199310F4D7;
	Sat,  5 Feb 2022 09:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id D379110E1BB
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 00:35:56 +0000 (UTC)
Received: from [192.168.1.17] (unknown [192.182.151.181])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1F50820B6C61;
 Fri,  4 Feb 2022 16:35:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1F50820B6C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1644021356;
 bh=Lxh39MUIwPoB4L77nmzR+NxgwzKfDafwt/YKb1Z9Oyk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IumbASqLXkb8e1ibpmpHYMvxXZidJ5avumnPKdXaqW1EVALP1PWXs640zZhYUu0pe
 Iep8qGZJRpsZ3BxAFIzHRdIXowRYphqso9HBcgnuPiKS4S1Em5gr2KXO1ifjDBl0wO
 ooC33qR8biJi7OiVtyBVNYhh5VHBksZZKQhHimkY=
Message-ID: <deb33dd6-06c8-13c1-8d37-4c4f36248d96@linux.microsoft.com>
Date: Fri, 4 Feb 2022 16:35:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 9/9] drivers: hv: dxgkrnl: Implement DXGSYNCFILE
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <cover.1641937419.git.iourit@linux.microsoft.com>
 <e04c8e820bc166d9d4fe8e388aace731bb3255b0.1641937420.git.iourit@linux.microsoft.com>
 <YeG6+Crv/Bg4h3u1@phenom.ffwll.local>
 <e472cbe8-44ec-110a-1ad7-bc561cd0be88@linux.microsoft.com>
 <CAKMK7uFkVvfXM7QsgSfP4OLk9b_cSwNsi3s3_7EFuL+Pa1s7eQ@mail.gmail.com>
From: Iouri Tarassov <iourit@linux.microsoft.com>
In-Reply-To: <CAKMK7uFkVvfXM7QsgSfP4OLk9b_cSwNsi3s3_7EFuL+Pa1s7eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 05 Feb 2022 09:37:31 +0000
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
Cc: wei.liu@kernel.org, sthemmin@microsoft.com, gregkh@linuxfoundation.org,
 haiyangz@microsoft.com, linux-hyperv@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, spronovo@microsoft.com, jenatali@microsoft.com,
 kys@microsoft.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/17/2022 1:35 AM, Daniel Vetter wrote:
> On Mon, Jan 17, 2022 at 9:34 AM Iouri Tarassov
> <iourit@linux.microsoft.com> wrote:
> >
> >
> btw another idea I had over the w/e: Another option might be to allow
> different backends for sync_file, and then making sure that you cannot
> ever mix dma_fence and hv_dxg_fence type sync_file up (in e.g. the
> merge ioctl).
>
> The issue is that fundamentally dma_fence and memory fences (or umf
> for userspace memory fences as we tend to call them) aren't
> compatible, but some of the interop plans we have is to allow stuffing
> either of them into fence container objects like sync_file. So going
> that route for wddm monitored fence support too could be a really
> future-proof approach, plus it'd allow you to still share the
> sync_file interface code. Not that it's going to be much code sharing,
> since all the implementation code needs to be distinct.
> -Daniel

Thanks Daniel!

I will remove the patch for dxgsyncfile from the next set of upstream 
patches.

It will be added later after a re-design.

Iouri

