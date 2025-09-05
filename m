Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F29B456DF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 13:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3DC10EB93;
	Fri,  5 Sep 2025 11:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JYnfrlxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AA610E2B5;
 Fri,  5 Sep 2025 11:51:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBCdKOzVR3Nvib1uzlXb1VJ0jG8w7NxeUu5AmKphj+8MoztYQ+cV8uwJ60BEX8nsOsy/oeyCLTWWHuoVYi2ryuW4gsPwbV6Zbgxmy4rIEy93LV7OH91M792NeQ/HdIsoQu4nbg8iIVjNpObB+gauZSW9C0M7tYoamtZz5ORwhzGxi+5Nwc4eTLG6fbidhbugf+KOH1PZBegWWOSI6Tja7tt8IHifrOmSOnU5Rs7eg0ZTNdiI9lcsJGzm+AZsO3+MDDGlsRaU88D/i/fRf455Mw3xgHXbP/4f82VGDBSdn2VlNQvHxpqQiWALhd64pUnDLMzGPOWOcepGXcZjSgO2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQ6hbBnNPhmgwHZD8bqj2Iuh8dOxpixJLqn6Eawjw50=;
 b=vIVpl+7AZhHAJE2RzSwFA2G5YKhRUwxq55qEq4LNqWei0OfrrWolgry6Hkwo/gyVTAx+uRmD4OHuWfzcmWLhPQl2txLFTjLRfwQaP1CXkHxQPlVLc48rkeNwIYD36a6HFNTcyK7KK1a4Jm+yT3f3qUBZVvUTO5yUmB+ZH9wrCmEiRXvr0wEaGyzYeNoZiWzkgEnHNamiflO46UOwmvGvbkry+sqSDzBcPLlm/eUBFDsBwRzILO48lTNFYSy70OkSNzEVToknXWw+btG1+b5/FEqNOwW/WKgfxnbj0YOiJR2czfo5bAEQMhAOHj4VX2IezCtS6iflXnA2Rovww0lxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ6hbBnNPhmgwHZD8bqj2Iuh8dOxpixJLqn6Eawjw50=;
 b=JYnfrlxvILZW6NhD8RVV926rjViedO69uG/CTwH5bbrPpjLs693Q6YammpAI2CxbLO1uEZlKy4clBhhTnILUH9Qi8qYpDDUkawZ5Q9syP+90NWOX94Qq6TnnLs8nbB1B1h5mTw4XbCR4T9OH0+uhJuDV6oyNhUosBny75sCNACYKt3tEwEf6Zyb1kJpb0TsePGxwd6spnU9N0WZdXzo20cghVofRxvDTVJQO4prqLnUuXOp8JgAN/k22ewQsadEikJN9zzylz8YRQdjhYuT0LH+m9nJf8Yg7KMhkjwLISHCA7gGHQ0GY7PgExmRju2Ut+uni/Xl+C3kgVV3jRPQ6/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 11:51:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 11:51:28 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Sep 2025 20:50:36 +0900
