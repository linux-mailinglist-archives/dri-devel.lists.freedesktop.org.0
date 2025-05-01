Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B24AA5EB4
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4CF10E821;
	Thu,  1 May 2025 12:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N2lrbAHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7523510E242;
 Thu,  1 May 2025 12:59:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCY5FfvkIApLhe8a2IvHKJmopB9nuvPQa9EMClTazMWVdnVjbg9BWi8rGwCP927vSPbFKYTWV/Sk4r4JqtIuPHqdCuhFlVvenUNxhEI89pKaBykPpTJBiel9fsUDdiZt03zTFG71gntu1uQvMPfDMFepwX9mair8XTHTTzwo6Wh8i0YPPrn1wvE1dBivmMbCJg+LfhooSlMlZDhyhr8J4UKHXU6Q/OFTDuXJXMN+rXEDVy1qM9cga/vatamsnrDP1XnynKrcp4unvVmqym6hAj9ym9SB1FUq+++/pvxKIsqsKy5ScmN9q9MtAZAZXdc2+XYOJBoHFGTCZ1XmLEavxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5fn5BOL5M1i9E9djBbdLHqZ4DTyMzx3e+L+XnmzFq4=;
 b=pKY1ZfFIijmxHIGe3dIrBE88yNCFG4tQ/dOPqQ1ZxQ9KCGICjTrFTSubdU6MIvsOkXYyHIpyYvNyJdqL4eIYSD37QQshze0gHNvNKc4v09mXIo0yzxI08Z7PRNITi8M1jLaiMo5XQ6YJbRTQHjHzEMEtRBdTkRXxSiaZqbD3xCgX0c4w5pliTnE8zPqxXvZF8sA+ZHrbpQ1dmK820OEiN8I7q8G1ZehdlOSYs/i/rvQlPbXHHhK87WkRKfBjOD2gWV05CmpO+8XCOYtFgyIdDO9/Nl7Vc5AK6SB/fTFWFwPI0IbZM8TFKB8x0r4tWawVhtM0kibbHxNhSLuV3h2uJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5fn5BOL5M1i9E9djBbdLHqZ4DTyMzx3e+L+XnmzFq4=;
 b=N2lrbAHlwG/K7NQgQiO4qyzPU8aiW2zDDzCO2Yr/ogbP8EW6ZebgsRGi5PtkEj6E4OIofuMjMRmcIoGHXoTTZ+njn9JOW89Qegj9iC5L3cBMIy+3S0bqaDImK96ExlaGpJofdRgiK/lNJySAL4tJxUJeH8Q2jwh0wwEdoCYqnOK1JRtsTiIsYlOzfYcWW7rH7WZfvPCLzgz03eKZEIX2Uc3ADcF69oRSVTM5pBvtveaOc4AAxbIbUsnLT961GXknVvWL0WUxSRNltruSlRdvq492PMgOv0eRqN4cNV9FHz0ffBxuGiM7+Rt6qGRqXkvPjXOKzv986MENOu4sN2SFbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:58:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:58:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:20 +0900
