Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EBCC00AC4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEFA10E3C4;
	Thu, 23 Oct 2025 11:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Re47UxRs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E869E10E3C4;
 Thu, 23 Oct 2025 11:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=50CHd5Ukql2vTyZKQhH/988FqE+7up8mg+CD2up+Zus=; b=Re47UxRsfzq7vqoGEGRlmwscbL
 AaqRdwtSzIsbrk0fJv3lBY3Vpyvrsicmx3QvUcC/uzwfviExSIiJxTaJnrlADTqGs0d19wWvs7Xvf
 278vzIf7ziz1Fc1eVumo59jed6YQeevKEQpSAGaE8ougDb8aLyTFANfcVgCP/SyirfpcpEVE7aeJC
 kYRHYNe6G/8rZWXRppOA53OpJ6z8Ni7FjYg6m2+lEYhZwzzuMYrfMd+ISQZg9CMwIYQcJQN0tqrJd
 QtHgtajgk0UavtZq+wH7qPIevWoPE32K0fx/S1Q1vDGG5TWVbZYP3UbjIl13wn2FC50aJReyw6Ew6
 vk4HELkA==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vBtKk-00DaUJ-2L; Thu, 23 Oct 2025 13:18:18 +0200
Message-ID: <a3c7b8f7-0f2c-4e0c-a55d-3e4433f795db@igalia.com>
Date: Thu, 23 Oct 2025 12:18:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 00/21] DRM scheduling cgroup controller
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Liu <Leo.Liu@amd.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Rob Clark <robdclark@gmail.com>, Tejun Heo <tj@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqunf@netflix.com>,
 =?UTF-8?B?R3LDqWdvaXJlIFDDqWFu?= <gpean@netflix.com>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
 <DD5CCG4MIODH.1718JI1Z7GH8T@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DD5CCG4MIODH.1718JI1Z7GH8T@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 29/09/2025 15:07, Danilo Krummrich wrote:
> On Wed Sep 3, 2025 at 5:23 PM CEST, Tvrtko Ursulin wrote:
>> This is another respin of this old work^1 which since v7 is a total rewrite and
>> completely changes how the control is done.
> 
> I only got some of the patches of the series, can you please send all of them
> for subsequent submissions? You may also want to consider resending if you're
> not getting a lot of feedback due to that. :)

There is so many cc across the series that I am reluctant to copy 
everyone on all patches. So I count on people being subscribed to 
mailing lists and being able to look into the archives if all else fails.

Regarding the luke warm response here is short video showing it in action:

https://people.igalia.com/tursulin/drm_cgroup.mp4

Please ignore the typos made in the video commentary but I would say it 
is worth a watch.

Lets see if that helps to paint a picture to people on what this can do. 
With some minimum imagination different use cases are obvious as well. 
For example start a compute job in the background with the UI still 
being responsive.
>> On the userspace interface side of things it is the same as before. We have
>> drm.weight as an interface, taking integers from 1 to 10000, the same as CPU and
>> IO cgroup controllers.
> 
> In general, I think it would be good to get GPU vendors to speak up to what kind
> of interfaces they're heading to with firmware schedulers and potential firmware
> APIs to control scheduling; especially given that this will be a uAPI.
> 
> (Adding a couple of folks to Cc.)
> 
> Having that said, I think the basic drm.weight interface is fine and should work
> in any case; i.e. with the existing DRM GPU scheduler in both modes, the
> upcoming DRM Jobqueue efforts and should be generic enough to work with
> potential firmware interfaces we may see in the future.Yes, basic drm.weight should not be controversial at all.

For all drivers which use the DRM scheduler in the 1:N mode it is 
trivial to wire the support up once the "fair" DRM scheduler lands. 
Trivial because scheduling weight is directly compatible with virtual 
GPU time accounting fair scheduler implements. This series has an 
example how to do it for amdgpu and many other simple drivers could do 
it exactly like with a few lines of boilerplate code.

For some 1:1 firmware scheduling drivers, like xe for example, patch 
series also includes a sketch on how it could make use drm.weight by 
giving firmware a hint what is the most important, and what is least 
important. In practice that is also usable for some use cases. (In fact 
the demo video above was made with xe! Results with amdgpu are pretty 
similar but I hit some snags with screen recording on that device.)

Possibly the main problem causing the luke warm response, as far as I 
understood during the XDC last month, is what to do about the drivers 
where seemingly neither approach can be implemented.

Like nouveau for example. Thinking seems to be it couldn't be wired up. 
I don't know that driver nor hardware (firmware) so I cannot say.

To satisfy that concern one idea I had is that perhaps I could expose a 
new control file like drm.weight_supported or something, which could 
have a semantics along the lines of:

  + - all active client/drivers in the cgroup support the feature
  ? - a mix of supported and unsupported
  - - none support the drm.weight feature

That would give visibility to the "Why is this thing not doing anything 
on my system?" question. Then over time solutions on how to support even 
those problematic drivers with closed firmware could be found. There 
will certainly be motivation not to be the one with worse user experience.

Regards,

Tvrtko

