Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F819A0051
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 06:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC2C10E229;
	Wed, 16 Oct 2024 04:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ODOxxD45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EFD10E229;
 Wed, 16 Oct 2024 04:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuVTibHcweXKQdgGbId2S0jkxdCCkjYjq7FeKT04+nGslQ98N3iVWlmRwOwHQGghYs0qOtl9eTzshtMXcTliFioU8+0veKqLzxpJWYvhXK+asKu5SiDNUn4AJL6tdd+CXZtohNeNaNn+cjhzVXbxB8YqEgvLt20I1YvDxSjL3mPtAs+BswTTFrwAsEz5MFtcF+IrjCS/9ZNsTLQy8Npj3Aqp/+dhCSWpUHTLKLYGStPMMVOr6z5VRWKURKncVDJMi8Yuek1ifMBHXubpT3E3OzACmgtr6zItT5oJmzYpWga6Rtv58Kp/is3oXT35aTl3qFptfLnGzDQ8cOi4IzbP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7SC8nJpiemz+bp+nBrldi61WKtknr4GLCvn750QwTg=;
 b=bb/phNmpDNM6JDEQSKxRMXZOj/nPQ2JTenrX0gVvEBYyLV7EPuHUoPD1566/ivy7JKZ+R1szE1tAQQx6X2G2tVpN3GQ0dlcWyJcvy8dxPd8JlnThk5JUHya6Wn/txWDlOG9NAIYrKxv6eXqvmFDKFJyycIVL3MtZLYzRCN6WVBUEaHQ0u14pMzSBKURFyqjhT6evG6wkQi6kJ3GEg2/esOIzglbcLqsUIXiiV1IB+gqLraBr7aMI+eVT4KiwZvXCArC6RYOStcCoXIXJCCMeEXLEJ3ihPSaF/ZLRdGest1YpOM6V71Zl2Yf6XchBt2vkiS5pHxWO8WuaxMej/fd+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7SC8nJpiemz+bp+nBrldi61WKtknr4GLCvn750QwTg=;
 b=ODOxxD45RQbepwhUIHByQkdCSVGzz2mOQ35dDu/lensR4JT2vbkJqHkOBSmIhFrvX5MsLJqis2IoWwPnDg/wc0nJraATGp57V7mmmynrxbKEs/Ftc7QF/xH+U+OPSQjPCDCW2mV73sfkU8Plf9G6pdrXsWfJ5CEEtaXgRKAdiZb4HkerrkbnAlVWQoboN3pouk/NW84an142m6H/4RCz7RFHo9s1Ql02Zve/QFM52IzYv682ozXCWpSM2KomxkyMrG9PZ9MEVFtXXPHo8RiDB1RfYRlpfobylV4z0C+1jcUoedJw/Jcpl4Sp1Razub3lLkRmF14ueBHXO+j7km9rpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17; Wed, 16 Oct 2024 04:51:00 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 04:51:00 +0000
References: <20241015111322.97514-1-thomas.hellstrom@linux.intel.com>
 <20241015121759.GG3394334@nvidia.com>
 <19fb79c069b812b164abd4f79d38bb12d2f5afa4.camel@linux.intel.com>
 <20241015130221.GK3394334@nvidia.com>
 <67d855c26e95d89997f0ae5a0e1a5fdc636f6b95.camel@linux.intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, DRI-devel <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] mm/hmm, mm/migrate_device: Allow p2p access and p2p
 migration
