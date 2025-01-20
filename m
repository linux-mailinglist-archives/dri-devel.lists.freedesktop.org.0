Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEA1A16D58
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 14:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E409E10E417;
	Mon, 20 Jan 2025 13:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JbDkUroQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA8F10E417
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 13:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aH3xft7D+pOpVzYHnx4KmnmL5qLQ9AX3PFUZ76OWKQrV/qW5YNgpBojXr59z1RluyHYFBaAA3+xeSMEmvX88myGlo6j/tqz+kvtm/llPUyxMCZw7GSlHM0ksA+kmopUQH6xFwGpeeg6GG2mY/Gjz9kkrKK0EpulwBTlE1DSiFgxWisT3OEDXnYR49alDgXE7RE0jgjLcvjD9i29rbUganPQSX7Vq7lyESaQ+VW5VnjSq8xrHVX6CWqe3ZYOgy02IoIk1up5Rs2SiOtULOMi2PaJYr0RTrxvXJKJU4d6xUebD7q82stk7YkMRHbiS/xUQ6Gvor5yMRVJ2PbI8H5ljIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btigIVsG37A/OtgTyVwom70XQSGhQlGJ2wsruc+hARg=;
 b=FfEUEuCeQRKX3NPyzLhyRpNwa0qcagtlgP0bQbL5cdl/6IzBSniLppPAmRtYPtHBNezywyDTKCZr3PZoKOqw5GNAvBlQ9zlI9GFVpjUdj3Mu8lKIPzruZ5AAEa0wVt4+S8QBlPGTENmo6RIGMZSEjRHx4w8GQejlMv2MUUAnqILtF6MVFPziPgdpO8+v9+Tn6LR3uH/ncTIrmhoHr2sRsItACVyzNDnH0OGUtxSxJ86fpr+A8943+JOGZiv4Rxac4pmODIExwwoYsmlVEwhn5+93nPdIO1BHiSPEHqyvEaFBJKPTgum8eOII/B2uyJ66EgIt34caXuN0JQrJWjLBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btigIVsG37A/OtgTyVwom70XQSGhQlGJ2wsruc+hARg=;
 b=JbDkUroQIlNPaS2ZPdxQStyaAm+m9Xh/Pgy7zktpv3CI3jUAuodLFvSemNoARBBKRUPA3dN/SZCzXBSuXFQsH9rhIw/xf57Vy3htUZxOsK85xrr5Ft4/G8ic00s3Nk3ldotKL43ES+8vo9PZ2vz+id+5ZpxY3VgLPUx3aRgj6XLir6hDdXPg+Fb0drBhadr+u3UoX7kAyWO8kUnpeWlZBGUDE5ML4zpraEdq77fBpXg/ngeiG3AeeDTMFvJtqsDAeKEoipXU++/HbmWtsW76gOwHaoKoMcnS9i7yQ/psFk7xtq2zSRkmR6ulWLC8xQelgRCU/6DZ5tVCF8I3CVSfHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA3PR12MB7922.namprd12.prod.outlook.com (2603:10b6:806:314::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 13:25:26 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Mon, 20 Jan 2025
 13:25:26 +0000
Date: Mon, 20 Jan 2025 09:25:25 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, Alexey Kardashevskiy <aik@amd.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <20250120132525.GH5556@nvidia.com>
References: <20250110133116.GF5556@nvidia.com>
 <Z4Hp9jvJbhW0cqWY@yilunxu-OptiPlex-7050>
 <20250113164935.GP5556@nvidia.com>
 <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050>
 <20250114133553.GB5556@nvidia.com>
 <17cd9b77-4620-4883-9a6a-8d1cab822c88@amd.com>
 <20250115130102.GM5556@nvidia.com>
 <f1ac048f-64b1-4343-ab86-ad98c24a44f5@linux.intel.com>
 <20250117132523.GA5556@nvidia.com>
 <Znh+uTMe/wX2RIJm@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znh+uTMe/wX2RIJm@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: BN9PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:408:fe::31) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA3PR12MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: e3668284-b31e-4b16-7008-08dd3955e6a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Je8LDY+32499pz59ot/IIzYePmAGKaC3kh3VSPiJD/bkoW7jou4IAolj76z?=
 =?us-ascii?Q?rEZfIdReaE4sSj4Qbn8p17R1FqEdPEyLtowJsngM/fvWl0tEX5JnAhhj7jhP?=
 =?us-ascii?Q?EEwh2uGIzIzr4EnHZ2t8K3Hw+dTvmtrF4O3cEQUj/9WnUZ548AX76WitfdE8?=
 =?us-ascii?Q?BQ8cDoLV5nhttEEBLFufFtUAJ+wayZQ3pxYvwzfko6TyuaQziyiYlI05/yx+?=
 =?us-ascii?Q?zMNhXuwrWOvm9jgNsPd77dq56B3UgqNdoUaWVudDmQpKF55PDmRuPzMPLyS+?=
 =?us-ascii?Q?HTONjfeTC9asYMq6JYNy7AQ/wK+O8K4OnXko/PrySRP5qm5pUGlQmB7g7ui2?=
 =?us-ascii?Q?idG+TjFIuSa2K84h4zCDoF7+5aLA+4fErz/usiMIZGTMIb2WSgbvmBBv3MMe?=
 =?us-ascii?Q?/0ZWEWOxMFDfN00A9Ymg/MdKbFtMAktYmsvYRErVnF//FEcqHELqO1A7/do1?=
 =?us-ascii?Q?HwSgRO+QWceSkt8WSEI1iZxfSERqIDNJIbN8oOxfc/XP1n5wyjEBUtg8yP9U?=
 =?us-ascii?Q?SrPCLSSdM8QGEF3LS9r9Vk/9bxi2VoVDdlaZ6oOVVVx0VDh/ajAggCvTX8U7?=
 =?us-ascii?Q?+oi7b+j+xAFZR5gjuQI5KmWXwvZAZy0WlcJkwKm14LCVA0jln/spH5uHvmdH?=
 =?us-ascii?Q?wEJvAPEf76YG4Sw515C/jjhTknFdxYI3ChBwr4PsxJrTZEYIU6PR7oolNCNF?=
 =?us-ascii?Q?L8iWH747JcgAfIOiFPMtaFOsCUpSvh5hUrnQi688USE7m9HEyCZOSra2EUOg?=
 =?us-ascii?Q?pbvTZ0ijVvcViwucUKFBiP8n4HxwcG1y/4SJly4Ht2E/a8Gtuqqk6ODmCoU5?=
 =?us-ascii?Q?5rcwb3j5qmWQpKtBOd7wlrWINvZXfyq3BiZuKGIaVWnV9qyFU8SMLA0S/7Tu?=
 =?us-ascii?Q?eG/LE2v/aKNjvvSpEaxKSWlf14ENfQUNJLQpoKmDqmS2rnbEzkV2HMtY3bPv?=
 =?us-ascii?Q?K7TA93/KzxFrHN2mT6gw1FICJ23VppzEUAcWiDBoZno7eRsqaAHTgkk/3JGX?=
 =?us-ascii?Q?aw81fZ6x4QBR+d/npFAVTvcLOI75BtwKnZAGFLWzIZLaxwrFnid67OY0XdG3?=
 =?us-ascii?Q?1a6qvrSkn0h65hEAe//plN48lPT6a8+VJZqFDvIXqdeP6pP8yNJhq+czGNYO?=
 =?us-ascii?Q?806Lo0O3EeJoNZx+Rpfr4iJR6AhdxC2vWZNrQodCT4GsNsfIgWn+nSRcAikH?=
 =?us-ascii?Q?BuXVCyIkZ1mWJs68zXztmghc3k/kMeKkN7Zipfzm2PfBj82I5cT4+W6I/2x1?=
 =?us-ascii?Q?djWJM8FvU+XyhVGow7249iF16Zu8EWa6x+JP3LZgbB/1a2RjebwlJVSiQVqB?=
 =?us-ascii?Q?EQ7VqJmWFWztRfOp8FHnB/bgn35YzkBFnXY4rxEcfiNWlZoTZR5LQpW148em?=
 =?us-ascii?Q?X6nMbWBuHtvXaGRhFHsqZZIj2V1w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6lcxK9embQSyr7Zn9BPg26pYGS6zegiEsni7Dsq222Jm8x7DUkdI9eXqH50B?=
 =?us-ascii?Q?uv//Rb+4ADPMi0nDkhUm7NMjgPQwIx0L94O85ass+BsZa8KgNLSSrbGILSby?=
 =?us-ascii?Q?UT9cnvNcs1gAjNl2ypyqaF2VE41kuRsmB2AnzCU9Qu8Vsrv8eG1miHOxCiO7?=
 =?us-ascii?Q?l94JIPyQmouzhJ9AfvH/jy+e42Tsn5kgQDd0yjaLkP6wItlFInehWG/zPrlb?=
 =?us-ascii?Q?lH7KqHAEssxZugT5w4ApuI5uauJZKECvkWNofA6tuP/3c7fEkA0AX/0E21k9?=
 =?us-ascii?Q?weKxh2uGSmY+TD5kpo2v9g0CdYgE2yhd3zNU16aXkEu82BYyP/qADP/eQ7HN?=
 =?us-ascii?Q?Wd4u0ZZuYNEC2zJmtUD96RDpULL9uXyp6XlL0H1k+5gOmLWfHid33UDLe2b3?=
 =?us-ascii?Q?ZftCEcCHLpCBWNrHKpjA4vDa74KaEPEq5+yQwXON+Z92CcKNtB4OTiN19KYm?=
 =?us-ascii?Q?RUwITUANYJo6FbToM75Lo8NODkBCdPacaPPkEsk+i00g+obCBrmBRWYvZ6Aj?=
 =?us-ascii?Q?hnzkHotos5WU4/6fps/+4DN3FREwaDpbmVMUjeA9hCaMXrt/Zc6ooIxjvQ2h?=
 =?us-ascii?Q?uGUZhWC8UVIkGej7pItpvMWG+WqHrbasjMrwj7KRhFDENZ3bGC5wLluO+xTa?=
 =?us-ascii?Q?7SdK8srXJ23MMmDXwqYwh2+gYYc7Nbf+VXO8Zz3IfBYFJFHQkrq4g2ruhMhI?=
 =?us-ascii?Q?OQKbvWmNKsIJ7Eya2zmkDnn2SU3XwG9iWrp1IboRHFhV8sqTY/kcmSUikRYz?=
 =?us-ascii?Q?KavVr5Z7Bv6qyJGlZCIW7tGjQMPzz2+nfE2fiiWFvq7ZW2VuaauzWCd01RkB?=
 =?us-ascii?Q?joXkYT5k1XElDrt1tmCAMSALWn6chn2RVxrZvOhJbMn8Xmp1LwK3hAQDsuAb?=
 =?us-ascii?Q?UuJswP5bd28cGpXYHZie8RBT5eGMpZLEWJ9wrDm5Tsvg63OJuZhI3tJppp4m?=
 =?us-ascii?Q?alYz6cBly+W/t8jGc4jUnPaypz66i6nc3tU5is/JsIWXbPesGor1plZ9Nu0e?=
 =?us-ascii?Q?TARqh+icjl8AsUIio8NEvD6HVIIcgTxp13qr8J0oYxxcKbCm1/ZycyAZk/M/?=
 =?us-ascii?Q?PoWLqKJUsMEelhRC1el6R/IuRN7kTgnRxKICKYEwYSJStbkTR8S1nvsIOkTt?=
 =?us-ascii?Q?F+iR9gs19Zt07QEX3o1Q7I3kYYpQggouVaBRZ7MTCZe3iAHv4rBFWMgDlEqg?=
 =?us-ascii?Q?uMv9B0tcDSz6DYpLfd5g3oeL0KJcAgOURyeeC0v4gR+E26amqYfDxNdwsR9E?=
 =?us-ascii?Q?3UdJmk0nwuNYxhEqyIqNhnhKgCQT6TdZSzJgaeSbkSK0SYTtdw2qEf8CWau/?=
 =?us-ascii?Q?1Ly5FiRW8kQcVYTc+7hS/CEPUTzJWHOJqGeAGriP+5DlInBu5XC1iObWkUGn?=
 =?us-ascii?Q?mPuEnQ1UhXeo1vQpzIVOuFmMou9Y8evtJTr3ReJhpDOAhm/LTEqPxU8hU3lZ?=
 =?us-ascii?Q?cEYIzzn31UzCzMb6PJWzVZcCs4nXNzxGh6/jYjQXazlyyBBiznKTe3aX+42A?=
 =?us-ascii?Q?POtwCm6fv2D4ysIFvtpErFEoNmvpZpsbUcOus7AnSbvGzSKEHRdKFdqSAT9d?=
 =?us-ascii?Q?Zatv1jAZW/lbWfPU88I=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3668284-b31e-4b16-7008-08dd3955e6a4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 13:25:26.2649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8L6nCYJlfpR+pJ67Tr52nAEIz+yTtOUaatgy5Nku7SSby5c5/MMmZu+o2QexZmM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7922
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

