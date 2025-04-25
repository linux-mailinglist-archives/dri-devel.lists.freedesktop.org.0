Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A8EA9CF2B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 19:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D9D10E12F;
	Fri, 25 Apr 2025 17:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XZnIOWsN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867C310E2AF;
 Fri, 25 Apr 2025 17:10:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTRsX52FHg8LscHKS+elmgLyv+ty7Heedp4+xCfQAVya839bPaPHwQBvgB5MrcCGTx1stnUk/TlLXsx4RmwZE1MSE5spA0VPm6oRmcJA7SvpCK2cBsxmUiM8zf+gNUQWtyvhsjM74Afxrzcqk4oAZ4QNRnvcwJJJegrUdJ86OwrKq4sWabhJxRKjpWTSuI9ExovrMIkMGMKR9MGC9kR5ttalOPDSBmmZ2qOjv18dvtQV1/1tXMxaR9EmQjM6m+w1lsCR/fg7CFhStfT195JCPJ6HvyZk+D5Xr++3liVxrX/X4SuJiKI6sTwaaGOCbUZjGRlYFsJtABt0NaYGPdlD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soJB6aqDVu7jrD9wbjN6Kuco/BdflKWqks/KEbNRk2M=;
 b=Aald44nQOKY3xufJSvZuVYLZLKVa1ChuST+KtcEV72ab1hETK+4b4elu/wL5D5JC6JEy/D3y4FAQ2zKC4F8vcItUCJfe6OW90BLTdRFM44yFJYn6bduD4ACA0NBAJUwdk/z0lGy8NKu0VsZqaGlcPEBAitV2Apcm4SaUViPQXXp50bkIHKbyY7w/0fity2kcrfJjdl0d1MG8Jg8G/1bN6GFAgwailHpsBlKZ9zQXrxdiQR7uvbeBqCodQCV02duWqTAUAWMYsWFArbk4pfl0OJJF7aQqMwbI88KNkwwPNwgo+Rycaos3mDLOavuUpVVS389QwY0DgQ30wjQvEUnhWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soJB6aqDVu7jrD9wbjN6Kuco/BdflKWqks/KEbNRk2M=;
 b=XZnIOWsNHfjJyDGVnbVzAakgKINGu4f97p5ouxv2Ndu48Rdbi7VUOAaQUEKZUdUAqPGfNm0UahAvGPW1F2/wiJikMYBzhgavab/RA6xD26zw17Uyx+VWu+EZWGVf7WKv/wXX0BjNH7E/anfKTPdVz/0sQ0dFQiuTJ+vMHOjUgf8jSveYyfGxnSVu/bmGHCHSe4gGLk20NZsaRBxG0ctxttCE5YXAblMLnGxnTlKKCgwWu/KNXvUXDAP4YXLdQbwXJLpw4GsUllKSFO+5zY6P1GKeFpP5O7PU9pOAVV14g8gYdc4w4DM3gAqI4nx2mtfhu9qvEXumiQ3Dh2PZ243nRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7347.namprd12.prod.outlook.com (2603:10b6:806:29a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 17:10:03 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 17:10:03 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [13/16] gpu: nova-core: Add support for VBIOS ucode extraction
 for boot
Date: Fri, 25 Apr 2025 17:10:01 -0000
Message-ID: <174560100180.876.3202662831206828326@patchwork.local>
In-Reply-To: <174554837570.876.11918974074625574396@patchwork.local>
References: <174554837570.876.11918974074625574396@patchwork.local>
Content-Type: text/plain; charset=utf-8
X-ClientProxiedBy: BL0PR1501CA0004.namprd15.prod.outlook.com
 (2603:10b6:207:17::17) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a20659-7085-4b42-0f18-08dd841c04f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzVYR3JxendhNnBBcE0yKy9TREsvdG4vY3E5TXFwWmsyWThGUzIrRUoyOUJY?=
 =?utf-8?B?WHlsbG1nMFJsTXNtZFVBaDFWY0p3Qm9vTU5JcU1OdjAyUXF4U0UzUkhiaTkx?=
 =?utf-8?B?Rkd1VWVZVWZ3K1FzanhMbmdiZW9nZjJIOVJLandoM2NUV3dmZmI0VEdhdEpL?=
 =?utf-8?B?V3VPZEIvYTZIVU9wQSszZjE1My9zd29JcTJNd3JXTExNSVBscW5Fa2F0dlRm?=
 =?utf-8?B?Y25Rc1ZDNTFJakNFNEpLTGU5eVVZMzdvanRHbXRINHpVRlBrem96V1I2L1dC?=
 =?utf-8?B?OGkva011WFlZenRBMGVCSWdiK2xhTjBudzZITFlRa0xWTitOaVpnL1lGc1pi?=
 =?utf-8?B?NnNpSTRWbTY5WjFJa2t2R2lMeGsrMWJZeEhjcWxHNzdTOWtmWmRRaHM3dkpx?=
 =?utf-8?B?cC9yTGlHN0N0b0ZaWnFPY0ZsalNwSnZEWWJGemttaWxVMVRLYTROc3htYkRP?=
 =?utf-8?B?NUVLN0Nyck5xYTY3cUdybHJqMDY3amM2L1V4bXlaYi8xRDdnZTZPaDV4eHh3?=
 =?utf-8?B?N1BUVlNQNmNEdnUrakdMN2Zva0c1VzgrY0NwV0JyOFExK0RLb2E1NXA1eDlF?=
 =?utf-8?B?azlaNmZwTVJ6Slg0Mm5jNHpROFBhWFRKVGIvRFhTUmZBZ2l2eUM1Nlp4RDBv?=
 =?utf-8?B?bnpvaTRmMlBoeWpCaEpRWFBCUTF6L01TVG5ZTzkzbUExN3pFWm5rcU5VQXQ1?=
 =?utf-8?B?djZMNFFnMDBJeDljdmgxeXpkUUE2ZGs1Sks1bXdMU1RoMkRGckpaRjFZK0RI?=
 =?utf-8?B?UFlBRmk5ZTNZenRaVkVDQlp4Rko0MlFTbGFLTVFhdlg5RGwwUllTenppaVI3?=
 =?utf-8?B?TnVYVkxpeTVFZkJ2RERySkxZWkpNR3NUUzlBdjAzOElPT1NYNjhteStqOGR3?=
 =?utf-8?B?MjFzWThDZU0rUXp5WGxDVXVFNkkzZ0FpSjJyZytBR3dBUEhsL2RtaVdyYXRF?=
 =?utf-8?B?cFV1cjBNYzdZbVlkTzZDR3dLU29IdGZPdVE3M3lKTVU1djJkT2JSNVN6ZDR1?=
 =?utf-8?B?WGVxV2dZeFlDSUEzakZRS21CM3RTYzNtanpDdWljVnFodnZ4bW1xbm8yOWF6?=
 =?utf-8?B?Tzlub01sUDRVSjVOSWNZeGUzSEloeVF5eHRnMGFzNzQ1TkJ5c1MvQjZuM2dx?=
 =?utf-8?B?ejdQUFlLZzkySTlHcEMzUjhmbW9MUUc3a3QxWUlBR2lHWUpneGtxaWZaa2Ju?=
 =?utf-8?B?MXhvQkhiSEJ4ZEQxUE1DTnlzMWxhdWl3YStVYWVRa1EwQlJaK2FRQjJnZ0Uz?=
 =?utf-8?B?Y3lwTXN3Y2xESUJSVUtSUHlxa3dQTE5iNE12TWZ0VTlESkpNREFrTWdIeXBE?=
 =?utf-8?B?VzBEc054SmNNeUJyK3puWHJ6SFFDOUxJbjhCT2kzcjhjTnBxMEdUU1QvYmtL?=
 =?utf-8?B?VTVrM2F2bnNXWXdTTlJERlp2WnJuVlh1WHZYNzRjYzBIS1d5UGdnVXNXRkxa?=
 =?utf-8?B?Qmd2VjNFREozZnhFdSt0QzhUUldUL2F2M3VnQVpVNkRrMnpjaUI4YkFQa3g2?=
 =?utf-8?B?U3hmTVdnYVVpV2FSUFJ2WURTdzJxS2s1NDNBSWs5SmxJUlNoOVV0WHJEM3Y5?=
 =?utf-8?B?Um0wRHE4S0R2SURxV244YjdMdDlZTG5Kd1Z5N2VrM2tPQWxZMENkMGpaUVhv?=
 =?utf-8?B?UXJOVmt3SDFlWllyM1NWTCtZRnVnMHFlaDAweDZsWlFBeHNyS2c4YzhUeWtz?=
 =?utf-8?B?aWpFVndDOGdMcFZDWXpMVXRtay9heDZsQjJVVE1qUlJya0sxcFRnVXR3aGh4?=
 =?utf-8?B?Wkw0cWZRTnJzbUgvYWdqb2tqckFIYjFuMm5sZ3lPaWZJODVXNUxaVVc4M3hy?=
 =?utf-8?B?MEI5MzBvUGFYMnJBajl5ajVyVHE5UmJlaDF5TnZ1ckJZYS9nS0IrKytSWUd0?=
 =?utf-8?B?S3Q5OVI0SzBDS25BczJNNERXdlp2ZEhjNFl4cmNLd0k3WS9vdVJtZDh1NmE0?=
 =?utf-8?Q?AnTBRGLaO04=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDdvY2hFaGZXaWk5RFRldkZ3SGpKUXFucXhSaWE3bDAvbUJZUTdYdnRMeVA0?=
 =?utf-8?B?YjRsWmlnNzcxUS9qMzFId2hFOHhrbExKamNReWZwWHloRzFoMXZQTjdyNkFW?=
 =?utf-8?B?b254THRWaDVmMDBvcFUwckV3T1ErVS81L2U0dDIxT0lDZHFCaHlHd1BTTllu?=
 =?utf-8?B?MkNyaG05MmhoQTdlTDgvV3hGN2tXd2F6b0VGK0ZZUDAyQjJ4SjA1UUEwNG1Y?=
 =?utf-8?B?NTlhUjNmRG5kQmRJOXU2Qm15YmRNbFpzZE5WeklNcXZqWnZ1Zzc3bDhKNXky?=
 =?utf-8?B?SlZxelZaU3RCVVZUVnZOZ2l6by9iNHlTajFVUXBmSFd1cDQwaytzZU5kM0lB?=
 =?utf-8?B?dGp1WEwxajZpTnUvMy9hZW9YMTN3MFhTMk9NTDN5UkQxL2xtRE1jdTFnd0g5?=
 =?utf-8?B?RlNGRFIvM0loMnhXYTJIV241d2xnOHlxcmo1dzZRcUk2UmxTY0lJd210WmJN?=
 =?utf-8?B?U3FubEVHZEtIaWE4MS9LYkZJd2lwZzRXSHFDb1pPM09mZG5RdkUrMkl0aWJL?=
 =?utf-8?B?WmNoUlh3VjZYUUhMd1lPaWVnYXAzS0NoQkp6dmFHVXN5S2o5T0tsQmFGSEV5?=
 =?utf-8?B?QWI1Z0ZqeVNJaSszRHFiRC9HQmpyekhwVWZBZEJnelpaT1JjcWdxKzNqaXA1?=
 =?utf-8?B?a1htMWIra1pPRlRZNkJJdmRsK2F4Mk4wY2xGdFJXc3phaWJBbFBGL3RsSldB?=
 =?utf-8?B?Sm1tenJtZC9jNTcxTG45V3VIV2Y5L1N3Q25TU3BkbVhFSVRQRnExcmtESGw4?=
 =?utf-8?B?MEltRFhRVjBkR1Jpak13OXlWVXJQTnQwa1d6V3o3M1lDaTNqdzEyK2lUbHdO?=
 =?utf-8?B?Z3ZNbEJqc1VRTzk1Vk53Q20yM2gzU29hYkhSUW1RSkdBOHZySVAvek81ZHRm?=
 =?utf-8?B?VFlmb2h0S1F6eE1HU0xhdGduai9ROWR3ZE5GdC9VWXBRL3d3cmdHY2xWZXk5?=
 =?utf-8?B?VDlLUlNFaExUM0FwdXpmczBMb3hOVjJVNUQrU3pvOHI5YUZtMWZkQmhIWXlL?=
 =?utf-8?B?NHNRejhVWElXOWNwb1d2d0VsN3lyRHRkQXJyWlJ3MTFRd1poUkVXcExhZFJw?=
 =?utf-8?B?MkNBU3NZTHR0UEJTcW8wd2pVTE9TWEJEWE1XOFJDa2t3TUk5UlZZNmsvcU1s?=
 =?utf-8?B?TkIzR1BHZytzNDZscTRkMUdBQmsxMHlZckliazI5a1ZvU2VTYnBmNDlXVDVN?=
 =?utf-8?B?RFhEbmh5ZEQwNHVpUTVTNVl5cy9mRlJ0cm5KK1BHYStGZ1c4TngwaFZ1cVFS?=
 =?utf-8?B?YzFBNkNWaFZ0Nm15NXdkRThBWXB2Nzc0MVlLYldOUjEwLzBIN1dGcVlLaFlo?=
 =?utf-8?B?MWp0N1NaWi8rRzlZSytyeVM2V1ZIenRpQWtuVSt6emt1K0piVk53SHNRV1Ez?=
 =?utf-8?B?UjM0dDh2RDlhQzhXWFlxS1FFQVpkeEhWL05WN0JFMkE3Z1U1eXYvOUs5aFRo?=
 =?utf-8?B?NnlhMm9mSVpCQ1FFTW55Ujl3MFNHbDhNVkNyNE16L1M0V3JWMlR0NmR2TU5l?=
 =?utf-8?B?RlhkRnR0N3gyMXZLS09UK0o5SnErc204TWxTTVhQOUdnYmNWOFlxNUhQVmZ3?=
 =?utf-8?B?Z1dNanZsQlh4WXRIb3QxbGJRMDlzVHc3OFNjbmoweldlRVJ1N2V4R1Q4UFFu?=
 =?utf-8?B?aFB1cG5Jc29wL0YrZjRGQmdHdFk2ZDZUQ1AwU0pTZ3lFTTgwQTBkVmtGUTJV?=
 =?utf-8?B?S1VqU1Yxb2JNMy96QXdDZDRwaFhnTG5UbGJ1cXY3NmFNVFdXcFo5NkxGY2FW?=
 =?utf-8?B?eHFLWXNlQnAyL1FHREo2RlgzZzhnV0N6MVc0eFVka2plT2wwYXNaMWF2L1Yr?=
 =?utf-8?B?V05JWGxrckZKVmNENUZzZndpQ1NKMGs0RGJxb1RSTWNHSStlNmJ3TE1leEdB?=
 =?utf-8?B?T1hFNktVdFJIbi9iZWVRdmMyZzBxeDcxdEJGVTcvbUJMeFB1OXc2OThCZ1hN?=
 =?utf-8?B?Y3Fycm02T3c0OS9VcjNBelZRMHNLbkl6VGlKcHhUZWJZNGljREl3ZnVWSU9K?=
 =?utf-8?B?ZGFRNVJRL3lTb2JxL1Y2MGxYaFRSOGc0TGZkMzF4cFRRNGdITEhydUdyVWdm?=
 =?utf-8?B?dFZld2J1T0RmRjMzSlVBWThPTVljd1l6TnNkK3ZEL1ZrMlNtLy9WVG1tNkdr?=
 =?utf-8?Q?THN6t0v8foB9Qm7RywWWQwyUB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a20659-7085-4b42-0f18-08dd841c04f3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 17:10:03.6159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlCpXTWr0wfN+gqszJCCnnpDDDB1xKDWc+1wTvgTgLXRDEW1yvCCDMu1lnn2swaHUhKiCbtjvLqb5cfNb8D/kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7347
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

On April 25, 2025, 2:32 a.m. UTC  Joel Fernandes wrote:
> Hello, Danilo,
> 
> On April 24, 2025, 8:17 p.m. UTC  Danilo Krummrich wrote:
> > On Thu, Apr 24, 2025 at 03:54:48PM -0400, Joel Fernandes wrote:
> > > On Wed, Apr 23, 2025 at 05:02:58PM +0200, Danilo Krummrich wrote:
> > > > On Wed, Apr 23, 2025 at 10:52:42AM -0400, Joel Fernandes wrote:
> > > > > Hello, Danilo,
> > > > > Thanks for all the feedback. Due to the volume of feedback, I will respond
> > > > > incrementally in multiple emails so we can discuss as we go - hope that's Ok but
> > > > > let me know if that is annoying.
> > > > 
> > > > That's perfectly fine, whatever works best for you. :)
> > > > 
> > > > > On 4/23/2025 10:06 AM, Danilo Krummrich wrote:
> > > > > 
> > > > > >> +impl Vbios {
> > > > > >> +    /// Read bytes from the ROM at the current end of the data vector
> > > > > >> +    fn read_more(bar0: &Devres<Bar0>, data: &mut KVec<u8>, len: usize) -> Result {
> > > > > >> +        let current_len = data.len();
> > > > > >> +        let start = ROM_OFFSET + current_len;
> > > > > >> +
> > > > > >> +        // Ensure length is a multiple of 4 for 32-bit reads
> > > > > >> +        if len % core::mem::size_of::<u32>() != 0 {
> > > > > >> +            pr_err!("VBIOS read length {} is not a multiple of 4\n", len);
> > > > > > 
> > > > > > Please don't use any of the pr_*() print macros within a driver, use the dev_*()
> > > > > > ones instead.
> > > > > 
> > > > > Ok I'll switch to this. One slight complication is I've to retrieve the 'dev'
> > > > > from the Bar0 and pass that along, but that should be doable.
> > > > 
> > > > You can also pass the pci::Device reference to VBios::probe() directly.
> > > 
> > > 
> > > This turns out to be rather difficult to do in the whole vbios.rs because
> > > we'd have to them propogate pdev to various class methods which may print
> > > errors
> > 
> > Note that you can always create an ARef<pci::Device> instance from a
> > &pci::Device, which you can store temporarily if needed. Though I don't think
> > it's needed here.
> > 
> > > (some of which don't make sense to pass pdev to, like try_from()).
> > 
> > Yeah, it's indeed difficult with a TryFrom or From impl. I guess you're
> > referring to things like
> > 
> > 	impl TryFrom<&[u8]> for PcirStruct
> > 
> > and I actually think that's a bit of an abuse of the TryFrom trait. A &[u8]
> > isn't really something that is "natural" to convert to a PcirStruct.
> > 
> > Instead you should just move this code into a normal constructor, i.e.
> > PcirStruct::new(). Here you can then also pass a device reference to print
> > errors.
> 
> Ok, I had a similar feeling about excessive TryFrom. I will
> make this change.
> 
> > 
> > We should really stick to dev_*() print macros from within driver code.
> >   
> 
> Ack.

Here are the changes: https://bit.ly/4lOHk4s

It looks better for sure :)

Now onto working on the loop { } and the read_..() method suggestions. :)

 - Joel