Message-Id: <DCKUEPRW2VR8.26NJRPDYG2DFK@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 05/10] gpu: nova-core: gsp: Add GSP command queue handling
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-6-apopple@nvidia.com>
In-Reply-To: <20250827082015.959430-6-apopple@nvidia.com>
X-ClientProxiedBy: TYCP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 352f8342-a0a0-4fd6-0ca8-08ddec728c1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWxqVVVzRWErL0Nta2NKVlBucjVobzZlRHMzZEZlU2JRRmRCcjkxdktLN3pW?=
 =?utf-8?B?cnBsRXBXL1RrU0tCS0ZHWWcvaG5xckowVTFGNUY4eTU4am9OczJzSmpnaWh6?=
 =?utf-8?B?dzN4Wnloc3Z5QmhQNWgra1F2VTVBYVoxOW5xcXR3cXZROVZxQ0l0RkpjR0ln?=
 =?utf-8?B?bkpiNjRHL1VJWWpZMEZvWEVnZnIrL1ZjUC9KSEJ2SllodVo3dWx2ckNQbk9x?=
 =?utf-8?B?S3pNRkFkYUdnNmtiRyswMHRWdGhyZ1B1WHhReDEydWV6a3Jod1JYQ1UyNkYz?=
 =?utf-8?B?K1kxZDBwWFlXaHZHU2hrdGlldWtnbEEyWUsyU0UxNHNzQWN6eEVEYXhrWFhR?=
 =?utf-8?B?ZTl3U1l5eG1VV1lZV1VkOGlnWW1XRmorTU90ZDJDQ2t2bHRBTHdyZU43T21m?=
 =?utf-8?B?WUNnakdGaVlNUjhUZCtJdnFUV3VuU3UxWHBTZWpwelM1djk3ZTZFbXUwTkd1?=
 =?utf-8?B?cEQrVW5CSXJqMHUzall3SFgzZm03dVZkeGM0NlRlenc1RmQ3OTNNc21PSjFB?=
 =?utf-8?B?N2xkQ1BhbXkyK2xCVHA0WHBvN25HT1B1RVpsMDBLUC9JN2w5WWR1T0s1eHZS?=
 =?utf-8?B?SzdzMnVLRTNZeGtLN3ZLckFOaThhMmdFdjJjbTB1bFZtQnNqNEdRUUVZZEJB?=
 =?utf-8?B?dFdJOHBjL3ZKR0pqTTUxOEFGM05pT3BMR3RkNFBnSU9KenRRVFB0ZkJrWVBE?=
 =?utf-8?B?WkppUjBPaXNmNDJPNEpGb2Rmd1Z0QXFpcGhmcG03blRZNWV1ZStLR2VTTito?=
 =?utf-8?B?YWhsSWlZOGZDK1ZKMGpwQndWaVB3dXF6SXEySGo5aXdud2MvZGFod3dyQk1G?=
 =?utf-8?B?Ym1PcjNRUHFFdjdYVDRnRHlhY2NlTk5nRXIzZmk5SmM2amt6dVNvK2JXRklW?=
 =?utf-8?B?ZG1tSlNlQXczSVZZNUVxNnBiM0NqbUp4bzVMQnQ1SDh0aXlXblRQMUpEbWh1?=
 =?utf-8?B?b3JkUkVoQ0k5S1JyTEdmOE14dHNhdWY4bU1kRTFIalMrUXVCeTBZZXBoSTVH?=
 =?utf-8?B?cjNxV1VPdXZ4c2lQZVp5MVFwK1JhTXRDMThLSm9xWUgrNXJ3cGdoU0h0Y2FE?=
 =?utf-8?B?K0NwSEZxL0REOFVmK2lWL3RvREJQYzgvWEtFeGdlTHpEVjVRMHM2dDNTSmRT?=
 =?utf-8?B?R1A0dXZ2by9WekxRTWQwOGtaYmRyZ3pjYURmZzBzSnJ5aGFvV05SbDhBbnlH?=
 =?utf-8?B?TUxkdmpDQnI1VWgxa28yeFBTOWNFSXhYUlNIMHpFb3ora3dlVHFiYlliZ3pL?=
 =?utf-8?B?Uzhzd3FMRmpUS2xleDRONlFQd3lSTHhSb3grYUhXODZzNDRIVWgzNlFUemw4?=
 =?utf-8?B?SGxWSVp2VmtIRzBPSi9TeUpuTlZDL2ZMeHMyVFdEcDBGb1hkakhRUmlETm8w?=
 =?utf-8?B?RjFVN1gySDJMRCsvV3VmVk1BTjlVZGNKVkp5aHkzNGliM20yYmxOOVdXYTNn?=
 =?utf-8?B?N1U4RUZRRmNtRm80anhxNkdlSm1Zc0VhMDgyb0ZvZTdqcDE4MldGVDJnZHpY?=
 =?utf-8?B?YXN2Z3BPVjB2cDJEaHBSVjZmMlFYUnd5SzBiS1JmTVV6a2dJRjVmY0xhOEJw?=
 =?utf-8?B?VzFrc1licmovTXhUbk9qaEt6TEZyL0JyN1lzZVd5ODZnNnRoblExMldRNkJC?=
 =?utf-8?B?SWt6eEwwRmsybmd2d0ppejhoeHdhV3lxdnNDenlnUGV0YlBxdWpFTUdaRmE5?=
 =?utf-8?B?SXhTL2p1eTlHdmRCczdKb0UybEZYZWlMZ1c5Z2xGYkhtRnEzd1RCMVVXbEZO?=
 =?utf-8?B?Y1NRQWdGbUFkY3ZjMFNVN2tnY1pwSlFNeERpSndYZkJjdDZsUXNjdzc0Tzcr?=
 =?utf-8?B?MWRIN001VHBKOS8zUkN5RkcxZXlsa0VZTGtPdEhjUUdVZTl5L04wbDZMUVEw?=
 =?utf-8?B?UTZsZTR3TWU3M2dXVkFVclFyRllyQ0RwTHd5V2RaNkIzSzB1dGtHbVpzSlF5?=
 =?utf-8?Q?iqchfwa1V5s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG9QTDBRWGlXc2lkaFMzRnJmUm9oeDM3dVkxcnphMFo3b0xmWDlsTjZOMFdY?=
 =?utf-8?B?RThkc1pEcmwzUi82ZE5xNUpHWmowelZRdVBxZW5mY3FEbkVReGFtbWNrWXM2?=
 =?utf-8?B?NTh1R0hsUlBYdzM5Q0R6VDVxemFGMmdxSVJ3WGNGR3hBT01kb3BKRSt5OVEv?=
 =?utf-8?B?dHlQcXNjRmZoYnQ3SUdmUHduaytzcXErcEhhNFRXR3ZLeCt1ODZzeEhnSXdr?=
 =?utf-8?B?UjhidVBvSm5UT3Y2WCtlZktQb0loR0JMQXBpV3p3cS9qUmQrUUx3dk91NDRQ?=
 =?utf-8?B?SENhR3JVeXAwTHFrWk9JK1FsSHUzSTAxQUlmazJiMmMyYnczSGRaTnk0UTRE?=
 =?utf-8?B?djZBNEo1NFhNdHE0YmxsbkRLM3BRTjVoOGQ4eDBnazNXWXNEOUFEVHR4OUFG?=
 =?utf-8?B?dU94eVFZeHVHWm56UWNCRG85U0dKK09tRTdTSUdCbW5DSURiUkx2Ky9qdEFl?=
 =?utf-8?B?aHpUbVlPQ0p3b1AyWUFjQjBpdkV4R2JFUE83c0FOMVBIek1mdytKTThkTVgz?=
 =?utf-8?B?ekMrQVcvSFJLVUlQQ2t3cTlQVTkwVEdTZFZjb3VpUnREQ2dJSDlIZUNSb3F2?=
 =?utf-8?B?UW1MSkFFY1had00wWGFTZmJwcnhUQ0pzazNaUEtnVHVhRnBPdlpDSndhNjVu?=
 =?utf-8?B?ZFUyUTRLSnZGRXBOUEgvTnd5NDhWODE2bGhRbVhnUnV1U2NvVXRMN3dNLytz?=
 =?utf-8?B?ZkREd3F0WEU4QmVQWjRhenhQT080MU5GZ2t0OWs4UllmUXBCWDRJQWlxS2wx?=
 =?utf-8?B?M3NrWXZhdU9FdzdFSG9oTG12ZC9Oc1M1aHFCWC8xRE1iOHIvQW9URFVlS2o2?=
 =?utf-8?B?OUFRN1lVdjJueTVwRWsrSWFWN2lwMDJKQ1hObFdXZVpSaHZRMis0bmNCVlJP?=
 =?utf-8?B?WVZvN2xycFFDSzJ4N3Y2NUdKSDFXVmpkOGJ4TEpIRWUwbm1sbElCU2xSWE9I?=
 =?utf-8?B?VElmcjFibC9GNVEwOTZuVFVTNHI3K3FPeS9vaG03SGhrRk1rcXQxQVdHenNN?=
 =?utf-8?B?ZFc5K2dDakNocjMyVVZ6NFBGLzFidmMxMDFKK0plWDQ5WTU0eWRmY2dEaktP?=
 =?utf-8?B?NFJLVE1LYnJ1VHc1MEhTb2R0UFBzMlRqZVJ6UWxrcS9TVjNjVEFMTHBORE5K?=
 =?utf-8?B?czVnalc5VUxnS1J3U0xCR281ZHBIaU1GUGZiTGlrTEp4aEIybUVaMTFRS2p6?=
 =?utf-8?B?SVYwSGc2c29QT1laSmdpSWZtclJKaURWbGZMdkxhZ1kwd1V1Vis4RzdMVXNx?=
 =?utf-8?B?UGV6OTlVdDZZdXNVZ0dsYWphVVJmOS9JVUFZM1ZsUS83MjBhSmxFR2x3SnFl?=
 =?utf-8?B?SlMrRzZobTZzSjlvY01lMGtnMzBwaVhBaWFNVktiRGFKN3JSY1ppL0doYXk2?=
 =?utf-8?B?d2o5VStWalpVajh1VW5MUjBJaUJYU2JIUjU1Q2lreFlVSjBZOXVnMitJQmVN?=
 =?utf-8?B?Uy93cW5Kc0RMeVpWcVJ1ZjJzRkR3VGJlUjVNRmpoZERpYXlJYlVoVVdiVTdn?=
 =?utf-8?B?cFNlZSt3SWJiUHdvYW1oTSs5MFlCWE5UZ1JPc1Zram9xZnU4dnhnb1VxbXk2?=
 =?utf-8?B?cHJyTGdmVFNueURmNk1PemxJYjVRZXNWSm82SThQdzdyOW45aHEzU1hBZUVy?=
 =?utf-8?B?VFQwM3ptcWlMak53Y0JNSmE3SU9vd1pPcEo5aEpGNWR6R1c1dmRMbzJYZ2VQ?=
 =?utf-8?B?eGFxVnpOM0JKdEVuK0NscHIxUDBvTHp5VE5QdXNoQXZ0V04vVm1NdytmMmFU?=
 =?utf-8?B?VVJYU1puN3ZMZWNuZUVMZlYzcnlKSlA1cGl0L21vd082dVhxdFNWZVNsM2o3?=
 =?utf-8?B?cjBZV21MU1RaRm02VDdTbUtrVFVVa2lyemRHbUlFeVFYMmRiK0t1K3RhYTlr?=
 =?utf-8?B?OWZ4MFFpRkR2Mkhyemh0MU5BYzZYMDlheVBnK0xCakFGNGFEc09kYVpJWmVw?=
 =?utf-8?B?UDEvaFdoVndvS21tdjlZemdiZFpoSldrZDgrc2p1NElYMVFVTVYyQ1pWU3JE?=
 =?utf-8?B?SkY1NFlIaG5NQjcwbmtucGlJb1Z2UzZIVzdLNHNPbVlZUmFHZU02T2g2NTkx?=
 =?utf-8?B?LzczVFFzNklveXZDaG1QbWpVcTNjWU9yZCtaOG5OT0pxOUI5L0dmeWJYc1lu?=
 =?utf-8?B?ZURBVm9lMHlDWHh6dGtKMWtXWDRNT0pFVm9ScndPTHJzUEMzbzh4T0k4dE05?=
 =?utf-8?Q?Y95TMHpUuRFUIxIca8FMy5ZCAjPmtt1ztXuQy5ts0uSL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352f8342-a0a0-4fd6-0ca8-08ddec728c1b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 11:51:28.0437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekL9MdIFS2UhTjMS8HSzV2PBx1ixfTtasN0OPu78bOQNXYUgRUf0mOrRLYayw6zH8qXmg4G3vvIxqOxwYY/DZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6418
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

