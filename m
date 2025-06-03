Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86864ACC65D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BF410E65F;
	Tue,  3 Jun 2025 12:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NkFjPMdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B81810E6C7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 12:21:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jh9gkua29LZJGNoZ58FSa3cr8iWmxlriuTFRCQUdxznPvp3RzL/n9lii1pncuMp3scnLoTtijZWzQyAG+6fMRL51ed7tDjyTzHhTgzFpa2Oyoi7g7VtVOt93IvC6znR9mgc1UU0mrTEX/Wirm3JXxwN3LYzTc/HRlTtS2vZe4b7Itifmw7rJVW30FFJ5fhld/u857n+coB+0AGt5kGgLZkAhc+sDhwwqHctRzeevR4OONcRQ1CZkEFwf3e0y0bRGUHXMm6rfomNgdX9bEF5FkRhI+HTRgygrTII/IgO1lWpdk9N9KzpjufaLqeIUfeDztpA98JFrFb3wxoLg6zfbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eclabr97XJTSzw3uZDSXRFmwfvNHB4pPDCaL69rXd7M=;
 b=h0wEycZaNj3ZcNf96b+P2su48DLu5pwfIzsIPJiEVJyGdffLkmrZvzwtXK3zaiDQshM2jDLxPmG448tl9AHKwiEVHceinLQIeFTYo+Nt+GnKBLar7CjpOSBGTWxQynZCkek8q94SBu62RgarH+wLw1HOz7LadprHumh39P4vcFYuBEF9Udln+Iatmc0uWD+Vm9F2tvRUS78GtBo9AUi2mzuvDuq9xZbQo3EM/5N7ZL1chUM5wSGl8Gq7c9yD2f/J64Q259N6vumj/oohEHCt96ECTv/N0pqOTizMXmM2ZTgksdNHKPNei1sjKefXsOZctO014kMEo3GX4hOX35KRJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eclabr97XJTSzw3uZDSXRFmwfvNHB4pPDCaL69rXd7M=;
 b=NkFjPMdM3Im3emwF0ek7a01KbcKAsagnLwa4uejEnLWKTXOS1p9+WlKIpudo3wRZI9lSDOzvZtXTcSxGEPojoZMvStcWBOPatb//3bsc/etmrTUmz5W8bue4oIwmCQYB95rpqKZo1HU7CGOSqfYIytF08IJev0UTErXcOJM/Cxqx3VW/cwyrO4ecHjNybXy9KOL2eSmFiT8av1xEztWuy1cZ32gG/9CEOiSAj8YrrfdgVx/SXsJP0zkN3CRgGtxs4j25arzlu4B7bIIbhw8xIptLumTCubYParENuemqtjaRGWk7QiKrgTF03nrHW6QE6srFq96rLQ6gPX8va8zxtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB7936.namprd12.prod.outlook.com (2603:10b6:806:347::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 3 Jun
 2025 12:21:50 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 12:21:50 +0000
Date: Tue, 3 Jun 2025 09:21:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kvm@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 iommu@lists.linux.dev, kevin.tian@intel.com
Subject: Re: [RFC PATCH 17/30] iommufd/device: Add TSM Bind/Unbind for TIO
 support
