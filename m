Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86554C7A5A1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6EC10E115;
	Fri, 21 Nov 2025 15:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gYOeSpEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353A010E115;
 Fri, 21 Nov 2025 15:00:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnT1j3/hffRMarx7CS9RdxiRXqpqTseEHFZ96uiubDMw6C7efChnIQFBEBPdlp7bsquP2bHWAB7kJB+COnaMGxAYYu6r3LR8ZWi2EQV5RE94LvEIbIgUfAvyVF3Vw8ZGwZdSVSbDeLSlA/KKVSJXDWuzOYSQmr2mrAHItLBVYPwdhwzf3nVBGxguKfIyf+eZ11BmxfIy+VXjymZVRXYORxW7+gC/cuar+qj+lf7WerhrYuVYk6+1YXgrx0yVBSgAotl+XG0W92HDOtwUcPv7QLDZqWME1rQYY5L0eMK9ThhMpTIRQctfE8jd1rZzVGxZTueINGhEKyX4JjkxOnCBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZm88N9ClQIYVzNyTgIQI5KryHDfuhHWLN6sdRxrT3k=;
 b=MJxQ38TMzL/gbCPjMaj6/7TLTukC9jSD3mN6rA737bDa055G//SgUSHLlmrou5bpY0ZoBwnM5wCtOpSiTqVzWC60IP+iPg8hWun2Z+X+jBOfs6F36ijh++i6oEpQAosUbSer+T0jQo1hn5UnSHpCx6N8gixVbYSXxDCZ8DmEX4mk18PaS4zbIrILydMw37FAQ5dDx7FVoMyLuTIDFbqcIaH3kltecun5bUCfbdQv2Ju0iuBpiPUJevjYBxbVTC1KnBgCS/IOKjn0AmGkET+viKV6jgJ+viRepS+iwelYPV/tBK2xzNSX2VfEYO9q9FAXSVxEYi/kfH3FwYdp327CBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZm88N9ClQIYVzNyTgIQI5KryHDfuhHWLN6sdRxrT3k=;
 b=gYOeSpEQolGpfqPDeYiyi6fe8LSXYQrn+pEErGEm4CJX4+4SjuXqjbkFlredkix88riZMyYWON2UMyw3vLZ0cyGLDQW7z3iIqoNotOEOFDX1BFwsCWzF1V63liDA89lhIZAxmsESmZNMZtgq4bdS1l/9jHNLw57ZeZ7cz4Ui8bxfrcbA7kNAjvNOe9uD3gqA283QtTyxIchybO5GiN4tGa9cHw6mxeQPPxpG9mBdJ6A6jHqCuNxwryIbOsCmU3TW4llZprl7fISQHb++sBGrbWpXGzEKqoTWTUzgqUZzOeFGmIrPC20+xfqBM7nFxakjzBR6qcoVTg2h9Y2a5VBqQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Fri, 21 Nov
 2025 15:00:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 15:00:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/4] gpu: nova-core: Fixups for GSP message queue and bindings
Date: Sat, 22 Nov 2025 00:00:11 +0900
Message-Id: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHt+IGkC/x2LywqAIBAAf0X2nOBKEfYr0cHHWnvRUIhA/Pek4
 zAzDSoVpgqbaFDo4co5DcBJgL9sOklyGAxa6QVRo0z5sTLyS1UGb9wccXVGEYzhLvSL0e9H7x/
 oRo8zXAAAAA==
