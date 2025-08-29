Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8888EB3B9E1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 13:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C8510EB8D;
	Fri, 29 Aug 2025 11:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uIKAMunv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607E910EB90;
 Fri, 29 Aug 2025 11:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Si1WHyuv2KfR8vKn/fdPoRnwo/W0nJ/b7tNxFGaNTIT6aiooOZqqA+xxad0Ch9HQdQmymvDWofyalF1EOVO/IXyOZC/oB0Rfen6iI9+xyG5IIB76FgHOYGZsr4Oc0vLZmYKiaasvnbu+c4/5SSlb1pLJncnVelLXhuzWLxL8P3GCnRDqQbf9hQewO0SJpjLtH9fgame2SdBv2GVgZ++K98VKvrrCrOIRkzASlYd/HjUJArZGI4h23nFN9FH5HPn+5YpFRZHqdVYZGfLSEIPdreDZwS8YIVJtypAwDcFM5j0WpXTtYndMs7a+vvKZobRTT+WLwn9JRoe+SqOQh9RGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nK40oBY0l4VQDPVbtDdhfrXKMNgf/xn2L4LgX9A1NQw=;
 b=SaLie30hS1EXR16/Mb7V0K5uLd9l/Z4Hj6cb+D7+MOlbisaiIxr0e1nZCEEDicU+UUjWjssv9E1ql41B0++5EvOsEL6T6ShphP672rGqiAr094bPxrtgk8n1Ll/fExtPexn01bSw0vQ5a/wzJfUKEUVf9wrsrTahWq1r6uDhma8jqJk2JSKY1y72wDFaZn6Fcv11PjQi0NF4yetJzB0tIP9p08OVfyXoplfoEKgfBVw3Nf/TSG14kGffLjYb9jinJRnKGpBQne3gJBq+icWO/XfthWBEQ/HMUhQSOlctXiizcbcFCy8ouAFoSpfmwcS+x0Fw2EE9yoPcMiXftL61Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nK40oBY0l4VQDPVbtDdhfrXKMNgf/xn2L4LgX9A1NQw=;
 b=uIKAMunv5R5dZ2QtlggOmLVVDmEMYcavaXG5lUNERoSrQbZj9DBqN40DoQweQTUqD/M+j29iPvLs8B4R6E/czLBggcYDNsMC+D77X9KSzT7PaggL6d4TeZvgREqmEpzlg/W4uZSdqDnOnUNLz5VflvJfDWgP3v4KzBJqOWPVnV/v5yXbbBlI90EwF2ii/ufg5AV0egRGKOCSejaPQ06wjmdmjO9dHuMXfSpJCwbU0KRyPjmsY4tWd7wQZ15J+ID/yZIiczZN+U3WvQWOv5Wpa8iCxA/5qaB15dzOZQNrmrIY+unC9enrAmm8Q/6kicMaralK0xIH6gTzkIg+dSocNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9331.namprd12.prod.outlook.com (2603:10b6:408:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 11:23:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 11:23:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 20:23:50 +0900
Message-Id: <DCEVGEN5P777.180KP7EUZFLQ5@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: depend on CONFIG_64BIT
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "John Hubbard" <jhubbard@nvidia.com>,
 "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250828223954.351348-1-dakr@kernel.org>
In-Reply-To: <20250828223954.351348-1-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0141.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e83b6df-238c-4b71-7a06-08dde6ee89d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVViK2xRcDhJTHM0NzJjVUhNWk9iTDBQSkUrcWY2U1NOYkJvVVdzM0tEL2Mz?=
 =?utf-8?B?WU1acW9LOFFDYWpmVm80bTJreW11cjMrYXBvU2FENkVBQmIrTzBSODB2NGpk?=
 =?utf-8?B?QWIwVnJFcW5qbkRMRTVjUldZbFVYRks1VGFyT0JwbERVTkdsbXRkR3NydUM0?=
 =?utf-8?B?STF0SEdiY3JxU2pWRHVNQjBqQjZhc3ZkaFFOQlVVOTNtRW1DMTBLWFFWaktF?=
 =?utf-8?B?cEZ5d1AwQlVnbzVGNG9vM2ZPUytCb2ZTYnBCZVFwbVUrOHJKcGF5Q0ptWG1a?=
 =?utf-8?B?YkZPQTNhajhGU1VlaDh5Z282WGMweGpGamJ1bGZBcFlqM25IaC9Ya0Q1YlRQ?=
 =?utf-8?B?cnA1UzZJeHdkaEE5clBiY2FkKzFuZmNNM2hESWNuNkU0dFBMNGxYODdyQ3hU?=
 =?utf-8?B?d3lVTjdYVXRhN3pia05Gd1Yxbi9IYVdLRzYvTStBTlh1V1NyUlVBVURTNEtZ?=
 =?utf-8?B?YVVjZDFNSlpQYllpM09TR0lXNzBPMklnZWJKMVJBQ3I2NzB6aFRFcnFxcVU4?=
 =?utf-8?B?akNoNGw3TFJDYXlCT29QVU5qN1VjSzQzM2RKMEMyb1BsWXJPdDFnUjRTM0FO?=
 =?utf-8?B?YXpSU1dpRjl2TXBod1RqL1NTSnVTL3RLeFhUNHVlSmtqd3psakZXa2F5dU14?=
 =?utf-8?B?VnVNclRhdTBRUlNVZnpiRUhnbk13TEFQOUxRdmJES0cvU1dndEhwamdmbGdn?=
 =?utf-8?B?R2xyMW5MODRQclBNNTRGLzY1TFdMYTg1enRGT0NRdnU4ZmpZeUd6ekNkTVlI?=
 =?utf-8?B?dlJ5T1Y4ZGE5cTd2c0x6anpUNlBqNjdZMW1aeGhuUm1mZnozLysxZ3VpUXlF?=
 =?utf-8?B?YmNLZVVHRGZXTlJLeDdsMU1EWGlNVldKMFg2eldOSXNWS2E3VlFRK0Zha3hh?=
 =?utf-8?B?MUZZTHNaS1k3R0UrNWplTkRFWHpmd05aSCtRTnZReVB0bVlmNmVmQzNveFdO?=
 =?utf-8?B?bDVJMkRpY01zcWZ4NzFCKzFtTUdEWmorbFdPek02VVFXeSsvMUNCbW1OWUxy?=
 =?utf-8?B?WWtUSDZmRU85S3BWY3ZKYkh6Zm1nUGUrZytIWVVySmVvckZza3YrbzVxRUlv?=
 =?utf-8?B?eEF6WXZualh3SkVmY2sxQWJLTjgxTFZLVWJTeTYrOHMwSURxNG9ZRzZmL3BV?=
 =?utf-8?B?MTZGRGt6VStBVjNtc3pTRmQ5eDBJVWgrOXlhbVlub2ErQytUb3R6M2tZTk0x?=
 =?utf-8?B?Y3diRXVDVElNQ3l1TnZxbGhBUUdkM2p2ak0yU1h5L0VjWXEreVBEMllhOVBT?=
 =?utf-8?B?dkdWWm0yYXNDemdsK3Z4cldHdWxhREp5MWRlNEtVYzZHdGI1cVpCYlZxa3Zx?=
 =?utf-8?B?YmV3ejl5WWVEQ2pYRCt2RzF5QW5yUGxkdmdMOG9EYzVnUWk5WjllUGt4L2Vy?=
 =?utf-8?B?ODBRR3dGOElXZ1VkV3lZRnd2ZUlwakl5SGw5UUFvZnNNakVWRjRrRFE3RURn?=
 =?utf-8?B?T3J4SmF5VlJxUlhFTDhVR2FIYlRGWi9ocllFVDdkWEhBcHJTQjlrTms2K0tv?=
 =?utf-8?B?WDVHWFZ4b0lpbVRIdzU4VW5FVUZWdm9UMGdIdVpSaE1sOUxqWUQvNk9GRkZN?=
 =?utf-8?B?NW9pTzRhN2VRUnBoSTMzcFlVc1lzaE5jNEpoeG1KclZDSmQ3bmY2dS9QY3dj?=
 =?utf-8?B?ZE44V1lCbFBRNjRTSHNyd3A5cTVQcnFqUi9HaS82bXNLd050WXQ2Nk12WTNC?=
 =?utf-8?B?MmNxQnhOUzIxSWRWSnFUM3B2Y242WEVzekVUTmVsamlWdUZtT1B6WThiWTNl?=
 =?utf-8?B?L2dlWDhpeDNaZkxZNUM4V2xKTitRcjNwbnVCMU5wcmpmRUM1VURXL25yZlQx?=
 =?utf-8?B?NDU1NU50dzZjTVN0RmwzdVBGc3hXa05BZ3RINW9UaXJVV1NNV0YzYWhkVHBZ?=
 =?utf-8?B?WjdTSkFiVk9GMzAxT21kd0dZc2xERnRTdDE3NUJLUG1KRHhOOTZqRG4rL2Nw?=
 =?utf-8?Q?WLs4NxrKAAY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVMyR0diZ3V6V1hjVkY0WU9rcmdqcnZ2RGlHL1cxellPNENlWkpwZnBrODNB?=
 =?utf-8?B?b1hOSC90VUwzVThJMFdLQU1TcXlvbXpZNEJoSllwdFZUcXBoNFpHUnhvUmM3?=
 =?utf-8?B?NE1UdUlXSWsxT1Y5eDZVUklMdWF0ZDZqWG5uWEpKMnhJUEI4cVZlbXVrWGg2?=
 =?utf-8?B?NkNLcHFhdmpvdURsb1RwN0I1M2h3QTU4Wkd5N09JZysyNzBxWWM2L0JiK01x?=
 =?utf-8?B?YWdBdnU1YjJDSytxOVlmc1RQVkZqRnVQb3UvRjhrUmJac0x2ZUN1Q2tWZmE2?=
 =?utf-8?B?bEdFbGVvRnRlL1FqcmlBRCs0ZmxmVXV6RHRidVJrWFBsYWdyQkRZbDFhSE1u?=
 =?utf-8?B?OHV3WWhlRm1rL01vc3cvYnljaSs3VUt4ZnZ3SjRPZGpaV3h3UHNkZjlsU2ln?=
 =?utf-8?B?ZXhkMTEyUlRRREpiWFc5eW5jTENwM1dqb0srZTdjMi93YzNZVWdHWktWbzZu?=
 =?utf-8?B?STRkNTBUYWdseDFRN2xUY3VZYkk4cFl6cFFtOTZvT0lQQUFlM3ovdzNYdGh3?=
 =?utf-8?B?OGdxM0lEU2ZEYXNWMmlWTkVGMm1yV2FlVW8zcnVKTXRmTjIvZmkzQjRjUkxI?=
 =?utf-8?B?UmhmZDNRWmQ0TGY0Z0pneXI5TUJrUi9JZjRMT0ROVGRWbHFBUjhjV0RkM24x?=
 =?utf-8?B?bzhCeUtPcHpHMTNKQkV6SXZXOVp3aFFCYXdPK05SbHp2VkVRY2FKN254UXpr?=
 =?utf-8?B?L1BDVjNMU2kvdVQvWEJyYW1LTlc1Y21mMFFnZTVRRCtSTFFseDc3SlBkdE5u?=
 =?utf-8?B?RW01WndabW5uZFdTT0xud1JTcWg1eGxmc2xDMjVqUUVYbmhPa0ZKdnd3VlQ5?=
 =?utf-8?B?NG5NZSt5bXJHSFpDcWV1Y1pSWS9LUVc3MVZzb1Y3cm1wMmsvR3FzOUx1RnlV?=
 =?utf-8?B?THpUOXBhZFFYVExFbjJHTjlvbjMzU2pab2U0cUM0aXZDTmF6R2NnSkp6MTZX?=
 =?utf-8?B?QTlQSnVoTlVQUlRWZVFZRmhuaEhCK2xaRjVNZWNiYmVHLzJ3SXI3bWVBODFa?=
 =?utf-8?B?eGdrdU82RkczbktkMUU0UGxlQXhpaFdHOGRFTzNyUmxnV0E0QXV2YXF5YTBM?=
 =?utf-8?B?SmFYaWszQmtzU1VMUE1sK3FwK25LcW9nYkFLRXB1MHFEelYrTm5aNVVjcjR6?=
 =?utf-8?B?UU0rb2I3bndKR3ZCN3ZUOWdJVm0zYzZLT2M0MVBON1VONmFRUXNMOW9vOXhZ?=
 =?utf-8?B?UlJtSXV3N0NQMWNuMytpbTNQVC8rS3B4Z3hmOEVvcnVOL3JmZ25pYy9QOUxM?=
 =?utf-8?B?dmhNQnhKaHNodmJQalRGcFJ1Z1A3ZXBuaTNIMW5LdGVHMitXelJnRDlqeHBN?=
 =?utf-8?B?QzUxdERpT2RwclUreDNPdTgvOTBQT1N6QzRpa2htMmFsQi9scTd2d3huR2Np?=
 =?utf-8?B?ZmUvNG9VdE94VXVlR09td0NxTjUyQjFIbGZWMmY0VTRpTDk0S0ZVM0RLeFJ4?=
 =?utf-8?B?bi8rYnI1R3BrbFJhMkx6bzJEaGRMQnY2RFlSbkI5b25wNU0wWkVlUm5Wb2Zz?=
 =?utf-8?B?NVJPVXlxNW5nK3EyS2FzZC9tdjkvNmZzdnVrRnpENFAvUmtoSDVsSnBkK2VV?=
 =?utf-8?B?SWM2VXJGTFl2OE5TQlgyYjR5N3pET2VHdmRmYy9rOTREbnpEUUoxL3d0STl1?=
 =?utf-8?B?NU1GanR6RWx5MkRrZXcreVhjM0tmSG4xZVdTYWJnaEc2a29jOXRIYUdFcUhs?=
 =?utf-8?B?NzRMMmxxMEs3WWFCemMxL0FRTkVyeU5VQmQwaEw1bHVjcG5CcDYrMEVGMU4v?=
 =?utf-8?B?U0wyOWpaQzlqWU8wd0pxMzh3Q01vSmhaOXFwdVp2RjZuRy83NXcxSk9ERFBa?=
 =?utf-8?B?cEtWNFJZVUlEVGk4VlgrTWh1YlBRY3RWYnp6ay85SnVTNkQvNTdIV0lFTVdT?=
 =?utf-8?B?VTJsdnQxOFh1S2FCc3ZmUUVuOENlL3kvbkFzRCsyU3JZcklhUmtYRnpTdEpY?=
 =?utf-8?B?SVp4bHNTNFplRmh3eUdjM2JjZytPL0c0RHhrckFKYUFmWTBBQXRCcldtaS80?=
 =?utf-8?B?dlFOM1pSeERFNWZhbUprbjZUamVFNi9JTU5EbDNoVnAwdFlMMzl6R0IwSnkz?=
 =?utf-8?B?VEg1bGtKNWVwb1hZNy9TZHpEMjRhRVJlNFBWcUYwVmV3UGdCNnJ4NXhwYVN3?=
 =?utf-8?B?L0FrS3AyaVJMazUzYVBXaTZqcFdCc1lsVlFNVmtndVhBNXhUd1Bqb2o0VXpt?=
 =?utf-8?Q?A/9cGwHzN1lVKXj11yPHxMXp7+KO8z9vYY8wmsrhtGIm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e83b6df-238c-4b71-7a06-08dde6ee89d2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 11:23:54.7069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/dh5bZihoHAE8MEeQcRmGaRPSlCHkEWO0oHwFWrhBtCwR/9a2OT5pwapWcaC/G5RHcQz0Hw/IYkZFFO8+SvBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9331
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

On Fri Aug 29, 2025 at 7:39 AM JST, Danilo Krummrich wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> index 8726d80d6ba4..20d3e6d0d796 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -1,5 +1,6 @@
>  config NOVA_CORE
>  	tristate "Nova Core GPU driver"
> +	depends on 64BIT
>  	depends on PCI
>  	depends on RUST
>  	depends on RUST_FW_LOADER_ABSTRACTIONS

Another thing we probably want to depend on: a little-endian
architecture. There is an assumption in the code that the CPU will use
this endianness, and while it can be changed to be more portable, this
would require stuff like proc-macros to properly build a struct from a
data stream with endianness in mind, which we don't have yet.

Most (all?) the platforms on which NVIDIA GPUs are to run are
little-endian anyway, so I am not even sure big-endian support would be
useful.