Hi Alistair,

Here is a second pass on things not directly related to bindings.

One general comment is that we will want more documentation about how
the command queue operates; without it it is a bit difficult to
understand how things run and who can read or write what. I hope we can
improve the last point through the introduction of a few more
types/abstraction.

Another thing we need to do is reduce the number of unsafe statements
and justify them more strongly. I've seen 22 new unsafe statements in
this patch that are not related to the implementation of FromBytes or
AsBytes. I'm pretty sure that with the right abstractions in place we
can remove most of them, and feel more confident about those that
remain.

On Wed Aug 27, 2025 at 5:20 PM JST, Alistair Popple wrote:
<snip>
> +/// Number of GSP pages making the Msgq.
> +const MSGQ_NUM_PAGES: usize =3D 0x3f;
> +
> +#[repr(C, align(0x1000))]
> +#[derive(Debug)]
> +struct MsgqData {
> +    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES],
> +}
> +
> +// Annoyingly there is no real equivalent of #define so we're forced to =
use a
> +// literal to specify the alignment above. So check that against the act=
ual GSP
> +// page size here.
> +static_assert!(align_of::<MsgqData>() =3D=3D GSP_PAGE_SIZE);
> +
> +// There is no struct defined for this in the open-gpu-kernel-source hea=
ders.
> +// Instead it is defined by code in GspMsgQueuesInit().
> +#[repr(C)]
> +#[derive(Debug)]
> +struct Msgq {
> +    tx: MsgqTxHeader,
> +    rx: MsgqRxHeader,
> +    msgq: MsgqData,
> +}
> +
> +#[repr(C)]
> +#[derive(Debug)]
> +struct GspMem {
> +    ptes: [u8; GSP_PAGE_SIZE],

This member appeared unused, but then I understand that it is filled by
`create_pte_array`. I'd suggest to change that function so it can
operate directly on `pte`, and also introduce a similar member to the
buffer types that also use it so we know what data this operates on.

> +    cpuq: Msgq,
> +    gspq: Msgq,
> +}

