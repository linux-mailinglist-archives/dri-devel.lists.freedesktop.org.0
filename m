Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0171D6EE1B4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 14:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E0210E257;
	Tue, 25 Apr 2023 12:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A76010E257
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 12:14:49 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Q5LXd6m5Cz9skf;
 Tue, 25 Apr 2023 14:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1682424881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=poZDX7ERqd3433b5t5xbFCz+/zTUxs5bwbl+7lhQVZc=;
 b=HCPQVE3/qzdL9utjEssxxMZ4NRX42q0atTuI12Nh+/EpLGrIukLztzVsRvJvgPhc59VGpi
 e4ntCyU3F2scFzuljYeluTnLC/Ogiof9C5tscS23rpWtquU24n+suKZJGx2cH5JqazqtNN
 yWwk5VaJX3Qkde4UtApirrolerKWjOm6daepPJSfkEDlCPR7/B4ntfsrbgryBbe/B0Y0yd
 wPGzJrvTKIM7HJ8mUVJoYfLbp+3BWjXmmgWFJKXQvwG5F5bxGiVHEt1Oiq3peSc7urklwQ
 ROIGL43kFpLG1LMviCRPh13v1UNxh1hYnyR9h5t7tYcAzbUcAcuee8lbaMUAgA==
Message-ID: <5262c73e-e77c-91f7-e49e-a9c3571e2cc9@mailbox.org>
Date: Tue, 25 Apr 2023 14:14:40 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <20230424014324.218531-1-andrealmeid@igalia.com>
 <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
 <CAAxE2A6Soq28ACV-m1OzG8CA-_VWp+N2wapsABzm2Nda=Qe+yA@mail.gmail.com>
 <784561bb-0937-befc-3774-892d6f6a4318@mailbox.org>
 <CAAxE2A6iuuVA7zjHM8YcTGMpEWuYV=hGRR1YW6W-qXHwAg9w7w@mail.gmail.com>
 <19406ec5-79d6-e9e6-fbdd-eb2f4a872fc4@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <19406ec5-79d6-e9e6-fbdd-eb2f4a872fc4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: aa81d56095e85c51e35
X-MBO-RS-META: xsaisb5d1of8caxkudtw34c613fom6my
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 kernel-dev@igalia.com, "Deucher, Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/25/23 14:08, Christian König wrote:
> Well signaling that something happened is not the question. We do this for both soft as well as hard resets.
> 
> The question is if errors result in blocking further submissions with the same context or not.
> 
> In case of a hard reset and potential loss of state we have to kill the context, otherwise a follow up submission would just lockup the hardware once more.
> 
> In case of a soft reset I think we can keep the context alive, this way even applications without robustness handling can keep work.
> 
> You potentially still get some corruption, but at least not your compositor killed.

Right, and if there is corruption, the user can restart the session.


Maybe a possible compromise could be making soft resets fatal if user space enabled robustness for the context, and non-fatal if not.


> Am 25.04.23 um 13:07 schrieb Marek Olšák:
>> That supposedly depends on the compositor. There may be compositors for very specific cases (e.g. Steam Deck) that handle resets very well, and those would like to be properly notified of all resets because that's how they get the best outcome, e.g. no corruption. A soft reset that is unhandled by userspace may result in persistent corruption.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