Date: Wed, 16 Oct 2024 15:46:28 +1100
In-reply-to: <67d855c26e95d89997f0ae5a0e1a5fdc636f6b95.camel@linux.intel.com>
Message-ID: <87jze88xch.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY6PR01CA0055.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::6) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d49b5ae-1c3e-442d-f3b2-08dced9e2127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWRmZlZ4VHdGMENHUGlmSmR0MWxIaHU5cWV6R1QrSHpvUnlQTFhnR0graitl?=
 =?utf-8?B?dG9Lbkh0WFVDdHh5bFBwYnpsWkR5cStZdmpYaWVzQnRubGhZWXB6bVVRemlm?=
 =?utf-8?B?QUVuNzV2OFQ2blNPbElLTzBFSjVhRW1TUWZNeE9BTnJXQmlRMDJsTUJxL0hj?=
 =?utf-8?B?ck1zcEZXak1NeWo3d2RydzhnTjFkcWY2Yi8wclZTM0k4MUxUOVZCQ0hxRjhD?=
 =?utf-8?B?K3l3VTBtMEpLaVNacVVmdEVldEN6QkNZcm8vSnFXTm51Sm5UTGdUeE9JMG5Q?=
 =?utf-8?B?MGwwZkM3c1RSaVAzanlRM3pEcG9aNkswQTlrckNuTnhDSEJrKzM5SWJZWmRt?=
 =?utf-8?B?OVJ2MVUzZDVZMHFuY0pHKzhsMDBvaks3UXhMTkZ0N3NvMUlpR29TMGxHWU5i?=
 =?utf-8?B?RDVNRFM0OVEyQWJncjJHTml0VnpYN256eStrOFB5eW9nbWdaMHpxSUdwWVkx?=
 =?utf-8?B?WlpyZEt3NnZpdzFNS1J6QzNpMy85K0ZNblQzYWg0OXdrSk5VZW5UYXRpSWF2?=
 =?utf-8?B?WTA5L0g3Yk1lcjF4N0cvS28wdDBiSzM3R0pjbnZGdnVQRUd2WFpQcFk4cnhj?=
 =?utf-8?B?SDI2SDhFTDgxcEtsdWpTS2t4NDYwYVZCUnY3UUJMNU1UR3ZVTDhHQXB3Yy92?=
 =?utf-8?B?eUJJY3ZYK0VraWd2TGtPK3JGenJDa1N1VVNTeFo3NW40SWZaTFRBVXNnM1Y0?=
 =?utf-8?B?RWVlcHVONXJaTHlxckJVQ3FQZldBVUo0a2hhV1lsSUFzSHZDbEJrdWxWNVJv?=
 =?utf-8?B?K0pVRkdrZVlPbmJQTGgxS0VxamZ6dmRmV3dYMDlRZkpTdE5ZUGwrYzNjTCt3?=
 =?utf-8?B?dGhhL3gwL0JPMmE3Q3ZFZ1VSKzJCWTJkYWwzc2oxQWNsOVdtby9HR0lWcHFp?=
 =?utf-8?B?VkpjN1BnVGJsb1FZT01yVW1uOTN0ejdtVk5ZeWhGSUR6M296TjNuYlAyVElk?=
 =?utf-8?B?dWRVaHhkL09RdnVlS2ZBMzB1bW12UEJlaW9FenJxbmtyZk9LZzNNZTlQckdH?=
 =?utf-8?B?VFFmNjNWeTRrR3hnbldoNDhFeFRicnBjcm9MWXJsRjlUVlVsNno4bHAxWjU1?=
 =?utf-8?B?dWJSWkxiL3gybGhXNk5iK3d6TGpYaWpVTjA4RnFFbmtmTzlmc3hHbEJ0QzAz?=
 =?utf-8?B?Wm4yMENrc0w4L3hTVkhZQ29FSDM4bFJFUE5TOTI4OGhXWXFSa3UycEZ6QlBB?=
 =?utf-8?B?ZkplSUVDakc2WUkrczB0dzRpOUkzYjVHUkZUYkE3ZmZjNEowMTVIcXJIZXNL?=
 =?utf-8?B?TFdsMExZQTEvMGV0SG94cWxIQkpuYlA4aEsrSU1hdkRNQXZPdzF3aEhCeC8w?=
 =?utf-8?B?NlBleGQrZDVMQWlvczdvbmdMRzNUY1pTRFZZakhnUVpjbUNkSFV0dzZvdDBv?=
 =?utf-8?B?bWEwUXp4aGhGVU9PekNKWFNpaGNpNWNQcDlHczZ6L044ekw0R0JwTlliTlMr?=
 =?utf-8?B?bGQxeWVOeVF3b3JsOGE1d1ZwdmxHQUZmYU1zS1hxZkNQVE5lRnFsa3lyMUlR?=
 =?utf-8?B?WkhQaDdVL2FzUlJ4eU5qMHN1VWU4MjhIRzl6dU92a2hTaDdGY244eGF4S0k2?=
 =?utf-8?B?UVBtQXE0VXRlRFJwMTlPSHJBc3JLNFo2NGNudVhHQ1RzK3Z3aXJnSVRzSWMz?=
 =?utf-8?B?eW5rYWllRjE0N0VENng0NW5wZU9FOFh4aFJEbnl1dXFiZ3pFSjEvcTVRVkg0?=
 =?utf-8?B?cmVkQ0phb0tndERXMGFWdHpxTXJORU1md0dLekhOazNxaVpZWUI3WERnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkR4OUpScW13disxSk1nOWNxdk4yRHUzTjdSVFhrTFZQQ3ZZbit2K3FGZHhp?=
 =?utf-8?B?N1hraldGbHRqVDBiYmI3WlZMZytYd2UxeUtRUlpPa3FyRkJBTkJZYmFmYnZS?=
 =?utf-8?B?VVlIOUFqUXRrajNVUTlVWkhYUW5WTThKc1RXSlZMd1RMLytDcVFzOXJucXV3?=
 =?utf-8?B?MnQ5czEwRnZDZ0dIc3FtOEhyT3EyeWJpZ2pFVDNPb2R1WHd4MzAwakxaS3Bq?=
 =?utf-8?B?OVZXZWlQMzhlQWU4UURON25VZEV5bGhLRnBzZ2NPc0I4WUxpb2Q1R0hvczJL?=
 =?utf-8?B?NzZIR3o1MTJHbSswdlA2NVFMdTN0OU1BM0htcnNCeno2OVQzWEpFS1VzbVlZ?=
 =?utf-8?B?SEpWTEVmMjhyV2ZBd1pORVlSeWkrcTBGY05DZnJYVDA2TnRJbXc4djZxellY?=
 =?utf-8?B?dXk5Zkpyeko1NjFsOThURzd3UWpjRWhVbU9hZjJzMnFUbXF4eXR3b3ZtakN5?=
 =?utf-8?B?UVpnaDR3SS8zL1VZMVdMNkt2RlF3b3lqN21jKzB0N2FtZmtBT1JCK3Yrdk80?=
 =?utf-8?B?SWsvQ0hTRkJSanZuRW1wQ3lYTXhqSUY3dDNPTEJmdUNPTHZRQTd2WldjNmVy?=
 =?utf-8?B?TkV1YWtocDl6aUxGYTZHbjk1ODZRZm0wMGRuUE44Y1NaMi9YdXYvUTdyRlRm?=
 =?utf-8?B?RENad0hPcFVHRjdsSytSRGhxU3p6MHFWRW44UXBQS1F2bVJXelRGWm5PQVFm?=
 =?utf-8?B?NGk0NTRPbHhxbW1pdHM4ZU1JYllLeEloRkxqWDcwWHREVjlCRkZXOGdzbmZD?=
 =?utf-8?B?aDJOeU9JdW90NTFoUnNMMUFHTDlhay9tVGFXMG1zUys2dFhNNnlLajRwc3Y2?=
 =?utf-8?B?U0J5ODgwbngxQk51ZCtabVZ0YlA2clh4Wmg3QzdHUFY5SDJOb0syN0txeEp6?=
 =?utf-8?B?YW1uQXdDQkVNbndjcFIwZTZOWS9XaG01ZTRxaFZ4aC80c0tyUXhCL2F1L283?=
 =?utf-8?B?VmEyWFdac0tGSHp1d2RYKzRlTktSdThIWWdqNGt3WGh3SmViYWpZWXJuWEp4?=
 =?utf-8?B?RHE5bnRScy9Tc0FRZHZGS3JNaFB1S2tKTWhMY1lUaFA2Y3hzL2Q1VzRVenJH?=
 =?utf-8?B?bkI1eXJTT2RJUDRtNURRM2Q5MnJNL1ViN3pwQTFkOW92ZDBqaHJ2ZWxOWXAw?=
 =?utf-8?B?cHN3dTRqY01jZGZtcDRYWmJMbUtZN2JpcEFVK1pPZE1NWWRsZUJpK2JlTWVU?=
 =?utf-8?B?TDdnWWd2M2VZYmpBVFJFVDFqWEltUkNGMzYxN2U1K1FuK2x6YVhMdk56NEM0?=
 =?utf-8?B?U2RZRlR4ZFg5bkhKTU9OdjRKRnNvdFVoWTU0MkpjRWlpVEt5RGY3MGY0SGtv?=
 =?utf-8?B?ejNjWURRRlpodm9RRVRMNWZmYXhWQkZRVnp5Z3dyUXlJeVE3blFBT29CUXBL?=
 =?utf-8?B?Rk1CM3FjY1dnSnZMRkZOZ1lQSTJ4WFBVQ25jbjJBTi94WjF4dFFSTXVlMFA0?=
 =?utf-8?B?anhlUDRTNVAzbGRWMGtjemZBQ0p3OHQ2azA4bHJ4YUVRdTBieFNPSGdHSERo?=
 =?utf-8?B?eVptbkIvbEp4ZmFMSWFObHdmVjBVL0RKS2kyaVRpNDJWWldVOUg4ZnE5MW1y?=
 =?utf-8?B?WkMvalJMd2FKU0hRZ1VBWW9EQllQbFpzMHpSTExoUzBHemJwbnhuZFJydUlh?=
 =?utf-8?B?YVVYNmZ2dklwTnI0dGRIRDRBR0drOVFsdHR6V0FySldIRFZPMHJsaVprU24z?=
 =?utf-8?B?ejRtdHI1SFlqNnJ2a2NWTlFVUHpVdWcvbWw4emdoS1ZhcTAyNHN5WVJSMjlF?=
 =?utf-8?B?MytYbENBZlAyT3VrbVpRbElTMHAvaDBtZkJEYmUvRFdRalRzV2pPem5aMzhS?=
 =?utf-8?B?N2k1bitPdVNpZXRGN2xTZVpucWltVDhjdXlVcTFrbWZ5ME93SWl4OVRNMVJT?=
 =?utf-8?B?R1lyanpIeTdsRnZIVmFCNTIrS3pNU0JrYnluZUV4MitkVmZZV3NldGFEbm9a?=
 =?utf-8?B?TDZqSGF0a2g1cVo2SHA2UHJxU3MyWVRKKzN2TnZIR2RuQ0h6YVdnY3RtOFZ1?=
 =?utf-8?B?dVJNeGR0Ulp6b2oyRFVkcmdyTnNyTEhWQ2ZQM0F6QmpZWjFRMThjdmNMMTI0?=
 =?utf-8?B?MmNNcTBzT1BYODVCWEt5VDV6MStiUytuZmszT0dMTmxWYUZpY256eXpmTFBW?=
 =?utf-8?Q?ueSSpbYlo4yL6Exx9rtYRYNVI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d49b5ae-1c3e-442d-f3b2-08dced9e2127
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 04:51:00.4219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUGHaKlEP7nNsvIVy0xPd+rqNLBMuSteP5eQF7bs7Cm4mxwxpXvAICtkZW6eBIkUbA/2JLUHIfj1AghmcjSn0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020
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


Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> writes:

> On Tue, 2024-10-15 at 10:02 -0300, Jason Gunthorpe wrote:
>> On Tue, Oct 15, 2024 at 02:41:24PM +0200, Thomas Hellstr=C3=B6m wrote:
>> > > It has nothing to do with kernel P2P, you are just allowing more
>> > > selective filtering of dev_private_owner. You should focus on
>> > > that in
>> > > the naming, not p2p. ie allow_dev_private()
>> > >=20
>> > > P2P is stuff that is dealing with MEMORY_DEVICE_PCI_P2PDMA.
>> >=20
>> > Yes, although the intention was to incorporate also other fast
>> > interconnects in "P2P", not just "PCIe P2P", but I'll definitely
>> > take a
>> > look at the naming.
>>=20
>> It has nothing to do with that, you are just filtering the device
>> private pages differently than default.
>>=20
>> Your end use might be P2P, but at this API level it certainly is not.
>
> Sure. Will find something more suitable.
>
>>=20
>> > > This is just allowing more instances of the same driver to co-
>> > > ordinate
>> > > their device private memory handle, for whatever purpose.
>> >=20
>> > Exactly, or theoretically even cross-driver.
>>=20
>> I don't want to see things like drivers changing their pgmap handles
>> privately somehow. If we are going to make it cross driver then it
>> needs to be generalized alot more.
>
> Cross-driver is initially not a thing, so let's worry about that later.
> My impression though is that this is the only change required for
> hmm_range_fault() and that infrastructure for opt-in and dma-mapping
> would need to be provided elsewhere?

