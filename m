Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B0BABC5DD
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1D310E26A;
	Mon, 19 May 2025 17:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="id4UoQBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B1910E26D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 17:49:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFcjVzmG9xvOPZukhD+zAxgS77+uDR8lzN2CT1eYRaS7nFTf6eeK8Sy942/dpg3Plc6sXp3cBdDz70/DjCiV8mWjK/gNqew+m2YNlu6spEsC9fo8EsAopuImiMdykRWC1G6Boy0PXtIO2nhxRoyfG98Rw4FtksswzPYWQvsAuV3Q5tdMCjEMfIUKhk3ju/7ES93EMRj0XUKOXYBEVscYCKN2ezHac8kmkyNhb6JRNqvz4HSlC29KNgLrQQWlNvECEZ7JR7fPvL6L6WctQbERIKuRy1fY/4zYQ1zFCvMMu72R7YCPwEqEeRLm/mGvdgQcq5HNSPRyG/CiXGxNAU+oaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KJwhrby/eMNwIEDmvgeg7W4JkyF2GiInAXUSJNYjvY=;
 b=NN/2AR4hbjFMs3tKg28PxsAcmvVCt8rMdQBcJeFk9HbRSNc61DRn1t4HphCjL8xknUdYb6F78EuqYkuaWjdP8CI1QK/sAVn0tb1+U1WpOqABrfWOr7SQ2y+CojxwyahW2mEh/cqOf2GYQUsp7ryMqUEDdFW1D/q2vXoMosVqysJACYuv/G9v8TditnbBcEi6lasxGNFHruZJIHV6J7emQXJG0JYRjav5y2P74ZUfO9TJ8n6cPYTbPgC9mI5i68Caexov6zrCLXINFVhN9YGuu8Qi0oPzDcBCx7RwvsN+KE46MUpgvAYSadVBdBQ5Bh5O7l03PIuNceIIyo6GSnSORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KJwhrby/eMNwIEDmvgeg7W4JkyF2GiInAXUSJNYjvY=;
 b=id4UoQBenMubCXEfnMiSEBTsJehCgmCGncLi3GVAKWOHPhhvUvVfe7Evt/0+rx7FKTRJp6EFgpu1+4wWReaZdZaTg13KluvAQO1zEWfSIkRI+Wz/TSiM0bGbu9VZD443MeWd1u+eP5CXxIY7by8tw6h/0pjNeBRecVmiui/SKaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by CH1PR12MB9717.namprd12.prod.outlook.com (2603:10b6:610:2b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 17:48:57 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 17:48:57 +0000
Message-ID: <8a16978a-2f02-a9bb-05b0-368e3ee8e284@amd.com>
Date: Mon, 19 May 2025 12:48:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 8/8] KVM: SVM: Flush cache only on CPUs running SEV
 guest
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zheyun Shen <szy0127@sjtu.edu.cn>,
 Kevin Loughlin <kevinloughlin@google.com>, Kai Huang <kai.huang@intel.com>,
 Mingwei Zhang <mizhang@google.com>
