Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2C9B8671F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 20:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6A210E8E1;
	Thu, 18 Sep 2025 18:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BJEMvm6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010044.outbound.protection.outlook.com
 [52.101.193.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894E110E8E1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 18:45:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8k9xLCQVZhD7YFwZAstejn2EIicrlzf/hJ0ep5FH0RPrjPtAOUzJ3ZgaxpTgqYTjnCOVzVqsz6kEOK2UF1ACxw/gStLyZpU5QbakoIcj868gTrtWGlAK5EJqiA0MXOi4AVaBfZUtZFAj0xUAO1rewEPH4l3WuAPwQGwtptoy1X/Hu4EcJ/mZ+frFFJhkE0t5hy6+dlZ/cZoZU7o6rQYoRM35bG2AmpFnh1ooLqjFrLxkomsWd3iE3pacChNsSt1pCF/uwy1/jvszH5o5hSzBHmKexNiELXT+WTn621JQUDa4tQVrl1+tN1G/21H2RSeYPnUpdiC9v9VEwWXrAAE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNlN/C7rdSvjXGomp+PLJO1T09yxtWv9E8mwHGiAprk=;
 b=tvoK/pCLrvXyFsuL7iZvXZuCcmKMn9qInOzJaAacVJm2wu1MJFmeV66b2hU2jS66KDReo+wffNWwwkUXfecPQjyzc14lylnVvqa8LGVnWqExVs3dqtuMmbfHsnT0L3SkAmTR/Rua0PaMaDb6qWjrk+KwacSHMuR/dAVDd/aMCD6Nr96ZhY/pXmXpCeUCxg9l0mNfFesMC2LiE5qBNOzMkIF1zHwKDvQ+RkSbX4qrecNdI+zNXCqrL9ahlnAC9GnpqJ8fZPT3T4HzoWGB7n9v9vu+9ehVeXoepC+cuHYNymDjACDBqFoI1t9o7v6YuudtaAm2IoZPl2V3ypDdrItW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNlN/C7rdSvjXGomp+PLJO1T09yxtWv9E8mwHGiAprk=;
 b=BJEMvm6c2eXa/6l1X7EnNs68sHmd4vj0Nx4JVFnS0V5ezuS83NcKlpejz/E6o/BtJmqRSPuFOYnKny8hzcbPip8NQvrfP2+VSj9DFpxghnsNAuviIooreECwSHUod3EaIxnIXIpaNvMDdk91SyTBZ+mWxfxxpFAvNBHiA55k/pvusrq8zYCmeVPSf6oPVnEXlNQfkir3caUg39w1skgITnsCES+mpCNxxbFmOkvZnky0VQK3P3HK+SstZF+0n6sWe3dphbt13XedG90xQPAmCYgZIdd+0Z9yyZ/h4bAV2ULvR3VL6HlOjUeeeZLB8gAJsScYkqNQVFYVXa+02QfMCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9214.namprd12.prod.outlook.com (2603:10b6:408:1a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 18:45:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 18:45:19 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v6 02/15] mm/huge_memory: add device-private THP support to PMD
 operations
Date: Thu, 18 Sep 2025 14:45:12 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <2A0E854D-0B0B-48A8-A87F-E9D38C6823EF@nvidia.com>
In-Reply-To: <20250916122128.2098535-3-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-3-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:208:52f::20) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9214:EE_
X-MS-Office365-Filtering-Correlation-Id: db8dbe07-f4de-4875-91e9-08ddf6e38401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yzh2bEwvVEVIczVEUFBCRno4TTVWN05XZ0pXZk9ZZFVoZHU0SklkZ1M0SWJo?=
 =?utf-8?B?NzQ3UlhjTDRBYW1DcFJGMmkrK1FaekpxRkFtN2ZHUFZmajQ0VXVvQ0hhTUJu?=
 =?utf-8?B?YVordDJBekZYSXlHQlo1OG5ham8rM0RFYjloRWJqRWN0c3ZPcjdpaFUvd2VW?=
 =?utf-8?B?cjg0dy9vNWk4SlJtY3Btbzdyb2NQTlRUUzdFLzhIb0oydjA4cHZmUkd0TVJk?=
 =?utf-8?B?a0F2VWg1by9HeTQ2MjNiRVIzcTJKOWpUTUw1L3JoZVV0M0syT1NibEF0cXU1?=
 =?utf-8?B?MXkyd3NUMk54d3J0WGJZdWwrN2RWck5LQmZDcWkxcXVuYTl1cmFUQnRzSG0y?=
 =?utf-8?B?VWIydkVESWNMMDl1ZEh0M0hRVWhKTCt4MjFwK1VaMzQvcCtmbVduK3N4VCtB?=
 =?utf-8?B?Q1llT3UyL28wWWhWcng4SjNCQURhM2ZycGd2S25KTnBxT2NrQzhiZ0xrSjVQ?=
 =?utf-8?B?MHpLaFQyaXpjK0RtSXR5T2dDYldLWkVjaGZjcEk2bkdsOTFJcFhybE1VNUpK?=
 =?utf-8?B?Vy8rSUpTRk43a243WHdQRmNrNzFXMHpLMnhJbjJyMGg1RHp1UGNvTWhTaVpC?=
 =?utf-8?B?TFNTbXVKN0t6dU1CaHcyNnV6Ym8rd1hxMlp5UWM4OUtwT2FGK05saVV5VWFV?=
 =?utf-8?B?V0FpMUN1bGp2ajBPelJ2cVJwOUxnN1NzK29ZdUIwWmdkTGFWL3V6bHJ3ODBB?=
 =?utf-8?B?VklPVEFHcXg0U2Y3a1BLM1dsang5ZW1YS2cwR1RIQThqMXJ1YkoxOGVHOWI2?=
 =?utf-8?B?eXlQQUxrTXQ1cE5odk9rK2o2U3l6ZWJ6bzVWa29rYlM4S0FPYTZyYjJlbFZk?=
 =?utf-8?B?ZlZzNFZYWEdYUVdvcU1XOXVKdFBveXUrNjRDTjVzZllhQmVOU2llTzk5elE5?=
 =?utf-8?B?eEZzQWhaRk5tTlZJNFhqcGxCaGNTVDlZdTF5VTZyNVBKcGN4RnpKS2JySjA2?=
 =?utf-8?B?OVZ5TnJSaVY4b0pIdzFwZHd3M0ptQ3hZenlQb2E3RVdGMXIvWXRQNEk4TzNG?=
 =?utf-8?B?VXZJWVZ0Y2dXVmZxekN2TURucFcvTE9sR0QxazRFTUVEMG56SENNdGVnOTd3?=
 =?utf-8?B?K3g3S2VVMFI0aUhpRmN0M2t1WEZicnQ2VElVc3E2YTRXcG8rTGJFLytocS9U?=
 =?utf-8?B?WnJpM1FrcnRYSVVUeEx5dGtnVkVOVTN5ZHZkMFNtcFBqeGVkb0lIVXpGWFR1?=
 =?utf-8?B?UkY3a3JDUlc3RzUvbXRjM1BScnMwQy9zWEMzbWljYlpVOStLcGN3ZW9TR3Ux?=
 =?utf-8?B?YngxYmtiVTYyZXUzS1Fxd1lLRmFEYyt2SmhKNThIS3ZRZzk3dHNNaW4zbUlo?=
 =?utf-8?B?cUk3NEtucjJzTGM3Slo4a1FDN1lmMkJianZXQ2EybXNkQUNMQ0szbng5TVNh?=
 =?utf-8?B?MUlsUWhxY2tMTis0dFhYYTdNL21GVHJ5bG9heFNLekpuaHJyVERIbDJiWWVn?=
 =?utf-8?B?RzZ1djl5aDNFRk1nY1ZtZzNtOHpKQVNPV0VtUERTT1FJN2hjRkp1SlVyZVhK?=
 =?utf-8?B?aVIvVmFCWWMvVFl1LzZWa09UbWtqRFgvU052MVFkN05tRDUrUytCSDVnWnJX?=
 =?utf-8?B?dU9CdmNrQlpWdVhKWlpxWXluSnZ2TkJBVitZWm9ZSEo2TTJkNkhRN2dIV2lG?=
 =?utf-8?B?cTR3dGkyOW9ZaXo0dmlmWnRJVXQ3RXA0ZWxBY0xzSHllYlkrd1Fad1JxcGhD?=
 =?utf-8?B?R2RoMWJiMmtmK3lHN0pzdUZHdEQ5NVpXOVl5MFdUTUltNW9CZ1pvY3lNNXJq?=
 =?utf-8?B?YU5jMHFma2JYV2hBMmphY2pDdFRPdnB4TXNNWmRtL1BJQnd2YWZ0YTMveUl4?=
 =?utf-8?B?N28wSHZTUUdzcUNJZE1TNUxZdm9WK09XSVNRZ3RsdTl0RzJRZ2l0UlYyaVcy?=
 =?utf-8?B?MTJHZmdZREp5L2lORW9INUgxb3dYSTF5VlVsWFFEck9Gb01nMnJjNTZhZ2h1?=
 =?utf-8?Q?WEsF1BRSb8w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1gzVVc5WU1MeDhrUmZQU3dPaC9RVW5KV25QOENpeE8wSGNaK1l5UmpBRmZN?=
 =?utf-8?B?MWFQN1paMTdjYWtyOThFQWZVdmRJTVFXbGYrYSs3b0JZbHZwWUZkNG4xYkxp?=
 =?utf-8?B?RTU1QmpVNzcvdktseGNLNjlSVjlpcDg2MWJjdmFUU0drUDUwbGR0WUhtaTEz?=
 =?utf-8?B?Q1VLM25mT2ppbllvaTRxaHlSNHNUKy9XbXRmdGI5RmE4OVYveSs4RGNoTTEy?=
 =?utf-8?B?Ui9CekFzZzdaaC80dXA5Rm9aOVdUR1dhWVlkYnl2eXZMSUhTbUsybWN1U3Bq?=
 =?utf-8?B?ZGtNcU4vbUlWUGxxYnhScnZHT2dkUktYNis3alFwQVRTVGwzUEpuMHJRZVhh?=
 =?utf-8?B?UDRMaWFsa3pIbGVac29mRDZhTVo0aUVsUm9NNlpWMGxQUEFMdUlEM3dibUx1?=
 =?utf-8?B?Y3F5V3M0RkV4dGcrT0NHbVZSbHY2YVJSSWdrU0syRWJpOGl6OGpUQ1pNZE9h?=
 =?utf-8?B?L0hCcnBheFpqTE04aWN0WldJTVJJSG1IRHhtYXdVRmtDd2lBYnZmTUxpQnMw?=
 =?utf-8?B?ZHRNNk5BTkVaRUM1NWhaM3ZFMytUVlVzQ3lkNDkzV1RxS2IzdUpQQUliWVNM?=
 =?utf-8?B?elQ5Y3h2QU1BQlZ1RGJPWXc3dWVuM2tVU1lmVk5OTi9sSW5QUjM1NG5BQ3Zk?=
 =?utf-8?B?QWx6OExHY2JBTUtYYUEzSGdZQzd6bHl3VnBkajFVeU9WWlUxdUFYWFlRMDJh?=
 =?utf-8?B?RHdBelpCcTk1dlNoZmhHVFQ0cmI5WlFCSSszRVRST2VqbnowazFzbnhMZkJs?=
 =?utf-8?B?a0lQbno1YVFod1ZDRThkY0RldGZwM0V5ZXEzS3RLTllqS0dkc3A5cElucDJZ?=
 =?utf-8?B?VDVUQSttd0hSaHJLZ0ZDN2p6VFVhOXpHZEZUekNYcUROSW82NUtJeEdCaGty?=
 =?utf-8?B?aC95Wk1EeTB0VFd3U2lqc2VaZVQrTUpDSFFlNnlZN2VoSjdLdDRvV2JmWTVU?=
 =?utf-8?B?RXdkTTA2VGFnQmk0S0tQL1FwTFJraERHYllweU1TNDc5RHduaGQwWG4yTjVs?=
 =?utf-8?B?YUpmaEdZVTFqaHFEb1d6Z2JTaElhMHlQcnFUQ3BHc0svaU10eFpvenZrNzd4?=
 =?utf-8?B?UWl2bHFRUzRPSU5WYlVxOVZ0NG0vSEp1UEVCSnRtY0ZwaXJVejhiNEt1VUQx?=
 =?utf-8?B?b2V2REhBNEs2cnI2ZlhUeGY0bGR3ZXYvSUIya2gxTDZRc3I0V0Rpa0tLWHpQ?=
 =?utf-8?B?c0dBa2ZaNmthbnpkZ0VwVkJNWHluRU9Fdk5BU3lGcWtsWE5NT1p4RGkrb2dQ?=
 =?utf-8?B?cVVVcldNbndSMjcyTERWYUROZmJlZStxK1RFUFozYzc3YVcxTllMWHJrdWg2?=
 =?utf-8?B?WjNHY1cvUkNOeWFRcGF1eXczYTl6YmF4MVdjVWhRSUE0YmFOWWlzdzN6cjFO?=
 =?utf-8?B?VXpIZVZzUGpTWE5Eem93YjE5eEJCaDBmUlNpWVFFTDljU0ZCSHY0Sk92bGVH?=
 =?utf-8?B?MnYvbk9SOTZtOEM1RHg0TDlyWVMxcWhDY3FDbFBZNlJCZDBaUnVIQkNwRWFE?=
 =?utf-8?B?MklLdzdreHdZNldSWm9HUGpERXp5UDhVZmZSZFlpMlZwNmVWR1NzWSsxV25j?=
 =?utf-8?B?YVNuUEZBSURjVUdrR1NwUVNYOUxudHBZWCtMUlJxalUyUjZHNG9xZHlkcXlQ?=
 =?utf-8?B?aGljSzJNeWxzSklMWEh4LzBybE0vc0l5b2xGUVZTWmRXWHpFbGdmZXRCaGRo?=
 =?utf-8?B?dENYcFhqN0JEU2l2MEFuVVFTQkRxcS8zVjhtRlhKWkNjOUdCSjVQWnAwUzRr?=
 =?utf-8?B?YktjK2l2ZmxKd05naCt4K2xwMG8yV2lVeXF4ZlF2UlUzeVhSL2x2d0NwVDh2?=
 =?utf-8?B?WW1LZG9pSTFCNHE2b0k2WTdDMG5WWU5NY2NkSUFwc25ScEZYUFhoeHE3STMr?=
 =?utf-8?B?YW5acVBsN2VRV2FjY2NDRUZldU5zVXlDeFpqUFhCc3MrdWlBRnduZTJSQmsy?=
 =?utf-8?B?WEVKZ0F6VUppM2c2bjFONmptZGVFWXRkODJWeTJIcXV4MzdIazRIbFp5V1d0?=
 =?utf-8?B?THhZSlY2TnNUQ0VsenBrZ2xVTmNmQzFkQTVKRkh1dGI5N2VpM2E5SkhDQ0t1?=
 =?utf-8?B?S3pwZkR2eUo1Sjd5dGMrWk10Y0JtWmliZnpzK2tnY1Jqc2JGVVZ3dWVqN2VG?=
 =?utf-8?Q?eMwpZSyFWv/xsaT2YZnxxzrai?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8dbe07-f4de-4875-91e9-08ddf6e38401
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 18:45:19.0925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkT7eBXCt4WVzNFHPon4oeR09PCnWTyXlxX/QaORGeYSOSd31IV0BssOQHBHqh6n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9214
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

