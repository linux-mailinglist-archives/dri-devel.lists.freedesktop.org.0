Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F019087948D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 13:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DA510EA42;
	Tue, 12 Mar 2024 12:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7Zwmxpk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E04510EA15;
 Tue, 12 Mar 2024 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710248027; x=1741784027;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jnSOTc+c1KQulPu1IHe427KtA+qCN4/btB1y1ruIVnw=;
 b=N7ZwmxpkyZK5ib/ox94L3P780W8FwCmwlgSwQZM0JpoF6OYGO/FtBJRw
 Km20TxmNhXF4oWn9QLldOJXMcroj3QSHTqAUG/auFToexZeXlk0umLBbU
 g4D6fyG2GUFuHqgG6XBvJSGIZ36yrXVnXJu6GDmEUnNdsKthWlysv06iB
 XvuwGAsh4wOKRp/3KQUwYxWRMh2WjtK3uNUezleoMw0s84+xlkfMTs4ZC
 Uh8dS3JlYG1LvScPGiJ3oD4SVej+i2lVbAwHbTjImpB5L0rqAvYlu5SGH
 slHS4jlcbxWVpp+dGvhor1jCzrBxflEPlkSOCe7iegb+nNeX/uxpG1K8g w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5140581"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5140581"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16137545"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 05:53:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 05:53:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 05:53:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 05:53:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7x4ELKWcgiPcfYzXvRVq232UEMXWdvoO6PU2clKYu9Xo0bWXLFniGhkfTI8mBqQVZYmdv8VwhQEM0P8M/ESMX0JLlJ0fnkaNVBS32usDV7EhqTPekT873K3WkEylZd2blHaLCltIGptOjVIyHBWQjFxqR2bv+3oqbULm4Dk4GtFh/v2KsgHbuG5u3GXJ6gAcz0+Wvg5Do6R8B38N3FaMLk+3MS9hrTd7GvMlNXTP7aO5a4f6UpldKPdmUpP5xPO5dVqfOmUKlI6EsO8f1jQ5rY6D2RZSOw4gudNXhq1xj5bHV21VlAq3jw7sfFblIOGKOfgvnTrbTfSpy9rdsSZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLYgfgTa0Mphauab4sz9XIXQu6247acpnVJUsHH2eBU=;
 b=gKqgNEZ1QaNc14/uHSAcOegrz49Lf9nCQvFFblwM24SQZmRtoskhJpF8QksNDNwZtlc7REwVeK7OYMqpvjA3xJ0WgDwJeJkLa2RSoppMyG4lgqzIDyijSa8Bk29N5G1iOe52aRmiMEwRPml8oc/VSrxZK2wx2WfgGCy4cMbLZX6X79hVs8D24CWIU5n+Y7WOHU3fyzh+H67E8hRpVWvYyXAbGN9W7TrR8QpjUwfaGGVaiAxvhRuocHx6aqGX7eflgdT5rwXwrhbCR7bmew83lNplb2izITJ7pmPTJQ4t4UavM4uLns9eOxPcaaLHinwHp/hNo3VFZMxQg/a2Gh2KEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 12:53:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Tue, 12 Mar 2024
 12:53:42 +0000
Date: Tue, 12 Mar 2024 07:53:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 0/5] drm/i915: cleanup dead code
Message-ID: <ptp4246sa4lylaaebaygnk4kezi7dgzz2neohoyljt5comp2lt@crxum6xnudma>
References: <20240306193643.1897026-1-lucas.demarchi@intel.com>
 <3e260fe4-9e21-4997-a41d-8b547612b65c@ursulin.net>
 <ib5axtjg4z5tdteclrvisvmjvvtvfytw6onisbt3jes4lvfsk2@afattpxmdnqn>
 <c1bf2c60-8183-437b-9e6e-68cdf451b07b@ursulin.net>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1bf2c60-8183-437b-9e6e-68cdf451b07b@ursulin.net>
