Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C091B8B837D
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 02:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A7D10EAAF;
	Wed,  1 May 2024 00:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZJZlFNrL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374C810E6A4;
 Wed,  1 May 2024 00:09:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRXv88WX5NJg4TPbzCwkk305YuMeqJmKbw7B/gqRxoYQOl3hvHSsKTIBUJdN07gtXkKBNv2z925LEs8wX7SvM2Onb747kcOOj3Kb0pfFLkzhVivUC2ayjqILa+X7Ukad1SfwM8W0GlIDwEYwwV/88960D4eMMMMwXPcThX7W4cyleoUXTg/LMlpJ5UpXNQyNfKU7rNaesX9fSKMX3NmGZk8mCbm4+nqmdno+jF7K5bZ/0m9QJR7gLd9sPyxeys0p6MJaGAt9h0JzfAZeahav7MHbkk4skY5fhCOWj7z+mFqhmfowDknwEksvKJYk3pdPiXGX9bnfT3O8LQSzkh5cDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clq8InK72c3zxlFY+8GHlIluEw0sSWaKOvkw8GO1ABQ=;
 b=JgAqIFHUf2M9n0FdLHSN7J8dV78ZwTA7jUeS2IYHQ9tcqm5SbnPuBAJoCDTroOp7VCIjICaPDmXCV4XlncEQhlQDpPoCbpfBhBBFFpRkMZMEH6gFMRbLBTaXVQmo9UxexSd+v/05KP7vYvKOxG5sSp5LAQEtw2zB2Pr3isOCtDNW4ouXxZmX+uNby8ai3BDL36WFSs1wU2pieLTqt14nLusFw/wrvv0dGHWf1evhC5muXO0oCN4DM7GZMuzcVR+nRbzvcfO8U2odsTFWbEb2q3gGDRhNkLtoHnL6fq0T7MecE0Yo9W0dv15ibN/E7LsiIcMp94xeuvKhzaHMXM/DuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clq8InK72c3zxlFY+8GHlIluEw0sSWaKOvkw8GO1ABQ=;
 b=ZJZlFNrLpujrmr73Ba288HaRcJY/KcKB58S6pPSssTRNbvPxa3zzrgi1L8sJlm1rA8LeyMdxNJDf+4b4OBXFQeXNQIB8TOnqLKBIgcvxjk8itaZA13xcNzPDjV45UuWQc2GgfnqMMT82yTJp8b5GNEDqf8hjrCHG38yYjv6UQXQ8Oe/f3+WxTRC9yjS54iVbFsz8b3LLX98596YlV+7ZSNrcRLR+eNqQH+6PBBfs9ytkXtEE06DKHuBbJg1TSZoHjvecrr8r6OpthyqXxH4iS5jZ37r58omZT363+vHeptz0V/obiw9WUjY1pMJ+J9n8lxQ+91I64QORY4g2XnsKcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by LV3PR12MB9353.namprd12.prod.outlook.com (2603:10b6:408:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Wed, 1 May
 2024 00:09:16 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 00:09:16 +0000
Date: Tue, 30 Apr 2024 21:09:15 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240501000915.GY941030@nvidia.com>
References: <20240424134840.GJ941030@nvidia.com>
 <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240425010520.GW941030@nvidia.com>
 <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
 <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
 <20240426163519.GZ941030@nvidia.com>
 <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
 <20240430173002.GV941030@nvidia.com>
 <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
X-ClientProxiedBy: BL1PR13CA0385.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::30) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|LV3PR12MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc364e7-ab24-49a3-b196-08dc6972f09e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDZwdDZMSVdpWHM0Sk9xWmlkcWlYMG1Pb3lSZ0tsT3ZJOEpwZm1mYW4zWlU1?=
 =?utf-8?B?TXpIanBpRUhJVEl6dURKcDNYc2doZzRLZGN1Q1dlZzM4TFl0MnhNMXNpSy9U?=
 =?utf-8?B?a0NaODBrdnBKTExLRERabEhJSzMyNEtEUlFtWjU2L3B0L1liUCt5UEw1VUpz?=
 =?utf-8?B?WGpQSVJIR1hIQUNRUy9zbzF3WjJtU2ZYUjNtUGVWSU9mUHJlUVpUbnVKS24x?=
 =?utf-8?B?UjBZUmZYa3dHb2U5cTcvVkdXOXBpVTMvUXpDbjZ0NkdFM0ZqbG5VRTRNdXJB?=
 =?utf-8?B?NUZ0MitPYTJQV3RWdWl0eW5LbCtNcXo2eXpteXc5cmxyTTJjcDdaVW40SFJF?=
 =?utf-8?B?SE95NzRoZTU0cmpDUXZqR2VPRjJqeEJFQnduQWhjWEtoWkxUckE0NStkc3h4?=
 =?utf-8?B?dWwyTExCNWRMdWJteUpvZktSeEZyT0tqdkNQVk41RTZ4V3Qxc0NrUUxNNm1H?=
 =?utf-8?B?N1hyZGp3WkcwUHNBM1hQNHZ6NnVnK0QxVjc2dEM5L0o1TitnRlMvQTd1bmpD?=
 =?utf-8?B?RGx1Q1M2cEIvYU5kYlowQUowSlRtRWNncGhIeGU5NHFKeDBsaWVVRmZmR0hM?=
 =?utf-8?B?WmNuc05YRDRuM2tJaEdabERibFEyaXhiVDJCellXQjBVM3BLOTBVY0oxdmJE?=
 =?utf-8?B?M0FLTUhReTZnZktCcHpOYkRpTi82ZjBCd2lsTVljRCtqTzc2UGl3d3NxTDRt?=
 =?utf-8?B?QllvQXU1cElWazRnTmJNeWVkR2l0NVZ5N3JNNTB6MVd3a2NOMkFZV1FIV0ZX?=
 =?utf-8?B?YVhqMkUySDZCMUZPazZpTWZLWHYySGg1T1dKdHhKNkZUMlM2MXpHTjN5MkhG?=
 =?utf-8?B?Ym5YY3o4bWxxd213Sk5WbGtaYnhzVzFsaVhIQ2N2QjFuOGd1bkZueGpteHl0?=
 =?utf-8?B?aUFYM3duZTBVS1NuWS9LczM1elNIOW9TNUJpMjhVZmtiUWhuUEx2aUVVdmFX?=
 =?utf-8?B?YUlBZ2REM25BeGRyWmg0ZGdkQVExMVJjL2dQcmo3VmtVVm5nME9VbFRZL2lH?=
 =?utf-8?B?L0hYb0kyekNobVNsL1g1d1dXNk5GQ1JwejNXc3IvbEcwaWN0NnV6a2NzOXly?=
 =?utf-8?B?ZWVjakVBdzFGNFE1VWtpby9YVUZVV3lvcEdKZ1RRcHV6ci9tYUtUVUczSTRi?=
 =?utf-8?B?VlhZVHljcUJISXUrNmVpaWpGZjBpNzdOMmtETE1WbXdoaWJCVnQ1UHUwZFR6?=
 =?utf-8?B?YXNPVGhKMHlCcGo1dnBXV3hXUTVZTFIwaUpqQy9uS2cwY253VkJhWTE2Z0t3?=
 =?utf-8?B?QWV3RnVJMVo2ZTNLM3BYQVBsMTk2bGpPdnFQRWk1cVpackVWeHl6aXRud0Vs?=
 =?utf-8?B?WFNxWFRyc3RzcG4wQlBVRE1ubktyUTZJbWxxeE0rOHlJWTNFTVJldGNjdjMx?=
 =?utf-8?B?bWx6TGpzdmFxSHZLVm9mS0o0S1g5WGFVQ3dFakNubmxmMmRMNHhKV3I2bVZY?=
 =?utf-8?B?NHNETllmclBQUUFhcFFZV0xNUnNRSXNkbTFoYUxHd3JKYWY4SXRMbXRZRU0x?=
 =?utf-8?B?OWgyVE5yS01zSnQ4cGhEUjNtbU1vK29pOGhQZDQ0dUhFZTlsNDdmR1JSY0Yy?=
 =?utf-8?B?LzN2aW1jUDdYSmVER3E1N2dvdSt6M3czSWNRZEcyZzUwOXFsOUM0eVR3YWFQ?=
 =?utf-8?B?WVBFZVBIV3RabzlsdVU5ekdyRHRndVhpdmhvc0d5NnU1Z0IrTlFId3RWdnd0?=
 =?utf-8?B?Mis5TDhlOVJqdndZYWxja1RVTE5lS0hyVGphVXA0TkZGK1VIYnJvbStnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1ZIS3VZL3FHT0pHM0J1T0xhbFhRMzk3c3UrSjl4Qk1pYlQvNFdPelNyemh4?=
 =?utf-8?B?Qmw1WWxOZ0JZRlh4bTkwOUhtazF1UllPUDBFZWxDOUJjNEYvbzJkTGxteDQ2?=
 =?utf-8?B?OUdIalordWRoaXZabFExVGhkaTZBdm9vR2o1a2Z1Yy9Pa1I3c0h3WmloT21R?=
 =?utf-8?B?YkVRYVdVVmhHcTZscUdIOGRFQkNqcG5WSmFrSWxEL0dWUXgwSGxIUTgrMGRk?=
 =?utf-8?B?bUxMM2pmVHh2ZUlCUWF5MTNRMEJMKzBzWWg4byt0alRkaWxJY1N5cXRTK1lZ?=
 =?utf-8?B?QzZPOW0vb3pWNXdKbVlSeFVMMVhuamRlcjJ1aXhJNzl3VWNiaVlsanpkNkNj?=
 =?utf-8?B?VW9lbExRRkUxOG80aVdRRC9ZVEFXbjJwZUM2aWh3ZkVPY2pnb2c1NVJwNDBu?=
 =?utf-8?B?NmkyNlpqbFMwZGRYU3pXS3BWZnhDb0N3VXVxZmN4TXVHV1Q1d08wZ1lCY1J0?=
 =?utf-8?B?d0MzY0JGb3FpN212OHFWVkRXRmhtNE5FQUxFaHZsNlE1SDROVFR0WTFNbjIx?=
 =?utf-8?B?THlVUDE4eENVaHZCUDI2U3hZOExuN3dlNVRhd1R4YjV3V0pHSzRKamsyTDZV?=
 =?utf-8?B?MlA4S0NoOUxMVTJ4ZzBBVVVoZVhUWDBFSWd2U2lzdVNOaWhyck54R2FBR0NT?=
 =?utf-8?B?NmozamZ5WWxkZ1Bxb1creWhUdUYxc2ZwWStRcUdpM2xoU2p5TWtBVTl5bUdx?=
 =?utf-8?B?WCtQazdIeTZkSEVhakpHSjJJa3M5Y2JTQXpyLy94djBTOW92Qm9PeTZpS3Bt?=
 =?utf-8?B?dW5XWkF0ck5TM0p0anhWelpKVzdyRDBLNVdPb0tIeUR0MC85eWhZOW1Nenk5?=
 =?utf-8?B?cGZOV2EzYVRrR0ZiRnQ5L0lGckc0VDdlMWdSYlNPY043N2o2Y0I0YzNSZHpn?=
 =?utf-8?B?a1hrWE1XTWptZmNreFUxa2dQeU1uZndreTlpVjV0Tk5KTE8wcndJTkFFWTI3?=
 =?utf-8?B?UEVrYlRtVzJscTR4aEVaVi9ka3IrNXRaOE4rcm9lQlVqYzZQV0UvcnRHcXQ3?=
 =?utf-8?B?cmUyNzU1ZFFqeDZKdHVENys5ZFBPRzh2RzU3YlNuSU0zeHJQeDB1WkNlc1Z2?=
 =?utf-8?B?Vkx3WEkxYmJ4dW5wc1hFYjRSL3phQXk4SmFBU2RhTlBrMEc0S1g0dCtNRmZi?=
 =?utf-8?B?UDJ0NEFGTDY4YzdGUnliRXpqODVhTmVaSUlFZ3Vwbk5lTWZ3TmowclpPL3Rw?=
 =?utf-8?B?OHJNQ1NsU29LWGVkbm1YRHlNNUtFcDFqMDhKeXdqZ2RSUzljc29mdWFJMTcv?=
 =?utf-8?B?dXVaUVdDZW92cUtiTnRzOGpCdmRUWkhWQ3ZtQW1uZ2NsWnBDdlBGOHRMOFEz?=
 =?utf-8?B?OElFWFdodXlyRnZOOWtUay8yUlhuajd5dG81YmFPTDQzUElXM3dwTTFWT1JT?=
 =?utf-8?B?V2RrUEJOYzhHSFVRRDhodFdISUxHVWI5K3lQV2RqK1BTbVpMdHZMUkpHL3NU?=
 =?utf-8?B?cWYrZ080ZWdRc3k2alVMMlgwUklNVVNwR0ZRSlBEN3l4b0ZuQXMyeXJyOEZu?=
 =?utf-8?B?TDVXaml4NkpjblJDbXlzSEcreE5tSHpWRFNOUUJpK1hLa2pRTS94azlzSi9n?=
 =?utf-8?B?TVg5RmtNTktHaDkyOGkwU004YStoV1c0cXFRQkVpVEJYV01ZcUhSZVc3SXRF?=
 =?utf-8?B?YkdQb3RGOXpJUnBNb1NMNWw3UWY3ZURqOGZBZWlUNUk1NGRGeHJ3ZWExejFC?=
 =?utf-8?B?SzFDYTVybkdpellrSURZRVV1aXJBRUkxangvRjdtQzVvejNGc1EreGRQenRF?=
 =?utf-8?B?YVZqTHBwZDhKSEltMW9wZklDdWJUaGttSXg3VFlDMUdGYlpzSlZ2ZndPZXVr?=
 =?utf-8?B?K3locXMvSWtZMHMvSVJ1RGY1b0xzTy9VaU5tZW9DWDZVcHNucHd1NWVVcEw5?=
 =?utf-8?B?ZEc4WSsrSVJrSDJKT1ZOR1VHckxUb1d6aFE0WTc3L1l2RE8wY1BnRGZsN3Ez?=
 =?utf-8?B?S3RkQW1lUndORjVhekU4ZWpvTW5BNnR0RWNMbVo4R1RkSkRYeVJ5OVBPZWxV?=
 =?utf-8?B?UXNJMlF6MzVBNWtPMjJQZEZCNkZUc3g4bUV1eEkwRzB1cm9oekRHSERpeENs?=
 =?utf-8?B?S3FsVCsxM3JwOXdNT0pRL280VjFGUC82dVRDc2Y2bThWb25pYWRLbGFXV29v?=
 =?utf-8?Q?zKdLkh9LnYgA59SeQj7whGwwq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc364e7-ab24-49a3-b196-08dc6972f09e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 00:09:16.5268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e89eB6iRvilUmMWyBWO0m7mW2bSGCBNJWO67h+cih1q91Zs6PiPq1ueNTrkNRpw5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9353
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

