Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E663ABEC44
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F94810E692;
	Wed, 21 May 2025 06:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z08KUSqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A5F10E692;
 Wed, 21 May 2025 06:46:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjc7P6iOP0o4X/9pASDpaDxTYucphZ7V1XlRGy4NGc7fa2tAXAmT0tmXUjEKmfjUTs0/dt1EQFxiXQiM2TLR1zO7AF1j/o7p7ZyhJN1w+8AIGq4r3ZktWTT1FmSl7JrO91br1qRwqKCXv7HtXOZHEGVDdxuzN1OgdELkfAlv2oI6+PQjwiDMz0CH+H+X+cXA6zIal9kXD7Gs8AdAH1f/9Ol/1MjCHVmQMdsZZM1dsgH3iRhX65mfT7jYRpIrm6xXqyXO3fHbTbdyEQbSBjHQRe2G70NZTqplk6Ew8ab0eh7JYk8SGgluJu2P/HJE9YD1JICG2okihLD7bJrwsITcWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MF31ibu0OjJJ9CqRME6tTsA29agZDVJNxMMN4e2fGFk=;
 b=T2gr7KB06FShsZTRHjs46o0qYl0aVmOSX7NPWUia4vU/2FvF/TuEueL6oXVsx8XGBKAeSubIkv9j73KQMfDSo/M2lGXXRq+A6XtM+/vKptMV6pzTlcpbmlbjS2S2YvTWa/7CdqCVvdACf5zlVNJLYEwj+qz48Au4VL54443vB+NXE5RT4315stCJ4OcJZNIJ2Nr0O6Ugj9TjlXoLVCbLg0phgHfaukG/Y+v6BvCGOW67BWGvISnVnOi9XMNwH0dwDCy+IbpL+o+4y0Onv2z0xpseG4FblxXu+6QRVpVLFMRLdYX5Ip8uRO+MoIx9SncK3TS0WLoWAQEvrcIP5t8SfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MF31ibu0OjJJ9CqRME6tTsA29agZDVJNxMMN4e2fGFk=;
 b=Z08KUSqcR24fSinL3u+AJbgW2czU/qArur5Gdk8rUecMhfFFjgwPu3FGxGmQzoi/NdlKg3SpIO6cN1g+hiMpdTHvwH4pmTgeB3VzYrHZ4J7W5OG9srRmItcAHPLZS3I8h+G4cURq1fA7xLpgFVGZCVfG6UXt8FIP8yKv/gbdnHx/uLwlUbNGAdeck0NmJ82Mzp2nWStInSg4VtWjUOvv/cUReCA7gKGikYnmBwuNf1Uc3G2KKqJi9eMLA+Ko1xLR6dYe45+9Mh0AMOF4vynlNDY/P9Ogz0DhGVNwqb0mNWYUBXITCsRyPSpEYtPMJCyC96mRdnvWaBEg+2S37NhsAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 06:46:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:46:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:15 +0900
