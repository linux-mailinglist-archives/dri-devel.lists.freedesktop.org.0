Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107EBABEC35
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE0410E65C;
	Wed, 21 May 2025 06:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oi4HKNKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428AC10E670;
 Wed, 21 May 2025 06:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3Rle8rDQxc1hGY7hE+Zm+pzbGRiAeh/6OW+Uom7t08IyxMBcNpzKOstkckBkcwPhJ5NfeinBmZDFodkRI4xNbaSJr0txb7HMIDC7kXUipe8JQ+YXuQE5o1ikrJMtz/0qa9XknOKTsPABefqdEdzELpwPVVeER+2s/nATK4D9IIQlIXSS2eaTPXM6Q7NgM3loahNL5pUDeYdLGE9IratDF5lWhJ/43tfWoYD+uhhqiFxlJCGdNA4oczeytnazLn9S/00IPeFk5Lv4lA/pxc7WLnDgtdFdjWj49CCyC1CDb6IdTadKnScpRXbfofTd4TU2cFGAQZfV90XxZ/g6B9gVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuoNwnRxjN0jis4cbO+w6B8znLH3mcemWH06Tfp6MxQ=;
 b=FSCjjn99YjuxoLVuLl8mD1/vCmjhtkr7molil/JU8XFr5XeEWX5UwY2oB3Ky2axjAUD8XiUrawgCEo5Gerc78/w7iCQP+oUGKM1gkp/x7J5O88KflxHPlp9Pkg6qOm3iPQqSuTY3uLRmyW4Oc8DZcQP5l7EMzxyVf5MDwDchG74tMyP1PZxLflZt7RhpD6UtceYVU9Huy2Mhaz3gU+dyGd/+PV6+5JJtNje4uwXV/eEjrkcth72lUnUK4RQVxjJ5+q97NfKG/Px8jp6dWNScJVI3KRnQZcBKTdIvahHDAaTzsfzFtx729RxanJTvZJXR/BufMfw0BhyxeEOUWbmdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuoNwnRxjN0jis4cbO+w6B8znLH3mcemWH06Tfp6MxQ=;
 b=oi4HKNKQZjFv8zTyy1hjYrUbImu4WJuCsybZ9a1htrvTnHoUYO3Jr1TxgSXCF3QLFHqVMj6YNJUB9110bzg6HhGFC1ADhLraXZMcmm0OSUMxOxseGXSWEwAYvIE8ugK4scR6T88qzgA522UkLBJBTETDddXDPPQCEFq+wsnru+VdBjJeZ6ZoPMb1xGIQztcbV90xfelzsiRMleUuBUHqjK6yhM7aqQaM77bxuMKxlzefpZur3GsYEkY7vK5SiZTrbjqmpYdhFlDODtVhXlTORkZiLD2tI2GtyTd9YMzcw69wVHdjJmyW9bgbWyQ9iN4lhSNv8oBSL1yu/GKxOrbwYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:50 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:08 +0900
