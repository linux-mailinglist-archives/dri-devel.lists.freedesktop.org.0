Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296AC7EE98
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 04:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F053C10E0B8;
	Mon, 24 Nov 2025 03:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dODsilFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE0510E0B8;
 Mon, 24 Nov 2025 03:48:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZAw7w0HtPJUhf8oY6SmidAHWCTxpfrOtAOJPriWc9+7EVAzQ02f+3onSl7nPNaVHCoAB7ZdRccXGeSmD1FYIEvgEHHeJPSGPFXedJrIezJRdJBrU0D692vIsENDFgR3SavAEtsUv8ubSp5FC2qB/nc2D3sbWsND+LZIu+X2d5AILQ7SPvP5SFJCc3tIR7jrHXTKEAPl4YAQ7PPylDAwLHql6lerSfuVGvVd9D79q/Z1k4pIXelz4OxlEZ6KIA+nD8VYOuWrDdJOGJYPwq1bhzu6uFMxNt9QK+DvesfT8E+BjUNrU2QEpojkA9EV/qQ4u5iEAtzm7Papveg4Po9e2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDlcEHngXxMxt+syJlISMtr1QNvTSzw9a+1gv7jXIdM=;
 b=nBca3p/jfVL2YVIo00fGXH9u3Gl5SP1TOrJ2iydl9Np3SkG5H3F4vDde26cejx4YGGiVHWp+8qHQNgRTu61e2CxhBRnFj+Ld5NIKM3jqUfCEWfOvrcVQnSmg2Vzn2Mr/Q5EI6IeHu0+kLnOg0qsDb1tDMnzVciMS/OMR4ogIHwyL48SGkpZ0BwXMabKqXiuQczKzpiq7YP5b0larLDf/GKtt9GdgRuI+bs9aQ6bvruRgLyJh0ukrXude7ivWtzW4Zv/g/qBOkw/cGFFRelA75pLFKVYqph8kV+cmfrTc45gFDMQpXzFBiyf7QEHDhK8nCDrw8srZ4b/a3uMZZ9Gmzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDlcEHngXxMxt+syJlISMtr1QNvTSzw9a+1gv7jXIdM=;
 b=dODsilFeMgnd4eApeB8bV5QE7rWr/ppG0/S92x+vWkIXNMSduJmUrNvtBu7AzlnQO+UOPMn/jP0RbqkOdNedyunmne3s+ueP5iMOIo+NX7IrNOyErAYS6Dc1nt7Q286QQ4sINZByxSxJ192S3iAR8i9pgs2qmBS93CsVWNz+E5yHMd0pgxlO+5jKxOAzmrmU0tl59xIF6GIcOL8M72lG0yFgbX5SdCc+lLxl6WjRzrlRwdwao9C4pGV7XCPUojRDfg9xxm8GemeeQRolzFtpgyhJ+sqFkwfzEg5UQwb4AVntU8gccNi/emlA2CoxJOKqxHeSdpDRFyuFteaZHabw6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 03:47:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 03:47:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 12:47:53 +0900