X-ClientProxiedBy: BY5PR17CA0064.namprd17.prod.outlook.com
 (2603:10b6:a03:167::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: d1275d7d-2fed-470e-79ce-08dc429371f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W/M/9LM+PBFOU1HhQimXBpK+/s5Mtbv/M44TtQ9dcaDOiAOrH6YghWX2EthHwzTOLLDkYpjjomeFfdY7JZOCyINkRFF3dEnhD8KrBAA+ORSy180n1IPSVOh1SjhHK81/ozI9W257rh8LCcudPtciPtwBiFCZwbzA8/jjCvssoPfCSqU3vGk3QRRSscgr49C4MsI2zefnnV+YilHa3H9Nb3tYUrDPIhj+hEN8vPY6RInDiUISoHRKZe3NgfmmD0je9+zDGayMqPnvUgOfTgCSrNDqGpjt4wvxsIzh3KrCqR1s3P07yaWrVihcE3TL6ELhpoEopPuH7T/z70GNedU+/OG5ErJlUBhgunR4QltR5xFqefkaxyOIX1hj0qk+UVPZrwDE/lGudWOg7I16OPHk7nrfqsxrHpR1MYZzqXEyZtk3BAEmSHvdwEt3ueOVJb1CtBNeDMr4mz6obeF+zwUSkz0FFCRkTQyzUr2CRmfNZ/I+AD44SylYuW+o1IGQ8+HwMdP32loNe4zQjKAEQ60Nwvj2DwSdwsqeBI7fKXPjp77IEdK3cgeXbSUGICy+iPmeUEjCQotkfbX4sSeLGNuK3URtmrA/G/rEiwqE6fyswa8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Px7m7mUIQfjuN8vGLFTUMg4ir2raMJIAKrS3ccqWlweO5aNQvNNu55mMyR?=
 =?iso-8859-1?Q?hNUZq/jx3JRotTtDVJL/ayEL1RrNYKeX32RD5/i6d5Sb5utBohOuObdoFX?=
 =?iso-8859-1?Q?yLOb3KEZYH/XS9xKk2elFDacyLQVJ3/OUWicrEMsKEYO5bqhWPmClfGa7z?=
 =?iso-8859-1?Q?pnzAkTbGYP5OWtczmF0BhpTcAjzOmp7J/era1YlDI1LznDWwWT9UPxKk5H?=
 =?iso-8859-1?Q?hilObr1sDMk23ZZvVgmJ9w44mPwNklsZukLpm9xO4r4GFdsO0rdxMVgyFJ?=
 =?iso-8859-1?Q?fevZa2aUjWI9imR6FObAXST9zHMmZmPIb3IlskVS35zmwGR7sRVWc412wB?=
 =?iso-8859-1?Q?M8bIfJmI8JJtq2DZQaGuQQVBzJmoVJOBOlN3odsD9FSFQP+MIoHfnBiJ5x?=
 =?iso-8859-1?Q?gOzK9pCgbxgmwtZZb5OpfVuJJ+GsxiCM8Zcx6imJvAsQagfjH8xseLyo6N?=
 =?iso-8859-1?Q?tDnsLMkWm1ACrlgJ8fcfxaBFKbO/fFKxTioKebKpi2JtlZuzZP79Vpwr55?=
 =?iso-8859-1?Q?myoYrWOGK9JJhH+LRnjLE9nZT7vyB7bTZZ3nNK2JSLSMcm1uluwTa+MAs/?=
 =?iso-8859-1?Q?vXNerJLUI+XXKpXeVv8P1z3FAPC74sNaw6t2Y7coC6r4nupYv+zqo2LUcH?=
 =?iso-8859-1?Q?DwgBnFlV/9Ns5k8WGtjWG4dKeEqG1nEpjje7LTjgF/71f1sfQfexBwpE7/?=
 =?iso-8859-1?Q?ady9yuDXOGAbw2DYlndjYFmnUt9Ga844S8g3YTcNSyiUrOrHIgexX/tb9b?=
 =?iso-8859-1?Q?nASYEzf4TNuaLJHD4ei5YqMuGx4PCeLD8O1DqehMbEAipd0ytnBRIfJ+jh?=
 =?iso-8859-1?Q?dko6s4hPa5oe13mfoMyXlvZB2TzsNHIb/FVTbYkR3ZW2pRGPRYnz/oF3oc?=
 =?iso-8859-1?Q?PcY8FZZENqoa3qqrYy8WFZ/HhjIXKS5ujOGQLBFDtRsdJwdyAapmGatGz3?=
 =?iso-8859-1?Q?CScB1voPAwGLTc0V5TfKYsbxBlec+QVH1NecrIBEx3it5vlVGVQWWfuBpC?=
 =?iso-8859-1?Q?wQjQ9/odYOYhYSLegFThBXGnEua5xZf49FwUiw+U0oCiGgLY3f21j9pNlg?=
 =?iso-8859-1?Q?lCyIiFnGkMKv2CZdkO3/zUmlnQIm7TC4oIYu+AXowh2qtpe+NDJ+opy7oF?=
 =?iso-8859-1?Q?fgpbNMddJFfvuDfLIqa/YoAbz8Mb2dNF8rLb0wI4c62puwbLKGFe/2sSOY?=
 =?iso-8859-1?Q?J9VPCDVqZUkS4fITpgdZBOlYuAJ8nW7JDNHZhw0wH/BX64V3E7IoaYHPHq?=
 =?iso-8859-1?Q?IsrcyVQRIl3wkfKFu6a7KgcQ302ffj6bKGNMdbqQ4wA6fWo+ImBR6JPZU1?=
 =?iso-8859-1?Q?REmaOOwKKXUsWrASEbHaui88DunJwbJwiiR9AM40XC2iQyjSvLnx+t4Y3o?=
 =?iso-8859-1?Q?AtKLRrM6eMFBc3tqovWsiQVycddw9q1ro50mgXa1JE8XswP1QN64xb1SUV?=
 =?iso-8859-1?Q?wI7lgE0vDNsfpgehV2QvueIywGB8UzGa/anN05r4uFD0Qj42hROy/NnA4v?=
 =?iso-8859-1?Q?grSxrRw9hgjK0q83WSlclbXEDWSHH40W26Ke8Sc8Gm3Vq9mvEu+E9gtfoI?=
 =?iso-8859-1?Q?bKVLA31XpW5NA+e3jvTR8Zx3sN1d4lzfVyo4X2JqNW5hgkWGX25zFDCyDN?=
 =?iso-8859-1?Q?fS4ERgNPov+rvFNbSNJ2A4MFeHC838EH/uT6FhgA7TSbhZu2SDmnRgbg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1275d7d-2fed-470e-79ce-08dc429371f6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 12:53:42.1033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSQ7ipqFeaqfC//cMGYquGdP7qQyUH2VR8JSmQpXb+eQJWQmwLtVja9IQ+TOBnp0BQIacvPDE+UM0R+4KUSWGVeOpvXz+0Iusofi2YKbaFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
X-OriginatorOrg: intel.com
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

On Tue, Mar 12, 2024 at 09:54:41AM +0000, Tvrtko Ursulin wrote:
>
>On 11/03/2024 19:27, Lucas De Marchi wrote:
>>On Mon, Mar 11, 2024 at 05:43:00PM +0000, Tvrtko Ursulin wrote:
>>>
>>>On 06/03/2024 19:36, Lucas De Marchi wrote:
>>>>Remove platforms that never had their PCI IDs added to the driver and
>>>>are of course marked with requiring force_probe. Note that most of the
>>>>code for those platforms is actually used by subsequent ones, so it's
>>>>not a huge amount of code being removed.
>>>
>>>I had PVC and xehpsdv back in October but could not collect all acks. :(
>>>
>>>Last two patches from https://patchwork.freedesktop.org/series/124705/.
>>
>>oh... I was actually surprised we still had xehpsdv while removing a
>>WA for PVC, which made me look into removing these platforms.
>>
>>rebasing your series and comparing yours..my-v2, where my-v2 only has
>>patches 2 and 4, I have the diff below. I think it's small enough that I
>>can just take your commits and squash delta. Is that ok to you?
>>
>>my version is a little bit more aggressive, also doing some renames
>>s/xehpsdv/xehp/ and dropping some more code
>>(engine_mask_apply_copy_fuses(), unused registers, default ctx, fw
>>ranges).
>
>Right, yeah I see I missed some case combos in the comments when 
>grepping and more.
>
>>     diff --git a/Documentation/gpu/rfc/i915_vm_bind.h 
>>b/Documentation/gpu/rfc/i915_vm_bind.h
>>     index 8a8fcd4fceac..bc26dc126104 100644
>>     --- a/Documentation/gpu/rfc/i915_vm_bind.h
>>     +++ b/Documentation/gpu/rfc/i915_vm_bind.h
>>     @@ -93,12 +93,11 @@ struct drm_i915_gem_timeline_fence {
>>       * Multiple VA mappings can be created to the same section of 
>>the object
>>       * (aliasing).
>>       *
>>     - * The @start, @offset and @length must be 4K page aligned. 
>>However the DG2
>>     - * and XEHPSDV has 64K page size for device local memory and 
>>has compact page
>>     - * table. On those platforms, for binding device local-memory 
>>objects, the
>>     - * @start, @offset and @length must be 64K aligned. Also, UMDs 
>>should not mix
>>     - * the local memory 64K page and the system memory 4K page 
>>bindings in the same
>>     - * 2M range.
>>     + * The @start, @offset and @length must be 4K page aligned. 
>>However the DG2 has
>>     + * 64K page size for device local memory and has compact page 
>>table. On that
>>     + * platform, for binding device local-memory objects, the 
>>@start, @offset and
>>     + * @length must be 64K aligned. Also, UMDs should not mix the 
>>local memory 64K
>>     + * page and the system memory 4K page bindings in the same 2M range.
>>       *
>>       * Error code -EINVAL will be returned if @start, @offset and 
>>@length are not
>>       * properly aligned. In version 1 (See 
>>I915_PARAM_VM_BIND_VERSION), error code
>>     diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
>>b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>     index 1495b6074492..d3300ae3053f 100644
>>     --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>     +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>     @@ -386,7 +386,7 @@ struct drm_i915_gem_object {
>>          * and kernel mode driver for caching policy control after GEN12.
>>          * In the meantime platform specific tables are created to 
>>translate
>>          * i915_cache_level into pat index, for more details check 
>>the macros
>>     -     * defined i915/i915_pci.c, e.g. TGL_CACHELEVEL.
>>     +     * defined i915/i915_pci.c, e.g. MTL_CACHELEVEL.
>
>Why this?


it was just our different choices while doing the search-and-replace.
It's not that I changed yours, it's that my choice was to go with MTL
and yours to go with TGL. Any of them fit the role here.


>
>>          * For backward compatibility, this field contains values 
>>exactly match
>>          * the entries of enum i915_cache_level for pre-GEN12 
>>platforms (See
>>          * LEGACY_CACHELEVEL), so that the PTE encode functions for these
>>     diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c 
>>b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>     index fa46d2308b0e..1bd0e041e15c 100644
>>     --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>     +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>>     @@ -500,11 +500,11 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
>>      }
>>      static void
>>     -xehpsdv_ppgtt_insert_huge(struct i915_address_space *vm,
>>     -              struct i915_vma_resource *vma_res,
>>     -              struct sgt_dma *iter,
>>     -              unsigned int pat_index,
>>     -              u32 flags)
>>     +xehp_ppgtt_insert_huge(struct i915_address_space *vm,
>>     +               struct i915_vma_resource *vma_res,
>>     +               struct sgt_dma *iter,
>>     +               unsigned int pat_index,
>>     +               u32 flags)
>>      {
>>         const gen8_pte_t pte_encode = vm->pte_encode(0, pat_index, flags);
>>         unsigned int rem = sg_dma_len(iter->sg);
>>     @@ -741,8 +741,8 @@ static void gen8_ppgtt_insert(struct 
>>i915_address_space *vm,
>>         struct sgt_dma iter = sgt_dma(vma_res);
>>         if (vma_res->bi.page_sizes.sg > I915_GTT_PAGE_SIZE) {
>>     -        if (GRAPHICS_VER_FULL(vm->i915) >= IP_VER(12, 50))
>>     -            xehpsdv_ppgtt_insert_huge(vm, vma_res, &iter, 
>>pat_index, flags);
>>     +        if (GRAPHICS_VER_FULL(vm->i915) >= IP_VER(12, 55))
>>     +            xehp_ppgtt_insert_huge(vm, vma_res, &iter, 
>>pat_index, flags);
>>             else
>>                 gen8_ppgtt_insert_huge(vm, vma_res, &iter, 
>>pat_index, flags);
>>         } else  {
>>     @@ -781,11 +781,11 @@ static void 
>>gen8_ppgtt_insert_entry(struct i915_address_space *vm,
>>         drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], 
>>sizeof(*vaddr));
>>      }
>>     -static void __xehpsdv_ppgtt_insert_entry_lm(struct 
>>i915_address_space *vm,
>>     -                        dma_addr_t addr,
>>     -                        u64 offset,
>>     -                        unsigned int pat_index,
>>     -                        u32 flags)
>>     +static void xehp_ppgtt_insert_entry_lm(struct i915_address_space *vm,
>>     +                       dma_addr_t addr,
>>     +                       u64 offset,
>>     +                       unsigned int pat_index,
>>     +                       u32 flags)
>>      {
>>         u64 idx = offset >> GEN8_PTE_SHIFT;
>>         struct i915_page_directory * const pdp =
>>     @@ -810,15 +810,15 @@ static void 
>>__xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,
>>         vaddr[gen8_pd_index(idx, 0) / 16] = vm->pte_encode(addr, 
>>pat_index, flags);
>>      }
>>     -static void xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,
>>     -                       dma_addr_t addr,
>>     -                       u64 offset,
>>     -                       unsigned int pat_index,
>>     -                       u32 flags)
>>     +static void xehp_ppgtt_insert_entry(struct i915_address_space *vm,
>>     +                    dma_addr_t addr,
>>     +                    u64 offset,
>>     +                    unsigned int pat_index,
>>     +                    u32 flags)
>>      {
>>         if (flags & PTE_LM)
>>     -        return __xehpsdv_ppgtt_insert_entry_lm(vm, addr, offset,
>>     -                               pat_index, flags);
>>     +        return xehp_ppgtt_insert_entry_lm(vm, addr, offset,
>>     +                          pat_index, flags);
>>         return gen8_ppgtt_insert_entry(vm, addr, offset, pat_index, 
>>flags);
>>      }
>>     @@ -1042,7 +1042,7 @@ struct i915_ppgtt 
>>*gen8_ppgtt_create(struct intel_gt *gt,
>>         ppgtt->vm.bind_async_flags = I915_VMA_LOCAL_BIND;
>>         ppgtt->vm.insert_entries = gen8_ppgtt_insert;
>>         if (HAS_64K_PAGES(gt->i915))
>>     -        ppgtt->vm.insert_page = xehpsdv_ppgtt_insert_entry;
>>     +        ppgtt->vm.insert_page = xehp_ppgtt_insert_entry;
>>         else
>>             ppgtt->vm.insert_page = gen8_ppgtt_insert_entry;
>>         ppgtt->vm.allocate_va_range = gen8_ppgtt_alloc;
>>     diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>     index f553cf4e6449..423d72115af0 100644
>>     --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>     +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>     @@ -839,38 +839,6 @@ static void 
>>engine_mask_apply_compute_fuses(struct intel_gt *gt)
>>         }
>>      }
>>     -static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
>>     -{
>>     -    struct drm_i915_private *i915 = gt->i915;
>>     -    struct intel_gt_info *info = &gt->info;
>>     -    unsigned long meml3_mask;
>>     -    unsigned long quad;
>>     -
>>     -    if (!(GRAPHICS_VER_FULL(i915) >= IP_VER(12, 60) &&
>>     -          GRAPHICS_VER_FULL(i915) < IP_VER(12, 70)))
>>     -        return;
>
>I trust you know this is correct. :) Without a easy to reach table of 
>platform codenames to ip block version I give up.

well, xe_pci.c has the versions at least until MTL with
graphics ver 12.70. So if we remove PVC (12.60), there's nothing left.

>
>>     -
>>     -    meml3_mask = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
>>     -    meml3_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, meml3_mask);
>>     -
>>     -    /*
>>     -     * Link Copy engines may be fused off according to 
>>meml3_mask. Each
>>     -     * bit is a quad that houses 2 Link Copy and two Sub Copy 
>>engines.
>>     -     */
>>     -    for_each_clear_bit(quad, &meml3_mask, GEN12_MAX_MSLICES) {
>>     -        unsigned int instance = quad * 2 + 1;
>>     -        intel_engine_mask_t mask = GENMASK(_BCS(instance + 1),
>>     -                           _BCS(instance));
>>     -
>>     -        if (mask & info->engine_mask) {
>>     -            gt_dbg(gt, "bcs%u fused off\n", instance);
>>     -            gt_dbg(gt, "bcs%u fused off\n", instance + 1);
>>     -
>>     -            info->engine_mask &= ~mask;
>>     -        }
>>     -    }
>>     -}
>>     -
>>      /*
>>       * Determine which engines are fused off in our particular hardware.
>>       * Note that we have a catch-22 situation where we need to be 
>>able to access
>>     @@ -889,7 +857,6 @@ static intel_engine_mask_t 
>>init_engine_mask(struct intel_gt *gt)
>>         engine_mask_apply_media_fuses(gt);
>>         engine_mask_apply_compute_fuses(gt);
>>     -    engine_mask_apply_copy_fuses(gt);
>>         /*
>>          * The only use of the GSC CS is to load and communicate 
>>with the GSC
>>     diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c 
>>b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>     index 2f386f531c55..ee5115b12a21 100644
>>     --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>     +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>     @@ -57,7 +57,7 @@ static const struct intel_mmio_range 
>>icl_l3bank_steering_table[] = {
>>       * are of a "GAM" subclass that has special rules.  Thus we 
>>use a separate
>>       * GAM table farther down for those.
>>       */
>>     -static const struct intel_mmio_range 
>>xehpsdv_mslice_steering_table[] = {
>>     +static const struct intel_mmio_range dg2_mslice_steering_table[] = {
>>         { 0x00DD00, 0x00DDFF },
>>         { 0x00E900, 0x00FFFF }, /* 0xEA00 - OxEFFF is unused */
>>         {},
>>     @@ -153,7 +153,7 @@ void intel_gt_mcr_init(struct intel_gt *gt)
>>             gt->steering_table[L3BANK] = xelpg_l3bank_steering_table;
>>             gt->steering_table[DSS] = xelpg_dss_steering_table;
>>         } else if (IS_DG2(i915)) {
>>     -        gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
>>     +        gt->steering_table[MSLICE] = dg2_mslice_steering_table;
>>             gt->steering_table[LNCF] = dg2_lncf_steering_table;
>>             /*
>>              * No need to hook up the GAM table since it has a dedicated
>>     diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h 
>>b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>     index 0635c9288742..8d8d781b44b6 100644
>>     --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>     +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>     @@ -723,38 +723,6 @@
>>      #define   HSUNIT_CLKGATE_DIS            REG_BIT(8)
>>      #define   VSUNIT_CLKGATE_DIS            REG_BIT(3)
>>     -#define UNSLCGCTL9440                _MMIO(0x9440)
>>     -#define   GAMTLBOACS_CLKGATE_DIS        REG_BIT(28)
>>     -#define   GAMTLBVDBOX5_CLKGATE_DIS        REG_BIT(27)
>>     -#define   GAMTLBVDBOX6_CLKGATE_DIS        REG_BIT(26)
>>     -#define   GAMTLBVDBOX3_CLKGATE_DIS        REG_BIT(24)
>>     -#define   GAMTLBVDBOX4_CLKGATE_DIS        REG_BIT(23)
>>     -#define   GAMTLBVDBOX7_CLKGATE_DIS        REG_BIT(22)
>>     -#define   GAMTLBVDBOX2_CLKGATE_DIS        REG_BIT(21)
>>     -#define   GAMTLBVDBOX0_CLKGATE_DIS        REG_BIT(17)
>>     -#define   GAMTLBKCR_CLKGATE_DIS            REG_BIT(16)
>>     -#define   GAMTLBGUC_CLKGATE_DIS            REG_BIT(15)
>>     -#define   GAMTLBBLT_CLKGATE_DIS            REG_BIT(14)
>>     -#define   GAMTLBVDBOX1_CLKGATE_DIS        REG_BIT(6)
>>     -
>>     -#define UNSLCGCTL9444                _MMIO(0x9444)
>>     -#define   GAMTLBGFXA0_CLKGATE_DIS        REG_BIT(30)
>>     -#define   GAMTLBGFXA1_CLKGATE_DIS        REG_BIT(29)
>>     -#define   GAMTLBCOMPA0_CLKGATE_DIS        REG_BIT(28)
>>     -#define   GAMTLBCOMPA1_CLKGATE_DIS        REG_BIT(27)
>>     -#define   GAMTLBCOMPB0_CLKGATE_DIS        REG_BIT(26)
>>     -#define   GAMTLBCOMPB1_CLKGATE_DIS        REG_BIT(25)
>>     -#define   GAMTLBCOMPC0_CLKGATE_DIS        REG_BIT(24)
>>     -#define   GAMTLBCOMPC1_CLKGATE_DIS        REG_BIT(23)
>>     -#define   GAMTLBCOMPD0_CLKGATE_DIS        REG_BIT(22)
>>     -#define   GAMTLBCOMPD1_CLKGATE_DIS        REG_BIT(21)
>>     -#define   GAMTLBMERT_CLKGATE_DIS        REG_BIT(20)
>>     -#define   GAMTLBVEBOX3_CLKGATE_DIS        REG_BIT(19)
>>     -#define   GAMTLBVEBOX2_CLKGATE_DIS        REG_BIT(18)
>>     -#define   GAMTLBVEBOX1_CLKGATE_DIS        REG_BIT(17)
>>     -#define   GAMTLBVEBOX0_CLKGATE_DIS        REG_BIT(16)
>>     -#define   LTCDD_CLKGATE_DIS            REG_BIT(10)
>>     -
>>      #define GEN11_SLICE_UNIT_LEVEL_CLKGATE        _MMIO(0x94d4)
>>      #define XEHP_SLICE_UNIT_LEVEL_CLKGATE        MCR_REG(0x94d4)
>>      #define   SARBUNIT_CLKGATE_DIS            (1 << 5)
>>     @@ -764,9 +732,6 @@
>>      #define   L3_CLKGATE_DIS            REG_BIT(16)
>>      #define   L3_CR2X_CLKGATE_DIS            REG_BIT(17)
>>     -#define SCCGCTL94DC                MCR_REG(0x94dc)
>>     -#define   CG3DDISURB                REG_BIT(14)
>>     -
>>      #define UNSLICE_UNIT_LEVEL_CLKGATE2        _MMIO(0x94e4)
>>      #define   VSUNIT_CLKGATE_DIS_TGL        REG_BIT(19)
>>      #define   PSDUNIT_CLKGATE_DIS            REG_BIT(5)
>>     @@ -988,10 +953,6 @@
>>      #define   GEN7_WA_FOR_GEN7_L3_CONTROL        0x3C47FF8C
>>      #define   GEN7_L3AGDIS                (1 << 19)
>>     -#define XEHPC_LNCFMISCCFGREG0            MCR_REG(0xb01c)
>>     -#define   XEHPC_HOSTCACHEEN            REG_BIT(1)
>>     -#define   XEHPC_OVRLSCCC            REG_BIT(0)
>>     -
>>      #define GEN7_L3CNTLREG2                _MMIO(0xb020)
>>      /* MOCS (Memory Object Control State) registers */
>>     @@ -1045,20 +1006,9 @@
>>      #define XEHP_L3SQCREG5                MCR_REG(0xb158)
>>      #define   L3_PWM_TIMER_INIT_VAL_MASK        REG_GENMASK(9, 0)
>>     -#define MLTICTXCTL                MCR_REG(0xb170)
>>     -#define   TDONRENDER                REG_BIT(2)
>>     -
>>      #define XEHP_L3SCQREG7                MCR_REG(0xb188)
>>      #define   BLEND_FILL_CACHING_OPT_DIS        REG_BIT(3)
>>     -#define XEHPC_L3SCRUB                MCR_REG(0xb18c)
>>     -#define   SCRUB_CL_DWNGRADE_SHARED        REG_BIT(12)
>>     -#define   SCRUB_RATE_PER_BANK_MASK        REG_GENMASK(2, 0)
>>     -#define   SCRUB_RATE_4B_PER_CLK            
>>REG_FIELD_PREP(SCRUB_RATE_PER_BANK_MASK, 0x6)
>>     -
>>     -#define L3SQCREG1_CCS0                MCR_REG(0xb200)
>>     -#define   FLUSHALLNONCOH            REG_BIT(5)
>>     -
>>      #define GEN11_GLBLINVL                _MMIO(0xb404)
>>      #define   GEN11_BANK_HASH_ADDR_EXCL_MASK    (0x7f << 5)
>>      #define   GEN11_BANK_HASH_ADDR_EXCL_BIT0    (1 << 5)
>>     @@ -1108,7 +1058,6 @@
>>      #define XEHP_COMPCTX_TLB_INV_CR            MCR_REG(0xcf04)
>>      #define XELPMP_GSC_TLB_INV_CR            _MMIO(0xcf04)   /* 
>>media GT only */
>>     -#define XEHP_MERT_MOD_CTRL            MCR_REG(0xcf28)
>>      #define RENDER_MOD_CTRL                MCR_REG(0xcf2c)
>>      #define COMP_MOD_CTRL                MCR_REG(0xcf30)
>>      #define XELPMP_GSC_MOD_CTRL            _MMIO(0xcf30)    /* 
>>media GT only */
>>     @@ -1184,7 +1133,6 @@
>>      #define EU_PERF_CNTL4                PERF_REG(0xe45c)
>>      #define GEN9_ROW_CHICKEN4            MCR_REG(0xe48c)
>>     -#define   GEN12_DISABLE_GRF_CLEAR        REG_BIT(13)
>>      #define   XEHP_DIS_BBL_SYSPIPE            REG_BIT(11)
>>      #define   GEN12_DISABLE_TDL_PUSH        REG_BIT(9)
>>      #define   GEN11_DIS_PICK_2ND_EU            REG_BIT(7)
>>     @@ -1201,7 +1149,6 @@
>>      #define   FLOW_CONTROL_ENABLE            REG_BIT(15)
>>      #define   UGM_BACKUP_MODE            REG_BIT(13)
>>      #define   MDQ_ARBITRATION_MODE            REG_BIT(12)
>>     -#define   SYSTOLIC_DOP_CLOCK_GATING_DIS        REG_BIT(10)
>>      #define   PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE    REG_BIT(8)
>>      #define   STALL_DOP_GATING_DISABLE        REG_BIT(5)
>>      #define   THROTTLE_12_5                REG_GENMASK(4, 2)
>>     @@ -1678,11 +1625,6 @@
>>      #define GEN12_SFC_DONE(n)            _MMIO(0x1cc000 + (n) * 0x1000)
>>     -#define GT0_PACKAGE_ENERGY_STATUS        _MMIO(0x250004)
>>     -#define GT0_PACKAGE_RAPL_LIMIT            _MMIO(0x250008)
>>     -#define GT0_PACKAGE_POWER_SKU_UNIT        _MMIO(0x250068)
>>     -#define GT0_PLATFORM_ENERGY_STATUS        _MMIO(0x25006c)
>>     -
>>      /*
>>       * Standalone Media's non-engine GT registers are located at 
>>their regular GT
>>       * offsets plus 0x380000.  This extra offset is stored inside 
>>the intel_uncore
>>     diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c 
>>b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
>>     index 90644e47d261..d7784650e4d9 100644
>>     --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
>>     +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
>>     @@ -582,9 +582,10 @@ static ssize_t 
>>media_freq_factor_show(struct kobject *kobj,
>>          */
>>         with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>>             mode = intel_uncore_read(gt->uncore, GEN6_RPNSWREQ);
>>     +
>>         mode = REG_FIELD_GET(GEN12_MEDIA_FREQ_RATIO, mode) ?
>>     -           SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_ONE :
>>     -           SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_TWO;
>>     +        SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_ONE :
>>     +        SLPC_MEDIA_RATIO_MODE_FIXED_ONE_TO_TWO;
>
>Something is off in someone's version here.

yeah, I will double check before v2.

>
>>         return sysfs_emit(buff, "%u\n", media_ratio_mode_to_factor(mode));
>>      }
>>     diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c 
>>b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>     index 7c367ba8d9dc..7f1b00cb9924 100644
>>     --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>>     +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>     @@ -546,47 +546,6 @@ static const u8 gen12_rcs_offsets[] = {
>>         END
>>      };
>>     -static const u8 xehp_rcs_offsets[] = {
>>     -    NOP(1),
>>     -    LRI(13, POSTED),
>>     -    REG16(0x244),
>>     -    REG(0x034),
>>     -    REG(0x030),
>>     -    REG(0x038),
>>     -    REG(0x03c),
>>     -    REG(0x168),
>>     -    REG(0x140),
>>     -    REG(0x110),
>>     -    REG(0x1c0),
>>     -    REG(0x1c4),
>>     -    REG(0x1c8),
>>     -    REG(0x180),
>>     -    REG16(0x2b4),
>>     -
>>     -    NOP(5),
>>     -    LRI(9, POSTED),
>>     -    REG16(0x3a8),
>>     -    REG16(0x28c),
>>     -    REG16(0x288),
>>     -    REG16(0x284),
>>     -    REG16(0x280),
>>     -    REG16(0x27c),
>>     -    REG16(0x278),
>>     -    REG16(0x274),
>>     -    REG16(0x270),
>>     -
>>     -    LRI(3, POSTED),
>>     -    REG(0x1b0),
>>     -    REG16(0x5a8),
>>     -    REG16(0x5ac),
>>     -
>>     -    NOP(6),
>>     -    LRI(1, 0),
>>     -    REG(0x0c8),
>>     -
>>     -    END
>>     -};
>>     -
>>      static const u8 dg2_rcs_offsets[] = {
>>         NOP(1),
>>         LRI(15, POSTED),
>>     @@ -695,8 +654,6 @@ static const u8 *reg_offsets(const struct 
>>intel_engine_cs *engine)
>>                 return mtl_rcs_offsets;
>>             else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
>>                 return dg2_rcs_offsets;
>>     -        else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
>>     -            return xehp_rcs_offsets;
>>             else if (GRAPHICS_VER(engine->i915) >= 12)
>>                 return gen12_rcs_offsets;
>>             else if (GRAPHICS_VER(engine->i915) >= 11)
>>     diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c 
>>b/drivers/gpu/drm/i915/gt/intel_migrate.c
>>     index 576e5ef0289b..86ba2f2e485c 100644
>>     --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
>>     +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
>>     @@ -35,9 +35,9 @@ static bool engine_supports_migration(struct 
>>intel_engine_cs *engine)
>>         return true;
>>      }
>>     -static void xehpsdv_toggle_pdes(struct i915_address_space *vm,
>>     -                struct i915_page_table *pt,
>>     -                void *data)
>>     +static void xehp_toggle_pdes(struct i915_address_space *vm,
>>     +                 struct i915_page_table *pt,
>>     +                 void *data)
>>      {
>>         struct insert_pte_data *d = data;
>>     @@ -52,9 +52,9 @@ static void xehpsdv_toggle_pdes(struct 
>>i915_address_space *vm,
>>         d->offset += SZ_2M;
>>      }
>>     -static void xehpsdv_insert_pte(struct i915_address_space *vm,
>>     -                   struct i915_page_table *pt,
>>     -                   void *data)
>>     +static void xehp_insert_pte(struct i915_address_space *vm,
>>     +                struct i915_page_table *pt,
>>     +                void *data)
>>      {
>>         struct insert_pte_data *d = data;
>>     @@ -120,7 +120,7 @@ static struct i915_address_space 
>>*migrate_vm(struct intel_gt *gt)
>>          * 512 entry layout using 4K GTT pages. The other two 
>>windows just map
>>          * lmem pages and must use the new compact 32 entry layout 
>>using 64K GTT
>>          * pages, which ensures we can address any lmem object that 
>>the user
>>     -     * throws at us. We then also use the xehpsdv_toggle_pdes 
>>as a way of
>>     +     * throws at us. We then also use the xehp_toggle_pdes as 
>>a way of
>>          * just toggling the PDE bit(GEN12_PDE_64K) for us, to enable the
>>          * compact layout for each of these page-tables, that fall 
>>within the
>>          * [CHUNK_SIZE, 3 * CHUNK_SIZE) range.
>>     @@ -209,12 +209,12 @@ static struct i915_address_space 
>>*migrate_vm(struct intel_gt *gt)
>>             /* Now allow the GPU to rewrite the PTE via its own ppGTT */
>>             if (HAS_64K_PAGES(gt->i915)) {
>>                 vm->vm.foreach(&vm->vm, base, d.offset - base,
>>     -                       xehpsdv_insert_pte, &d);
>>     +                       xehp_insert_pte, &d);
>>                 d.offset = base + CHUNK_SZ;
>>                 vm->vm.foreach(&vm->vm,
>>                            d.offset,
>>                            2 * CHUNK_SZ,
>>     -                       xehpsdv_toggle_pdes, &d);
>>     +                       xehp_toggle_pdes, &d);
>>             } else {
>>                 vm->vm.foreach(&vm->vm, base, d.offset - base,
>>                            insert_pte, &d);
>>     diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c 
>>b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>>     index 7889147b44b7..804654ab80ec 100644
>>     --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>>     +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>>     @@ -2661,6 +2661,7 @@ xcs_engine_wa_init(struct intel_engine_cs 
>>*engine, struct i915_wa_list *wal)
>>      static void
>>      ccs_engine_wa_init(struct intel_engine_cs *engine, struct 
>>i915_wa_list *wal)
>>      {
>>     +    /* boilerplate for any CCS engine workaround */
>>      }
>>      /*
>>     diff --git a/drivers/gpu/drm/i915/i915_perf.c 
>>b/drivers/gpu/drm/i915/i915_perf.c
>>     index f68ec0a1c17d..1637c1d235e9 100644
>>     --- a/drivers/gpu/drm/i915/i915_perf.c
>>     +++ b/drivers/gpu/drm/i915/i915_perf.c
>>     @@ -2881,7 +2881,7 @@ gen12_enable_metric_set(struct 
>>i915_perf_stream *stream,
>>         int ret;
>>         /*
>>     -     * Wa_1508761755:xehpsdv, dg2
>>     +     * Wa_1508761755
>>          * EU NOA signals behave incorrectly if EU clock gating is 
>>enabled.
>>          * Disable thread stall DOP gating and EU DOP gating.
>>          */
>>     @@ -2911,7 +2911,7 @@ gen12_enable_metric_set(struct 
>>i915_perf_stream *stream,
>>         /*
>>          * Initialize Super Queue Internal Cnt Register
>>          * Set PMON Enable in order to collect valid metrics.
>>     -     * Enable byets per clock reporting in OA for XEHPSDV onward.
>>     +     * Enable byets per clock reporting in OA.
>
>Could you fix byets while touching the line?
>
>>          */
>>         sqcnt1 = GEN12_SQCNT1_PMON_ENABLE |
>>              (HAS_OA_BPC_REPORTING(i915) ? GEN12_SQCNT1_OABPC : 0);
>>     @@ -2971,8 +2971,7 @@ static void 
>>gen12_disable_metric_set(struct i915_perf_stream *stream)
>>         u32 sqcnt1;
>>         /*
>>     -     * Wa_1508761755:xehpsdv, dg2
>>     -     * Enable thread stall DOP gating and EU DOP gating.
>>     +     * Wa_1508761755: Enable thread stall DOP gating and EU 
>>DOP gating.
>>          */
>>         if (IS_DG2(i915)) {
>>             intel_gt_mcr_multicast_write(uncore->gt, GEN8_ROW_CHICKEN,
>>     diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>>b/drivers/gpu/drm/i915/i915_reg.h
>>     index bdc409085b9a..f62573d48c76 100644
>>     --- a/drivers/gpu/drm/i915/i915_reg.h
>>     +++ b/drivers/gpu/drm/i915/i915_reg.h
>>     @@ -5399,7 +5399,7 @@
>>      #define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed 
>>point format */
>>      #define        POWER_SETUP_I1_DATA_MASK        REG_GENMASK(15, 0)
>>      #define GEN12_PCODE_READ_SAGV_BLOCK_TIME_US    0x23
>>     -#define   XEHP_PCODE_FREQUENCY_CONFIG        0x6e    /* 
>>xehpsdv, pvc */
>>     +#define   XEHP_PCODE_FREQUENCY_CONFIG        0x6e
>>      /* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>>      #define     PCODE_MBOX_FC_SC_READ_FUSED_P0    0x0
>>      #define     PCODE_MBOX_FC_SC_READ_FUSED_PN    0x1
>>     diff --git a/drivers/gpu/drm/i915/intel_uncore.c 
>>b/drivers/gpu/drm/i915/intel_uncore.c
>>     index 58d6c68195e0..40d56f02b5c6 100644
>>     --- a/drivers/gpu/drm/i915/intel_uncore.c
>>     +++ b/drivers/gpu/drm/i915/intel_uncore.c
>>     @@ -1497,17 +1497,16 @@ static const struct 
>>intel_forcewake_range __gen12_fw_ranges[] = {
>>         GEN_FW_RANGE(0x13200, 0x13fff, FORCEWAKE_MEDIA_VDBOX2), 
>>/*        \
>>             0x13200 - 0x133ff: VD2 (DG2 only)                \
>>             0x13400 - 0x13fff: reserved */                    \
>>     -    GEN_FW_RANGE(0x14000, 0x141ff, FORCEWAKE_MEDIA_VDBOX0), /* 
>>XEHPSDV only */    \
>>     -    GEN_FW_RANGE(0x14200, 0x143ff, FORCEWAKE_MEDIA_VDBOX2), /* 
>>XEHPSDV only */    \
>>     -    GEN_FW_RANGE(0x14400, 0x145ff, FORCEWAKE_MEDIA_VDBOX4), /* 
>>XEHPSDV only */    \
>>     -    GEN_FW_RANGE(0x14600, 0x147ff, FORCEWAKE_MEDIA_VDBOX6), /* 
>>XEHPSDV only */    \
>>     +    GEN_FW_RANGE(0x14000, 0x141ff, 
>>FORCEWAKE_MEDIA_VDBOX0),            \
>>     +    GEN_FW_RANGE(0x14200, 0x143ff, 
>>FORCEWAKE_MEDIA_VDBOX2),            \
>>     +    GEN_FW_RANGE(0x14400, 0x145ff, 
>>FORCEWAKE_MEDIA_VDBOX4),            \
>>     +    GEN_FW_RANGE(0x14600, 0x147ff, 
>>FORCEWAKE_MEDIA_VDBOX6),            \
>
>I see Rodrigo and you were discussing this hunk so I will just skip over.
>
>>         GEN_FW_RANGE(0x14800, 0x14fff, FORCEWAKE_RENDER),            \
>>         GEN_FW_RANGE(0x15000, 0x16dff, FORCEWAKE_GT), /*            \
>>             0x15000 - 0x15fff: gt (DG2 only)                \
>>             0x16000 - 0x16dff: reserved */                    \
>>         GEN_FW_RANGE(0x16e00, 0x1ffff, FORCEWAKE_RENDER),            \
>>     -    GEN_FW_RANGE(0x20000, 0x21fff, FORCEWAKE_MEDIA_VDBOX0), 
>>/*        \
>>     -        0x20000 - 0x20fff: VD0 (XEHPSDV only)                \
>>     +    GEN_FW_RANGE(0x21000, 0x21fff, FORCEWAKE_MEDIA_VDBOX0), 
>>/*        \
>>             0x21000 - 0x21fff: reserved */                    \
>>         GEN_FW_RANGE(0x22000, 0x23fff, FORCEWAKE_GT),                \
>>         GEN_FW_RANGE(0x24000, 0x2417f, 0), /*                    \
>>     @@ -1588,10 +1587,6 @@ static const struct 
>>intel_forcewake_range __gen12_fw_ranges[] = {
>>             0x1f6e00 - 0x1f7fff: reserved */                \
>>         GEN_FW_RANGE(0x1f8000, 0x1fa0ff, FORCEWAKE_MEDIA_VEBOX3),
>>     -static const struct intel_forcewake_range __xehp_fw_ranges[] = {
>>     -    XEHP_FWRANGES(FORCEWAKE_GT)
>>     -};
>>     -
>>      static const struct intel_forcewake_range __dg2_fw_ranges[] = {
>>         XEHP_FWRANGES(FORCEWAKE_RENDER)
>>      };
>>     @@ -2442,10 +2437,6 @@ static int uncore_forcewake_init(struct 
>>intel_uncore *uncore)
>>             ASSIGN_FW_DOMAINS_TABLE(uncore, __dg2_fw_ranges);
>>             ASSIGN_SHADOW_TABLE(uncore, dg2_shadowed_regs);
>>             ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
>>     -    } else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>>     -        ASSIGN_FW_DOMAINS_TABLE(uncore, __xehp_fw_ranges);
>>     -        ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>>     -        ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
>>         } else if (GRAPHICS_VER(i915) >= 12) {
>>             ASSIGN_FW_DOMAINS_TABLE(uncore, __gen12_fw_ranges);
>>             ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>>     diff --git a/drivers/gpu/drm/i915/selftests/intel_uncore.c 
>>b/drivers/gpu/drm/i915/selftests/intel_uncore.c
>>     index c998f15d505c..41eaa9b7f67d 100644
>>     --- a/drivers/gpu/drm/i915/selftests/intel_uncore.c
>>     +++ b/drivers/gpu/drm/i915/selftests/intel_uncore.c
>>     @@ -118,7 +118,6 @@ int intel_uncore_mock_selftests(void)
>>             { __gen9_fw_ranges, ARRAY_SIZE(__gen9_fw_ranges), true },
>>             { __gen11_fw_ranges, ARRAY_SIZE(__gen11_fw_ranges), true },
>>             { __gen12_fw_ranges, ARRAY_SIZE(__gen12_fw_ranges), true },
>>     -        { __xehp_fw_ranges, ARRAY_SIZE(__xehp_fw_ranges), true },
>>             { __mtl_fw_ranges, ARRAY_SIZE(__mtl_fw_ranges), true },
>>             { __xelpmp_fw_ranges, ARRAY_SIZE(__xelpmp_fw_ranges), true },
>>         };
>>     diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h 
>>b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>>     index a86d00a9758f..a01d1b869c2d 100644
>>     --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>>     +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>>     @@ -85,9 +85,7 @@ static inline struct drm_i915_private 
>>*kdev_to_i915(struct device *kdev)
>>      #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, XE_DG1)
>>      #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv, 
>>XE_ALDERLAKE_S)
>>      #define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, 
>>XE_ALDERLAKE_P)
>>     -#define IS_XEHPSDV(dev_priv) (dev_priv && 0)
>>      #define IS_DG2(dev_priv)    IS_PLATFORM(dev_priv, XE_DG2)
>>     -#define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, XE_PVC)
>>      #define IS_METEORLAKE(dev_priv) IS_PLATFORM(dev_priv, XE_METEORLAKE)
>>      #define IS_LUNARLAKE(dev_priv) IS_PLATFORM(dev_priv, XE_LUNARLAKE)
>>     @@ -130,7 +128,6 @@ static inline struct drm_i915_private 
>>*kdev_to_i915(struct device *kdev)
>>      #define IS_DG2_GRAPHICS_STEP(xe, variant, first, last) \
>>         ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_ ## variant && \
>>          IS_GRAPHICS_STEP(xe, first, last))
>>     -#define IS_XEHPSDV_GRAPHICS_STEP(xe, first, last) 
>>(IS_XEHPSDV(xe) && IS_GRAPHICS_STEP(xe, first, last))
>>      #define IS_TIGERLAKE_DISPLAY_STEP(xe, first, last) 
>>(IS_TIGERLAKE(xe) && IS_DISPLAY_STEP(xe, first, last))
>>      #define IS_ROCKETLAKE_DISPLAY_STEP(xe, first, last) 
>>(IS_ROCKETLAKE(xe) && IS_DISPLAY_STEP(xe, first, last))
>>
>>
>>Let me know what you prefer. If squashing these changes to your patches,
>>then I'd add the other patches in this series on top.
>
>Do what is easiest for you, which is probably to just go with yours 
>and that's fine since you caught more than I have. Just unfortunate we 
>spent duplicated effort.

ok, sounds good.

thanks
Lucas De Marchi
