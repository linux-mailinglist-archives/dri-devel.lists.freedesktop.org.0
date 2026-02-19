Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLHLH5G8lmntlAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BD115CB24
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500F710E693;
	Thu, 19 Feb 2026 07:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IwsyoX55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526B510E693;
 Thu, 19 Feb 2026 07:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGiuBLA7oVaGoIyXEMlPbi0VIY3wThd+tOV8It9YVnoFBOIknZ22jWBGqZshjIOadmyG08BjGsxMvm8TJeuFzRqEkG9XjFEj2HR9TaZ7/euAmU3WyEqm/enHvHs1UwQZs12G3FQje4CJlD6LW34a278l9Nr6+SHbit5ci7WVm9LaOJ0Xfjnywq1C22TDZ1BsJ4JEnSRU6gr80n1BjqFVwk3s0BGCgXEDxUR/RBV/cxTQm23fboS22oMO+Go5TIg7enCejA1VmiRE2Co61v42SKFDiuNKxY9l8zEVkDZZfvJXkI0nYzUNfCwUDTlAom5JXvIOd1gYhqXutHz1ezK2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caIE0kahU8d1+o1jRmlHlbByUPj8/9mhgsPgds3kNjw=;
 b=NeBjvAuOxHsSg8cUKRX7tUg7kD/RqdaLE/O2Zr5N4MtMp20Lg0vlsXJYMYbEciqqq/obnKKXEXKd+KtVoG/wuqtFld/QC/qS/7/7QPlNEjRBvn40jqoEbul1TC14y6vrzlbBq50ntZbgLcpQPRAF3RPU21ik9oaWZe0PT47RgNnIAjk2WOhdqLlzhI/Y0Ak7+llRi5SeNjaP6JvHZZkltnq8e1iponKmiSSRtbFKbJo6sHIVWV1FeULTvxN55FC4excYR91mVssKiZRb2mymBLgsgXxEJdAVuS5lcy33h1SS3IFwqpAlqIdaYph2yvgLQ0ojZAtCmTCVocd5wygR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caIE0kahU8d1+o1jRmlHlbByUPj8/9mhgsPgds3kNjw=;
 b=IwsyoX550pEZ1+N4TNbnLlUkrbLIgTUHmtOwkKaHn5t7ZVzwfLIxYVk8fVacBoMH3geNd2FDR6W/TX9z/fti9T/ErLI1LtqsjzzP4QbMjkwvKF9vhSxSPsbQPboW+kJJjQe9KLWueN+0S/SYGJS5ZPaLb+T0Dy6VGPxf864SDYdMkSfgEg5bwzwOQYDi+HOgEqE7jvlnKVevxc0oKttd7jycmiM9Un9+acCXl9QQElDFAABQfjp4KljOvtegrW0at0VHMSA4TLpNurMnAKE+0PBdGBkl9bCLu2XLrC+kfwkzq+IJflLqRIbwcj+pGVLgOBSv1eRezNAWqFJHnMFEvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 07:32:27 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 07:32:27 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 19 Feb 2026 16:30:53 +0900
