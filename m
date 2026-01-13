Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94ADD16415
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 03:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE54410E44B;
	Tue, 13 Jan 2026 02:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="miIzcmFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010057.outbound.protection.outlook.com [52.101.85.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CF310E2E3;
 Tue, 13 Jan 2026 02:06:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFhOzj5tFBtiu1f8JcPZV8eqX0aWLmvCQSZd9KKsYRVJ3xcxnnSXd+dv3HoEDngRm3Tg+ZjTTsJ7DdvbMqqisxyr9dSIwMdFKkfIUxe25tTT8TbKwYULwdMVzDJPfTdooLSMgQs4PUCM8SKVFh5W931a2yxnAAq0tq12aY1IQIkQr/QZV8cEV1tzE0ddYPSGSorbWgttYOSKlTESWNce/RDcCDIZlsI4c3SW6YeEEU2akBuflACyiFkQIOK02k1R0m2iZWnHdUkjXUQVr1i37WP/0fVCXoy5INvfZapnxGX99hmTuRqavsp2qA3RoJdibHg3ajDpG2+K/++l5I72pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MuzDfl18gqIMzhqAUOFgthECfYVzPsuYWntYvo2DDc=;
 b=dRah0Fqt8cy9ZU5sXES/JvMm7KqyX+pCIy8T+a8LCj7fa3Uu0h9D0gg0sr4vE39e7GNpzjNf5yr9y/LoBXHswdrl35EPprJDcvlEWyZcAV4xYsDMCYt4OZA8Fv35dyHcsdvlQoZ24cAmf3QS9cz5diAw4xP23ljlmF1gRCVLGpR5rIsEA2TZKIbgxCtkn1Kq6atoFPbLGchiRMHcQ9FdlScnOu7DmgA1Zh5sPmF5xbuxP3gwLaeZUu+JccJo/o/kyb8RNTa55aezi5+kDRaunK4Z/omjJBDpZ5ZRKaN82w0Ffz3m9Hx6Ef0oUsdn5CZtLT6Ws1Wl9fdKBCoHxBD1jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MuzDfl18gqIMzhqAUOFgthECfYVzPsuYWntYvo2DDc=;
 b=miIzcmFqhAdL0g8/AdwPVbNcJC5WgykVi9mZZ8SPDi9ozw0gDd8izr7TXyXCXAvUVUycEC4n7k5e/yT6MjOXgA1b4B2VXCKYfjAez5+CBlQUoqYYMdG+BSCSHWJBRRuYTry6EVy+sw64YxMO56Ns9J+LkR9bE/k8scOcQsLDPWK4S577aB+6b0WTARG0T8DKtV0bPDqt+jw4ZTiiTdwA1oCIse6fxwc/ePzAj0bC7pehM2QwgQ/njYdFjY7t15y22nqqdRmZrJLZXidiYyrC2ZEQwm7yto5SRhWI2Myrq+BjzjNcH1gZcR2Zffg5YvxILolTThBO69gt779ugrmmgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY8PR12MB8339.namprd12.prod.outlook.com (2603:10b6:930:7e::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Tue, 13 Jan 2026 02:06:07 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:06:07 +0000
Date: Tue, 13 Jan 2026 13:06:02 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Balbir Singh <balbirs@nvidia.com>, 
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>, 
 Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, 
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] mm/zone_device: Add
 free_zone_device_folio_prepare() helper