Message-Id: <DEGM8P88O2MV.3D4XL17AMWHJ4@nvidia.com>
Cc: <acourbot@nvidia.com>, <apopple@nvidia.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <jhubbard@nvidia.com>, <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, <elle@weathered-steel.dev>,
 <daniel.almeida@collabora.com>, <arighi@nvidia.com>, <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] rust: clist: Add basic list infrastructure and
 head iterator
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <airlied@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-2-joelagnelf@nvidia.com>
In-Reply-To: <20251111171315.2196103-2-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4P301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 65bba69e-9d7f-47e4-dca6-08de2b0c413a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|10070799003|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0tJcC9WMHhoUjArdUlwK3BHTTZYU2pqLzdpMVFpaEtXOHZwb0tKNHE0UVpT?=
 =?utf-8?B?WENKU1pWWllkQ3NyaE9BcHdFZEQvSkJ4QWhWMW1Wb1RnWTVsdzl2dnIxeWpz?=
 =?utf-8?B?QjJWQmFydFNYQS9BeGl1Rk94T1NaSDVxVEtCOWQxaTRvbElxK1lmcHBoWXhz?=
 =?utf-8?B?YkphRFJwTHpPV0dXM3RKcHhSaWNvd2xPUXlXN2NBb0ZGS0NnN3NscWdnM3p2?=
 =?utf-8?B?SHZyQ3VSQ3I1YmRjTkVmUlZvZ0lITWpQTm5xeTdjbW9MTGxURWQ5QmhQWkU5?=
 =?utf-8?B?Z1psUVpNM0taZThnM0JJWXkrMU9CYXQwa2U4RThoVjU4dFp1NVNQREVMZDk3?=
 =?utf-8?B?S3E5TFRsVHdCZjNDRzNONlhGZmdOZHc4dGk5T2R4MnJocURTSE9NSVRuMWp4?=
 =?utf-8?B?b015UWM5OEd2dXRrRG5BWURTZG9EMGQySnZnaXJCZzl5VnQ0azNsbCsxTmVC?=
 =?utf-8?B?Y29tcHhJS2dGSzM3TzM1Z1dDZENQVGV0Tk5HOHdqL2c1bWgweVoyc21Ba2RM?=
 =?utf-8?B?VjNWMDFEM1N6QTZEYm9UUDYwOFNHQzB0NDhjYTFSQzVLZitTMVpQZ1hkdCto?=
 =?utf-8?B?dTVydkNYR0tmbWdjdnVueE5Zd2hPSW8wRVY2RmtGUXV3M3lRK0dPL292NTJl?=
 =?utf-8?B?ZkRWckdGUDU4QVoyQVRBWTdGNUxqSm5lNWVJNmViU0swZXdsYmZkTXlCaXU0?=
 =?utf-8?B?a0JmSzFwY2grOExBdE5JblAvR05GSVNkTXZXNGgvL3hiOGtJcUN5NnF0bmpt?=
 =?utf-8?B?WHo1N2lUT2xEenpjVEFXNTlzb0VMWVdaRENoNGNmTUhXdHlKbzRIZzNLdysx?=
 =?utf-8?B?dzl6QUZXS2dOSVJQTWorMS9qV0UxdDRwQ0ZlRlN0V1NqZlZkM0dLdlJaZE1I?=
 =?utf-8?B?UVpic2podEkzRUhtWGQ0akUxOUI4SDA3M054WUpMa2I3U09yOHFGbmZLcm5y?=
 =?utf-8?B?WHc5THRpUTRvazY2UHk3UGxxeWprV0ZVclBIYk42RHNVVWUvQWJ0YVJwcGVE?=
 =?utf-8?B?WGs2TkJPOHVvTWRiaTNlbVFUa3lwdFowL0lYdHFWLzdOam4rYk12LzdDRjZE?=
 =?utf-8?B?aEV1alRXbE1Ub3F3N3ZVbHc5VTdXSUFBVDFxRHR0TGhWWlF1ZTY5NFhEVHB4?=
 =?utf-8?B?SXBNZUt2QkFYbVVsUFJFOWpwdWo5M0RudXRFSG5PalpiYXNyVGcyQjBHaXkv?=
 =?utf-8?B?ZkMrUzhGRWhCVC9Jb3JWcVl6dUdmREtsaDRwN2RNR3dNejFzekxZeXlPS2xF?=
 =?utf-8?B?QU9rRHZHSFlNLzlBV0E0WDZSVDI5cDE3cDk3SmFBRUIvUVZIMzhMYTZnQzEv?=
 =?utf-8?B?T1BVVG1ZWExYMGsrZVhrYzNweGVmb2lNcFlKV3NrcGZFaTNNSDlpRXpGd1JX?=
 =?utf-8?B?aGJBSWQxbWJKZ1dXWTl3R01XblpWcVI5UmY5MjFzVG9yS2JXYjBjbXkySERB?=
 =?utf-8?B?ZW1QOWZZV0o3NWNtMXo2alZmQlAvN2lCU0J0MjNTY1NVM1ZxWXh4dkg1NFRM?=
 =?utf-8?B?QzZLeStPc0N5UFd2L2w2bjM2R2J4eEMvRW4wQW9XTHM2N21XdXE3YXdaQm93?=
 =?utf-8?B?WGVBNXlrUHdjblp0bnpHZnlHMjgrQ1h6TnpzR2h2cklEaGZnTWoyMXIvWEh3?=
 =?utf-8?B?MEl3aE1iN3o1Q28wdTFDRjBqdmFuMkh3SWlQU2ErbU9mbXF1R3JDZTZKVC90?=
 =?utf-8?B?VnA1NE10N0VJeStGczBIWTdOdjEzcGZqZzdxekVVdnJmV2FNR21XQTNWTlho?=
 =?utf-8?B?Vk5NeVpFRUVINmpMWmxoZ21WK2M0R1BpSkl2L1VucnJJbld4dFdNei9YVDdh?=
 =?utf-8?B?a2ZZSmNOVEtzSm1pZ3FFbGljNk9NZ2JtZ0dxQm5iWkExbUo5TDAzWUpyYVVp?=
 =?utf-8?B?R3c1RUlLbThKSHo4RVV6eXpQd1NzYVZsdS93aG1kaU4yTDZMVlk5Y1pJZlFM?=
 =?utf-8?Q?T9hi7rANj29Lj10u6x8E2GNtAjReG632?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(10070799003)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUdLOVFvNDd5MHJNZER0eElseUNZZ2hrOXk1RHhuQkNkdmlsS2o5MHB5dkc4?=
 =?utf-8?B?aklEMDEwNkZDblVOSFFRTVgxTHluZ3NENFROZ1YvYTZuQXE1cmc0ZFBjUUNC?=
 =?utf-8?B?QTU5UHFkdHo2bDc2cy9rbGg4MlhKdHJKa2NOS3hxa2Vta2N5NjcrUWNNdld4?=
 =?utf-8?B?bVdQQStlNFJFN05Ib2YrZlFoelhScmNPbGsxaDdxYXNmR0NHc2pqcVhlL3Z6?=
 =?utf-8?B?bFVucGx1NGdBOUhuTlF4WWRuZUkrcnM0QmYyK09MS292cEc2ZS9hRHEwYmFx?=
 =?utf-8?B?emkvOUY3VDhzYTNQa2RyUEV4eVh6bWEwQVlwNHMxQ3c2Z21FNitrRDRkZld5?=
 =?utf-8?B?dFpFR3VwY0tMNjk4akZhYjh0UXBvdmtiNjhuaG9uTGtzTU5uZ2I0ZDRFYUlM?=
 =?utf-8?B?VWNPTFdGdndEQ2JUQzZZYWtoK3Fkczlzd2lRMUNPNnhNNlZGZERmT0RJeG9z?=
 =?utf-8?B?KzE1eEpEL3lESVg0QlVLcFgwL1Q1akM2N2NTTUpvSW44YTV6NTU0Zy81M3Vz?=
 =?utf-8?B?OU52aUVoemZiMTliSnQycGlEWVNTWlUzbEtHWlZXVjRlVHpkeEF2OHEvTGh4?=
 =?utf-8?B?TEZuQTZGNnlSTXo0THFSNVpoQTh1SVUrejJncC8xZ3BGR21oNWlzanpuV1Uy?=
 =?utf-8?B?YzlIWkkwMnZ0SFBPS0UwNWR6NU41WkxiOVE1Wm9VRitsb3V2ekhIaHBOZ1FC?=
 =?utf-8?B?Y0p6c1FNQ3I3SGc1dmFLeHB1V2dZVENIV1lsK3k2RzZQd0tyY3pLeHVnZEg3?=
 =?utf-8?B?ZmlBU2w0UjNIYVZ3bTdTc0tIYVNqMjZxdHNZekhLbFB0RlllemtpRXp1K1Fi?=
 =?utf-8?B?b09WRUFXL2RTVnBobm43VmdCQldSV1ZoOFYzOWp3OWIyS0tnL3hzWWlFZytv?=
 =?utf-8?B?UUFGNkhONnR0Skd1VExGbW1HUFRyUTNFSkxlc241NXFRa3FhTXVrQStYMy9K?=
 =?utf-8?B?MTlXcU5wT01oOTlYT2NsdmtPR0lRa1d6TjNCMU1heGhYOUk3M2s3V0c4UkdQ?=
 =?utf-8?B?N2pSZXk0VzAyL1MvNTllWmN2V3VWT0NuOXVmMXEvWmpkMFhYSG5xMjRVNzQv?=
 =?utf-8?B?R1J5YjVrU2xTS2xtSUV1YXdGVlFjQ3ZMWXFQdnZ5c01ZVUtYUmhOdW5laU9R?=
 =?utf-8?B?N04zTWhJR1crNTduQUQ3dVRBcFJlNWxwWjdGdkNoY0Rqa1lsQ1JCV0MzS2Ry?=
 =?utf-8?B?MzZGdVhhYm5UcjZuOXM1bEl2cDBXMVZvY3FPdWhUL050Z01sREplY2cwRElE?=
 =?utf-8?B?bS9QQkxEQ3NCL0Q5djZrMTFld096YzZZSXBMRG0wNjNvTjZjNDdabUptMTN6?=
 =?utf-8?B?R0NVbndQcWxic1JGcFk1Z3pWTURZR0syUXk2ZHBPK1NObmRFK1paY0FxSUx4?=
 =?utf-8?B?dzlPVVc2SUhZZjhOb0NiU0wvcytxMlVxWXlLcmtkR2psbk54NTFLTlcxUXJ1?=
 =?utf-8?B?V2FVaFl4WGo5Z2Z6TnV3SGZyL2gveEQzTkliR0h6bTRIRlNFbGNrcWVUcS82?=
 =?utf-8?B?TklNckxRMyt2Zk9BeEVpb2g3K3FvWGZrMlVDM1h0Yk5pV0FhNEtUTkZVRjNO?=
 =?utf-8?B?Zzg3SnppTnNESVhQV0Y1em81U1R3M3lZUnovSVAxdVBPeU4rQ0VSd3N5N2lF?=
 =?utf-8?B?aldXNFppYUZTSHpFWDhjbFA0TlJTVzdGaGhQTVNDYzJWazc4OVZpaGNpMVlB?=
 =?utf-8?B?ZWxyZHNjVVZQRWwyTHZKczNhMFNjNGVTRzFKdnFOb3lKNEU0MjRuYXpIRGNG?=
 =?utf-8?B?SCtwamQ2SDZKUVpFbXlQZ0RDdmlYdUdYd1E0YXhVSGNHSHZVS3ZEQ0dBSTY1?=
 =?utf-8?B?aXZXN0NSbmUxeUJIZUFPU0hwM2ltTlg0cTk1S2dpQ0lmMWtwV1g5RXpNM1RU?=
 =?utf-8?B?NGlPVFVsbzdXbUJPSFd1WDd2Z0xNOW9NTENJYUQ4elV4eERtM1YvTFMrenha?=
 =?utf-8?B?R1YyK0YyRmpDK0pGYkJwVDgrZVZkYVRxQlFWNkIwcjJoQ3RKVTJhUm0vVTBp?=
 =?utf-8?B?Z3ZsRTZsQ0dYNUdiNXVwUnhtSUVXTHN5MXYwNldNVllySHRwMVNGMjZ0TWNO?=
 =?utf-8?B?VUxJQ05JK1ZYNmR2T3lvNmVxYVVvQ2pPcXhNeCsvbWdDaTljblhNWUVIVnVQ?=
 =?utf-8?B?aWNuK0MxeDhHOUlkTFRVV1dFUFFQNUdITjMrUU9BQWhLVFgwek9KbHRBOXlt?=
 =?utf-8?Q?2CWVnlY8uMpDw/+SmpMpRWnO4o0reTtHT3w27FSUoR6F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65bba69e-9d7f-47e4-dca6-08de2b0c413a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 03:47:57.2463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1VCKsepVl5q6D9386lj15wSAWpcmdkycyLzTL58ECuGTJUYrYseMQYjALuhtbCbD9TQ2orml3GTky2kRbAnNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148
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

