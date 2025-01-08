Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986C9A05F70
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 15:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171F910E2EA;
	Wed,  8 Jan 2025 14:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ctgKpuqQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6340510E2EA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 14:58:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqCsjtdQdFX4Am1N1E14mX8BHTbeLpyWL8tR11TBiD1Ewhmi3oXwI465i3UoW5QxrdtMmbxphA9W04ujpzO3VOuCWrgWBKOx20/EYYcUWOHMY5bMo3BejCGOqF0D+gjvOrKvBF1K6tRdQI5VFd47DJBxyBA/FJkQ+/T0hY0ZAV1LCRp+lNS2RkpbDsyzS7Mnqy3oUkOdn8wXtoQhFJQI3aFzkwhhspJEa6/Vwrc6UTQUtWc58+ai93DgxT3Yd3fsmgzFLkGIkL2mQn25p8CbMW7C9YyZ2oQzkjSDILSsdZ+3uTkCJQRavpyYL4NVKOSxBN3WOtIz2uNfAo8+3/VBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aliFBb1bXvJ4B8fyZRm7X82VaSNazDN1T2eelS6+DKo=;
 b=gZYFR/tjTB+0xoKv7AVq77GWZu41GNLaNef4eHBla5pRyzXOgwzL8HqVKCXS44iT84MUetESGdCaCTgPDihusU4DsbDTHjrhdRBJvDradqgT5aR7qCL4oKb+VB1pG2pm9pKiJyvP/Xj4j+RWHVNK///c7c/X3BB5suBPS8HlhWZXjQCfEp7zZYXl/StDzIwqfrQpPlZTpJBS+3z88qtqf6mHLdPcOSxBZDXkVYN5SyUlnGA8Ib7kNNdFj5Cb3+/noWmgHeRnZiIFfFWZRK0paqDkutWCE/uYWeg9lzGUaUip+WeYdxzUz4cIl04i5w1dkG/doqm433+VTNTxAnJ/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aliFBb1bXvJ4B8fyZRm7X82VaSNazDN1T2eelS6+DKo=;
 b=ctgKpuqQWovL+1dNpp+FYoDUUn7UBIC2ZKM80s2vjAqHWn1yV3p9/del9jIelVnXpq0tfC68JHTLqE7hz/dKym1ozqPDq4w1anCHPmTKFghh4SPz3ZP7e4u8bN5picfhsuMJ9sAUxf0HeECpw4mL0bIyzXXNUDDaBQo278IVHyUu3Y9Rei5GsJPsFavv4HikeqQLT76LBynajTkEF4pjJBL1K03aiFKVD4h+GwUKcRvqUyhrR4y/xwsmA4BCzrjy46iPL+3RCl2Qs2/QPv4Q+gKtGFKBh+jNnHK8aWovDb7JhXDR8G7z41J1UaUKrhQBBkahEOtlZ99JOVDzvAgSUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB5734.namprd12.prod.outlook.com (2603:10b6:510:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 14:58:44 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 14:58:44 +0000
Date: Wed, 8 Jan 2025 10:58:43 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250108145843.GR5556@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
X-ClientProxiedBy: BL6PEPF0001640D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: 11416b6d-0c7c-4186-f452-08dd2ff4f23d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXhPMDI0WGdRR1R3dURKdTE3L005SXUwOVc5b2xOaWRlZWFVL0haZThtazV3?=
 =?utf-8?B?ei8yLzJ1eVpjRVJNUUc3NkRPOTJFUGp1ekU4S1ZEVlhoN2hCdi9wb1NudC9I?=
 =?utf-8?B?Y1Rwdm16RFhHbjRGT003QkdQcTUxTlhuQTk2bFM0OFBzczVhU1l6TFpHdHl3?=
 =?utf-8?B?cDIrc1hyMXhuSnh4TmN2M1lUN3pPRDArSDZwZHFndG56RlpOWUs0SXdPWEto?=
 =?utf-8?B?QXZIeUZqdzdqajZoT0Jnek9lNkdNYWFWNjJyZzJ2UFFNK1V5U3NZWjJoL3NG?=
 =?utf-8?B?enhvVk92RUpGUHR4bWNtZTRuSHA0QmxLZEx2TWx3VFRLS3NJbXBSTUdzNEdE?=
 =?utf-8?B?RXFVMFF6UmhYTXBibGp0RGQvNUYvYjRYaklIM1lCVDFsQWdJM0tmYXpMekta?=
 =?utf-8?B?NHhlcTJ6eG1zMUkwTzU0WUNWU0Y1cm5Rb0pGd2NaME5NOXpNNDk3YjUwU2hn?=
 =?utf-8?B?RUFRVjYvUWFlTEdxNFlrMElGQXhWUHN6UEtDOExRYzM5S21XZTM1Y29pb3VN?=
 =?utf-8?B?bUljWEJzam1wSlJpUUJHcXpRNGpzTTdpRWFkL2Z0MFFPbUtpWlFsTnpnYjBw?=
 =?utf-8?B?Ty9ZS2ExUVl2NlRsQnJFR2JtanFJTnl5UDNSQTNqV1hyZ253Z0hFc0tBMU9n?=
 =?utf-8?B?MUd1eEtnS1o1T2dESWZCVEUrZGM2NU1CVkd3MERSZW5ob1pqdkk1TXNKa042?=
 =?utf-8?B?YVJyWGZLNjg3VHMxcmlWV0VKRVB6Vzk0Rm82U25mMkNQemZhVmVzVkxSQklq?=
 =?utf-8?B?RWpKakl0SzM2TG4xbkJ5Z2ZIMGgxS1JGa1JqOXRyNjJEeGpvUmZybTNtWjlm?=
 =?utf-8?B?dXNSVXlHYTliZEMrc2ZWUFpKOXUxamFqaUFZNjVPSE1VNmZwRGtvWVZDWW4z?=
 =?utf-8?B?ZkZvVWpOU3Q5THZMZEJsWHZ2MkJrdmlUbTE5cUd4V2N2aXBmdVEyMVNMN2Fv?=
 =?utf-8?B?Rm1RQ0RDa1Q0L282dklxT1haSGVOeTRYL3haY0FtWE5hRENFUGNsN0k0cUVY?=
 =?utf-8?B?dC80WE1ybFNaRUoydTh4RGNrTFJmNmlkejlRUkdTS25aU2VnYTQ1bzJGVFd1?=
 =?utf-8?B?MTl6blQ2Ym4rTFZ3L1RhQnk3TytMMjhMc2hHZTJDUlNPemptdGRSSkl4aVJD?=
 =?utf-8?B?UWhZMUVleEtacUt5NWQ4QTJVZytNdE5lWW9nbC9XYnJlVnppWVZ0WHJqSldG?=
 =?utf-8?B?OXNnNXJDSnU5WDh2dld4YVNGK1c0cnRlanVzeEpwaFpPMzcyWXRMVWkxSEUx?=
 =?utf-8?B?M0dITHpraHlTYTRxNllJMjZpVDA0eUxGejA0ZFoxWmVDcDVuNGdER1hvZVlN?=
 =?utf-8?B?b0NCY1ZkRGhrOFVhNVhOMGV6UTBMb1MvenRlWlFPNUpBaWwrdWVBUDRnL1hq?=
 =?utf-8?B?NEFEbWt3b0J4dG5EaHR4RjRDbmUzQWFaeVMxUitGbVg0RzNic21kUU8yNURQ?=
 =?utf-8?B?SFQ4bDk0ZjNqaFVNZ2lGT1JmZDV3Q1pZTCtsZW5yTTJua1pJbDRiQklXZnlI?=
 =?utf-8?B?QnhBQ0kyaTBKMm9Za1ByRXNyaEZ5Uk5VMlY2VUpVNWNYRDRxVHk3RjZoMmJw?=
 =?utf-8?B?MXlncTdCQnNPMTJ4cEluNFpwUWp3S0xsOGRVSWVRb21rajV4T0VSQTBIZ0pz?=
 =?utf-8?B?ZWNoaVh1L1pCSWgrdTdMaDdjeXZNa0tJK2NQUzk2UXgrVTJGbUxSQ1RyK3lX?=
 =?utf-8?B?VFpsOWxYOFI0blF4bnBrTG5NMm5nVjRHNnlaVFFzaElsS1QwSUhaMjk2aU80?=
 =?utf-8?B?L2JDUTF6aWhLb0k0RzdWN1NYU1FPNlhleXkxZFd4eFI1bHVIejgya3VEQVZP?=
 =?utf-8?B?YlliVXljL1N3cnpKSTVXWDdIZ1BoT1B3dmFKQzRLZ2FtODNBMHZuZ0FXRldj?=
 =?utf-8?Q?1BbtVENNx/fWC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elphaFVTUUR0WFo4ZmFLZXVkTjNiVEJXajJqVFNpSUFDVUhkenVSd0JRKzhB?=
 =?utf-8?B?endzQ0poYW1QMWltL2NqMUYzVGhhQ0k1SEM0VUlMVklNWWl0VmxNeEl3UGV4?=
 =?utf-8?B?clZ6dDl0YWY5V0RBSEh6SUorTk00SEYzM2YvZGxmMjltcUl1eEVBUUNJeXQ3?=
 =?utf-8?B?aGt1cUR0bE5MSWlkNHFKMmVYTnZCak1CYVErYnlsSXlCTzU3RzVFVW4xVXRC?=
 =?utf-8?B?Rk5mcVZNUWJEYmNEM3BJZzR5QmdPdkZ3SitwdTBFN3FrZWNFQ0ZhR0xHTXp5?=
 =?utf-8?B?L2FibVlNUUhXbjlWOUVNWmFucjNBZ2I2bWVPVDJUdnpMN28ybmNrVkV4Rkw0?=
 =?utf-8?B?UHd2L1pIQUhrSjYzcWNJOE9vU3padjFENDNhb0dxWmtzQUdpMlZwU3puRTND?=
 =?utf-8?B?bS83VTZVcC9WOWkyVEhFVTIrcHRSbStrTWF3a3MzMGNId1dLaVNCd3JNa2Fv?=
 =?utf-8?B?Ti9nRDE0Y2JKSXFXYW1UWTRrdlRyREdVeEZjQkROUERLQWRkWXk0RUwvWjNI?=
 =?utf-8?B?bVBrNlFIaENsZ0lMREhvN0p1a0lqeDAyZXhtMmZQWHVJMWNDczZ1UGprZHd0?=
 =?utf-8?B?ckNuTmZrRDAwblIvT1ZsLzhQdkJyR25qN1F3RnpFblV3MXpFK1gxN1AyNTd3?=
 =?utf-8?B?RnlTM3JIeUZ0SG1XaDhNSFZGMUJsT0YyNitQRm9yNFRuaXByZktmY2h5V3d4?=
 =?utf-8?B?VzBjRW94RFdiSzhKelp5OThMUmlQM251T0R0eFl3NnRuSjdDRlY2NEpmNGFh?=
 =?utf-8?B?eTZpa0RqUlJ5WGFzN1hGZG9GaEpEcm9QZ24zc0ptN3laK0prQlpQZ2o1WnJi?=
 =?utf-8?B?ZThQNjlNR2lLdmc3SnlVT0lsNGNJd3VVWTdLRXk2RXM4UnIvN1d1cW5aR3ZV?=
 =?utf-8?B?aFBFMWw1NURHUU1oWENWeDcyUUpYRm8yS1A5K21RSjdjUGx6U3hEZWpRbkpI?=
 =?utf-8?B?QkFiVFJJa2xUUGdqcUhLT1N6aURTZkpGaWljSHBILzc4dzRiNXhYU21VUlc5?=
 =?utf-8?B?N2FSZ1RTQmowNmdJbldGenVkVWxoTVRzbW5kdkdmclJGb3ZubUl4anFDajQv?=
 =?utf-8?B?R0RvU2x4OUYzZ2Z5Q01CT01ZN29RWUdya0VvSnZLZE5rUkFCdHh5dTdWZ2pz?=
 =?utf-8?B?Z2FGS1U5WTFLYTVxZURnbGxTM25yQ0pQQXEwa3VtWnA4amZGajZoVFhwdktw?=
 =?utf-8?B?elhYKzRYWWZ0VG5kdlc4amJJdHNqNllSUFRiUTJDSkRXNFJuM1R4YnB4eGh4?=
 =?utf-8?B?dCs2TmoyVmk2SU1VZHMwb1J2RS8yblVWQ2lNbzgwMWJMd3dGc0FvcVI3VUhG?=
 =?utf-8?B?U1R5WnFpQVZvMmR2WHJWTU9nYVBJK3BoN016aGpYSnB5NzArU0FyU1pkalB4?=
 =?utf-8?B?eFFTTHZ1dURHaXpJd3BIdG1ZVFh2VEticjlDY0oxNHBmT3hDTFNtdkxEMFFR?=
 =?utf-8?B?NnY5ZldpY0k2U1RxaHhTMm0xNGFZSHYxZjc2YnNvRGUzUmR2NmlKY2hzMUhB?=
 =?utf-8?B?MHVDZkNEN0diWlNYYVh4SjZ0UWZOOWovTEZHVmZJdTQrYWFLQURHQU1JS20x?=
 =?utf-8?B?WWF5L201c2NmOWVoVTdOR0dqVVJyWHpEVksvRFU5eUFzWVFhODFJWU1DcVlM?=
 =?utf-8?B?YTJ4TE5PZFRGR2MrMWVYbFc3R1NwaTRnQ2F4M092aHR3UmppbmROTkRrZXhH?=
 =?utf-8?B?VXJITlhYN1FWQkFSM2VYZVhYSjR6bklEZXdQR0hUUmNxT0NzMGhWUUh1UDRF?=
 =?utf-8?B?QU5wQm1YTVlWQVo2ZlBCbW15MXowaUdLVUMxOGc0VUVCUkkySGRXTHZhZGRt?=
 =?utf-8?B?aUZ5TlBSU2FEcm9WUE4rSndXeHoxY1pzek50bzZjcW5JbnBYallaNE0ycGJV?=
 =?utf-8?B?QzZ2OGtnUU1DVUZ2R00xc3ZPcUtFaWxBUWFUT1hNMlBDQVQ2Q2FhaTh0N2tR?=
 =?utf-8?B?Z1kvSHJha2JyRWl5OEdVbEZmdDZYeHU2VXpaaHNsZHVHeDZkU1d2MVdJVjE5?=
 =?utf-8?B?YjNnK3JIZ0M5Z2s2K3NIUVZMTFBkTFAxY3ZUN2JxZUJTQ2R0ZXh6cVZkeEJa?=
 =?utf-8?B?Zk1jYTVTdlJGdlZpdHJGYUM1WjkyTVpIekMram5IUDUwOGptczJOY08rS1NF?=
 =?utf-8?Q?uPXuGDDz1QgASwiPzo4PnmeeF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11416b6d-0c7c-4186-f452-08dd2ff4f23d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 14:58:44.0885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1zU3efPADksjArmTNaoSLDTKeBByW4QklWUSpr07JieIbSBz8oXUvUJN4GAAWZI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5734
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

On Wed, Jan 08, 2025 at 02:44:26PM +0100, Christian König wrote:

> > Having the importer do the mapping is the correct way to operate the
> > DMA API and the new API that Leon has built to fix the scatterlist
> > abuse in dmabuf relies on importer mapping as part of it's
> > construction.
> 
> Exactly on that I strongly disagree on.
> 
> DMA-buf works by providing DMA addresses the importer can work with and
> *NOT* the underlying location of the buffer.

The expectation is that the DMA API will be used to DMA map (most)
things, and the DMA API always works with a physaddr_t/pfn
argument. Basically, everything that is not a private address space
should be supported by improving the DMA API. We are on course for
finally getting all the common cases like P2P and MMIO solved
here. That alone will take care of alot.

For P2P cases we are going toward (PFN + P2P source information) as
input to the DMA API. The additional "P2P source information" provides
a good way for co-operating drivers to represent private address
spaces as well. Both importer and exporter can have full understanding
what is being mapped and do the correct things, safely.

So, no, we don't loose private address space support when moving to
importer mapping, in fact it works better because the importer gets
more information about what is going on.

I have imagined a staged approach were DMABUF gets a new API that
works with the new DMA API to do importer mapping with "P2P source
information" and a gradual conversion.

Exporter mapping falls down in too many cases already:

1) Private addresses spaces don't work fully well because many devices
need some indication what address space is being used and scatter list
can't really properly convey that. If the DMABUF has a mixture of CPU
and private it becomes a PITA

2) Multi-path PCI can require the importer to make mapping decisions
unique to the device and program device specific information for the
multi-path. We are doing this in mlx5 today and have hacks because
DMABUF is destroying the information the importer needs to choose the
correct PCI path.

3) Importing devices need to know if they are working with PCI P2P
addresses during mapping because they need to do things like turn on
ATS on their DMA. As for multi-path we have the same hacks inside mlx5
today that assume DMABUFs are always P2P because we cannot determine
if things are P2P or not after being DMA mapped.

4) TPH bits needs to be programmed into the importer device but are
derived based on the NUMA topology of the DMA target. The importer has
no idea what the DMA target actually was because the exporter mapping
destroyed that information.

5) iommufd and kvm are both using CPU addresses without DMA. No
exporter mapping is possible

Jason
