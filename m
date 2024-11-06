Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A679E9BF336
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 17:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A00210E71C;
	Wed,  6 Nov 2024 16:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="cU5QPBMw";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="cU5QPBMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Wed, 06 Nov 2024 16:28:40 UTC
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [96.44.175.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EA810E71C;
 Wed,  6 Nov 2024 16:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1730910110;
 bh=HQshn+aokYOzX2PpyF6fG/q8hoNYMwDs17z7ySDbn+I=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=cU5QPBMw0ZGmjN/yoxh7HPiQzwCj5iIh2GWiCibNLbuDqXnHEbBP++cZJh7NLQfaj
 2PUWA5eoBUff5V46dVuBXE95G365AUDvoAZnZVg5H/qcj9KGyuc98nbud5cU/mVIAv
 MH/4GJURB9MmQTZvIS+yvvfXyqRGdDcyU1T1aLbQ=
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 9A9AF1286919;
 Wed, 06 Nov 2024 11:21:50 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id cgtYq2N-FNZZ; Wed,  6 Nov 2024 11:21:50 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1730910110;
 bh=HQshn+aokYOzX2PpyF6fG/q8hoNYMwDs17z7ySDbn+I=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=cU5QPBMw0ZGmjN/yoxh7HPiQzwCj5iIh2GWiCibNLbuDqXnHEbBP++cZJh7NLQfaj
 2PUWA5eoBUff5V46dVuBXE95G365AUDvoAZnZVg5H/qcj9KGyuc98nbud5cU/mVIAv
 MH/4GJURB9MmQTZvIS+yvvfXyqRGdDcyU1T1aLbQ=
Received: from lingrow.int.hansenpartnership.com (unknown
 [IPv6:2601:5c4:4302:c21::a774])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id EE24A1286912;
 Wed, 06 Nov 2024 11:21:46 -0500 (EST)
Message-ID: <9e9e54cdd4905b58470f674aefcfd4dabca4108d.camel@HansenPartnership.com>
Subject: Re: [PATCH 6.6 00/28] fix CVE-2024-46701
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Chuck Lever III <chuck.lever@oracle.com>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-stable
 <stable@vger.kernel.org>,  "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "sunpeng.li@amd.com" <sunpeng.li@amd.com>, 
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Xinhui.Pan@amd.com"
 <Xinhui.Pan@amd.com>,  "airlied@gmail.com" <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Al Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Liam Howlett <liam.howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Sasha Levin
 <sashal@kernel.org>, "srinivasan.shanmugam@amd.com"
 <srinivasan.shanmugam@amd.com>, "chiahsuan.chung@amd.com"
 <chiahsuan.chung@amd.com>, "mingo@kernel.org" <mingo@kernel.org>, 
 "mgorman@techsingularity.net" <mgorman@techsingularity.net>,
 "yukuai3@huawei.com" <yukuai3@huawei.com>,  "chengming.zhou@linux.dev"
 <chengming.zhou@linux.dev>, "zhangpeng.00@bytedance.com"
 <zhangpeng.00@bytedance.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux FS Devel
 <linux-fsdevel@vger.kernel.org>,  "maple-tree@lists.infradead.org"
 <maple-tree@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
 "yi.zhang@huawei.com" <yi.zhang@huawei.com>, yangerkun
 <yangerkun@huawei.com>
Date: Wed, 06 Nov 2024 11:21:45 -0500
In-Reply-To: <7AB98056-93CC-4DE5-AD42-49BA582D3BEF@oracle.com>
References: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
 <2024110625-earwig-deport-d050@gregkh>
 <7AB98056-93CC-4DE5-AD42-49BA582D3BEF@oracle.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2024-11-06 at 15:19 +0000, Chuck Lever III wrote:
> This is the first I've heard of this CVE. It
> would help if the patch authors got some
> notification when these are filed.

Greg did it; it came from the kernel CNA:

https://www.cve.org/CVERecord?id=CVE-2024-46701

The way it seems to work is that this is simply a wrapper for the
upstream commit:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=64a7ce76fb901bf9f9c36cf5d681328fc0fd4b5a

Which is what appears as the last stable reference.  I assume someone
investigated and added the vulnerable kernel details.  I think the
theory is that since you reviewed the original upstream patch, stable
just takes care of the backports and CVE management of the existing fix
through the normal stable process.

James
 