This is one of the structures that would benefit from being more
documented. :) For instance, the usage of `cpuq` and `gspq` was a bit
different from what I expected.

> +
> +// SAFETY: These structs don't meet the no-padding requirements of AsByt=
es but
> +// that is not a problem because they are not used outside the kernel.
> +unsafe impl AsBytes for GspMem {}
> +
> +// SAFETY: These structs don't meet the no-padding requirements of FromB=
ytes but
> +// that is not a problem because they are not used outside the kernel.
> +unsafe impl FromBytes for GspMem {}
> +
> +pub(crate) struct GspCmdq {
> +    dev: ARef<device::Device>,
> +    msg_count: u32,
> +    seq: u32,

Here as well, some doccomments would be useful. I still don't understand
what purpose `seq` is supposed to fulfil.

> +    gsp_mem: CoherentAllocation<GspMem>,
> +    pub _nr_ptes: u32,
> +}
> +
> +// A reference to a message currently sitting in the GSP command queue. =
May
> +// contain two slices as the command queue is a circular buffer which ma=
y have
> +// wrapped.
> +//
> +// INVARIANT: The underlying message data cannot change because the stru=
ct holds
> +// a reference to the command queue which prevents command queue manipul=
ation
> +// until the GspQueueMessage is dropped.
> +pub(crate) struct GspQueueMessage<'a> {
> +    cmdq: &'a mut GspCmdq,
> +    rpc_header: &'a GspRpcHeader,
> +    slice_1: &'a [u8],
> +    slice_2: Option<&'a [u8]>,
> +}
> +
> +type GspQueueMessageData<'a, M> =3D (&'a M, Option<SBuffer<core::array::=
IntoIter<&'a [u8], 2>>>);
> +
> +impl<'a> GspQueueMessage<'a> {
> +    #[expect(unused)]
> +    pub(crate) fn try_as<M: GspMessageFromGsp>(&'a self) -> Result<GspQu=
eueMessageData<'a, M>> {
> +        if self.rpc_header.function !=3D M::FUNCTION {
> +            return Err(ERANGE);
> +        }
> +
> +        // SAFETY: The slice references the cmdq message memory which is
> +        // guaranteed to outlive the returned GspQueueMessageData by the
> +        // invariants of GspQueueMessage and the lifetime 'a.
> +        let msg =3D unsafe { &*(self.slice_1.as_ptr().cast::<M>()) };
> +        let data =3D &self.slice_1[size_of::<M>()..];
> +        let data_size =3D
> +            self.rpc_header.length as usize - size_of::<GspRpcHeader>() =
- size_of::<M>();
> +        let sbuf =3D if data_size > 0 {
> +            Some(SBuffer::new_reader([data, self.slice_2.unwrap_or(&[])]=
))
> +        } else {
> +            None
> +        };
> +
> +        Ok((msg, sbuf))
> +    }

For the message queue I think this approach mostly work (we might also
want to add a way to match against the messages enum once we have it -
this can be a future patch though).

> +
> +    #[expect(unused)]
> +    pub(crate) fn ack(self) -> Result {
> +        self.cmdq.ack_msg(self.rpc_header.length)?;
> +
> +        Ok(())
> +    }
> +}
> +
> +// The same as GspQueueMessage except the fields are mutable for constru=
cting a
> +// message to the GSP.
> +pub(crate) struct GspQueueCommand<'a> {
> +    cmdq: &'a mut GspCmdq,
> +    msg_header: &'a mut GspMsgHeader,
> +    rpc_header: &'a mut GspRpcHeader,
> +    slice_1: &'a mut [u8],
> +    slice_2: &'a mut [u8],
> +}
> +
> +type GspQueueCommandData<'a, M> =3D (
> +    &'a mut M,
> +    Option<SBuffer<core::array::IntoIter<&'a mut [u8], 2>>>,
> +);
> +
> +impl<'a> GspQueueCommand<'a> {
> +    #[expect(unused)]
> +    pub(crate) fn try_as<'b, M: GspCommandToGsp>(&'b mut self) -> GspQue=
ueCommandData<'b, M> {
> +        // SAFETY: The slice references the cmdq message memory which is
> +        // guaranteed to outlive the returned GspQueueCommandData by the
> +        // invariants of GspQueueCommand and the lifetime 'a.
> +        let msg =3D unsafe { &mut *(self.slice_1.as_mut_ptr().cast::<M>(=
)) };
> +        let data =3D &mut self.slice_1[size_of::<M>()..];
> +        let data_size =3D
> +            self.rpc_header.length as usize - size_of::<GspRpcHeader>() =
- size_of::<M>();
> +        let sbuf =3D if data_size > 0 {
> +            Some(SBuffer::new_writer([data, self.slice_2]))
> +        } else {
> +            None
> +        };
> +        self.rpc_header.function =3D M::FUNCTION;
> +
> +        (msg, sbuf)
> +    }
> +
> +    #[expect(unused)]
> +    pub(crate) fn send_to_gsp(self, bar: &Bar0) -> Result {
> +        self.cmdq.wait_for_free_cmd_to_gsp(
> +            Delta::from_secs(GSP_COMMAND_TIMEOUT),
> +            self.rpc_header.length as usize + size_of::<GspMsgHeader>(),
> +        )?;
> +        GspCmdq::send_cmd_to_gsp(self, bar)?;
> +        Ok(())
> +    }
> +}
> +
> +impl GspCmdq {
> +    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Gsp=
Cmdq> {
> +        let mut gsp_mem =3D
> +            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KER=
NEL | __GFP_ZERO)?;
> +
> +        let nr_ptes =3D size_of::<GspMem>() >> GSP_PAGE_SHIFT;
> +        build_assert!(nr_ptes * size_of::<u64>() <=3D GSP_PAGE_SIZE);
> +
> +        create_pte_array(&mut gsp_mem, 0);
> +
> +        const MSGQ_SIZE: u32 =3D size_of::<Msgq>() as u32;
> +        const MSG_COUNT: u32 =3D ((MSGQ_SIZE as usize - GSP_PAGE_SIZE) /=
 GSP_PAGE_SIZE) as u32;
> +        const RX_HDR_OFF: u32 =3D offset_of!(Msgq, rx) as u32;
> +        dma_write!(
> +            gsp_mem[0].cpuq.tx =3D MsgqTxHeader {
> +                version: 0,
> +                size: MSGQ_SIZE,
> +                entry_off: GSP_PAGE_SIZE as u32,
> +                msg_size: GSP_PAGE_SIZE as u32,
> +                msg_count: MSG_COUNT,
> +                write_ptr: 0,
> +                flags: 1,
> +                rx_hdr_off: RX_HDR_OFF,
> +            }
> +        )?;

I don't see `gspq` being initialized, is this on purpose? If it is all
zeroes, how does the GSP know its size? Or does it assume the same
parameters are the `cpuq`?

> +
> +        Ok(GspCmdq {
> +            dev: dev.into(),
> +            msg_count: MSG_COUNT,
> +            seq: 0,
> +            gsp_mem,
> +            _nr_ptes: nr_ptes as u32,
> +        })
> +    }
> +
> +    fn cpu_wptr(&self) -> u32 {
> +        // SAFETY: index `0` is valid as `gsp_mem` has been allocated ac=
cordingly, thus the access
> +        // cannot fail.
> +        unsafe { dma_read!(self.gsp_mem[0].cpuq.tx.write_ptr).unwrap_unc=
hecked() }
> +    }
> +
> +    fn gsp_rptr(&self) -> u32 {
> +        // SAFETY: index `0` is valid as `gsp_mem` has been allocated ac=
cordingly, thus the access
> +        // cannot fail.
> +        unsafe { dma_read!(self.gsp_mem[0].gspq.rx.read_ptr).unwrap_unch=
ecked() }
> +    }
> +
> +    fn cpu_rptr(&self) -> u32 {
> +        // SAFETY: index `0` is valid as `gsp_mem` has been allocated ac=
cordingly, thus the access
> +        // cannot fail.
> +        unsafe { dma_read!(self.gsp_mem[0].cpuq.rx.read_ptr).unwrap_unch=
ecked() }
> +    }
> +
> +    fn gsp_wptr(&self) -> u32 {
> +        // SAFETY: index `0` is valid as `gsp_mem` has been allocated ac=
cordingly, thus the access
> +        // cannot fail.
> +        unsafe { dma_read!(self.gsp_mem[0].gspq.tx.write_ptr).unwrap_unc=
hecked() }
> +    }

