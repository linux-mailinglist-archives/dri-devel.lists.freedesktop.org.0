Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF6E1A44A2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE54B6ECAB;
	Fri, 10 Apr 2020 09:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0A86E110
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 16:02:06 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e8f46f00000>; Thu, 09 Apr 2020 09:01:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 09 Apr 2020 09:02:05 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 09 Apr 2020 09:02:05 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Apr
 2020 16:02:05 +0000
Received: from [10.2.171.241] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Apr 2020
 16:02:04 +0000
Subject: Re: [PATCH] gpu: host1x: Detach driver on unregister
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200408173802.3077833-1-thierry.reding@gmail.com>
From: Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <a1223208-9571-317f-364d-f1101c4be174@nvidia.com>
Date: Thu, 9 Apr 2020 09:02:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200408173802.3077833-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1586448112; bh=K7R7BJDDILGadIEZGJYsYX5tOd8edcitytPLfwZ96fk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=JSm1W7mkfQw34UMTiupHgRm+75BOOOog++QSS+ylBdW5dZqxvjCmhY3TFRQ/cdhhb
 A3nuWC7pVxEvLBRzP5YaSkGm3qThUoWUGSjY5tZUvTdRDp1kqXeZf+s0l5whpQcc66
 vXVm+R4z5ZfssTwjb7gqSuwFQvL0PVW+P3Fhr5UfV/AI3R2rE/gvbYQrA+zS+DqUB9
 DEo9bpAzdizE5BhdqnjA996GEuF5GEypuDEggr31z0Wo48di20E7sBmK4YNsyXXt4i
 V0MIA+lcdWl0yS1aZ5EhVKTJDjW2TUUdpIcHtsNjrdwalDFFfMrtqJiLCleFE4QZ4U
 UdgbFNzBYMT3g==
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/8/20 10:38 AM, Thierry Reding wrote:
> From: Thierry Reding<treding@nvidia.com>
>
> Currently when a host1x device driver is unregistered, it is not
> detached from the host1x controller, which means that the device
> will stay around and when the driver is registered again, it may
> bind to the old, stale device rather than the new one that was
> created from scratch upon driver registration. This in turn can
> cause various weird crashes within the driver core because it is
> confronted with a device that was already deleted.
>
> Fix this by detaching the driver from the host1x controller when
> it is unregistered. This ensures that the deleted device also is
> no longer present in the device list that drivers will bind to.
>
> Reported-by: Sowjanya Komatineni<skomatineni@nvidia.com>
> Signed-off-by: Thierry Reding<treding@nvidia.com>
> ---

Tested-by: Sowjanya Komatineni <skomatineni@nvidia.com>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