References: <20250516212833.2544737-1-seanjc@google.com>
 <20250516212833.2544737-9-seanjc@google.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20250516212833.2544737-9-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR18CA0020.namprd18.prod.outlook.com
 (2603:10b6:5:15b::33) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|CH1PR12MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e415860-d1c9-49fe-3883-08dd96fd6dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?em1taFNPcFk3djJwOW1pdHdDUnlBQVN5QUw1ZHNTVVFuNm52VnV1U0s0Mkhl?=
 =?utf-8?B?R1MrUDY1NmgzeDZPRkY1cThCeHN6MXJjWDBaMGNaL0o2NjBqam40bXMvRnU5?=
 =?utf-8?B?NXFCV3U5MGwzWXBiQnFiSmI5SG9Ld040MTFDOHkrY1ltMzF6NDJWcExBZGNz?=
 =?utf-8?B?UGQrdndoSlJVVy91SGR0dmF2K3NxZElpZzQ0U1ZIZGprOWpMMDM3RDBnMWlD?=
 =?utf-8?B?b2dYb0dQcmsvanJsMUxRT2xVTEJ5dGdVcldCM2cyU2I4ZnlXeVh5QVFTRDY5?=
 =?utf-8?B?eXBORnlON0k3VlQ1OHZ6c2Rxc2FwZS9iUXh0NVRyMEQwMXNJTTdWVkt4b3B1?=
 =?utf-8?B?NHdCVWI4NEZXQ2pSclFqRVZNTTdGKzRRUU1vTjVQNVV6Q3J2L0hJYzJIZGdy?=
 =?utf-8?B?eTRCWGtENFBkY29ielR0ellRTGpBQXRrSmk2OGM0ZVQwZkRiR1pvMUF0ODc2?=
 =?utf-8?B?bFhCeWhKZlB1YzlBTFI2SHNHOFAvUnNOZkhOUWFmaVVYYXBBMld2d1hCSmhj?=
 =?utf-8?B?bkU2UmVPN1h0Z3pzSWZkMnMyQnVmV0U2RHZ4YXVrMzZleVcvb3JnYUZXeVRn?=
 =?utf-8?B?REVQTmNTZmUyb1h5Y0ZtcjltVS9sWmhyUHdRMWhzS1oxT3Z0VVRxSFd3T3Bz?=
 =?utf-8?B?eEVJV2s4ZGRpTG9CejZWWE1QRXluS1JLU0twazhnUW5WVTAxWjZJcElEQ1lB?=
 =?utf-8?B?YnRaZUI2UDZ2enV0WGx3Qm5CakpDWG1QRjVXRGVTc0tGYk9pZS8yY2ZVaE5r?=
 =?utf-8?B?TlUyZFIyU2hHa1RjQ1lMYzE0ZDdkenM4YUZxNU1NcVZVRFpkZUFTTlBtb2dC?=
 =?utf-8?B?bVVZM0ZBdGVZczZGZ24vb05KbUdUVDhwK1JmTHpuU1VYN0ZpNHlSRzNGTHE2?=
 =?utf-8?B?QldRNW9hWXdUQ21RQmJRUkxra3B3UUVvSlhhc3F5UjJuNXQrUGFhN2N0Smww?=
 =?utf-8?B?MTFDVmVoTnNZOGpWRUtYWVVVdW9TSEM2eUtjbWo1TEJCakEwRENvTlhBK2pU?=
 =?utf-8?B?YkR2NWJOK251azMwS1d3ZmUxaGo5SXQxclpIVVEzRTlZQnlzeHBKMzY1a01Q?=
 =?utf-8?B?cEVZWGtpREtBQi84OElhcURSWFdNL0NCdFV6dVV6d283RkF1Y2hlWDl6aXpp?=
 =?utf-8?B?L3FQdktzbXR1Y2o0SjRVT0lOa2h6OHdHWmU0TGNnWm43N2ZrZzNTbm1EVml3?=
 =?utf-8?B?Z2NnNVpDZjFnd0E4M1dYdjFuUFJpSzl1OS84MHU3bzZ5Y1dXWTBkSTNKek45?=
 =?utf-8?B?WWF2UGVTVStMS2JLUHkzNjNEZ2x4MlRFcEZ3eVBBdWdOQjJLRXJwaU1kWDRl?=
 =?utf-8?B?OG5Ja0xSNllxaWo0cUtDNGlXZkNURjY3SFhHUzJFbUcvTDlKVDc3MjR4OVN4?=
 =?utf-8?B?akd5UW12c3cxMUtZUExhOWMxNmlRa0gyVVhCSEZHZVBLUk1GNXk3OEhxVE9k?=
 =?utf-8?B?Z0N5aU9lVWNpOFk5TjJtbmVsUFpScExhUU9QZmVVUUoxdHZ4cVRiRXJqZ1R5?=
 =?utf-8?B?QUxLWUFXU1ZOYTRYVXpQQkR3NmhnOTQ3bGQxekN5NisrS011ZmdGV3hvWE9r?=
 =?utf-8?B?c2tEVVJEaTJSU2tUVXRRU21FSU5MS1ZCa0EvdTVMVHNTb1dNTXNlSGwzUDZr?=
 =?utf-8?B?OWdPYytiUk1RbHJlK2toS1V1RVJ5Mm5aMnB1UE9sbmFsS3o5Mi9mc3VnLy9x?=
 =?utf-8?B?bEErRklsdDJRTVYzd2JEaEtWZjlzTkJobWx2Z1YyRjF4RjRoNGVEcGVQY2t2?=
 =?utf-8?B?OEZzaTZzSU9rZkFwOTFtRGR5N0l4dDRoQ1RCd2N6M0VEdWFFS0RCN0l3dzd2?=
 =?utf-8?B?MDNkRHlldlkyTDZ2UjBVOTlEZFd2VVBLU3d4UG9QRW9Od0Y3RllhcGRGaGFt?=
 =?utf-8?B?cWJvVjgrOFNQSUdHUFJTRHVOZWxNb3FzeXozZ0hKbklOcFdrN0V0Y0VxbGhu?=
 =?utf-8?B?UUtoUWp3RXZINVNMRThCcDI4WW5HaWdtUjVIZUlmcWRrSS9lcDhmRms3Mjc3?=
 =?utf-8?B?c2FLYzdqdStRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5070.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDg2dDJEM1ZTWFE5RU5TWUFqYnFvOUJ4dWx2YTdNb3ZMbFBhWTBvMWhUVkt3?=
 =?utf-8?B?RmthMWY3Q1h3R1hHcVdQQUhqby9OWW1PT0hOQlRWZGt1SFZVRWR6MzJJTkNC?=
 =?utf-8?B?d0Y0MEhhYmFBRG1pbEhxZGxXdWN5cm9Sb1dWYjFrS0NGSm93eDJJME1lN1Fx?=
 =?utf-8?B?UGlScno3TGxXMW5ONDFJcHVEWk15clF1YVdla2QyVmQvRENTR3hmSi83eWds?=
 =?utf-8?B?SGxRLy95dTB5TjJ2bjZSTmdxOGdZc01wUW95VG84ZGxWMWNSOVFITjB5Y0NY?=
 =?utf-8?B?Ymk1ekJQVUhjRGxVNFp5M1dUVXpTUVZhdnUwMUdCNE5CUjZ2cVI3cm1KY2tn?=
 =?utf-8?B?Z1JOOXQxQUhJeFJRNEV5dW1YUkJwbWlNdFBSVllpSEE5WDNjcUgydDcyOTdF?=
 =?utf-8?B?Y3VZMWpHTTdMYWlEOVdkMXNadGhNMXI1bm5aVzZwZ0lsR2tRQ1RHUDhHSWxq?=
 =?utf-8?B?c045clE3WjBPcE5DNzJJVUJzZzdOZ3B5UnNvRUtaRkVhWHhIY1dFUVMwS0Z6?=
 =?utf-8?B?ekxkNGR4b0ZiajlMaTJkdFVtdm8rSExqTnI1eGdZOU1waXczemgwb3c4bG5Z?=
 =?utf-8?B?ZHU2M2sySmhGdFhjdkVhaFNhL2VPU3ZFbFE5VzlWb1dwdkhCbGZqQ1JHTk85?=
 =?utf-8?B?eHRybjY1L1NndE9TVGJHRk5qUmI2eGpwT0RKSEhTUTJwOW13Q0lnUm5zU29P?=
 =?utf-8?B?bjhqR0F6Z1hraHdsQkg1ZzRSZGVSSStUd2wrMmFaN24vREN2U3o2YnJyNGsz?=
 =?utf-8?B?SnlPeFNKeEFTZm1IeEh2Mm5UVFhwTXVRL2p0aUppRGEwbUhNdk9SMUFJaitI?=
 =?utf-8?B?NE1LdUtXMnZoUXM3OWE0V3dHZHl6cnpvNVBONGpwNTNrSXdTVXFUNUJEOHU2?=
 =?utf-8?B?eUpyRk1IM3RkeGE2d0pUS3ZqL0dUZWEwS0hNeHUrRnJpckJiaU1ESGc0c1k1?=
 =?utf-8?B?cDZWMDJZWHByVDdkai9HNkhGT2NMNTNWLzcxc3dTYlBuMjJpMEU2dDV0Z2Ja?=
 =?utf-8?B?WjhaL1YreU5FL3JtTlZDK2xqSzZjNTZNZ3BodVdCZmRnMVN3cW9ER1g5bkZ0?=
 =?utf-8?B?bG1yQVNJSEhKWHV5VnNuanNkL1hHeis4L2xWanRPSFNPbG41cEFZQ050YVJD?=
 =?utf-8?B?cmtpSVpBWkcyNk9XZHFUZVhHRmNzWTBVK210SFR1bUlqUmJmcE1mdGVyT2d3?=
 =?utf-8?B?MSs5bjkvQVV1MjFxSENpUjErL2RER1lGRmc2dlF0c3ZqZ2xNbmV5aEdrWS93?=
 =?utf-8?B?ZTg2TmFaTEEwd045NmM2NTJRbnlTQVgwZmNnSmFjZllYTG9Yb3d3emxuVFZI?=
 =?utf-8?B?UHZUbmIwV1dmVHN0WUVtQmxidldHODVlRXNPQ0x5ZjBhTTQ5cDdaWWR1ZndP?=
 =?utf-8?B?RXRUSjRmT3dsVVI4eGNJbWUySXA3SzlPbHlVbzVKK0Y1ODNscUxGZnhLbitw?=
 =?utf-8?B?NlV0K3FTWEE2M1N6UUVtd1MwSHNlM3I1eFB2ckcweFY2NEw1QXk3WS9HclNW?=
 =?utf-8?B?czk1T3FoUmdjUytRZ1VjZlV0N04wT0ZGL2pabEFRM2ZlS0E1VithTHp6SEtM?=
 =?utf-8?B?UEk3T1JUWUxLb3dTeFRuSWxOemdSKzVEVzkwcFFsRzJVazRXa25tSXNYVG9v?=
 =?utf-8?B?R1VMNG1pY0ZLRGJUbzloVFVna0FTVi9VMDNFbFMwbzNWSHpTUGsvVTcrYjk3?=
 =?utf-8?B?YUNhWUExUkdlbit3RHVXckdpZzdxNGN6Mk9ic3FxSGo5SHJhOWpGLys4TmhC?=
 =?utf-8?B?K2ZmWHkvZTdRTHMrakpEWWNGM0dNeDcvc1p2Slh6a21xbmhqVnl4S2poQnYw?=
 =?utf-8?B?VWhnT3I3OFEzQnpTRzdlY2k2azZaSkRKWFd5dHd6VjkyNFFPUm5pb2lSWTQy?=
 =?utf-8?B?QWpnNEFSczdSemViN1VDZCtTUVJNdjJqNUJtdmxvTXQ5cFU1WEw0NFlhcGd6?=
 =?utf-8?B?WXJFMEY3RmgyL1k4UGV5dGc4cXBRSFlpQUVMYi9mWEE0NWdIVDBFbWl4Y3po?=
 =?utf-8?B?WXBSNWx3ajBuSTNkZmJsTndHVEZXeFdDY1hrdmxpd21aODQ4Z09ZSnNoNHlI?=
 =?utf-8?B?SVZUUFRiQlgvdFE0alM2dTIvWG82UzN4VkVXRlB2TzJ2aXhaL1htSVFnNEc2?=
 =?utf-8?Q?NLafyca4QrLJXWZB4IujIPFtQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e415860-d1c9-49fe-3883-08dd96fd6dd6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 17:48:57.2416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUZmr+mtbDg6mipb05rlrWHzeKAauQgC9LtIQwb+bnXIDFH0FwI12XT3RolbxP3iBTAbf7zJ+490rGmlOuui1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9717
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

On 5/16/25 16:28, Sean Christopherson wrote:
> From: Zheyun Shen <szy0127@sjtu.edu.cn>
> 
> On AMD CPUs without ensuring cache consistency, each memory page
> reclamation in an SEV guest triggers a call to do WBNOINVD/WBINVD on all
> CPUs, thereby affecting the performance of other programs on the host.
> 
> Typically, an AMD server may have 128 cores or more, while the SEV guest
> might only utilize 8 of these cores. Meanwhile, host can use qemu-affinity
> to bind these 8 vCPUs to specific physical CPUs.
> 
> Therefore, keeping a record of the physical core numbers each time a vCPU
> runs can help avoid flushing the cache for all CPUs every time.
> 
> Signed-off-by: Zheyun Shen <szy0127@sjtu.edu.cn>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

> ---
>  arch/x86/kvm/svm/sev.c | 46 +++++++++++++++++++++++++++++++++++-------
>  arch/x86/kvm/svm/svm.h |  1 +
>  2 files changed, 40 insertions(+), 7 deletions(-)
> 
