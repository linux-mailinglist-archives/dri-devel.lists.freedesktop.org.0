Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C44A83710E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 19:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC29A10F04E;
	Mon, 22 Jan 2024 18:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1342 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jan 2024 18:54:10 UTC
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B3C10F035
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 18:54:10 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 40MIT1AI2664504
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 22 Jan 2024 10:29:02 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 40MIT1AI2664504
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2024011201; t=1705948144;
 bh=QCjl5w8ff3CMR72Hnb5PjbDlccx4tDMem9MqU3fld3c=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=B1RosA8XsV29moVdedwgLHhWvwsgILXvhW0cnqL3kqssx8+LP2fpVpgeXP9elD+pG
 NvP3sVoclLIjbwKnJtlAMdYoFQMsyieqlPFdo6OwulQ/CTo54EDpJIA9BovLdM+pmu
 d01iK1nRDbI/rd8sIVmU8kcgadwO7+KRZB7EUefGT2GJ1ua6yaK5wDWwrmFekPex5M
 mGs21wFLqCpmX3iylKsnWRYBebobQrpZzaC7JYOqHM0t0KQmyPnueVibdAVZFRxSTX
 43ctnDUMiixOANgCaQYJixq3Kjoe0zg/DosWuidgtZ/8IjJfD5RJ2+c0LiUsfjpQVW
 V2QG0At5ci/BQ==
Date: Mon, 22 Jan 2024 10:28:58 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Dave Hansen <dave.hansen@intel.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 bp@alien8.de, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: Re: [PATCH v6 7/7] x86/vmware: Add TDX hypercall support
User-Agent: K-9 Mail for Android
In-Reply-To: <ff370e42-f48b-4c62-9b44-9d4031cd78b0@intel.com>
References: <20240109084052.58661-1-amakhalov@vmware.com>
 <20240109084052.58661-8-amakhalov@vmware.com>
 <ff370e42-f48b-4c62-9b44-9d4031cd78b0@intel.com>
Message-ID: <4CF87BC4-E8C8-4584-A275-5A985D5A18A1@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: dmitry.torokhov@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 pv-drivers@vmware.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 x86@kernel.org, dri-devel@lists.freedesktop.org, horms@kernel.org,
 akaher@vmware.com, timothym@vmware.com, linux-graphics-maintainer@vmware.com,
 mripard@kernel.org, jsipek@vmware.com, linux-input@vger.kernel.org,
 namit@vmware.com, kirill.shutemov@linux.intel.com, airlied@gmail.com,
 zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On January 22, 2024 8:32:22 AM PST, Dave Hansen <dave=2Ehansen@intel=2Ecom>=
 wrote:
>On 1/9/24 00:40, Alexey Makhalov wrote:
>> +#ifdef CONFIG_INTEL_TDX_GUEST
>> +unsigned long vmware_tdx_hypercall(unsigned long cmd,
>> +				   struct tdx_module_args *args)
>> +{
>> +	if (!hypervisor_is_type(X86_HYPER_VMWARE))
>> +		return ULONG_MAX;
>> +
>> +	if (cmd & ~VMWARE_CMD_MASK) {
>> +		pr_warn_once("Out of range command %lx\n", cmd);
>> +		return ULONG_MAX;
>> +	}
>> +
>> +	args->r10 =3D VMWARE_TDX_VENDOR_LEAF;
>> +	args->r11 =3D VMWARE_TDX_HCALL_FUNC;
>> +	args->r12 =3D VMWARE_HYPERVISOR_MAGIC;
>> +	args->r13 =3D cmd;
>> +	args->r15 =3D 0; /* CPL */
>> +
>> +	__tdx_hypercall(args);
>> +
>> +	return args->r12;
>> +}
>> +EXPORT_SYMBOL_GPL(vmware_tdx_hypercall);
>> +#endif
>
>This is the kind of wrapper that I was hoping for=2E  Thanks=2E
>
>Acked-by: Dave Hansen <dave=2Ehansen@linux=2Eintel=2Ecom>
>

I'm slightly confused by this TBH=2E

Why are the arguments passed in as a structure, which is modified by the w=
rapper to boot? This is analogous to a system call interface=2E

Furthermore, this is an out-of-line function; it should never be called wi=
th !X86_HYPER_VMWARE or you are introducing overhead for other hypervisors;=
 I believe a pr_warn_once() is in order at least, just as you have for the =
out-of-range test=2E