Message-ID: <lwbeop6muq4tbrdauwfi42nw5jss7yvgbmls546sxvygivpcwg@persiopzpqed>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-3-francois.dugast@intel.com>
 <706ba3a6-5be2-46d7-9e7d-d613f2e061cc@nvidia.com>
 <aWRLeoUJAYAWbLD3@lstrano-desk.jf.intel.com>
 <k25qmqrfmhzkls2ngdaq4wdk3xtl3epv4z3dvukon5yj2cb2hl@yci7xdpvauh7>
 <aWWQhOD8g8oLz1vX@lstrano-desk.jf.intel.com>
 <ntawk3mmrg2qihe24dk34pevtlgj3cdxnshau3wgyi5lygtuvo@jcsz5hmt4xth>
 <aWWaxakpRiapWw5X@lstrano-desk.jf.intel.com>
 <bgbjzeqbvdrlusnt2gexc4joosukgxddca5w5zzq6dz44rjkfq@nt2qd7eu5cak>
 <aWWijsq6CohElWVV@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWWijsq6CohElWVV@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SY6PR01CA0084.ausprd01.prod.outlook.com
 (2603:10c6:10:110::17) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY8PR12MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 47627f7a-763d-4981-87d1-08de52485053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFB5cnk1SUZ1Ym1ZQnRPUUl0VVNNV09zSHNXeDZIOGpQWEFkMk9vVHUzRDV0?=
 =?utf-8?B?akdpTDlkSzlLZGM3QWdNaG9LeHJpb2xhcU9DSzY0YnY1LzVzY2hXU2xQdk1p?=
 =?utf-8?B?dG42eHhuTTNQZndDazJIYXhUSEZWb3hXWlFPZGV3OWRYc09MQ0oycnc4Y2gz?=
 =?utf-8?B?RmNHQi9NRXAxNElHK3VLVXExUWdsdUFuZzdJbHg4aTNrU1BRQlhZZnRVU0Zo?=
 =?utf-8?B?UmxwNjBvelNuQW55c1oweU9Rb2o1dDNTSEtsWXlHVHhoenZnWFZUNEZYN1hX?=
 =?utf-8?B?SVFkVzNILzFFTXpkY1JhTkRMc1NRZERHby96QWlQK0piSTVBRDliMnJGcU0z?=
 =?utf-8?B?ZXNucnFDeEsrSEtiU0ZodkFtMTI1aUxibDkrQ0FEQTRPYmlKdEkxNXVqQmVl?=
 =?utf-8?B?MUdlSC9MVTlwTmZaRXQ4VlJhUWRsZVJ4TElUczRRNVBkcE1iUG5jZHVoSlBp?=
 =?utf-8?B?enBLcFpLNUxtbWJ1L240RFlrTTdRdVJyZk5sQ0hSeEVNb0w0d0hDSC91WGw2?=
 =?utf-8?B?Y3dlYWxrRFM5SjdSZDIyd0JPRzczSDJreklqME1GYnkxN0dZWmlSTkdUaDc5?=
 =?utf-8?B?Zmx6ejdvbmUzbFRZYVJVVG5lQlg1UnFTSTNrcTNvY09DU1pRU1lrYUltckQ0?=
 =?utf-8?B?bTNkYXRQSVc4SVhUcXE5aytwemFyT2prNzBVTTVLZTFWZmxoaGlHdzdWTVhU?=
 =?utf-8?B?Q2tTaEJxUmoxcDRUYUVZNWYvaFh2aFcxV2tKcnlDT0d0VkR2WjlaVmNiWHIx?=
 =?utf-8?B?TjlYeThlc2F4UENtOFA4SlBDQ3JXSmoyWDhieXRBMW94ZUZLdVVhQlM5NWNj?=
 =?utf-8?B?S3BobUUzRVUzNll3ZTdoRnpiWWVKQk5lUE5tSG0xOUxSdFM4KzhoczZmQWoy?=
 =?utf-8?B?TlkvNFFiR3cwQ0JGNy9xVEJpQ1YwVnZySmV4L1NTNjZmeGtsZmNyd29GR3Y0?=
 =?utf-8?B?dnFVdzVDaFVYTFpDOVZYVUUwZnVCTTJZWmZiQSs4cnhpc1JQOTNQVy9QZXhu?=
 =?utf-8?B?bUxFYjh6TkRjSU9HQlV0SUE1cGRnclcvSmt5eVk2YjRkK0txK3ZsWDFuOFJT?=
 =?utf-8?B?VkQ1UjF2RVhOLzFleGlsZlNjYVZMZjhpT1R6UGlJdE5MdDNZN3prVXNWaVVj?=
 =?utf-8?B?QzhGTVE2M1Z3c1VaU3ZvUEx3OWVrZ1VpRElUYW5qaG00TTg1aEFVa2c4cVFa?=
 =?utf-8?B?U3JNMG8zMXdiSFNVZTV3cXFPdEhVemxuL2QxdEZ3NWFLYVloWGp4SDFndXpv?=
 =?utf-8?B?ekdrYmF5YTRvUWlNcXFjQnZjMTB0b0EwNEt0SHhRbDZKYXYzc3hKb1JWWjha?=
 =?utf-8?B?dFZJSUdrMEpVaVRjU2VlK2dLc0tIT3h2VW1DOWg5dXFkZjdoYys1RjIzY0c0?=
 =?utf-8?B?aFNFZVFGc0VRU2JGN1N0Ni9ZZ2hacytOZnE3anNxcnc4dXlISFpPUGhqK005?=
 =?utf-8?B?azN3SnFZQW8xM1VqbWw5RkRPTnl1QW9xajN2b2xuNHBUMllrejEwSXg4UHpq?=
 =?utf-8?B?R0xUWEljc3FnclZYYi9PSjdNbmlocnZFN012MW54NW91WUZObWJtakMwYlZz?=
 =?utf-8?B?YzJZNk92Uis0NEtSM0U1TTNxUGU4VUYxbCsyMGZzakhmVUtzVmszWnhzcnZV?=
 =?utf-8?B?dG9aRlNidU5ycjJZdGxRQ2NEbytNSkpzc0xxbFF2ZWgvd0pYSVVIWEw1c0h3?=
 =?utf-8?B?Z01oUFBBRW1wTmZpeUV6QnRSWjU0UXRDNEN5d2hWdnZoa0ZTL0N0ZjB3dkVn?=
 =?utf-8?B?bXhBTmh5dndIR1FrWGY4THY5NzAwc05SLzR2SVFrTm5iUGgvQjUwbTducGFE?=
 =?utf-8?B?cUdKbnYvZXY1V1EwdGNVdjFvcjFrZ1gva3doQ3dvTmYxVmY5RGt6YllUMm9j?=
 =?utf-8?B?UjcrSFc5OS8za3RnTUduSW5DVlE0cDFaWXRkc2NHZFErcFdMT0M2TlFtSEFO?=
 =?utf-8?B?K0NOQ0tTOUJnZnYzRlF2Zm9BT0lCWTBVdkt0RHpNSEtGYzRRWUgxcVhOQTVt?=
 =?utf-8?B?dzY3QkpPTWdZL25EcVRoNnhSajlNUFQzcVhvRk1WUU5pZGpyY3hLTlNWaW9G?=
 =?utf-8?Q?U35+j5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUtydXcwTjlCV0UxaE5qU0l4ZzRBNFN0d0k3ZjlEV2Z2ek0zYU40QWhTOE5R?=
 =?utf-8?B?SlZnUWxjUlZaQmJIMkFPdXVuenF6V1REczBlcHpoOEN0ZHJwSWliZ2JOZ1kv?=
 =?utf-8?B?LzZjN1hvckZpTkIxa2ZrZkxTRW44eWRYcUxrNUNJWThGUjJ1c1hsV2Z2M3Fu?=
 =?utf-8?B?Wm1mNEpKL0tSWU5mbllXN0hlRmtLVklYZjFKV0ttc2IzVVJ4dVdVS2M4OENo?=
 =?utf-8?B?NnFsWm84Rm9nalViMlBsc3Y1NUpERzZMbGVqMU5obVNTbXd0alNRVERob2N4?=
 =?utf-8?B?V3M4UUVkZ0FjK3NSR1ZncFcxUm9ObldvN1hSVnh6ZzRKcW5jYTIxN1A3SnFs?=
 =?utf-8?B?eEtrQXhCUklrZEJoQWdwQWl0SlREWUV2clVBZk1oakljcHEwcGlWcGJpT3NV?=
 =?utf-8?B?cGgzQm9zbmpYRzlxNXB0Qlc3dEIvUWF0SnZNTC9tMUk2S01pRmFBWmdLTERp?=
 =?utf-8?B?TG01VXpTVWlGWWsyUEN2Qlk3bHdWbi84MGR3V0N3N0dRNWJlNE5kTm5YQ3Za?=
 =?utf-8?B?Tk1nTGdTKzBRWjZZNmlWTXJ4UDNSR1BnTlRGM2FGcy8wbXRQdWlqRW1TNjBN?=
 =?utf-8?B?Y0YremFLR0lMN2FkR0RuRjBlQks2YkVMTkdmVWMvc1IvUGtaR0UwWFRNRzVK?=
 =?utf-8?B?MkZNWkxSUXU3bjZ4YjdkbmpVdm9RejhUNjZlQ0VTSm5PTm8zc1gwd1gyWTNF?=
 =?utf-8?B?cU1nUW1qSEVDSkJHRjc3amZZa2hNcElKMnY1Mm40UVlOdys0QWJNVFd1dzZm?=
 =?utf-8?B?eS9ObDIyVDMwY21janpCemhJMDZPMERPMVNtUWxidjhxYS9EMStwbXdNSGdU?=
 =?utf-8?B?YnJJT0M4SUVQanFlZHg5YWFFNjB6QVB4QkhOWlZwVjFUUWtPVVZZMmdEbGx4?=
 =?utf-8?B?LzJGSUZzQWNYOWNwbkFkcnlOb0djUGw4YUNPTkF5aG5PUzhqU01HUXJnQTZL?=
 =?utf-8?B?ZXRuVFR2M2pVUk5CcFJRQVlCdEx6bU1YNG1Xc2VyVHVZYStkTmYzMDZ6VEhj?=
 =?utf-8?B?eEt1Yy9hSVVqNnVLVWs4K2dUR0l0dmxmeVdma3phblljZzFzSU80VTUrb2JI?=
 =?utf-8?B?WjNJZ3JDL0VXN3JhQ2Z1TUlyN3pUMnRJWkhRWEpOczN1ZDNqYjBMSlZVNzFK?=
 =?utf-8?B?UlBKd2lwOFB1OTQ4UStmR3V0TnBMeUl2aXBDZnR3THhNY3ZwUHVnWWhLd1pp?=
 =?utf-8?B?U2RHNUtBdFM5Ynl2RU5tMTdGWUx1WmtkVmg4eW96di9xNDg0UFoxbGRzbHVt?=
 =?utf-8?B?U1M3dkhQZHpzeFMzVXFubzR0Z1I5R0xRWWR3YmIvcVM2dmhodC9VMFJXTDky?=
 =?utf-8?B?UTRhK1N4aFJyb2tiN25PaC9Sb2tQY1RwL3E5L2hSNS9sSlM3cnVUWlJOOVdF?=
 =?utf-8?B?MGZZRGdQVG55cjNDTVV1VXRYc2NDN1BGV3VNcGltVmxVbmJYdVJQOTlwaGE2?=
 =?utf-8?B?YWZGd0w1WTVnT2dmazAzRUorK1VqVUJodFhCd0lpL0tXUW1iSE1Nb3FBWVZm?=
 =?utf-8?B?SHQwb0RUbkxYQmlqMzJNSDdRVkhVUzhyR25XUk1MdHM2MVRxOW9MUktnbEdq?=
 =?utf-8?B?MkJ6NGwrWVUvT3YvMjRnRGRlUWlsTTBMYkhFT0x5MHoydWhGNnhoTjV6V09x?=
 =?utf-8?B?VGdPd1dWQ0hrRUUyMHpIMnlvbUV3QkJlWHVSeGlycjlHby9LWWtabkZoa2Iz?=
 =?utf-8?B?OHZ1V1plQzN0OFQ0eFhwdFVpNG0xRm9DUlZwZnQrM0ZZZmZTd0t5Y2d2SWVx?=
 =?utf-8?B?bXMxOUtxc0M5cVdYWHZpQ2h3SFFjaUtmRmJKd0k4dUFGb284bjB2VE4yMTgv?=
 =?utf-8?B?Zmp0WE0xTTBmWG82dExoT0E0bnBLU2NLNVAxNVNuUUJUMnpMVFpoTWQ4dTNT?=
 =?utf-8?B?QTZjLzV3blhJMzdINHFxZmcyTk9hSUorTFptcjJ3eGdneExzNmlYbXMyY2RM?=
 =?utf-8?B?WS9OYUVQZlRmeWFNZ3JWRFdoazlDc1BQTVc0Ri9rbGd1aFRhT2l4RWo2dXNt?=
 =?utf-8?B?dERneWpWOE0wOWlFdVZCNjRHcFNHcmU4MXpRcVhxSEdFYWlrUmNldTNCQXky?=
 =?utf-8?B?Vktaa1drYmJFdG9LNmVkbHVZbVhtcU1DQUQ4cWtkV2thamJ1ZmIxd0hqTks1?=
 =?utf-8?B?Y2JQcmZFbTFaeTRpZGt3bUoxT1RaYTBUMnpDQW56bVdnT2RBUVdCUlpiOWk2?=
 =?utf-8?B?SFBRc0x1ZVFWNHVuZyt0TmtUbkhQWmRPRjYzekVxb1VuOFdKVFV3bjB2VjZl?=
 =?utf-8?B?K2RjeFpWcHdEWmRWWDZYRjNTZEJESGtQUE5PK2RtL3RiVVRLTUI5L3hjRHNS?=
 =?utf-8?B?M2tZQ0hkc3hrWVVldnJTN0xiY3lsY2ZSMVM0dHQ1WUkyaUVsRGxTQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47627f7a-763d-4981-87d1-08de52485053
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:06:07.3479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHXdNNH139xMVjaYR/TUdoRPteSjCO0F4vs/5233rp9QCc4sT+Wde0OsIZZ9VU5II8jOp7KRpBfxYM9Ugav51g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8339
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