Hi Joel,

This low-level layer looks mostly ok to me, I will have more comments on
the higher layer though.

On Wed Nov 12, 2025 at 2:13 AM JST, Joel Fernandes wrote:
> Add foundational types for working with C's doubly circular linked
> lists (list_head). Provide low-level iteration over list nodes.
>
> Typed iteration over actual items will be added in a follow-up
> commit using the FromListHead trait and ClistLink mechanism.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  rust/kernel/clist.rs | 190 +++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs   |   1 +
>  2 files changed, 191 insertions(+)
>  create mode 100644 rust/kernel/clist.rs
>
> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> new file mode 100644
> index 000000000000..5ea505d463ad
> --- /dev/null
> +++ b/rust/kernel/clist.rs
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A C doubly circular intrusive linked list interface for rust code.
> +//!
> +//! TODO: Doctest example will be added in later commit in series due to=
 dependencies.

Since it is added in the following patch, I guess we can do without this
very temporary TODO. :)

> +
> +use crate::{
> +    bindings,
> +    types::Opaque, //
> +};
> +
> +/// A C linked list with a sentinel head

Nit: '.' at end of sentence.

> +///
> +/// A sentinel head is one which is not embedded in an item. It represen=
ts the entire
> +/// linked list and can be used for add, remove, empty operations etc.
> +///
> +/// # Invariants
> +///
> +/// - `Clist` wraps an allocated and valid C list_head structure that is=
 the sentinel of a list.