Subject: [PATCH v4 13/20] gpu: nova-core: register sysmem flush page
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-13-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: d60af8dc-86aa-4ff2-9013-08dd98332015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXBhT1dkeFg3MHFvNEg5WnlzM2NVMnBYNWgzVzZIM3AxU3RZVm8xcHc4TGo4?=
 =?utf-8?B?M1dsSGVGZDVURmt2YW1lOEJrVnJ3L1h1YjRjcHYwVEtVaU5NQ0R1Wm54QWt4?=
 =?utf-8?B?N1hYanhPdWpRellOQVpNVi9QWlFZZjFGSUUxSWZFUUE3UTk2akQ4c29xa0lJ?=
 =?utf-8?B?TTVmOEFxVTI3UzhabzQwMlJHaFhEdEVTSlZsYkEvckpCTlhBcVVJSGM5cVZW?=
 =?utf-8?B?NmJyOFpoc1NCL1pJbDJuV3d3NE1qM2Y3RVdUU2xPUnZCU2R2SUd0L25YQWl2?=
 =?utf-8?B?Yi80V2xqSlBETTNjWjBrd2xZeDNKRlFIcXFsUE1FVkF0azI0NThReU5PZHZo?=
 =?utf-8?B?NWw2MmFmMGFXdmxtQlBDVjJBcStRNzNqY0VPcDM0NWhMOWp3K25Qc2JmMWVw?=
 =?utf-8?B?cTFzQ2FmOWp1Q2pPdlRBMEdqRVBzMVBRclUvWHVNN1RHOFpjcFBCbkdsTEVC?=
 =?utf-8?B?SU9XT0didHlWUEh5aG5odVVTOUdoSHN3NXRkd1ErS255RWtFR0pSKzBRUWNZ?=
 =?utf-8?B?bWwvSEY3N1Y5RUllRGg0RW5SQ3BvK0Y0aWdJcUoxZDFCN3V5eVlnTG5pVjhm?=
 =?utf-8?B?amtFRmN2c1hqQlV2TlplSVVGUFhITkJDWXArNmJYS3BZZjBHWS8rS05jTnlm?=
 =?utf-8?B?VDJxVnRTcE04VElvVDZMbCtoMFJ2a3VuVXA2MjN5TU96S0ZFbG5aaXlJZVJN?=
 =?utf-8?B?WU5EVnVEQ1Y5WUhuTmF1dVlJZHlDZGc4Mk8zMWNvWk9QL2V4OVR1N3JpZk1C?=
 =?utf-8?B?aE9sWXhNcEVHSDBWQ0RsVjhnTXp2TEdYa2NrSmpmcko0U1ZSakNUd3Y4TTY3?=
 =?utf-8?B?MHFtMHBiY1diN2NGZkgzMm9CNjFMS2h1NXlsM1JIQ0JzV1V4RERFb3NvdEx1?=
 =?utf-8?B?bXVEa1Nlc1VBTDY0Y0RvNzYva2FQWnpncXpxOWExTkpEU0tuU0ZJaUljSWNU?=
 =?utf-8?B?R05RM0UvOFg5ZUJyUCs0VjdjdTFsS1hjTWpqVUVFblc4S3UzKzVDUWQ4Qzdv?=
 =?utf-8?B?VGhVa0NGcTdoVWNzRE12N21ab3JPTjFqaFQ1LzFjOWNRSytuakNSYWdCODU4?=
 =?utf-8?B?OFNVOE91VGdMdmIrVGtHYy90OXNOL1o0NTkxUzQ5VDdYOGJCSTZnR0tlb3dU?=
 =?utf-8?B?OWg0Vk85OVJaaEpPNStUWlVoTloybEgzL0xtTjJLQjdNRWdkS0pOWG96MWZ6?=
 =?utf-8?B?V2NFK05USlpjclBuS0RScXhKb05QcWZVZTF4NHR1OFZSbUh3M1N3Um5zL1Np?=
 =?utf-8?B?cVZ6MWN2cndvZTNMcFNDRkcxd2V3VXQ0TGZDMksrb1hyTi84QllLcFlyOFhQ?=
 =?utf-8?B?MkxoYythbzEzSElZZVZwM3U2Y2pkVDVkNlJ3VGd2K1F5NFhoSmkvbFc1QzF2?=
 =?utf-8?B?YjRFZ2VsVnFDL2M1WE82VGdET0c5aURaY09BZlgrSEhIWXpjbGlVcUhRUXJO?=
 =?utf-8?B?VjBFcG5XTmp0bS9GL2xubGUrT2h0ZWpCa2xTTk03eUtDSGsrK2tndmtMVk5L?=
 =?utf-8?B?NFV5SDFWZDU0aDhoMVF1RGY5TnBwb05WZm9WekdkK0Urd2RvTXZsTXVlQ3Uw?=
 =?utf-8?B?Y0ZRWkdZekVncW9FVkwwa3M5T3ZVVHVNNWE0MjhiZ2RRMUM5dm53REdtN3Zp?=
 =?utf-8?B?ZXYwMXlVY2xvZ3dKTTFQcWEvMkR6OHg0UEIzaDByS2hmTVREUTNNN1BTWVl2?=
 =?utf-8?B?b01xVHBRUVlYSDN0WHBNa2c1QllXNmkxZTVQUnNaeERZQlQ5ZDRVTCttcVZY?=
 =?utf-8?B?Z2JYamxKWlBEWEw2RFFJMnZwWWVVQmRLV0ZqYlQ0M1BNL0VUdnRlRXFNQmVo?=
 =?utf-8?B?THRCenpSd3FTVTJ0ckIzOXZMMGpMNXhFZ2lDYTRBZWx6Mmh1Q3F5R3RCQWl5?=
 =?utf-8?B?bW0rWjNrTGh3SjlHS0ZmK1VWZGp5MjNvSVNTeXEvTjVWWDdJR0VUSEtQWGN3?=
 =?utf-8?B?UCtKYXVIWWFCSkg2ZWxnOVZES1VKVXYvVzlBQTBOMzk5U3NRcnFBd0MyeGUw?=
 =?utf-8?B?Yk9OV2NQRmtBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1FyM3ZTOHQ0K1JESE40Y3c2UTZpM3YzZGZQTmpEVm1vREFxdVNVOFdvQXFu?=
 =?utf-8?B?SC9IZG93RllSK1hvYlBaaHc1Y1V6THlTelhwVGJXRWRTMnNPdm93NXoyZHp3?=
 =?utf-8?B?R2dKelppYUc5WDU5QlE0aHVoS2FXdjhKZTJpcXFnY0tLRHd1dEhKRTZuMGI1?=
 =?utf-8?B?TVJodVNqRlFaUUhBWlRrdXZrMEc3VmF6TVpwYjJzYkViRlJDZ1NHVHRHSnNJ?=
 =?utf-8?B?T1Y3ZXpSYmJkdVlabFBkNTRmcUlYZTBzSFc5cHI1emFIbUxBcDJpVDVEOW80?=
 =?utf-8?B?SDA0TWQwTGhJSTZabnVFMjkwTS9WSzVYRXpnV2pKaXcrdUN5ZmhiUlBUYkNH?=
 =?utf-8?B?QlJDdEJYMUR0YkxvSnBOTFVyYjJ6bFpKYmpTNjlzVXJ6SXc1RUdaK2xIVEpv?=
 =?utf-8?B?cTFXaVFIdjZDTGdyTVFWMTArQ2JnM3BNZmZ0SXpKV2pjaWRWemVvbllMNnNz?=
 =?utf-8?B?ZG54S3NLMTFQQTBER2c2cERSZGN6eWlFcDNSL3k5bHVPMWZhWGtLdVdDTXhs?=
 =?utf-8?B?WGROVTVCNWVXbXF5NEpoUGozR0UyVjA3TUZZcFRnTG14YWFnWDBCNmVGM3da?=
 =?utf-8?B?SXBJbUdLZytOUHM0UlFPOWNCWGxQbEgwRmRVVyt1K1A3eGZRVUpEV252Q3Jp?=
 =?utf-8?B?eVBkbGNyYnBNdDErUkV4WUpKVXpDdHdkYklWUGwwY1NRVStIYW5xL1BJUVZm?=
 =?utf-8?B?V3N3TklHQzNtanRpRmtuN3dxUWJvNUZ2V3VwSkVoeTRUNU5lZGdIRkZGcDBt?=
 =?utf-8?B?UXc1RHpZcGVLa29pbzN6dk1tZGNTaVl3NTc0Q2llRUw4Z3pPa0gwQUVUcitk?=
 =?utf-8?B?YW8rTU5QVlZoME9zZDVhdXgzcER5WGIyckRFZ0ZnTjJHaWdiZ3g0RjJCR3Bi?=
 =?utf-8?B?alhDNVpndk9IK1N1VVRkWnRscWZ4SUJtRytGalo0ZjVqbzVnekNHUkJidk94?=
 =?utf-8?B?WTBTV1cwdXdwRXJnZXVkVlhPVkt4RTd6cGhYdHFsd3VPS0g2UTFmNm1jMG9U?=
 =?utf-8?B?NkxjZDh4YkQ0Z0Y1YTZtQlMvSTI5dHBlc3grN3dadmRqSEFLcjdPZm8vZW1Y?=
 =?utf-8?B?S1V4bFV6bE80Y3hJb1BvNFZ1Qm1Kc1RsZ3plT0lXb2Z0RE56dWhHbk41UGVl?=
 =?utf-8?B?QWh6SDVFTy8rUVJVQWp5dEdBV0p1dkVZZEtma0xsZXBKUU16cStCMjRKMFJY?=
 =?utf-8?B?TXF4YnRCSTE4WStXVHhPSUs5WFI1MHFZb0VYK3NQWDhSZ0E4U0dRNzJGWHp4?=
 =?utf-8?B?bzB4RnVLSVNQbTRlTWlYL0lHeDNSOWdhWk1RckNuZ2lMUmlUaHhna1VDeW5v?=
 =?utf-8?B?bEs2dTZxMWd4VndxWEk5WVo0TVFYckhmWCs4UklqS0NTWklsdnJrTEwvSDV0?=
 =?utf-8?B?SmpGZlBrdG1iRFBnbGhBUjBzOEsydEFwNklBaDZZVzNHb0ZFUm1WVXZiM2Fm?=
 =?utf-8?B?WVdqV3ZIOWJMMWlJamcva3FYNCtUSmRuS3VobVgxQ3pPNDNYV0w0WUNkcExZ?=
 =?utf-8?B?VVFEcTlJRGY3Z00rVTQrRXJ2b1lycG14S0x5dk5iQUgrWElSU2xMUTdzbW5s?=
 =?utf-8?B?VzBLM1lYSXpzOHEzVEwwcFN4YXBySXVUM2sxNE8rT25VN3gxYVFLbE85cllH?=
 =?utf-8?B?VmZ3Z1IrVld5Nm1oUWRqUFlpWXNBbzFHbVI0MzloRXFhamg1c0F2b3RkcTVT?=
 =?utf-8?B?N3o1QlBmSnFqQ3BmLzZMVFFldm9DTmpjM1NTNU94YzRNWFcxVDBFdWVEYVFW?=
 =?utf-8?B?QmxvM3ZubFYzVzNXNG12N1dpU3RmWnJmdDgzWGQwZUZnZWx1clFyd3pycUY1?=
 =?utf-8?B?akVLSGw4Smk3Tmg4VUVnV25UL1c3bElIYzQ5a01naDFmRy84TGdkeHg3QUtU?=
 =?utf-8?B?ZmVIMENiRkR4NTNTdHJuZ3FoTGI1Y3hQR0QwQjIxQmc4cjE5T2ZvaEh4Ty9T?=
 =?utf-8?B?bU55dDNIeHJTL0RWYXpMalNHazdRWDJGbWFIMWcxZUtldC9pUVBPMjRNSnpu?=
 =?utf-8?B?cmxKZU10SkQwQndEdGg2QVlxZElLeGFub3dtZjlTdnlmUmpRdlFpanBkNnVD?=
 =?utf-8?B?YWU3R2dIc2ljQ1VQN2lqWGZtSTZZM3JWQ3BsQXF4eFJsODR5YmlnSEZDRG1D?=
 =?utf-8?B?aDJaTzVlSXRIdEhDeTlXM08zWWVUSll1TFZXSE01UytJaXluZUI5eHJiZGZi?=
 =?utf-8?Q?d0N+iEOwiv9XUUPJmGWXLKOesycVhq+/Q41rYeldC2us?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60af8dc-86aa-4ff2-9013-08dd98332015
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:50.6752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99tihkP3WVbEb4WS4CNqqBHlEd9miHyhBUm+poOmVeWkj7zIboP75rJZmU0aGImrwvL72mZd5kNzBEY9sl5t+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

