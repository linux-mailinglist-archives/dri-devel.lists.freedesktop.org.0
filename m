Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BC8D0FF94
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 22:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB4310E28B;
	Sun, 11 Jan 2026 21:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lf+M+EcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BABD10E287;
 Sun, 11 Jan 2026 21:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768167471; x=1799703471;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Gi2EMWtjWruaPTfPfpE+BPwbe5IUgZv3q7vigzJCPAI=;
 b=Lf+M+EcJM2jv/4dnVuEjExVXpQ4pouFYC3vk05GLtDu0s15/RJ5fVSQA
 tbq7se0ZFqdaFVA0B8oIwVaf16Re9VHva1U4tTjS2yHX4BIdezotRWclo
 pQV2ke1UAIAXqVMCBHAeQz0EMMrnS7tG9ye2BPQgtp9NbxmGhYqX5dxS+
 rtm1tfOPuTTa5PGIsJ3D6g6QhljDtQ07VAKDwKGXSoEyspLhE1v8QTP1t
 siC3SHFEIT7rdJVa1zByzad0pHjSuSf//qMd3biFqzvfKd42fA3udg57U
 I5LBWD5lw501PEosWA86BzPgQw3LYm5CA1i6tH5CSxUxjTjnlqfb2OigM Q==;
X-CSE-ConnectionGUID: 1JMixIQATcigSGVy1eu9TA==
X-CSE-MsgGUID: XURMUsoWQ+WMfTTJZQmAVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69527185"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69527185"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 13:37:50 -0800
X-CSE-ConnectionGUID: 1Z/oa1M6TLWKeS2WN9zjpg==
X-CSE-MsgGUID: UBv+moe/RfmdmcjjTyKw9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="203946596"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 13:37:51 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 13:37:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 13:37:49 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 13:37:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QC9TsCwgsUghykAAkDbHGNbf9MTgu5fPQm5NBvAeU+zKn5WgYtnar8YV0t+iNAmK2pKEHgXkz6w+ZPKYcyWtaRFx793cHKoBxJzpShQbvBc4xMTrcCWWVTtqc0pyxYXaYe2I+KSjcSRCcPdIQT5IcVsrTy7/Bei9xfNQXU8oWc01tgbbhW8w5FYuhVCuZ50SeDvKtsrlqf3f4vLGZ/ACkWy7yFqbtQ4GHVRW5On4FoqgH4CuqxFG+WJq/BrHdeFmMtiKKecacMmoFMu9OcXXR4DGaOqr6mUfLDpQ6WmYPAMFICDy/jrEbtuDpKKqjKStdw2PUkCGiubN3eON08TJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELTrN+aj6o45rTKzUPG/dLccQYqq32/HHjqXGJVx5RQ=;
 b=iej4ikig11Oq6sMwAqB73EYJWu7z5keP0FXXVvtQE+PFS/4c13kxOaSlj7MYKa6QBJOprIHMTEPhr8Rc+qGgwQlLdqpdFTY/OX92rYjmJQyJUXKlcJHG5PIC1IibUOaCKigSPmsQv3cZTbf/tMiLVleZIBF49UyAJbJEOueBOJ/D3RlkhDB0rwvoXaiZXhzgGJM73yutIUWhlNsFB/fmEGln2wy/t/nA3Plyz8vBrc47YhokuKvqfkoSq4OjIol2RZahYnnicDYUcXHsM9g06GXOX51qnO367S8GVYHVheMpUlM2yLi+8xniwoaQs0cXuxKXdQOco+uZuaxhR2kQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 21:37:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Sun, 11 Jan 2026
 21:37:43 +0000
Date: Sun, 11 Jan 2026 13:37:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, <linux-mm@kvack.org>
Subject: Re: [PATCH v4 7/7] drm/pagemap: Enable THP support for GPU memory
 migration