> +/// - All the `list_head` nodes in the list are allocated and have valid=
 next/prev pointers.
> +/// - The underlying `list_head` (and entire list) is not modified by C.

These last two ones look more like safety requirements to maintain for
the life of a Clist than invariants.

> +#[repr(transparent)]
> +pub struct Clist(ClistHead);

`ClistHead`'s definition should come before `Clist` for clarity.

> +
> +// SAFETY: `Clist` can be sent to any thread.
> +unsafe impl Send for Clist {}
> +// SAFETY: `Clist` can be shared among threads as it is not modified by =
C per type invariants.
> +unsafe impl Sync for Clist {}

These explicit impls should not be needed - as `ClistHead` implements
`Send` and `Sync`, they will be automatically derived for `Clist` which
just wraps it.

> +
> +impl Clist {
> +    /// Create a `&Clist` from a raw sentinel `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must be a valid pointer to an allocated and initialized `l=
ist_head` structure
> +    /// representing a list sentinel, and it must remain valid for the l=
ifetime `'a`.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Sel=
f {
> +        // SAFETY:
> +        // - `ClistHead` has same layout as `list_head`.
> +        // - `ptr` is valid for 'a.
> +        unsafe { &*ptr.cast() }

Let's reuse `ClistHead::from_raw` here.

> +    }
> +
> +    /// Get the raw sentinel `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.0.as_raw()
> +    }
> +
> +    /// Access the underlying `ClistHead`.
> +    #[inline]
> +    pub fn head(&self) -> &ClistHead {
> +        &self.0
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        self.0.is_empty()
> +    }
> +
> +    /// Create a low-level iterator over `ClistHead` nodes. Caller conve=
rts the returned
> +    /// heads into items.
> +    #[inline]
> +    pub fn iter_heads(&self) -> ClistHeadIter<'_> {
> +        ClistHeadIter {
> +            current: &self.0,
> +            head: &self.0,
> +        }
> +    }
> +}
> +
> +/// Wraps a non-sentinel C `list_head` node for use in intrusive linked =
lists.