On Mon, Jun 24, 2024 at 03:59:53AM +0800, Xu Yilun wrote:
> > But it also seems to me that VFIO should be able to support putting
> > the device into the RUN state
> 
> Firstly I think VFIO should support putting device into *LOCKED* state.
> From LOCKED to RUN, there are many evidence fetching and attestation
> things that only guest cares. I don't think VFIO needs to opt-in.

VFIO is not just about running VMs. If someone wants to run DPDK on
VFIO they should be able to get the device into a RUN state and work
with secure memory without requiring a KVM. Yes there are many steps
to this, but we should imagine how it can work.

> > without involving KVM or cVMs.
> 
> It may not be feasible for all vendors. 

It must be. A CC guest with an in kernel driver can definately get the
PCI device into RUN, so VFIO running in the guest should be able as
well.

> I believe AMD would have one firmware call that requires cVM handle
> *AND* move device into LOCKED state. It really depends on firmware
> implementation.

IMHO, you would not use the secure firmware if you are not using VMs.

> Yes, the secure EPT is in the secure world and managed by TDX firmware.
> Now a SW Mirror Secure EPT is introduced in KVM and managed by KVM
> directly, and KVM will finally use firmware calls to propagate Mirror
> Secure EPT changes to secure EPT.

If the secure world managed it then the secure world can have rules
that work with the IOMMU as well..

Jason