On 2026-01-13 at 12:40 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> On Tue, Jan 13, 2026 at 12:35:31PM +1100, Alistair Popple wrote:
> > On 2026-01-13 at 12:07 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > On Tue, Jan 13, 2026 at 11:43:51AM +1100, Alistair Popple wrote:
> > > > On 2026-01-13 at 11:23 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > > > On Tue, Jan 13, 2026 at 10:58:27AM +1100, Alistair Popple wrote:
> > > > > > On 2026-01-12 at 12:16 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > > > > > On Mon, Jan 12, 2026 at 11:44:15AM +1100, Balbir Singh wrote:
> > > > > > > > On 1/12/26 06:55, Francois Dugast wrote:
> > > > > > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > 
> > > > > > > > > Add free_zone_device_folio_prepare(), a helper that restores large
> > > > > > > > > ZONE_DEVICE folios to a sane, initial state before freeing them.
> > > > > > > > > 
> > > > > > > > > Compound ZONE_DEVICE folios overwrite per-page state (e.g. pgmap and
> > > > > > > > > compound metadata). Before returning such pages to the device pgmap
> > > > > > > > > allocator, each constituent page must be reset to a standalone
> > > > > > > > > ZONE_DEVICE folio with a valid pgmap and no compound state.
> > > > > > > > > 
> > > > > > > > > Use this helper prior to folio_free() for device-private and
> > > > > > > > > device-coherent folios to ensure consistent device page state for
> > > > > > > > > subsequent allocations.
> > > > > > > > > 
> > > > > > > > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > > > > > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > > > > > > Cc: David Hildenbrand <david@kernel.org>
> > > > > > > > > Cc: Oscar Salvador <osalvador@suse.de>
> > > > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > > > > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > > > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > > > > > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > > > > > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > > > > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > > > > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > > > > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > > > > > > Cc: linux-mm@kvack.org
> > > > > > > > > Cc: linux-cxl@vger.kernel.org
> > > > > > > > > Cc: linux-kernel@vger.kernel.org
> > > > > > > > > Suggested-by: Alistair Popple <apopple@nvidia.com>
> > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > > > > > ---
> > > > > > > > >  include/linux/memremap.h |  1 +
> > > > > > > > >  mm/memremap.c            | 55 ++++++++++++++++++++++++++++++++++++++++
> > > > > > > > >  2 files changed, 56 insertions(+)
> > > > > > > > > 
> > > > > > > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > > > > > > index 97fcffeb1c1e..88e1d4707296 100644
> > > > > > > > > --- a/include/linux/memremap.h
> > > > > > > > > +++ b/include/linux/memremap.h
> > > > > > > > > @@ -230,6 +230,7 @@ static inline bool is_fsdax_page(const struct page *page)
> > > > > > > > >  
> > > > > > > > >  #ifdef CONFIG_ZONE_DEVICE
> > > > > > > > >  void zone_device_page_init(struct page *page, unsigned int order);
> > > > > > > > > +void free_zone_device_folio_prepare(struct folio *folio);
> > > > > > > > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > > > > > > > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > > > > > > > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > > > > > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > > > > > > index 39dc4bd190d0..375a61e18858 100644
> > > > > > > > > --- a/mm/memremap.c
> > > > > > > > > +++ b/mm/memremap.c
> > > > > > > > > @@ -413,6 +413,60 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
> > > > > > > > >  }
> > > > > > > > >  EXPORT_SYMBOL_GPL(get_dev_pagemap);
> > > > > > > > >  
> > > > > > > > > +/**
> > > > > > > > > + * free_zone_device_folio_prepare() - Prepare a ZONE_DEVICE folio for freeing.
> > > > > > > > > + * @folio: ZONE_DEVICE folio to prepare for release.
> > > > > > > > > + *
> > > > > > > > > + * ZONE_DEVICE pages/folios (e.g., device-private memory or fsdax-backed pages)
> > > > > > > > > + * can be compound. When freeing a compound ZONE_DEVICE folio, the tail pages
> > > > > > > > > + * must be restored to a sane ZONE_DEVICE state before they are released.
> > > > > > > > > + *
> > > > > > > > > + * This helper:
> > > > > > > > > + *   - Clears @folio->mapping and, for compound folios, clears each page's
> > > > > > > > > + *     compound-head state (ClearPageHead()/clear_compound_head()).
> > > > > > > > > + *   - Resets the compound order metadata (folio_reset_order()) and then
> > > > > > > > > + *     initializes each constituent page as a standalone ZONE_DEVICE folio:
> > > > > > > > > + *       * clears ->mapping
> > > > > > > > > + *       * restores ->pgmap (prep_compound_page() overwrites it)
> > > > > > > > > + *       * clears ->share (only relevant for fsdax; unused for device-private)
> > > > > > > > > + *
> > > > > > > > > + * If @folio is order-0, only the mapping is cleared and no further work is
> > > > > > > > > + * required.
> > > > > > > > > + */
> > > > > > > > > +void free_zone_device_folio_prepare(struct folio *folio)
> > > > > > 
> > > > > > I don't really like the naming here - we're not preparing a folio to be
> > > > > > freed, from the core-mm perspective the folio is already free. This is just
> > > > > > reinitialising the folio metadata ready for the driver to reuse it, which may
> > > > > > actually involve just recreating a compound folio.
> > > > > > 
> > > > > > So maybe zone_device_folio_reinitialise()? Or would it be possible to
> > > > > 
> > > > > zone_device_folio_reinitialise - that works for me... but seem like
> > > > > everyone has a opinion. 
> > > > 
> > > > Well of course :) There are only two hard problems in programming and
> > > > I forget the other one. But I didn't want to just say I don't like
> > > > free_zone_device_folio_prepare() without offering an alternative, I'd be open
> > > > to others.
> > > > 
> > > 
> > > zone_device_folio_reinitialise is good with me.
> > > 
> > > > > 
> > > > > > roll this into a zone_device_folio_init() type function (similar to
> > > > > > zone_device_page_init()) that just deals with everything at allocation time?
> > > > > > 
> > > > > 
> > > > > I don’t think doing this at allocation actually works without a big lock
> > > > > per pgmap. Consider the case where a VRAM allocator allocates two
> > > > > distinct subsets of a large folio and you have a multi-threaded GPU page
> > > > > fault handler (Xe does). It’s possible two threads could call
> > > > > zone_device_folio_reinitialise at the same time, racing and causing all
> > > > > sorts of issues. My plan is to just call this function in the driver’s
> > > > > ->folio_free() prior to returning the VRAM allocation to my driver pool.
> > > > 
> > > > This doesn't make sense to me (at least as someone who doesn't know DRM SVM
> > > > intimately) - the folio metadata initialisation should only happen after the
> > > > VRAM allocation has occured.
> > > > 
> > > > IOW the VRAM allocator needs to deal with the locking, once you have the VRAM
> > > > physical range you just initialise the folio/pages associated with that range
> > > > with zone_device_folio_(re)initialise() and you're done.
> > > > 
> > > 
> > > Our VRAM allocator does have locking (via DRM buddy), but that layer
> > 
> > I mean I assumed it did :-)
> > 
> > > doesn’t have visibility into the folio or its pages. By the time we
> > > handle the folio/pages in the GPU fault handler, there are no global
> > > locks preventing two GPU faults from each having, say, 16 pages from the
> > > same order-9 folio. I believe if both threads call
> > > zone_device_folio_reinitialise/init at the same time, bad things could
> > > happen.
> > 
> > This is confusing to me. If you are getting a GPU fault it implies no page is
> > mapped at a particular virtual address. The normal process (or at least the
> > process I'm familiar with) for handling this is to allocate and map a page at
> > the faulting virtual address. So in the scenario of two GPUs faulting on the
> > same VA each thread would allocate VRAM using DRM buddy, presumably getting
> 
> Different VAs.
> 
> > different physical pages, and so the zone_device_folio_init() call would be to
> 
> Yes, different physical pages but same folio which is possible if it
> hasn't been split yet (i.e., both threads a different subset of pages in
> the same folio, try to split at the same time and boom something bad
> happens).

