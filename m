Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8AAC44FE
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 23:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207D710E395;
	Mon, 26 May 2025 21:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBADtJGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A24C10E395;
 Mon, 26 May 2025 21:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748296454; x=1779832454;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IiNpM+tv7JPZJM3z8PpFhT45bnztdzj3w4faH1IMa6k=;
 b=DBADtJGSd6HqQgw6Uu3UvK713l+e/UxkCQV6KtEue/CSisuJ9aP5i7Qh
 cRhexohG+wpyBF77b2DHGTwqt5SsfupEIoW8SNhT3uyVgZT0ffdJRlGcm
 pJttx3TjvIkL1FKWaISxGPMGYTM9vEeAGReyCeIHoDjp+dAHoQXaKiOCa
 sGhxS5/uvrhgBgRVQIFmyvo9bGDg3w+TFK6ZYo69pMmDzCLI7pgpfFJAx
 AsVgQxgeqydu2E61Vg+5SasgYo/26DZowUryIL6bgZvvL0mnDlUugv1aV
 wXjzqYsoBF4NXpqv3N8nWRK39HtO/DAJ0z/gC1H/Bo+E1lBqrQm6YJeAv Q==;
X-CSE-ConnectionGUID: E2nJCDT6TMO7jHipNP+TJQ==
X-CSE-MsgGUID: C93ia49STumDs2I/zD6SfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="54066178"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="54066178"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:54:13 -0700
X-CSE-ConnectionGUID: 8znRBDnSSl2pTVbY7Mgxsw==
X-CSE-MsgGUID: 0jyBxhvLSSWvoYfwIgKorw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="179706579"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:54:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 14:54:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 14:54:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.41)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 14:54:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHdom+q/KCPdm5KfzNs+LLKBlvxD6JLZqClU7gHb+NvfEJaD6y+DurgBFhB6jGXw6wqWJ333vPxPBa7m3HVlwsfjuPF6GV8QJ8cX8xY5BEw2fWRi5057HAj5iiPyk+27y9NQl+1p+cv8WDo6aGSEMhunQAr66VLJKnkvGjrGYDKnFExJAp4fb5KdSdGrld4xkkx7fHDA+itxHdoRYcytrSOuU7bSWENGYHLwu3HTOPQqu3l+n/0l9axpew4ZADYqH6UdneaPBbB6FbdXljCymLZSpwxI+hoUL8hnGUKl3G69M6ULH1CDRDlWn16yRxWarLpWcQMhhI2VOfIdgeZ0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzASw//9A/WFFkcuJvyF+wEr2//RDXal5ZBPUkijDZI=;
 b=TFRyH+FTX+0+aKejGq/LrUo3RZRmx7cyJQYYDjv30vRVWjvzGfmRvfhHlVom2KNwmt8hTP3AMnfGcW1evy9/B6j7Jl01nNp/H7lkWGvDvCJnhzOeFJDqowtoiy9zGTGXqSZ8Rc3ujO9q/puGZO/Q/0IH2f6z+19YQN3ZQsYNNKVJ9YzhBVvG6PdRkiF+3MopKUowDEQdTm2IOT/JP1BgRUovWLMeaD44cO3+oIVpTlaMNeE9L7//qTzsMdpx107nsrLb5G7/8yktBJZ/PKzmb9mTekYEtgBcw5fOvGNRJ8u4LPbCdS/AQqi6TtUJI9VqUlxEZufR9rZ3SCFFxNZUIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 21:54:09 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 21:54:09 +0000
Date: Mon, 26 May 2025 23:54:06 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v7 5/6] PCI: Allow drivers to control VF BAR size
Message-ID: <75wlttxlp3xno2j5xmt5dk7vxnpmowte2r5wtmla5uksmpzx45@3af6xcmzdyje>
References: <20250402141122.2818478-1-michal.winiarski@intel.com>
 <20250402141122.2818478-6-michal.winiarski@intel.com>
 <14a7c29e-31b9-2954-9142-0d1c49988b07@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14a7c29e-31b9-2954-9142-0d1c49988b07@linux.intel.com>
