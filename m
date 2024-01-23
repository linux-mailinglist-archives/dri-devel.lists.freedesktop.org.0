Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E0283787C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 01:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE7F10F183;
	Tue, 23 Jan 2024 00:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFEE10F183
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 00:20:51 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 40N0HoLc2798528
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 22 Jan 2024 16:17:50 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 40N0HoLc2798528
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2024011201; t=1705969072;
 bh=naevb4PslKTi+uWE0rIwkjLfQkOH3+GqKQddGwCKH50=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=NR/AlsA7je5VAyZlNPTZHvXBBzujylBLOIxmnxF4bzZa+iaBvnN8bscZ+p5JkQaJH
 ktK2PFVspY/AnvBR1rDjgiy5C0pQbhgGOCSnz2c+7QoE2VKG/r5QNRvd9rUsX6u926
 B18RybD5ChPM2oeC+/dkh75st/RyLCw4gBhEDZ/8NXV1GEGVVBn5HwNKITtSiD+b6B
 RNxHsmhbX42aaKRVUIOUymXOHS/xUCX8Nxf7gg67sU9XnG8TdgCwPUGRJ89WxOxQA0
 OHPPuDDGIkVBhGIrtxVa5Ur7uJX/H/QbZqQXpUttoMMbAuhTGzmigvLcbNcDG5iX8f
 xhMr6LuORnThg==
Date: Mon, 22 Jan 2024 16:17:48 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, bp@alien8.de,
 dave.hansen@linux.intel.com, mingo@redhat.com, tglx@linutronix.de
Subject: Re: [PATCH v6 7/7] x86/vmware: Add TDX hypercall support
User-Agent: K-9 Mail for Android
In-Reply-To: <c01cecef-db06-49d8-aa2e-548908c65861@broadcom.com>
References: <20240109084052.58661-1-amakhalov@vmware.com>
 <20240109084052.58661-8-amakhalov@vmware.com>
 <ff370e42-f48b-4c62-9b44-9d4031cd78b0@intel.com>
 <4CF87BC4-E8C8-4584-A275-5A985D5A18A1@zytor.com>
 <c01cecef-db06-49d8-aa2e-548908c65861@broadcom.com>
Message-ID: <351B1153-9CBE-4774-9FAF-770F9F36856E@zytor.com>
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

On January 22, 2024 4:04:33 PM PST, Alexey Makhalov <alexey=2Emakhalov@broa=
dcom=2Ecom> wrote:
>
>
>On 1/22/24 10:28 AM, H=2E Peter Anvin wrote:
>> On January 22, 2024 8:32:22 AM PST, Dave Hansen <dave=2Ehansen@intel=2E=
com> wrote:
>>> On 1/9/24 00:40, Alexey Makhalov wrote:
>>>> +#ifdef CONFIG_INTEL_TDX_GUEST
>>>> +unsigned long vmware_tdx_hypercall(unsigned long cmd,
>>>> +				   struct tdx_module_args *args)
>>>> +{
>>>> +	if (!hypervisor_is_type(X86_HYPER_VMWARE))
>>>> +		return ULONG_MAX;
>>>> +
>>>> +	if (cmd & ~VMWARE_CMD_MASK) {
>>>> +		pr_warn_once("Out of range command %lx\n", cmd);
>>>> +		return ULONG_MAX;
>>>> +	}
>>>> +
>>>> +	args->r10 =3D VMWARE_TDX_VENDOR_LEAF;
>>>> +	args->r11 =3D VMWARE_TDX_HCALL_FUNC;
>>>> +	args->r12 =3D VMWARE_HYPERVISOR_MAGIC;
>>>> +	args->r13 =3D cmd;
>>>> +	args->r15 =3D 0; /* CPL */
>>>> +
>>>> +	__tdx_hypercall(args);
>>>> +
>>>> +	return args->r12;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(vmware_tdx_hypercall);
>>>> +#endif
>>>=20
>>> This is the kind of wrapper that I was hoping for=2E  Thanks=2E
>>>=20
>>> Acked-by: Dave Hansen <dave=2Ehansen@linux=2Eintel=2Ecom>
>>>=20
>>=20
>> I'm slightly confused by this TBH=2E
>>=20
>> Why are the arguments passed in as a structure, which is modified by th=
e wrapper to boot? This is analogous to a system call interface=2E
>>=20
>> Furthermore, this is an out-of-line function; it should never be called=
 with !X86_HYPER_VMWARE or you are introducing overhead for other hyperviso=
rs; I believe a pr_warn_once() is in order at least, just as you have for t=
he out-of-range test=2E
>>=20
>
>This patch series introduces vmware_hypercall family of functions similar=
 to kvm_hypercall=2E Similarity: both vmware and kvm implementations are st=
atic inline functions and both of them use __tdx_hypercall (global not expo=
rted symbol)=2E Difference: kvm_hypercall functions are used _only_ within =
the kernel, but vmware_hypercall are also used by modules=2E
>Exporting __tdx_hypercall function is an original Dave's concern=2E
>So we ended up with exporting wrapper, not generic, but VMware specific w=
ith added checks against arbitrary use=2E
>vmware_tdx_hypercall is not designed for !X86_HYPER_VMWARE callers=2E But=
 such a calls are not forbidden=2E
>Arguments in a structure is an API for __tdx_hypercall()=2E Input and out=
put argument handling are done by vmware_hypercall callers, while VMware sp=
ecific dress up is inside the wrapper=2E
>
>Peter, do you think code comments are required to make it clear for the r=
eader?
>
>

TBH that explanation didn't make much sense to me=2E=2E=2E
