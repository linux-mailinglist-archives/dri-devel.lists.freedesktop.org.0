Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E5D15E5E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 00:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB8610E43C;
	Mon, 12 Jan 2026 23:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b8tOVokK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010004.outbound.protection.outlook.com
 [52.101.193.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D9110E43C;
 Mon, 12 Jan 2026 23:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8233PUc23QeL6dMjVqoQAPdopIQJImb84u+msS/t7Jj4UgdTaJ0ENq2YUSbHyuCQkIV5Hxo4b7fvwE1BIlQxOoQSDchtd2a+y5EQJnPWHVFwiaT0Z+K1rAY5IyBrFwg8qpRGVJCeUg4ZdOmyLfMZFgzpqaFTe7VRu4q+8We+oc3Y1RJNNOJeqmIzi8KaPEA15V9Gs6QZjegM/aeaGfKEPDwopVBCexUBvFl2QDpPa7aBYjXRAXxgqa9DEvHB4Y82d/sgRxUgeWhDYky6wOYLgXDm754fxJ8Tj/GNOEGlWlgtJ84HD+V28bOZPRpnQn9X6i/oL0hWeXkiFxT+GZL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quxZRyRQzFWkPnCmpcS69g4I8fXoYpEmxOos3dwpjck=;
 b=R5DiX6nsEXib6FSCWzY6BjBZt4v7lyW0jTNRzc/Kv4Rb3VmV3U8feSxNZSwrIvnktSdAFMneNbwpgCgsLPIVv1dLB43cZxOy67QEVufIu0g4eZmgjZFRI13dPpXVQNbRXanu0TL6XCXVKN3jTpGDcei9zld3Ips5StueagqyD60AJy2plONA4fzY2nMPvbEdqSzXtkIT2KjiZlyjcRwmmKwwqaX2XIIb4mVSt8VPXFsBnnuFZE1sb1PYMGa18ewChWqtkatowCM3ntgpiMMO752YT4DLQJkao6OM56wUbhjzFXQtVDmGe/TTV1XvsYccWwynI73RG24fPyPnX5GvIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quxZRyRQzFWkPnCmpcS69g4I8fXoYpEmxOos3dwpjck=;
 b=b8tOVokKAPJ60Gmpznn6rQOGPwdleyj1QyN4E/KBL0ruOlZKHClS2Aprym554HB4vfUNozUkRPTf4/nkcPerO4xFiltEG0Bzh3Z+KTEpm5i01JeINAqYG0Xwhy9soBw7W/Wt2RfjZxevd0Ku/n6qKtZgH+DhI6JiaKogCqkGqk1Q8yDLGggZIPFms0GBXwDWB9NIajPMXxvgkFaK84/KbfuFJv0V3KNBamgzzZy9Xt6QJ/6afy/x5Vq8R3X1n92ypK4quUQKk5uHjMBk+66ytxDZXe8jtEweumxePt3TeUJHsCApCSL2c/d+gFvA83o315JiaMrKvlYMLaOveerIig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 23:58:31 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 23:58:31 +0000
Date: Tue, 13 Jan 2026 10:58:27 +1100
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
Message-ID: <k25qmqrfmhzkls2ngdaq4wdk3xtl3epv4z3dvukon5yj2cb2hl@yci7xdpvauh7>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-3-francois.dugast@intel.com>
 <706ba3a6-5be2-46d7-9e7d-d613f2e061cc@nvidia.com>
 <aWRLeoUJAYAWbLD3@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWRLeoUJAYAWbLD3@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SY6PR01CA0118.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 734a70cb-7a4a-4387-0352-08de52367d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGxIUmFESkdNNDBQcnZNejRrYktvTGZJL3FsLzFZQWlKZk9xTUcxY0tqQ0hh?=
 =?utf-8?B?bzRBSnBHbnJEeDVBVHhlb2YxYUhXSTZETDU3akxwL1hrajVnaXpTMEtFV3pZ?=
 =?utf-8?B?SDFSaWF0c3BzbEtmdXo1VG8wOG9KbG04V2srR3pBdENNVlJSOVhLUHpOenJK?=
 =?utf-8?B?Qmd2azlGSzdYVEFXb2hJZTZNU214TElDVGJZekVTVm9jZTNJTjM3S0trQ1E4?=
 =?utf-8?B?MW5lZ2h2WFVwMXpIbnBrMzJFMFNrNnVaK0NPbGVLdDhNR1FXNnl2OGFCVkdZ?=
 =?utf-8?B?R05MckpOL1Q2WVJQaEUxaS92Y3VvM2h2ZzR1bkVoQzNuK3lmZWZ4cENrcGxG?=
 =?utf-8?B?emxZMGl1S2xTanBUdzg2N2VyVFFkVk51K0cxR0ZkMGtPR3FFQzdtUUZGem12?=
 =?utf-8?B?NkxPVWE4US9sSFpYV1J0bHFWMEE0OGZSZ2pqelJ5eTdmRkhmY1FGa3R6M1I3?=
 =?utf-8?B?QTQrWlJ3OGhFVWozbFQ0bXd4YVgyWi8vVGdVN29iMGtXaXg4NExVejVOSTBl?=
 =?utf-8?B?enZIMWF6VWZya0ROQ09sY0Q2VDRjc3p5S1F0NXR6YmRQUUh3bnV1QlR3eEsy?=
 =?utf-8?B?RVNvdXZyVE0xYjhZWHdmMGZONmc1b2ZtTTZtcWRNNFpCd210dC82Tnl0NmVC?=
 =?utf-8?B?bW9zM2xIOEI4aDNSalZGcm5TNnRJSEc1eUFFcmVhYnRhSmRqTWlnNmIveGpQ?=
 =?utf-8?B?Y3JGamRQS2tjWFI4TmhTNjRWTUJFZVVteEc3aWNaOUk3eG11MStIODVJZDVF?=
 =?utf-8?B?TGxKK3BBWWxwbnpOZFpoWldwclJrTG9MRFAyVU1FSW91NE9MQ3RWVkptVW4r?=
 =?utf-8?B?Zmx0ZEdZZE0rWE00ZmxmQTFJYVNjMFdoLzRiMEtEQktRL211a3AyKzlscm9B?=
 =?utf-8?B?Ti9VM3dEaDQ5L3pBVW5QUlV4bTkvSmpUTzVuTWtBQ2F4eUJjckhEemFRclNK?=
 =?utf-8?B?NEw1S0l3djBvQ2RUWHh4UlM1MjNrS2ZqMHpiM0hKZW16OWtFUGk4Zis1RVM4?=
 =?utf-8?B?bDNrTk5JaXRTWUViY09rWi83RVZRMnVycWpUZS9qa1UwN3kvRmJodjlIYUMv?=
 =?utf-8?B?QjhiMjlHMTR0alpwUXIwOU5mQjUxdWpvSWIzZ1AyTlJ2ZHBEQWlEaEhoY2Qv?=
 =?utf-8?B?dTh1eEJFVTRGWGRaNzJocS9Bb2NSNGJWOEJja1BRRFVZWEpTL0V5VFQyQnRN?=
 =?utf-8?B?Z01DanpKUVljbHZoekFEeHp6OGE1OGl3WFNMTWZ6bWhMTXRkWm1hV1RBR1BS?=
 =?utf-8?B?VDlrNlBQUVNJN0FuZXZxRGxzWVhia2VnampqT1lya29id1ovSHBSM096ZFdZ?=
 =?utf-8?B?cnlleVJHN1lSelorcFZNUVFJSGxtOEJRTlJ1V1hGY0JvNWxWQ05aQmdZaFVm?=
 =?utf-8?B?ZDhPeXJmMUdNakxacUtsOFZZTXV6T1lIV2l1VEZZR29rMjlXMUdjV2orb3oz?=
 =?utf-8?B?MTdqM1ljU21qZnlXMDFUZGMxbXNoK0RvamdNek96WTErdUdPV1BjRjlLTGVo?=
 =?utf-8?B?NlR5elk4QWM4NmcwUTZQTGV4U2VkUVVjNFlhVzZiUlZnVTFiajNrZENhaXhz?=
 =?utf-8?B?MGdtOERDZEMyMzdsYW9VQVE5OE5BQTFqTzdJRVgvRUYrcXJtd2lwemQ1UWNP?=
 =?utf-8?B?cHpDU3RBc0dhNStVc0pkdWxBa1NtNG4raHR3Mko5RC9JOW1KL2pIOWZ0c1Z6?=
 =?utf-8?B?cWFVVUhkeUtET2RVOGQ0VC9jRXZaU28waWFXRThmZ1YrbTRpZnJwLzB0Yi9Q?=
 =?utf-8?B?YzVKL2llZCtVV3dsb3F4aEViZndOWmdvWmYrekJGc3h2VWRyM0hEY2IzNG1u?=
 =?utf-8?B?Y2dHd0J6bVR6anl3V1J1R3FMMnoxMlNzZm9SZ000N1UvbndXZ3kxVXpYSXdR?=
 =?utf-8?B?eitmemo1bjVQOURxMDMxR242cGdGSzR5SVlURDNta29iUk5GYWllWk9DV0Vj?=
 =?utf-8?Q?juMsC2/2j1l//0QZRFKYqXMED5O38TSU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFF5c1h2eUtaaUJvdUdma0p2L2lzQmNuMDlnMlRhWWdXMUxGcWVsTUxVdHlh?=
 =?utf-8?B?aCt2aDF3Y0FPSCt6NWV5cW54bTlJckZkODNoTllVcU5UYXovNHNzYlBQOVJq?=
 =?utf-8?B?aHZiY3haaWZxbWhSL2NWNEhhcGU4eXRVbDdKZ3ZWRm5naXkxblV0ME1FY01B?=
 =?utf-8?B?bkxEZHJyNEc1ZGJsb1FsOUhiUmFtOHNnbk16Nk51REpCSmZSVVZvRDg4VWcz?=
 =?utf-8?B?dSs0aUlPOVYwOFFVNVZqa28vMkRIS2FFcmVuUk8vS3I3NmJmT1k1MmV5UEhF?=
 =?utf-8?B?aStjOWdkRm43NUg4WmxPUHhqa3pEd0VyNkE2anFNVlRSTWtNY2tkL05jcmxy?=
 =?utf-8?B?aC9mTzdORXFGWWxDMWVheGk3Yy82UjcrcE44NWhXc3NwWkwrR0FuMk9rM0pU?=
 =?utf-8?B?NWZIL3hOR0R2WXpVZmVPelQrbllnNHA2Tk1ZZkRpaTdiZkRUaWxVUFZVRlI4?=
 =?utf-8?B?cE5pY0lEVlZUSzgvRzBvcmRwaWVOalJ6ak5ra3FGNGFiandzZFVMZlQvQUdl?=
 =?utf-8?B?c3lBUEpHR3hRbUg4eVdpeTVNcHFLUDhDS2YvTXl2cE1pV0cyNk9mOTlBSlIx?=
 =?utf-8?B?SXJLbFRicStIZTJ1YUJ0L2JSOUltY0JBTGhwOS9pdFp2b1BWeS9rdnJ2Uitl?=
 =?utf-8?B?UzRua29xWU9aMzgvM1Z4NDRUVkpFOFVzcnNXK24wcGNkSFRlWlg3Y1R3cjRL?=
 =?utf-8?B?dUVZczNRTnpHVlNyMUtqUDMwYXB4N0ZMZzZsSkdOejV2N0pvQzltc2toZVFE?=
 =?utf-8?B?UlliaDdrNHhKc2hNd21EdnpualIvVWRnOEt4N2hwVnJtN2tiY29aZS9UN0hs?=
 =?utf-8?B?Mko1OGp1anN4alBkZTVOR1d3SUoxbEFCSXoya2M4NlhUV3FmdWpQYnZaandL?=
 =?utf-8?B?SjA3Z2hHQjAwSGZCbEFTb2o0bzNGMGFxWHZnUHpPdkpZd3RlYmZPbXJrOFFK?=
 =?utf-8?B?Ui9iWW5SSEdWcEMra1RMenZHZlZqY2lDZFR4YndzNVAxK2o4M2tQVnFva2h0?=
 =?utf-8?B?SVlZdFRaOXR0WVNBcFZ1Qk9rUkhnYU1pNWVCaXdmTDdGaDRHNUQ2UU4vemdG?=
 =?utf-8?B?cys2RUpkdkxUZXpFYlA0c1cxeGRGbmNKLytMV0N6ZldaWkk1aFNBRithb1RZ?=
 =?utf-8?B?OWduVTFqaDA2cnFMMkkyOE9wc3UwUElIUTV2anl4Nk80dGlHYmJqNWE4RXVP?=
 =?utf-8?B?YU9xYXBiY1JaajFvZFdYdVhydVozMWdpMzF4S29vYjgyOHIrUmFVR3pqZDA4?=
 =?utf-8?B?ZmJNQ3Y2NFF4WGtYcU91QWZpbVVlWU1OcStYRTJkK2ZNV2lvQ2E2K1FLVWVV?=
 =?utf-8?B?UHFnWmMwUGk1d2JuaVRtODVMVXRXK0h4T1VNZjhtWE0xN2JHbjM0Vk5SOEZW?=
 =?utf-8?B?QTFJaXZoQThjbTZMRU4vNTVJRENMNU1NR09JdGZ4QnVkNm43amhNcEo0bnJS?=
 =?utf-8?B?TlRLL0ZpbWZKd1RoVXJLcE5sbW5ia2poNmhsT2UyRzN2aFl0RGtLbm1ab1Fi?=
 =?utf-8?B?U2FIazA0d0pBM2FtSXVqb2l4M1ZlRWU4aDRqRzNPc3NLeWxpNkNGNE5LYXNJ?=
 =?utf-8?B?L05xQnh3TXdrUE9IUE53MGNGY0JmTUZmZDVBOGp1VFp2ZUpITW42K2piUVFs?=
 =?utf-8?B?aFJlSGl2ajkxWUVJTE53NFRoUjFyTkJCblovS2YxV1Rrc0RCMldKd0twYnhL?=
 =?utf-8?B?WXVzTDk1RFhFSTYxWE1LYVExZ09wODFYV1N0S2YvQVJ6d3R4TUU0WWg5Qk5Y?=
 =?utf-8?B?T253MjdVUVdoL2NwdDZDOHJrZEhMcmlOTXl1TDhKMGxzL0IvZjJwUFd3OE0x?=
 =?utf-8?B?L3paaDlRU2NMN3QweEQ5SE12VUcxWG0zT1FNczhEV1Y1OVlxOWdWTkpNUlE4?=
 =?utf-8?B?d2doNU5SeUZMd0t4WWZoWkdKcE04Z0VKY0NPdHNZN2FDalI2ekppQXIwc3Nw?=
 =?utf-8?B?NFZpUktKSDI1b2pqV2hyVlR2NGdaNC9tdlhaRlZYNVZqOWJubDBRWVlVSk1O?=
 =?utf-8?B?dmtNSzZqWU05RFBEY2dNdlcxSFlxOWlnbGJhdWF5NVVaOFhMdXo4UmxoVy9O?=
 =?utf-8?B?ZVhEbVVxZkZwNjR2cnI3bkJVZG9ZUDFrTzJibmZBU09mOXl0TVV3b2U4ei91?=
 =?utf-8?B?NVlXQ29KczVEOTBXVHBjNTBIUFE2U3J3NXBHUEtwMHdnVVZ2WUFuOVAwQVlu?=
 =?utf-8?B?aVQzUzhTL3RBMlJsK2dMQi9INXAyU1lydHo3eUZPV3dsaTVjOVlBVUlDTHZ0?=
 =?utf-8?B?bGtnUFgxdGhTc0NUWldsY3h4djZUR2J5ejdWRldFUHNPUWRSenVVaTJsSFAw?=
 =?utf-8?B?NTJZQlVEcXIveDFDNmdrZFZpZUxvZ1ZBNGFUL0g3VXF1OVI1bWhEdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734a70cb-7a4a-4387-0352-08de52367d09
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 23:58:31.4050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IL+aEIiUmK5rjbi7IRW3hINDbX+gWbhWjnv/5OE1oxQ6mCxStrUMoMX/ZEpPPeESbaDewaydibXvkXCjgZOaZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389
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

On 2026-01-12 at 12:16 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> On Mon, Jan 12, 2026 at 11:44:15AM +1100, Balbir Singh wrote:
> > On 1/12/26 06:55, Francois Dugast wrote:
> > > From: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Add free_zone_device_folio_prepare(), a helper that restores large
> > > ZONE_DEVICE folios to a sane, initial state before freeing them.
> > > 
> > > Compound ZONE_DEVICE folios overwrite per-page state (e.g. pgmap and
> > > compound metadata). Before returning such pages to the device pgmap
> > > allocator, each constituent page must be reset to a standalone
> > > ZONE_DEVICE folio with a valid pgmap and no compound state.
> > > 
> > > Use this helper prior to folio_free() for device-private and
> > > device-coherent folios to ensure consistent device page state for
> > > subsequent allocations.
> > > 
> > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > Cc: Zi Yan <ziy@nvidia.com>
> > > Cc: David Hildenbrand <david@kernel.org>
> > > Cc: Oscar Salvador <osalvador@suse.de>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > Cc: Mike Rapoport <rppt@kernel.org>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Michal Hocko <mhocko@suse.com>
> > > Cc: Alistair Popple <apopple@nvidia.com>
> > > Cc: linux-mm@kvack.org
> > > Cc: linux-cxl@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Suggested-by: Alistair Popple <apopple@nvidia.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  include/linux/memremap.h |  1 +
> > >  mm/memremap.c            | 55 ++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 56 insertions(+)
> > > 
> > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > index 97fcffeb1c1e..88e1d4707296 100644
> > > --- a/include/linux/memremap.h
> > > +++ b/include/linux/memremap.h
> > > @@ -230,6 +230,7 @@ static inline bool is_fsdax_page(const struct page *page)
> > >  
> > >  #ifdef CONFIG_ZONE_DEVICE
> > >  void zone_device_page_init(struct page *page, unsigned int order);
> > > +void free_zone_device_folio_prepare(struct folio *folio);
> > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > index 39dc4bd190d0..375a61e18858 100644
> > > --- a/mm/memremap.c
> > > +++ b/mm/memremap.c
> > > @@ -413,6 +413,60 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
> > >  }
> > >  EXPORT_SYMBOL_GPL(get_dev_pagemap);
> > >  
> > > +/**
> > > + * free_zone_device_folio_prepare() - Prepare a ZONE_DEVICE folio for freeing.
> > > + * @folio: ZONE_DEVICE folio to prepare for release.
> > > + *
> > > + * ZONE_DEVICE pages/folios (e.g., device-private memory or fsdax-backed pages)
> > > + * can be compound. When freeing a compound ZONE_DEVICE folio, the tail pages
> > > + * must be restored to a sane ZONE_DEVICE state before they are released.
> > > + *
> > > + * This helper:
> > > + *   - Clears @folio->mapping and, for compound folios, clears each page's
> > > + *     compound-head state (ClearPageHead()/clear_compound_head()).
> > > + *   - Resets the compound order metadata (folio_reset_order()) and then
> > > + *     initializes each constituent page as a standalone ZONE_DEVICE folio:
> > > + *       * clears ->mapping
> > > + *       * restores ->pgmap (prep_compound_page() overwrites it)
> > > + *       * clears ->share (only relevant for fsdax; unused for device-private)
> > > + *
> > > + * If @folio is order-0, only the mapping is cleared and no further work is
> > > + * required.
> > > + */
> > > +void free_zone_device_folio_prepare(struct folio *folio)

