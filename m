Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C99C18F4D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5749610E73A;
	Wed, 29 Oct 2025 08:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TdtzgHEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F71E10E73E;
 Wed, 29 Oct 2025 08:18:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUHo0g1MV7BejbAgO411qm5aCkEKTp/kxPPnjq93yExdvFs9GxUJgW24VSkcGnY3pUgwGyFCYX8p7Chu9HYNABrpcIGUfnv2QZSvrTq/i+jgqRGvGAFFikhb1DF03tvT7p2eUwIphRYkR7JE7Hjsh49VyvKqcsLobUN+PVC8VO9mi0S91vbeox7ATs64/jD5bDAFe1l9RyQl1kWOCCWkk6PO/gcNq+bqVfcPvxAeXl1oMUUE9JD1uIQn+j2aJXVf6rSJImm1M2iE3CVSt8FvUc26MakF/TZj7aym3rENJ8v57XMbNsWtV0H69g8sqViol5rSnnVGtJkcjN76USqCBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqMNznBA5DSNkJPw0xog6XovbjQ+E8MvTKP+peL6CQQ=;
 b=dd53DqI0ZQGv3GNlxZbyOeK9sHCvWMFmnkd7b8iDtV81LWk4LExeYPluOj0Csdpe74b56m2TkGWUV7Kyu1PwaPz9Mqm6yTgV6TV0SWxHM266mOXdqfRpDLBqdOvTpJaoOL7zWj2PkIsgwr9uTyuWDU0Lzr8PS9t/+t/mIq1aDVXQfUUfrohcZWfTr/fffUXNWr7Xn0f2BEFuU5Ka57HDywfqNlytuYiPgHGiA0CrE3I/WqcsgLBiyRDutXTIphvD7BRszW9N4dsc/VPpGS9+OJZzDbhOyG0L4Z2rxnC9wlkBnwQn0XBnRYo4hOx2xf0GlYOwi+nL/Kfh6njaHoUYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqMNznBA5DSNkJPw0xog6XovbjQ+E8MvTKP+peL6CQQ=;
 b=TdtzgHEFj/YsZvcCHB3zXKS8ruUXKj4OnOkZ7Ye39lVQqm2p2UVgR7qfIkGnSNkyKgsO2W7qXwAafpBoKtYaLPB026PpSkN0ppXYLjC5R/ldQO0Pm+rV439XqZh12XE2Udl8J/cUD/RC0a43X1h/ivHqMNRhxWojUtpilxewtZd6ecu9EXTiz8ZGhQNSD591WE1+1fifQsb18z0a2j7OqurR2iNisSlKD1niB91wNMACzZDZsXXGJ9iqidaW6700UlnZallH1cu8f3mRT0q826x1n+JhH970Nxa1bKl+bFPeAoXbUyXZkFkg8PGXy8ccKyiWeBt61aaDQnqoiBSTDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by PH7PR12MB6785.namprd12.prod.outlook.com (2603:10b6:510:1ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 29 Oct
 2025 08:18:35 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:18:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:40 +0900
Subject: [PATCH v7 13/14] nova-core: falcon: Add support to write firmware
 version
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-13-34227afad347@nvidia.com>
References: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
In-Reply-To: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0042.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::10) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|PH7PR12MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 2319a8b8-2b3d-4ef9-b2c4-08de16c3c0ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEpjQ01SVWNuRXVvSmpGclIvZmpoQUlIK3BvWDRORUs4M3crUVBkb2FLK0R5?=
 =?utf-8?B?ZCtqbndNR2crOVBwbTNHTkdwaE5TOTdpVlhEZzJPQURuS1BKd1hVdE1hN3ZH?=
 =?utf-8?B?OGdQY0xuYjhhQWk3enNIUWEzLzU5UTNDU0ZYeVprR1QrdVJSTU5GSG5JUit0?=
 =?utf-8?B?N1l3Wmx1YWRtR2pjK2pPaGtMMC9sUmVJa3NMeXBTUnlQZlpScTgxbjRLZDNm?=
 =?utf-8?B?WWtpd0ZOcXhBWm5ySUJ3Z3laeDljZVJ5blc0WUZneVA5dkxxR1d0SjhVam9q?=
 =?utf-8?B?bkZ4M1dMQWhxQ29tTXNLL29oeWVNeXBaSzlHTWErb3VkOHZSRzFRdzhYdzNw?=
 =?utf-8?B?dzgrbDBDK3pLVDlweTV6S0ttbUxpYzFON01DVHR2a3lETUZtYWxwS0tXVXhR?=
 =?utf-8?B?aUoyYUc3NHVOZ2l3V2t1TUw3dUpkTEN4NnhvZXlaWmlIRXRoMWc0SGsxc21n?=
 =?utf-8?B?YzYwMVorMkYrL0xEcW1LYVd0RVYyYUdwZUdkUU1VWWNTRGszM1V0SGNFOUdn?=
 =?utf-8?B?Mlc5aTJGNFJJRkVpVnZaY2M5YngwTjh1cnZJWWNQQnBSbE1OQ3ozQ2hZMWxk?=
 =?utf-8?B?cUtsbVcxNmdCK0J6YUUvZXJ5dHJZbTdiQkd2TFloRit5TGJMc3hCUjRvSG1Y?=
 =?utf-8?B?WXJQUXYxTjJ1MC90Y2E4MUFnQnFJZWRkbTdTVDJIMys1R1pyVzlPeEdrS0hq?=
 =?utf-8?B?MzlndkYrbWphMmNVZmlIaEp1QkRESlFzVHoyZTZDZXNHbUVjY2thU2M3ZnRR?=
 =?utf-8?B?Y09CY3RqZHY5U0hRTmEzTHNvZzY1bU5PUkFHTUhJeWs1TzBhbjVFSHV6S0k3?=
 =?utf-8?B?ekxkYjRScXZYQlhPMjFLcy9CcDUyTXNYK1dZTTM0UXczanhlS0sxSGw4OE5S?=
 =?utf-8?B?bjZaM1RFa1FUVm0vMk12Si9xNE9KWXNpcm9xVUhTTFlBSzEvTHBRUFdSdSti?=
 =?utf-8?B?eFFBOVJHdU1RSWJvaVAxMzdXdUdQVm9xNUFiS0xpbkI4bllLcjlmUkRtOFZi?=
 =?utf-8?B?Y2xDYVZaejhONVYxY1RMVVlPQVZwOU1CTmFrVEdyc0dneHRTWVpUdVNRZ3Ro?=
 =?utf-8?B?T2Rad1grUTlMS2QxcTByWHladUU2OVRjL1FZYkNwUzFsbloxSlRUQ3NPVHMr?=
 =?utf-8?B?bUZIazlzMi8vclBoQTMrdG0vQTVVNWtCblJtRDFxdTJodmFNUTR2VmMrWmNr?=
 =?utf-8?B?Y3RjR3FWNUxVWGRsVVNsSDJCN1BIUGN1QzF5cnRyRXd0VFBKZy94amJKQlYx?=
 =?utf-8?B?YkMyMTNBZWhsZkM2R1pYaWNQeDE4R2FYbGdIUncwM0RWdWNzVCtiY2Fwcnlj?=
 =?utf-8?B?bkV0Qi9HOTBJam1FeVRRL1hkRkQ5RVpVMm1VU2NORllKdW9HSnBCOStaclQ4?=
 =?utf-8?B?R0FURE0zKzZ3c0VqRlNtQkxJb3lOTmU4Z1JISmQvR2Y4RUdFNG5kVHBGd3U4?=
 =?utf-8?B?SGl2MVdmK010L2Yybm1PS0lKbXI3NlJPeVdSRUR6MkgzVzBxS1JVTkliNnJq?=
 =?utf-8?B?Y1lzNHhZZUpoRDZwRGdlbzFQNWNkOXJscnJxK0E3Rm5wQjlldG1MNG9xdEpo?=
 =?utf-8?B?OFdDaldYbzh3SlFCa0VFTmRXZlVXY2J1anl4THBrZWpWNEUxdkFLbnI1bHAv?=
 =?utf-8?B?T1FEamV4dHp3NTd0Y0krNDE4M0tIZmFvZXhuK2F1eTB0NXQ3WDhJeEtMZE5F?=
 =?utf-8?B?MGhBOStEU0tnb0M3MlhueHlCendiSlBJZXQ1eUh0ME56ZHVNdTdQVmM3czR3?=
 =?utf-8?B?R0ZaV1B5MkxKQkdOQlh2clNhbHZBdWdMa0IrSklUbkFFSXdEMFFyZXA1L0Zs?=
 =?utf-8?B?bENBNnR3SVBENmpudU10bzV6NGJSazl2SWIxMkVDMTFOY0VKWnFHQytuN0pB?=
 =?utf-8?B?aEZTa21WOXMxaGRxTXE2MHEyR3BTVnIzQjY0TGlya2Z3T21CY1lVVUZLTms3?=
 =?utf-8?B?ZHYyOFh4TWprdU5iTG1FNFhjMDhETHNUMkU5YzRHcVdXZEtFamNsVmNvTmk0?=
 =?utf-8?Q?NyA7PeJmgTqKJvfKsBZMynNiTFrfh8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUFTbEhGdWY3QnBZS01NV3dNQURGV0FTOU9pVnJjSmEyRUxRWkVoalNjV1l2?=
 =?utf-8?B?ZENVc29hY1kxYXZXNlQzc3UzUU1pd3l4THNWZldZRHMwL29oVjQwTkdnMnBI?=
 =?utf-8?B?ZGVhUXNRSEFvOU5LdFBxZTNHb2xJeVg2eDdHTlBnZGc2ZEdNWTVDZXBYUFVC?=
 =?utf-8?B?eWVoUGNtaS83dUtIaTZWRndCQmNLYlBjaEN4SzFFd2VuTCtjUG5iYmdkQXNn?=
 =?utf-8?B?SnNsRkp1R2wxWC95YXBaYjZ2R1BKOERkQ2QvTzdTcVVDY3VGTEZ6Zjk0enMr?=
 =?utf-8?B?bTBueCt1NGRTMEd4RWhNaXMyMkVXTVlEemZYUHhCb0FXS0xIU3REdWJYRVNC?=
 =?utf-8?B?TmJDTnh2NXN0ajU3S290anl2N0ZxNlRkbkdibEgxaFp0dlRDeU4zWnlMcU9h?=
 =?utf-8?B?UzJvUjBjTFZiOHV1cEdUN280bWdkOTRreW9scDVydmxPeFpxdzN1U0hIR05Q?=
 =?utf-8?B?NDFIRmZBendMeTFYT1BhQlpVVDd3diszby9pMDNmbGx1a01haU9ILzRhNENO?=
 =?utf-8?B?TjFQU0NVaG1HcGVqYkVqOFhpeWoyb2tzWnh0RUxOd1lFL3dVb2NvNWVkM1VM?=
 =?utf-8?B?dG0ybTJPZVRYNjZ0aHJIRitmQTZGQjJwNWJiTFRtSHo0c0wvKzMwOXN2QU1Z?=
 =?utf-8?B?WUVwcG1iK2Z5S3RlRWJaeXFwSjF0K1IxYjZmbmIzQUJ5VWNtQTJmYU1SNFJi?=
 =?utf-8?B?bUlIUUo2a1J0Q0tNcjRTTFpUUU9pODZPWkp4ckpiNjNQSE8xaU5EdSt5Y1A2?=
 =?utf-8?B?Szh4aUttVkhDekJ4cC9Hb2JadjVqcHBDMGNqMTIrNHB3dldiT2tab0xRbDRK?=
 =?utf-8?B?eTRicUdVQ0FnYzhIYkRWdXFtemxGeTZWZ2JPSnVqMDUxd2xLazJoNTBXa0xq?=
 =?utf-8?B?bHpja080T3NuTFhWVWhZZ0thK3VwdmcwYlg0T0dTM3FUcmRPNlBOVFliZXNn?=
 =?utf-8?B?MjRNZzgvNmh1UnR2c1M2V3ZOMUhFT0owWm1BdjJnSk9ScDE5bmF5V0dSQ3ZI?=
 =?utf-8?B?elJCTkVhYkZJM3ZLeGpoUEkwek93eWlmTjhUYVkyd2dIT2VkenVqMDFiSEJp?=
 =?utf-8?B?eWVjYnlHbTB0TTNGd29HeWVjbnBnR2U4Z05pUzFUSnZnYXJNRWV1RDRsZHdM?=
 =?utf-8?B?VHBuZ1UrMGdsSTF3ZUtiaVhTY0JpU0hrWFNmam9hbHVGL2tNVm1YVS8rbDlJ?=
 =?utf-8?B?SnRqaTNaR1VhSnlQc2N3TGp0UXZaYkhTcEdNbTd4QUhmQ3NBbjZ6MDBhNUFz?=
 =?utf-8?B?TkUzemh0TWRpUGRyMnI4QTRzcVlWb3dHdWk2aTFVbVE5bzZuSzVsSkZVTHBu?=
 =?utf-8?B?RU53NU43Ukc1a2lsM3ZBNHZ4ak1pZXRBZmNXUFF4VmlCc09tQW9wOE8wRmRa?=
 =?utf-8?B?a3NLeEVBSTIrU3JSTnNDYzliV1YwUTlWWHY0VkwzTWJkaDBrWjl0RGlsSE5s?=
 =?utf-8?B?RmdNaVNpaGRDN2Nzd0x5VGRPMHBDb2dScStzTHVGd0xPeTBWK2VRYitYTnBs?=
 =?utf-8?B?ZU5JYlkzWTlOaHdDWHozL3AxS25kSHdESEdsK1NSK0dlM2NXZ2srcy9jUkY2?=
 =?utf-8?B?M1QzNlo4cHlnWCtPUDJzc2tIYTZiK0tnOVJ3TG1WR3JXanFiTnlZV3Z5RXR3?=
 =?utf-8?B?Q1hUV0liWXFkRkJtWHpyUFJzM0s5Q0RUaVIxa2FkWlovTXBmVkhSblE5MkJv?=
 =?utf-8?B?TU5wa2NzWVI1amdXMjl1aTRMcjAvRmNKOGo0QVhUb2hxeUJrUnJCV2hwVXpI?=
 =?utf-8?B?VEtmNGtCKzQxY1hDR0pTY2laRmw0UzJldWp0WTdpU3VtWDJlRGxSVWtjK2h0?=
 =?utf-8?B?TlAvSDhvNVVZd0hmanFXUi8wNXBiNkxDaCtwaWtMRXdSNmVTNlFmY21rYTMy?=
 =?utf-8?B?YVJMZ3NJY211RHQ3WGZ6T2xuVjB2TkJQNVBnKzdVTHFibUp1bzUxUHN6dzF2?=
 =?utf-8?B?UTRlU1VQMnp0QVVnZ1drS000WUdwSk4wd3E0L2lNR1JRNlJIcm9NMTJaT2pu?=
 =?utf-8?B?bHlrbU84bW0yOFZmejdrcHdGSU1tOGRqTVBMelZnWXM2R1R6K2hoVHFJb0xr?=
 =?utf-8?B?ZnpMdHNFd24xY3RadFk0UXB4SjhCOFNqeVZwa1QrN1IydG5ySDQ2VllPMG13?=
 =?utf-8?B?NDRmUmpUZHE2cVZKRHpHSmdUVWtGRnJ6THc1V3kvLytHb1NYZFdYVlExVlR3?=
 =?utf-8?Q?WTC89nHmq18ryODhcrZhcJQ6M5O2M/QgcYjY2+jMeOUz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2319a8b8-2b3d-4ef9-b2c4-08de16c3c0ef
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:18:34.5720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fo4V/jT9rjm/z49XNUm4DsXX8XDhvJ1kaGlvoRy1jE5cAJ3mYz8YywUMPJi7CuFNGwWPk9Q5OCS1ft5HECBCFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6785
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

From: Joel Fernandes <joelagnelf@nvidia.com>

This will be needed by both the GSP boot code as well as GSP resume code
in the sequencer.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 8 ++++++++
 drivers/gpu/nova-core/regs.rs   | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 45650b66fdf4..f23356bf3a2e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -610,4 +610,12 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         cpuctl.active_stat()
     }
+
+    /// Write the application version to the OS register.
+    #[expect(dead_code)]
+    pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
+        regs::NV_PFALCON_FALCON_OS::default()
+            .set_value(app_version)
+            .write(bar, &E::ID);
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index fd207920f721..c945adf63b9e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -216,6 +216,12 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     31:0    value as u32;
 });
 
+// Used to store version information about the firmware running
+// on the Falcon processor.
+register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
+    31:0    value as u32;
+});
+
 register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
     31:0    value as u32;
 });

-- 
2.51.0

