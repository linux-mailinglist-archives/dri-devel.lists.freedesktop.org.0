Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AEFA3BEA0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9843F10E7DA;
	Wed, 19 Feb 2025 12:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F2lb0MP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DCC10E7DA;
 Wed, 19 Feb 2025 12:51:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDteiHrKwsKOaJbLZE2QbDeq1vuBuUdGGG8xgC1g/b6BUJUye7S/AHRUZFLuHPZeL+GPxV/5yfq3tc4EZHCnhlWIpjdhBXiz1DI6de2N1prtJrgymI+UqVAvFe40s7eCkNojzTItMvxe5/xt7z14fT2bTPFqpvm15n7clKPTlArzBZw6OvwsM1K+XcrK8pUKhEvg7nmp2dZ/ClEVsQG8idsXqw6b5SCiuhZO+G6pTJcJ7uW+jN5TzwPSblpVuvLlZZFP5B3lTsnLTdlHHC//7vYXVm098IwCDCeOoOLYOjvAiVHkR/A05pjAi8IV+7i4yL4SW35GzyBtkpuRW8Z0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8OBz/iLdUHGdthP55cr+5/jjP8rCRyZi9cKfINwcE0=;
 b=j0fr6XUttqxb8WilO0BWssl15kmX36qC2lJiy9tSbvKp4M+AvoPnOC8Cw9xKeFnJ22KmQStfTOy87zWj1kYxrHXWMpqlmKukEwNffmy/h3Oo0r3VDvzfmKU1TN9QtPM46NKrHYyvm1DPvVTZTDGfACqawCEoOlPiCYTmz4rQIMl/qBC61H4EzNhezGh5Dgs8E4Af8vwydvXg4CIkWhSoSdNhHd9Fzb563Fsf4HKpeHlH6+HWcWmgeTqxTRcx5LjCGLB+AvluNCOKcVQaZ1RBvAPArAwBIyosld+z33mZZzId/JJc6//uc7aTC147Ko6/ClBh3jKj4vpRMi2zhCwNOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8OBz/iLdUHGdthP55cr+5/jjP8rCRyZi9cKfINwcE0=;
 b=F2lb0MP6YEGfH9RvPXSMAtCzEzIRZaD/j736vbmQxgltRRBT8vWmkKPuTUhSIrvDygslVY1Vpr2i+iKbWMt+VoZrz6biyhn+Fy1lvh1Z9QkqrM24DtdZesUU8f8d9Y2sIJ2STEymgEbx+0BNVGYnjVjRH2uHNHESGK0OgDjohJT0p8SU7pf+aAHMEIgsmERAB/0FdxrObow29HYLpzuJu9ObOv1DIYslK9o+GRWisoU1l/BpgFKRz7c3XFkhp9Fy5eN9PioNZgeZehSV/F91Uaihf5Mqrs6sd14HiJIaK/xGWPVsgAUj+c+pvPJqfbuBueqCD4FKGk1fl1apj5e85w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by BL3PR12MB6523.namprd12.prod.outlook.com (2603:10b6:208:3bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 12:51:17 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 12:51:16 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Feb 2025 21:51:13 +0900
Message-Id: <D7WFP99SMV3H.26AJWK17S0UPX@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "Ben Skeggs" <bskeggs@nvidia.com>
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
 <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
 <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
 <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
 <e6322f90-08bd-4e86-8dad-2ddbd7e5cece@nvidia.com>
In-Reply-To: <e6322f90-08bd-4e86-8dad-2ddbd7e5cece@nvidia.com>
X-ClientProxiedBy: TYCP286CA0121.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::14) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|BL3PR12MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 7910438c-7ec5-4698-cce1-08dd50e41987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjdOR2t6RXR1b1NhODdXWXdQYmRMYkFRUzFpYTBKWkNEL3M0TldvZjNpaHBF?=
 =?utf-8?B?ZDUxT1p0NjA1M0sxSnE2UlduT2sxQ1B4aEljQlhxRzk2Q1FWUGljdW1BMGc3?=
 =?utf-8?B?MFM0cjY0YWovNWpVSmRERDIydkhFeDgrWnRxVGZOTi9wWkdGOGdXbEQ3OWJM?=
 =?utf-8?B?NzE4YlZUMXJFTCtRaTdlZDF5QU5pTXpaUWxUU1VSdGhzZkJpRmNhcTFXV1JZ?=
 =?utf-8?B?TXBVc2JXcVlKWktPaEVlS3F6cENtdFUzU0xwTGt1TlhDalNIbWdTK0RJRHdO?=
 =?utf-8?B?ZzZaUXhPVnliZ0ZpYUZiQmpHM1krZXlENGFLV3FNNUc2V3RRT09QRGpLUjdk?=
 =?utf-8?B?dk13TGJqMFRhbVY4NWp1Nys4VDJ5Z1UwMVFmQTVYVTh3YzI4Ly8rUVlWNXdS?=
 =?utf-8?B?ZGx1SHd2T2pITWJHWi9tRTk4VFg2bXRUYlY4enZ0Y2lXQlFUVU4rZ0ViaWFV?=
 =?utf-8?B?ejBJTUlDRGhMdU0zcFZMSncxRGoya0Faa1pCUkg5aGtjZklBakszVTRYWVRr?=
 =?utf-8?B?Y3B5czVKY01YWVltdUZRMHEwQmNZdUQ0bGpZQk5nLzJaTTIvWWNOekJWL2RD?=
 =?utf-8?B?SCt4SkU5VWVpV1NYUW8wamJ4d0syYjlHdlJGUzFvQnZybk93RGs2UnlSbUwy?=
 =?utf-8?B?TGNGZTNvVGZhTkdmZmw4MnN1TXJZNlY0R1JXZXVwaW1hWG94MmxOQUdSKzB4?=
 =?utf-8?B?b2gyTlJuTGNVS01JU3VpNEVRWUZLZUlDcHRSK3ZaRGJiNjRuSlFiOTB3ckp4?=
 =?utf-8?B?Z29YZjMzSWRrSFMzakJHYnQvUm9Dd0c1R3diQ3pjUHBLWXQ3dDZHNWpzSTJO?=
 =?utf-8?B?cXNuNTFUaVFwREZjQW1ORzJoclpjOTZIdUtlVXlVc0crZ0JJeU5QUmFuMGpO?=
 =?utf-8?B?QUVlVlBDTTg0T3QzLy9zc0oyZlJYRFhIYnpRcG5VdGZQcEdMZjFpWTdRQkJ3?=
 =?utf-8?B?RkJOQXB2VzVmNjJWT1N6VFAyMXI3eUI3cW5KeWcvUXNDNU9MR0x2bGR0cmlE?=
 =?utf-8?B?c0s1R1NIMUxFNzNKblg1aXdRaVp1ZFVMSWVoQVZmbmdXMktSMTBaNGlNYTdG?=
 =?utf-8?B?RGxwei9GWjBTbzVyWlBIMlVOdWhOSDNpbnM5TkxoZTBHeUI2OTY3YU9vOU9Y?=
 =?utf-8?B?dmNXSlRFZmRuMWthc1dMY0pBVFJoajhhLzNMZDBHa0wyUFliVGJXT2dCT1FL?=
 =?utf-8?B?WGw0dzhPYjRvbGVFRW9kb2hhNGFzVFVSZngrUlBEUTB3NGpnK1pQUGhwc0VJ?=
 =?utf-8?B?ampNNVhYWklEWnBNQVBJeVk2UXZZdGdGRU9nREthNFIwZXdNK1hFa1B4YStG?=
 =?utf-8?B?eUhkemZ1V25Sd1hUUmFoT1FtQkJ0U1puNUVLd0lVTmtwT3daQzU0V3BPdDZy?=
 =?utf-8?B?K0RyRWkyVEhwN2ZGRklHdlpmQzRSTmFlMHpaL1Jwa1V5K0IycFcvOGZKSTBr?=
 =?utf-8?B?RkhZQ2lPUGFNNzIrTE1tdmQzUEUwd08reThROVlxS0ZnVTlRUlF2WmZGNXdT?=
 =?utf-8?B?SkJTZUliK1pGNTRsQWxpQlUvQ1NsVUdxbi9SYUQyVERoNTJtdFhHZFpQajgv?=
 =?utf-8?B?bVJHY0VzUm5RbllBZzVRak5aRWtKSGNkSUNuUFo5eHRYQkdqYlpDZk0veG1S?=
 =?utf-8?B?d2pkcVEvVFFKMVRBN1h1ZXhNVTZoRGIyV3MwbXNYS2JGWmc3UzM0UWVRZ0tJ?=
 =?utf-8?B?QStreVhueE51b1J6R2ZMTjgxaVVJSEpQRENMdXlqd1hvZ0VjK3B5TCtSYSsx?=
 =?utf-8?B?NDQ1VWVPRm9DblpCNHdWbHltdkwwV1FHNzlpektpcXZhT3pSRzk1dzdNN1pn?=
 =?utf-8?B?UzFrNEgxQ2g2dDAwVmRiWDVJRThPWm82MlE2bksxdmVaS0dRcEpDUnlLNWVC?=
 =?utf-8?Q?MgKMMF14p63Ra?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0dQWUl5alpyZm4xVjVXcllVVDlzVkU1WE5iOEVXWEZKTllGQUozSTJ4K2RP?=
 =?utf-8?B?ZW5jaXdZUFh4TFdJWHgyemc1NXovdDVZVkdxQktPZUgxRm5PRkRYWGs5KzZE?=
 =?utf-8?B?MFgwN0FWTVNoRFFDODl4VitHYThoZ2YrT3JqNGFUWmFuV0didUM1WFR4K1hx?=
 =?utf-8?B?ZjR1RUFVR3FYdDE3dmdDQ2xKWllwUXVpVGMvSlpGcXFBZnZieHd5eGVhVUJP?=
 =?utf-8?B?WTJMMS90ZGlYRE1ZK05ncjFMU0xNSTFLTDlhVnowQUkzajZKQzJBcDI4cm1w?=
 =?utf-8?B?am5YWCtnYWcrajc0YU5lWW5YNjNWZmZPdkxmOUxET1pTWWwzL3pHdUlTbFpy?=
 =?utf-8?B?UlFZM1RXWmZOZVpoUTZsYWIwdXJ6Y1F6TXNucFJrVnZRR3FrcXNJeFJxdTFC?=
 =?utf-8?B?R3ZOcGdWRGM3TzU0VkcydllrRTEzQi92Tm5qZmJML2t0UVZhUXk4dmt2ZCsv?=
 =?utf-8?B?ajZ2aENibTNDcldFamVSbERuZXZES3RpQlRFNGorNzFHdHpuYTNKWnZwS2tO?=
 =?utf-8?B?TTM0aEo3RzR5S1FrdVVOeHVzNUg3czFYVnhrYU5UVlVhN3NCVG8xc0hPamlD?=
 =?utf-8?B?OHFGSVNPTkdOUXJzMFZQRWs3RCtZU1hIQ3ZSRWpaZGZQWFlaV3hWbE1UV0g1?=
 =?utf-8?B?L3hsSXkxUG9NKzQ4cE5Hb2wzcy9IbmhaQTRNYlVEY3FTTVpUTXU0cmV2cXpu?=
 =?utf-8?B?akgzTE43NnQ2cWFHZGFTangwTWFMbzdINWQ1alQyMGFsSzJWTHdoaUF2WGd1?=
 =?utf-8?B?R2haVnkrajlJNHpGK2Y4UGJycXlGSXdabG11QnYwMVNpMHo2TzB3NEhMaEtP?=
 =?utf-8?B?SHdLTDFwNTlCM2wrWEtQZ0JaN0VaUXA2d0FhSEZ1NFVHYUdVNndBTExmcUEv?=
 =?utf-8?B?bzloNW5hVWwyMlVQcitadEMwVG1xRU92WE1lRW9LNi9CWjNoZXlOWDFtLzBr?=
 =?utf-8?B?RHhvNUx0ZWd4aXI0dmZyVFIzRzM5WkFLcXZDR0RjNlY2d0YvOU5kQ0hsSVBw?=
 =?utf-8?B?YkRVZmx4bWZIRVVKd0VqUWlZWU9GblNTVGtHbk52bGlmZmhwdkJTSks2V3VJ?=
 =?utf-8?B?QVNhUTZUa2RQbmk5eDBnT0ZpR3U1ZEFlczVWWk5kUGNVelBoNC9RVncvM0k1?=
 =?utf-8?B?bnlZOHlwQlh1Yyt3ZWN6K1c1SWdSL2JwamRHckJNR3Zsb0tDQU5nM0NPbThN?=
 =?utf-8?B?MzByU3YxYzBMN2RDTGRXbnZzbGQzZzE4akRhSWx3WFcwTVNHWEhXTlgyOVZx?=
 =?utf-8?B?QkxtWnFLdEZLNzhWTEU0eFRDNTd1Vm9rSmdrUGYwUWZONXNKZ05lenBNbmEr?=
 =?utf-8?B?cEtMenpSdFRCVVNyeWFJai9OVDlncmlMR3k4VTlZc0NrczhNc3p3eGp0VjBi?=
 =?utf-8?B?d0Q5SGdXWWF4L2lFcUJDSzY4dFB2alBBb3oyTmk0TG1nc0lVS0FTR1FQQmFy?=
 =?utf-8?B?TUFFZmNnSGNwTVRIcEFnZ0p1OTF0eHF2K2VpSUQ0ZDhrSSs0TWQzOWxvU1Fk?=
 =?utf-8?B?ajZZdDlwcEFCWWZpYzVqOFpib1E3ckhCUG80RFVzYWc2bjZoVTBrVVd6MDFR?=
 =?utf-8?B?QjZyRUl3NndVUWk1YURObStjb1YvbU1ZeDM0YnVQRGxoZkIwVVZodUEzeHJM?=
 =?utf-8?B?a1ZoZlQrM2hYTEFKUnNWQjBqb29NRGRiamZFZTBtUVRJZmFYek9MWHc4K3NJ?=
 =?utf-8?B?OHdraWlBTUFVbVIxOHdZWFErRHVDVzJVU3NTaGdZaE9vWUFzbjhPRzcyVGtT?=
 =?utf-8?B?bk9TUmZscDNLL1JWNllIT1hzdDRxd1REYlBocVc3NjBpZTYwY2JpUDM4akpU?=
 =?utf-8?B?K2JHQkFsNUw0dndWQTRIR0x2citiMWEyS2dhcUYrU0lDcXU3djBnaEtMV0NZ?=
 =?utf-8?B?ZWRTZ21sWERzVFkwbVhzeXIvOHhod0ozaEdCTWtkZnNtMEtURmVRVUFoRWhl?=
 =?utf-8?B?bXhpcjRFaGI0bktDY1RhQnJiYk0wbmNKd25YdDE1UWlUbWpZcUE1eitkc3hq?=
 =?utf-8?B?d1hITFBmSmNXQVV0V2dQZG5LNTZ5S3V5M3NwOGozcklyczNSUW5QQnNvYXRG?=
 =?utf-8?B?MzlkblVRZStWc0ZCeDRzczNXTUVDSnBxaklXK2dheFNZLytpaFJ6RXJqaDFv?=
 =?utf-8?B?OGpmVWJyT2ZiVHVLdFR5RTJTWWVMaklsZmVqQ28vNTcrazdnUlhNZkQ2eFFm?=
 =?utf-8?Q?P6v2jYI8esGW6VxZQsSOf98iIxN+PA8otDK9z0S4/ZqX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7910438c-7ec5-4698-cce1-08dd50e41987
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 12:51:16.8741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oT8db7xeOGvuRtSqH/MFbRsqAex7OmXZQnf0XcwybSzjLyYdg5QeKWAMhtkJqh4Zx4Ms0CqjSxNhRulmXL0XtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6523
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

