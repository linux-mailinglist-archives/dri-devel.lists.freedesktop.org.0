Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574FB78F013
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 17:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6A110E18D;
	Thu, 31 Aug 2023 15:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 340 seconds by postgrey-1.36 at gabe;
 Thu, 31 Aug 2023 15:17:50 UTC
Received: from ts201-smtpout72.ddc.teliasonera.net
 (ts201-smtpout72.ddc.teliasonera.net [81.236.60.177])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D59110E18D;
 Thu, 31 Aug 2023 15:17:50 +0000 (UTC)
X-RG-Rigid: 63C2593509529826
X-Originating-IP: [81.229.73.173]
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedviedrudegtddgkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvffgnffktefuhgdpggftfghnshhusghstghrihgsvgdpqfgfvfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfvfevhffutgfgsehtjeertddtfeejnecuhfhrohhmpefvhhhomhgrshcujfgvlhhlshhtrhpnmhcuoehthhhomhgrshesshhhihhpmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudeltdeltdeuvdevjeetleelkefhiefgudfhueefvdevhedtvdejfeffvddutdenucfkphepkedurddvvdelrdejfedrudejfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehmrghilhdurdhshhhiphhmrghilhdrohhrghdpihhnvghtpeekuddrvddvledrjeefrddujeefpdhmrghilhhfrhhomhepthhhohhmrghssehshhhiphhmrghilhdrohhrghdpnhgspghrtghpthhtohepgedprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopegurghkrhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mail1.shipmail.org (81.229.73.173) by
 ts201-smtpout72.ddc.teliasonera.net (5.8.716)
 id 63C2593509529826; Thu, 31 Aug 2023 17:12:03 +0200
Received: from [192.168.0.121] (81-229-73-173-no17.tbcn.telia.com
 [81.229.73.173])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BB7A63631E2;
 Thu, 31 Aug 2023 17:12:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1693494722; bh=PPADEB91LWCpzYBSuDHClvkj3a/W+nAar2kRfR+auwY=;
 h=Date:To:Cc:From:Subject:From;
 b=bhSeEQnvoSMBA+YcWQLLkSPhktG5PIXi+A8FVb7O1abtubiuFv9awhma7E3Ecr+35
 panIrP4tAenouU2cutuuYe608h6L8puG+Nbfmb/Yg7h8il2e7fhdEO0Ok5bGxXITlx
 86k752pw4XXCx6SAbip63XxiRtqz2e5R0qv1gFvU=
Message-ID: <343997f1-d164-84cb-d7ed-3141620a63e4@shipmail.org>
Date: Thu, 31 Aug 2023 17:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas@shipmail.org>
Subject: Refcounting in drm_exec
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian, Danilo

Looking at the drm_exec code it seems we refcount *all* locked objects 
until drm_exec_fini(). Are callers supposed to be able to *rely* on 
this? I'm asking because refcounting appears only strictly necessary for 
contended- and prelocked objects, and callers would otherwise need to 
make sure they don't drop a locked object across the lock? It's going to 
be pretty hard to change this in the future if we want for added 
efficiency if people start to rely on it.

Also seems drm_exec_unlock_all() drops the prelocked object without 
unlocking. I'll put together a patch.

Thanks,

Thomas'

