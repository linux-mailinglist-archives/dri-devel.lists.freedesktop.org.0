Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6A02FB43C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7373E6E84E;
	Tue, 19 Jan 2021 08:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B306E1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 13:16:19 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B60058a220000>; Mon, 18 Jan 2021 05:16:18 -0800
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Mon, 18 Jan 2021 13:16:11 +0000
Date: Mon, 18 Jan 2021 15:16:08 +0200
From: Eli Cohen <elic@nvidia.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Change eats memory on my server
Message-ID: <20210118131608.GA50817@mtl-vdi-166.wap.labs.mlnx>
References: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>
 <23cf7712-1daf-23b8-b596-792c9586d6b4@suse.de>
 <20210117050837.GA225992@mtl-vdi-166.wap.labs.mlnx>
 <83f74a11-b3c0-db2e-8301-4292d60d803b@amd.com>
 <2ea2630b-8782-c662-91fe-683d8b5d6c99@suse.de>
 <20210118091302.GB40909@mtl-vdi-166.wap.labs.mlnx>
 <052812fd-10ce-abf4-d12a-91d4fd66ed54@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <052812fd-10ce-abf4-d12a-91d4fd66ed54@suse.de>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1610975778; bh=l3l11JUxFpok5jfXeALrLtW4EEP/3cDQ3PHNG0KaDhY=;
 h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To:User-Agent:
 X-Originating-IP:X-ClientProxiedBy;
 b=jRrqMxhJ7q0y5UDTfh7isRbwgK1CaJpORosmdB/dQkPQaFgD/oUEY8jPFgDEeOVtT
 wdtvCaCdzFpjaKCfn+Gt+klO/xSrRBnSTiLYHQCJzJBh3K/SbVIl1etE9NSSt5grcJ
 iTDOGy0vmqj3aWfXVch/KFSnIK+l2b2amsODD/rHGTWrn8WciTIkmRUHps/eSZlT8I
 mj2L3J698a1juj4nwXSBg0+OUyhtQgXD0F0KU7lHfa/iRpMjYF/31gGQE45UUWMXFX
 kII/By6CXb5GkleFF4+sI+8p3CV26v39Uo7jp5UlHKgbTPR2Is7Fe4Or6givSx1Ax/
 T2wMkU8G23cog==
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, sam@ravnborg.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 10:30:56AM +0100, Thomas Zimmermann wrote:
> 
> Here's the patch against the latest DRM tree. v5.11-rc3 should work as well.
> 
> I was able to reproduce the memory leak locally and found that the patch
> fixes it. Please give it a try.
> 

As far as I am concerned, this issue is fixed by the patch you sent.

Thanks for looking into it.

Eli
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