X-ClientProxiedBy: VE1PR08CA0015.eurprd08.prod.outlook.com
 (2603:10a6:803:104::28) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH3PPF4E874A00C:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbed217-d7ef-4e3a-8a57-08dd9c9fd805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWxlMzQ5UGh1TWZMWGQ3cm1tNmllbGVQb0RyNEI4NHhwdmVXME9xcUk2UFdZ?=
 =?utf-8?B?bzBscHByQTNKL1BHaUpIbHFYMXVGcUhTaDZJVDZBSGxlWVJPL0VLNDZuWCtP?=
 =?utf-8?B?WWQ0UWhBcXNDTEIxSEkxNTE2b2daMlB5dnl2aFpMRitCRzgvM3pkbm40VEsz?=
 =?utf-8?B?a2xwdVRSQmVlNFJuSStkWUVmR0JncTVvQXlIS00yMzZqdU12Wk01ZXNYbkNF?=
 =?utf-8?B?Q0dGeXFBQXViVkNEQnJpdTU2Yi8rVytuOVJhMlZ4Z3BRdzRjdCtFNitGa0Zs?=
 =?utf-8?B?ZTVZZmZ4aTdDdTJ3TnlvZ1hhU2o1bXNPMVVZS3pTMFVqcjFWVy9KeTQ1QWRX?=
 =?utf-8?B?UFR3TEkrQWdGZWxhOE94WjN2S0FLR1B1dUdCeWZ6ZmpCUkcrZ010bFBWNmpm?=
 =?utf-8?B?aXJRd2wvbjBwQW9FZ083eEh5RFVTVzJQSlNLY2dFb2NMcXRkMzVoYkFsMHMw?=
 =?utf-8?B?UFNwMzJVSXFuejRBelNWWWdmc3pBR1d5TWx6ZDQwaEZmSWtjVk5ubWpWVFEr?=
 =?utf-8?B?bTgvK2F3NDR3TVVPU3lFTTM5elpQUzRUME05dUlvTEVOUkpWZWNlajBRTWZX?=
 =?utf-8?B?eW1JSTZQZXdMUFJWQjEySkM0aXY4TXJpVlI4WVh0YzlJcnRWcjFMZE4yV0dn?=
 =?utf-8?B?M0ZwM0ZPU0wvQjhsSnB0YytvS0lXNlAvZFJCM09SMzdPRTcxN2MzdDUwRXVU?=
 =?utf-8?B?ZkgvTGZOUHE2U3dJbnB6TkNVL1cvWjBvVis2TFJEYXA3NzgxU1FIZ3hxMHdN?=
 =?utf-8?B?MFU4SUNNNlZYUDU5dmNqUkpobGpZY24rVFAybDNtcm5pSTJIS09jQm4xZXRU?=
 =?utf-8?B?YmtCWnRUVmxvZGhGTzlnUWcxVzVmajVPU3gyUzlyNXlRM09tNitxMjdhUHdU?=
 =?utf-8?B?a2g1UWdJZ0srLzd5U2VzUDM4OUhDVUt2TTlZczB0NTIxdi90Mm54akJjeENF?=
 =?utf-8?B?czRUYllBYllIT0Z1ZG5WWGpNbHN2VkhGRVY0N0p6Mi95THczMFoyUmlIdHA2?=
 =?utf-8?B?dUtFTG5scW4rK1dJMGRhdXR4aVQ0SWZmcnVXSEZYYnRRVVNoK3RDKzBPZ3Vy?=
 =?utf-8?B?NncvVElneTZmNEpvUk1HT3NMeXJaazZBRUNLK1d4bFdVZndLNHVvKytyK3Vq?=
 =?utf-8?B?bHBFdHAzNXV3eUFydjkwWi9PTWU1a1gxSXVHdTJrMGRmM2d3NnhkOFErU2la?=
 =?utf-8?B?ZGgvWVVHbXBzOUR5MkxmOFptRUR3YmNPQjBqUUtXVGtvNlo3ODQ2QzNWNzU4?=
 =?utf-8?B?LzIwbG5IQVQ5RWtEeXMvanY0T0owWERqanpvZWxETG0vckdWNWxKNHNjQUYz?=
 =?utf-8?B?RjczSzB6cU5DVHFYdlRGS2wvVGhxaHZJdlNBVExQbWlCWnZYVGtJNjI1bXpq?=
 =?utf-8?B?UVBSdm1MWGJsbE5wVG5oS1d1ZUNDUGg0Tlo3Nm9jVng2R3lQdXR4SUczT3FX?=
 =?utf-8?B?Slp1bGZza3VYRXZPMVBpekNUNHEyN3JhaVdVdTdNZklnbnA4Zm9ERkNPZGdt?=
 =?utf-8?B?VlRBa0xiNjZMZHlWRU5Fa1U3WUkvQTlud2FWUXVuSlF4RG1aRllNbndmL2k3?=
 =?utf-8?B?STI1cVd3ak5LVWtZWkF1OHpqN0VaaDB1VUlDOGRtZlVaVEdZVnN0bXg2cnU5?=
 =?utf-8?B?bkR6c004dWViZldEN0grQVFGTEx2Zkc2SytmYXhvSzlVOVhFQ3lhZ1VMR1g1?=
 =?utf-8?B?NmlZYlhOVjduQTVYU3RCZlhVR1A0YkYvbDVLc3M3OWhmKzJucytTMkhuVDNq?=
 =?utf-8?B?ZU5XdWdQN3JKSUhJcERpMnZjSC9TVkthYXk5dlAyM2VJYkFLR21McEhkMFlh?=
 =?utf-8?B?MTFHTndMSDhkSnRBcW1HaEVRQXdOaW5RVFd3c2l2VXp0OWxmTCtBVHcveEZh?=
 =?utf-8?B?U0x2dGdEamlMalUxeGZPQ3EwR3JmNnVQeEV1OVgyTlEyS0VlenFiWkV6VHhj?=
 =?utf-8?Q?GkRIKxjnEDk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pNVFl6Zk1KeXlyamNKbjc4TUVZQ2pic0cwTGEzQTU5aStxTWUyNHpoaDlT?=
 =?utf-8?B?cjBVVzBEbFBwQUdNdzNWdStwMjVqeHNOQnduQm9xdkJaR3o5VTF4aEdySExS?=
 =?utf-8?B?d1lVQUYzcjQzeEYxMlhDQ09kcXpFZU5maEVmbUhRUWxWM1hCc09Tam9WV1gw?=
 =?utf-8?B?QzlFWHdnU24rSHpSQkxuREV4Uk1HdStxZytxUHZ4K09lNEhyeUgyaWFCTnl5?=
 =?utf-8?B?RitxYlJYSHZRWUNObUNoUGVvbHd1eTMyV1NmMnRZRzRTcHNieHRzVWsvNDhY?=
 =?utf-8?B?MDV4MUVnL3U3blJiZVJ1cTlTditoeXA3UGtWRCtaamFDUmVjbmxuZThhSzNV?=
 =?utf-8?B?ZEVUNldPVXhiaUpKTzJSN1hlZENKOEErZWtvYXlPL1c2bEsrV00yL3gzVlI0?=
 =?utf-8?B?dERuelRNaDNoNWI4OVZwd2pId0V2UkJrOXh3bFFlTzRKekF3SVFteDJvUWdX?=
 =?utf-8?B?T3hBZWpIU3NvNGNuOTdaeGJtSHhFMk5rdnVRZG9zaDlpNWdyTnFMbWt4bm80?=
 =?utf-8?B?UDVraW5JRzg2eW9XZzBBVVByVE12ZXJMODFoUW1zYWU5Z0xlUFI1Zk5pUVBC?=
 =?utf-8?B?N3lESG1OSTJJUEdHRmRhSDdhVUYxVXhIS3l2OVk2eGFUSk1WS3ZVa2t1ODNG?=
 =?utf-8?B?YjlXOVJzM3dlUHpIVFA1NE1qTU5uN2ROTGQvenNyNXhhYlgvNjZMRTdvMytv?=
 =?utf-8?B?MktUWW52SUlBek5ES0g3RTNjYTVNa2IzOEhObHhVWmZlYVZ1SUxnSVNYTGJF?=
 =?utf-8?B?aEVWTlAySzE3bFEvaUpTVk5PNDlpdWhxVTdRQ2VaOG9hSjlDUzl3cUYrT2dJ?=
 =?utf-8?B?ZXdVWmV6Y0xWS1o3UU5IakFsN3VRZTdHRTdWRE1PR2x5eXkwTzNET2JiM1Q2?=
 =?utf-8?B?N2VoWGhBa1VpOU9vSFo5VmFpVVV4OFQwbkpJUVlRU3I0S0pDbWR1dGxTdGxl?=
 =?utf-8?B?ZG85NmZndithS3o4SVlsQ1B0b2FWSWVtNDJ6VzlxMWE3ODA3MHgvdEVQUmhZ?=
 =?utf-8?B?Sk5qVkxER0xVb2xORnVnNVJoWXhXL0k0K1VvVWhEdkFzOEI1KzltNnd1QkFB?=
 =?utf-8?B?aFczd2ltUFdZTEx0WXNZdHY1N1dQVytmVkJoUmJGRDZnc0hNbU9aeTFmZDgw?=
 =?utf-8?B?aURPUUhWcjV2VVFBOUl1N3NzNC9PRzY2SS9PTFU4VVVaZVdob2lxaDBLT1l2?=
 =?utf-8?B?dit2ZlFhdkV4a041eWJ4UGpGdkRPbnYxdXEvM2hlTjUzcE1UTUlZeHE2UWl2?=
 =?utf-8?B?NjVrbU9mRlhVL1JDSk1XaFQ3LzYxaGJ1VnQrM2NVemNXNkljKzdpakdXVTU4?=
 =?utf-8?B?Mkp1YmtOUUJJYVBCei93YTZ2QWxzRmZkMlJrWXVtQzQxK2VCRExCRVRNLzJZ?=
 =?utf-8?B?cEx1SFZBMWl3UkVyRmdSTUl4K1YwK0pTeVNuRU1GalZBOUxKemlVa0VMbjJr?=
 =?utf-8?B?NmwxV1NSSzdEZlg1cWhsM1lQeHk0c0FNcXR5cVpxWm9OMUIrWFZsN0NvYVFH?=
 =?utf-8?B?YlYwRjBpZThQa0NjTEVMZEFkcjhFN1ZYNXpMMVREQXBROXFvZ3FRQUdDeVZy?=
 =?utf-8?B?SEhXTWxFSDl0MFRUdFY3QjJON2NkL1RMbFRudzFFenZGcFA0Y3A1RVljekhH?=
 =?utf-8?B?YUdCbFlISU9STVZ1bktmRU0xWnVmbWtpblVaWE9GVVJzQUh0Ly91WjhoUWdO?=
 =?utf-8?B?ZlR5bC91ZzRmb3ZocTRwSHJGekkvSTdKdEVZUDNtMzgvSTN2blkrMHRqMW0y?=
 =?utf-8?B?OE93ZS9ZQWtRUXNYUFVkQTNuZDd2anRaSDZwSDlpcmhoTWJrTmFFVjNOSjVT?=
 =?utf-8?B?VEUrVmtReE8wZE81Nmk3TGpHNnlHak96ZkE4cHBxSDAxaW1DcG1Mdlc0MExM?=
 =?utf-8?B?MU1zbU9oaE10WFZhMHljdzlCNHh5ZmIvSVpXQnliREtTanh5YU5vYTRGTFFh?=
 =?utf-8?B?TTc0VFg1TDdDYldrdXNtTm9ZK1R3SVZGdnk0azR2YXJjY1NpZ2xlVXY4OGND?=
 =?utf-8?B?R2p4NXRsWFVZbVRKK0MyaEh3VmxIMXJSTjFxY2hFKzJ4V2pKNVkzY2hLdjdr?=
 =?utf-8?B?ckJMVGVCQ1g0ZEJwajlNbHl3b1MwcnZQZDlOdDFXaG9FbjEzSFZydU5uVlR2?=
 =?utf-8?B?MlBKd3FYMXNtd2kyektnR3huZ2NhaEhtbUhJWTE1RWVuOGh0RUZtc2Q1SzRy?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbed217-d7ef-4e3a-8a57-08dd9c9fd805
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 21:54:09.5937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmN8JjLlJ2NBRSxq/CRBiLWJwBOdsXlslrMUAivLorStU6xRa4IMvu3tjyNh4xdvfLxkRp+S/jwe0uMq77auHdElsH1XIKvBzkNRqB2UI9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4E874A00C
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