I don't really like the naming here - we're not preparing a folio to be
freed, from the core-mm perspective the folio is already free. This is just
reinitialising the folio metadata ready for the driver to reuse it, which may
actually involve just recreating a compound folio.

So maybe zone_device_folio_reinitialise()? Or would it be possible to
roll this into a zone_device_folio_init() type function (similar to
zone_device_page_init()) that just deals with everything at allocation time?

> > > +{
> > > +	struct dev_pagemap *pgmap = page_pgmap(&folio->page);
> > > +	int order, i;
> > > +
> > > +	VM_WARN_ON_FOLIO(!folio_is_zone_device(folio), folio);
> > > +
> > > +	folio->mapping = NULL;
> > > +	order = folio_order(folio);
> > > +	if (!order)
> > > +		return;
> > > +
> > > +	folio_reset_order(folio);
> > > +
> > > +	for (i = 0; i < (1UL << order); i++) {
> > > +		struct page *page = folio_page(folio, i);
> > > +		struct folio *new_folio = (struct folio *)page;
> > > +
> > > +		ClearPageHead(page);
> > > +		clear_compound_head(page);
> > > +
> > > +		new_folio->mapping = NULL;
> > > +		/*
> > > +		 * Reset pgmap which was over-written by
> > > +		 * prep_compound_page().
> > > +		 */
> > > +		new_folio->pgmap = pgmap;
> > > +		new_folio->share = 0;	/* fsdax only, unused for device private */
> > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > 
> > Does calling the free_folio() callback on new_folio solve the issue you are facing, or is
> > that PMD_ORDER more frees than we'd like?
> > 
> 
> No, calling free_folio() more often doesn’t solve anything—in fact, that
> would make my implementation explode. I explained this in detail here [1]
> to Zi.
> 
> To recap [1], my memory allocator has no visibility into individual
> pages or folios; it is DRM Buddy layered on top of TTM BO. This design
> allows VRAM to be allocated or evicted for both traditional GPU
> allocations (GEMs) and SVM allocations.
> 
> Now, to recap the actual issue: if device folios are not split upon free
> and are later reallocated with a different order in
> zone_device_page_init, the implementation breaks. This problem is not
> specific to Xe—Nouveau happens to always allocate at the same order, so
> it works by coincidence. Reallocating at a different order is valid
> behavior and must be supported.

I agree it's probably by coincidence but it is a perfectly valid design to
always just (re)allocate at the same order and not worry about having to
reinitialise things to different orders.

 - Alistair

> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/697710/?series=159119&rev=3#comment_1282413
> 
> > > +	}
> > > +}
> > > +EXPORT_SYMBOL_GPL(free_zone_device_folio_prepare);
> > > +
> > >  void free_zone_device_folio(struct folio *folio)
> > >  {
> > >  	struct dev_pagemap *pgmap = folio->pgmap;
> > > @@ -454,6 +508,7 @@ void free_zone_device_folio(struct folio *folio)
> > >  	case MEMORY_DEVICE_COHERENT:
> > >  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
> > >  			break;
> > > +		free_zone_device_folio_prepare(folio);
> > >  		pgmap->ops->folio_free(folio, order);
> > >  		percpu_ref_put_many(&folio->pgmap->ref, nr);
> > >  		break;
> > 
> > Balbir