Here is an easy trick to reduce the number of unsafe statements: have a
method that returns a reference to the `gsp_mem` (which contains the
unsafe part), and have these 4 methods call into it. And voil=C3=A0, 3
unsafes gone. :)

> +
> +    // Returns the numbers of pages free for sending an RPC to GSP.
> +    fn free_tx_pages(&self) -> u32 {
> +        let wptr =3D self.cpu_wptr();
> +        let rptr =3D self.gsp_rptr();
> +        let mut free =3D rptr + self.msg_count - wptr - 1;
> +
> +        if free >=3D self.msg_count {
> +            free -=3D self.msg_count;
> +        }
> +
> +        free
> +    }
> +
> +    // Returns the number of pages the GSP has written to the queue.
> +    fn used_rx_pages(&self) -> u32 {
> +        let rptr =3D self.cpu_rptr();
> +        let wptr =3D self.gsp_wptr();
> +        let mut used =3D wptr + self.msg_count - rptr;
> +        if used >=3D self.msg_count {
> +            used -=3D self.msg_count;
> +        }
> +
> +        used
> +    }
> +
> +    fn calculate_checksum<T: Iterator<Item =3D u8>>(it: T) -> u32 {
> +        let sum64 =3D it
> +            .enumerate()
> +            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
> +            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_lef=
t(rol));
> +
> +        ((sum64 >> 32) as u32) ^ (sum64 as u32)
> +    }
> +
> +    pub(crate) fn wait_for_free_cmd_to_gsp(&self, timeout: Delta, size: =
usize) -> Result {
> +        wait_on(timeout, || {
> +            if self.free_tx_pages() < size.div_ceil(GSP_PAGE_SIZE) as u3=
2 {
> +                None
> +            } else {
> +                Some(())
> +            }
> +        })
> +    }
> +
> +    #[expect(unused)]
> +    pub(crate) fn alloc_gsp_queue_command<'a>(
> +        &'a mut self,
> +        cmd_size: usize,
> +    ) -> Result<GspQueueCommand<'a>> {