On Wed Feb 19, 2025 at 12:24 PM JST, John Hubbard wrote:
> On 2/18/25 5:21 PM, Alexandre Courbot wrote:
>> On Wed Feb 19, 2025 at 5:51 AM JST, Timur Tabi wrote:
>>> On Tue, 2025-02-18 at 22:16 +0900, Alexandre Courbot wrote:
> ...
>> More likely this would be something like:
>>=20
>>    let SplitU64 { high: some_u32, .. } =3D some_u64;
>>=20
>> Which is still a bit verbose, but a single-liner.
>>=20
>> Actually. How about adding methods to this trait that return either
>> component?
>>=20
>>    let some_u32 =3D some_u64.high_half();
>>    let another_u32 =3D some_u64.low_half();
>>=20
>> These should be used most of the times, and using destructuring/tuple
>> would only be useful for a few select cases.
>
> I think I like this approach best so far, because that is actually how
> drivers tend to use these values: one or the other 32 bits at a time.
> Registers are often grouped into 32-bit named registers, and driver code
> wants to refer to them one at a time (before breaking some of them down
> into smaller named fields)>
>
> The .high_half() and .low_half() approach matches that very closely.
> And it's simpler to read than the SplitU64 API, without losing anything
> we need, right?

Yes, that looks like the optimal way to do this actually. It also
doesn't introduce any overhead as the destructuring was doing both
high_half() and low_half() in sequence, so in some cases it might
even be more efficient.

I'd just like to find a better naming. high() and low() might be enough?
Or are there other suggestions?

