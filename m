Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB380A45116
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 01:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B3410E1B0;
	Wed, 26 Feb 2025 00:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="HuaKl3qd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B1A510E1B0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 00:02:47 +0000 (UTC)
Received: from [100.65.162.92] (unknown [20.236.10.206])
 by linux.microsoft.com (Postfix) with ESMTPSA id A62F5203CDFE;
 Tue, 25 Feb 2025 16:02:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A62F5203CDFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1740528165;
 bh=BFPE5nqMT5TV/F32YTt+Q2sFqdqX3HzV4emGmVK7HJw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HuaKl3qdKUi413qXmLg1j75aNN8MijOcIeKtJu18EQJFDjoRXls3deulMv1TJVsSW
 65ILxLiYMFv1sS1yCqPvEvTeMb7w5g4ew6OAxy2dKtMZrrLZYy7Kf0E371zAONpm5r
 c4JAQrpBSBxtsQowW5sxR9dgfpM5kWSNcx4MfN/8=
Message-ID: <df0c2400-147c-4104-a2e6-d1038ff31524@linux.microsoft.com>
Date: Tue, 25 Feb 2025 16:02:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Frank.Li@nxp.com,
 James.Bottomley@HansenPartnership.com, Julia.Lawall@inria.fr,
 Shyam-sundar.S-k@amd.com, akpm@linux-foundation.org, axboe@kernel.dk,
 broonie@kernel.org, cassel@kernel.org, cem@kernel.org,
 ceph-devel@vger.kernel.org, clm@fb.com, cocci@inria.fr,
 dick.kennedy@broadcom.com, djwong@kernel.org, dlemoal@kernel.org,
 dongsheng.yang@easystack.cn, dri-devel@lists.freedesktop.org,
 dsterba@suse.com, festevam@gmail.com, hch@lst.de, hdegoede@redhat.com,
 hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, idryomov@gmail.com,
 ilpo.jarvinen@linux.intel.com, imx@lists.linux.dev,
 james.smart@broadcom.com, jgg@ziepe.ca, josef@toxicpanda.com,
 kalesh-anakkur.purayil@broadcom.com, kbusch@kernel.org,
 kernel@pengutronix.de, leon@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-xfs@vger.kernel.org,
 martin.petersen@oracle.com, nicolas.palix@imag.fr, ogabbay@kernel.org,
 perex@perex.cz, platform-driver-x86@vger.kernel.org, s.hauer@pengutronix.de,
 sagi@grimberg.me, selvin.xavier@broadcom.com, shawnguo@kernel.org,
 sre@kernel.org, tiwai@suse.com, xiubli@redhat.com, yaron.avizrat@intel.com
Subject: Re: [PATCH v3 06/16] rbd: convert timeouts to secs_to_jiffies()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <20250225-converge-secs-to-jiffies-part-two-v3-6-a43967e36c88@linux.microsoft.com>
 <e53d7586-b278-4338-95a2-fa768d5d8b5e@wanadoo.fr>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <e53d7586-b278-4338-95a2-fa768d5d8b5e@wanadoo.fr>
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

On 2/25/2025 1:09 PM, Christophe JAILLET wrote:
> Le 25/02/2025 à 21:17, Easwar Hariharan a écrit :
>> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
>> secs_to_jiffies().  As the value here is a multiple of 1000, use
>> secs_to_jiffies() instead of msecs_to_jiffies() to avoid the multiplication
>>
>> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
>> the following Coccinelle rules:
>>
>> @depends on patch@ expression E; @@
>>
>> -msecs_to_jiffies(E * 1000)
>> +secs_to_jiffies(E)
>>
>> @depends on patch@ expression E; @@
>>
>> -msecs_to_jiffies(E * MSEC_PER_SEC)
>> +secs_to_jiffies(E)
>>
>> While here, remove the no-longer necessary check for range since there's
>> no multiplication involved.
> 
> I'm not sure this is correct.
> Now you multiply by HZ and things can still overflow.
> 
> 
> Hoping I got casting right:
> 
> #define MSEC_PER_SEC    1000L
> #define HZ 100
> 
> 
> #define secs_to_jiffies(_secs) (unsigned long)((_secs) * HZ)
> 
> static inline unsigned long _msecs_to_jiffies(const unsigned int m)
> {
>     return (m + (MSEC_PER_SEC / HZ) - 1) / (MSEC_PER_SEC / HZ);
> }
> 
> int main() {
> 
>     int n = INT_MAX - 5;
> 
>     printf("res  = %ld\n", secs_to_jiffies(n));
>     printf("res  = %ld\n", _msecs_to_jiffies(1000 * n));
> 
>     return 0;
> }
> 
> 
> gives :
> 
> res  = -600
> res  = 429496130
> 
> with msec, the previous code would catch the overflow, now it overflows silently.
> 
> untested, but maybe:
>     if (result.uint_32 > INT_MAX / HZ)
>         goto out_of_range;
> 
> ?
> 
> CJ
> 

Thanks for the review! I was able to replicate your results, I'll try this range check
and get back.

Thanks,
Easwar (he/him)
