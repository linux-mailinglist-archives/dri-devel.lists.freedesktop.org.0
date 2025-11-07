Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDAAC41FFB
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A6D10EB8E;
	Fri,  7 Nov 2025 23:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JaFgd0UN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046B510EB93;
 Fri,  7 Nov 2025 23:43:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUAOvvXfxwHDd7fK1ZoJgAQVqtNAHjyzmMMZ3VDcofbLcji3yKggQVLnn1AgF0af6sHq4ZdTamuck86FZ1lGgQTfr8wFQm/eG3dQd6Dey/y1r4mk2U5NPMMHiSLYT28lDR66kU5HeeH/uEN70EeXqLSYztdymqT46hI6scil5JfA4WDlOBIDlcpCTTaC4K1hgsKBIX1v4vRmVw2toYVgu2VCmZQb2CG93z+SyERWFOCUCrmyrXy6tCuBh6lcM/T8EZEO6dbxq0yWBljR389md7dNCg0Y5zM4BBOT7RSyhbk7mNcxOMkTVMGEnuq3ZioR1/e4+MzXb26j9LA4g88lng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//1I0vihCLuWUhsWvlprBtDQqJ+/vPXzoYhKAmHOFWQ=;
 b=tpwXOgHb12VNxYPZiR6kmH3RYRa2kcrMFZRAMnX5yGdQ8cOdNGmnD3zDG+56d6THkvwSPnCDGe4WpjsRrMGtBn71Rn5m2LXBLYbuwo0G5QE+Z6hrfmtF7kP+GVi+WnZdIKyJE8cSxfleXY+B3etizw+Fne80MZhjhKYjjk8ys2pdqIzKKnp0sAXT+Vs5t04M8Om6BZxQ8Izsr7E8tCtZdJ+7fM/yvHkWTW5b/h35HlUBBfQ1tXanXeq/uebRqVY9SQWKpdhThythHCM++d3NviEkF01SAwna57Ek2eyx+y/3ssEH7mE5PyLn2Hpv8NWvsPJG/f3IL3OfrnhBIEETfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//1I0vihCLuWUhsWvlprBtDQqJ+/vPXzoYhKAmHOFWQ=;
 b=JaFgd0UNx+EqveiKInFcomHWORGsr01PqzgaINZVjxGhdQ5hlPCj2dG5A69fwml5KjaID26OAcCwn0cptOd2bleH/jEER431qJQvmsjsDGw+1fI4WzgcVx3rogyHHeahwheH9eQSRuPXa4q56HGQrf33++xI0/0JTxddI2rbLn0jBkQGJBSofCHRixVBqO5pfrHyWJm/XBdqmAYZtl/jP1dQUwKmGb4D1N8/o3AdlE49WCFs0u2NdPDMrBaEReV7+qOt0ZTw2zUA8HEBXDEBdC4hH5eTaPI2juDGXFLhDmzUkXBDTqviXS6/nL/10s6SN6r/iONFl6zLCTP0Gj9A3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:43:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:43:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:05 +0900
