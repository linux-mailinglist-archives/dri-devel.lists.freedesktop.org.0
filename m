Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E81966A17
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 21:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A09710E127;
	Fri, 30 Aug 2024 19:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="ZpthUZPi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFFB10E127
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 19:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1725047493; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Fc5aKmQK2uAwBJfJnqtE5Q2Q+z+4uHVsRQC8QZAAQz3D7oe1q8ycADHvnuMlh5CbwAWHN8weyVTIJKI+NWtrlaSqfjnLkj9LxtNgOhTNDFbkIbxxaPfPNo7TNZCwc6/Iy5xjzAVVr6cL8Ymzqgv4vb2vW8YHbHQgw2CnASKJxXw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725047493;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lZgsVPL1zIUPPX6fL1AfRoli7CWC0FdmvjcrwEFwrMY=; 
 b=mPHFEHi72p36IknxA1gJVYdmIxG/VW/7t5atcKhAg1G+fPoB9chjlQW5EJB+X/Oyi+JTxa15w9cVgTRrKPRUn48QeqgkdDrtt5Dgr47iJcACScqdR/of0oaIc2OwEdNz9MnZf8I6Dk3VhedE/Cww6jV54jTm7sLBhWopSex4QOQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725047493; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=lZgsVPL1zIUPPX6fL1AfRoli7CWC0FdmvjcrwEFwrMY=;
 b=ZpthUZPiBqmUHh7dkw1o9oxEFl1s1Tja+TkbYWkSHJJ4f1/tN6ZkTU7HKM76EuZr
 chDfno7rrtP3f4eYS1z9mO2nnSwsRPrBsLEnt2hOegOPVEO8OHaoSBzeuc0crX/iRmZ
 Lsyd3k/vlhb7qcn15ye3SsW3dJ//FrklIAWSrip0=
Received: by mx.zohomail.com with SMTPS id 17250474912431006.0237532313579;
 Fri, 30 Aug 2024 12:51:31 -0700 (PDT)
Message-ID: <440c8b2b-035b-4983-b078-78252a17725d@collabora.com>
Date: Fri, 30 Aug 2024 22:51:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5? 0/6] Tweaked basic Synopsys DW HDMI QP TX driver for
 Rockchip RK3588
To: Shimrra Shai <shimrrashai@gmail.com>
Cc: Laurent.pinchart@ideasonboard.com, aarnoud@me.com, airlied@gmail.com,
 algea.cao@rock-chips.com, andrzej.hajda@intel.com, andy.yan@rock-chips.com,
 conor+dt@kernel.org, daniel@ffwll.ch, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, krzk+dt@kernel.org,
 ldearquer@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, markyao0591@gmail.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 robh@kernel.org, s.hauer@pengutronix.de, tzimmermann@suse.de
References: <68e78629-5a2c-433b-8c83-50ffced04268@collabora.com>
 <20240830175440.2596-1-shimrrashai@gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20240830175440.2596-1-shimrrashai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Hi Shimrra,

On 8/30/24 8:54 PM, Shimrra Shai wrote:
> Cristian Ciocaltea wrote:
>> Please stop doing this!
>>
>> I appreciate your intention to help, but this is not the proper way of
>> doing it.  This is a work-in-progress series and you should have asked
>> before taking over.  Please do not interfere with other people's work
>> without having a preliminary agreement with the author(s).
>>
>> Additionally, before submitting any other patches, you should get
>> familiar with the process - see [1] for a starting point.
>>
> 
> Hi Cristian,
> 
> Sorry, I did not know what the rules/norms/customs were around this
> kind of thing here as I figured it was an open contribution space. I
> did not know that I should have asked for agreement with you
> beforehand. So go ahead and ignore this patch series if it goes
> against the rules/customs. Even more if these points have already been
> addressed, as redundant work is obviously not helpful.

This is an open community and, obviously, anyone is free to contribute
without asking for permission.  However, taking over an ongoing work is
nothing but a source of confusion.  You may do this for work that is known
to be abandoned, e.g. the author(s) explicitly mentioned that in one of
their last posts, or when there is no sign of activity for long enough
time (usually months, for sure not days or weeks).  In the latter case, I
find it reasonable to still ask for a confirmation that the submitter has
no intention to continue or, at least, discuss the possibilities to join
forces and help moving further.

> That said, if there is some way to help along this project "the right
> way", I would like to for sure! Just tell me what you'd _really_ need
> help/assistance with to get this moved ahead and I'll see if I can
> give it.

Getting more testing on the series, reporting back the findings and/or
providing fixes, would be much appreciated, for sure!  The goal is to land
the basic functionality first, hence any new features should be submitted
afterwards.

Regards,
Cristian

