Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D94CAEB85D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 15:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24FE10EA06;
	Fri, 27 Jun 2025 13:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mf92O7bq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6040710EA06
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:02:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 26BD2A52EEB;
 Fri, 27 Jun 2025 13:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C1AC4CEED;
 Fri, 27 Jun 2025 13:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751029323;
 bh=gp0epzP3egqUiKQR6pxigJkagwhLBDTL6iCWSDgXGW8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Mf92O7bqAm0yXgSgJJHXrBRLCx2b7byyy6lPi78UfDbAB7PkOHyPZd3YNeI0ILwOI
 GY6x6hbdFTyOQ2LBLZUKbH7UdrQ+CFwPS5/4aKnQJPutnbN1iewB4PxkdeZ1iPTp45
 /dp6KNaKFRCeSmQEoFd09vt+XFIRGA6ZFlCjponUXeSAMVyzqcfJyBjOvdE128/90a
 ipbTOmHrfwLKAm9qHHYvLzyFK3rDxxBx5UO8by6HUipMXcLQREbBLnAQdoj4LqeiPH
 eB9W1kUck0QmVAAivR4sXVZdySBhqee5Kqe/JquE9QCgBcJkveO26vPhrw2TUZhJoc
 Oi1/ft61NHVGA==
Message-ID: <26bc75ab-5bae-49e5-baaa-155599ab8903@kernel.org>
Date: Fri, 27 Jun 2025 14:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Refactor domain ID to enforce
 strict mapping
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org, amahesh@qti.qualcomm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-4-quic_lxu5@quicinc.com>
 <084ec69f-7b52-468b-8561-de4c1f517a21@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <084ec69f-7b52-468b-8561-de4c1f517a21@oss.qualcomm.com>
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



On 6/27/25 1:23 PM, Konrad Dybcio wrote:
> On 6/27/25 12:33 PM, Ling Xu wrote:
>> Currently, domain ids are added for each instance, which is not a scalable.
> 
> 's/ a//g'
> 
> [...]
> 
>> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
>> +		/* Unsigned PD offloading is only supported on CDSP*/
> 
> missing space before comment end
> 
> [...]
> 
>> index f33d914d8f46..b890f8042e86 100644
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -18,6 +18,13 @@
>>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>>  
>> +#define ADSP_DOMAIN_ID (0)
>> +#define MDSP_DOMAIN_ID (1)
>> +#define SDSP_DOMAIN_ID (2)
>> +#define CDSP_DOMAIN_ID (3)
> 
Pl move the defines back to driver, see below comments.

> No need to include parentheses, as you're not interacting with any
> variables
> 
>> +#define FASTRPC_DOMAIN_MAX    3
> 
> #define FASTRPC_DOMAIN_MAX CDSP_DOMAIN_ID?
> 
> What I meant in the previous revision is that you can not move
> data inside the fastrpc_ioctl_capability struct, but you can
> definitely add a comment like:
> 
> struct fastrpc_ioctl_capability {
>         __u32 domain; /* Retired in v6.whatever, now ignored by the kernel */

hmm, If the plan is to make this field deprecated then why are we adding
the defines to UAPI, it does not make sense.
Also like Konrad suggested
>         __u32 domain; /* deprecated, ignored by the kernel */


Also please move this change as a new patch incase you plan to add the
deprecation along with checks in the kernel to make sure no one is
actually passing data in this member.

--srini


>         __u32 attribute_id;
>         __u32 capability;   /* dsp capability */
>         __u32 reserved[4];
> };
> 
> Konrad

