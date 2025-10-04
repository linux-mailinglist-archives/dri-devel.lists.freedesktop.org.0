Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD9BB87EA
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 03:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128D110E123;
	Sat,  4 Oct 2025 01:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dGxILTkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010043.outbound.protection.outlook.com [52.101.56.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5574F10E123
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 01:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gM0Xy614sWFhRKWFZN1xX7aNPoWHph78YfDeYV8PeciVNlx0TkksjZjIEGyP0eohyx629EHmkiKfBDcdqwvjAKEBHIj6tESZ3E7RwrQdc1EMoJr4nonzGo8Dj+9yjzJTUdzcbX4zNVGrfE/rHm5/5EsEpwtPIpdE+CKVZdEDgh3mqqTcmCfiTsZru+s31OGkydpHspsRgETIqgxEKJ0O+P0Bobbk6zo5JKWNsGgcwQYJ0pqupmKKMyivwQZr59BKaPrjTAlbFD4e7jeJvl4Xby/EpObQXMcZN8JYW219FYUcmBin0HakeWZ4+BRMeunPdBYralNJoDdlz7iNwPgZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxHsgf/6dZM6vCE29rr5u/9qvQ4N1JjJE14EDNAnfic=;
 b=eO3Yu34MCByrot5JVxAmhVOTWJ6+xyWvPX3aD2+PyqXLRYneeyUmSpGD/8hju4b19bck/+XoafxiNpkP5g9o8F1Q7apw+jR7Jy/saE+jDVW7F/xuMyK4HDymIRFgTFUMWPIJi8gvGEgyWiKHmtwa1U7HcwsoNsCyGGQRDVc0WIuXtTcKG6GB4l0aKAzNQ8g8Tv+wB9KnhzQHwZ6fbs/qyJpI2HextjNqYKsAlALpj2vkwSevq7aNmq7iURVATCMtehTgzw4DwZzeSlWF0MwiTV0L59rYixyTCciRFuLFyKIHMD0bqqkju0xgDlsz0GuV0vbHE7pdQ5/llz3PC80Plg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxHsgf/6dZM6vCE29rr5u/9qvQ4N1JjJE14EDNAnfic=;
 b=dGxILTkFb7+68GASBsjxbY2slyaP8CzAcKomg/TMHuyJsIfXLLEm4z514xbZkO4BxVWiSxvJYIPgt6TlrSEgaiRq0Y9o5+78PE7i+A/JjFrxSHamDq/nHu7kgP4XJvBaFxkdzkT7BV6axdGqVtBa6xDOzNJXIiWbo5ikDSW2dg8EaQhMPxBAC+Wj68WP0mLxZQ9wWYi6NSAqPrhHgVgW5AmPtd65j409dThFjFxb5CHqZO+qrHxkqmPMYpMsgTPtsthGQXjz/u/kjeGH+ESfpc9zpoqzwYddEVa5QO2KPsyUooFu0ON3B28KvyPJqrUsmVLFcvstNibeZB6tQOVi3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by PH7PR12MB8053.namprd12.prod.outlook.com (2603:10b6:510:279::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sat, 4 Oct
 2025 01:53:59 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9160.017; Sat, 4 Oct 2025
 01:53:58 +0000
Message-ID: <bd004ac5-9e51-4e90-a3a4-025d74941a38@nvidia.com>
Date: Fri, 3 Oct 2025 18:53:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm for 6.18-rc1
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
 <CANiq72kq5YHovH=_a9c0JQgfrAx9gRsQvVo1VfHd-FaupOp7rQ@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72kq5YHovH=_a9c0JQgfrAx9gRsQvVo1VfHd-FaupOp7rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:a03:114::23) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|PH7PR12MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b99a29-143f-441d-5633-08de02e8e26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUhiZlk3dC9TWU1pTU1nMUxqbEtIRDhHMUp6UTJjbHlxWk9JSXgwbzlwY2xD?=
 =?utf-8?B?VFNteStPM0o2dU9PS3NaengyQmhGa1pVMVAyTWFTMGY0Q0toSFBCeUtTbWNO?=
 =?utf-8?B?WjBNc21TdjhUUHFJSjR0U1pLWU5kdXBFL1lGRGtmS0swS3A4a0o4ZjlXaDdk?=
 =?utf-8?B?Z0NXbEhKd2NGM21vNkJ0S3BXeHJYMEJxMGpwNkVRdElZWEtwT1dpMC9ERU03?=
 =?utf-8?B?RndyQVlSaFk2RVhoYVBaOU1qTWZrOEt0MUlmZExtbSt4NkgwamZjdkVZZndx?=
 =?utf-8?B?TE1EY0Y5SWJFNFlhS2ZZbzA4bTl0cGs2dm9RU29YRVcrckl1WlVsSW4rWkNk?=
 =?utf-8?B?bWVoN0NuNnVsSFJ5OURLMGtLMWhGTmVUc1RpV1NiTmo2TTN3VnRFS2REMDBC?=
 =?utf-8?B?ZWJXZFhGanV2U3MxUkpBUklTaFRZTFJDbWgvd3VRdDFveHgxZWt3WlROUkl5?=
 =?utf-8?B?VVdLUzVvTXVCcEdMTWhvaTJCZTdrUjU3ZzV2cVVDV20xczNuaTNrdWdBOFoz?=
 =?utf-8?B?djB1WjlYaXpveHpGQ1JucHpNcWRvNnZJOG1ZUUd0UzBnV213L041dFJlUkFB?=
 =?utf-8?B?OUtGZkYxQUlsOW5Rc3hoSU1sNVRDazRpc3gzbmc1ZjdQcW1vaU9LQ1BWOEE5?=
 =?utf-8?B?QWZnRW9wWGpqdjgxNk5yTjN1M2QyamVBdGlGWHQ3QWN3Z0dOaWZWc0pTVFhw?=
 =?utf-8?B?OGg2ckhyQ0VtNEczQTVkUFZRU0FnS21rOE04eTEzbmRiUzRRc0xkZDdZQ2pW?=
 =?utf-8?B?WERwbTFPVFlJYXpwazFMQ1ExL2o3NlhleVFkdG5zajlZV043YnphWHc5THpD?=
 =?utf-8?B?RE9VOGRXN2NnOHIyc1JmNnRiRlN3bDJET0c0OG1mb0FRSU9HZDVDY240U1g0?=
 =?utf-8?B?UFp5bVNvT0JJOFhEZmJQSjVKdFdYMG5IUFlsYnp5b3ZzTHhEY1hJZW5MNnpq?=
 =?utf-8?B?TUFkMlZXdFZsSVlObHNaYzE1YTdZUFRoZStHZklDUEJIaEsrRTJpUlI1M3ZS?=
 =?utf-8?B?V3oyNHhiOG5RMGpGTEtjc0pLTk9MN0JEdzJsbVYzV3lWR1gybnYxVGFuL2RZ?=
 =?utf-8?B?VlhHYVFPcHYwV3V1NlV3bUEwQVJ5Z0lJU1NNT0tDNkVveXd3UEtMblF3amN2?=
 =?utf-8?B?c28yQUpQTkJUWG5zK3JsdG9XTU9qa0t2bEV6ZTRJZVpPdkRTZXgyNURKMFk4?=
 =?utf-8?B?ZUFLVy9WVVFHcWt3YUtrQ0U4SC9oSEQySVFKL0pZbGJkcnp3MmZPalk4MUsx?=
 =?utf-8?B?SHNiZzQ1bnQrSFRPYmh2b2UvYTBydVMrNEZ6anZOWVp6UlJ1T1BLNDZ2S2lZ?=
 =?utf-8?B?YVRiZ2t1Q2VVYmZQSTd4UkRZM2kwRDVSd0RUVVJGZi9SSEVtZ0NsK3NFWmhx?=
 =?utf-8?B?UU1HOFVSM0IzSzVObTlja0Q4cTJobWxoR3BlMUJsNTZ6UmJhSXNYdzRIL3ZE?=
 =?utf-8?B?eERXZm1EeDl3WCtVblV3NUJiUVI0RnBvNVl5aWpYeHROQStMNHRMS2ZxS1Zm?=
 =?utf-8?B?cFUrRnF5RXh5eVB4N3Yxa0VJYW1uejlBdVJFOU5BRVFWdW5uUEdYT08velJa?=
 =?utf-8?B?am9JZEdrTG1KTWVBNHJkU3cxcWRyQUowSTdEOHVZWm03Q2pkajRTeXR6bWdI?=
 =?utf-8?B?dHBUb1d3NG9QVFlnUmdqZ2VYNjVRcWlKMkxiOThIejFIUjVSQ0cyWGEyTlcz?=
 =?utf-8?B?Nmt2elRSS3d3OUZBNnVmYm1OZlpnNUY3K3BsLzdna0lkNHFLRmdyYVNGM1VZ?=
 =?utf-8?B?RkMwSFQvYllhTGE2SGVOVXpIZnkxL3JNcVB6VTJTWUV0em1hYjFlaHo0aURv?=
 =?utf-8?B?Y3NQbU5EeVRwRlZkYXZNUmtyR1VmZkp4bUE1K2xEYXFxQzFoN2pjdWs3QnJL?=
 =?utf-8?B?WWpJaHUxTmNmL0c2YzVpVnhnelM1dzkyMkV3TWpua1YxcGM4MkVpS0FTYnJ1?=
 =?utf-8?Q?YydEpwvLRNllqDtndLXUbmgutBMq+1/C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUtyRkNjUU5MNFpoTHRVaUFJL2hDR2lnTFVwOGo5QjNlZlVKQ2ZxUlZGQjdO?=
 =?utf-8?B?TVMycWVJaDdaUlJRT2h4NG9tUjlndEpLUjBPR3hJakZGUHAzMDd2ZzIxZTBn?=
 =?utf-8?B?TkdSUVoxUE51ZENVNGF6SENrc24zVXVLcm55a0s2OEU2cGZKM3k5OEdkbmVj?=
 =?utf-8?B?S0VvWTZoTDA3dSswN1pISVA3WnhtNVg1cC9IeFZDQmg1N2trTmozcExVZ0Vt?=
 =?utf-8?B?LzZuRHNMTUJ4akdLWVVQdisvQnNDakk2MHEybWRyWHNLQ0paamVXSUU2eTRJ?=
 =?utf-8?B?L1llb3FrV1JtZmtNREZXNllXL3FaaktOR3JKMHBaanNpSFRFcElFdU41Mmx0?=
 =?utf-8?B?dVIzTVdtczRleVdwL1dSVnloRW9Wd1hqM2l6U0t5VlBYYUdoRVlFYWcwcVV3?=
 =?utf-8?B?MVd3alJpbnhXTU4wbGJhQjYzOFJHK2JzZmNwWXZ4YTVqOWFDNG1ObHdjLzFH?=
 =?utf-8?B?R2s3c1l6ZGxVRVVhOFRHY29teDhpbWtnYWJVTFpYRTFKb0xrV01Xc0hhamFV?=
 =?utf-8?B?MjNKY3ltbkVRcjBTS0NVSXozUXhMQmM4dW9qWjhLWGZCaWhVU3FZVWpqRWlX?=
 =?utf-8?B?VUxzcUFWWmlXTVd6bkxVNmR4ZzJYbW9UaGg0aDVlU0dMblJnd21TeTJvVVhx?=
 =?utf-8?B?V0FsZTVMYVlIT1BUNXl1RVV4OWNGblltL1l1RWRXNmVhWnFmdURZSHZxS2Y3?=
 =?utf-8?B?bThGUVBNK0NNSGo5Vy91OVVnNDVyZWFvVFI5bXFmdHhrWFVsNHlucHdPOUdZ?=
 =?utf-8?B?bGJQZkU1a0dMNkZGdTFLeU81OWVDc25ycGw3UytRKzNRRXhDbnhaQmpHdElX?=
 =?utf-8?B?akRVdkNScVQ0bEhhMFNoVUQyMHJ4NzYvWEkzZmY4eVpnckoxUUZlTnh4b3FT?=
 =?utf-8?B?eTNta3FzNDM2V3B5R2E3aXdqUENvUTVHZmhxOEJMZFNZWmNGTGI0TFZ3aHFj?=
 =?utf-8?B?TEJFRzdmRGlFMWk1bVIzZXI1NG5wV2lUWVFyQ3o1RHpEZzU1VDBxMmJoOW5U?=
 =?utf-8?B?RUpGaEkvZlFMMGlNdFJxa2RpWUw2UHdiN25JdU01MkxRSi9QTEpJQ2pmUDRh?=
 =?utf-8?B?RzVHRndRTXY5UlRldU93UWZBL1pKRVorVGtKNWpjWUlUNWFZWFh4c3RKM1RG?=
 =?utf-8?B?Rk5LaTB3c1lhZXlJUU5LTG9YOXJZTkZoZVVJby9BRFkwa0o3SnBVb2hEaVQ2?=
 =?utf-8?B?ZytNQUU3b1ljRFNjdVFJNDR5ajUvNU5IbmJFNkc4YXAreXV3Sk1sSnlQS3hW?=
 =?utf-8?B?UVdWUHI3TXVidFl6K3lwL09CK2dCNnp5a3VuUTRKbjQ5ZDNrUzFNNHppSkZk?=
 =?utf-8?B?T3J4dDdlaVBjUnliN01DZHlpMVRrd09vOUkyRXBRWnVFUmdmRmtOZjN2bkky?=
 =?utf-8?B?TEhzSk1XZmtST0M1ZTB5WS9HeHJJOVBoWXJFaW9CeisyQ1JvRnZRY3I4NHJR?=
 =?utf-8?B?Nk9SWit3YitKY0pHZE13RFlIT2NXckJJSy9zalhybmF0a3BMMmc0Qy84R3F4?=
 =?utf-8?B?OEUxM3BTL1ZHNXdGNzBhTjlvMG5xTllVTjMyYTJtcG1zd09QQzF2M1h0TmN5?=
 =?utf-8?B?NTlPRWw4TDdJbUZ0QXIyb0lLQXBqUEd1Z21pSVZMeGZFVGRQd0ZEV2Q0Sk43?=
 =?utf-8?B?T0NwR21aZzFOT2tyaDh6Y0Z6YzIxbW9LdHZxdU00TTh5TVZZaEpGYUdvT29h?=
 =?utf-8?B?SFExL1NJVVE2Sk5rUlFXZEFXRFhTd2lkSkdVTG9GVkZWc2FwYlhwV25JUnhN?=
 =?utf-8?B?blhDRi9aVnFiZUZwUHBKZHg2eDgyVDY5WGt6TG5TZndSdW1UMC9Zb1NsTm9i?=
 =?utf-8?B?a2pOK3hqTHFLN0x2S1p3ZVJINVkvaTVrMDl5YmRZMUNmM2JCOW9RZXYxaW9G?=
 =?utf-8?B?RlVNL2pDYUFkaWREbm9GOVZNRmpZRVZYMGJCMlZSaDAyWW5DQ25NcmxpSmN2?=
 =?utf-8?B?aFNkVXZpdmVNM2t6NjNTYzR5U0s5MkdXSFRReG1pTnJCQ0JqNjByM2FzK1pC?=
 =?utf-8?B?b3FvYzZLeUN3WGZSLzE3VkR0WEMvOXB6TmN1ak5CRkpqd3RMUnNVOWVtNktF?=
 =?utf-8?B?c292SW9mYjVhaGJiOWhhcW1qR2g3TUZHNk5sVTRYbUwrc3YyWXVGRk1XY1N6?=
 =?utf-8?Q?LPT0pk+nV83GrkQK3OVkVSnlE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b99a29-143f-441d-5633-08de02e8e26a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 01:53:58.9180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3KMSyJgR+ym2IAii/uzlG9WEW43Ng1HZS+uEE1d174PA6b/Jj/cPMI0t0DbMcN+nxfXOufpZeC4QwACe7zdpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8053
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

On 10/2/25 2:04 PM, Miguel Ojeda wrote:
> On Thu, Oct 2, 2025 at 9:54 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
...
> In any case, for you, my intention wasn't that you had to fight the
> formatting, but rather that after solving the conflict (without
> thinking about formatting) you would run `make ... rustfmt`, i.e.

This works really well.

The other piece of Rust for Linux lore we (nova developers) picked up
was, "connect rustfmt(1) to your editor's file save command". And that
works even better.

> instead of the other one, `rustfmtcheck` (which is intended for e.g.
> CIs).
> 
> Leaving non-formatted files does hurt us, though... e.g. CIs check it,
> and I think people are generally happy about the simplicity of
> formatting on the Rust side.

Very happy! Far more so than I expected. Being able to *not* fuss around
with minor formatting details (while editing, rebasing, and reviewing)
has been absolutely transformative.

It's like taking off your backpack and just leaving it behind on a hike,
but without leaving anything important behind.

...except...

> 
> So if the conflicts are already too frequent and/or painful to deal
> with, then I would say we should already start writing the imports in
> a way that reduces the conflict potential, yet making it pass
> `rustfmt`. It may be uglier than what some may like (depending on who
> one asks), but it keeps the `rustfmt`-clean property and eventually we
> may be able to get `rustfmt` to give us the formatting we want and
> migrate to that.

The main complaint with rustfmt is that it is extremely twitchy and
unstable with respect to one-line, vs. multi-line output.

*Especially* with "use" statements.

For example, on today's linux.git, I just now ran it, and you can guess
what happened: it changed its little mind about yet another use
statement! See below.

If we can make just the "use" statements stop jumping around between
single line vs. multi-line output, just that small change will make a
big difference in stamping out some of the day to day noise from this
tool.

And of course, extending that multi-line decision stability to other
areas will also be a welcome change.


$ make rustfmt
$ git diff
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index e94aebd084c8..1d6cc81bdeef 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -7,10 +7,7 @@
     layout::ArrayLayout,
     AllocError, Allocator, Box, Flags, NumaNode,
 };
-use crate::{
-    fmt,
-    page::AsPageIter,
-};
+use crate::{fmt, page::AsPageIter};
 use core::{
     borrow::{Borrow, BorrowMut},
     marker::PhantomData,


thanks,
-- 
John Hubbard