Subject: [PATCH v8 04/16] gpu: nova-core: Create initial Gsp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-4-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 3021dec9-a620-4c71-2a32-08de1e577611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTJMMTBZQ3U2UVJJOWJERnArVXFVbm1BaXFOdlV5a1FlSHI5Nm9aMkdqbUVV?=
 =?utf-8?B?NGlXNDdESXVzYVN1Wi81WWNrckZtRG4xZzAzZHpJbVorckw4QmdXS0N2RVBE?=
 =?utf-8?B?eEx2VHJVYXpXSytZc2JqUkNWY1pxb3BOZHJrZHBxb1cvQ2pPblo3SmE1NmNt?=
 =?utf-8?B?a3VMbGZkWFVaMkVFTjFLdHJBS0w0dVN6UWFHZUpQL3dQVUxPcDFJT0lidzRr?=
 =?utf-8?B?aHdZRWpFT0x5TW96U3VHN0NSQmVTRGl1TkhQYWhuemlYcUYrSGM5TXpRVElC?=
 =?utf-8?B?TkxmNjNnd0FTY0NQSGw5a0pTY2NyTU5sZ2taY1FUZmlHaXdWR2ptQ2hNR2Zq?=
 =?utf-8?B?WElONGFIRW9qVE9NZEZmSTFNbFBpSElINTExOFllSEQ4REVzS2tXTHRSTVE0?=
 =?utf-8?B?cGQwZzVyMzhKQW9SaENiWTZ1dERuZWtGQ0pPY0VEUXA1QUhZT0NHUzlRcHM0?=
 =?utf-8?B?Z2xLTXlSSUNtQXBMS1dyUkpVV21GdEVqNHk1Ui8xTTVaSy9wMVVPWVh1RTBo?=
 =?utf-8?B?T3IxaU16L1EvakQ3QXRxMTg0TitlUTlhdHMwTU5vQThvRkxwMENtM2VBcCtK?=
 =?utf-8?B?aVdVYmhHY1VBU3ovUjRVK2FkcU5ucHI2ZFptVkYxRitSeXJGaHl1T1ZVblEy?=
 =?utf-8?B?OEVzN01oWEUxZjdqNUIzbG9WTzV1VkJvQkYwWE9PUGVaRmJkRlE1SkViR0VX?=
 =?utf-8?B?WG94NEZEUW1sR0w1WVN5RENhc1hxclJJOTZCZVJJTWtkd2ZRNGgyRDZrTVJu?=
 =?utf-8?B?V1R5VktCaTRTa3UxN0xsUUNLcGQ1NnVLRUw1MUJ2MkRmTytoQXNqbTBuL2hW?=
 =?utf-8?B?blZiZ0h2Zk5XSklTZnZQMUgwR0s5MmhOL2VBZk4rSUoxYm1RRm40Y2xUa0pH?=
 =?utf-8?B?aTlKUU5qVkZYMDNpSHdzZjdZS25kVmNQa2NERzFhcXVoaWxjZllOOVZLRzdq?=
 =?utf-8?B?ZjlrNUticVJIcXh3TU9JbXROZHNlNUpGNTlFdDRDSmhNbW43ZTRXd3czNGZ0?=
 =?utf-8?B?eDdHZm9KbVM4bHNwbXNSZ2xiWnV1OGdLUHJ2eFVjeXlTY0J3VUQ5UVVNQjg2?=
 =?utf-8?B?VGVuZWRqeTcwUGhiQVFSaWU5ZFVHUkhPVk5MK3p2NjEzS21udDlFZUxkQnl3?=
 =?utf-8?B?THp4NVJxOFNvWGg1K3V4R3dXc2xCajNVNkVVNFE3a1E1R3JuNnYzM00rSjNz?=
 =?utf-8?B?clB0aktJTDNsMC91TGgrRTlZMU51TVdaQnVXWG9qNmdnRTdIUmY1MjB6Qi9R?=
 =?utf-8?B?RlNkRk9Ya1dLbHYwNVliRjg0TU5ITFFvQTgyZ0pvQzVLSU1PWjRJaXR1SUJF?=
 =?utf-8?B?UEViOU5BOG5OWHRmTU1pSndBcUcwcTMvTk5rYnh0dG1Ka2VMbXZBQUxPQVlW?=
 =?utf-8?B?WXZ1T0N6SmlmSDlvb0I0YVZyT2lXTDZsc2hKWkNyek9UczdIZDdHWEt3STc1?=
 =?utf-8?B?MkluemRLcHErMHR3b1JTcWd2bE5mMTltbkVPSUpKN0VwbU1hNGZiaTZ0QnhM?=
 =?utf-8?B?T1JNdU05REtmZUxDQUM3S0F6a1c0eGVwWHBvUEozSDVoNkJ6SHRCS3YxZzVU?=
 =?utf-8?B?aW8xUFRSaWtxaDM2bnZ0Q295aWsrMXRLZFMyQVpFNFRYc1RsTXlNTG5HVnlB?=
 =?utf-8?B?TndUdkxDcEEwMUE5TUhRY0Foa2hOVEJQQTRYU1VFZmJUV2FwbzdxK0Y0VGxD?=
 =?utf-8?B?R2dnRGxUSWJCVzlCY2dGVkZaSVpCSlFRWkZ0ZTZkNktnRDJNZXlYYmQrczQz?=
 =?utf-8?B?MGdhakJsVWI0L0R4YUFpMWJ2QXllZlJyNkhmbGlpMWNXdlU3Z1NsZlppV1FO?=
 =?utf-8?B?TnZoK1JoQU03VG1xK1h5Ykt0VDB0ZzlobEdVbk81TUZvTWNiSkhqZnIyclhH?=
 =?utf-8?B?VnVORkhsUzRPbmY4VHo3VlRZMEM0YWZudEllQzdIOVNGRVhVWUlMbUNmSUw4?=
 =?utf-8?B?QnJKc0orM0I4V2ZjQXRrNGhkUVhjTHFKeTV4cktSQkNqUXl1UU1QeGRCc0kr?=
 =?utf-8?Q?t40xBwCZQnBlRaoRsBeTL5pMhGmW4g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0ZMcktXVUR1eFRRRFBaN2cvY2dYQ2NCdm9LK2FxbW5hNzZBejVVanhlMFpL?=
 =?utf-8?B?TThlU3gxSVhVOVpXUnN3a1Z4dEhlZmZHdTJxd3llNlZxdlVzeVVjMStPQXI2?=
 =?utf-8?B?ODNkWEw5NmpUaUY4Q1RHVUxzN0g0R3pzeWVsZ1NycFFXc0pqUStHSFRVdWF1?=
 =?utf-8?B?UDROVEY4MXBOUUxveWxlN0FnK1F2S1V6QXZLY1JXNk1seXJGcHhCRVlGaE5s?=
 =?utf-8?B?cTRUMW1xYTZSbnA0RXppb3hTS3lhd0hTOEVqZTYyUGZ2ZXhSUXRhWllLR01I?=
 =?utf-8?B?WEV1NHYzUVIydkJhUWlCQ1RsTGw1TENoQ3J2VHJIWDcxTkJQTGRpKzRmNEVz?=
 =?utf-8?B?YzNZNmxPM01BU1h1VEExdjJCZ1NtTFljeHNoaEFmb05vT1FsTStUODNrc1Ju?=
 =?utf-8?B?ejVlL0lMZzhZU0dNNEpudjZhTWRablNYUGMxRURhbGxMN3ZxMjdkMG41NE1n?=
 =?utf-8?B?MFRvbFY5TmdWcTN3MFBEQ0FKdHlESVkzM3A2VDBvcitNOUlrMy9aSnBuckpT?=
 =?utf-8?B?VGQ3c0JLdFA0cHBzcXdWV2kvYmg1N0o3bzJ1NE96UHhTMTVpSDJPckg1VzZk?=
 =?utf-8?B?aHc4M1N5bEJ4d1hZRlRFb0hrdWhxc3JMNW1zUU12MVBDbVF4L2cxamtKOS84?=
 =?utf-8?B?ZDVnamhXaUFuOWEyOFNnNlVhWmZqME5xQVFRK3RNOE53ZnM3Z0M5U2YyaGVz?=
 =?utf-8?B?VnkrT2R1ck5CSTZwY0NrSCtUbDRTSDNYMkcxUGUyYTA0a2RwN0ZPMTM0azBj?=
 =?utf-8?B?L0xKZ0FETEJGM0I4Y0tndzJsU3h1a3IyVlJyWTlrT2NqVVhLOHJmOVd2Umxu?=
 =?utf-8?B?dG1pMG5yK1ZxbjYwZFdpcUNndG9oNVUyWFFNMDRrZEc1QWxjOGNCSWIrU1dz?=
 =?utf-8?B?Y0lIZ3hFWmZXYks1RkVIbDlpcVFocXNmUVcwVnoyQlBZWlg0OVBCc1J0OHUw?=
 =?utf-8?B?KzUvenNrNi9NWFBCVWlqaGJGREFnSUNoK3A0ajNQNk9oSEZUdDh3bXlYV0x5?=
 =?utf-8?B?T3FyMGM2SFVHSXArWEwyK3FrNDYrYm16QUJLOU5YVlFoN2tsMm9Ra3VrRVJV?=
 =?utf-8?B?Y1F6eTQxaFBpT3BYcm5iT052bGpmVzBUOGFNaTJBbGJBMExadHNTK1BiME1X?=
 =?utf-8?B?UGREdnpDRWJDOS81R0VlREw4V0dIL09CM2tLZkUzNGRPZ01HeWdxM3Via0pt?=
 =?utf-8?B?bDFJS1JvY3RPRk12bHlOVG04QTZHT1lUZ1RrZStMUmJZdS9WMmR1dXVVM0lt?=
 =?utf-8?B?RmhNL3RyZGlsNHdrMkE5NXdOV09LMDdWbXhZenpKQzl6RkZGNnVzb0x5Q1Ba?=
 =?utf-8?B?M1d4MDQ5K3czSVN2U3Y0dkZoamgwRCtGREVaMUZnZklvMWhUbEgyU1BWUG4r?=
 =?utf-8?B?V3JYV2FrMFBRUEJ4YVRBUE5kKzAvOENQYzlTdUpWMDVXWFpvV29xZkY2Mm1P?=
 =?utf-8?B?bWdEUzBtWEU4R0NNTURnZ1o3WmJ6Vkw5L1AvelYzSTN5SVFxYlMwMW9zaXV6?=
 =?utf-8?B?R01wY2xSRzRpdXVudHlLc2NNbnE4a3l0QTJTUFVuUjFISS90bzh0aUdZcVND?=
 =?utf-8?B?N3hXakFGeGIvQ3U5cklhSDViditVYmdzQTJqZDhHblJsY3Uyb0I5ak1HMmty?=
 =?utf-8?B?R0RHaXBORDdrVlRibngxSWNsTVZVUlgwQ2RlRGJzNFVxcDlFbUJRSnRvTlRC?=
 =?utf-8?B?dGk0YnJ0UkhwaGpjckFhb0U5S0Y3NnUvWEdwVnUyMDZ2ZG8waWhmZ3FjSkxu?=
 =?utf-8?B?R21UM1NaSkRnY01RejREZ2g3ck0xZnVnNXNFRzN4bStaY1FoVm14SXhGTkdG?=
 =?utf-8?B?a1p5UW51V0ZtMmZwNHh6em1uUTRxK0lGUVFlNVRwRXBKR0JnOVNXcE1OQzRI?=
 =?utf-8?B?NGF0ZVdTc1FGcHBaRmVIZFp6c0dYRFNieWlPeU1nTEJuTWx2T3ZpUkh1VUxM?=
 =?utf-8?B?Q28rUlR4a21NQjUzRjRvbFBSaWpRYXYzMnkzNzNUMjU5blA4YW1IQ2NxMnhw?=
 =?utf-8?B?c0V4b1JBd3EwQVcrTGVGVXRyYnRnb2M0MWNML2luTnVTYlNvSisvOGQyQkFE?=
 =?utf-8?B?NktUNitMVFA0aGliVVRYQlU1ZEdnUVBUdHZ3MWlVRkh0aXYwQWhlNVFjVGU0?=
 =?utf-8?B?T0NWL213SURFanNqOFVZMFFaSlo5UEhIbFlEcUQ0QmhKMFR6dGhRZjg4eVNn?=
 =?utf-8?Q?n5aYvxkkZUVh6RgeqXLAxtGGA8g4w0jXtLto7+dpyVOr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3021dec9-a620-4c71-2a32-08de1e577611
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:43:32.7744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJVoACXpnU2lhqSJS03EwhK373DnCxww1fR/dNsIVUr4K9CfW+aaRcu65OOg7nCaTVbNaVeLMfiuGNUrtVlAyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

