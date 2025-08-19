Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E0CB2CBA3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 20:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F2A10E104;
	Tue, 19 Aug 2025 18:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V+G2KCuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90A910E104
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:06:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuzBHckx56C/HQf+XEhbCnTqwXFrnZVhiQ571wDXuqPnRtrDE3hjgv+gbKz4w71arrO8sbOJlEZd4jshRhzQZBnPfctUzguh1d/FHwdU8AJ/Ck98uEsLGK2b67EpselgX2h38IU1O8zFUfosEJ9OGSI4IMac86cjDwn22N1iBsmL6wx/9ActP2QmJjQTgFmBEzQyLw5C4nnVZnIooRURLHq20iAeBi5pNzqg8qlZSRJyIn509cxp88JdbiHPAPbLorQvUHcjUT80BX/nRIvO33q1trtomTTElb6mRWpHUGVGYTG+xWOsi+5yzHW0vlD5dEGuvEfwK59V4W1T7wSp3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHILA0pQmupDBnbcaF5e9To4kbBMMvjB34vkQgRx5/c=;
 b=oMNmTaBD4/dYO2VpBZBUZYC/VoIEGogN3EvjMFI/J09sWWW5QvkacYe5NuRg5QfiQV5zbGvqXEhDZSERbvGw0L/wo+KUsNBIulU4aEntetyYiCEw1YtPVYMFPIt+/HzyXINfOcZzY6gMfWZvPWz9mlz18gjpNzkmgmIpRrQcDnagPCGHp7bRA8cjVeI0lJ9RwjELNDcrtEh4PPbI6847ozkPHOlwhFjz2Hm0x+7Buh/B8F8iejYCl/F3k+wS/guJF9xz4h3Fct990hm7XCOAbQMFW4498MqT6UqcWBIIUpTMJ51rKqqPtGF1a9PKYvS9sPu28uNuE+z2NNU6ECvB0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHILA0pQmupDBnbcaF5e9To4kbBMMvjB34vkQgRx5/c=;
 b=V+G2KCuVA3+TbVHG4j1zeTCZfG2asdQ0tIZadpsID+7JFGg2Miu/+eWWsg0pcSb2rOG2hUAecRrjRsUMONjr/aaMaJzNgK17FQ3kYCh42+1Af35QUJY0gubD+HCx4OrdqNyq/nXzgaGZwjeNsaeyk9v/Bydr0+PQl85LWs8xgkhIKezHearxcdUIdCpyGF0XvTQ0Y5NvPiWqDJ6Vdn2nFcfPm3O4MwvTJZeSUsVHFoCpjs92ztHe/F0HnwoQ4UoO5hfFEXddO/vdSqjugz85ZK/EcKFOto5aOXfuiOMePusAAZDrK+E+ZMkSPokcyesHX+HgavM9pjVo5ecUEqm8fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13)
 by CY8PR12MB8242.namprd12.prod.outlook.com (2603:10b6:930:77::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Tue, 19 Aug
 2025 18:06:39 +0000
Received: from IA1PR12MB6484.namprd12.prod.outlook.com
 ([fe80::fb8b:583b:154:76f6]) by IA1PR12MB6484.namprd12.prod.outlook.com
 ([fe80::fb8b:583b:154:76f6%7]) with mapi id 15.20.9009.017; Tue, 19 Aug 2025
 18:06:39 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <cyndis@kapsi.fi>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Syncpoint interrupt performance optimization
Date: Wed, 20 Aug 2025 03:04:16 +0900
Message-ID: <13097016.O9o76ZdvQC@senjougahara>
In-Reply-To: <20250707-host1x-syncpt-irq-perf-v1-1-16d53e516895@nvidia.com>
References: <20250707-host1x-syncpt-irq-perf-v1-1-16d53e516895@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To IA1PR12MB6484.namprd12.prod.outlook.com
 (2603:10b6:208:3a7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6484:EE_|CY8PR12MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: a112f9c6-7751-40b7-06d7-08dddf4b24c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eW1LTnhZMXl4REJBMXRKU2gzcDYvSWl3SGtHYjEwa21PWEh4S2Z3NWRFNVQ2?=
 =?utf-8?B?SG96V0VNL2NVdWRUR2NDdU82cUpRQmFxaWpJTjZtQ1VPME42VHBldUt6R0lT?=
 =?utf-8?B?eU14ckx5WDk4WVZSVFlmdm05QjFSU0pjT3BVTWxYSXZDUG5kVllpalJCQ2R1?=
 =?utf-8?B?NTRKVVBhaStkZlA0c1JzOVhIMDZ4MmhCc3c4dHVMbWhIbE9TeUhmT1lOdXha?=
 =?utf-8?B?NWZ6QXBhR0h4SU1vTlpsS216T0dNVGRWbHFJZm1SWWhydzhveXFOdnY0dHZx?=
 =?utf-8?B?SGx4alJLVWVxcDF4RDdCNHdTZXhBNEtNNEQ0WXhrTmpmWnM5cDgxamVwdy9s?=
 =?utf-8?B?ZWRsSzRCdDdERHNIRHlrSGg5LzJnMkFhU3RwVXF4RVBCaVNvbGJvRHFkTTAx?=
 =?utf-8?B?RTRaeis0N3JkK0l4N3UyL0lERWZGbXZjNFFWZmZGb3puWkdUUWluMG43aURs?=
 =?utf-8?B?NHErWXdOWVp3a2EwcUhJQUc4VFVHNWx2MStMTlY4T2o3K0RYRi9BdjBnU2hI?=
 =?utf-8?B?ZHVJVkpRQWxQRHUwRUFyRjh5NXRBODBFOUVVZk9DdSs1TzBtYVlWb3ZWWGtB?=
 =?utf-8?B?YmV5OERuWjlUZDBsRmZwZHY2SWxtQmlhZW5ub2VvczNabDdNcGtUc0F4SHdo?=
 =?utf-8?B?VmhZOVIramFNRUlCb3VTWXNuQzR5MnR2VytzWUZkMUo3Nis5dDI4R1RDUFJO?=
 =?utf-8?B?OTN1OG1Fa2piZGsvR3VTcWJLZ2YyZUoyY2g3VHZzZ3N1NHdDSHFwekdZTEV5?=
 =?utf-8?B?THEwUnRDdGtlT0pNOHYyTVZxY01iSFdYNm92Q2tzM3E0b3JteUNWYzlPS1pt?=
 =?utf-8?B?cWkrNk1ubmk2bDV2VXozRERsQURrYzNzdlZ4KzVkYlVMOGNod1lLdFNBUkFl?=
 =?utf-8?B?RHR4SzlBT0xiTlAvbjMvZUQrZFVWbi8rVC9SSXNBaDd0emJsQmtSKzFLeVJp?=
 =?utf-8?B?RDNXUzdxZXlsQ1FzQjBVSVE2Z3UzaGx3M3dRaUV6MXErdTFwVUIxeEpIWk05?=
 =?utf-8?B?TlIxQitkdjRVVkF4WEdJNFcrSEVRdU1IME9nbFlFMU02aUdIL1dyTzluQ0Nj?=
 =?utf-8?B?S3dIdkhTTUNrZ3RuaERUMFQzOFFsZDYreVZuRFd3NGJDWTBEczZpdm9RKzFq?=
 =?utf-8?B?dHNPL0t4bGdQdjNGaTZ5MHBmdEpDSEpYTHhZeFFSb05DbkNYaCt0WkRFTG1h?=
 =?utf-8?B?OENCSndhTjZiQkdrU00vY2IwMzBFWXpGTklrOFJsT3J0TEMrRHkyMEkvaitF?=
 =?utf-8?B?aDNGWVpoY0p2bWIvRkRpOWtVRTQ5OWVjd2lJUGJsRGZLWkp2VmRzam1FZUhW?=
 =?utf-8?B?NHVpdjlLcCtPeFhiMmJBNGhqaWtOa2RLRDlDcW03TkRSSE1IUXFTS1pKbnNl?=
 =?utf-8?B?WU1YRWFBeVYrSkZycFB4eFlaTUhWSHZpZCtCTWJkQmdrc3JPOWd2Skllb0Ro?=
 =?utf-8?B?Y0I5S2dJYzNVaE1zQ20vRjRKUnVXNlVlQmJ2WG9hR1h0S3VxQmg0dnJITUla?=
 =?utf-8?B?aXc1S1VwY1FVTEx0bnJQZUh5ODY3bm5kdXJydTFBaW9MOUVyWVdIenR5SEwv?=
 =?utf-8?B?TlhrSjlEWlVSVUoweEJ3VWJtS0p5dFJMNndOeG5kV29McmZONDVIcUxaUjNK?=
 =?utf-8?B?QkE2bmx1MDBmZi9peWF4NW96VVJuaklIQ0tIa0NHWG1zUHBWeDlNcXFGVjc0?=
 =?utf-8?B?eFlpM3BIbnUxbEVGU2lqbTdqUURkSnVZbFd3U3RSb2pDZXc5MU9OOUk5akxx?=
 =?utf-8?B?aDYvaTZ0dzdDSTY1eVp1NDhKODU3aEpNRys0U2hMUDNwZFRZT3J2WmIrZ0xE?=
 =?utf-8?B?VGVSM0pNOWNYa2lZZVAya0doM0dDcDZZaFE4R3ZJcWc2MmhiMEFUcXA1Q1Qr?=
 =?utf-8?B?dVFkRXRNWEEvRU9CU213ekJMa0hnT3N6T1B2OWNTbXZNTEl4aEFhZG05ZHBo?=
 =?utf-8?Q?FvqhbS8sr0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6484.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDFrVWh5N0VSL0NrdXo5KzdHQ1htZ2lGKzNOVmgwNU9DTVFSVnk3MDkyWko5?=
 =?utf-8?B?SlhYK1FJNjVZejNsZnZDMHM1YUhJVG1udHZOdUlUN2haTWZuOHJiWXZEOWoy?=
 =?utf-8?B?ajZnTEkzbEpFeHlYTWdtKzBRTmN2ZTBPODV6eWtSdmV3UWRLdXJoUmc4NXZw?=
 =?utf-8?B?V0pSL3h0cDUrNjRZRVdINlVyTHF5WllENnNya1IxNHBHSWpwZDU4QTVHbmMr?=
 =?utf-8?B?OW1KYjZHT3FYL1ZjUldqT3kvR01MMVB5cm8xbXJQZGcwMFZUL1V6WmF5VU1D?=
 =?utf-8?B?RTBSOTBRUmJsYVdsL1NKUm5VTUZ0aTBjSlFJRkR4SE5YQWw5K1BPalN3eGZC?=
 =?utf-8?B?S1hTeGpJYmYxbURUZHViVkE3b2ZSbklBT2lTSFdGQVJmbEdTK09nc2x0c3Nq?=
 =?utf-8?B?SFl6U3YzN0hJUDVCaUpUa25RUG00dmVXZEN4NmE0Nlpka0w0TmptWVM1cXl0?=
 =?utf-8?B?dUpPa2xiZmE4QkdWdW9hK0pTeU83MXpjdy9BSS95TVYwMDU5YVdVa0wvUFYx?=
 =?utf-8?B?UUt5MVhCWTFNOG5zTFhVVy9ncDhvd0x3T0ZmTFAxQWRwRm82TzZYK3hyei9s?=
 =?utf-8?B?dC8xMFpOTy9HYW9DRXhoMkNhSGpQUHFrM0cxUU51a1NQUFdjcFFJQWx0RDFk?=
 =?utf-8?B?aGN2TUhsODJKOUhFd3JKRnFNcEVrdUxmUTVON2VzUXVoZ1dLbTBYV2FmajZi?=
 =?utf-8?B?a2dZYkJiR1hCR0NDUFlkTDZ3dWlyN25hbmNLUUIvc3A0VVNXZlNEMEJ3MkIy?=
 =?utf-8?B?TnlQV0NsRWxmdzhoRkRPRXlXRk9XTUEyRThDdkJxRSs5cEtnakdzbXZqeTNC?=
 =?utf-8?B?cmtGYmxKRjFCeVlKdlU1Zm1rNVhoTkNUaEMxMlkzNlQ0Q2NOWnpnNDlBKzNJ?=
 =?utf-8?B?cjV0L0hIWFBvRlJITnN0cVlRdnZjRzk2Rmg1M3I5Q3UvWXJhWFk2RW43QUY2?=
 =?utf-8?B?SzNrSm5LTjRwV0gxZnRFTGlBcjRCVWh5UXNQQzVpT0hTNHVDRENURWZubElr?=
 =?utf-8?B?MXZqOFd6dFdGWWJOSEYwSjY1Q2k1YVdXQ24rWmsxWFRqcnlSRjdPNERKOVIy?=
 =?utf-8?B?TG1HYTFiNFptSjVuTk1EQXFzbENaMGdDcWlMNy9JODE1Z0tueXl5SWNFRmRk?=
 =?utf-8?B?c3ZzZXlKTEgvT0V6ckVJMytpRjZvNHZYak40YVo2NkpRanBtUERHL1NZTDMv?=
 =?utf-8?B?TnlOajY2RmhPbmRGS3NJQjROcDltN0VtVm1ySVdoRE1jMjNVeWRqeUlXZnpJ?=
 =?utf-8?B?dG1UdmhxM2dpZ2ZpcUxXUFByUm5TN1NWZCtWYjRiM3NBY2FJR0kxaERCYkRQ?=
 =?utf-8?B?OXBQdm5td1l3TmJPaVlndFJJaC83QnJIVytIYlUvOHRDRFNpR21rVWZ3MERk?=
 =?utf-8?B?TEFNaHMvRDZzMHFwZEJkT3N2QlV4UW5sOTJjSVVpMUZEdHdPNnhQSFQ5bFlR?=
 =?utf-8?B?ZU9NdzNxQjR2T2w5V0VYTDdCdHhxV0RKT3huWG9ORjJBZkI3eWY1b1IxcHkz?=
 =?utf-8?B?ZmFiTmY2dS9FUkNMYVFRbTZZeVpYQmcxYzVKY01UYnJjTERTN085c3Z4cUJI?=
 =?utf-8?B?UnFNUFRxSjR3d1Q1cDY3UmUvaGpQTVpsRzlDWDRpc01SL2x4cW0yVmx3Y3Jz?=
 =?utf-8?B?WHQzMFpROXRUQUxiOU9DaVlINTFnWjJ4d1VNU2prWk5xcGdrUUtkeExaRXFq?=
 =?utf-8?B?dkpaVzlHTjJ6c01rRFREeGhiS1d6V0RwSEdQRnk1RWpuYmhrRkY5YUd5ZUl2?=
 =?utf-8?B?VGtlcjdUNzhOQjV2WUx2K1NLYkdtSlNQS1VISWVma0E3b0FCeW1oWi9QSXh3?=
 =?utf-8?B?S0NMK2c0alJ0aVlQWUZ0ZDJnZkd6ek9ucHk4QXVOcFZQVWdGU25OTTI1UmhN?=
 =?utf-8?B?elNEUzVMTGU4TGwwRXNBcDRLR3U1YktqaitiRzc4TmpTMFMwUWZCbFF4WEp4?=
 =?utf-8?B?bXFvTlVzWkxweGJ6enl3M3hXcEhVQ3pBV0tpVkZZUXd5T1cvbjNXblVpQ2RN?=
 =?utf-8?B?dVIrcXlxeFlMSW8rTk5UVVQwZ2dEaFAzMjlSSjd2Y1J2bHhVUEQ1alZLdkx6?=
 =?utf-8?B?VmJ5aGsra1FoTWpVVitCcHhjbm9uNnZrbjVIMjBRN2QzZTJpbGRUS3AzOGgz?=
 =?utf-8?B?bW02MFpmcUxIdEJZNzhGbWxtUDh1RmxXNTZ2L3pNMFVybzNaNTRWS1cyWXhY?=
 =?utf-8?B?eXp0Z2tEdWtReThRLzd2cFkySEg0Nmhwd25CR012aDlZQUNBRlkzdUFyWkd5?=
 =?utf-8?B?UGFvK3pmS21SdUdlOTUyb255c3B3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a112f9c6-7751-40b7-06d7-08dddf4b24c8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6484.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 18:06:39.2935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gURSFhUodedqDKMgIhZQglVT4jWwlbIRXr8UlMXEFq5aN7C8jfQUI3bVEx7iq+kuwWa7RlZNSfUDVCOkT4xVcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8242
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

On Monday, July 7, 2025 6:58=E2=80=AFPM Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Optimize performance of syncpoint interrupt handling by reading
> the status register in 64-bit chunks when possible, and skipping
> processing when the read value is zero.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c        |  9 +++++++++
>  drivers/gpu/host1x/dev.h        |  3 +++
>  drivers/gpu/host1x/hw/intr_hw.c | 40
> ++++++++++++++++++++++++++++++---------- 3 files changed, 42 insertions(+=
),
> 10 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index
> 1f93e5e276c0835eac2f713ffcd60a9db8db2c21..80380b6138276877be9709048c15da8=
5d
> 079f977 100644 --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -71,6 +71,15 @@ u32 host1x_sync_readl(struct host1x *host1x, u32 r)
>  	return readl(sync_regs + r);
>  }
>=20
> +#ifdef CONFIG_64BIT
> +u64 host1x_sync_readq(struct host1x *host1x, u32 r)
> +{
> +	void __iomem *sync_regs =3D host1x->regs + host1x->info->sync_offset;
> +
> +	return readq(sync_regs + r);
> +}
> +#endif
> +
>  void host1x_ch_writel(struct host1x_channel *ch, u32 v, u32 r)
>  {
>  	writel(v, ch->regs + r);
> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
> index
> d3855a1c6b472a9bd289c753d79906463e6bcdb4..ef44618ed88a128bae9ab712bf49f8a=
bc
> 0f3b778 100644 --- a/drivers/gpu/host1x/dev.h
> +++ b/drivers/gpu/host1x/dev.h
> @@ -179,6 +179,9 @@ void host1x_hypervisor_writel(struct host1x *host1x, =
u32
> v, u32 r); u32 host1x_hypervisor_readl(struct host1x *host1x, u32 r);
>  void host1x_sync_writel(struct host1x *host1x, u32 v, u32 r);
>  u32 host1x_sync_readl(struct host1x *host1x, u32 r);
> +#ifdef CONFIG_64BIT
> +u64 host1x_sync_readq(struct host1x *host1x, u32 r);
> +#endif
>  void host1x_ch_writel(struct host1x_channel *ch, u32 v, u32 r);
>  u32 host1x_ch_readl(struct host1x_channel *ch, u32 r);
>=20
> diff --git a/drivers/gpu/host1x/hw/intr_hw.c
> b/drivers/gpu/host1x/hw/intr_hw.c index
> 415f8d7e42021b791550ca719adafa088cd34101..fe45890a9bfb1dfcbc0354f76d625e7=
8e
> 72ee548 100644 --- a/drivers/gpu/host1x/hw/intr_hw.c
> +++ b/drivers/gpu/host1x/hw/intr_hw.c
> @@ -11,26 +11,46 @@
>  #include "../intr.h"
>  #include "../dev.h"
>=20
> +static void process_32_syncpts(struct host1x *host, u32 val, u32
> reg_offset) +{
> +	unsigned int id;
> +
> +	if (!val)
> +		return;
> +
> +	host1x_sync_writel(host, val,
> HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(reg_offset));
> +	host1x_sync_writel(host, val,
> HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(reg_offset)); +
> +	for_each_set_bit(id, (unsigned long *)&val, 32)

Casting the u32 * to unsigned long * here is no good since for_each_set_bit=
=20
will still read in unsigned long sized chunks. I'll send a v2.

Mikko