Cross-driver is tricky because the device-private pages have no meaning
outside of the driver which owns/allocates them. One option is to have a
callback which returns P2PDMA pages which can then be dma-mapped. See
https://lore.kernel.org/linux-mm/20241015152348.3055360-1-ymaman@nvidia.com=
/
for an example of that.

>>=20
>> > >=20
>> > > Otherwise I don't see a particular problem, though we have talked
>> > > about widening the matching for device_private more broadly using
>> > > some
>> > > kind of grouping tag or something like that instead of a
>> > > callback.
>> > > You
>> > > may consider that as an alternative
>> >=20
>> > Yes. Looked at that, but (if I understand you correctly) that would
>> > be
>> > the case mentioned in the commit message where the group would be
>> > set
>> > up statically at dev_pagemap creation time?
>>=20
>> Not necessarily statically, but the membership would be stored in the
>> pagemap and by updated during hotplug/etc
>>=20
>> If this is for P2P then the dynamic behavior is pretty limited, some
>> kind of NxN bitmap.
>>=20
>> > > hmm_range struct inside a caller private data struct and use that
>> > > instead if inventing a whole new struct and pointer.
>> >=20
>> > Our first attempt was based on that but then that wouldn't be
>> > reusable
>> > in the migrate_device.c code. Hence the extra indirection.
>>=20
>> It is performance path, you should prefer duplication rather than
>> slowing it down..
>
> OK. Will look at duplicating.
>
> Thanks,
> Thomas
>
>
>>=20
>> Jason