From: Alistair Popple <apopple@nvidia.com>

The GSP requires several areas of memory to operate. Each of these have
their own simple embedded page tables. Set these up and map them for DMA
to/from GSP using CoherentAllocation's. Return the DMA handle describing
where each of these regions are for future use when booting GSP.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs                      |   2 +-
 drivers/gpu/nova-core/gsp.rs                      | 122 ++++++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs                   |  60 +++++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  19 ++++
 4 files changed, 194 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 802e71e4f97d..03dae437bc37 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -231,7 +231,7 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
-            gsp <- Gsp::new(),
+            gsp <- Gsp::new(pdev)?,
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index aa2a9e6654e4..ea6a1f053780 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,23 +2,129 @@
 
 mod boot;
 
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma::DmaAddress;
+use kernel::dma_write;
+use kernel::pci;
 use kernel::prelude::*;
+use kernel::transmute::AsBytes;
 
 mod fw;
 
+use fw::LibosMemoryRegionInitArgument;
+
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
+use crate::num;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 
-/// GSP runtime data.
-///
-/// This is an empty pinned placeholder for now.
-#[pin_data]
-pub(crate) struct Gsp {}
+/// Number of GSP pages to use in a RM log buffer.
+const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
 
-impl Gsp {
-    pub(crate) fn new() -> impl PinInit<Self> {
-        pin_init!(Self {})
+/// Array of page table entries, as understood by the GSP bootloader.
+#[repr(C)]
+struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
+
+/// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper around one.
+unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
+
+impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
+    /// Creates a new page table array mapping `NUM_PAGES` GSP pages starting at address `start`.
+    fn new(start: DmaAddress) -> Result<Self> {
+        let mut ptes = [0u64; NUM_PAGES];
+        for (i, pte) in ptes.iter_mut().enumerate() {
+            *pte = start
+                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
+                .ok_or(EOVERFLOW)?;
+        }
+
+        Ok(Self(ptes))
+    }
+}
+
+/// The logging buffers are byte queues that contain encoded printf-like
+/// messages from GSP-RM.  They need to be decoded by a special application
+/// that can parse the buffers.
+///
+/// The 'loginit' buffer contains logs from early GSP-RM init and
+/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
+/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
+///
+/// The physical address map for the log buffer is stored in the buffer
+/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
+/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
+/// then pp points to index into the buffer where the next logging entry will
+/// be written. Therefore, the logging data is valid if:
+///   1 <= pp < sizeof(buffer)/sizeof(u64)
+struct LogBuffer(CoherentAllocation<u8>);
+
+impl LogBuffer {
+    /// Creates a new `LogBuffer` mapped on `dev`.
+    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        const NUM_PAGES: usize = RM_LOG_BUFFER_NUM_PAGES;
+
+        let mut obj = Self(CoherentAllocation::<u8>::alloc_coherent(
+            dev,
+            NUM_PAGES * GSP_PAGE_SIZE,
+            GFP_KERNEL | __GFP_ZERO,
+        )?);
+        let ptes = PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
+
+        // SAFETY: `obj` has just been created and we are its sole user.
+        unsafe {
+            // Copy the self-mapping PTE at the expected location.
+            obj.0
+                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
+                .copy_from_slice(ptes.as_bytes())
+        };
+
+        Ok(obj)
+    }
+}
+
+/// GSP runtime data.
+#[pin_data]
+pub(crate) struct Gsp {
+    /// Libos arguments.
+    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    /// Init log buffer.
+    loginit: LogBuffer,
+    /// Interrupts log buffer.
+    logintr: LogBuffer,
+    /// RM log buffer.
+    logrm: LogBuffer,
+}
+
+impl Gsp {
+    // Creates an in-place initializer for a `Gsp` manager for `pdev`.
+    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
+        let dev = pdev.as_ref();
+        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+            dev,
+            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        // Initialise the logging structures. The OpenRM equivalents are in:
+        // _kgspInitLibosLoggingStructures (allocates memory for buffers)
+        // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
+        let loginit = LogBuffer::new(dev)?;
+        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
+
+        let logintr = LogBuffer::new(dev)?;
+        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
+
+        let logrm = LogBuffer::new(dev)?;
+        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+
+        Ok(try_pin_init!(Self {
+            libos,
+            loginit,
+            logintr,
+            logrm,
+        }))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 436c00d07b16..458b5610061f 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -8,11 +8,16 @@
 use core::ops::Range;
 
 use kernel::{
+    dma::CoherentAllocation,
     ptr::{
         Alignable,
         Alignment, //
     },
     sizes::SZ_1M,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
 };
 
 use crate::{
@@ -116,3 +121,58 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 /// addresses of the GSP bootloader and firmware.
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
+
+/// Struct containing the arguments required to pass a memory buffer to the GSP
+/// for use during initialisation.
+///
+/// The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
+/// configured for a larger page size (e.g. 64K pages), we need to give
+/// the GSP an array of 4K pages. Since we only create physically contiguous
+/// buffers the math to calculate the addresses is simple.
+///
+/// The buffers must be a multiple of GSP_PAGE_SIZE.  GSP-RM also currently
+/// ignores the @kind field for LOGINIT, LOGINTR, and LOGRM, but expects the
+/// buffers to be physically contiguous anyway.
+///
+/// The memory allocated for the arguments must remain until the GSP sends the
+/// init_done RPC.
+#[repr(transparent)]
+pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
+
+// SAFETY: Padding is explicit and does not contain uninitialized data.
+unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
+
+impl LibosMemoryRegionInitArgument {
+    pub(crate) fn new<A: AsBytes + FromBytes>(
+        name: &'static str,
+        obj: &CoherentAllocation<A>,
+    ) -> Self {
+        /// Generates the `ID8` identifier required for some GSP objects.
+        fn id8(name: &str) -> u64 {
+            let mut bytes = [0u8; core::mem::size_of::<u64>()];
+
+            for (c, b) in name.bytes().rev().zip(&mut bytes) {
+                *b = c;
+            }
+
+            u64::from_ne_bytes(bytes)
+        }
+
+        Self(bindings::LibosMemoryRegionInitArgument {
+            id8: id8(name),
+            pa: obj.dma_handle(),
+            size: num::usize_as_u64(obj.size()),
+            kind: num::u32_into_u8::<
+                { bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS },
+            >(),
+            loc: num::u32_into_u8::<
+                { bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM },
+            >(),
+            ..Default::default()
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 0407000cca22..6a14cc324391 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -124,3 +124,22 @@ fn default() -> Self {
         }
     }
 }
+pub type LibosAddress = u64_;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_NONE: LibosMemoryRegionKind = 0;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS: LibosMemoryRegionKind = 1;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_RADIX3: LibosMemoryRegionKind = 2;
+pub type LibosMemoryRegionKind = ffi::c_uint;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_NONE: LibosMemoryRegionLoc = 0;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM: LibosMemoryRegionLoc = 1;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
+pub type LibosMemoryRegionLoc = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct LibosMemoryRegionInitArgument {
+    pub id8: LibosAddress,
+    pub pa: LibosAddress,
+    pub size: LibosAddress,
+    pub kind: u8_,
+    pub loc: u8_,
+    pub __bindgen_padding_0: [u8; 6usize],
+}

-- 
2.51.2