On Thu, Apr 03, 2025 at 01:20:58PM +0300, Ilpo Järvinen wrote:
> On Wed, 2 Apr 2025, Michał Winiarski wrote:
> 
> > Drivers could leverage the fact that the VF BAR MMIO reservation is
> > created for total number of VFs supported by the device by resizing the
> > BAR to larger size when smaller number of VFs is enabled.
> > 
> > Add a pci_iov_vf_bar_set_size() function to control the size and a
> > pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
> > allow up to num_vfs to be successfully enabled with the current
> > underlying reservation size.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/pci/iov.c   | 69 +++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/pci.h |  6 ++++
> >  2 files changed, 75 insertions(+)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index 2fafbd6a998f0..8a62049b56b41 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -1313,3 +1313,72 @@ int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn)
> >  	return nr_virtfn;
> >  }
> >  EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
> > +
> > +/**
> > + * pci_iov_vf_bar_set_size - set a new size for a VF BAR
> > + * @dev: the PCI device
> > + * @resno: the resource number
> > + * @size: new size as defined in the spec (0=1MB, 31=128TB)
> > + *
> > + * Set the new size of a VF BAR that supports VF resizable BAR capability.
> > + * Unlike pci_resize_resource(), this does not cause the resource that
> > + * reserves the MMIO space (originally up to total_VFs) to be resized, which
> > + * means that following calls to pci_enable_sriov() can fail if the resources
> > + * no longer fit.
> > + *
> > + * Return: 0 on success, or negative on failure.
> > + */
> > +int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
> > +{
> > +	int ret;
> > +	u32 sizes;

Hi,
I thought this series was already ready to be merged, but now I just
went back through the review comments for v7 and realized that I missed
this email and never applied the changes you requested.
Sorry for the delay.

> Please reverse the order of these variables.

Ok.

> 
> > +
> > +	if (!pci_resource_is_iov(resno))
> > +		return -EINVAL;
> > +
> > +	if (pci_iov_is_memory_decoding_enabled(dev))
> > +		return -EBUSY;
> > +
> > +	sizes = pci_rebar_get_possible_sizes(dev, resno);
> > +	if (!sizes)
> > +		return -ENOTSUPP;
> > +
> > +	if (!(sizes & BIT(size)))
> 
> Add include for BIT().
> 
> Although adding a helper like this would be helpful for multiple callers:
> 
> @@ -3780,6 +3780,88 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
>  }
>  EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
>  
> +/**
> + * pci_rebar_size_supported - check if size is supported for a resizable BAR
> + * @pdev: PCI device
> + * @bar: BAR to check
> + * @size: size as defined in the spec (0=1MB, 31=128TB)
> + *
> + * Return: %0 if @size is supported for @bar,
> + *        %-EINVAL if @size is not supported,
> + *        %-ENOTSUPP if @bar is not resizable.
> + */
> +int pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size)
> +{
> +       u64 sizes;
> +
> +       sizes = pci_rebar_get_possible_sizes(pdev, bar);
> +       if (!sizes)
> +               return -ENOTSUPP;
> +
> +       return BIT(size) & sizes ? 0 : -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(pci_rebar_size_supported);
> 
> (Yes, I've some rebar helpers pending so this is extract from that.)

Added include for BIT(). I'll wait for your series with helpers :)

> 
> > +		return -EINVAL;
> > +
> > +	ret = pci_rebar_set_size(dev, resno, size);
> > +	if (ret)
> > +		return ret;
> > +
> > +	pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
> > +
> > +/**
> > + * pci_iov_vf_bar_get_sizes - get VF BAR sizes allowing to create up to num_vfs
> > + * @dev: the PCI device
> > + * @resno: the resource number
> > + * @num_vfs: number of VFs
> > + *
> > + * Get the sizes of a VF resizable BAR that can accommodate @num_vfs within
> > + * the currently assigned size of the resource @resno.
> > + *
> > + * Return: A bitmask of sizes in format defined in the spec (bit 0=1MB,
> > + * bit 31=128TB).
> > + */
> > +u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
> > +{
> > +	resource_size_t vf_len = pci_resource_len(dev, resno);
> > +	u32 sizes;
> > +
> > +	if (!num_vfs)
> > +		return 0;
> > +
> > +	do_div(vf_len, num_vfs);
> 
> Add include for do_div().

Ok.

> 
> > +	sizes = (roundup_pow_of_two(vf_len + 1) - 1) >> ilog2(SZ_1M);
> 
> Doesn't resource_size() already do that + 1 so why is a second one needed 
> here?

It's not about resource_size() doing + 1 for the resource length, it's
needed because roundup_pow_of_two() is not rounding up to the next power
of two if the input is already a power of two. So we need to add 1 to
ensure that we get the next size up to make the math with bitmap
representing BAR sizes work correctly.

> 
> Add include for ilog() and SZ_*.

Ok.

Thanks,
-Michał

> 
> > +
> > +	return sizes & pci_rebar_get_possible_sizes(dev, resno);
> > +}
> > +EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 0e8e3fd77e967..c8708f3749757 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -2389,6 +2389,8 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
> >  int pci_sriov_get_totalvfs(struct pci_dev *dev);
> >  int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
> >  resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
> > +int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size);
> > +u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs);
> >  void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
> >  
> >  /* Arch may override these (weak) */
> > @@ -2441,6 +2443,10 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
> >  #define pci_sriov_configure_simple	NULL
> >  static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
> >  { return 0; }
> > +static inline int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
> > +{ return -ENODEV; }
> > +static inline u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
> > +{ return 0; }
> >  static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
> >  #endif
> >  
> > 
> 
> -- 
>  i.