This says "non-sentinel", but `Clist` embeds a `ClistHead` which wraps a
sentinel node, so that statement does not seem to be true.

> +///
> +/// # Invariants
> +///
> +/// - `ClistHead` represents an allocated and valid non-sentinel `list_h=
ead` structure.
> +/// - The underlying `list_head` (and entire list) is not modified by C.
> +#[repr(transparent)]
> +pub struct ClistHead(Opaque<bindings::list_head>);
> +
> +// SAFETY: `ClistHead` can be sent to any thread.
> +unsafe impl Send for ClistHead {}
> +// SAFETY: `ClistHead` can be shared among threads as it is not modified=
 by C per type invariants.
> +unsafe impl Sync for ClistHead {}
> +
> +impl ClistHead {
> +    /// Create a `&ClistHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must be a valid pointer to an allocated and initialized `l=
ist_head` structure,
> +    /// and it must remain valid for the lifetime `'a`.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Sel=
f {
> +        // SAFETY:
> +        // - `ClistHead` has same layout as `list_head`.
> +        // - `ptr` is valid for 'a.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.0.get()
> +    }
> +
> +    /// Get the next `ClistHead` in the list.
> +    #[inline]
> +    pub fn next(&self) -> &Self {
> +        // SAFETY:
> +        // - `self.as_raw()` is valid per type invariants.
> +        // - The `next` pointer is guaranteed to be non-NULL.
> +        unsafe {
> +            let raw =3D self.as_raw();

This line doesn't need to be in the `unsafe` block (also applies to
other methods).

> +            Self::from_raw((*raw).next)
> +        }
> +    }
> +
> +    /// Get the previous `ClistHead` in the list.
> +    #[inline]
> +    pub fn prev(&self) -> &Self {
> +        // SAFETY:
> +        // - self.as_raw() is valid per type invariants.
> +        // - The `prev` pointer is guaranteed to be non-NULL.
> +        unsafe {
> +            let raw =3D self.as_raw();
> +            Self::from_raw((*raw).prev)
> +        }
> +    }
> +
> +    /// Check if this node is linked in a list (not isolated).
> +    #[inline]
> +    pub fn is_in_list(&self) -> bool {
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe {
> +            let raw =3D self.as_raw();
> +            (*raw).next !=3D raw && (*raw).prev !=3D raw
> +        }
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe {
> +            let raw =3D self.as_raw();
> +            (*raw).next =3D=3D raw
> +        }
> +    }