On Tue, Apr 30, 2024 at 08:57:48PM +0200, Daniel Vetter wrote:
> On Tue, Apr 30, 2024 at 02:30:02PM -0300, Jason Gunthorpe wrote:
> > On Mon, Apr 29, 2024 at 10:25:48AM +0200, Thomas Hellström wrote:
> > 
> > > > Yes there is another common scheme where you bind a window of CPU to
> > > > a
> > > > window on the device and mirror a fixed range, but this is a quite
> > > > different thing. It is not SVA, it has a fixed range, and it is
> > > > probably bound to a single GPU VMA in a multi-VMA device page table.
> > > 
> > > And this above here is exactly what we're implementing, and the GPU
> > > page-tables are populated using device faults. Regions (large) of the
> > > mirrored CPU mm need to coexist in the same GPU vm as traditional GPU
> > > buffer objects.
> > 
> > Well, not really, if that was the case you'd have a single VMA over
> > the entire bound range, not dynamically create them.
> > 
> > A single VMA that uses hmm_range_fault() to populate the VM is
> > completely logical.
> > 
> > Having a hidden range of mm binding and then creating/destroying 2M
> > VMAs dynamicaly is the thing that doesn't make alot of sense.
> 
> I only noticed this thread now but fyi I did dig around in the
> implementation and it's summarily an absolute no-go imo for multiple
> reasons. It starts with this approach of trying to mirror cpu vma (which I
> think originated from amdkfd) leading to all kinds of locking fun, and
> then it gets substantially worse when you dig into the details.

:(

Why does the DRM side struggle so much with hmm_range fault? I would
have thought it should have a fairly straightforward and logical
connection to the GPU page table.

FWIW, it does make sense to have both a window and a full MM option
for hmm_range_fault. ODP does both and it is fine..

> I think until something more solid shows up you can just ignore this. I do
> fully agree that for sva the main mirroring primitive needs to be page
> centric, so dma_map_sg. 
              ^^^^^^^^^^

dma_map_page

> There's a bit a question around how to make the
> necessary batching efficient and the locking/mmu_interval_notifier scale
> enough, but I had some long chats with Thomas and I think there's enough
> option to spawn pretty much any possible upstream consensus. So I'm not
> worried.

Sure, the new DMA API will bring some more considerations to this as
well. ODP uses a 512M granual scheme and it seems to be OK. By far the
worst part of all this is the faulting performance. I've yet hear any
complains about mmu notifier performance..

> But first this needs to be page-centric in the fundamental mirroring
> approach.

Yes

Jason