Subject: [PATCH v4 20/20] gpu: nova-core: load and run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-20-05dfd4f39479@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: acd52724-16fa-4e8d-311d-08dd98333003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0loUzVvaUgwUktYYkF6Uy9HVDY4S1JZemY0RFMzdDN0cUtFcG5BU0plNU5V?=
 =?utf-8?B?S3VUNytvdTNqRWpzc0lHa0VhNE9tbVRsT1VITFRnNktqVUdabGpscDJNY2Jr?=
 =?utf-8?B?dkZnUCs1R3dNREJrSEdlYXlOanhwQ0pEVTlsazRXWWJpUEhmUnA3bm5oS1du?=
 =?utf-8?B?V3FSZytSL1d6WE1uUWJPaGR1ZnRlRDJtUHRZa2pWTWswcUdGc0lvZmJ0YSs4?=
 =?utf-8?B?OGhYSkYxMHpPY0FqbDc0Ri9ORytUSkVPUTFiNzY5ellxZFNKRTVZRzE4Tndv?=
 =?utf-8?B?bnlPbUllWnlmcXpJQzhiY2ZTWjFJckZlTjR0dWVhZFhNUnJkMFF3cU1vbFNi?=
 =?utf-8?B?Ym1KYjRRUDhpbHQwaStpN3dvYi9EQTZFNG54ZVNibTRMZVRaNjgrUk5KeVhF?=
 =?utf-8?B?Tno3SXZDOHlhUkZFTmcyN2IzOGRXYm4ydVhTaG9kWUVRWGZ0RWRxVjB5U08x?=
 =?utf-8?B?ZksvNFVxZXZEc3FlNmp5S0lXREhKSTRYSFNETUllbjJxQmZyYWJYeHVXR2VN?=
 =?utf-8?B?NXZVWW9PWGVDbGoxSjdRN0ZrSG53Sk1sVFMvY0JBaE1mM0ZTc0V5VnZqSEFT?=
 =?utf-8?B?TmpJMkF4clVRQ29TMTA0Q1pCOTlpY29FZEdabFQveS9tUjluTmhaOW9MWUkw?=
 =?utf-8?B?MjlRZTh0M0VkdE1mZ2NieFhCdnJ4bW5BaDJHU3ZMLy9TVDZTb3dMaGFWb2tH?=
 =?utf-8?B?NitKQndwRXhScWVlYzdRWjJDTlRqMDluK2ZNam9nWUIvaGY4c3VIckROQmxn?=
 =?utf-8?B?RXIveG9BQ1RuSEhuV052RU53RWFYcXVQaUsyWE5ZaHpTOFVSaDRjU0tFK2xw?=
 =?utf-8?B?eGxOWkhzTDdGYktWcUZ3QjJTNHZuQm9qeklSR29jYzl0MU9HbGloRzg3SVA3?=
 =?utf-8?B?ZDNEdEJZTk9zQzhBaU04UTRNYnRxWmx6Ri96Mng2Vk5leUx3VXh6V0wxZU5W?=
 =?utf-8?B?cysvN0lCaVg2bGsrS0oxV2dCd0hrWU5SdkY2ZWtnVGVkbWFMc1dHMXFQcDJt?=
 =?utf-8?B?TnFGb1Z5YUxTSml3blkvOElFaUFWWExVZU8wZU1GWEYxVklqRW9ydnhIQlU4?=
 =?utf-8?B?NnY5V0dVUjlnL0NYOWNtankxcm43dW4ra2JuT3BIMGM4MmtDUVdHZkJnc0V1?=
 =?utf-8?B?dTM4OHhsY040bnRNamhUU0xoUDNSSWp1bUJnZEZxNFVWdmhMQTdyek5QWElh?=
 =?utf-8?B?aFVWVUFjQzY3MVQrcWI3TUJBRW4va3duR2tEMmxJb01IK2t2UHQxbEp1NFY5?=
 =?utf-8?B?UDM5OG03U203c1BNL0tPdkpmbHVUd1hoWTNmTjd1WDdxaVE5UHQ0WmhmQUk4?=
 =?utf-8?B?eXhKdUZ2SHc0VDh1NGhJMFh5b2NON2NtM29xMEw0aGlHWjEyMFV6MTJ5d0Rx?=
 =?utf-8?B?T2gxT0l2RitTT204WnN1d0F5SGxFZWt0VUVmaFB1MnNNUXlCUGo0U0duR2Yr?=
 =?utf-8?B?L3FRblkxVDI0Q0gwYWNpZVAzVjlicWpUa0JyMzJDa0dTN0hnaDZ5d01CNTBO?=
 =?utf-8?B?aFltakVIbytPZFVxeVd4cE11U2ZoOWF2M2tOeit3ZnhjdGR5bmI5a3V3WUdH?=
 =?utf-8?B?T3lZWFJBQUUvYVFRamJsTEhYZjhsbjlady93djRLNDJ6WFVuUWltcDRIdmR2?=
 =?utf-8?B?cHUvN3c5aEFlTXJZZmc5WXFnZU01OWljamhvMnFocXdUV3c1M1E5SjlCdko2?=
 =?utf-8?B?NXFtTStDOGJlSSt5V3pPcGtGWkszZ3FpaEhRcEVQQVk1ZFBrUmVLMFV4cENR?=
 =?utf-8?B?eExUeS8xNFpLS1VKSyszUUNtaWx2UzY0cFd0ZmVvMlNxWGgxWnhBeXZFYUsz?=
 =?utf-8?B?SWx0Q1lWL21FcG9kZDRVTmhYZ09TR1g3WGRIdURlbWlVcUtVUnJob3BTSW1a?=
 =?utf-8?B?YkQ3R2hEdEg2U1VaNHFyVjNES3Zwc2ltblRGQ1BJWndtTDJWRHJoNXF0N1VM?=
 =?utf-8?B?NGk1aytOc3Rrd1Axb0lvSytySFd0dW5VaytsaWNITnNvUHRQZkdtd2VCajA5?=
 =?utf-8?B?TnVIb3dqdlB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEEyellnZ2thUW5YNmZpODkvWCtYYjBrYVd0OUtCdndoQWR6MTl6SzhRWllw?=
 =?utf-8?B?SnNmVzZyQm5WcWNoZytsSEhxc0pvWHcyb1VRU3FkNHU4Zi9Xd3YwbW5IcGxI?=
 =?utf-8?B?WFo4aVZ1d2YyQVlVLzdEVlpZNWJHQXJmQ3FJMHlxR2tiS3NCbnJHQlRqSFg3?=
 =?utf-8?B?bGUxZVVCdS91d0ZYVGZmbHJWVmt3eVRzNXg3RG9OWnk1eWlKayswcDZLNSs1?=
 =?utf-8?B?dU5YSndiVktqdjJpSmgrSndXalNMWkVaREpSNm5BZkh1QUVPOUQwK2g1MWtk?=
 =?utf-8?B?ZGxpdWVVdE5yNHAzdDlJKzF3eVE0ZTFCcnAwQVFISXROenNrQ3BSK2syNmZ1?=
 =?utf-8?B?UHplNE9BZWJGM1NuTFB5V240NTg5U3d6Njg4VjRvbVl1UGFudWV2RlJCVG4z?=
 =?utf-8?B?UmJieUlhN0Y4OC9Kdmlod1F1TVQvUjkwZTg0MnRxa0lTUVNmdWtTUFJ2L09k?=
 =?utf-8?B?OWdkalhmWXRPN2VHYXBDay9YcGV1WVpMMHJRSnhxT3FGYW1ySGsxeHRRM01S?=
 =?utf-8?B?Qk1jQ2RWRVMvNmVhaWF3Q1dpLzZTUFlQMTJwZGI4cW4xalJEaDFXa0VsWW4x?=
 =?utf-8?B?ZlpXQUhhb0RDMHFIVXc5VllUS2Q5TVJBcWVHRWVyZHdjUnBXWXVpNG1DOFc3?=
 =?utf-8?B?bVdsV09WR1hrblpHcFNFSDJNMUhIU2JXL01Lc0JKOVZyNDNmY2RaZU5kSm9x?=
 =?utf-8?B?SGpieWdSNSt5dnhYL3pHNEVzMTJmYU5lNDE1cFJTU2pIWUMxWDByUlFnakVZ?=
 =?utf-8?B?MFM1K09KcnJweUxUYmN0MHExK08wdUlqNDJORGQrSW1GL2txa1NVMllrU1M2?=
 =?utf-8?B?bnJnU3JJWkFkam1TQWdaTVIxUnE0RjVyUlRrYkJ3TkJGdHkybXo3V2ZmNUs2?=
 =?utf-8?B?bTJacWpsWGRYUUlqQVJJaDZaTzBLU3k1WWZWMjA3dCtKTjA2dWYwK1NwYUkx?=
 =?utf-8?B?bXpFbGJTMW96VzA4bDZJcmZxZkpqRkxHZVRpemI5UGllQml5NElLUmFORzBa?=
 =?utf-8?B?RDhHdzNyRGNEaWF5UEc0QmlPRlpTQlVVQjZKUVpLYldOZmozOHprU2l0blRW?=
 =?utf-8?B?YXdtbjZxY05UbjhURGpuL1lRN3ZuYXdkWFlJK3ZwUXVYME10OWpBcUdhTVNV?=
 =?utf-8?B?eVZHZndLSTJ3WkliWGFLYW1MeHMzQk1WeTU1TFU3RnFiSW03a0Z2V0NWREdw?=
 =?utf-8?B?WTlsWUNSbG9KbFljQ2wyTG91dXpOYUpoK3prM2MyZmFVRTZ0Y1E1aXc4TjNa?=
 =?utf-8?B?eU41NlBzalFFWUdQR0NjNXJXbVVlV1JJa2szOWtTS3ZzT3p0bE53TzRKdlZO?=
 =?utf-8?B?MHR2cFNjMzYwK2pJcGlzR1dpVWdhdGlXbUVvKzJpeitVSFpTVFZGL1VjSnNQ?=
 =?utf-8?B?clVSMm5NUXU2TFlqTlBPSlNzTi9jSmV2NEZ2ZmUzL253akY5SUdtMnNJa0dw?=
 =?utf-8?B?cjI1alJXWGE2dWszYnV4ZXQ5Y1RhUGpDaG1pSURYQlJqWWdZUng4TWtDSi8v?=
 =?utf-8?B?NWYvTjR3MUY2K21MSTNhb2RXdFdYL3FiOGc4RkdOdFB5WkhiNTZUN2dxNldv?=
 =?utf-8?B?Y25oR2NUaVpTZ3lXWThrcEtLR3plY1BmKzRRQU5WUlRidjJvYTN5ektZSUc3?=
 =?utf-8?B?U2lHOTBmUkZiY3p6WUtZWTl4K25qSFNjN1UvUVQ2WnVpY3RuZVBiNFo1OFRl?=
 =?utf-8?B?YVRUR3gyM0wrM1ZPZ3c4MzBIY2w2aDVIeGJYMUNzREczY00vRjJoTTFOMHRv?=
 =?utf-8?B?YjRHRStiamlPVFRYMXVEejZ1M3dtMDhoT08zQSsxVEJWa2htQ3JJbmRwWVBL?=
 =?utf-8?B?QnQrMEs1L3FtVHBwS28xRDBRWUE1RDM5d1dqTFNxMW5VQ1JNSk92M1FaSGpY?=
 =?utf-8?B?RkdJTWoyZ3BOVjFnNUNtcFVWc2RQaVVIZlRHVGxzTG5tWDZBWXJFNlFQeHlR?=
 =?utf-8?B?dmFjUEk3OGE0TWVOVHFTS1JydE45cThoWGNtNDg5WUNtNXlkWFY1VkQvS1Z1?=
 =?utf-8?B?UW9oS2NyN1pXNEJQMS95WEQ2NHJxQy9SZjQ3SVVsaDZWUHgzY1hKVG96dFln?=
 =?utf-8?B?L2lsbWdKbGwyWlU3NXBoZTUvd3FtdEFMVW0yRGU1SDM3c2x1dENvMk9YR0xF?=
 =?utf-8?B?Q25uamk2bGZPMmNTWTB0ejc4WEwrZHhnT2xwbncwS1JRYXJ1R25kNm42ZFhG?=
 =?utf-8?Q?hdzjiU45YvOwROk9SnICcGbf2EwvIvJ/Aam9qHtTU1Ak?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd52724-16fa-4e8d-311d-08dd98333003
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:46:17.3880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zsfD9aX7t7VK58Qo6/gHZUSMC0yYqKSdSddSHxKbjFKkO+B2Twid+ghBsNA16wQNToRB/0f4uGJ7N1OWzZmZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805
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