Does this method also apply to non-sentinel nodes? If not, should we
move it to `Clist`?

I am also wondering what the difference is with `is_in_list`. If
`raw.next =3D=3D raw`, then on a valid list `raw.prev =3D=3D raw` as well, =
so
it seems to be that `is_in_list()` is equivalent to `!is_empty()`.

> +}
> +
> +/// Low-level iterator over `list_head` nodes.
> +///
> +/// An iterator used to iterate over a C intrusive linked list (`list_he=
ad`). Caller has to
> +/// perform conversion of returned `ClistHead` to an item (typically usi=
ng `container_of` macro).
> +///
> +/// # Invariants
> +///
> +/// `ClistHeadIter` is iterating over an allocated, initialized and vali=
d `Clist`.
> +pub struct ClistHeadIter<'a> {
> +    current: &'a ClistHead,
> +    head: &'a ClistHead,

IIUC `head` should probably be a `Clist`?

> +}
> +
> +// SAFETY: ClistHeadIter gives out immutable references to ClistHead,
> +// which is Send.
> +unsafe impl Send for ClistHeadIter<'_> {}
> +
> +// SAFETY: ClistHeadIter gives out immutable references to ClistHead,
> +// which is Sync.
> +unsafe impl Sync for ClistHeadIter<'_> {}

`Send` and `Sync` will also be auto-implemented here.

> +
> +impl<'a> Iterator for ClistHeadIter<'a> {
> +    type Item =3D &'a ClistHead;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // Advance to next node.
> +        self.current =3D self.current.next();
> +
> +        // Check if we've circled back to HEAD.
> +        if self.current.as_raw() =3D=3D self.head.as_raw() {

Maybe derive/implement `PartialEq` so we can avoid calling `as_raw`
when comparing nodes.