Subject: [PATCH v2 02/21] rust: dma: expose the count and size of
 CoherentAllocation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-2-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a695e3-55cb-49fc-755c-08dd88afee4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGxUL0h5WTlYN1BPWEZuVGF5SlBSSHFpNm1VZjFodGg2enR2S0xHMUptZ09L?=
 =?utf-8?B?Y2l1LzhkbDFMOGJHNFNlbWVpWGE3b05ZSnlCVCs3aDlCSis1VTdoNzBWZU95?=
 =?utf-8?B?RTN3WE50b1FQZU0rd0QreXpQTnZIVWhKYXR5M0N1a0JYTThlVTdiTkc5ZnE0?=
 =?utf-8?B?V212RUxJNUF4TDBOaDU2bkgzci9XY0lsZTRTTUVNQUViRVNpMEI1V0piM0N2?=
 =?utf-8?B?VDczYVdLL3BEZFdlSXJOeWw4MHZmenRHdHhTaTliWWQrZytzQ0srM0hKS1Fn?=
 =?utf-8?B?YTJMZXltUnJSUjBTaWFzUXI3dmZpdi9MSUhLZVprQXV4TU9IQnROM1pkT3Nt?=
 =?utf-8?B?ZGFzZTJIY2FwTFhIRG5vMUduZVVvaG1MT1ZvNEExVnc2cTV0TkVTbTRuRGRC?=
 =?utf-8?B?RjRBS2lzb3A3MlU4K2p5eG9SdktSRnFXbWpVWXI0eXNNeTVDbGdlZXpFd05m?=
 =?utf-8?B?YXJVZGhtQ1FnVzhrU2FpaWRqdjM2dTdENzE3RzRDZXZZdnl2STVveEgxV2I3?=
 =?utf-8?B?dkVEN1pxc2ZFWjMwSlR3Z1lFc0d0cG9rMlFic3pPV0JoVzZQVmxSYTFuUU8w?=
 =?utf-8?B?NFQwRGlHRjEyY1c1QnFJbDhDY0kwTDhmZlhlK0JyNERYb3lSa1NudDQxVXR1?=
 =?utf-8?B?L1A3WXNyM2UzblJkOUlNMUtySXhTZ3libWNvWTVlcUVRUE96RTg1ZUJSa1Uy?=
 =?utf-8?B?bVBsVmorcVdDME1uYTdsbkF2cHpPZFBERms3ZjJubDdIVlZ3TEljbUZPbEk2?=
 =?utf-8?B?aFc4azNLVW9FQmNwUzNFUll1dGpHSmZndHVXSlN2dTVqc0dXZy9CMk9KVEtS?=
 =?utf-8?B?WitYOStRREZnREVSczJBRExDSzZoMi9BNVlHVkUyNURuaFZFV01ZUVpHMzF0?=
 =?utf-8?B?ZjFtclZQNDhHN00vaVRpTWN2ZFRIZkVZNnFmRGY4YWJiblFZS0JyNE5YY3pK?=
 =?utf-8?B?azFMYzNWZm5zTkVNZHE3WVlLcGZMYXFlY25jdnMyRzgvRG1uZGUwd1kyNm5M?=
 =?utf-8?B?emZTdWZuSzdsZVF6V1E1R2R4SVdER3lwbkkvYVFsZWo4c25KTDViR2ZrSXBs?=
 =?utf-8?B?VnVSNWV1S0wyQjNXVXk1YlRRRXc1dGkrV2UxR0Jwb0FPZ0UvU2FBYXh2UVgz?=
 =?utf-8?B?SWg0ZEtsQ0RwM0FBRFVrVUwzRzQ4RXpuUDM2YWhuRVlGNHg0NmFieDRrSzNk?=
 =?utf-8?B?UGR5dDVhaTVzditWOURsZkdvZCtTa3FEYzVKL2M3Vm9HUmFLSGlyNFNiaDVo?=
 =?utf-8?B?bnJEY1VEb1o0NnZZdG1WUFFJeGFDKzg1M2JqZjFJMmlVdWpCQURyZUZicFFH?=
 =?utf-8?B?NjczdjB5WkRJZWZod2FneFdlSGI5VlhENnkzN1Bza1d6WHlLemh5WUlqWHFu?=
 =?utf-8?B?cHQ5SXU2Q2pvVklrMFhYM1k3TE5pam9RbWVjdWhEWWdqa3FPMHJROU10VGNy?=
 =?utf-8?B?L0didkk5eFNmTzVkQ2p6Z2F5QVdXa0JDZEZvbVlhUjhoZGgweXJ3T0tldVly?=
 =?utf-8?B?Ymx2bnZzVWoxSlZXbHlWc2c0cklFTmJDQVZ3clgyNno1MFVEaDdRcnNrTmtL?=
 =?utf-8?B?cDlUTXplK1VkdXFRV25LSlNFNHloSS9zdlJBM1FsV0lBTFhZbVFDb0hmNjh5?=
 =?utf-8?B?SlRTSE5WcWR4dmYya1Rkcy81bW5uQ292RCtZMUtBcEl5QnJDWlBEWlVldkI2?=
 =?utf-8?B?Ynh2S2J6Rjk3WDQrRDAxTmYvR2xNSytaZnZSNHdOTVJNd0xqUG1SUTNzRDlo?=
 =?utf-8?B?K2dFa2dlazR6REJINUppUHJTcXNCZzN6Uy93cDI2aXZDN2VJZXNSTkxCOWd6?=
 =?utf-8?B?aUVwZXBqSm1icEN6RDBmdStwdVVaWWNNNFJFTVphWkJKUjV4MGZoNWNzck9k?=
 =?utf-8?B?L1NLZXRiYWxsSUJ4WDFsaGo5ZWhnczJ3QjZYWnI2RFduUFI4em5UZEwxbDhK?=
 =?utf-8?B?emh3eDU2RndwTjZWUlY1QnBuQ1RzeTVPeWY5bG1tTDhCUkphTW5DRmwrOW92?=
 =?utf-8?B?QVZNdW1YYXh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGxMMGM5dWVCWWFRaDg2Nk5VaXJaanc3bjVWRnlZYWI4dzM4QUp0UXNkZ0R0?=
 =?utf-8?B?dU8xREc3MW5ZTngyd2ljNHAvVFNBQ1VJaUdkVXRpUTR4Vnhydy9VSXF1b1o3?=
 =?utf-8?B?WE5PeVZGdEViaFNUQk9rdThwaFZKaE9ZdTM4b2tsMUV3NlVGSDFUa3J6Z0Uy?=
 =?utf-8?B?V3ZhaDhVRXNpendhT3I3RUZsUFlLZE9PdE9GamcxQVZsWStuVElZQVg0ditl?=
 =?utf-8?B?Vnd0Q1RaT1V0dkUrVktHWVBZRmljb0xNZXZXcDYwMWhJUWtOM095K3JGaXh2?=
 =?utf-8?B?UWxvbEkyeFlXWUdRMHlVdWZMd2VobmdOOU9uanFaZS9BV0wyM2lmUTMwSThw?=
 =?utf-8?B?ZEYyTitqYzZUeTFVOWNhTUFKZlFTSTlSdzMwUlNkQVExS2ZaYWxLMTFVSzYx?=
 =?utf-8?B?V2tianRsSTFnUGlRN080V1NYYW5NZHJnV1JQYi9sdVhHZU44WWdEbUFzU0Qx?=
 =?utf-8?B?OUs1NFhTZ1RLaml0bGgxRzNibE1oTFNBV3pVaUMzaFVsdW9YTHZYbHo3TjJ0?=
 =?utf-8?B?ZFhFRWhwcHY0VkJOVWF2QVNFT25VaFBxUEtmMWtsWndlbjlkZ0o0dUxFb21n?=
 =?utf-8?B?bUx5TFh0Sm5GNTFCTkVDWXgzeUpGMGxXN0lueEtNV1k0MlJUbmt6U05LTXpr?=
 =?utf-8?B?dXV5djNVZ3JiKzFjRGl2b2w2MW0weHNLNFFBKzFQclE4MkNzQzB2QjRyRnZ5?=
 =?utf-8?B?MzRCTVNReUNQSW93dUdKL3BKSzNSY0lyamJqQmNXMXVOT1pWL0wyZlB1K0Jv?=
 =?utf-8?B?VVNVVFBtT0JZMjJCeHFOOTllQXBGMjJ4bk5vNjFPSnp5UlRsMHFIRXhGWFll?=
 =?utf-8?B?WEkrcmJmd0d0MktjWW1VSlI3OUpDYWxSeXZrZkxMWHd3MUprdklCaENTKzNI?=
 =?utf-8?B?ZzV0NjlWeUNNcXNsb3BNSG1pcWNuMjNZdy9nK3REcGdHblFvSGcwTm9uNkZ6?=
 =?utf-8?B?UWxKQnJ0ZVVxY1pleFNleXB5WGc3UkVYRnJFTGR1VUtTamNDcms0RXVjWHVG?=
 =?utf-8?B?R3VlM3dDMlVKS0Rid1EydmVZU0NvNzN3amJXOGpEUWxRTVZDMDRpb0xzbWM1?=
 =?utf-8?B?MTFhYjRhS1oxZldnaEEvK3FUZnI2Y0UxTldMRC9aaXdnWGtNeFlWL21sRnZi?=
 =?utf-8?B?c1hGRlYrZDBHZEJ5MHBkME5RWEFPOWg5QlMrSFhaNUpBNlNPMmYrcW1KNjlC?=
 =?utf-8?B?QWNTR092dzB0Q3lYOGhYemNjcE55VFZWNkRpcWx2Z3hHakVCQXhZZ1RMVnFJ?=
 =?utf-8?B?ZVdVY1RNSTBWL05WZEdNc2Z4bHJQS3FKaUJVanU2Mnh3S0x1bWhETVNQTzJh?=
 =?utf-8?B?UTR4TmNaUGVyWVk4U3F6S1EyTEFHSU9aTzdldy9hM1Y3U3VBNHJwNmtzY3FB?=
 =?utf-8?B?Ny9TdTVaRkJNN3RxOUFkRlZ6bm01TENRRXNLdEpMU0R5Vkg4R0RFWVM2bTBV?=
 =?utf-8?B?alpJY0pObk5TYVFMdEVtM3oxV3Z3Z0VuanpBYWowamRLcWJnWXdZWElLS0VF?=
 =?utf-8?B?MXlNZ3UxOUtaUWVPbm5Hb214SHJBTlUrZDhhSWlxbGdUVHhlYng4QWFkQnZU?=
 =?utf-8?B?cHVRNTdnZElYeU1CNEtVN2pnSzAvQTlLSUZadVdhTXZRRTRHR3FOVkcrRkc4?=
 =?utf-8?B?UHhLUlBHSEtoQkFpRHZVNjNBZG5zQ04vS1YrUG9rY2w4TVdmajBBaFdwSWU4?=
 =?utf-8?B?dEpZdzFoM2ZtWFJUWUNJc1h5WmdPNDBZNHVKNk80bGZOSVFIQnFnWXk3QlJu?=
 =?utf-8?B?N2gyUk5lMk51cnE3emNxNkVGd2pTTGllL1YxazZQNlRsOWFiajZERC9BczdI?=
 =?utf-8?B?K0V3KzJVV3pzYzFzVmptekN5RWFOeHVpVGFERWc5N1YyUTY1TDFLRFhTQXYz?=
 =?utf-8?B?VDlmZzd4YVYxRVI2QUdLY3FPc3RaVjUwcm9ZMVR0Q0RNMncwN09EaFg0QUc5?=
 =?utf-8?B?Mm1WT1RoMkxTSUtta1pwdFlQaEc5c3NtU3J3R2FWaFB4YzJhTFNlR1FxcVhO?=
 =?utf-8?B?eVdOWU1aN0pJU3BLdm1JUmRjbkcvUmNGdW1TellONVBpSS82VjFzRmM1UHZ0?=
 =?utf-8?B?cXpyNkdOVmFkTHRmMnNEZjErRlJXUU5vOTJjekdnL2RNdENXRWczQ0VKcW5E?=
 =?utf-8?B?N0tlQ0MyeUlPenBTMVdKWW52alJQWGd2bmwxZnRzMk1yektzVExQVzN6eHdJ?=
 =?utf-8?Q?zPj7NteuoGNQyfLIWCtK2QuaMua7c4N/nFkgxeZQ1pcx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a695e3-55cb-49fc-755c-08dd88afee4c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:58:55.7223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCWfcZbu576/IJW8mgtY8rOzHtPgsFgdK0REsqTP9htT7ozNClMoBdxNfcDHl5aEw8vnYKg2+zi9tK8N7RSWwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

These properties are very useful to have and should be accessible.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/dma.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 605e01e35715667f93297fd9ec49d8e7032e0910..18602d771054fceb80c29278b1945254312ed7c6 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -201,6 +201,20 @@ pub fn alloc_coherent(
         CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
     }
 
+    /// Returns the number of elements `T` in this allocation.
+    ///
+    /// Note that this is not the size of the allocation in bytes, which is provided by
+    /// [`Self::size`].
+    pub fn count(&self) -> usize {
+        self.count
+    }
+
+    /// Returns the size in bytes of this allocation.
+    pub fn size(&self) -> usize {
+        // This is guaranteed not to overflow as the same operation has been done in `alloc_attrs`.
+        self.count * core::mem::size_of::<T>()
+    }
+
     /// Returns the base address to the allocated region in the CPU's virtual address space.
     pub fn start_ptr(&self) -> *const T {
         self.cpu_addr

-- 
2.49.0