Subject: [PATCH v2 4/9] gpu: nova-core: gsp: add checking oversized
 commands
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-cmdq-continuation-v2-4-2e8b7615536f@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d40564f-19a2-4c27-f495-08de6f89085e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0pMQkV0SnpoWnBRV3JPUFZ6NWVpazUwT3l0ZlNsNWJPbVRycFU3NnA0Rldk?=
 =?utf-8?B?S3p2Tml6SGhQU1ZpMktFUmF6TXRYdjNJcloxbGovV3ZxL28yWktVUk53cTRD?=
 =?utf-8?B?TzlGVStCVmR2M2pVRmRZanBtMS9EMC9lMGpWTXh3eVduZitkeFdpbWxhUGxP?=
 =?utf-8?B?T3BMcGthYnNNU3c5S3FYWjYrZjhqOE9hVDlCT2J3ZE1FVmRCMmp4R1JlNWEy?=
 =?utf-8?B?U05lazdXRVRuUW5QRHVFSTNMNlFHWDVvNTdnNmVUZlFlNWF5VHJqcC9Ed3A3?=
 =?utf-8?B?dTNyUkhESE5aeENuTzV0WHdqYUd6cEZqRXorTFR6NHZxc040cHFmSEc2ZitS?=
 =?utf-8?B?OXRIMVFPS3pnVFdGZElNTUw5MTZjNUpwU0xwbVo0OFNqb0tWQmpGOU1pVDBY?=
 =?utf-8?B?em5wS2c0Y2dBenRjTGJJY0U1QXNsUlZKSHJVbU45UjRtTi8wVHJ2Q0dsNnlK?=
 =?utf-8?B?Y3VHaG1QaGQrYzVuNHQ2QWhza0U5WWgwOWJYbGZYK01xek9wVzVVeXRPTGI3?=
 =?utf-8?B?OXU3aG84a0hlTU80RlFmTnBoQ3d0eERNelNzZFVTVFVQSVlneDI2UEJhSXFZ?=
 =?utf-8?B?TGFSdUkyNTdYZ3FPUUV4bFh6Z0I4YmxBUVZMVUVFZFdER2NMMVV4em8rQnhZ?=
 =?utf-8?B?KzFPNmw5TzI3cVlTY05TRjB5SGJKcTZWeTN6RmprdlpUNG5vRzJobVZmK1Zh?=
 =?utf-8?B?dkFZUlNaWURyb2NMMFJKREZNaFgrYUIrZ3lQVHdGbjR2ekdOYUVUNWxpMHBo?=
 =?utf-8?B?UTd4UWN4UW4rQXhNYlFHK2FlOGR3cUJaeGVmbjdWS3kyZ1ZpZkxKZmtYWVJl?=
 =?utf-8?B?Y1dwUXR4T1g1V0ZXa0VNbXlyVmJ3UFozWDkwRnBKMjRVU1QvRW9MRjMrTjZn?=
 =?utf-8?B?TmU1eU5qd2UxMzNaNkNNdU1FZHFUV1lmREtTNDVIT0N5Y1ZkU2swckxsdENS?=
 =?utf-8?B?dFhuTmJkWGRDNXdkK2lTRlpPamIza3NGdElZTGVyOXpXcnM5Mi9rRlRkbzdx?=
 =?utf-8?B?RXdpWU1VTHdMS0VTMWhKN0d6LzMrSlVWRUlrVkhKelNUTlJuMnNHZXcyWnZo?=
 =?utf-8?B?MlFVUmllQ3NzZm95QU5YSlRxMndQcG5wQjlLRS9kV1o1SWp2MzFWemozcm9m?=
 =?utf-8?B?WWJsbnowemZISWFKL3ErbTVQRUUyc3F5YUhKeGw2NWdWbG53QjNnbHptOEQ5?=
 =?utf-8?B?eDNmNDZtckVpRyswNGdEMi8zOVJsYUMzd2VZYjJpejdQSWhuWCtNMERCNEYy?=
 =?utf-8?B?ZkFiMnp0alZxaElNMjh0Ums4MGxucHppYjc0Sk5Tb0RDc2M1SDdRZi8rNWtP?=
 =?utf-8?B?Z0hibml4YUxRRzN6VXRRN3FKdE54NnJsZVV3UmRvMWNEMXcrallHdUFRbGlo?=
 =?utf-8?B?SEd0RmVpc3VaRGlWZjErL0VHMkNReXNwUit0TDFKcEs0eUdRbWxHSzZhVkdU?=
 =?utf-8?B?TEZBbENUSERERHBnTVF5TjNWNWdmRSs3em5NYStpQklwNFFnRlFqK1ZUdXcx?=
 =?utf-8?B?RFIvanhESkg4c3F2TnJ4M29RaUJxQWZ0RWNwY2pmT3ljbGZ4YzJYQkR1UnVi?=
 =?utf-8?B?aE1kVlZoZVcyVSs1T250ZzZ6dXJ6V1VGcjdsVmllUnN0YU1DWHNpQVRRK3Zw?=
 =?utf-8?B?azJkZnpYZThOUmw2T3ZUVmo3MEplazdkRFE2TmtRN1ZEcWhHbUxwMklncnV4?=
 =?utf-8?B?OTZRS1FjNHArSmpXaTdINzJoT1FQd21zVDAwaS9sUXhWRC93c2YyZUlzSUIw?=
 =?utf-8?B?eVJvNktOekZMSTFybURxMzJlVmJCRHJJWEdWUytiOThUQ0lKTjU0dUVyMStz?=
 =?utf-8?B?dmRuQ3JBZ0JXUDZuVk93MDhHTDg3c1ZrRTBXbi9ucUZsbEhuYVMrdlpURjBI?=
 =?utf-8?B?YUdKcjVvOWZMUXdmcFFOUlh5NktPOHNZckpPVEdkS3RPM3QwL0FXbjZiUjJI?=
 =?utf-8?B?K05XRUFPNkdGZnFKblVtNFFPSjNyTXdkM3dFdE1vdEZrK0pQZi93OTZsSGhR?=
 =?utf-8?B?dEIxMXBJOUFoZ0JyajNIQlZJZlR2UmF4bWdVcVdtYnVEMWcxR1VZTHBJTEFt?=
 =?utf-8?B?WjhvTC9nSjFRTlhVTis2bU8xdUltMGx3Tk1TSzc3d1hUbitIc0xvQWNxb3Jy?=
 =?utf-8?B?WFJla3ZZdFFDdndOSnM5Qjg5RFdSdjI5bkZLY1ZET3JCdXFmTUdYTTN6NlBx?=
 =?utf-8?B?UGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3Q1L3BWWUFPNE9IYWYxQ3R6OG9jb2Jaem9JanlFQ2NFVWFBUVhPSlQ3Zkla?=
 =?utf-8?B?QlRGWmFZNjM5ODlUMGViK0RROU0yNUVONzFJVXFUQWxwN1lZOXBrbHI1MG5B?=
 =?utf-8?B?eDFPb3BoYzl1MHdzdHBLSUZ6ODk3dG9JSnFIZExNUFowU0MrdWZWd1RTbTU4?=
 =?utf-8?B?NTBDNnVHVFBWK2FtNFpHZ2g3encxbi9WczNNTzVyUTFmTlhpWlRGNjYxbnNM?=
 =?utf-8?B?SVd5RG5JSEliOHE3eEduZ0JtdkppYjdSTzhaYVRidnFHWDNhQmdVa2hSWGd5?=
 =?utf-8?B?eE9VWk9ncGM3VXFMNjdROVpVUmVqY0xWaDlVQVYrT3M1NDhjSFUwV05TSis2?=
 =?utf-8?B?TGkzOFl0U2IrZnVyRzZyelFVNldEemVEb0g3d2RxajZpVFF4V3NkcEVGUXZu?=
 =?utf-8?B?WE9lWkhPS1hYUXAvOGk1eXIzMFZpM0M5R3l3eEJ3NXpRUzZ6MGJLUGR6SEx3?=
 =?utf-8?B?RlBuOW84d0toYlI4TG9xU3BMa3FPMkk2czhSVEkwR0c5SkpRSXZvZXFXYm9I?=
 =?utf-8?B?a2lKNG1TRnpYUmVLVkRFa0pMSjF3enhOU2F2MlVnM3picC8wWTNxbUNSV2Zs?=
 =?utf-8?B?WHVjTmVTNFZ0a0pJY0R3QTUwRTl6eUQzMXhKbUtxNWZ2VnpwY3d0cCsrdGJp?=
 =?utf-8?B?dWhTK2kvUEhkUjJPcG9QQTA0V3hEeFFuL0xxWVpGQnhoWEIzNWliQmQwMEpR?=
 =?utf-8?B?cXcwVmdkaHJkc2VQb1B5dkpMU3BXb1hNMTkvL3RabHVMU3BXY1VZYVBZckpo?=
 =?utf-8?B?Q2dkYjBOODN0VDIrS0dwKzh0MjRLUTRjcUtBMVZ0ZkZCdGlYYTF2THh4TU5T?=
 =?utf-8?B?UWVYb2hYRjM4L2Q1TmQzM21yaU0wWDc4K3c0bG1idkUxVW9NMDlWVXRtaWxQ?=
 =?utf-8?B?aEpuT3ByTm10K3hRQndLTEhoM2FoNlVFYTdJcUhSUjBxalhpeFIxdWE1WFpK?=
 =?utf-8?B?U1hQR1NaM3hHejZ5WTU3dFFTa0piU0xOT1NjRjVSRE9sOHRQSXQ4YTVPME1n?=
 =?utf-8?B?SDlKTEpJQU50MVJCODRmZmxQWk5CK3JjRkFsTERiM1RWeDI5MkE1ODE3Wmkr?=
 =?utf-8?B?bnZWZ2JaMUc0cjhFdG5WWXpybmNxZkJicWdnRmxTSVdJMWQvYm1xejBVN0hN?=
 =?utf-8?B?WnIwR0RzaXZCcE1WTHhIcXdSYlUzZkx6elNFY1VMRUMwbHJXQW5CUE1USjdm?=
 =?utf-8?B?eFdmbi9tR1JxRW54K1JCVVNLOHNHS08xeHM1OFpUanRhdXdDVEd5MkZ6bW5Q?=
 =?utf-8?B?MHN3R09haHJrVmRIVXRLOEpFVkRRL2FPWGtxRzNydXk4ZVFQK01SNmRzM3pi?=
 =?utf-8?B?S3BxQWhoYXdTTUdER0dYY2NWOVViM1hMcm9tU2V2cU5waTR6cTlKRWdIVW9K?=
 =?utf-8?B?OTh4WFVxRTBIZmRuTmlSZUFwNnpYb1RnenJXS2pucE5OYmZYZEdDZjA3WDhn?=
 =?utf-8?B?d3M0Uzd5SjdMVHZ2NXdYOGtSQjNwWXpHd0pYRU9qL3hOQ2JkZlJlRzNabENM?=
 =?utf-8?B?bkpHU3gxcngxQm15UE03QmtFUkxZN001dktmcXJkWHdPOFZXVy9rR2JpdDF4?=
 =?utf-8?B?TWJWYTZnR2pRRVJmL3FRUlIvelRYNVp3VjJ3ZHJDS2YvaU5BMFpSTUcydXRJ?=
 =?utf-8?B?RVpnSXpXeGh4dTlZdml0VVkyeXVKTGtsdlBaZGt4MS9EYUZENWx5QUhBWGFQ?=
 =?utf-8?B?Z3B4d2syd2tFRmFhRTR5MkNHWm5Ka282d0hLKy9WeXY4dGxuWmJlWGtuaE10?=
 =?utf-8?B?SXhJQ0txTDFRdUZ4ZlJleGxybnNHWDFSWnAxMTcyU2V1UFNnbmNLRml0WWZH?=
 =?utf-8?B?UFRyRkhTa1ZabmVTcXNqUlBadFVvZzRJcXVpMTdMVlNxZ0pweGxLcWdPZkFM?=
 =?utf-8?B?N0tlNm1JUG1MeEdkZDlSM291MWo0enU3R215b2xGVGM4K2tmcjNoSnYrdXY4?=
 =?utf-8?B?dDNyTnlWMkpabk1CaGh0N1QwUjhuMThvMldacEpCSkptTElSb2hqbGpjSG85?=
 =?utf-8?B?aVo3OUZCcklIQkxEbWxYU1FmSGM2S2o0STVZb3VTNFRVcXJ0Q2FCa28wRUhW?=
 =?utf-8?B?dG5KTmFhNFdSZXFrL3lrYUdXK2ViUmUveCtRYVAzTXRackQyMVBBOFBCNnZn?=
 =?utf-8?B?UjJ6Y2k5cHpzbDZJRHhIOWp3ZWhMYVlFRHJ3RmtlZ2RNalpnOHh0SnhjQnpQ?=
 =?utf-8?B?WVdpdFY2dEkvVzZZMlprR1dveUFKa1NzcGdwQkRBcFl0WjBHMjhFRk54VG5k?=
 =?utf-8?B?WDgvV0tsc2ozZXgwVUJTLyt4T2pFbG1lenpNSGxWRE1DTkI1OWtLaXBzeWRV?=
 =?utf-8?B?L21xYTJteDZTRVMyY1M5N0xLWkkvOEtlLzRSZDRjdEpPeTdnSTgwZkY5ckRi?=
 =?utf-8?Q?FHqIkp+sdMtDLsVzVHv0a1/1r1UtYprMzDjrL5bD9tUO6?=
