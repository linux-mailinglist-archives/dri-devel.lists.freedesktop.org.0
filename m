Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC197CBA6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 17:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE4510E723;
	Thu, 19 Sep 2024 15:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fi8cxGJD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4790C10E728
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 15:36:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8507A5C5847;
 Thu, 19 Sep 2024 15:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A24EC4CEC4;
 Thu, 19 Sep 2024 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726760215;
 bh=879HNooIMaIFioLy2pe7lTtGackRZjg3s0MWDuVebRk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fi8cxGJDY3PMreguRD7elAhgNd+m4RWAMVBbZ3Kj2iGrTnRHfRoXzRIln7hreIMpQ
 RjmJemV7tpNVtaWXkD6A7G+Zl0sNZaZZKDFgaiCNSTQ46Zycj54iywIDJYdoLwVnrj
 MUhe1R3N/Le/qLB5gtZtzcn8zHpj9xuRI1rVnRjitRv9IAfiEe4h1GtEzCGmN8F5bv
 N6SUZwUMyOVvWTfmaaklOxfAvFeZ8wg1pdYKg4xrQ1je85M2yLi+SpmSNozp4aham0
 e99t6NYnjU+LL0K8HAyZZPBiggehlbBcxU2jNGOHd4PohmtqCWtX5t4pz/cpatA6z2
 zpE1AVM8cGGhQ==
Message-ID: <9e45c5ba-0095-4d36-96c9-ac3c3db0bd0b@kernel.org>
Date: Thu, 19 Sep 2024 17:36:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add crashdump to Sahara
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, andersson@kernel.org,
 jacek.lawrynowicz@linux.intel.com, quic_carlv@quicinc.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
 <630b2044-eaec-4a8a-bd29-d20751d33e2f@kernel.org>
 <5e173c63-ff79-d61c-3c85-887dc08a3fff@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <5e173c63-ff79-d61c-3c85-887dc08a3fff@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 19.09.2024 5:00 PM, Jeffrey Hugo wrote:
> On 9/18/2024 5:41 PM, Konrad Dybcio wrote:
>> On 18.09.2024 5:52 PM, Jeffrey Hugo wrote:
>>> The Sahara protocol has a crashdump functionality. In the hello
>>> exchange, the device can advertise it has a memory dump available for
>>> the host to collect. Instead of the device making requests of the host,
>>> the host requests data from the device which can be later analyzed.
>>>
>>> Implement this functionality and utilize the devcoredump framework for
>>> handing the dump over to userspace.
>>>
>>> Similar to how firmware loading in Sahara involves multiple files,
>>> crashdump can consist of multiple files for different parts of the dump.
>>> Structure these into a single buffer that userspace can parse and
>>> extract the original files from.
>>>
>>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>> ---
>>
>> I gave this a brief read, but.. aren't you dumping however much DRAM the
>> AIC100 has (and then some SRAM) onto the host machine without the user
>> asking for it (i.e. immediately after the AIC crashes)?
> 
> I'm not entirely clear what the concern is.  Too much host RAM usage maybe?

Yes

> In short, I think the direct answer is yes and no.
> 
> We put the dump content in the host RAM and allow the user to decide if they want to save it.  The user has 5 minutes to do something with the dump, then the devcoredump framework automatically frees the content in RAM.  Typically the user would access the sysfs file provided by devcoredump, and save the contents to the file system for offline processing.
> 
> There are a few other GPUs and several other devices that do the same. Panfrost appears to save every BO the user allocated into the dump, which would suggest that the user could create an arbitrarily large dump.

Right, freedreno does something similar. Perhaps a user concerned about this
could simply disable CONFIG_DEVCOREDUMP.

> 
> In the case of AIC100, it is technically possible for the entire device DRAM and SRAM to be offloaded.  That is up to the FW to decide if all of that is relevant.  Current implementation of the FW is heavily aggressive on what it selects for the dump, and current dumps are in the 100-200MB range.

OK this basically invalidates my concerns.. other boards I had ramdump on me
just spat out all the 16 or however much gigabytes of RAM they have..


> It feels like you are implying the user should somehow request the dump by having devcoredump publish something, and then hook into the user's reads of the sysfs to go collect the dump.  I worry that means the driver would then need to determine when there is no user interested in collecting the dump, in order to continue the reboot process.  I expect that would be a 5 minute delay (devcoredump deciding there is no user interest after 5 minutes).  I worry that users would object to such a delay given customer feedback we've had on getting the devices into service quickly.

Yeah no, this wouldn't be good.

Konrad