Message-ID: <20250603122149.GH376789@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-18-yilun.xu@linux.intel.com>
 <yq5awm9ujouz.fsf@kernel.org>
 <aD6UQy4KwKcdSvVE@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aD6UQy4KwKcdSvVE@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: d40958fa-22c1-4156-39d3-08dda2993771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3dPd3BUamZzMVNlbWl4MzdNZkRlWXozUTY2TzVMcGg0blVTVUJqUEJkbTlz?=
 =?utf-8?B?eEk2VldraUV1Z2k0a2dGclRGSDZ4OE5ORkJHdGh2NTVNL1dSY3l4YWRoOEtG?=
 =?utf-8?B?VmZYN2VUSkZYZFg1SUdadnRDTTJxc3BzcDV6YkZSeFVjWnU3SW93amg4NVpL?=
 =?utf-8?B?djY1MHBUbVJNQjBQMmYxV2tIVW42dHdtQUpVNlBTYk5nN2xWUGtJczF5T3Zr?=
 =?utf-8?B?ejJzTy9qSDNKbmVBVzhKdkxaclY3Sm93Ry9vcmVZOVVHbVVmRW1PTUV1Nmg3?=
 =?utf-8?B?T2I2VWRucHZWckNzalZRaHFkSXR0ZTFKZVVWQ09PcUU5Njh4S3dkYW01bElP?=
 =?utf-8?B?TlphUFBremkwUC9qS3J6MzBIYnZYMDhJd3pBMTN5YitLNDlpTUF2SUpWbVFZ?=
 =?utf-8?B?OGJsaXI0YlFmWVJwYkNTclhxUGRYeENJY2k2RHhRdGE1R1RBSVNSTU5Yblc5?=
 =?utf-8?B?cnpUaW1vMEFGM21JZnJ0SnB0SGxQQmN4Rm5hZDB4dGQwTHZtNWNzbFlIZW5O?=
 =?utf-8?B?blRhV1daRzg3dFVrUmZWSWJ4TmIxdmRUK215ZS9vRklQUWVhSmdJNmgwQTdI?=
 =?utf-8?B?Ti9lQ2NtTkl0ZVN1RGtKQ3FnTTlPNFYzK0VaYXFUMVNqZCtDUmZYQitKUDR0?=
 =?utf-8?B?cERGaVIzd2dZcU9tSnZza1Nid1VYY0EzaUZMY094V1hKanBjK3ZpMlRSaE1m?=
 =?utf-8?B?Y3UrWmlyNUl6VFBWWGFEUHVWdGJvL3FlOFVTbFRqdTVDdllTUUI0bExvTk12?=
 =?utf-8?B?cWJ3VXQzaEFEcDN1R1grSkdSOFJZZWkrMUUwRENIcWVqUkk4cWV5UHd0a25W?=
 =?utf-8?B?QWVEY2w5RmNqTnZTbEhRaTNRWXYyZlVwcS93QXdCUW9vVHZTeXd0SllmYkFG?=
 =?utf-8?B?Wk1STVhVblV6M0xaZlJONzI1VFFmYWNLUThiRnVibFV3Um1UemM3eTMvTWZU?=
 =?utf-8?B?OE4vZ0hEQjhBK0Y1cyt1dXcwQXJjVGZBODZqOG14NVdtKzlhelJjcU5WSGVO?=
 =?utf-8?B?ZGZyRHR3V1h0bDFIcWpJeUZMa0VwbHZKZ2h4RjB0MmxwNkxLN3JuZVNEVHo2?=
 =?utf-8?B?OUpyYXg4bjRUVm9jdjlBWU5OOWIrT2RIVEJQcThkbHJka1JhYmtkYStFb01q?=
 =?utf-8?B?MHBoa2RmcEoreCs2MEU3MEoxdHVqRG5ER3lSZytSQm5nR2lUTWUyK2xGOTlD?=
 =?utf-8?B?V0pWRjAxKzYrMEx0Q1ZCRUQ4MlBTemU4MkQ1NDY4OEdkaTlteWYzYng5U1lS?=
 =?utf-8?B?ejBPeWxHQWhheEhIMlJZZ3h3TFFIMEJ5d0hiZ2JnUS9CcmppR1BGQ1hHRmE2?=
 =?utf-8?B?MUlSV1lKY0V1MFVUVFByNTBtUzJxUGEvUnJScXd0OHB3YTVCTlF1TjV3cGI2?=
 =?utf-8?B?a2E2U2E3TlB0eExTbmw3djIxRHR3d1RIS2xUWGpxM0ZlSnZ6d2toaWxEY2Fm?=
 =?utf-8?B?QnF5YjdJUWM0L2RCLy9CYXFVQjN3SDhIYVZYNnMrcVBQYml6TWR0eFpUMGFz?=
 =?utf-8?B?M1BXSXRtQVBobktFVVk3bjhSRk1vbUNZQjE4Unp1eEJxQy9ZSE5jbStjRW1u?=
 =?utf-8?B?UmdhQi92TmZhY2ZpV3lWSUI0RUM5clRINUMxTldVaDdYQmJhdkFWMGR3Q21j?=
 =?utf-8?B?U2kvSXBlNFVQVTdMNm10RnRYZFRVbGprR0tLVStTdHQxR2tzYURtdC9FU3ZO?=
 =?utf-8?B?L09ocEthQkRxVmdiUjFLY1dsa2RwNFhhOE83ZDN0WnZJNDlNNlZlemx4cUty?=
 =?utf-8?B?dmMyb2gwa3JvVFFWcFQ4VGpkZ05aU1ZDNmVRcXM4SjBQL083Nm5aN0M1U053?=
 =?utf-8?B?c3BOZ28rMitxTng1WXE1RkRWMkhpK1dOWVl1M0Jrak5pOTBldkpNNXBCcy9o?=
 =?utf-8?B?Ynp2OXd2dnczcnYzd3BLMkpSOFJYOXNILzVQUHRPS2ZvYlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V012R0pXT2JlVEN5TTFicm8wZnFnRXR2TjhvMDVjTGV2TDBiaWR4N1JHNTB5?=
 =?utf-8?B?VlFTWHhBSVFmUDZFWmVoTUlPSFJFWTJTMXFDa3o0VFdSVS9QMlA4WXhuS3N1?=
 =?utf-8?B?NGo3MDhIYmVMYXNyR0xQdjBXclg3SDBoU3YvQ05BWGNKbFUzN3M1VE8wOVUz?=
 =?utf-8?B?YkpwN3YwMTIwWEk3NXhNTG5jVnNRWTZLMVpFdVFUWE9NcGpnQnBJNXRSRHVH?=
 =?utf-8?B?b214cVFZQ3NFRXNVNzYzMFEzeit5bnUvSlVmUElCTGpWWUpKTVMvQ2tVQVA1?=
 =?utf-8?B?YlZDTzRyYjBHeGcrT09ubVUzQ2lJREJ2S3RxUFVEY2J1N0k5MHp0RnNIQVBW?=
 =?utf-8?B?Y2pVMUxaQ1ZlVFZ0MitvTHlsUEhPT3RpYmZPK091L3dlNCtyZkVMSUZLbmpw?=
 =?utf-8?B?RnlmSWx2S1FwUXBuNzZCeHdBdjBFNFZyMHl6dGFUT2ZHSDZUbXNzZjR5OTdk?=
 =?utf-8?B?NXVuK2VkcHhKQWcvVFE2Zmc3QUJvTG5kOTRnWkhTVVpYR3pjRWVxL0ZWSmh5?=
 =?utf-8?B?UnkvNVhiWGI3UXNJTHcwYWhwTk1OR1pmMjNJdkEweE5IQlVWa0VadkNzSHFy?=
 =?utf-8?B?ejhJb3FGVHBkazdzUTJzUzlxM3dZeU1rVXZqK3BOZVM4QmNDWnBEVTVXancv?=
 =?utf-8?B?dk1GbVA5OFhua0l1WlA0RkVFS1M5SHdMbktLUUNMUVNZYUdRTGgvS0xYa2Mr?=
 =?utf-8?B?ZXM4dXZyN1BJRUdJeWt2Q0wwVW9Keko2MC9vOVN2TkhzV3lOOENRcmtuQTQ5?=
 =?utf-8?B?TjFVR0ZLdUlnUE8vc3RCK0tQRWd4dGJDZlQvbEZUdldxczI2dUF2NmQrbEpj?=
 =?utf-8?B?S2QvN21HdWxNV1Q3YVU5N2s3ZFRxQ3EzbEdZSmJuUEZZdVF1N09ieW9HTEVU?=
 =?utf-8?B?Z1JsbXFBR21XRUx4OUVnV1lkbUhBUHFQVEdrWjN3aWZMeTVGNGhoQVBSNTZV?=
 =?utf-8?B?WHVndG85bk43aUNqSHNIc0xaOWZoUHluQXA1ZklEQWh0amxkNlNvemIzbHRF?=
 =?utf-8?B?aWtGTGNGdks1b1hmb0swUkhUZnpNV25NanYySXpFVkI2Y21TQ3R5N1pFRWJr?=
 =?utf-8?B?NzNtUE9TcXc1V29XeG95cXB2S2hVUnU3RWdoME16TWx4eTd4TlJSb0NzY0d3?=
 =?utf-8?B?bjlBQzBrU255V3ZGN0lsRUdDSm50ZjJocFZKSDFESzZjZm9NZXlPVHJ6N1VC?=
 =?utf-8?B?SGF4RTVpbGIrK0NCK1pvN2FyWm1iUVo2VXFGdlVRaFdsZXo4Mjg0YmlWUm1a?=
 =?utf-8?B?MnY5QlE1OEFzNW9lZ3Q5Mk81dk5YdndsZE54a0wwUDZBVEZCL1IwSkdTSzhW?=
 =?utf-8?B?L2NOV2VDc21mMU1WaXN6eW9XTkordFZuam9yZjJmMWlpaHp3a1lHNEgzOENK?=
 =?utf-8?B?VE12SVBtTit1d2llMWdaOCtoZFJOUlJuL3g4TXhsSkJ6ZnZ1MENtOGhaaGJ2?=
 =?utf-8?B?bjVBVWVWN08zN2JtRmtaSHI2c3dXMEhNVTlBMWxWcmdyVE9vbWx4VmFjQmVy?=
 =?utf-8?B?TjhmaTlUL0JNN0tFckI4d1ZKMU8wRE5vc3FKV1dBY3Y2R0Mrc0VrdVZhczM0?=
 =?utf-8?B?V1FyY3NJaVFqTFMzMURMUzB0MjZoOWtKR3RkVHNCVnNMeDU1R3VpbjNaK0FY?=
 =?utf-8?B?WTBTSmJHL0hyRmpYRmEvSVIvOUlQdGhMaWcvM1lJRUYwMHlRTUxUS3BJU0Ft?=
 =?utf-8?B?NTF6SzNORkVRL2NUemN3dnA1UnFMUkdHaUxFcmQxeHZmMzByQ3hWN0JnQ2s1?=
 =?utf-8?B?TmJPOTVTODFZMEFLSXJHMnFmVklKaG1zS1UwY21qVlVkU2szOTNDdjVLQ3V3?=
 =?utf-8?B?YVNWelBRanpTNlhpZzM5NStrVFluclVGb1JCM3lLZUJwc0ZyMWZ0TU5mMU16?=
 =?utf-8?B?U1NjS0hRc2M0ZitvczZBL25BY25nUnpUeFcyV3ZVbDlSc2c3NnFaZjVsRk5j?=
 =?utf-8?B?bDRMb21mcC81TGduYnZIRzAzYzRyYW5CWVYzVTNYTlZRUkxoUW4yV2lrMTI5?=
 =?utf-8?B?RnJ0czlpK1ZhOFpPclNoKzRkR1N1YU1Eem9PbFNCMnFPRzVXYmsvWHVVVHZq?=
 =?utf-8?B?K3NZWktkYlNWb2VVZUEwUURMR0RQUm1panlzUGpXWXUzdmw2WnMyNlRkK1p0?=
 =?utf-8?Q?UvgKM6enu1i95faHWT5OfSh+X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d40958fa-22c1-4156-39d3-08dda2993771
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:21:50.2509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcnIoSY757mTICCqGocFfChmVnMnfjxCbO1iDHW0W3Li17ef9/VV9Ik7VG44RwJD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7936
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

On Tue, Jun 03, 2025 at 02:20:51PM +0800, Xu Yilun wrote:
> > Wouldn’t it be simpler to skip the reference count increment altogether
> > and just call tsm_unbind in the virtual device’s destroy callback?
> > (iommufd_vdevice_destroy())
> 
> The vdevice refcount is the main concern, there is also an IOMMU_DESTROY
> ioctl. User could just free the vdevice instance if no refcount, while VFIO
> is still in bound state. That seems not the correct free order.

Freeing the vdevice should automatically unbind it..

Jason