With all the required pieces in place, load FWSEC-FRTS onto the GSP
falcon, run it, and check that it successfully carved out the WPR2
region out of framebuffer memory.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs |  3 ---
 drivers/gpu/nova-core/gpu.rs    | 57 ++++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs   | 15 +++++++++++
 3 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index f224ca881b72954d17fee87278ecc7a0ffac5322..91f0451a04e7b4d0631fbcf9b1e76e59d5dfb7e8 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -2,9 +2,6 @@
 
 //! Falcon microprocessor base support
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use core::ops::Deref;
 use core::time::Duration;
 use hal::FalconHal;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5a4c23a7a6c22abc1f6e72a307fa3336d731a396..280929203189fba6ad8e37709927597bb9c7d545 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -246,7 +246,7 @@ pub(crate) fn new(
 
         let bios = Vbios::new(pdev, bar)?;
 
-        let _fwsec_frts = FwsecFirmware::new(
+        let fwsec_frts = FwsecFirmware::new(
             &gsp_falcon,
             pdev.as_ref(),
             bar,
@@ -257,6 +257,61 @@ pub(crate) fn new(
             },
         )?;
 
+        // Check that the WPR2 region does not already exists - if it does, the GPU needs to be
+        // reset.
+        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region already exists - GPU needs to be reset to proceed\n"
+            );
+            return Err(EBUSY);
+        }
+
+        // Reset falcon, load FWSEC-FRTS, and run it.
+        gsp_falcon.reset(bar)?;
+        gsp_falcon.dma_load(bar, &fwsec_frts)?;
+        let (mbox0, _) = gsp_falcon.boot(bar, Some(0), None)?;
+        if mbox0 != 0 {
+            dev_err!(pdev.as_ref(), "FWSEC firmware returned error {}\n", mbox0);
+            return Err(EINVAL);
+        }
+
+        // SCRATCH_E contains FWSEC-FRTS' error code, if any.
+        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E::read(bar).frts_err_code();
+        if frts_status != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "FWSEC-FRTS returned with error code {:#x}",
+                frts_status
+            );
+            return Err(EINVAL);
+        }
+
+        // Check the WPR2 has been created as we requested.
+        let (wpr2_lo, wpr2_hi) = (
+            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lo_val() as u64) << 12,
+            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() as u64) << 12,
+        );
+        if wpr2_hi == 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region not created after running FWSEC-FRTS\n"
+            );
+
+            return Err(ENOTTY);
+        } else if wpr2_lo != fb_layout.frts.start {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region created at unexpected address {:#x} ; expected {:#x}\n",
+                wpr2_lo,
+                fb_layout.frts.start,
+            );
+            return Err(EINVAL);
+        }
+
+        dev_dbg!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
+        dev_dbg!(pdev.as_ref(), "GPU instance built\n");
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 54d4d37d6bf2c31947b965258d2733009c293a18..2a2d5610e552780957bcf00e0da1ec4cd3ac85d2 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -42,6 +42,13 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     }
 }
 
+/* PBUS */
+
+// TODO: this is an array of registers.
+register!(NV_PBUS_SW_SCRATCH_0E@0x00001438  {
+    31:16   frts_err_code as u16;
+});
+
 /* PFB */
 
 register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
@@ -73,6 +80,14 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 }
 
+register!(NV_PFB_PRI_MMU_WPR2_ADDR_LO@0x001fa824  {
+    31:4    lo_val as u32;
+});
+
+register!(NV_PFB_PRI_MMU_WPR2_ADDR_HI@0x001fa828  {
+    31:4    hi_val as u32;
+});
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {

-- 
2.49.0