On 16 Sep 2025, at 8:21, Balbir Singh wrote:

> Extend core huge page management functions to handle device-private THP
> entries.  This enables proper handling of large device-private folios in
> fundamental MM operations.
>
> The following functions have been updated:
>
> - copy_huge_pmd(): Handle device-private entries during fork/clone
> - zap_huge_pmd(): Properly free device-private THP during munmap
> - change_huge_pmd(): Support protection changes on device-private THP
> - __pte_offset_map(): Add device-private entry awareness
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/linux/swapops.h | 32 +++++++++++++++++++++++
>  mm/huge_memory.c        | 56 ++++++++++++++++++++++++++++++++++-------
>  mm/pgtable-generic.c    |  2 +-
>  3 files changed, 80 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index 64ea151a7ae3..2687928a8146 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -594,10 +594,42 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>  }
>  #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>
> +#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRAT=
ION)
> +
> +/**
> + * is_pmd_device_private_entry() - Check if PMD contains a device privat=
e swap entry
> + * @pmd: The PMD to check
> + *
> + * Returns true if the PMD contains a swap entry that represents a devic=
e private
> + * page mapping. This is used for zone device private pages that have be=
en
> + * swapped out but still need special handling during various memory man=
agement
> + * operations.
> + *
> + * Return: 1 if PMD contains device private entry, 0 otherwise
> + */
> +static inline int is_pmd_device_private_entry(pmd_t pmd)
> +{
> +	return is_swap_pmd(pmd) && is_device_private_entry(pmd_to_swp_entry(pmd=
));
> +}
> +
> +#else /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +
> +static inline int is_pmd_device_private_entry(pmd_t pmd)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +
>  static inline int non_swap_entry(swp_entry_t entry)
>  {
>  	return swp_type(entry) >=3D MAX_SWAPFILES;
>  }
>
> +static inline int is_pmd_non_present_folio_entry(pmd_t pmd)
> +{
> +	return is_pmd_migration_entry(pmd) || is_pmd_device_private_entry(pmd);
> +}
> +