Message-ID: <aWQYJYR3LXTgtYsg@lstrano-desk.jf.intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-8-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260111205820.830410-8-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9b8883-cf01-4a7f-e612-08de5159a778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+Pr7V6udIvg7/HX78z2XdAUg0yd1sAd+ExKcqMSBhYvJIm7Rw19N8sTw9E?=
 =?iso-8859-1?Q?/3kxaY92ZQ7zsD09aecpeNVJ0EBtaAi4DoMu7rE+a7V2zYCQ1X84Rd9EYR?=
 =?iso-8859-1?Q?c8nhe2cFvXcHAd6s8d4izxl+7+XeIKeJCaFEw4K9RIMw21wzrcPmtdDQHU?=
 =?iso-8859-1?Q?rFqOXX9vTusAO06HI4jwEo8XS+JwAPMFus6kP9dfbVVVNoj6C2NUA4iR2I?=
 =?iso-8859-1?Q?qHUPV6anROTvVEWVBm1t77sJmVsKDqELdqiNZDM2HDHMdlhTOyxrG7vyy8?=
 =?iso-8859-1?Q?7uVualCi/nK2FpbPpbfOhwUoAkV6qdVcbcXSC1psTzNMzz7pnr1/26qvVm?=
 =?iso-8859-1?Q?stVx2Qil9vTZpPnxPsUNyRaXnSp+6B6Yh6D/QqWn1ue7tA5HJZG6xGodRU?=
 =?iso-8859-1?Q?M+WCpe8NVzNlOi/rMuM2TDgyNsAz7F57AbjU1QASfIazSS5u20l5ho0J52?=
 =?iso-8859-1?Q?x8KOvAGfh43t1SmYze/uzjzYctYnEqQN9nTMmRuNxuZvGnLdnX70X9Zhu0?=
 =?iso-8859-1?Q?Gt2YtzHGUNYtTt/yzaCVolXHUVivX56Od/OTEwoTvDOQMc9fzkkCxiYU0j?=
 =?iso-8859-1?Q?yDirTqOE73IvzYHU/JktFEIWVCgYgmkgWBD2iUvvPVIa+znu1K4Isn8ekx?=
 =?iso-8859-1?Q?1GtL5FlDcFmHFvoodF3Tj1lbZOb4Q7FvqonGBYhbNrS5me/nPoyignyJ0s?=
 =?iso-8859-1?Q?EE6eXySCQylpJ3Z+Pecq2X81T25QTX4H1xX7JqpjsWktSbWDhnf91O6mR9?=
 =?iso-8859-1?Q?i8C1L5M3KjtloYGvhM0IFPPjBk50kqEcdMO+pD4qqR/Muhc7m16ktYX5Iu?=
 =?iso-8859-1?Q?ejzqaSsQ2TEXgV/GcTEKo/orelSiSd8VCjzUe3RacBPC7lDKbXatiyRQ65?=
 =?iso-8859-1?Q?oNXtEqb2fXeCBIyyPyp+dj7KGTPddZ6vJbw5VNySWGA8Lx6buX5Qih+lZt?=
 =?iso-8859-1?Q?bk08cnbIC2CZWlQO6xY2nv56T0zfPDbvBGhbspU84L1t4+JFRn0HOs3bSY?=
 =?iso-8859-1?Q?+/YSW5st5NUSo5ZWO5Les0Zu+RSm/NvIIMFav0wBUyHeq9C7rSsQUcSRvT?=
 =?iso-8859-1?Q?PjLa4kQhbBfEzH9pJU+ohCst3McXb/ovQiiMKL2vHjlWFvLQfnbweVzqFt?=
 =?iso-8859-1?Q?t5e+wNILbyAXOSHu7N+lAnsHRp9vEQ3MuLWHVs3u8opPSKEYSo/w+auvVw?=
 =?iso-8859-1?Q?y2zMSRenJWab8hn9DjKmYr3QTu8WMc51IqKHMiNniolBXytoH+7K29ekU+?=
 =?iso-8859-1?Q?UrgiJL2PLpFUiNzzyyjRlqDmHAz6kQWjrlztdtjTroLWcibysf2zJUqTQQ?=
 =?iso-8859-1?Q?6e0ssXjRbx/Pr2o+kbhVneNZelu2feMXz2Dt++ZLzM/SLBclF5PhqnMteN?=
 =?iso-8859-1?Q?AulcC/n9Wo4nCGv6b5QfoqrCKmd8fSwh9OmlNNRme/qwRy5geK3Fb3rGRG?=
 =?iso-8859-1?Q?e7aRE4mJq4zwJtVafkScG+HLtU8gWhALzicZ/0eQSr7IY7EkAP1ELYB30u?=
 =?iso-8859-1?Q?Fub9f+LLjsq9Qk7k2H0LkX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wobmI1m877yRzOH7WI46MLZ8RoE/C7GSeGzi8tk4Q1yS58fkbqPqKW9bWf?=
 =?iso-8859-1?Q?OcHg3N/5A1ADEjZwsDR4SkwfCzf15EdXlsrvzsUvRjoYwDS2mZ26j/w9of?=
 =?iso-8859-1?Q?RJH0eMntr4MziVWf7BrOqb95Ygwon4TH68hcQwhdvJpFyiSwDppdIPzAc5?=
 =?iso-8859-1?Q?4Z38p2JAW6eurjKKkWpubDEec9FxUowXVKcLqfXVyOMUBIxuNZHyY+RhUP?=
 =?iso-8859-1?Q?8R6LDZxzC93KqQtuGAkUb4ahQGobOa0Xybpqpbv3mQujU4NJ4ERbCadND8?=
 =?iso-8859-1?Q?rLv+cX/RStK2QNkmfFy+zHticZP+doAo2WJQWHuANnLQvoHsat/zcJEt/2?=
 =?iso-8859-1?Q?eJqEzPEhrBtqO2lv7WrDE54fopLSttWNjovENcS0HZDjjic0LCCs7w+qrt?=
 =?iso-8859-1?Q?PTRNC8AaGp+NeAoCIGBVFypcJ7XfCjWvmA8PVIwvQifqQFii9M0mWEL3Uu?=
 =?iso-8859-1?Q?ssZPGqSrUCMhIdJCuPgK1EWdezANWR4dHIf8XzbqokL+hLTZIRBk/S9vlw?=
 =?iso-8859-1?Q?kmu7IEmh0lZyhzCgOkErenmb0te7AXvuMHpTpP9w2wTYXlNIPR7iDOIgjV?=
 =?iso-8859-1?Q?BQIfzVoonB1cx+ZCm8USv2cEz6GOpK5ea8tnUqOpRpVbS1m9YMRQGot95i?=
 =?iso-8859-1?Q?Np8ugun7dfbnxcTGBUIzxVLnw40hA498F5dEGdrBBlvPv4x5ieY8HjRSmw?=
 =?iso-8859-1?Q?+JGb95b++lm/c5HFaO0786eiSF/TcgC1pYh2JIGipbzED21KPQb34tdiI+?=
 =?iso-8859-1?Q?aVL28kEHPZHgF+2xy9KW2r15MCXZOJRCGKkeMvMlm2eJbpBvIv75np4yLP?=
 =?iso-8859-1?Q?AUYD+akMR1J9OSey42Bslxzo1uUkRbpVIXZNYpFpicN4Cml5INCuGnuK+k?=
 =?iso-8859-1?Q?FqT8yMh5oGaRIK7xv9O9pgYtwRNYA+kDzLla0vWAiOmX0bBXc4ZXaaTPeR?=
 =?iso-8859-1?Q?hsIYFS5awzXcqCDDMJLmW7U9tfXhMFC0ij7nWlQHpggNyH8j5mDDa62k4h?=
 =?iso-8859-1?Q?pq5KIHCLToUa7pGs42a8gVdg0BIEJEz/vudIyjX5KXlVtW6A/fvfUMSz9r?=
 =?iso-8859-1?Q?Vaswmq8KknQnLB74P3CzI6a4xSiUhnHjUMBq2Vl8Abj2R7W2Ycno+0d8Hf?=
 =?iso-8859-1?Q?BAiO++ZmNS7LfWKgPIHdIeupOY0ppzQFXnDG7XiNF/or/dzc88HCs8JITS?=
 =?iso-8859-1?Q?0belgVPie26gA2Y7fIaNjdnwSZc8wT8XJvHQds8X4WvKWz4eGIwD9GVLKr?=
 =?iso-8859-1?Q?7VYuOtlEouzxLRH1ckfkhcN1h0A5ScguxIF9C5yNTFRbMT0AXbmg+OlHPV?=
 =?iso-8859-1?Q?f9O6qNJNgxXIdCCZu+76Bp4xhc7bhIGNOISMGVExVnzP0fVWxn+1artpO3?=
 =?iso-8859-1?Q?AjJ2ckZeQ2Oa/YoqaSADuOEEYN0JIE+ZPEKrhX1D8xHig0OkKQlyNZRliQ?=
 =?iso-8859-1?Q?ftwAe6iiwr4EjDx8j2CkyhfTTuLZgc+wVqBaJ8M6NSB8LkC9MLS2AH4eWF?=
 =?iso-8859-1?Q?rmYMZGKcYafOLFLGyP+v2vmzZZ0yrKogrmHJ5i7kGCNKRx8s0TH1Tl1vRX?=
 =?iso-8859-1?Q?B2whtVKcZhl3J6XwXcH71RVK9lcMfdjERw7u2wrEaLFUzze5OcpI76P4m8?=
 =?iso-8859-1?Q?dMk5gidMtcTjzrEHyNnUeZ3R+OKyOH7EeBHPqaC8BFqH9a1Ekkqy1RhNnN?=
 =?iso-8859-1?Q?2x0N972S8SrxBVipNMBXEnqhLy8Elp4ZK2A57sjSVN8qVWhvCVKof87A3i?=
 =?iso-8859-1?Q?Igc7+6W+0MGH4A+b+CTpnHzt3K50w6sA0Y/oPZHK6k/wFXDLF5ML9yoIUo?=
 =?iso-8859-1?Q?hhcEzXKiSQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9b8883-cf01-4a7f-e612-08de5159a778
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 21:37:43.8902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mB1tYdPB0nwnbpUAA5rO21g5xa0SK/MGI2oU0r5tHnlUu5R1Sqbav+4BzYFq0SCF7Peoe9IpcZIhtIYAEoSBww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
X-OriginatorOrg: intel.com
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