X-MS-Exchange-AntiSpam-MessageData-1: 5xTkVU12GC9byQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d40564f-19a2-4c27-f495-08de6f89085e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:32:27.5584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HIDoRdoDl2SvPju/dFjE6lKLjabNajmgS7s2Ca+CDYVifkHs09cnzY5fAgxAIBUt0FRfbTlNIkZDC6wrXqIdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 30BD115CB24
X-Rspamd-Action: no action

The limit is 16 pages for a single command sent to the GSP. Return an
error if `allocate_command` is called with a too large size.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs                 | 7 ++++++-
 drivers/gpu/nova-core/gsp/fw.rs                   | 4 ++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f7f3cf2c7443..ae4aa7562dee 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -33,7 +33,8 @@
             GspMsgElement,
             MsgFunction,
             MsgqRxHeader,
-            MsgqTxHeader, //
+            MsgqTxHeader,
+            GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
         },
         PteArray,
         GSP_PAGE_SHIFT,
@@ -287,9 +288,13 @@ fn driver_write_area_size(&self) -> usize {
     ///
     /// # Errors
     ///
+    /// - `EMSGSIZE` if the command is larger than [`GSP_MSG_QUEUE_ELEMENT_SIZE_MAX`].
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
     fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
+        if size_of::<GspMsgElement>() + size > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
+            return Err(EMSGSIZE);
+        }
         read_poll_timeout(
             || Ok(self.driver_write_area_size()),
             |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 5b96f5e622a4..c604f423fff3 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -40,6 +40,10 @@
     },
 };
 
+/// Maximum size of a single GSP message queue element in bytes.
+pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
+    num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
+
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
 
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6d25fe0bffa9..334e8be5fde8 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -43,6 +43,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_WPR_META_REVISION: u32 = 1;
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
+pub const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: u32 = 65536;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;

-- 
2.53.0