non_present seems too vague. Maybe just open code it.


>  #endif /* CONFIG_MMU */
>  #endif /* _LINUX_SWAPOPS_H */
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 5acca24bbabb..a5e4c2aef191 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1703,17 +1703,45 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struc=
t mm_struct *src_mm,
>  	if (unlikely(is_swap_pmd(pmd))) {
>  		swp_entry_t entry =3D pmd_to_swp_entry(pmd);
>
> -		VM_BUG_ON(!is_pmd_migration_entry(pmd));
> -		if (!is_readable_migration_entry(entry)) {
> -			entry =3D make_readable_migration_entry(
> -							swp_offset(entry));
> +		VM_WARN_ON(!is_pmd_non_present_folio_entry(pmd));
> +
> +		if (is_writable_migration_entry(entry) ||
> +		    is_readable_exclusive_migration_entry(entry)) {
> +			entry =3D make_readable_migration_entry(swp_offset(entry));
>  			pmd =3D swp_entry_to_pmd(entry);
>  			if (pmd_swp_soft_dirty(*src_pmd))
>  				pmd =3D pmd_swp_mksoft_dirty(pmd);
>  			if (pmd_swp_uffd_wp(*src_pmd))
>  				pmd =3D pmd_swp_mkuffd_wp(pmd);
>  			set_pmd_at(src_mm, addr, src_pmd, pmd);
> +		} else if (is_device_private_entry(entry)) {
> +			/*
> +			 * For device private entries, since there are no
> +			 * read exclusive entries, writable =3D !readable
> +			 */
> +			if (is_writable_device_private_entry(entry)) {
> +				entry =3D make_readable_device_private_entry(swp_offset(entry));
> +				pmd =3D swp_entry_to_pmd(entry);
> +
> +				if (pmd_swp_soft_dirty(*src_pmd))
> +					pmd =3D pmd_swp_mksoft_dirty(pmd);
> +				if (pmd_swp_uffd_wp(*src_pmd))
> +					pmd =3D pmd_swp_mkuffd_wp(pmd);
> +				set_pmd_at(src_mm, addr, src_pmd, pmd);
> +			}
> +
> +			src_folio =3D pfn_swap_entry_folio(entry);
> +			VM_WARN_ON(!folio_test_large(src_folio));
> +
> +			folio_get(src_folio);
> +			/*
> +			 * folio_try_dup_anon_rmap_pmd does not fail for
> +			 * device private entries.
> +			 */
> +			folio_try_dup_anon_rmap_pmd(src_folio, &src_folio->page,
> +							dst_vma, src_vma);=E2=80=99

folio_get() and folio_try_dup_anon_rmap_pmd() are needed, because
contrary to the migration entry case, this folio exists as
a device private one.

>  		}
> +
>  		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
>  		mm_inc_nr_ptes(dst_mm);
>  		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
> @@ -2211,15 +2239,16 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct v=
m_area_struct *vma,
>  			folio_remove_rmap_pmd(folio, page, vma);
>  			WARN_ON_ONCE(folio_mapcount(folio) < 0);
>  			VM_BUG_ON_PAGE(!PageHead(page), page);
> -		} else if (thp_migration_supported()) {
> +		} else if (is_pmd_non_present_folio_entry(orig_pmd)) {
>  			swp_entry_t entry;
>
> -			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));

