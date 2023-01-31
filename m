Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7339F682F4E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 15:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBB110E357;
	Tue, 31 Jan 2023 14:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9A310E34E;
 Tue, 31 Jan 2023 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BB/SzevgqkcK1QgjvDHf1Z7c1N8umOeuq3Bm/k/viCg=; b=cnmv2sOozd8U1OVFD2fW1Tq7WY
 IksaYU2XphIXQ7J60+dXK/ydfFdIzT/62r3meYz2ndBklQghxLx8sz8WcYw5JfJbv5ChaHah2o+6i
 Zqd3a61f9MiWajQQLMS20uT1R9UzoepSfippd3PHsayzJVVK/9KaVunKr9PI2Mlepi9mfVtcrPfLC
 9TfHY/uehES/ITHOV2GHZT0VEle/fHYx9ifOOhrzoK2i7mSS4Ng1rSfdpn0CXoBsZplMSuETBD224
 5dapBxgLeZeWYQ5h6q2W6/27KpNBAaVw9vx2TXRf1JBTL0A0zqEQl9M5JMmUXKRu2kpOWdxHnbiuz
 fE+XciIQ==;
Received: from [187.10.60.187] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pMrgW-005Stw-Gq; Tue, 31 Jan 2023 15:32:33 +0100
Message-ID: <6a5bea62-b711-6f2e-b366-a1083bc7327f@igalia.com>
Date: Tue, 31 Jan 2023 11:32:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
Content-Language: en-US
To: "Chen, Guchun" <Guchun.Chen@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
 <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
 <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
 <DM5PR12MB24693E815CAB63FE2DE06E4CF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <DM5PR12MB24696F955FF95A7AB00E1956F1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <984ee981-2906-0eaf-ccec-9f80975cb136@amd.com>
 <DM5PR12MB246930987580ACA15EA44C2BF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <DM5PR12MB246930987580ACA15EA44C2BF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/01/2023 10:58, Chen, Guchun wrote:
> Hi Christian,
> 
> Do you think if it makes sense that we can set 'ring->sched.ready' to be true in each ring init, even if before executing/setting up drm_sched_init in amdgpu_device_init_schedulers? As 'ready' is a member of gpu scheduler structure.
> 
> Regards,
> Guchun
> 

Hi folks, thanks a lot for the feedback so far, much appreciated!

I'm feeling a bit confused specially since there seems to be 2
orthogonal (yet related) topics being discussed; let me try to summarize
my understanding and we can then further discuss better:

(a) The first problem is the one addressed in the patch - how to prevent
drm_sched_fini() to get called if drm_sched_init() wasn't called?

I've proposed sched.name, seems Christian prefers sched.ops, correct?


(b) We can't use sched.ready, which would make sense...but amdgpu
overrides its meaning, the driver manipulates this value for its own
purposes of tracking ring init, or something like that.

This is the tangential topic: what should we do here? My understanding
of Alex's message is that we could have a "ready" field in the ring
structure and stop messing with sched.ready - does it make sense Alex?

Guchun / Christian, does it also make sense for you?


Regarding (a), I could re-submit having s/sched.name/sched.ops, no
biggies, I tested both to be fair, before sending...I just chose name
but any field that is proper initialized on drm_sched_init() would work.

Thanks,


Guilherme