The command submission appears to be modeled after the message
reception, but I don't think this works very well in this case.

First, the returned `GspQueueCommand` does not have its function set
until `try_as` is called. But meanwhile it can very well be given to
`send_cmd_to_gsp`, skipping an important step in the submission process.
So at the very least I think we should merge both functions, as it
doesn't make sense to have one step without the other anyway (and they
are always called one after the other).

But maybe we can be even more radical and do the command building and
submission in a single function, and remove `GspQueueCommand`
altogether. What I have in mind is a function that reserves the required
space in the queue, creates the required mutable reference to the
command and (optionally) the writable SBuffer, and then call the passed
closure to initialize these two before sending the command. It would be
invoked something like this:

    send_cmd::<CommandType>(|command, sbuffer| {
      // initialize `command` and write required data into `sbuffer`
    }, bar)?;

This would ensure that no step is left undone, and also match how users
will use the command queue anyway, as I don't think we want to reserve
space for a command we are not intent on sending. :)

> +        const HEADER_SIZE: usize =3D size_of::<GspMsgHeader>() + size_of=
::<GspRpcHeader>();
> +        let msg_size =3D size_of::<GspMsgHeader>() + size_of::<GspRpcHea=
der>() + cmd_size;
> +        if self.free_tx_pages() < msg_size.div_ceil(GSP_PAGE_SIZE) as u3=
2 {
> +            return Err(EAGAIN);
> +        }
> +        let wptr =3D self.cpu_wptr() as usize;
> +
> +        // SAFETY: By the invariants of CoherentAllocation gsp_mem.start=
_ptr_mut() is valid.
> +        let ptr =3D unsafe {
> +            core::ptr::addr_of_mut!((*self.gsp_mem.start_ptr_mut()).cpuq=
.msgq.data[wptr])
> +        };
> +
> +        // SAFETY: ptr points to at least one GSP_PAGE_SIZE bytes of con=
tiguous
> +        // memory which is larger than GspMsgHeader.
> +        let msg_header_slice: &mut [u8] =3D
> +            unsafe { core::slice::from_raw_parts_mut(ptr.cast::<u8>(), s=
ize_of::<GspMsgHeader>()) };
> +        msg_header_slice.fill(0);
> +        let msg_header =3D GspMsgHeader::from_bytes_mut(msg_header_slice=
).ok_or(EINVAL)?;
> +        msg_header.auth_tag_buffer =3D [0; 16];
> +        msg_header.aad_buffer =3D [0; 16];
> +        msg_header.checksum =3D 0;
> +        msg_header.sequence =3D self.seq;
> +        msg_header.elem_count =3D (HEADER_SIZE + cmd_size).div_ceil(GSP_=
PAGE_SIZE) as u32;
> +        msg_header.pad =3D 0;
> +        self.seq +=3D 1;
> +
> +        // SAFETY: ptr points to GSP_PAGE_SIZE bytes of memory which is =
larger
> +        // than both GspMsgHeader and GspRpcHeader combined.
> +        let rpc_header_slice: &mut [u8] =3D unsafe {
> +            core::slice::from_raw_parts_mut(
> +                ptr.cast::<u8>().add(size_of::<GspMsgHeader>()),
> +                size_of::<GspRpcHeader>(),
> +            )
> +        };
> +        rpc_header_slice.fill(0);
> +        let rpc_header =3D GspRpcHeader::from_bytes_mut(rpc_header_slice=
).ok_or(EINVAL)?;
> +        rpc_header.header_version =3D 0x03000000;
> +        rpc_header.signature =3D 0x43505256;
> +        rpc_header.length =3D (size_of::<GspRpcHeader>() + cmd_size) as =
u32;
> +        rpc_header.rpc_result =3D 0xffffffff;
> +        rpc_header.rpc_result_private =3D 0xffffffff;
> +        rpc_header.sequence =3D 0;
> +        rpc_header.cpu_rm_gfid =3D 0;
> +
> +        // Number of bytes left before we have to wrap the buffer
> +        let remaining =3D ((self.msg_count as usize - wptr) << GSP_PAGE_=
SHIFT) - HEADER_SIZE;
> +
> +        let (slice_1, slice_2) =3D if cmd_size <=3D remaining {
> +            // SAFETY: ptr points to a region of contiguous memory at le=
ast
> +            // cmd_size + HEADER_SIZE long.
> +            let slice_1: &mut [u8] =3D unsafe {
> +                core::slice::from_raw_parts_mut(ptr.cast::<u8>().add(HEA=
DER_SIZE), cmd_size)
> +            };
> +            slice_1.fill(0);
> +            (slice_1, &mut [] as &mut [u8])
> +        } else {
> +            // SAFETY: ptr points to a region of contiguous memory remai=
ning +
> +            // HEADER_SIZE bytes long.
> +            let slice_1: &mut [u8] =3D unsafe {
> +                core::slice::from_raw_parts_mut(ptr.cast::<u8>().add(HEA=
DER_SIZE), remaining)
> +            };
> +            // SAFETY: By the invariants of CoherentAllocation gsp_mem.s=
tart_ptr_mut() is valid.
> +            let ptr =3D unsafe {
> +                core::ptr::addr_of_mut!((*self.gsp_mem.start_ptr_mut()).=
gspq.msgq.data[0])

I'm almost sure this should be `cpuq` instead of `gspq`.

> +            };
> +            // SAFETY: ptr points to a region of contiguous memory
> +            // self.msg_count GSP_PAGE_SIZE pages long.
> +            let slice_2: &mut [u8] =3D
> +                unsafe { core::slice::from_raw_parts_mut(ptr.cast::<u8>(=
), remaining - cmd_size) };
> +            slice_1.fill(0);

... and that you wanted to do `slice_2.fill(0)` here.

> +            (slice_1, slice_2)
> +        };

