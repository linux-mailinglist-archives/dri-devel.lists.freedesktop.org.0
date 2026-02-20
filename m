Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCHzCvhnmGmJHgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 14:56:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DE5168168
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 14:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD7410E7B1;
	Fri, 20 Feb 2026 13:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hX40u5mL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012059.outbound.protection.outlook.com
 [40.93.195.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003D810E7B1;
 Fri, 20 Feb 2026 13:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9DPaZGp722v1AvW4uN7Jm+JESkCkLS4+vguUDI7DYBOBeAUrPC/efzJyMg2azJTo002xZQvvDurtNRyoOY1jM0Cv5/gLVhYcIwWoig8cVRI8JhDzbbB8JeCJhUjUDIMzo/FEI0kVvprWj+LzeXs/KAhOet6SkBbm+eTePMGrNX2gP5iDg4z0AhSkN3Tv598SC5Jk9ihWdF1qR3FeBqT7JNj/kt2ELbsfEPJrbA2MlutA9uSGOo7orZk5ew8I92+sPINRz9m49xBrjRYtI8KNsDdZLdFWTKqIT1DOK+3OWQciV2vyuWWycZgbkFG9tAFxASi0h/BUp/LhQhGBT6MXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUD/dMVI1JAu+5qhcO5UeQV7xIpvXOPZdTlXTCJMoeA=;
 b=BVEiXlEEVgFHjLDDJxPO//nJTPx/1wx+jISOPLZQGr+tJuvV1MbS8+wQYe8FvhNr4G5gZYCyEiIuKXQ+LJ6mN5oa0dnC4CiJ1xjc/8kz0thuRPAuiLYN30HhANMr4YSyTxRHrJHEgI1u0pvWooltw7Cp8TUO2O5Em4YmJN29T5ArCN6naFhMG2ONPWMLA+4CxH4isloklUrYShHSnldwWaXc5D5B07uzKtKRGyrBM0H/miXc/6MguXQaRy+EXo9cgwJ0+TlevmSUWIHE+7vfU7Wr2mCcVe4bVitwMX0IUFO/HbvSDHjiCuRGAl9tWm+M4NOxxM3JCZRgL12/8wRIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUD/dMVI1JAu+5qhcO5UeQV7xIpvXOPZdTlXTCJMoeA=;
 b=hX40u5mL23VVFLaSjxwbmaaZJsvhjD9wuqyIBwXc2XH2220n1N6cf9sGF0vpWHHoUaBsfdjGutENi7nKfOj39pu+4gyDPy1SM2xdvNBZnRUaC1yKTJphiuXxk1yw3CWcaUii+ByED6hvKsoEXPCfC4aVKn4jKFeCxR3So6NNt/v+3r1EWKHnFPh6totbZGkabudVLYGmFju8nuqJzzCrqr7E/Onanwu61NRRWH9Nr/nh/SGUUCJAO//o6OAnUNwSgZ6OZMqKkTG+MaFwWZXRtimX5mGnUcH1XRu+1Spj2QFWjkEKZZZKZmMahO/RZnJsRBrENa36pbd3eVIXGym3yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA1PR12MB7101.namprd12.prod.outlook.com (2603:10b6:806:29d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 13:55:58 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 13:55:58 +0000
Date: Fri, 20 Feb 2026 08:55:52 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Koen Koning <koen.koning@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
Message-ID: <1771594440.99434@nvidia.com>
References: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
X-ClientProxiedBy: MN2PR14CA0009.namprd14.prod.outlook.com
 (2603:10b6:208:23e::14) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA1PR12MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: beaa9d9e-bad0-4fd4-00ea-08de7087c5f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2tFWUtmOFNVOExVRWVIbDVCd21IRnBqeUVCOVFEWDZRcGpmVVcwaG1kYTJn?=
 =?utf-8?B?Y0VhKzlvdUF1UVV4Qk13L0tIVmtqNExhUXRKcXppTnFycUZDTVBmb2NBOTFL?=
 =?utf-8?B?UUNPZThiS1N5aWdPNUFhWUc1NStzWTBYRjdQNVhLa1Ruem1DUTQwTjhqVXhB?=
 =?utf-8?B?NnlLTE5sZjNpUlh6dzk2NzNwekxOYVBRYkpUbHZSMzIrRXNoQmJGM0doZmY0?=
 =?utf-8?B?Vmx2UXBOc0RkS0ZaaVd2dDQ3M21Kd2dUcGpiaG1rUjlEeVM5WEh0MElKMHli?=
 =?utf-8?B?REMrWUlzQ3FreTMrK2IzZWwyb3hMbTk1S2d0LzZUUGJNaFJXSGU5ZjhoUmJx?=
 =?utf-8?B?ZDIrcTdIMnhIVTBiQkdvZkl2aFU2LzFNSWR5QzRFenJTd25xZjhGRytvdEdk?=
 =?utf-8?B?c21DdThvbjVDZ0pGZDBqakQxelhZT1lTL0dKVzhGbll2Y2tsTjhudWFsbm9a?=
 =?utf-8?B?K2RITk1zU2s0L0ZZTXovdWpiMndwc092akdremNCOVd1MjJZQ2JLSjZPSWJ2?=
 =?utf-8?B?RS85Mmoyc0ZlYktFSVR4OEhWQ3VONWpSQXptZjRBbTZTVGtMSmVWcng5Zm1n?=
 =?utf-8?B?S0NPOUZES1RkWVhTdkNMYTI4RGJyZG5HTmcvaXRmc2JsZUlXazlsNHlWSWNv?=
 =?utf-8?B?dEhieFZGakgrVU5vV3FaVG1IbU5UUGZrTUJCNWc5eEw5VisrS1RvRnBQOWV3?=
 =?utf-8?B?VEhrZGJTK0RmYlV3SnQ4RjgzRlNxUEYvdm03ZitoVk1LUFFKUWpXOEwwOXZv?=
 =?utf-8?B?S2xhTmZPbzNuSktDVVNDNWJyM3gvL2xPYUsvYW8xaytVeExodHhIOFovck9X?=
 =?utf-8?B?QnFnNE5XVzRML0NYMHVrTlBISzBydEdzQ0RRdWw5bmRJTFg0d0VRVDNtTURz?=
 =?utf-8?B?QnBnc2NQRHhaUUdRTVZraFVLQ2VyTy9Pa3BiS3JMYVU2bStrRy91U09mSnV0?=
 =?utf-8?B?azk1SGNqZzJvRDg0SnI3cjVTQ3BCeGtjM0taazJRc0JBM0U2RzJncjVPUEVH?=
 =?utf-8?B?SEx2d2dLdVV6ZDZVVlIyQzNtaTFsM1pvM25Idk1GMHBrc1ZSSWZvWThpMUNS?=
 =?utf-8?B?MjhNN2JYU3Y3d2xVWEZ6QUNJajBwak9ESUV2b3lHM3l1akowYTd1V05SZ0VO?=
 =?utf-8?B?eFpKSGxQYitLMWozYjdMWTJacnRtR3JTcFdWeFZGUjB3cmo2RE5KSlpEZXZh?=
 =?utf-8?B?elJBY2NFK0JTRTk1eUpGR0dHdG1Rd1BhQTZ5RGpENU4veWw0R2tTdERvVW5L?=
 =?utf-8?B?ZHVHcFlDR0xRRFZwc2xZWGR4a21pRDBEMHUrVXQ3V2xPQmU4c3lTTHdvMFUx?=
 =?utf-8?B?a0kwaW1GZzNLbjJNNHhPZGpoWVpCdDRPTUs1bjFnU0NkVzRPZHI5a0tKaW5R?=
 =?utf-8?B?dUR3OU80YVdWd0x4R3pyQzhSb0lVb21UNFJkUE5LNXk4WlBMdnRQZllZb1pQ?=
 =?utf-8?B?NVpITnE3WFBLS1B4TEVQWEZxUWJibVp0ZHNUeUpCeW5lY3RRVXJlaDlibE5V?=
 =?utf-8?B?Ym9PdHdGWENESzVGQlZaMWRsQk9IclJwOVlKL0JHWFJ2N2dDUW4xbWpuQTJq?=
 =?utf-8?B?T284SVBpMmtJQTdGUEVveS8xZUJ6ek5WbHFNVTN6aGpiVTZROW43UVNEZ2Z1?=
 =?utf-8?B?R2tVVE9hejYvV2xJK3ZLekdGY05IOE8yZFJsbzFJK3RZWkZyc1U4VXpxZ0Mw?=
 =?utf-8?B?aVRzL2lrS002SVVhUGRaVVlMbGRzaVN0a2p2bU94ZXdBOUhWcVJMMlNIbWJL?=
 =?utf-8?B?Mk5FcDROdDFNMlcxM0s5aktnKzAvRWpJK1BXZ0NCMnYrVjc4S2E0a2psNW9m?=
 =?utf-8?B?VzY5VUZmT3BqTUNDQnR6MVY0TWlFREZqSEY4eENlK3NTY1dBWnZ4STd1OGdK?=
 =?utf-8?B?Wlg0eWs0V1BONzJjRXdzNnRoK2Q3ajVGZ0ZnTk52c2VxeTh3aVJyNkh0ZndM?=
 =?utf-8?B?enVxZUJyaERwVUJoTTA1VVc3cUQ1TDhuNUFQK1k5bU5uTndPY0NlcnFoamF6?=
 =?utf-8?B?K0JEandlcFRLQWRiMVFYUXhwVTNoU3FncThpY0R3WEc0dW5ubGhjRUdxbG1v?=
 =?utf-8?B?WEZQMjNHSmdiYzkwUlIzT2ZzK0dlWnZaMUVGekswMXgvOWJ4bHEwK3ZjL3pE?=
 =?utf-8?Q?8pgs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlluYWR1OXkwZTRFQjZ4eFdLTXhjWHp4MURsQTZxc2lHQnZ1cXNDVjBiaDVa?=
 =?utf-8?B?cmd5WVQyWEpwOXNwME1vdzJYRkhWWUxyS3daS0kxRnBYM245UmM1RjdydUFX?=
 =?utf-8?B?N0hiTmVRTkdVWnJkN2wvUGEvU29Va3ZZNDRScHBFbHpGL0VVcXBzakwra00y?=
 =?utf-8?B?S213M3NqdHM1Z3NLaGdVbHVvK3dRWUFlenJabWxoVXdGaDB5U2p4T3ZGV1hL?=
 =?utf-8?B?K3lIYnd6KzJkbnFHeTMyT2xNYzFLckRac0laVmFGc3NDdVp4bVc5ZVJjQkhm?=
 =?utf-8?B?eUVTLytLRExNTHZ2YXhIZUg5d1lXbGY2S05vVUg0M0JhemZjR0MvQUxCbHdh?=
 =?utf-8?B?T0tNcVVyamlJSEFDWlVqUnBYSjV1RlRDcHE5WklvMjk1bkdLcnliSW9iSTEy?=
 =?utf-8?B?QUs3Z1BSVzIrWXVlbDNvT3BrYUhHb0FJUm02ZVZROU1rak1wa3BsNG9ySzBl?=
 =?utf-8?B?QWEweEErR3VrZG1LSzR3QnlCUFhlUFBKTElPVWtFTUpnWlJpY1V6NzN0N3N1?=
 =?utf-8?B?N2lSZTNXL0QwcDUwMmd0OVhDYi8xZ0dVUWNsa3pFcm1DMTZQZUlvMkMxSmgv?=
 =?utf-8?B?ZitxalEwYnFHakgxeXZyOStYRWw3Z1dHZVM0VDI0L0EzdEs4K0xhdjNLY1ZJ?=
 =?utf-8?B?a3h1U1JRWXBPMWhaVEplcCtEVUk3VW1rWTRaTWpKVFd6SnM3d01sUlRMczlP?=
 =?utf-8?B?emJia092T0hpRDJpQnRRang3dXBtOUdHM0lqTzJmTHF6WSszUXhHK1cvY0t0?=
 =?utf-8?B?enpRUmVnck1BZFprc09pM1BsVGZyUTlkVHJ5bHI3WWJGOHpaK1lNQUcxeUdF?=
 =?utf-8?B?cHZzTkEveHVhelo0SkJNZHl0MHUvdnhDNk12aXdFb2JhZmJOVk41Y2g3RUox?=
 =?utf-8?B?RUpuWTR1ZmxtajBFaHVsRWRoK25tUVdQcmxpaHJrWHZwc1Nmb2dEYlRhYlhy?=
 =?utf-8?B?bkhZZGFabE5sendXVkdSU0xHTGhGUDRaV2RqSlpYS1ovb2RaUUFHbzF6YWxv?=
 =?utf-8?B?MUx5Uk5hemI1YWNNb0UyMlNyTHkyK2toamFyc29BUjU4WHlrTVVzVFFZZFE2?=
 =?utf-8?B?R0JuUnR0MGlNWGhuN3hpWWhJNzFnajNzOXhuRGhCbzZoWkVTREY3VFR1dGRE?=
 =?utf-8?B?c0ZrcTgzTm5QdE9Ha2VuVHhQSDVUOWdSUDJFakFOaVdGQVdCeUxEUm9zY2FP?=
 =?utf-8?B?Y2RDc2szanJQR2Z2a09GYjBzUi9Bd1NtYnd3VTdHOUtHNGF1UlMyMExmaXAw?=
 =?utf-8?B?TUtsbkVBbjJYQ09OZjhoQkR4ekJVckVFZ0VCbzlJSmRHc2pOU1VoemVBODVy?=
 =?utf-8?B?U3k3b3J4L1gxb1BOcisrenYxT0haVDh2c3FGVCtaSms4bTgzQVd5SkxZUDdv?=
 =?utf-8?B?TFJlTWxqN0hZVHU2UGMwYUhneE9nZElRNnF4VWhuTkVmQ3pvME9IL3FkRVdY?=
 =?utf-8?B?ZlRMNjh3S1FNQ1dOejdZZmRNS1BHczVvek05cVJjZ0JvRmVWTnF6eDJ2OFZp?=
 =?utf-8?B?YndiUTdRRGxpYjBkUzNOYWxxT0FOMm1qdTVRVGRMczJUWjMyd3NkZW15MklW?=
 =?utf-8?B?WXM5VDBaM2pKSWtkTmVGOGxVQXdDZ05qazdyL0c5QThVcjkvdmtTMmI2U2hM?=
 =?utf-8?B?NGl5by8rU0ZaSjA0b2pHWmlJbE1Fbi9KUTFIMjc1Ulo5TGxFbFhMNHl3R1p3?=
 =?utf-8?B?STE0UDgyK0pGL1E2VHZmMFlVYWZtWFphZU53RXUvSXZZeWxSOGVkWDQ1Sk10?=
 =?utf-8?B?UGRndVcrMXZ0VjFITnNLdlgxczVzdDVUb01aKzdnQis4QkZnKzlyQnNqWVE1?=
 =?utf-8?B?WDdYOVVzMnJvSWFOMUxIZE1qSnVVM0R3dGllYlFhSjA3WnBURlEweWdRenFl?=
 =?utf-8?B?NTZvaGdnc2lkK0Z4MG1vc05oSS9xeHRRSEltY1lOKzZNUGJacDl4QlAzU0hC?=
 =?utf-8?B?RW9JNnh3NkQzQ1orWDA0cFNubnZ1N3p1Um1DU244UlFwR25Ea1FSNGtpd3Rk?=
 =?utf-8?B?ejcrU3psWnkwUWhNS1FtR00yRnpob2prbmxhNk4yU3lIWHl6RE15UllNWDRj?=
 =?utf-8?B?TEFWTSsybHQvRDVvb3o1M0RnVUJtb3ZIdU1PeFZncmhqS2FSN0RVZDkyVklM?=
 =?utf-8?B?VTBDNWVyaUk3QzdIazNsZjRGcnZQdXMzK3M2OHhnN0l3REhESmFUTUJFZkJZ?=
 =?utf-8?B?cmdjZndZcTBONUZLb0xSZ251QXZadTZJZ2V5TFNLVGFQcTNRNjMrQTRhUEc3?=
 =?utf-8?B?Sk91YnFjMmMwMTgxMDZjb2JsV0owaFl4ZlZhK0tnZEVpcGwvMVp2M3AxRERQ?=
 =?utf-8?B?dGhRSS80cFd1dTVuMWFtMlJjdXE5Tll2OVNKS3VlWVZMbFRsL0pZdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beaa9d9e-bad0-4fd4-00ea-08de7087c5f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 13:55:58.4039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfVphvuIZrQ0mwxVw1JGE0eAKgVVbg6fSDJb0brt4H1PkxlIYWnKYEQ2zv8CmnUTvdsJNm/IvTB04pzaNvsFbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7101
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 83DE5168168
X-Rspamd-Action: no action

> On Feb 20, 2026, at 5:17 AM, Danilo Krummrich <dakr@kernel.org> wrote:
> 
> ﻿On Fri Feb 20, 2026 at 7:06 AM CET, Greg KH wrote:
>>> On Thu, Feb 19, 2026 at 10:38:56PM +0100, Koen Koning wrote:
>>> Use subsys_initcall() instead of module_init() (which compiles to
>>> device_initcall() for built-ins) for buddy, so its initialization code
>>> always runs before any (built-in) drivers.
>>> This happened to work correctly so far due to the order of linking in
>>> the Makefiles, but this should not be relied upon.
>> 
>> Same here, Makefile order can always be relied on.
> 
> I want to point out that Koen's original patch fixed the Makefile order:
> 
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 5cd54d06e262..b4e5e338efa2 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -2,8 +2,9 @@
> # drm/tegra depends on host1x, so if both drivers are built-in care must be
> # taken to initialize them in the correct order. Link order is the only way
> # to ensure this currently.
> +# Similarly, buddy must come first since it is used by other drivers.
> +obj-$(CONFIG_GPU_BUDDY)    += buddy.o
> obj-y            += host1x/ drm/ vga/ tests/
> obj-$(CONFIG_IMX_IPUV3_CORE)    += ipu-v3/
> obj-$(CONFIG_TRACE_GPU_MEM)        += trace/
> obj-$(CONFIG_NOVA_CORE)        += nova-core/
> -obj-$(CONFIG_GPU_BUDDY)        += buddy.o
> 
> He was then suggested to not rely on this and rather use subsys_initcall().

I take the blame for the suggestion; however, I am not yet convinced it is a bad
idea. 
> 
> When I then came across the new patch using subsys_initcall() I made it worse; I
> badly confused this with something else and gave a wrong advise -- sorry Koen!
> 
> (Of course, since this is all within the same subsystem, without any external
> ordering contraints, Makefile order is sufficient.)

If we are still going to do the link ordering by reordering in the Makefile,
may I ask what is the drawback of doing the alternative - that is, not
relying on that (and its associated potential for breakage)?

Even if Makefile ordering can be relied on, why do we want to rely on it if
there is an alternative? Also module_init() compiles to device_initcall() for
built-ins and this is shared infra.

We use this technique in other code paths too, no? See
drivers/i2c/i2c-core-base.c:

  /* We must initialize early, because some subsystems register i2c drivers
   * in subsys_initcall() code, but are linked (and initialized) before i2c.
   */
  postcore_initcall(i2c_init);

If there is a drawback I am all ears but otherwise I would prefer the new
patch tbh. 

--
Joel Fernandes
