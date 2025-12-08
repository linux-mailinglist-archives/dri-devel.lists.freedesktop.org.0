Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C215CACA9F
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4B310E3EA;
	Mon,  8 Dec 2025 09:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N9Ug/yEK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011010.outbound.protection.outlook.com
 [40.93.194.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B914710E3FA;
 Mon,  8 Dec 2025 09:27:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQQr68MlGxXDu/A1ZBF66BiCaqTmXMMakTrC1K6OEG2XzNW3aghL0h0X8wkpzv8htiZV/ymTNJ15hzm7/F0UbNz4ktqsN89sOSroP+Sm2rvPvi0wD/e7u4g+aoLEIiYY4nfA4kjJVmt62/8SQGej6tO2qLZQ9HVk8YzUDKXKEUthKZthRGYpSrH0abxG/thWz6AgSsWCZIDfkuUrIr0yyEOppwNN9vi48mncDE5lXgEkYw5FMMRAd60+DYPqi9oMzjwjvA0fUy6Y5ebG9ow4ptGSq1dyOfuBpe9cLBuFn8KIvlszr2VOuUjECFeiD5Mp8OcbQvkmTGLrjlozqNangw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gs/ZUAAnDLi/2AlFPgPbXK/6QLGe6E/zFE01P+5dtdo=;
 b=LGD4Hgq+RBU7JGwtIdCiYki33QvX4TocKdya2KcdwJ02bDhQ2roVHH+FhFIPOTPVfe+fqUcZ0t9sMEaGp78KEJ4nDm1it2wCpIZB7/c0elUlhYIH+3PqkGvOESEKc5UYSPhgnulHA/kOnWKLl4oTa7WLWoC6tN/c3B45nnDoT5+MymwQ4pdtdeBH2gECEnzltFFpQFTzLtMsfU1VCHQ5KpUajsjb1uIpJmFcRHDH9n7zuQOhHoAx2HpQDYlSAHLx/yY3gmFgDb38XVCx6/wBRAWRav2omc+XMm3PJN43nabFK/ZmwdY6N6A/fkj72hHUgxQQGvoNcXmX/QcNdnUIhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs/ZUAAnDLi/2AlFPgPbXK/6QLGe6E/zFE01P+5dtdo=;
 b=N9Ug/yEK7yYCXF0g8HxjGzPDkQ6/9xlvOfJ1/q+XAPIacrB4xj0w8z0eP7MIqG6aKSh+zVAUABs27qRrlvdGRY4dGNrLiS/BhJ696qmymnGObne2Mz6iZ5q8nOufeixnf4Z3G2we7MnxtZfVZLsm7/dC+CyYYYN0pFhjXK9iUzqerHCQGnDCBcvLoZEgvI4WVM1JCidpMdYE0QLPsce+wiRiyBh7Irc0zk5XR36TPyQ62w2ipmMO0dKPjKwVdNXwMMmZ7QcS670N45i7tWPjBlCyirYP2ejbIYPIREMmA+PH/pEJbSXRuPNHVBZm6WAOaYl6sIklvJluwCXBC5dNMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:27:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:27:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 18:26:59 +0900
Subject: [PATCH 7/9] gpu: nova-core: firmware: fwsec: do not require bound
 device when unneeded
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
In-Reply-To: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OSAPR01CA0329.jpnprd01.prod.outlook.com
 (2603:1096:604:2a::29) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: c4587e0c-6c8b-46a6-ea4a-08de363c04f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlJFMGkxQkppKzF2emdTeUNVcUszYUtUUHFMVlU0VDB1ZnlScmJMMnVER0Ry?=
 =?utf-8?B?bms0eDM3NTdVTDg1UGgzR2RMQTJpZ2ZCRkpjV200N3FudllHY0ZGSEcxcU82?=
 =?utf-8?B?NHhpRW5kNC95aGJMMnREcFV6N3pQNE1FVkc1VThMMllTM3Z6T0FnQXFqaVNR?=
 =?utf-8?B?dmljVnNHeVVscU1Rb0hFWWRiSjVHU29tdmduUEFVdkh1MEI3ZXllNjRhY3or?=
 =?utf-8?B?WTNWN3ZyTFBWelA3L2w3dkJiOGNqZnlpQ2xuL01QeUx6NEtyZVNhTjZNZDZF?=
 =?utf-8?B?TTZUL2VtU1NmdFJIWmFFWVBYcHhEWmdCcEE2Q1B0Q0E2TjFoZVloN1I3K1JF?=
 =?utf-8?B?UmJPeTRKWjVQZGpGKzVqZi9ZeURLWktLbWFvSkVDcWdYYjBFc25ySS9MejZZ?=
 =?utf-8?B?YzRxR3hQalNIV2tLZWd3VGxaWDlOUGc0cG56WW5zeWMvbTFzVXhIMUQwZDBF?=
 =?utf-8?B?ejgwQUo4THBGYWpFMTBCQVdDd1dTSjJSYStxZkdsMk05dHlGTkYwVEtFbGI5?=
 =?utf-8?B?TEdUY0FQUDF4b0xIK1dsUDZVV1BwZ0RRREhGNW5BVG0yVnVXOU9xQ1NmNFpp?=
 =?utf-8?B?WHNWcUhNVXc5RmpDcHVBdU4wR1o2aWRmSytreFdVTlBrd3pMQkdCejEzRm85?=
 =?utf-8?B?aFZaZFpPNlN0bk5oQ01ZZVpmbFN0anh1a2NvcEs4OTl5cndjbWJyUGRzelB6?=
 =?utf-8?B?LzZQT29maUVZYk1NeVgxTysvRU9wOXQrc2ZMY1RYcDRudm1KZ3liQWl6SFRq?=
 =?utf-8?B?M21rbGRjUjZDTmhKV2JuL3EwVFZNeXdZemJ3amk1SDNXR3RhMEFtR1JCaW5G?=
 =?utf-8?B?azNpd1Y5MXcvSFUra2NhKzFoeVROdTMzN2QzM1kzR3FnVkN4UGNEMW5ybE9C?=
 =?utf-8?B?N0IwQ1FETDJqZzQ2Nkd6WGZMZmQ1WVlDUXUzZ0ttVm1iRjIxRXh0MDBiNGYw?=
 =?utf-8?B?d1VwU0xmK20xdXpaRjR0bmh1bzJSMnZhRDBJL08wZnk5TUZ3OW1OdnIrUUND?=
 =?utf-8?B?by8vKzBrUjA2UjdsU0VNVy9FZEdwWkJvQm43cTlmVzBkaGxVd1M3dnh5blhC?=
 =?utf-8?B?NlJvN21GS2hIMmxmb3lDT3hhSGJ0UC9BM0M0dFNrdWJNOEtJck93UnlYalNY?=
 =?utf-8?B?eGVuN0NNSXZLaDJkSGo1bGZvelBHRjdMVEQrRGRYajVuWG9NS0VneFNnQ2xk?=
 =?utf-8?B?cjNFOFhxK2R5SlJaYWo0bFp0bXJyRWNJL0ljVCtkQXRZZ1BzQmVjMXpmVzlS?=
 =?utf-8?B?ZWhwSER2cTE0R2d3UVZRbmcrb2hqbThtWlFrdERxZ1Y5YXdUY2lITG9Fdi9u?=
 =?utf-8?B?TjBHVUFKcHplSWd0cHRpUTJ0Uk9NQjVjY1oyVHFoUHQvcnZBVVVSSEgvMXd5?=
 =?utf-8?B?Y3M3SGtwdmhDV3hKU21zZXB2TTh3bWlmbWdyV0xmMFlkcWRaa0dZcERoRXdR?=
 =?utf-8?B?akZVemJzZU9PWlVGU2NUY3VsMjdnR2RtcklnRUV6MHdGdXNCd1pFeTU3Tzdl?=
 =?utf-8?B?aXh4YlYwUDhnSXV3dHliU0dnR0M3VFEvNnRkR0V0KzBZaFFMT2VUdEovcEFV?=
 =?utf-8?B?eWU4ZjdSWHJzSWVuRzRXVFdyaGo0YkpKUHJiQzVCNHRZSjY4dnVwUUpPZThh?=
 =?utf-8?B?NkJZNzU5S21ob0w2c3FxdlFjc0pDcDFPWTdkVnkrbmEydE5rbk1OUGpZelFq?=
 =?utf-8?B?OHdpSTZlSHo1SVZVK3lvV1k4MkJINlBBWWY3NHRlTW5oM09IMURDRm5zQ0I4?=
 =?utf-8?B?S1NjeHNBRXR3TXFUTXM3ajdtQWtIRldFV0lKTmN1TXY4cFh4L2xETk9DZEsv?=
 =?utf-8?B?Z1pYdXRzOUZqUGlzZGYzcEkwS3RoVlpSZmYrZC9HM25aZjROMnNkRWk2eTNz?=
 =?utf-8?B?T2FGclJsSVNoT0lYL2Nrd3FjMnkzS25mS05KaEFvRzZjV0toeXlRNEZZSHY5?=
 =?utf-8?Q?DmEO1VBaBFfmxpTLBdBLV4ccn3dnXCj8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2t4VUlLMml6L3BGT3JTUVhRRE9ON2VObzhLMHlQMUFuR3lkYmNTM3dXLy9Q?=
 =?utf-8?B?MWZYVWhNamVYMnhrWjB3RUF6cVB5OG5QREJ3MjVrT1dzdWk3T0FGWkRzSnl6?=
 =?utf-8?B?eWtIVTA3Rm5IeFpHZ0ZRZGNLYjZQbkhmOVpCckI0VHdySEdrcVFIalhKa2xz?=
 =?utf-8?B?ZzBYYlJGRWgxQ2NCMEgraHNiNG0yeXg0Z0d4anFmZmRweXkwZGxZcUluMjFN?=
 =?utf-8?B?TUtCYkRVKzdPdEg1cml6VkZsbVlhWml1WkQyd1NYOTJ1WHpRUVFOWHNERXZJ?=
 =?utf-8?B?eFVrRm16RGhvV09pVEtsT0J4SkZiZ1BmdGU3OXU4bURkKzRXWjhyeEtvVVZy?=
 =?utf-8?B?RTlRbG5saERWSTZqZG1WK3ROZzhEZEdObk1XWHNmMzhCZCthTDZVV0NZSDE1?=
 =?utf-8?B?SlQ4QksxcURKalV2TCtvU0lnY0xSbWVtVThvdURxTjRlT0xGelk3bk1HSFdQ?=
 =?utf-8?B?TDIrbkpLVHozd0RnRWsrUUZYWUJmcUs5SW56U2JrelpTb1A0R1N1MnpVWkY4?=
 =?utf-8?B?RHVoWU5rdHRUQzZsTkYxWWZNVXFxdWxwbXZlc24ya0JqQnloTUUwUzNqbjFQ?=
 =?utf-8?B?V1hyM3lZL3RBNkdHWnhma1did0pMRE5OUlVGSWl2ZTNXY1dHRHVSUmhHanJI?=
 =?utf-8?B?SVZWRUpJMkVLc3JYaFlVWlZna2ZhMitiTlFGWno5TCtKZThLVm1EeG5TSHNG?=
 =?utf-8?B?QzRmZ2pnWnVoQ2FDSmJHMkg4dzJzNlRrMUczb3pTRGhEMkhpL0UrRVppVlY4?=
 =?utf-8?B?dDNNdGFPMGxsUXpZdGIrQnM3RTd6cHR2UklialVKSXVOb2lsSWl3d0ltazBG?=
 =?utf-8?B?dGlqVzZkWm9YNmg5bXpLKzQ3VUhXYnRqK2czL0JjTXd5U0ZqNllKclQyQzRB?=
 =?utf-8?B?N0VMNU42emlGYk0vVGYyU3YxVzZ0NGpMUUVZQTNPd3pJSmdMRGxueGw2ZDRk?=
 =?utf-8?B?L010YkFpTm52cklzMkJyRzM5WklwbGJlVkZGV0luTjA5Ly9NUlJLdlFXWkhn?=
 =?utf-8?B?Rk1VdE1xbmdaNlY1MnNkMEdtYTdyY29OV2lWZnJabnB1WlA3Szc2bmdzZzZM?=
 =?utf-8?B?OEMreTJPWFZUNUFXbGlUcHZuWEtnSE1QY0psZHZtUklOaHRLTVRKT3VQNDJ3?=
 =?utf-8?B?ZjRnRVNSRW5uV3NjRzdBd2FEU1JvVzNEdGRXSkJrNWROR1pQU3FSRHRBNnNF?=
 =?utf-8?B?dTRvUDdJTmx6MmJmUlBuMHlFcjdrc05zWS8zVEZ3Q0l5aEdmcFlVbDhnUDY4?=
 =?utf-8?B?UEVMQjQ3dXJJeGtjeFpNaXlBUzNJcWtQQ3FBU3hWdHFnUEQ3NGowUWpEOFY5?=
 =?utf-8?B?akljMHhHN2ttTDY2ck1kL3FSVFY0YmpTWU5Lc0RqQTN4SjVEaWtnOEpnYTRQ?=
 =?utf-8?B?Y0VMc0xKTGpWUXNUcSszTjJwZWpmaWMreWNlLzhCekw1b2ZLalh0SEIxbjBh?=
 =?utf-8?B?ZHQwS2J0d0t2a1gwY0JqS0hSSWNSK0lZWW9wbGhXUVIyVDJrSElpVDdwVnFM?=
 =?utf-8?B?Z2hjOEEvQlliVEg5VUtYR0NWd3djZ2xDVW0reVk5OFAvMmtCVDdQdGs3Zzkz?=
 =?utf-8?B?RmFSYWdTdjNUekJpSGkzWXhHNm8xR0l4SWtkNHdleXhvTkRhMXQxRGpoVlI0?=
 =?utf-8?B?dXM3QUJRSHpNTGxUVkhhRGQ3VVExd2ZNU2FxYzFIOWhOTitxaHNidENBYUYr?=
 =?utf-8?B?cHIyM1FTalJYZ1pXSVMzalBodGZqWnpRdFpFZ1NRTm9SZVRtZDhaSXdQSVpD?=
 =?utf-8?B?VG9EM0lYM0hDMnZmV1NpaGMzd25FL05MRDJqb3VsdklFcWs1TGxjaExDbW9P?=
 =?utf-8?B?L0lMZDEydmRkRlQ1UU9KcmpLWUU1VkkydWFmWnhXZVppS1NLQ1BkaHRoK2Yv?=
 =?utf-8?B?ekpEMGFTUW5DR3RPUGxDR2h1ZjhXQ2hHZ1ByZzZWWVFwTGJ1dTI2dFYzb2dR?=
 =?utf-8?B?ZmtRTjR5Z0psa0lxMHUwaW9oZDVFL2tEK0hoa28vY0Z4VE1QOXhWL2pTRHVB?=
 =?utf-8?B?cVBuSXJIeVRLeGVWQ3RuRW44WFBvNDFHemxwRi9jKzBBT3I1SjdoZ29yVkNI?=
 =?utf-8?B?QkJCblRGNG91ZzN4Z1dyc1Z1UDNwdGJlZjZDMnR4MXd6bDQ2RzNDbnNXUmFV?=
 =?utf-8?B?NVNGeEdkVHdQNmR1WkNidFo1bVVvVG4vYmloZ0pjNEsxVTdTdk00YkZUVmFE?=
 =?utf-8?Q?F7u4CK/bFNqRAtD9DHpw5Lg5ypFEsjWAKdJqRlK9978o?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4587e0c-6c8b-46a6-ea4a-08de363c04f2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:27:34.4969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwJnUDTGcKVMBvfD9jjarGRDBKO4Xo0+ldbwLo9Mw4h7HzlsNLKn6gTKRrPnZzwVIDoMcHJUAL/+o09E/MEFzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

`run` doesn't require a bound device as its argument.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index b28e34d279f4..b98b1286dc94 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -412,12 +412,7 @@ pub(crate) fn new(
     }
 
     /// Loads the FWSEC firmware into `falcon` and execute it.
-    pub(crate) fn run(
-        &self,
-        dev: &Device<device::Bound>,
-        falcon: &Falcon<Gsp>,
-        bar: &Bar0,
-    ) -> Result<()> {
+    pub(crate) fn run(&self, dev: &Device, falcon: &Falcon<Gsp>, bar: &Bar0) -> Result<()> {
         // Reset falcon, load the firmware, and run it.
         falcon
             .reset(bar)

-- 
2.52.0