Reserve a page of system memory so sysmembar can perform a read on it if
a system write occurred since the last flush. Do this early as it can be
required to e.g. reset the GPU falcons.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 45 +++++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/regs.rs | 10 ++++++++++
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 50417f608dc7b445958ae43444a13c7593204fcf..a4e2cf1b529cc25fc168f68f9eaa6f4a7a9748eb 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -2,6 +2,7 @@
 
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
+use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
@@ -158,12 +159,32 @@ fn new(bar: &Bar0) -> Result<Spec> {
 }
 
 /// Structure holding the resources required to operate the GPU.
-#[pin_data]
+#[pin_data(PinnedDrop)]
 pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Devres<Bar0>,
     fw: Firmware,
+    /// System memory page required for flushing all pending GPU-side memory writes done through
+    /// PCIE into system memory.
+    sysmem_flush: DmaObject,
+}
+
+#[pinned_drop]
+impl PinnedDrop for Gpu {
+    fn drop(self: Pin<&mut Self>) {
+        // Unregister the sysmem flush page before we release it.
+        let _ = self.bar.try_access_with(|b| {
+            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+                .set_adr_39_08(0)
+                .write(b);
+            if self.spec.chipset >= Chipset::GA102 {
+                regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
+                    .set_adr_63_40(0)
+                    .write(b);
+            }
+        });
+    }
 }
 
 impl Gpu {
@@ -187,10 +208,30 @@ pub(crate) fn new(
         gfw::wait_gfw_boot_completion(bar)
             .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
 
+        // System memory page required for sysmembar to properly flush into system memory.
+        let sysmem_flush = {
+            let page = DmaObject::new(pdev.as_ref(), kernel::bindings::PAGE_SIZE)?;
+
+            // Register the sysmem flush page.
+            let handle = page.dma_handle();
+
+            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+                .set_adr_39_08((handle >> 8) as u32)
+                .write(bar);
+            if spec.chipset >= Chipset::GA102 {
+                regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
+                    .set_adr_63_40((handle >> 40) as u32)
+                    .write(bar);
+            }
+
+            page
+        };
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
-            fw
+            fw,
+            sysmem_flush,
         }))
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index cba442da51181971f209b338249307c11ac481e3..b599e7ddad57ed8defe0324056571ba46b926cf6 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -38,6 +38,16 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     }
 }
 
+/* PFB */
+
+register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
+    31:0    adr_39_08 as u32;
+});
+
+register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
+    23:0    adr_63_40 as u32;
+});
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {

-- 
2.49.0