X-Change-ID: 20251121-nova-fixes-dc9b4f17b90e
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0104.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4c5271-2a3a-402c-610c-08de290eb049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWYwQVY3UkF2YUxxN0tVVXIwTWY2M3dDS3crWTlHemV1VXViYkJPaDlsVEx6?=
 =?utf-8?B?ODgwQ3VYaDd1bnAvMUpCZ05PQjFNWDhOejZRUzEyTjNQMXU2bldwWXE5Qlh0?=
 =?utf-8?B?ZVQ3d2Z3K0lxOW1yVWI0aWlrU1lGcktnUE1JbGsxUHlySUdOdU4yRU5wNGtL?=
 =?utf-8?B?S3ZudmZEd3A3NFJ5RnlpdExwMEpoOEdLMHZiUWtmUElNMU5aNVZnVGtTSXcy?=
 =?utf-8?B?RW10YVZYU1VIU1pBUk1ZMHZoRFlZQWhkZ2I3QWVpN3g4Yi9FelRIbzczb1Mr?=
 =?utf-8?B?QUR5NDdvYUJXTmJ0d3pIZFVBV2RqeXJDY3J5MGlORUsrWUJWOSsrUlJJRldj?=
 =?utf-8?B?Uk5EaHFkeXlXcW91YXZaRHZYT29sY2FXQUYzS0tMbTdveTFFbE9vam4wcm1k?=
 =?utf-8?B?RUQzKzZTZExEUm9xSmdZVTRBQktob0ppY2xnZFlxS240QXJSVTBzdFRWdTNx?=
 =?utf-8?B?aGxFejhiWTJWL1lCZmVhU2dXZ3dxQUl3d0dFdlNDcTFiYTQ5eG9BN0tsV2hQ?=
 =?utf-8?B?SG50SE0zY0dBUEwxU3dndHliZGRtUWhpbzNRRHRNTHZzZkNETFY0MHhrNjNM?=
 =?utf-8?B?S29DME1aNGpQRUFXUWMzWnN3c2ZLNHFXY1dYYXh4WGZub0tRNE12WjhsendT?=
 =?utf-8?B?NVlVZ0NmM2xpR3VpdDR0ZTBNQTBNYUp5Q1R1bmR1RWZzOXZiWVZ2Q1Y0ZjdD?=
 =?utf-8?B?QkljTXMvZ2txeHdlSURteW0vRWtKMDdPM1MvQjgrMmsvWkZzb2FpUWhMRWJG?=
 =?utf-8?B?RllXbXBuYWVMcEFOREJIYVBlNHRJMnpvUTJHRkF4ekkrK2xoeGM3Lzh0aFZo?=
 =?utf-8?B?RHJOL1oveHlSdjVUNGpxTGo0eUdJOTdSVXVRVXBZcHJxNkNJRVlTQ2s4cW9G?=
 =?utf-8?B?ZGNiRXZCQkxxa1VaYXk5YlhPYjM5SXlES3VLMWFTU25qMmhhdFVnRVNNeUdj?=
 =?utf-8?B?Y3FXU242QmZMT3Z0THppNnozUmxYQkM3REVrSXExV21jYXZvbVcyM3hCZEt5?=
 =?utf-8?B?YnNScDFSbjNBZERKZkNMQkFxckM0ZnVBbXBqOUdtZWlybTQ4bGFIZGxMVjZN?=
 =?utf-8?B?NW5RakNIOUZZeUs1UTFmVUxQQlVNbGlHQ3FxZXN5Nm8xWWVLVVJTRnZ3U0x3?=
 =?utf-8?B?eE9TOGk2d05jUTczMnZRb1ExTGhLaW02WGQ1N2YzaTJtcjJjNFhzR2IzVU53?=
 =?utf-8?B?ZEZiUVkrUFB1b3dESlhYNWwvNnhZbkptaFQwRVV1eTc5cFpGVUgvcWpZcnZv?=
 =?utf-8?B?bEkwZzlWaTlGTis0Tk1ZODd3VWQ5ZTRWRXVPOGhORlNVNmxxOVEzenhEU2I2?=
 =?utf-8?B?WHp5akNBOFpBSGN0eEJpRmpVcXErZ3BRd0JRYlJ0TnFhcGJMNk1UR1JvK0xl?=
 =?utf-8?B?Y3JIY0MyUVNTcTRwcnVNTTlCcDRTMTNDTG1vU3NBU3hRc3NRSmpBTmREaThC?=
 =?utf-8?B?MndKazNucG5yRUxQdjByZWd0emdUclQzamg0cEhPMk9UdndQRUpzTXloczA1?=
 =?utf-8?B?U2hOYTJ2U1BTem5PRzBXUE4rd2szZDhGY0FDZC9FTFFFUlhFZ2p5Q05POXVh?=
 =?utf-8?B?OVJXWG5JTW1RMXJDdm5QWVZnbXpKWjRPbU9VWmFoSER5a0R6bG1uTXBvWm5y?=
 =?utf-8?B?dGxOQVo3ZTU0QVh1N0tHakVtMmpVeFZubHJNZ0tCMm5GUW5ETTQ4SGtVY2Jt?=
 =?utf-8?B?UCs0VThzdVJIa0FDbmJLZXpndGNaMUIyN2pPTDZvTlh3bGpoNHZPNVBMSlpk?=
 =?utf-8?B?R1hDZ00vVmNjanhtQ29WdjZTc3A2K2doVEFrOWJIbFB2SUtzOEtDSFV6UTE0?=
 =?utf-8?B?QTRMRWZJcWo3SHhvNlV3dDFQQncrZm9PbTVPNWtacUM1Zm5aa21NUGg5amNS?=
 =?utf-8?B?b05YQlhiazV4ODFOZW13SXloYnVoUzhvdzdQemJORG9BeWhOblZlZjFkSklo?=
 =?utf-8?B?VDVoWjBvSmNkSXlMODFPaVEyMWc1QnNsOGdWOE1UVk1qRFFOeG9KeVo3bzVk?=
 =?utf-8?B?NzduVTlpWVVCSG5Zd09tWmNQSkgwbmxXYWhjemdLb0NGcjhjMzNXV2ozYlpT?=
 =?utf-8?Q?3QbKGY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODFoSmdSSUNhMFg1L2x5ZkptZlM4Q1o2a2RvTVVMWlBMME1LWE5FVDVheHJH?=
 =?utf-8?B?dHhkbnRBUmVZOVQvdVNOcDBOWmt3VlZ6Rk5IK2wyZytPYXMvdEF6ckpIWU5Q?=
 =?utf-8?B?K0dnSEpQSm9TMFYyUmxtZ1RGMERMZFZ6SE9LUlljUjVmVjR1UVVEWFEvVGQy?=
 =?utf-8?B?Uk5GV3JkQ2lMU1RJM0lIYW9PYWFzdVg0cnVhQWQ2VlhWSkE0am1FbFVCcFFG?=
 =?utf-8?B?cWRuclZ3Z0VBUGZBUUZIaWNGQ2hKblRsVlVEV0pPOUdRUGlXWDhULzBzUXRq?=
 =?utf-8?B?TzJES0dURzNmNjBkdG15MDRRbkQ5U1BPUjdsdlZGRjF4ZFZBU1phTElxdGVt?=
 =?utf-8?B?dVJSbVphMGQ3azdyQlcvbmxmUWsyc0c3NFYvMUxiMDh3ekhENUJqWDRQeXJR?=
 =?utf-8?B?Z3VzNUx1V0hBVzk5WisrdUlCNE9hWUhCb01OSmpLK0srTkRWd0IveG5vN29Z?=
 =?utf-8?B?VUU1bjFTdU9LSUp0U3ZWNjJ3M0pXblRSTUJuMktsaGNqNE9tSjlIcVF0bmF1?=
 =?utf-8?B?YzJWNzhNVUJQejZNUlR2bU9IZ1FRMXF1WC9XZDFXbE5Ma3o2b2hmV3hNWmVr?=
 =?utf-8?B?cDI5bnpDTFVPV1o2bWFta2FGcm5uVnFUalc0Z3l2WnhPMk9oUWhoMzRGajdh?=
 =?utf-8?B?VE11OTFPUTdkNDhQMlpnQ3VKWUdscHFWS0NIMUl4cXN6aEpaZnZVL0JzcWNa?=
 =?utf-8?B?aThIT3YyZlE4ZG1WWEhldFNFSjZYQUFmMytRQ1p2ZzRnQWVlOUJLUUVidU53?=
 =?utf-8?B?OWZ3aFA0RjJHSHowc0VNbVQ4KzNIMmJxQytKbENGdjJyamRIOTVORnAxZDk3?=
 =?utf-8?B?OWRmdUJqZzA1L29sU2phR1JZazJ0dkJ1VEJUYlRFVXFsQ0h2RWFBdlZqRjVL?=
 =?utf-8?B?dnQzSWpncDVteFZSUDVPTkgrNnd0QnRmMHVrYTI5OGhRenhTOUJPNElUYklh?=
 =?utf-8?B?K3cra2hJN051UDZMb2JaZU16RG8xalZ2aStycWFsanV4MkVXMHlEVGd1S1l4?=
 =?utf-8?B?eFd1N1YyQStWb2JnYmw4NGRDUE1TemVyR2JKd0VnbDl6N1BhMUZqOTZhL2sy?=
 =?utf-8?B?UGlIQjA3VXI0MTZUMGRWY01qZ3A0b1E3c1pkYTRkQ1Jnb1hHbWJSZ1JBTmJu?=
 =?utf-8?B?TUxUakUwNGplVzdCVlJITnFwa01ZUDdmNlN2c001ZjFOeEVRMUx2RllKdlRq?=
 =?utf-8?B?bWNDWXRWOXZodzQrYW40eUZpRUVCY3cxb3dVNFpzNk45eDFwY3Y3OTNkUXVY?=
 =?utf-8?B?dDdFNXpjM05hVjZaTFd3U1d0R2wwenU2Uk5LMjJYUURWOTV0QzY5QlpYY3pZ?=
 =?utf-8?B?L0ZrbzNsa2hwTkFXQXpVU05hRFZvaE1pVE90RURRZ3hKd3U2V0ZIMkNzYWJo?=
 =?utf-8?B?bStPNitCdXBJSVFtZmE3WWJuUXZkRStlSzI0L3FwMWhUMm43M1dKbHUzUWt5?=
 =?utf-8?B?TlNPeXlJSnhtVXRhZEpNSVZibncwSFVhdzErL1ZndWptWlRBL0hKdXVFZFR2?=
 =?utf-8?B?VlNyYVlnSmJmakp5dlVDOU5lRXVaaHgxMXRwa2NZNGJlWHE5T09RUTY0dm9x?=
 =?utf-8?B?V3lJbHJDWmJ1clU5dnlsczJzN1YwNEtaUHVFT2kyc1pVSkgzZEUwQ1dVcTV0?=
 =?utf-8?B?VGo3MWl1R2N0bXRMMEpuVVQrVnZnYm1WeTJtYWlUL0VVMStTVjg3Sll2Qkda?=
 =?utf-8?B?R3lmMS9WdzV1ckxMdTIrQzZnMzNhOWFNaC9mYkYzTnlYOFhnN1RQU0dZdVJZ?=
 =?utf-8?B?Z2pWaUczSUViTGpzOHBWeThKZDJnaXhJVFIzWVhSdFhEMUdybFRHRXU0K1F1?=
 =?utf-8?B?N2lTOFlWclk3MjB4M3BSMjEvVFB5NDY3cFVPUkd5Vk5TOEczMk1DVDc2MDV1?=
 =?utf-8?B?L2pwS1pZQWRLUEExZjNZY3kra0lINmROdjA3eUJ4MzVVbmdLUkxOOHBrMXVt?=
 =?utf-8?B?dkJrSkZCaTJrMjIzNFRQRmpiS3phRHNRd0ZnNVJFOWNCZlVuSDhLZVVsbFVZ?=
 =?utf-8?B?eG5ZS2lURGtnR1BJdHVZYzBOVW5DdHgycGJ6clZUNzBLZktGNC9Ja0h5QytX?=
 =?utf-8?B?Skx6UXFsWXNoczR4WEZ3MUNhN2VuSWRkSlFUU3BUQkIwN256L1g2SXBrQVRl?=
 =?utf-8?B?UHhTTkd4eXVaZ3Zob0FZSWlMZTloeGlCallUVENXTzhRVCtacFB1ek9NTFdh?=
 =?utf-8?Q?ht3nz+o9ZtKHLGjYB2HxDuz+F9A8Bt927j1OPjrjqhCE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4c5271-2a3a-402c-610c-08de290eb049
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:00:20.0895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gX1dFeZinwjJrLBz87EqwpdALLp4uK4l/JBe+R67lzX3JrrPQJsz69OdhpGb7cPePAfeVpyQeyI4wOoBjiJE/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229
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