Overall the code of this method is quite difficult to follow, and its
safety statements almost impossible to verify due to its complexity. It
manipulates many things at the same time and this makes typos like the
two I highlighted above easy to slip in.

The problems start with the creation of `ptr`:

    let ptr =3D unsafe {
        core::ptr::addr_of_mut!((*self.gsp_mem.start_ptr_mut()).cpuq.msgq.d=
ata[wptr])
    };

For instance, we don't know for sure that the value of `wptr` is going
to be within bounds. We also don't want to check this at runtime every
time. I can track where `wptr` comes from and where it is updated, and
indeed if I do that it looks like it is clamped to not go beyond
`MSGQ_NUM_PAGES`, but verifying this is quite some labor and some
careless future patch might change that fact, especially since this
invariant is not documented.

So we want the range of `wptr` to be defined as an invariant, and we
want that invariant to be easy to verify, and hard to break. This can be
done by wrapping the TX header inside a type that hides its members so
the write pointer cannot be accidentally changed, and providing methods
to control how it is updated:

/// TX header for setting up a command queue with the GSP.
///
/// # Invariants
///
/// [`Self::write_ptr`] is guaranteed to return a value within the range `0=
..MSGQ_NUM_PAGES`.
#[repr(transparent)]
#[derive(Debug)]
struct MsgqTxHeader(nvfw::MsgqTxHeader);

/// SAFETY: `MsgqTxHeader` does not contain uninitialized bytes and does no=
t have interior mutability.
unsafe impl AsBytes for MsgqTxHeader {}

impl MsgqTxHeader {
	  ...

	  /// # Invariants
	  ///
    /// The returned value is contained within the range `0..MSG_NUM_PAGES`=
.
    fn write_ptr(&self) -> u32 {
        self.0.write_ptr()
    }

    /// Advance the write pointer by `elem_count` units, wrapping around th=
e ring buffer if
    /// necessary.
    fn advance_write_ptr(&mut self, elem_count: u32) {
				// INVARIANT: the write pointer is within the range `0..MSGQ_NUM_PAGES`=
.
        let wptr =3D self.write_ptr().wrapping_add(elem_count) % MSGQ_NUM_P=
AGES;
        self.0.set_write_ptr(wptr);

        fence(Ordering::SeqCst);
    }
}

Here all possible direct accesses to the write pointer are contained
within a page of code, and the invariant clearly documents what we can
expect for its value. So we can add a `BOUNDS:` statement to the
initialization of `ptr` invoking that invariant to justify that the
access will always be within bounds.

Another problem with `ptr` is that we create a mutable pointer over the
whole memory area shared with the GSP, and then write into it after more
casts and pointer arithmetic. How do we convince the reader that the GSP
cannot possibly be accessing the memory we are writing into at the same
time? I mean, after careful review I don't think the current code does,
but how do we demonstrate this simply?

Here again we need to rely on smaller, simple methods and precise
invariants.

The ring buffer of a queue is always split into two parts at any time:
one that is owned by the driver (for read or write access depending on
the type of the queue), and another one by the GSP. These areas are
delimited by the read and write pointers. In the case of the tx queue,
the driver has write-only access over the region is owns, and the GSP
can only grow that region by moving its own read pointer - so any
driver-owned region that we acquire cannot suddenly become invalid due
to GSP action.

So our first building block should be a method (of `GspMem`?) that
returns two mutable slices, covering the area of the TX ring buffer
currently owned by the driver. This method can rely on that invariant to
satisfy the safety requirement of `CoherentAllocation::as_slice_mut`
that no device access is taking place at the same time; that way, it
can confidently return clean mutable slices for the callers to use as
they want, and that should be the only unsafe statement needed to send a
message.

Callers can then check the available space on these slices, call
`slice::split_at_mut` and `FromBytes::from_bytes_mut` to split the slice
further and cast it to the header or command type they need, all that
without unsafe operations. And all made possible because we confined the
only unsafe operation to a small method which safety is easy to verify.

I'll stop here for now as that's already quite a bit of work. :) But
these are the essential points to fix, basically reducing the number of
unsafe statements and building our safety context from small, easy to
verify methods. Most types declared in `cmdq` should have at least an
`impl` block defining their interface in simple terms, rather that
having their fields manipulated by the types that contain them.
