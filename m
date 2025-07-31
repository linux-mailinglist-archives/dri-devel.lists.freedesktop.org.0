Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE24B173FA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A37A10E7D1;
	Thu, 31 Jul 2025 15:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iq3Qh3qy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019C710E7BC;
 Thu, 31 Jul 2025 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753975820; x=1785511820;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cw2TnkSTMV0hCCkEL1M02QctK+8lZSTp5409XpOzIJQ=;
 b=Iq3Qh3qydMzzpJalk6DfBTKbqM/iDYVhizqav52MR2YwNYXrJkLv4XzF
 m/CNV/uxGehuzFXUM7A1hkVkN9EqisJh3qGfD5yrAF2GwLsIZhOVrejHF
 fZRtAosrPX661JqwgwXCdYfB+VvWBFFaGhjbxha+HM1/JTMHepPH/v3pC
 GZU2EO1ReU6wMI539ZXHWlU7McHQdcZUejBEyWf136RPi2wdUOwDg4+0v
 K+MMTSHkUIubrWvbEWYe32tHKJiDLvdMllQh4zW5WSz5j12lMiyNbTV6p
 DjOT7oxC/MKJxAreORROmohHYPZelD2YCBDCTiMsgDV2wvl3jXQ2w9Egr w==;
X-CSE-ConnectionGUID: 3c8MmqZLTdW2vjEFovAFqw==
X-CSE-MsgGUID: yBG7CshaTGeHff/7+L/Cjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56002505"
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="56002505"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 08:30:20 -0700
X-CSE-ConnectionGUID: PunfYpe5TDupGQFUVqfzjw==
X-CSE-MsgGUID: 4gDUbEDVQK2B2oMFbSL6sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="167771351"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.195.2])
 ([10.247.195.2])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 08:30:16 -0700
Message-ID: <dd8e3840-1511-4606-8268-9edb1f7bc7a1@linux.intel.com>
Date: Thu, 31 Jul 2025 21:00:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
To: Lukas Wunner <lukas@wunner.de>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Michael J <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <aIqH6ip02p3WQ7Jv@wunner.de>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <aIqH6ip02p3WQ7Jv@wunner.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 31-07-2025 02:30, Lukas Wunner wrote:
> On Wed, Jul 30, 2025 at 12:19:51PM +0530, Aravind Iddamsetty wrote:
>> Our hardware supports RAS(Reliability, Availability, Serviceability) by
>> reporting the errors to the host, which the KMD processes and exposes a
>> set of error counters which can be used by observability tools to take 
>> corrective actions or repairs. Traditionally there were being exposed 
>> via PMU (for relative counters) and sysfs interface (for absolute 
>> value) in our internal branch. But, due to the limitations in this 
>> approach to use two interfaces and also not able to have an event based 
>> reporting or configurability, an alternative approach to try netlink 
>> was suggested by community for drm subsystem wide UAPI for RAS and 
>> telemetry as discussed in [2]. 
>>
>> This [2] is the inspiration to this series. It uses the generic
>> netlink(genl) family subsystem and exposes a set of commands that can
>> be used by every drm driver, the framework provides a means to have
>> custom commands too.
> It seems this series was originally conceived in 2023.  In the meantime,
> tooling has been introduced to auto-generate all the netlink boilerplate
> code from a YAML description in Documentation/netlink/specs/.  I *think*
> using it is mandatory for all newly introduced Netlink protocols.

Thanks Lukas letting me know this. Will do the necessary.

Regards,
Aravind.
>
> Basically you create the uapi and kernel header files plus kernel source
> like this:
>
> tools/net/ynl/pyynl/ynl_gen_c.py --spec Documentation/netlink/specs/drm.yaml \
>   --mode uapi --header
> tools/net/ynl/pyynl/ynl_gen_c.py --spec Documentation/netlink/specs/drm.yaml \
>   --mode kernel --header
> tools/net/ynl/pyynl/ynl_gen_c.py --spec Documentation/netlink/specs/drm.yaml \
>   --mode kernel --source
>
> And then you add both the YAML file as well as the generated files to
> the commit.  The reason you have to do that is because Python is
> optional for building the kernel per Documentation/process/changes.rst,
> so the files cannot be generated at compile time.  It is possible though
> to regenerate them with tools/net/ynl/ynl-regen.sh whenever the YAML file
> is changed.
>
> ynl_gen_c.py is capable of auto-generating code for user space applications
> as well.  And there's tools/net/ynl/pyynl/cli.py to listen to events or
> send requests without having to write any code.
>
> Thanks,
>
> Lukas