So is you're concern something like this:

1) There is a free folio A of order 9, starting at physical address 0.
2) You have two GPU faults, both call into DRM Buddy to get a 4K page .
3) GPU 1 gets allocated physical address 0 (ie. folio_page(folio_A, 0))
4) GPU 2 gets allocated physical address 0x1000 (ie. folio_page(folio_A, 1))
5) Both call zone_device_folio_init() which splits the folio, meaning the
   previous step would touch folio_page(folio_A, 0) even though it has not been
   allocated physical address 0.

If that's the concern then what I'm saying (and what I think Jason was getting
at) is that (5) above is wrong - the driver doesn't (and shouldn't) update the
compound head (ie. folio_page(folio_a, 0)) - zone_device_folio_init() should
just overwrite all the metadata in the struct pages it has been allocated. We're
not really splitting folios, because it makes no sense to talk of splitting a
free folio which I think is why some core-mm people took notice.

Also It doesn't matter that you are leaving the previous compound head struct
pages in some weird state, the core-mm doesn't care about them anymore and the
struct page/folio is only used by core-mm not drivers. They will get properly
(re)initialised when needed for the core-mm in zone_device_folio_init() which in
this case would happen in step 3.

 - Alistair

> > different folios/pages.
> > 
> > Then eventually one thread would succeed in creating the mapping from VA->VRAM
> > and the losing thread would free the VRAM allocation back to DRM buddy.
> > 
> > So I'm a bit confused by the above statement that two GPUs faults could each
> > have the same pages or be calling zone_device_folio_init() on the same pages.
> > How would that happen?
> > 
> 
> See above. I hope my above statements make this clear.
> 
> Matt
> 
> > > > Is the concern that reinitialisation would touch pages outside of the allocated
> > > > VRAM range if it was previously a large folio?
> > > 
> > > No just two threads call zone_device_folio_reinitialise/init at the same
> > > time, on the same folio.
> > > 
> > > If we call zone_device_folio_reinitialise in ->folio_free this problem
> > > goes away. We could solve this with split_lock or something but I'd
> > > prefer not to add lock for this (although some of prior revs did do
> > > this, maybe we will revist this later).
> > > 
> > > Anyways - this falls in driver detail / choice IMO.
> > 
> > Agreed.
> > 
> >  - Alistair
> > 
> > > Matt
> > > 
> > > > 
> > > > > > > > > +{
> > > > > > > > > +	struct dev_pagemap *pgmap = page_pgmap(&folio->page);
> > > > > > > > > +	int order, i;
> > > > > > > > > +
> > > > > > > > > +	VM_WARN_ON_FOLIO(!folio_is_zone_device(folio), folio);
> > > > > > > > > +
> > > > > > > > > +	folio->mapping = NULL;
> > > > > > > > > +	order = folio_order(folio);
> > > > > > > > > +	if (!order)
> > > > > > > > > +		return;
> > > > > > > > > +
> > > > > > > > > +	folio_reset_order(folio);
> > > > > > > > > +
> > > > > > > > > +	for (i = 0; i < (1UL << order); i++) {
> > > > > > > > > +		struct page *page = folio_page(folio, i);
> > > > > > > > > +		struct folio *new_folio = (struct folio *)page;
> > > > > > > > > +
> > > > > > > > > +		ClearPageHead(page);
> > > > > > > > > +		clear_compound_head(page);
> > > > > > > > > +
> > > > > > > > > +		new_folio->mapping = NULL;
> > > > > > > > > +		/*
> > > > > > > > > +		 * Reset pgmap which was over-written by
> > > > > > > > > +		 * prep_compound_page().
> > > > > > > > > +		 */
> > > > > > > > > +		new_folio->pgmap = pgmap;
> > > > > > > > > +		new_folio->share = 0;	/* fsdax only, unused for device private */
> > > > > > > > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > > > > > > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > > > > > > 
> > > > > > > > Does calling the free_folio() callback on new_folio solve the issue you are facing, or is
> > > > > > > > that PMD_ORDER more frees than we'd like?
> > > > > > > > 
> > > > > > > 
> > > > > > > No, calling free_folio() more often doesn’t solve anything—in fact, that
> > > > > > > would make my implementation explode. I explained this in detail here [1]
> > > > > > > to Zi.
> > > > > > > 
> > > > > > > To recap [1], my memory allocator has no visibility into individual
> > > > > > > pages or folios; it is DRM Buddy layered on top of TTM BO. This design
> > > > > > > allows VRAM to be allocated or evicted for both traditional GPU
> > > > > > > allocations (GEMs) and SVM allocations.
> > > > > > > 
> > > > > > > Now, to recap the actual issue: if device folios are not split upon free
> > > > > > > and are later reallocated with a different order in
> > > > > > > zone_device_page_init, the implementation breaks. This problem is not
> > > > > > > specific to Xe—Nouveau happens to always allocate at the same order, so
> > > > > > > it works by coincidence. Reallocating at a different order is valid
> > > > > > > behavior and must be supported.
> > > > > > 
> > > > > > I agree it's probably by coincidence but it is a perfectly valid design to
> > > > > > always just (re)allocate at the same order and not worry about having to
> > > > > > reinitialise things to different orders.
> > > > > > 
> > > > > 
> > > > > I would agree with this statement too — it’s perfectly valid if a driver
> > > > > always wants to (re)allocate at the same order.
> > > > > 
> > > > > Matt
> > > > > 
> > > > > >  - Alistair
> > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > [1] https://patchwork.freedesktop.org/patch/697710/?series=159119&rev=3#comment_1282413
> > > > > > > 
> > > > > > > > > +	}
> > > > > > > > > +}
> > > > > > > > > +EXPORT_SYMBOL_GPL(free_zone_device_folio_prepare);
> > > > > > > > > +
> > > > > > > > >  void free_zone_device_folio(struct folio *folio)
> > > > > > > > >  {
> > > > > > > > >  	struct dev_pagemap *pgmap = folio->pgmap;
> > > > > > > > > @@ -454,6 +508,7 @@ void free_zone_device_folio(struct folio *folio)
> > > > > > > > >  	case MEMORY_DEVICE_COHERENT:
> > > > > > > > >  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
> > > > > > > > >  			break;
> > > > > > > > > +		free_zone_device_folio_prepare(folio);
> > > > > > > > >  		pgmap->ops->folio_free(folio, order);
> > > > > > > > >  		percpu_ref_put_many(&folio->pgmap->ref, nr);
> > > > > > > > >  		break;
> > > > > > > > 
> > > > > > > > Balbir