On Sun, Jan 11, 2026 at 09:55:46PM +0100, Francois Dugast wrote:
> This enables support for Transparent Huge Pages (THP) for device pages by
> using MIGRATE_VMA_SELECT_COMPOUND during migration. It removes the need to
> split folios and loop multiple times over all pages to perform required
> operations at page level. Instead, we rely on newly introduced support for
> higher orders in drm_pagemap and folio-level API.
> 
> In Xe, this drastically improves performance when using SVM. The GT stats
> below collected after a 2MB page fault show overall servicing is more than
> 7 times faster, and thanks to reduced CPU overhead the time spent on the
> actual copy goes from 23% without THP to 80% with THP:
> 
> Without THP:
> 
>     svm_2M_pagefault_us: 966
>     svm_2M_migrate_us: 942
>     svm_2M_device_copy_us: 223
>     svm_2M_get_pages_us: 9
>     svm_2M_bind_us: 10
> 
> With THP:
> 
>     svm_2M_pagefault_us: 132
>     svm_2M_migrate_us: 128
>     svm_2M_device_copy_us: 106
>     svm_2M_get_pages_us: 1
>     svm_2M_bind_us: 2
> 
> v2:
> - Fix one occurrence of drm_pagemap_get_devmem_page() (Matthew Brost)
> 
> v3:
> - Remove migrate_device_split_page() and folio_split_lock, instead rely on
>   free_zone_device_folio() to split folios before freeing (Matthew Brost)
> - Assert folio order is HPAGE_PMD_ORDER (Matthew Brost)
> - Always use folio_set_zone_device_data() in split (Matthew Brost)
> 
> v4:
> - Warn on compound device page, s/continue/goto next/ (Matthew Brost)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: linux-mm@kvack.org
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 77 ++++++++++++++++++++++++++++++-----
>  1 file changed, 67 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index af2c8f4da00e..bd2c9af51564 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -200,16 +200,20 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
>  /**
>   * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
>   * @page: Pointer to the page
> + * @order: Order
>   * @zdd: Pointer to the GPU SVM zone device data
>   *
>   * This function associates the given page with the specified GPU SVM zone
>   * device data and initializes it for zone device usage.
>   */
>  static void drm_pagemap_get_devmem_page(struct page *page,
> +					unsigned int order,
>  					struct drm_pagemap_zdd *zdd)
>  {
> -	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	struct folio *folio = page_folio(page);
> +
> +	folio_set_zone_device_data(folio, drm_pagemap_zdd_get(zdd));
> +	zone_device_page_init(page, order);
>  }
>  
>  /**
> @@ -534,7 +538,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		 * rare and only occur when the madvise attributes of memory are
>  		 * changed or atomics are being used.
>  		 */
> -		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> +				  MIGRATE_VMA_SELECT_COMPOUND,
>  	};
>  	unsigned long i, npages = npages_in_range(start, end);
>  	unsigned long own_pages = 0, migrated_pages = 0;
> @@ -640,11 +645,16 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  
>  	own_pages = 0;
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
> +		unsigned long j;
>  		struct page *page = pfn_to_page(migrate.dst[i]);
>  		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> -		cur.start = i;
> +		unsigned int order = 0;
> +
> +		drm_WARN_ONCE(dpagemap->drm, folio_order(page_folio(page)),
> +			      "Unexpected compound device page found\n");
>  
> +		cur.start = i;
>  		pages[i] = NULL;
>  		if (src_page && is_device_private_page(src_page)) {
>  			struct drm_pagemap_zdd *src_zdd =
> @@ -654,7 +664,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  			    !mdetails->can_migrate_same_pagemap) {
>  				migrate.dst[i] = 0;
>  				own_pages++;
> -				continue;
> +				goto next;
>  			}
>  			if (mdetails->source_peer_migrates) {
>  				cur.dpagemap = src_zdd->dpagemap;
> @@ -670,7 +680,20 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  			pages[i] = page;
>  		}
>  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> -		drm_pagemap_get_devmem_page(page, zdd);
> +
> +		if (migrate.src[i] & MIGRATE_PFN_COMPOUND) {
> +			drm_WARN_ONCE(dpagemap->drm, src_page &&
> +				      folio_order(page_folio(src_page)) != HPAGE_PMD_ORDER,
> +				      "Unexpected folio order\n");
> +
> +			order = HPAGE_PMD_ORDER;
> +			migrate.dst[i] |= MIGRATE_PFN_COMPOUND;
> +
> +			for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
> +				migrate.dst[i + j] = 0;
> +		}
> +
> +		drm_pagemap_get_devmem_page(page, order, zdd);
>  
>  		/* If we switched the migrating drm_pagemap, migrate previous pages now */
>  		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> @@ -680,7 +703,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  			npages = i + 1;
>  			goto err_finalize;
>  		}
> +
> +next:
> +		i += NR_PAGES(order);
>  	}
> +
>  	cur.start = npages;
>  	cur.ops = NULL; /* Force migration */
>  	err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> @@ -789,6 +816,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  		page = folio_page(folio, 0);
>  		mpfn[i] = migrate_pfn(page_to_pfn(page));
>  
> +		if (order)
> +			mpfn[i] |= MIGRATE_PFN_COMPOUND;
>  next:
>  		if (page)
>  			addr += page_size(page);
> @@ -1044,8 +1073,15 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (err)
>  		goto err_finalize;
>  
> -	for (i = 0; i < npages; ++i)
> +	for (i = 0; i < npages;) {
> +		unsigned int order = 0;
> +
>  		pages[i] = migrate_pfn_to_page(src[i]);
> +		if (pages[i])
> +			order = folio_order(page_folio(pages[i]));
> +
> +		i += NR_PAGES(order);
> +	}
>  
>  	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
> @@ -1098,7 +1134,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  		.vma		= vas,
>  		.pgmap_owner	= page_pgmap(page)->owner,
>  		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> -		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +				  MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> +				  MIGRATE_VMA_SELECT_COMPOUND,
>  		.fault_page	= page,
>  	};
>  	struct drm_pagemap_migrate_details mdetails = {};
> @@ -1164,8 +1201,15 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (err)
>  		goto err_finalize;
>  
> -	for (i = 0; i < npages; ++i)
> +	for (i = 0; i < npages;) {
> +		unsigned int order = 0;
> +
>  		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> +		if (pages[i])
> +			order = folio_order(page_folio(pages[i]));
> +
> +		i += NR_PAGES(order);
> +	}
>  
>  	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
> @@ -1224,9 +1268,22 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>  	return err ? VM_FAULT_SIGBUS : 0;
>  }
>  
> +static void drm_pagemap_folio_split(struct folio *orig_folio, struct folio *new_folio)
> +{
> +	struct drm_pagemap_zdd *zdd;
> +
> +	if (!new_folio)
> +		return;
> +
> +	new_folio->pgmap = orig_folio->pgmap;
> +	zdd = folio_zone_device_data(orig_folio);
> +	folio_set_zone_device_data(new_folio, drm_pagemap_zdd_get(zdd));
> +}
> +
>  static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
>  	.folio_free = drm_pagemap_folio_free,
>  	.migrate_to_ram = drm_pagemap_migrate_to_ram,
> +	.folio_split = drm_pagemap_folio_split,
>  };
>  
>  /**
> -- 
> 2.43.0
> 