This series contains a few fixups for the recently merged GSP
command-queue code, by order of importance:

- Some explicit padding required to safely implement `AsBytes` was
  missing in the bindings,
- A bug in the received message length calculation results in the
  message handler being given more data than it should, 
- `MaybeZeroable` is now derived by the kernel's bindgen, but the Nova
  bindings have not been updated for that,
- Some items in the bindings were referred to using the version module
  directly, instead of the alias we defined to limit the diff when we
  upgrade firmware versions.

All of them address "bugs" (with the first two fixing actual correctness
issues), but since Nova does not do much anyway, they are also not
absolutely critical and can wait -rc1 if we prefer to do so.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (4):
      gpu: nova-core: bindings: Add missing explicit padding
      gpu: nova-core: gsp: Fix length of received messages
      gpu: nova-core: bindings: Derive `MaybeZeroable`
      gpu: nova-core: gsp: Replace firmware version with "bindings" alias

 drivers/gpu/nova-core/gsp/cmdq.rs                 |  11 ++-
 drivers/gpu/nova-core/gsp/fw.rs                   |  67 +++++++-------
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  11 ++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 105 ++++++++++++----------
 4 files changed, 103 insertions(+), 91 deletions(-)
---
base-commit: 57dc2ea0b7bdb828c5d966d9135c28fe854933a4
change-id: 20251121-nova-fixes-dc9b4f17b90e

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