It implies thp_migration_supported() is true here. We could have
VM_WARN_ONCE_ON(!thp_migration_supported()), but that might be too much.

>  			entry =3D pmd_to_swp_entry(orig_pmd);
>  			folio =3D pfn_swap_entry_folio(entry);
>  			flush_needed =3D 0;
> -		} else
> -			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
> +
> +			if (!thp_migration_supported())
> +				WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
> +		}
>
>  		if (folio_test_anon(folio)) {
>  			zap_deposited_table(tlb->mm, pmd);
> @@ -2239,6 +2268,12 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm=
_area_struct *vma,
>  				folio_mark_accessed(folio);
>  		}
>
> +		if (folio_is_device_private(folio)) {
> +			folio_remove_rmap_pmd(folio, &folio->page, vma);
> +			WARN_ON_ONCE(folio_mapcount(folio) < 0);
> +			folio_put(folio);
> +		}
> +
>  		spin_unlock(ptl);
>  		if (flush_needed)
>  			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
> @@ -2367,7 +2402,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct =
vm_area_struct *vma,
>  		struct folio *folio =3D pfn_swap_entry_folio(entry);
>  		pmd_t newpmd;
>
> -		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
> +		VM_WARN_ON(!is_pmd_non_present_folio_entry(*pmd));
>  		if (is_writable_migration_entry(entry)) {
>  			/*
>  			 * A protection check is difficult so
> @@ -2380,6 +2415,9 @@ int change_huge_pmd(struct mmu_gather *tlb, struct =
vm_area_struct *vma,
>  			newpmd =3D swp_entry_to_pmd(entry);
>  			if (pmd_swp_soft_dirty(*pmd))
>  				newpmd =3D pmd_swp_mksoft_dirty(newpmd);
> +		} else if (is_writable_device_private_entry(entry)) {
> +			entry =3D make_readable_device_private_entry(swp_offset(entry));
> +			newpmd =3D swp_entry_to_pmd(entry);
>  		} else {
>  			newpmd =3D *pmd;
>  		}
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index 567e2d084071..0c847cdf4fd3 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long ad=
dr, pmd_t *pmdvalp)
>
>  	if (pmdvalp)
>  		*pmdvalp =3D pmdval;
> -	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
> +	if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
>  		goto nomap;
>  	if (unlikely(pmd_trans_huge(pmdval)))
>  		goto nomap;
> --=20
> 2.50.1

Otherwise, LGTM. Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
